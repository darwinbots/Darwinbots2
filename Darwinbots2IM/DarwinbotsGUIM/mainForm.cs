using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net;
using System.Runtime.InteropServices;
using System.Collections.Specialized;
using IM;
using Krystalware.UploadHelper;
using System.Reflection;
using System.Collections;


namespace DarwinbotsGUIM
{
    public partial class mainForm : Form
    {
        //Before editing anything please see README.txt uner IM
        //This goes double if you want to add support for a new version of DB

        //Stores the info we need to scan the memory of DB
        List<DarwinbotsVersion> dbVersions;
        DarwinbotsVersion selectedVersion;
        //Depending on what was changed in the release these may still be correct

        private uint up = 0;
        private uint down = 0;
        private uint pid = 0;
        private string simName = string.Empty;
        private bool running = false;
        private WebClient webClient;
        private bool processLoadError = false;
        private bool botUploaded = false;
        private bool botDownloaded = false;
        private int timesTicked = 0;
        private Hashtable scanResults;

        public mainForm()
        {
            InitializeComponent();
            if (Properties.Settings.Default.NewInstall)
            {
                Properties.Settings.Default.Upgrade();
                Properties.Settings.Default.NewInstall = false;
            }
            webClient = new WebClient();
            dbVersions = DarwinbotsVersion.GetAllVersions();
            //Add in our downloaded versions of DB
            if (Properties.Settings.Default.versions == null)
                Properties.Settings.Default.versions = new StringCollection();
            foreach (String s in Properties.Settings.Default.versions)
            {
                DarwinbotsVersion v = (DarwinbotsVersion)TypeDescriptor.GetConverter(typeof(DarwinbotsVersion)).ConvertFromString(s);
                dbVersions.Add(v);
            }
            //Search for any versions of DB that are running
            foreach (DarwinbotsVersion v in dbVersions)
            {
                foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcessesByName(v.Name))
                {
                    this.pidDropDownBox.Items.Add(p.Id);
                    this.pidDropDownBox.SelectedIndex = 0;
                    selectedVersion = v;
                }
            }
            if (Properties.Settings.Default.outboundFolder == String.Empty)
            {
                this.inboundFolderBrowser.SelectedPath = Application.StartupPath;
            }
            else
            {
                this.inboundTextBox.Text = Properties.Settings.Default.inboundFolder;
                this.inboundFolderBrowser.SelectedPath = Properties.Settings.Default.inboundFolder;
            }
            if (Properties.Settings.Default.inboundFolder == String.Empty)
            {
                this.outboundFolderBrowser.SelectedPath = Application.StartupPath;
            }
            else
            {
                this.outboundTextBox.Text = Properties.Settings.Default.outboundFolder;
                this.outboundFolderBrowser.SelectedPath = Properties.Settings.Default.outboundFolder;
            }
            if (Properties.Settings.Default.simName != String.Empty)
                this.userTextBox.Text = Properties.Settings.Default.simName;
            Properties.Settings.Default.Save();
        }

        //This does the heavy lifting: uploads and downloads
        private void backgroundWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            //Check to see if DB is still running
            try { System.Diagnostics.Process.GetProcessById((int)pid); }
            catch (ArgumentException) { processLoadError = true; return; }

