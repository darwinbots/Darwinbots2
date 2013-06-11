using System;
using System.Collections.Generic;
using System.IO;
using System.Diagnostics;
using System.Collections;

namespace DBLaunch
{
    class Program
    {
        static void Main(string[] args)
        {
            string fileToRun = string.Empty; //our file to run

            var path = AppDomain.CurrentDomain.BaseDirectory; //we set this to our startupdir

            var di = new DirectoryInfo(path); //lets create our dir info

            var fi = di.GetFiles("Darwin2*.exe"); //lets get DB2 files

            char[] spliton = new char[] { '.' }; //we need to split the data one time to figure out if we need to add .00 to the end of file

            ArrayList list = new ArrayList(); //our array list

            foreach (FileInfo f in fi)
            {
                string tmp = f.Name; //our temporary string for formatting
                var splits = tmp.Split(spliton);
                if (splits.GetUpperBound(0) == 2)
                {
                    string leftside = tmp.Substring(0, ("Darwin2.00").Length);
                    string rightside = tmp.Substring(("Darwin2.00").Length);
                    tmp = leftside + ".00" + rightside;
                }
                //formatting complete, write to array list
                list.Add(tmp);
            }

            ArrayList versiononly = new ArrayList(); // our version only list to figure out max version

            //lets generate our version only list
            foreach (string value in list)
            {
                versiononly.Add(value.Substring(0,("Darwin2.00.00").Length));
            }

            //lets sort by version

            versiononly.Sort();

            //maxversion is our maximum version

            string maxversion = (string)versiononly[versiononly.Count - 1];

            //sort the main list and remove any data that is not max

            ArrayList maxversionarray = new ArrayList();

            foreach (string value in list)
            {
                if (value.Substring(0, ("Darwin2.00.00").Length) == maxversion)
                {
                    maxversionarray.Add(value);
                }
            }

            //now we have max version array

            ////nonbeta items superseed beta items

            ArrayList betalist = new ArrayList();
            ArrayList nonbetalist = new ArrayList();

            foreach (string value in maxversionarray)
            {
                if (value.Substring(("Darwin2.00.00").Length, 4) == "Beta")
                {
                    betalist.Add(value);
                }
                else
                {
                    nonbetalist.Add(value);
                }
            }

            //sort and figure out priorety not beta

            if (nonbetalist.Count > 0)
            {
                nonbetalist.Sort();
                fileToRun = (string)nonbetalist[nonbetalist.Count - 1];
            }
            else
            {
                betalist.Sort();
                fileToRun = (string)betalist[betalist.Count - 1];
            }

            //finally, remove all instances of .00
            fileToRun = fileToRun.Replace(".00", "");

            if (fileToRun != string.Empty)
            {
                Process.Start(path + fileToRun);
            }
            return;
        }
    }
}
