using System;
using System.Collections.Generic;
using System.IO;
using System.Diagnostics;

namespace DBLaunch
{
    class Program
    {
        static void Main(string[] args)
        {
            int version = 0;
            string fileToRun = string.Empty;
            var path = AppDomain.CurrentDomain.BaseDirectory;
            var di = new DirectoryInfo(path);
            var fi = di.GetFiles("*.exe");
            char[] spliton = new char[] { '.' };
            foreach (FileInfo f in fi)
            {
                var splits = f.Name.Split(spliton, StringSplitOptions.RemoveEmptyEntries);
                if (splits[0] == "Darwin2")
                {
                    string vnum = splits[1] + splits[2];
                    int temp = Int32.Parse(vnum);
                    if (version < temp)
                    {
                        version = temp;
                        fileToRun = f.FullName;
                    }
                }
            }
            if (fileToRun != string.Empty)
            {
                Process.Start(fileToRun);
            }
            return;
        }
    }
}