            OperationType ot = (OperationType)e.Argument;
            if (ot == OperationType.Download)
            {
                Download();
            }
            else if (ot == OperationType.Upload)
            {
                Upload();
            }
            return;
        }

        private void delay_Tick(object sender, EventArgs e)
        {
            delay.Stop();
            if (timesTicked % 2 == 0)
                backgroundWorker.RunWorkerAsync(OperationType.Download);
            else
                backgroundWorker.RunWorkerAsync(OperationType.Upload);
        }

        private void Download()
        {
            timesTicked++; //If we exit early we dont want to get stuck
            botDownloaded = false;
            botUploaded = false;
            string inDir = Properties.Settings.Default.inboundFolder;
            string outDir = Properties.Settings.Default.outboundFolder;
            string output = String.Empty;
            //Download a bot and decompress it
            output += "Getting bot...\r\n";
            //Make sure our data is current
            this.ScanMemory();
            backgroundWorker.ReportProgress(0, output);
            string request = String.Format("http://www.darwinbots.com/FTP/getbot.php?ping={0}&pop={1}&cps={2}&mutrate={3}&vegpop={4}&size={5}&totcycles={6}",
                                            simName, //ping
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
                    output += botReader.ReadToEnd() + "\r\n";
                }
                else
                {
                    //No errors, save and decompress the bot
                    string filename = bot.Headers.Get("Content-Disposition").Split('=').Last();
                    output += filename + "\r\n";
                    string fromUser = bot.Headers.Get("From-User");
                    output += "From " + fromUser + "\r\n";
                    backgroundWorker.ReportProgress(0, output);
                    Stream botStream = bot.GetResponseStream();
                    byte[] botCompressed = botStream.ReadFully(1024);
                    byte[] botData = SevenZip.Compression.LZMA.SevenZipHelper.Decompress(botCompressed);
                    File.WriteAllBytes(inDir + "/" + filename, botData);
                    output += "Saved";
                    botDownloaded = true;
                }
            }
            catch (WebException ex)
            {
                output += ex.Message;
            }
            backgroundWorker.ReportProgress(0, output);
        }

        private void Upload()
        {
            timesTicked++;
            botDownloaded = false;
            botUploaded = false;
            string inDir = Properties.Settings.Default.inboundFolder;
            string outDir = Properties.Settings.Default.outboundFolder;
            string output = String.Empty;
            //Compress and upload a file out of outbound directory
            FileInfo[] fiArray = new DirectoryInfo(outDir).GetFiles();
            if (fiArray.Length == 0)
            {
                output += "No bots to upload!\r\n";
                backgroundWorker.ReportProgress(0, output);
                return;
            }
            FileInfo fileToUpload = fiArray.OrderByDescending(fi => fi.CreationTime).First();
            output += "Uploading: " + fileToUpload.Name + "\r\n";
            output += "Size: " + fileToUpload.ReadableSize() + "\r\n";
            byte[] filetoUploadData = File.ReadAllBytes(fileToUpload.FullName);
            backgroundWorker.ReportProgress(0, output);
            //Compress using LZMA
            byte[] compressedToUpload = SevenZip.Compression.LZMA.SevenZipHelper.Compress(filetoUploadData);
            //Write the file back out and send it
            File.WriteAllBytes(fileToUpload.FullName, compressedToUpload);
            fileToUpload.Refresh();
            output += "Compressed: " + fileToUpload.ReadableSize() + "\r\n";
            backgroundWorker.ReportProgress(0, output);
            try
            {
                string[] files = { fileToUpload.FullName };
                NameValueCollection nvc = new NameValueCollection();
                nvc.Add("user", simName);
                output += HttpUploadHelper.Upload(@"http://www.darwinbots.com/FTP/upload.php", new UploadFile[] { new UploadFile(fileToUpload.FullName, "uploaded", "application/octet-stream") }, nvc);
                output += "\r\n";
                fileToUpload.Delete();
                botUploaded = true;
            }
            catch (WebException ex)
            {
                output += ex.Message;
            }
            backgroundWorker.ReportProgress(0, output);
        }

        public void ScanMemory()
        {
            scanResults = MemoryScanner.ScanDarwinbots(selectedVersion, (int)pid);
        }

        void UpdateScannedValues()
        {
            this.popLabel.Text = string.Format("Population: {0}", scanResults["SimPop"]);
            this.vegeLabel.Text = string.Format("Vege Population: {0}", scanResults["VegePop"]);
            this.cyclesLabel.Text = string.Format("Cycles/sec: {0:0.#}", scanResults["CPS"]);
            this.mutLabel.Text = string.Format("Mutation Rate: {0}", scanResults["MutRate"]);
            this.fieldLabel.Text = string.Format("Field Size: {0}", scanResults["Size"]);
        }

        //Show our info for one bot upload/download
        private void backgroundWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            string output = (string)e.UserState;
            this.statusBox.Text = output;
        }

        //We are done for the moment, display
        private void backgroundWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (botUploaded)
            {
                up++;
                this.numoutLabel.Text = string.Format("Out: {0}", up);
            }
            if (botDownloaded)
            {
                down++;
                this.numinLabel.Text = string.Format("In: {0}", down);
            }

            if (processLoadError)
            {
                this.statusBox.Text = "Error: The DarwinBots process is no longer running.";
                this.startButton.PerformClick();
            }
            else
            {
                ScanMemory();
                UpdateScannedValues();
            }
            delay.Start();
        }

        private void inboundBrowseButton_Click(object sender, EventArgs e)
        {
            DialogResult result = this.inboundFolderBrowser.ShowDialog();
            if (result == DialogResult.OK)
            {
                this.inboundTextBox.Text = this.inboundFolderBrowser.SelectedPath;
            }
        }

        private void outboundBrowseButton_Click(object sender, EventArgs e)
        {
            DialogResult result = this.outboundFolderBrowser.ShowDialog();
            if (result == DialogResult.OK)
            {
                this.outboundTextBox.Text = this.outboundFolderBrowser.SelectedPath;
            }
        }

        private void startButton_Click(object sender, EventArgs e)
        {
            this.statusBox.Clear();
            //Make sure the user's input is good before we go
            if (!running)
            {
                bool failed = false;
                if (!Directory.Exists(this.inboundTextBox.Text) || !Directory.Exists(this.outboundTextBox.Text))
                {
                    failed = true;
                    this.statusBox.Text = "Error: The inbound and outbound folders must exist.\r\n";
                }
                if (userTextBox.Text == String.Empty)
                {
                    failed = true;
                    this.statusBox.Text += "Error: Please suppy a sim name.\r\n";
                }
                if(this.pidDropDownBox.SelectedItem == null)
                {
                    failed=true;
                    this.statusBox.Text+= "Error: Please select a DarwinBots process.";
                }
                if (failed)
                    return;
                //User's info looks good, go.
                Properties.Settings.Default.outboundFolder = this.outboundTextBox.Text;
                Properties.Settings.Default.inboundFolder = this.inboundTextBox.Text;
                Properties.Settings.Default.simName = this.userTextBox.Text;
                Properties.Settings.Default.Save();
            }
            running = !running;
            //Disable or enable the settings while IM is running
            if (running)
            {
                this.inboundBrowseButton.Enabled = false;
                this.inboundTextBox.Enabled = false;
                this.inboundLabel.Enabled = false;
                this.outboundBrowseButton.Enabled = false;
                this.outboundTextBox.Enabled = false;
                this.outboundLabel.Enabled = false;
                this.userTextBox.Enabled = false;
                simName = this.userTextBox.Text.Trim();
                this.userLabel.Enabled = false;
                this.pidDropDownBox.Enabled = false;
                pid = (uint)(int)this.pidDropDownBox.SelectedItem;
                this.pidLabel.Enabled = false;

                backgroundWorker.RunWorkerAsync(OperationType.Download);
            }
            else
            {
                this.inboundBrowseButton.Enabled = true;
                this.inboundTextBox.Enabled = true;
                this.inboundLabel.Enabled = true;
                this.outboundBrowseButton.Enabled = true;
                this.outboundTextBox.Enabled = true;
                this.outboundLabel.Enabled = true;
                this.userTextBox.Enabled = true;
                this.userLabel.Enabled = true;
                this.pidDropDownBox.Enabled = true;
                this.pidLabel.Enabled = true;
            }
        }

        private void pidDropDownBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            pid = (uint)(int)this.pidDropDownBox.SelectedItem;
            selectedVersion = dbVersions.Where(v => v.Name == System.Diagnostics.Process.GetProcessById((int)pid).ProcessName).First();
            this.ScanMemory();
            UpdateScannedValues();
        }

        private void pidDropDownBox_DropDown(object sender, EventArgs e)
        {
            int value = -1;
            if (this.pidDropDownBox.SelectedItem != null)
                value = (int)this.pidDropDownBox.SelectedItem;
            this.pidDropDownBox.Items.Clear();
            //Search for any versions of DB that are running
            foreach (DarwinbotsVersion v in dbVersions)
            {
                foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcessesByName(v.Name))
                {
                    this.pidDropDownBox.Items.Add(p.Id);
                    this.pidDropDownBox.SelectedIndex = 0;
                    selectedVersion = v;
                }
            }
            if (this.pidDropDownBox.Items.Contains(value))
            {
                this.pidDropDownBox.SelectedIndex = this.pidDropDownBox.Items.IndexOf(value);
                selectedVersion = dbVersions.Where(v => v.Name == System.Diagnostics.Process.GetProcessById(value).ProcessName).First();
            }
        }

        private void mainForm_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                this.Hide();
                this.ShowInTaskbar = false;
                this.trayIcon.Visible = true;
            }
        }

        private void trayIcon_Click(object sender, EventArgs e)
        {
            this.Show();
            this.ShowInTaskbar = true;
            this.WindowState = FormWindowState.Normal;
            this.trayIcon.Visible = false;
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            //Check for a new version online
            StringBuilder version = new StringBuilder(Assembly.GetExecutingAssembly().FullName.Split(',').Where(s => s.Contains("Version")).First().Split('=').Last());
            version.Replace(".", string.Empty);
            int versionNum;
            if (Int32.TryParse(version.ToString(), out versionNum))
            {
                try
                {
                    StringBuilder onlineVersion = new StringBuilder(webClient.DownloadString(@"http://www.darwinbots.com/FTP/DarwinbotsIM.txt"));
                    Char[] splitOn = { '\n', '\r' };
                    string[] lines = onlineVersion.ToString().Split(splitOn, StringSplitOptions.RemoveEmptyEntries);
                    //Don't check for auto-update - only for the CLI version now
                    //Check the rest of the lines for new memory scanning settings
                    for (int i = 1; i < lines.Length; i++)
                    {
                        bool exists = false;
                        foreach(DarwinbotsVersion v in dbVersions)
                        {
                            if (lines[i] == v.Name)
                            {
                                exists = true;
                            }
                        }
                        if (!exists)
                        {
                            //There is a new version of Darwinbots out
                            //Download and save the new memory locations/process name
                            DarwinbotsVersion newVersion = DarwinbotsVersion.DownloadAndParse(lines[i]);
                            Properties.Settings.Default.versions.Add(lines[i]);
                            dbVersions.Add(newVersion);
                        }
                    }
                }
                catch (WebException ex)
                {
                    //We dont have a internet connection
                    this.statusBox.Text = ex.Message;
                }
            }
        }
    }
}