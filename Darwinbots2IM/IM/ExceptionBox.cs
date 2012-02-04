using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace IM
{
    public partial class ExceptionBox : Form
    {
        public ExceptionBox()
        {
            InitializeComponent();
        }

        public static void ShowDialog(Exception ex)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(ex.Message);
            sb.AppendLine();
            sb.AppendLine(ex.StackTrace);
            if (ex.InnerException != null)
            {
                string seperator = "=================================";
                sb.AppendLine(seperator);
                sb.AppendLine();
                sb.AppendLine(ex.InnerException.Message);
                sb.AppendLine();
                sb.AppendLine(ex.InnerException.StackTrace);
                sb.AppendLine();
            }
            ExceptionBox.ShowDialog(sb.ToString());
        }

        public static void ShowDialog(string exception)
        {
            var box = new ExceptionBox();
            box.exceptionTextBox.Text = exception;
            box.okButton.Focus();
            box.ShowDialog();
        }

        private void okButton_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
        }

        private void copyLinkLabel_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Clipboard.SetText(exceptionTextBox.Text, TextDataFormat.Text);
        }
    }
}
