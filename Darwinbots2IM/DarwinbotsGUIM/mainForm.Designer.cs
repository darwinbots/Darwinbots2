namespace DarwinbotsGUIM
{
    partial class mainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(mainForm));
            this.inboundFolderBrowser = new System.Windows.Forms.FolderBrowserDialog();
            this.outboundFolderBrowser = new System.Windows.Forms.FolderBrowserDialog();
            this.inboundTextBox = new System.Windows.Forms.TextBox();
            this.inboundLabel = new System.Windows.Forms.Label();
            this.inboundBrowseButton = new System.Windows.Forms.Button();
            this.outboundBrowseButton = new System.Windows.Forms.Button();
            this.outboundLabel = new System.Windows.Forms.Label();
            this.outboundTextBox = new System.Windows.Forms.TextBox();
            this.userTextBox = new System.Windows.Forms.TextBox();
            this.userLabel = new System.Windows.Forms.Label();
            this.pidLabel = new System.Windows.Forms.Label();
            this.startButton = new System.Windows.Forms.Button();
            this.numinLabel = new System.Windows.Forms.Label();
            this.numoutLabel = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.statusBox = new System.Windows.Forms.TextBox();
            this.backgroundWorker = new System.ComponentModel.BackgroundWorker();
            this.popLabel = new System.Windows.Forms.Label();
            this.cyclesLabel = new System.Windows.Forms.Label();
            this.mutLabel = new System.Windows.Forms.Label();
            this.fieldLabel = new System.Windows.Forms.Label();
            this.vegeLabel = new System.Windows.Forms.Label();
            this.pidDropDownBox = new System.Windows.Forms.ComboBox();
            this.trayIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.delay = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // inboundFolderBrowser
            // 
            this.inboundFolderBrowser.Description = "Select the Inbound Folder";
            this.inboundFolderBrowser.RootFolder = System.Environment.SpecialFolder.MyComputer;
            // 
            // outboundFolderBrowser
            // 
            this.outboundFolderBrowser.Description = "Select the Outbound Folder";
            this.outboundFolderBrowser.RootFolder = System.Environment.SpecialFolder.MyComputer;
            // 
            // inboundTextBox
            // 
            this.inboundTextBox.Location = new System.Drawing.Point(12, 25);
            this.inboundTextBox.Name = "inboundTextBox";
            this.inboundTextBox.Size = new System.Drawing.Size(179, 20);
            this.inboundTextBox.TabIndex = 0;
            // 
            // inboundLabel
            // 
            this.inboundLabel.AutoSize = true;
            this.inboundLabel.Location = new System.Drawing.Point(12, 9);
            this.inboundLabel.Name = "inboundLabel";
            this.inboundLabel.Size = new System.Drawing.Size(78, 13);
            this.inboundLabel.TabIndex = 1;
            this.inboundLabel.Text = "Inbound Folder";
            // 
            // inboundBrowseButton
            // 
            this.inboundBrowseButton.Location = new System.Drawing.Point(197, 21);
            this.inboundBrowseButton.Name = "inboundBrowseButton";
            this.inboundBrowseButton.Size = new System.Drawing.Size(75, 23);
            this.inboundBrowseButton.TabIndex = 2;
            this.inboundBrowseButton.Text = "Browse";
            this.inboundBrowseButton.UseVisualStyleBackColor = true;
            this.inboundBrowseButton.Click += new System.EventHandler(this.inboundBrowseButton_Click);
            // 
            // outboundBrowseButton
            // 
            this.outboundBrowseButton.Location = new System.Drawing.Point(197, 63);
            this.outboundBrowseButton.Name = "outboundBrowseButton";
            this.outboundBrowseButton.Size = new System.Drawing.Size(75, 23);
            this.outboundBrowseButton.TabIndex = 5;
            this.outboundBrowseButton.Text = "Browse";
            this.outboundBrowseButton.UseVisualStyleBackColor = true;
            this.outboundBrowseButton.Click += new System.EventHandler(this.outboundBrowseButton_Click);
            // 
            // outboundLabel
            // 
            this.outboundLabel.AutoSize = true;
            this.outboundLabel.Location = new System.Drawing.Point(12, 48);
            this.outboundLabel.Name = "outboundLabel";
            this.outboundLabel.Size = new System.Drawing.Size(86, 13);
            this.outboundLabel.TabIndex = 4;
            this.outboundLabel.Text = "Outbound Folder";
            // 
            // outboundTextBox
            // 
            this.outboundTextBox.Location = new System.Drawing.Point(12, 64);
            this.outboundTextBox.Name = "outboundTextBox";
            this.outboundTextBox.Size = new System.Drawing.Size(179, 20);
            this.outboundTextBox.TabIndex = 3;
            // 
            // userTextBox
            // 
            this.userTextBox.Location = new System.Drawing.Point(12, 103);
            this.userTextBox.MaxLength = 24;
            this.userTextBox.Name = "userTextBox";
            this.userTextBox.Size = new System.Drawing.Size(118, 20);
            this.userTextBox.TabIndex = 6;
            // 
            // userLabel
            // 
            this.userLabel.AutoSize = true;
            this.userLabel.Location = new System.Drawing.Point(12, 87);
            this.userLabel.Name = "userLabel";
            this.userLabel.Size = new System.Drawing.Size(55, 13);
            this.userLabel.TabIndex = 7;
            this.userLabel.Text = "Sim Name";
            // 
            // pidLabel
            // 
            this.pidLabel.AutoSize = true;
            this.pidLabel.Location = new System.Drawing.Point(153, 87);
            this.pidLabel.Name = "pidLabel";
            this.pidLabel.Size = new System.Drawing.Size(59, 13);
            this.pidLabel.TabIndex = 9;
            this.pidLabel.Text = "Process ID";
            // 
            // startButton
            // 
            this.startButton.Location = new System.Drawing.Point(23, 138);
            this.startButton.Name = "startButton";
            this.startButton.Size = new System.Drawing.Size(75, 23);
            this.startButton.TabIndex = 10;
            this.startButton.Text = "Start / Stop";
            this.startButton.UseVisualStyleBackColor = true;
            this.startButton.Click += new System.EventHandler(this.startButton_Click);
            // 
            // numinLabel
            // 
            this.numinLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.numinLabel.AutoSize = true;
            this.numinLabel.Location = new System.Drawing.Point(116, 136);
            this.numinLabel.Name = "numinLabel";
            this.numinLabel.Size = new System.Drawing.Size(19, 13);
            this.numinLabel.TabIndex = 11;
            this.numinLabel.Text = "In:";
            // 
            // numoutLabel
            // 
            this.numoutLabel.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.numoutLabel.AutoSize = true;
            this.numoutLabel.Location = new System.Drawing.Point(108, 153);
            this.numoutLabel.Name = "numoutLabel";
            this.numoutLabel.Size = new System.Drawing.Size(27, 13);
            this.numoutLabel.TabIndex = 12;
            this.numoutLabel.Text = "Out:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 275);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "Status";
            // 
            // statusBox
            // 
            this.statusBox.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.statusBox.Location = new System.Drawing.Point(12, 291);
            this.statusBox.Multiline = true;
            this.statusBox.Name = "statusBox";
            this.statusBox.ReadOnly = true;
            this.statusBox.Size = new System.Drawing.Size(260, 154);
            this.statusBox.TabIndex = 14;
            // 
            // backgroundWorker
            // 
            this.backgroundWorker.WorkerReportsProgress = true;
            this.backgroundWorker.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker_DoWork);
            this.backgroundWorker.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker_RunWorkerCompleted);
            this.backgroundWorker.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker_ProgressChanged);
            // 
            // popLabel
            // 
            this.popLabel.AutoSize = true;
            this.popLabel.Location = new System.Drawing.Point(37, 171);
            this.popLabel.Name = "popLabel";
            this.popLabel.Size = new System.Drawing.Size(60, 13);
            this.popLabel.TabIndex = 15;
            this.popLabel.Text = "Population:";
            // 
            // cyclesLabel
            // 
            this.cyclesLabel.AutoSize = true;
            this.cyclesLabel.Location = new System.Drawing.Point(34, 213);
            this.cyclesLabel.Name = "cyclesLabel";
            this.cyclesLabel.Size = new System.Drawing.Size(63, 13);
            this.cyclesLabel.TabIndex = 16;
            this.cyclesLabel.Text = "Cycles/sec:";
            // 
            // mutLabel
            // 
            this.mutLabel.AutoSize = true;
            this.mutLabel.Location = new System.Drawing.Point(20, 234);
            this.mutLabel.Name = "mutLabel";
            this.mutLabel.Size = new System.Drawing.Size(77, 13);
            this.mutLabel.TabIndex = 17;
            this.mutLabel.Text = "Mutation Rate:";
            // 
            // fieldLabel
            // 
            this.fieldLabel.AutoSize = true;
            this.fieldLabel.Location = new System.Drawing.Point(42, 255);
            this.fieldLabel.Name = "fieldLabel";
            this.fieldLabel.Size = new System.Drawing.Size(55, 13);
            this.fieldLabel.TabIndex = 18;
            this.fieldLabel.Text = "Field Size:";
            // 
            // vegeLabel
            // 
            this.vegeLabel.AutoSize = true;
            this.vegeLabel.Location = new System.Drawing.Point(9, 192);
            this.vegeLabel.Name = "vegeLabel";
            this.vegeLabel.Size = new System.Drawing.Size(88, 13);
            this.vegeLabel.TabIndex = 19;
            this.vegeLabel.Text = "Vege Population:";
            // 
            // pidDropDownBox
            // 
            this.pidDropDownBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.pidDropDownBox.FormattingEnabled = true;
            this.pidDropDownBox.Location = new System.Drawing.Point(153, 103);
            this.pidDropDownBox.Name = "pidDropDownBox";
            this.pidDropDownBox.Size = new System.Drawing.Size(118, 21);
            this.pidDropDownBox.TabIndex = 8;
            this.pidDropDownBox.SelectedIndexChanged += new System.EventHandler(this.pidDropDownBox_SelectedIndexChanged);
            this.pidDropDownBox.DropDown += new System.EventHandler(this.pidDropDownBox_DropDown);
            // 
            // trayIcon
            // 
            this.trayIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("trayIcon.Icon")));
            this.trayIcon.Text = "Darwinbots IM";
            this.trayIcon.Click += new System.EventHandler(this.trayIcon_Click);
            // 
            // delay
            // 
            this.delay.Interval = 5000;
            this.delay.Tick += new System.EventHandler(this.delay_Tick);
            // 
            // mainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(285, 457);
            this.Controls.Add(this.vegeLabel);
            this.Controls.Add(this.fieldLabel);
            this.Controls.Add(this.mutLabel);
            this.Controls.Add(this.cyclesLabel);
            this.Controls.Add(this.popLabel);
            this.Controls.Add(this.statusBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.numoutLabel);
            this.Controls.Add(this.numinLabel);
            this.Controls.Add(this.startButton);
            this.Controls.Add(this.pidLabel);
            this.Controls.Add(this.pidDropDownBox);
            this.Controls.Add(this.userLabel);
            this.Controls.Add(this.userTextBox);
            this.Controls.Add(this.outboundBrowseButton);
            this.Controls.Add(this.outboundLabel);
            this.Controls.Add(this.outboundTextBox);
            this.Controls.Add(this.inboundBrowseButton);
            this.Controls.Add(this.inboundLabel);
            this.Controls.Add(this.inboundTextBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "mainForm";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.Text = "Darwinbots IM";
            this.Load += new System.EventHandler(this.mainForm_Load);
            this.Resize += new System.EventHandler(this.mainForm_Resize);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog inboundFolderBrowser;
        private System.Windows.Forms.FolderBrowserDialog outboundFolderBrowser;
        private System.Windows.Forms.TextBox inboundTextBox;
        private System.Windows.Forms.Label inboundLabel;
        private System.Windows.Forms.Button inboundBrowseButton;
        private System.Windows.Forms.Button outboundBrowseButton;
        private System.Windows.Forms.Label outboundLabel;
        private System.Windows.Forms.TextBox outboundTextBox;
        private System.Windows.Forms.TextBox userTextBox;
        private System.Windows.Forms.Label userLabel;
        private System.Windows.Forms.Label pidLabel;
        private System.Windows.Forms.Button startButton;
        private System.Windows.Forms.Label numinLabel;
        private System.Windows.Forms.Label numoutLabel;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox statusBox;
        private System.ComponentModel.BackgroundWorker backgroundWorker;
        private System.Windows.Forms.Label popLabel;
        private System.Windows.Forms.Label cyclesLabel;
        private System.Windows.Forms.Label mutLabel;
        private System.Windows.Forms.Label fieldLabel;
        private System.Windows.Forms.Label vegeLabel;
        private System.Windows.Forms.ComboBox pidDropDownBox;
        private System.Windows.Forms.NotifyIcon trayIcon;
        private System.Windows.Forms.Timer delay;
    }
}

