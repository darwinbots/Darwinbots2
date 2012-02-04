using System;
using System.IO;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Text;
using IM;

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
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(HandleException);

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new mainForm());
        }

        static void HandleException(object sender, UnhandledExceptionEventArgs e)
        {
            try
            {
                ExceptionBox.ShowDialog((Exception)e.ExceptionObject);
            }
            finally
            {
                Application.Exit();
            }
        }
    }
}
