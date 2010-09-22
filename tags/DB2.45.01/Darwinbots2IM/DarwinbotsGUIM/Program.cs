using System;
using System.IO;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Text;

namespace DarwinbotsGUIM
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new mainForm());
        }
    }
}
