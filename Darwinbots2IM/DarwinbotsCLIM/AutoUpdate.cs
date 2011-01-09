using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Net;
using System.IO;
using IM;

namespace DarwinbotsCLIM
{
    public static class AutoUpdate
    {
        /// <summary>
        /// Checks for, and downloads a new version of DarwinbotsIM
        /// </summary>
        public static void Check(ref List<DarwinbotsVersion> dbVersions)
        {
            WebClient webClient = new WebClient();

            //Check for a new version online
            var version = new StringBuilder(Assembly.GetExecutingAssembly().FullName.Split(',').Where(s => s.Contains("Version")).First().Split('=').Last());
            version.Replace(".", string.Empty);
            int versionNum;
            if (Int32.TryParse(version.ToString(), out versionNum))
            {
                try
                {
                    StringBuilder onlineVersion = new StringBuilder(webClient.DownloadString(@"http://www.darwinbots.com/FTP/DarwinbotsIM.txt"));
                    Char[] splitOn = { '\n', '\r' };
                    string[] lines = onlineVersion.ToString().Split(splitOn, StringSplitOptions.RemoveEmptyEntries);
                    int onlineVersionNum;
                    //Check to see if there is a new version of the program
                    if (Int32.TryParse(lines[0], out onlineVersionNum))
                    {
                        if (onlineVersionNum > versionNum)
                        {
                            //There is a new version online
                            Console.WriteLine("Updating to a new version...");
                            //Rename our exe
                            try
                            {
                                File.Move(System.Windows.Forms.Application.ExecutablePath, Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath) + @"\DarwinbotsIM.old.exe");
                                //Download the new one
                                try
                                {
                                    webClient.DownloadFile(@"http://www.darwinbots.com/FTP/DarwinbotsIM.exe", System.Windows.Forms.Application.ExecutablePath);
                                    //Command line version must have the arguments
                                    string[] argsArray = Environment.GetCommandLineArgs();
                                    //First arg is exe name
                                    argsArray[0]=String.Empty;
                                    string args = String.Join(" ", argsArray);
                                    System.Diagnostics.Process.Start(System.Windows.Forms.Application.ExecutablePath, "--update "+args);
                                    Environment.Exit(0);
                                }
                                catch (WebException ex)
                                {
                                    //We dont have a internet connection, or the download failed
                                    Console.WriteLine(ex.Message);
                                }
                            }
                            catch (UnauthorizedAccessException)
                            {
                                //User doesnt have acces, they need to do it manually
                                System.Media.SystemSounds.Exclamation.Play();
                                FlashWindow.Flash(System.Diagnostics.Process.GetCurrentProcess().MainWindowHandle);
                                Console.WriteLine("You do not have access to download the new version automatically.");
                                Console.Write("Would you like to open a browser to download it? [y or n]: ");
                                bool validInput = false;
                                while (!validInput)
                                {
                                    string input = Console.ReadLine().ToLower();
                                    if (input == "y" || input == "yes")
                                    {
                                        validInput = true;
                                        OpenLink.Open(@"http://www.darwinbots.com/FTP/DarwinbotsIM.exe");
                                        Environment.Exit(0);
                                    }
                                    else if (input == "n" || input == "no")
                                    {
                                        validInput = true;
                                    }
                                    else
                                    {
                                        Console.Write("y or n: ");
                                    }
                                }
                            }
                        }
                    }
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
                            //Download and use the new memory locations/process name
                            DarwinbotsVersion newVersion = DarwinbotsVersion.DownloadAndParse(lines[i]);
                            dbVersions.Add(newVersion);
                            Console.WriteLine("Update for {0} downloaded", newVersion.Name);
                        }
                    }
                }
                catch (WebException ex)
                {
                    //We dont have a internet connection
                    Console.WriteLine(ex.Message);
                }
            }
        }
    }
}