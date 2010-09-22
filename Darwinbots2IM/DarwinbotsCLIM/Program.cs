using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.InteropServices;
using IM;
using System.Collections;
using System.Net;
using System.Collections.Specialized;
using Krystalware.UploadHelper;
using System.Windows.Forms;

//Before editings see README.txt in IM

namespace DarwinbotsCLIM
{
    class Program
    {
        #region Cleanup boilerplate
        //Cleanup clode taken from Stack Overflow somewhere
        [DllImport("Kernel32")]
        private static extern bool SetConsoleCtrlHandler(EventHandler handler, bool add);

        private delegate bool EventHandler(CtrlType sig);
        static EventHandler _handler;

        enum CtrlType
        {
            CTRL_C_EVENT = 0,
            CTRL_BREAK_EVENT = 1,
            CTRL_CLOSE_EVENT = 2,
            CTRL_LOGOFF_EVENT = 5,
            CTRL_SHUTDOWN_EVENT = 6
        }
        #endregion

        private static string fileToCleanup = String.Empty;

        private static bool CloseHandler(CtrlType sig)
        {
            //Remove any files we were working on when we closed
            if (File.Exists(fileToCleanup))
                File.Delete(fileToCleanup);
            return false;
        }

        private static void Run(string inbound, string outbound, string name, int pid, DarwinbotsVersion dbv)
        {
            int numUploaded = 0;
            int numDownloaded = 0;
            bool upload = true;
            while (true)
            {
                Console.Clear();
                //Check to see if the process exited on us
                try { System.Diagnostics.Process.GetProcessById(pid); }
                catch (System.ArgumentException) { Environment.Exit(2); }

                if (upload)
                {
                    upload = false;
                    #region Upload
                    Console.WriteLine("Uploading...");
                    //Compress and upload a file out of outbound directory
                    FileInfo[] fiArray = new DirectoryInfo(outbound).GetFiles();
                    if (fiArray.Length == 0)
                    {
                        Console.WriteLine("No bots to upload!");
                    }
                    else
                    {
                        FileInfo fileToUpload = fiArray.OrderByDescending(fi => fi.CreationTime).First();
                        fileToCleanup = fileToUpload.FullName;
                        Console.WriteLine("Uploading: {0}", fileToUpload.Name);
                        Console.WriteLine("Size: {0}", fileToUpload.ReadableSize());
                        byte[] filetoUploadData = File.ReadAllBytes(fileToUpload.FullName);
                        //Compress using LZMA
                        byte[] compressedToUpload = SevenZip.Compression.LZMA.SevenZipHelper.Compress(filetoUploadData);
                        //Write the file back out and send it
                        File.WriteAllBytes(fileToUpload.FullName, compressedToUpload);
                        fileToUpload.Refresh();
                        Console.WriteLine("Compressed: {0}", fileToUpload.ReadableSize());
                        try
                        {
                            string[] files = { fileToUpload.FullName };
                            NameValueCollection nvc = new NameValueCollection();
                            nvc.Add("user", name);
                            Console.WriteLine(HttpUploadHelper.Upload(@"http://www.darwinbots.com/FTP/upload.php", new UploadFile[] { new UploadFile(fileToUpload.FullName, "uploaded", "application/octet-stream") }, nvc));
                            fileToUpload.Delete();
                            fileToCleanup = String.Empty;
                            numUploaded++;
                        }
                        catch (WebException ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                    #endregion
                }
                else //Download
                {
                    upload = true;
                    #region Download
                    Console.WriteLine("Downloading...");
                    var scanResults = MemoryScanner.ScanDarwinbots(dbv, pid);
                    string request = String.Format("http://www.darwinbots.com/FTP/getbot.php?ping={0}&pop={1}&cps={2}&mutrate={3}&vegpop={4}&size={5}&totcycles={6}",
                                                    name, //ping
                                                    scanResults["SimPop"],  //pop
                                                    scanResults["CPS"], //cps
                                                    scanResults["MutRate"], //mutrate
                                                    scanResults["VegePop"], //vegpop
                                                    scanResults["Size"], //size
                                                    scanResults["TotalCycles"]); //totcycles
                    try
                    {
                        WebRequest getBot = WebRequest.Create(request);
                        HttpWebResponse bot = (HttpWebResponse)getBot.GetResponse();
                        if (bot.ContentType != "application/octet-stream")
                        {
                            //We had an error, display it
                            Stream botStream = bot.GetResponseStream();
                            StreamReader botReader = new StreamReader(botStream, System.Text.Encoding.UTF8);
                            Console.WriteLine(botReader.ReadToEnd());
                        }
                        else
                        {
                            //No errors, save and decompress the bot
                            string filename = bot.Headers.Get("Content-Disposition").Split('=').Last();
                            Console.WriteLine(filename);
                            string fromUser = bot.Headers.Get("From-User");
                            Console.WriteLine("From: {0}", fromUser);
                            Stream botStream = bot.GetResponseStream();
                            byte[] botCompressed = botStream.ReadFully(1024);
                            byte[] botData = SevenZip.Compression.LZMA.SevenZipHelper.Decompress(botCompressed);
                            fileToCleanup = inbound + "\\" + filename;
                            File.WriteAllBytes(inbound + "\\" + filename, botData);
                            fileToCleanup = String.Empty;
                            Console.WriteLine("Saved");
                            numDownloaded++;
                        }
                    }
                    catch (WebException ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    #endregion
                }
                Console.Title = String.Format("DarwinbotsIM - In: {0} Out: {1}", numDownloaded, numUploaded);
                //Pause 5 seconds so we dont keep spamming the server
                System.Threading.Thread.Sleep(5000);
            }
        }

        static void Main(string[] args)
        {
            //React to the close event
            _handler += new EventHandler(CloseHandler);
            SetConsoleCtrlHandler(_handler, true);

            Console.Title = "DarwinbotsIM";

            var dbVersions = DarwinbotsVersion.GetAllVersions();
            AutoUpdate.Check(ref dbVersions);

            string inboundFolder = String.Empty;
            string outboundFolder = String.Empty;
            string simName = String.Empty;
            int pid = 0;

            if (args.Length == 0 || args[0] == "-?" || args[0] == "-help")
            {
                Console.WriteLine("Connects Darwinbots simulations to the interent.");
                Console.WriteLine();
                Console.WriteLine("DarwinbotsIM [-in <path>] [-out <path>] [-name <string>] [-pid <processID>]");
                Console.WriteLine("<path> must be an existing location on your drive.");
                Console.ReadKey(true);
                Environment.Exit(0);
            }
            if (args[0] == "--update")
            {
                File.Delete(Path.GetDirectoryName(Application.ExecutablePath) + @"\DarwinbotsIM.old.exe");
            }
            //This next section is because VB6 is horrible and cant pass an argument correctly
            string joined = String.Join(" ", args);
            string[] dashSplit = joined.Split(new char[]{'-'}, StringSplitOptions.RemoveEmptyEntries);
            List<string[]> ls = new List<string[]>();
            foreach (var s in dashSplit)
            {
                var x = s.Split(' ');
                var r = new string[2];
                r[0] = x[0];
                if (x.Length > 2)
                {
                    r[1] = String.Join(" ", x.Skip(1).ToArray<string>());
                }
                else if( x.Length == 2)
                {
                    r[1]=x[1];
                }
                ls.Add(r);
            }
            //End VB6 sucks

            foreach(string[] s in ls)
            {
                switch (s[0])
                {
                    case "in":
                        inboundFolder = s[1].Trim();
                        break;
                    case "out":
                        outboundFolder = s[1].Trim();
                        break;
                    case "name":
                        simName = s[1].Trim();
                        break;
                    case "pid":
                        Int32.TryParse(s[1], out pid);
                        break;
                }
            }
            //Check that supplied data is ok
            if (Directory.Exists(inboundFolder) && Directory.Exists(outboundFolder) && simName != String.Empty && pid != 0)
            {
                //Make sure that we can scan the darwinbots process
                string dbexe = System.Diagnostics.Process.GetProcessById(pid).ProcessName;
                DarwinbotsVersion dbv = null;
                foreach (var dbv2 in dbVersions)
                {
                    if (dbv2.Name == dbexe)
                        dbv = dbv2;
                }
                if (dbv == null)
                {
                    Console.WriteLine("Unknown version of Darwinbots: {0}", dbexe);
                    Console.ReadKey(true);
                    Environment.Exit(1);
                }
                else
                {
                    Run(inboundFolder, outboundFolder, simName, pid, dbv);
                }
            }
            else
            {
                //Data is bad - Inform the user and quit.
                System.Media.SystemSounds.Exclamation.Play();
                FlashWindow.Flash(System.Diagnostics.Process.GetCurrentProcess().MainWindowHandle);
                Console.WriteLine("Error: Arguments Invalid");
                if (!Directory.Exists(inboundFolder))
                    Console.WriteLine("Inbound folder: {0} does not exist.", inboundFolder);
                if (!Directory.Exists(outboundFolder))
                    Console.WriteLine("Outbound folder: {0} does not exist.", outboundFolder);
                if (simName == String.Empty)
                    Console.WriteLine("You must supply a valid sim name.");
                if (pid == 0)
                    Console.WriteLine("Darwinbots supplied an invalid processID.");
                Console.ReadKey(true);
                Environment.Exit(1);
            }
        }
    }
}