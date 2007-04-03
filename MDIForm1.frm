VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIForm1 
   AutoShowChildren=   0   'False
   BackColor       =   &H00808080&
   Caption         =   "DarwinBots 2.43"
   ClientHeight    =   7140
   ClientLeft      =   3570
   ClientTop       =   3315
   ClientWidth     =   15810
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
   Tag             =   "1000"
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   7320
      Top             =   3360
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2520
      Top             =   1440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   24
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":08CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":0E64
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":13FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":1998
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":1F32
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":24CC
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":2A66
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":3000
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":359A
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":3B34
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":40CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":4668
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":4C02
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":519C
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":5736
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":5CD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":626A
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":6804
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":6D9E
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":7678
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":84CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":931C
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":9395
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":A1E7
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   15810
      _ExtentX        =   27887
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   26
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "newsim"
            Object.ToolTipText     =   "Start a new simulation"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "loadsim"
            Object.ToolTipText     =   "Load a previously saved simulation"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "savesim"
            Object.ToolTipText     =   "Save the current simulation"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
            Object.Width           =   500
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "play"
            Object.ToolTipText     =   "Play simulation"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cycle"
            Object.ToolTipText     =   "Calculate a single cycle"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "stop"
            Object.ToolTipText     =   "Pause simulation"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
            Object.Width           =   300
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "limit"
            Object.ToolTipText     =   "Limits speed to 15 cycles/sec"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "fast"
            Object.ToolTipText     =   "Toggle fast mode"
            ImageIndex      =   7
            Style           =   1
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Flickermode"
            Object.ToolTipText     =   "Toggle Flickermode. Faster but flickery."
            ImageIndex      =   7
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "noskin"
            ImageIndex      =   15
            Style           =   1
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "nopoff"
            Object.ToolTipText     =   "Turns off bot explosion poffs"
            ImageIndex      =   19
            Style           =   1
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Novideo"
            Object.ToolTipText     =   "Turns off graphical display for the utmost speed."
            ImageIndex      =   16
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   6
            Style           =   4
            Object.Width           =   300
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "insert"
            Object.ToolTipText     =   "Toggle robot insertion mode"
            ImageIndex      =   8
            Style           =   1
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
            Object.Width           =   1700
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "best"
            Object.ToolTipText     =   "Find the most successful robot"
            ImageIndex      =   10
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   13
            Style           =   4
            Object.Width           =   300
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "graph"
            Object.ToolTipText     =   "Select graph to display"
            ImageIndex      =   14
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   12
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "pop"
                  Text            =   "Population graph"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgmut"
                  Text            =   "Average mutations"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgmutlen"
                  Text            =   "Average mutations/DNA len"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgage"
                  Text            =   "Average Age"
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgsons"
                  Text            =   "Average Descendents"
               EndProperty
               BeginProperty ButtonMenu6 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgnrg"
                  Text            =   "Average Energy"
               EndProperty
               BeginProperty ButtonMenu7 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avglen"
                  Text            =   "Average DNA length"
               EndProperty
               BeginProperty ButtonMenu8 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "avgcond"
                  Text            =   "Average DNA conditions"
               EndProperty
               BeginProperty ButtonMenu9 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "simnrg"
                  Text            =   "Total Energy"
               EndProperty
               BeginProperty ButtonMenu10 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "autocost"
                  Text            =   "Dynamic Cost Stats"
               EndProperty
               BeginProperty ButtonMenu11 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Enabled         =   0   'False
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu12 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "resgraph"
                  Text            =   "Reset all graphs"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
            Object.Width           =   300
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "snapshot"
            Object.ToolTipText     =   "capture data on all living robots"
            ImageIndex      =   23
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "smileymode"
            Object.ToolTipText     =   "SmileyMode"
            ImageIndex      =   22
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   4
            Object.Width           =   300
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Stealth"
            ImageIndex      =   24
         EndProperty
         BeginProperty Button26 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Ignore"
            Object.ToolTipText     =   "The program will attempt to ignore errors"
         EndProperty
      EndProperty
      Begin VB.CommandButton Report 
         BackColor       =   &H80000004&
         Enabled         =   0   'False
         Height          =   375
         Left            =   14160
         Picture         =   "MDIForm1.frx":AAC3
         Style           =   1  'Graphical
         TabIndex        =   10
         ToolTipText     =   "Zoom out"
         Top             =   0
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.CommandButton Profile 
         Enabled         =   0   'False
         Height          =   375
         Left            =   13800
         Picture         =   "MDIForm1.frx":B04D
         Style           =   1  'Graphical
         TabIndex        =   9
         TabStop         =   0   'False
         ToolTipText     =   "Zoom in"
         Top             =   0
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.CheckBox ZoomLock 
         DownPicture     =   "MDIForm1.frx":B5D7
         Height          =   375
         Left            =   11160
         Picture         =   "MDIForm1.frx":B919
         Style           =   1  'Graphical
         TabIndex        =   8
         ToolTipText     =   "Locks and unlocks being able to lock at areas outside of the arena."
         Top             =   0
         Width           =   375
      End
      Begin VB.PictureBox F1Piccy 
         Height          =   375
         Left            =   13200
         Picture         =   "MDIForm1.frx":BC5B
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   7
         Top             =   0
         Width           =   375
      End
      Begin VB.PictureBox nightpic 
         Height          =   375
         Left            =   12840
         Picture         =   "MDIForm1.frx":C02B
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   6
         Top             =   0
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox daypic 
         Height          =   375
         Left            =   12480
         Picture         =   "MDIForm1.frx":C3D3
         ScaleHeight     =   315
         ScaleWidth      =   315
         TabIndex        =   5
         Top             =   0
         Width           =   375
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "MDIForm1.frx":C76A
         Left            =   5640
         List            =   "MDIForm1.frx":C76C
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Select the species for robot insertion"
         Top             =   30
         Width           =   1290
      End
      Begin VB.CommandButton czo 
         BackColor       =   &H80000004&
         Height          =   375
         Left            =   11880
         Picture         =   "MDIForm1.frx":C76E
         Style           =   1  'Graphical
         TabIndex        =   3
         ToolTipText     =   "Zoom out"
         Top             =   0
         Width           =   375
      End
      Begin VB.CommandButton czin 
         Height          =   375
         Left            =   11520
         Picture         =   "MDIForm1.frx":CCF8
         Style           =   1  'Graphical
         TabIndex        =   2
         TabStop         =   0   'False
         ToolTipText     =   "Zoom in"
         Top             =   0
         Width           =   375
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   0
      Top             =   6870
      Width           =   15810
      _ExtentX        =   27887
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   13
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel7 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel8 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel9 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
         EndProperty
         BeginProperty Panel10 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
            Object.ToolTipText     =   "The number of shots in the sim this cycle"
         EndProperty
         BeginProperty Panel11 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
            Object.ToolTipText     =   "The total energy present in the simulation"
         EndProperty
         BeginProperty Panel12 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
            Object.ToolTipText     =   "The ratio of the energy this cycle to the average"
         EndProperty
         BeginProperty Panel13 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1773
            MinWidth        =   1764
            Object.ToolTipText     =   "The multiple by which costs are multipled when using autocosting"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   1080
      Top             =   1440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.Menu file 
      Caption         =   "File"
      Index           =   1
      NegotiatePosition=   3  'Right
      Begin VB.Menu newsim 
         Caption         =   "New Simulation"
         Index           =   2
         Shortcut        =   {F1}
      End
      Begin VB.Menu loadsim 
         Caption         =   "Load Simulation"
         Index           =   3
         Shortcut        =   {F2}
      End
      Begin VB.Menu SaveSim 
         Caption         =   "Save Simulation"
         Shortcut        =   {F3}
      End
      Begin VB.Menu SaveSimWithoutMutations 
         Caption         =   "Save Sim Without Mutations"
         Shortcut        =   ^{F3}
      End
      Begin VB.Menu pause 
         Caption         =   "Pause simulation"
         Shortcut        =   {F12}
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu autos 
         Caption         =   "Autosave..."
         Shortcut        =   {F4}
      End
      Begin VB.Menu P 
         Caption         =   "-"
         Index           =   3
      End
      Begin VB.Menu quit 
         Caption         =   "Quit"
         Shortcut        =   ^Q
      End
   End
   Begin VB.Menu edit 
      Caption         =   "Edit"
      Begin VB.Menu inssp 
         Caption         =   "Insert organism..."
         Shortcut        =   ^I
      End
      Begin VB.Menu sep11 
         Caption         =   "-"
      End
      Begin VB.Menu Species 
         Caption         =   "Species..."
         Shortcut        =   ^X
      End
      Begin VB.Menu fisica 
         Caption         =   "General settings..."
         Shortcut        =   ^P
      End
      Begin VB.Menu costi 
         Caption         =   "Physics and Costs..."
         Shortcut        =   {F5}
      End
      Begin VB.Menu moltiplicatore 
         Caption         =   "Global mutation rates..."
         Shortcut        =   ^G
      End
      Begin VB.Menu Leagues 
         Caption         =   "Restart and Leagues..."
         Shortcut        =   ^F
      End
      Begin VB.Menu Recording 
         Caption         =   "Recording options..."
         Shortcut        =   ^V
      End
   End
   Begin VB.Menu Backgrounds 
      Caption         =   "View"
      Begin VB.Menu LoadPiccy 
         Caption         =   "Import Background Picture"
      End
      Begin VB.Menu removepiccy 
         Caption         =   "Remove Background Picture"
      End
      Begin VB.Menu ScreenSaverMode 
         Caption         =   "Screen Saver Mode"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu backsep 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu ShowVisionGrid 
         Caption         =   "Show Vision Grid"
         Checked         =   -1  'True
      End
      Begin VB.Menu DisplayShotImpacts 
         Caption         =   "Display Shot Impacts"
         Checked         =   -1  'True
      End
      Begin VB.Menu DisplayMovementVectors 
         Caption         =   "Display Movement Vectors"
         Checked         =   -1  'True
      End
      Begin VB.Menu DisplayResourceGuages 
         Caption         =   "Display Resource Guages"
         Checked         =   -1  'True
      End
      Begin VB.Menu sep98 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu InvokeLens 
         Caption         =   "Lens..."
         Enabled         =   0   'False
         Visible         =   0   'False
      End
   End
   Begin VB.Menu popup 
      Caption         =   "Robots"
      Begin VB.Menu robinf 
         Caption         =   "Show robot info"
         Shortcut        =   ^R
      End
      Begin VB.Menu par 
         Caption         =   "Show family ties"
         Shortcut        =   ^T
      End
      Begin VB.Menu mutrat 
         Caption         =   "Mutation rates"
         Shortcut        =   ^M
      End
      Begin VB.Menu col 
         Caption         =   "Change color"
         Shortcut        =   ^C
      End
      Begin VB.Menu sep 
         Caption         =   "-"
         Index           =   14
      End
      Begin VB.Menu cons 
         Caption         =   "Open console"
         Shortcut        =   ^Y
      End
      Begin VB.Menu genact 
         Caption         =   "View genes activations"
         Shortcut        =   ^Z
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu ucci 
         Caption         =   "Kill robot"
         Shortcut        =   ^K
      End
      Begin VB.Menu sdna 
         Caption         =   "Save robot's DNA"
         Shortcut        =   ^S
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu selorg 
         Caption         =   "Select entire organism"
         Shortcut        =   ^{F1}
      End
      Begin VB.Menu saveorg 
         Caption         =   "Save entire organism"
         Shortcut        =   ^{F2}
      End
      Begin VB.Menu killorg 
         Caption         =   "Kill entire organism"
         Shortcut        =   ^E
      End
      Begin VB.Menu sep99 
         Caption         =   "-"
      End
      Begin VB.Menu fittest 
         Caption         =   "Find best"
         Shortcut        =   ^B
      End
   End
   Begin VB.Menu Objects 
      Caption         =   "Objects"
      Begin VB.Menu ShotsMenu 
         Caption         =   "Shots"
         Begin VB.Menu DontDecayNrgShots 
            Caption         =   "Don't decay nrg shots"
            Checked         =   -1  'True
         End
      End
      Begin VB.Menu TeleporterMenu 
         Caption         =   "Teleporters"
         Begin VB.Menu NewTeleportMenu 
            Caption         =   "New Teleporter..."
         End
         Begin VB.Menu HighLightTeleportersMenu 
            Caption         =   "Hilight Teleporters"
            Checked         =   -1  'True
         End
         Begin VB.Menu DeleteTeleporterMenu 
            Caption         =   "Delete Teleporter"
         End
         Begin VB.Menu DeleteTeleportersMenu 
            Caption         =   "Delete All Teleporters"
         End
      End
      Begin VB.Menu sep47 
         Caption         =   "Shapes"
         Begin VB.Menu shapes 
            Caption         =   "New Shape..."
         End
         Begin VB.Menu AddTenObstacles 
            Caption         =   "Add Ten Random Shapes"
         End
         Begin VB.Menu DeleteTenObstacles 
            Caption         =   "Delete 10 Random Shapes"
         End
         Begin VB.Menu DeleteShape 
            Caption         =   "Delete Shape"
         End
         Begin VB.Menu DeleteAllShapes 
            Caption         =   "Delete All Shapes"
         End
      End
      Begin VB.Menu MakeMaze 
         Caption         =   "Mazes"
         Begin VB.Menu HorizontalMaze 
            Caption         =   "Simple Horizontal Maze"
         End
         Begin VB.Menu VerticaMaze 
            Caption         =   "Simple Vertical Maze"
         End
         Begin VB.Menu DrawSpiral 
            Caption         =   "Sprial"
         End
         Begin VB.Menu CheckerMaze 
            Caption         =   "Checkerboard"
         End
         Begin VB.Menu PolarIce 
            Caption         =   "Polar Ice"
         End
         Begin VB.Menu TrashCompactor 
            Caption         =   "Trash Compactor"
         End
      End
   End
   Begin VB.Menu icqtrans 
      Caption         =   "Internet"
      Begin VB.Menu listcont 
         Caption         =   "Show Internet options"
         Shortcut        =   ^O
      End
      Begin VB.Menu showlogs 
         Caption         =   "Show Internet logs"
         Shortcut        =   ^L
      End
   End
   Begin VB.Menu egrid 
      Caption         =   "E-Grid"
      Begin VB.Menu showgrid 
         Caption         =   "Show E-Grid on Pause"
         Begin VB.Menu O2 
            Caption         =   "Oxygen"
         End
         Begin VB.Menu CO2 
            Caption         =   "Carbon DiOxide"
         End
         Begin VB.Menu waste 
            Caption         =   "Waste"
         End
         Begin VB.Menu silica 
            Caption         =   "Silica"
         End
         Begin VB.Menu calcium 
            Caption         =   "Calcium"
         End
         Begin VB.Menu Heat 
            Caption         =   "Temperature"
         End
      End
   End
   Begin VB.Menu help 
      Caption         =   "Help"
      Index           =   5
      NegotiatePosition=   3  'Right
      Begin VB.Menu about 
         Caption         =   "About"
         Shortcut        =   ^A
      End
      Begin VB.Menu DNAexp 
         Caption         =   "DNA Help"
         Shortcut        =   ^D
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' DarwinBots - copyright 2003 Carlo Comis
' Modifications by Purple Youko and Numsgil - 2004, 2005
' Post V2.42 modifications copyright (c) 2006 Eric Lockard  eric@sulaadventures.com
'
' All rights reserved.
'
'Redistribution and use in source and binary forms, with or without
'modification, are permitted provided that:
'
'(1) source code distributions retain the above copyright notice and this
'    paragraph in its entirety,
'(2) distributions including binary code include the above copyright notice and
'    this paragraph in its entirety in the documentation or other materials
'    provided with the distribution, and
'(3) Without the agreement of the author redistribution of this product is only allowed
'    in non commercial terms and non profit distributions.
'
'THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
'WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
'MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

Option Explicit
Public zoomval As Integer
Public startdir As String
Public MainDir As String
Public insrob As Boolean
Dim AspettaFlag As Boolean
Public visualize As Boolean   ' video output on/off
Public oneonten As Boolean    ' fast mode on/off
Public nopoff As Boolean      ' don't anim deaths with particles
Public Gridmode As Integer    ' Which display to use on the egrid
Public stealthmode As Boolean

Public limitgraphics As Boolean
Public ignoreerror As Boolean

Public xc As Long
Public yc As Long
Public showVisionGridToggle As Boolean
Public displayShotImpactsToggle As Boolean
Public displayResourceGuagesToggle As Boolean
Public displayMovementVectorsToggle As Boolean
Public SaveWithoutMutations As Boolean
Dim pro As Object

Public exitDB As Boolean
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, _
    ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Private Const KEYEVENTF_KEYUP = &H2

' Return the current contents of the screen or the active window
'
' It works by simulating the typing of the Print-Screen key
' (and Alt key if ActiveWindow is True), which dumps the screen
' to the clipboard. The original contents of the clipboard is then
' restored, but this action might affect the behavior of other
' applications that are monitoring the clipboard.

Function GetScreenBitmap(Optional ActiveWindow As Boolean) As Picture
    ' save the current picture in the clipboard, if any
    Dim pic As StdPicture
    Set pic = Clipboard.GetData(vbCFBitmap)
    
    ' Alt-Print Screen captures the active window only
    If ActiveWindow Then
        ' Press the Alt key
        keybd_event vbKeyMenu, 0, 0, 0
    End If
    ' Press the Print Screen key
    keybd_event vbKeySnapshot, 0, 0, 0
    DoEvents

    ' Release the Print Screen key
    keybd_event vbKeySnapshot, 0, KEYEVENTF_KEYUP, 0
    If ActiveWindow Then
        ' Release the Alt key
        keybd_event vbKeyMenu, 0, KEYEVENTF_KEYUP, 0
    End If
    DoEvents
    
    ' return the bitmap now in the clipboard
    Set GetScreenBitmap = Clipboard.GetData(vbCFBitmap)
    ' restore the original contents of the clipboard
    Clipboard.SetData pic, vbCFBitmap
    
End Function



Private Sub Smileys_Click()
  Form1.Smileys = Not Form1.Smileys
End Sub

Private Sub AddTenObstacles_Click()
  AddRandomObstacles (10)
End Sub

Private Sub calcium_Click()
  Gridmode = 8
  'DispGrid
End Sub

Private Sub CO2_Click()
  Gridmode = 6
  'DispGrid
End Sub

Private Sub DeleteAllShapes_Click()
  DeleteAllObstacles
End Sub

Private Sub DeleteShape_Click()
  If obstaclefocus <> 0 Then
    DeleteObstacle (obstaclefocus)
    obstaclefocus = 0
    DeleteShape.Enabled = False
  End If
End Sub

Private Sub DeleteTeleporterMenu_Click()
 If teleporterFocus <> 0 Then
    DeleteTeleporter (teleporterFocus)
    teleporterFocus = 0
    DeleteTeleporterMenu.Enabled = False
  End If
End Sub

Private Sub DeleteTeleportersMenu_Click()
  DeleteAllTeleporters
End Sub

Private Sub DeleteTenObstacles_Click()
  DeleteTenRandomObstacles
End Sub

Private Sub DisplayMovementVectors_Click()
  DisplayMovementVectors.Checked = Not DisplayMovementVectors.Checked
  displayMovementVectorsToggle = DisplayMovementVectors.Checked
End Sub

Private Sub DisplayResourceGuages_Click()
  DisplayResourceGuages.Checked = Not DisplayResourceGuages.Checked
  displayResourceGuagesToggle = DisplayResourceGuages.Checked
End Sub

Private Sub DisplayShotImpacts_Click()
  DisplayShotImpacts.Checked = Not DisplayShotImpacts.Checked
  displayShotImpactsToggle = DisplayShotImpacts.Checked
End Sub

Private Sub DNAexp_Click()
  DNA_Help.Show
End Sub

Private Sub DontDecayNrgShots_Click()
  DontDecayNrgShots.Checked = Not DontDecayNrgShots.Checked
  SimOpts.NoShotDecay = DontDecayNrgShots.Checked
  TmpOpts.NoShotDecay = DontDecayNrgShots.Checked
End Sub

Private Sub DrawSpiral_Click()
  Obstacles.DrawSpiral
End Sub

Private Sub fisica_Click()
  optionsform.SSTab1.Tab = 1
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub genact_Click()
  ActivForm.Show
End Sub

Private Sub HighLightTeleportersMenu_Click()
  HighLightTeleportersMenu.Checked = Not HighLightTeleportersMenu.Checked
  If HighLightTeleportersMenu.Checked Then
    HighLightAllTeleporters
  Else
    UnHighLightAllTeleporters
  End If
End Sub

Private Sub HorizontalMaze_Click()
  Obstacles.DrawHorizontalMaze
End Sub

Private Sub InvokeLens_Click()
  MagLens.Show
End Sub

Private Sub Leagues_Click()
 optionsform.SSTab1.Tab = 4
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub loadpiccy_Click()   'for some reason this doesn't work. I have given up on it for now
On Error GoTo fine
  optionsform.Visible = False
  CommonDialog1.DialogTitle = "Load a Background picture file"
  CommonDialog1.InitDir = "C:\"
  CommonDialog1.filename = ""
  CommonDialog1.Filter = "*.bmp|*.jpg"
  CommonDialog1.ShowOpen
  If CommonDialog1.filename <> "" Then Form1.BackPic = CommonDialog1.filename
  Form1.PiccyMode = True
  Form1.Newpic = True
  
  
  'Form1.AutoRedraw = True
  'Form1.Picture = LoadPicture(BackPic)
  
  'Form1.AutoRedraw = False
fine:

End Sub

Private Sub CheckerMaze_Click()
  Obstacles.DrawCheckerboardMaze
End Sub

Private Sub NewTeleportMenu_Click()
  TeleportForm.teleporterFormMode = 0
  TeleportForm.Show
End Sub

Private Sub PolarIce_Click()
  Obstacles.DrawPolarIceMaze
End Sub

Private Sub Profile_Click()
  Set pro = CreateObject("PROFILER.Profile.1")
  pro.Instrument ""
End Sub

Private Sub Recording_Click()
  optionsform.SSTab1.Tab = 6
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub RemovePiccy_Click()
  Form1.BackPic = ""
  Form1.Picture = Nothing
  Form1.PiccyMode = False
End Sub
'Private Sub DispGrid()
'  Form1.Active = False
'  Form1.SecTimer.Enabled = False
'  envir.DrawGrid Gridmode
'  Form1.DrawAllTies
'  Form1.DrawAllRobs
'  Form1.DrawShots
'End Sub

Private Sub Heat_Click()
  Gridmode = 9
  'DispGrid
End Sub

Private Sub O2_Click()
  Gridmode = 5
  'DispGrid
End Sub

Private Sub pause_Click()
  Form1.Active = Not Form1.Active
  Form1.SecTimer.Enabled = Not Form1.SecTimer.Enabled
End Sub

Private Sub Report_Click()
  pro.Report
End Sub

Private Sub robinf_Click()
  Dim n As Integer
  n = robfocus
  datirob.Show
  rob(n).genenum = CountGenes(rob(n).DNA)
  datirob.infoupdate n, rob(n).nrg, rob(n).parent, rob(n).Mutations, rob(n).age, rob(n).SonNumber, 1, rob(n).FName, rob(n).genenum, rob(n).LastMut, rob(n).generation, rob(n).DnaLen, rob(n).LastOwner, rob(n).Waste, rob(n).body, rob(n).mass, rob(n).venom, rob(n).shell, rob(n).Slime
End Sub
Private Sub mdiform1_keydown(KeyCode As Integer)
  If KeyCode <> 0 Then
    Form1.Active = False
    Form1.SecTimer.Enabled = False
  End If
End Sub

Private Sub SaveSimWithoutMutations_Click()
  SaveWithoutMutations = True
  simsave
End Sub

Private Sub ScreenSaverMode_Click()
Dim i As Integer
Dim pauseInterval As Single
  
  MDIForm1.Visible = False
  pauseInterval = Timer
  
  While pauseInterval <= Timer And Timer < pauseInterval + 1#
  Wend
    
  Form1.Picture = GetScreenBitmap()
  Form1.BackPic = "ScreenSaver"
  Form1.PiccyMode = True
  MDIForm1.Visible = True
  
  MDIForm1.WindowState = 0
  
  Const SWP_NOMOVE = 2
  Const SWP_NOSIZE = 1
  Const HWND_TOPMOST = -1
  Const HWND_NOTOPMOST = -2
  
  SimOpts.FieldHeight = Screen.Height
  SimOpts.FieldWidth = Screen.Width
  
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
  Form1.Height = Screen.Height
  Form1.Width = Screen.Width
  MDIForm1.Height = Screen.Height + 500
  MDIForm1.Width = Screen.Width + 100

  SetWindowPos MDIForm1.hwnd, HWND_TOPMOST, -5, -85, Screen.Width + 10, Screen.Height + 100, SWP_NOSIZE Or SWP_NOMOVE
  Me.Show
End Sub

Private Sub shapes_Click()
  ObstacleForm.InitShapesDialog
  ObstacleForm.Show
End Sub

Private Sub ShowVisionGrid_Click()
  ShowVisionGrid.Checked = Not ShowVisionGrid.Checked
  showVisionGridToggle = ShowVisionGrid.Checked
End Sub

Private Sub silica_Click()
  Gridmode = 7
  'DispGrid
End Sub

Private Sub Species_Click()
  optionsform.SSTab1.Tab = 0
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub Toolbar1_ButtonClick(ByVal button As MSComctlLib.button)
  Dim a As String
 
  Select Case button.key
    Case "newsim"
      NetEvent.Timer1.Enabled = False
      NetEvent.Hide
      optionsform.Show vbModal
      If Not optionsform.Canc Then
        Form1.Show
      End If
    Case "loadsim"
      simload
    Case "savesim"
      simsave
    Case "play"
      DisplayActivations = False
      Form1.Active = True
      Form1.SecTimer.Enabled = True
      Form1.unfocus
    Case "stop"
      DisplayActivations = False
      Form1.Active = False
      Form1.SecTimer.Enabled = False
    Case "cycle"
      DisplayActivations = False
      Consoleform.cycle 1
    Case "limit"
      limitgraphics = Not limitgraphics
      If limitgraphics Then
        button.value = tbrUnpressed
      Else
        button.value = tbrPressed
      End If
    Case "fast"
      oneonten = Not oneonten
    Case "wall"
      MuriForm.Show
    Case "best"
      robfocus = Form1.fittest
    Case "mutfreq"
      optionsform.SSTab1.Tab = 3
      NetEvent.Timer1.Enabled = False
      NetEvent.Hide
      optionsform.Show vbModal
    Case "physics"
      optionsform.SSTab1.Tab = 2
      NetEvent.Timer1.Enabled = False
      NetEvent.Hide
      optionsform.Show vbModal
    Case "costs"
      optionsform.SSTab1.Tab = 2
      NetEvent.Timer1.Enabled = False
      NetEvent.Hide
      optionsform.Show vbModal
    Case "noskin"
      Form1.dispskin = Not Form1.dispskin
    Case "nopoff"
      nopoff = Not nopoff
    Case "Flickermode"
      Form1.Flickermode = Not Form1.Flickermode
      If Form1.Flickermode Then
        button.value = tbrPressed
      Else
        button.value = tbrUnpressed
      End If
    Case "Novideo"
      visualize = Not visualize
      If visualize Then
        button.value = tbrUnpressed
        Form1.Label1.Visible = False
      Else
        button.value = tbrPressed
        Form1.Label1.Visible = True
      End If
    Case "insert"
      If Not insrob Then
        Form1.MousePointer = vbCrosshair
      Else
        Form1.MousePointer = vbArrow
      End If
      insrob = Not insrob
    Case "snapshot"
      Snapshot
    Case "smileymode"
      Form1.Smileys = Not Form1.Smileys
    Case "Stealth"
      'hide the program from the task bar
      Form1.t.Add
      stealthmode = True
      Me.Hide
    Case "Ignore"
      'ignores errors when it encounters them with the hope that they'll fix themselves
      ignoreerror = Not ignoreerror
      If ignoreerror Then
        button.value = tbrUnpressed
      Else
        button.value = tbrPressed
      End If
    
      
  End Select
End Sub

Private Sub Toolbar1_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
  Select Case ButtonMenu.key
    Case "pop"
      Form1.NewGraph 1, "Populations"
    Case "avgmut"
      Form1.NewGraph 2, "Mutations (Species Average)"
    Case "avgage"
      Form1.NewGraph 3, "Average Age (hundreds of cycles)"
    Case "avgsons"
      Form1.NewGraph 4, "Offspring (Species Average)"
    Case "avgnrg"
      Form1.NewGraph 5, "Energy (Species Average)"
    Case "avglen"
      Form1.NewGraph 6, "DNA length (Species Average)"
    Case "avgcond"
      Form1.NewGraph 7, "DNA Cond statements (Species Average)"
    Case "avgmutlen"
      Form1.NewGraph 8, "Mutations/DNA len (Species Average)"
    Case "simnrg"
      Form1.NewGraph 9, "Total Energy/Species (x1000)"
    Case "autocost"
      Form1.NewGraph 10, "Auto Cost Stats"
    
    Case "resgraph"
      If MsgBox("Are you sure you want to reset graphs?", vbOKCancel) = vbOK Then
        Form1.ResetGraphs
        Form1.FeedGraph (0) ' EricL 4/7/2006 Update the graphs right now instead of waiting until the next update
      End If
  End Select
End Sub

Private Sub about_Click()
  frmAbout.Show
End Sub

Private Sub autos_Click()
  optionsform.SSTab1.Tab = 6
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub col_Click()
  Form1.changerobcol
End Sub

Private Sub cons_Click()
  Consoleform.openconsole
End Sub

Private Sub costi_Click()
  optionsform.SSTab1.Tab = 2
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub czin_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  AspettaFlag = True
  ZoomInPremuto
End Sub

Private Sub czin_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
  AspettaFlag = False
End Sub

Public Sub ZoomIn()
  If Form1.visiblew > RobSize * 4 Then
    If robfocus > 0 Then
      xc = rob(robfocus).pos.x
      yc = rob(robfocus).pos.y
    Else
      xc = Form1.visiblew / 2 + Form1.ScaleLeft
      yc = Form1.visibleh / 2 + Form1.ScaleTop
    End If
    Form1.visiblew = Form1.visiblew / 1.02
    Form1.visibleh = Form1.visibleh / 1.02
    Form1.ScaleHeight = Form1.visibleh
    Form1.ScaleWidth = Form1.visiblew
    Form1.ScaleTop = yc - Form1.ScaleHeight / 2
    Form1.ScaleLeft = xc - Form1.ScaleWidth / 2
    Form1.Redraw
  End If
End Sub

Private Sub ZoomInPremuto()
  While AspettaFlag = True
    ZoomIn
    DoEvents
  Wend
End Sub

Private Sub ZoomOutPremuto()
  While AspettaFlag = True
    ZoomOut
    DoEvents
  Wend
End Sub

Private Sub czo_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  AspettaFlag = True
  ZoomOutPremuto
End Sub

Public Sub ZoomOut()
  Dim tvv As Long
  Dim thv As Long
  
  'EricL Prevents zooming out too far from causing an overflow
  If Form1.visiblew >= 10000000 Then Exit Sub
  If Form1.visibleh >= 10000000 Then Exit Sub
  
  xc = Form1.visiblew / 2 + Form1.ScaleLeft
  yc = Form1.visibleh / 2 + Form1.ScaleTop
  
  Form1.visiblew = Form1.visiblew / 0.98039
  Form1.visibleh = Form1.visibleh / 0.98039
  
  If Form1.visiblew > SimOpts.FieldWidth And ZoomLock.value = 0 Then
    Form1.visiblew = SimOpts.FieldWidth
    Form1.visibleh = SimOpts.FieldHeight
  End If
  
  If Form1.visibleh > SimOpts.FieldHeight And ZoomLock.value = 0 Then
    Form1.visiblew = SimOpts.FieldWidth
    Form1.visibleh = SimOpts.FieldHeight
  End If
  
  Form1.ScaleTop = yc - Form1.visibleh / 2
  Form1.ScaleLeft = xc - Form1.visiblew / 2
  
  If Form1.visiblew + Form1.ScaleLeft > SimOpts.FieldWidth And ZoomLock.value = 0 Then
    Form1.ScaleLeft = SimOpts.FieldWidth - Form1.visiblew
    Form1.ScaleTop = SimOpts.FieldHeight - Form1.visibleh
  End If
  
  If Form1.ScaleLeft < 0 And ZoomLock.value = 0 Then
    Form1.ScaleLeft = 0
  End If
  
  If Form1.ScaleTop < 0 And ZoomLock.value = 0 Then
    Form1.ScaleTop = 0
  End If
  
  Form1.ScaleHeight = Form1.visibleh
  Form1.ScaleWidth = Form1.visiblew
  Form1.Redraw
End Sub

Private Sub czo_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
 AspettaFlag = False
End Sub

Private Sub inssp_Click()
  On Error GoTo fine
  CommonDialog1.DialogTitle = "Load organism"
  CommonDialog1.filename = ""
  CommonDialog1.Filter = "Organism file(*.dbo)|*.dbo"
  CommonDialog1.InitDir = MainDir + "\robots"
  CommonDialog1.ShowOpen
  If CommonDialog1.filename <> "" Then InsertOrganism CommonDialog1.filename
  Exit Sub
fine:
  MsgBox "Organism not inserted"
End Sub

Private Sub killorg_Click()
  KillOrganism robfocus
End Sub

Private Sub listcont_Click()
  optionsform.SSTab1.Tab = 5
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub showlogs_Click()
  LogForm.Show
End Sub

Private Sub loadsim_Click(Index As Integer)
  simload
End Sub

Private Sub simload(Optional path As String)
  Dim i As Integer
  Dim path2 As String
   
  On Error GoTo fine ' Uncomment this line in the compiled version error.sim
  If path = "" Then
    optionsform.Visible = False
    CommonDialog1.DialogTitle = MBLoadSim
    CommonDialog1.InitDir = MDIForm1.MainDir + "\saves"
    CommonDialog1.filename = ""
    CommonDialog1.Filter = "Simulation(*.sim)|*.sim"
    CommonDialog1.ShowOpen
    If CommonDialog1.filename = "" Then
      Exit Sub
    Else
      path2 = CommonDialog1.filename
    End If
  Else
    path2 = path
  End If
      
  LoadSimulation path2
  
  MDIForm1.Caption = "DarwinBots 2.43 " + path2
  
  'EricL 4/7/2006 Populate the Add Species dropdown combo when sims loaded
  For i = 0 To SimOpts.SpeciesNum - 1
    MDIForm1.Combo1.additem SimOpts.Specie(i).Name
  Next i
  
  DisplayActivations = False ' EricL - Initialize the flag that controls displaying activations in the console
  
  Form1.startloaded
fine:

  If Err.Number <> 32755 Then
  MsgBox "An Error Occurred.  Darwinbots cannot continue.  Sorry.  " + Err.Description + " " + Err.Source + " " + Str$(Err.Number) + " " + Str$(Err.LastDllError) + ".", vbOKOnly
End If
Resume Next
End Sub


Private Sub MDIForm1_Click()
  InfoForm.Hide
  NetEvent.stayontop
End Sub

Private Sub MDIForm1_ThumbScroll()
  InfoForm.Hide
  NetEvent.stayontop
End Sub

Private Sub moltiplicatore_Click()
  optionsform.SSTab1.Tab = 3
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.Show vbModal
End Sub

Private Sub mutrat_Click()
  robmutchange
End Sub

' changes a robot's mutation rates
Public Sub robmutchange()
  '''''''''''''''''''''''''''''''''''''''''''''''''''''''
  Dim t As Integer
  Dim Specie As datispecie
  
  t = optionsform.CurrSpec
  Specie = TmpOpts.Specie(50)
  
  TmpOpts.Specie(50).Mutables = rob(robfocus).Mutables
  optionsform.CurrSpec = 50
  
  MutationsProbability.Show vbModal
  
  rob(robfocus).Mutables = TmpOpts.Specie(50).Mutables
  TmpOpts.Specie(50) = Specie
  optionsform.CurrSpec = t
End Sub

Private Sub par_Click()
  parentele.mostra
End Sub


Private Sub saveorg_Click()
  On Error GoTo fine
  CommonDialog1.DialogTitle = "Save organism"
  CommonDialog1.filename = ""
  CommonDialog1.Filter = "Organism file(*.dbo)|*.dbo"
  CommonDialog1.InitDir = MainDir + "\robots"
  CommonDialog1.ShowSave
  If CommonDialog1.filename <> "" Then SaveOrganism CommonDialog1.filename, robfocus
  Exit Sub
fine:
  MsgBox "Organism not saved"
End Sub

Private Sub savesim_Click()
  SaveWithoutMutations = False
  simsave
End Sub

Private Sub simsave()
  On Error GoTo fine
  CommonDialog1.DialogTitle = MBSaveSim
  CommonDialog1.filename = ""
  CommonDialog1.Filter = "Simulation(*.sim)|*.sim"
  CommonDialog1.InitDir = MDIForm1.MainDir + "\saves"
  CommonDialog1.ShowSave
  SaveSimulation CommonDialog1.filename
  Exit Sub
fine:
MsgBox "Saving sim failed.  " + Err.Description, vbOKOnly
End Sub

Private Sub MDIForm_Load()
Dim path As String

  globstrings
  strings Me
  MDIForm1.WindowState = 2
  MDIForm1.Caption = "DarwinBots 2.43"
  startdir = App.path
  MainDir = App.path
  
    
  'this little snippet insures that Numsgil can run his code alright
  If Left(MDIForm1.MainDir, 15) = "C:\darwinsource" Then _
    MDIForm1.MainDir = "C:\DarwinbotsII"
    
  ' Here's another hack like the above so that EricL can run in VB
  If Left(MDIForm1.MainDir, 51) = "C:\Documents and Settings\Eric\Desktop\DB VB Source" Then _
    MDIForm1.MainDir = "C:\Program Files\DarwinBotsII"
  
  disablesim
  SimOpts.FieldWidth = Me.Width
  SimOpts.FieldHeight = Me.Height
  Me.Show
  
  Set Form1.t = New TrayIcon
  Set Form1.t.OwnerForm = Form1
  Set Form1.t.Icon = MDIForm1.Icon
  Form1.t.Tooltip = "Darwinbots"
  
  'These are all defaults that might get overridden by the settings loaded below
  ShowVisionGrid.Checked = True
  showVisionGridToggle = True
  displayShotImpactsToggle = True
  displayResourceGuagesToggle = True
  displayMovementVectorsToggle = True
  TmpOpts.allowHorizontalShapeDrift = False
  TmpOpts.allowVerticalShapeDrift = False
  DeleteShape.Enabled = False
  mazeCorridorWidth = 500
  mazeWallThickness = 50
  TmpOpts.shapesAreSeeThrough = False
  HighLightTeleportersMenu.Checked = True
  HighLightAllTeleporters
  DontDecayNrgShots.Checked = False
  TmpOpts.NoShotDecay = False
  TmpOpts.chartingInterval = 200
  TmpOpts.FieldWidth = 16000
  TmpOpts.FieldHeight = 12000
  TmpOpts.MaxVelocity = 60
  TmpOpts.Costs(DYNAMICCOSTSENSITIVITY) = 50
  TmpOpts.DayNightCycleCounter = 0
  TmpOpts.Daytime = True
  TmpOpts.BadWastelevel = -1
  TmpOpts.FluidSolidCustom = 2 ' Default to custom for older settings files
  TmpOpts.CostRadioSetting = 2 ' Default to custom for older settings files
  TmpOpts.CoefficientElasticity = 0 ' Default for older settings files
  TmpOpts.NoShotDecay = False ' Default for older settings files
  TmpOpts.SunUpThreshold = 500000   'Set to a reasonable default value
  TmpOpts.SunUp = False   'Set to a reasonable default value
  TmpOpts.SunDownThreshold = 1000000   'Set to a reasonable default value
  TmpOpts.SunDown = False   'Set to a reasonable default value
  TmpOpts.AutoSaveStripMutations = False
  TmpOpts.AutoSaveDeleteOlderFiles = False
  TmpOpts.FixedBotRadii = False
  TmpOpts.SunThresholdMode = 0
  TmpOpts.PhysMoving = 0.66
  TmpOpts.EnergyExType = True
  TmpOpts.EnergyFix = 200
  TmpOpts.EnergyProp = 1
  TmpOpts.MaxEnergy = 100
  TmpOpts.MaxPopulation = 100
  TmpOpts.MinVegs = 50
  TmpOpts.RepopAmount = 10
  TmpOpts.RepopCooldown = 10
  TmpOpts.PhysBrown = 0.5
  DontDecayNrgShots.Checked = False
  TmpOpts.NoShotDecay = False
  
  EnableRobotsMenu
    
  optionsform.ReadSett MDIForm1.MainDir + "\settings\lastexit.set"
  If exitDB Then
    MDIForm_Unload (1)
    Exit Sub
  End If
    
  optionsform.datatolist
  'TmpOpts.Daytime = True ' Ericl March 15, 2006
 
  
  SimOpts = TmpOpts
  path = Command
  
  If path = "" Then
    InfoForm.Show
  Else
    If InStr(Command, """") <> 0 Then path = Replace(Command, """", "")
    If InStr(Command, "\") <> 0 Then
      simload path
    Else
      simload MDIForm1.MainDir + "\saves\" + path
    End If
  End If
End Sub

Public Function EnableRobotsMenu()

  MDIForm1.robinf.Enabled = True
  MDIForm1.par.Enabled = True
  MDIForm1.mutrat.Enabled = True
  MDIForm1.col.Enabled = True
  MDIForm1.cons.Enabled = True
  MDIForm1.genact.Enabled = True
  MDIForm1.ucci.Enabled = True
  MDIForm1.sdna.Enabled = True
  MDIForm1.selorg.Enabled = True
  MDIForm1.saveorg.Enabled = True
  MDIForm1.killorg.Enabled = True
End Function

Public Function DisableRobotsMenu()

  MDIForm1.robinf.Enabled = False
  MDIForm1.par.Enabled = False
  MDIForm1.mutrat.Enabled = False
  MDIForm1.col.Enabled = False
  MDIForm1.cons.Enabled = False
  MDIForm1.genact.Enabled = False
  MDIForm1.ucci.Enabled = False
  MDIForm1.sdna.Enabled = False
  MDIForm1.selorg.Enabled = False
  MDIForm1.saveorg.Enabled = False
  MDIForm1.killorg.Enabled = False
       
End Function



Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If MsgBox(MBsure, vbYesNo + vbExclamation, MBwarning) = vbYes Then
    Form1.Form_Unload 0
    datirob.Form_Unload 1
    MDIForm_Unload 0
  Else
    Cancel = 1
  End If
End Sub


Private Sub MDIForm_Resize()
'  Form1.dimensioni
  'InfoForm.ZOrder
End Sub
Private Sub MDIForm_Unload(Cancel As Integer)
   
  If optionsform.Visible = False Then
    TmpOpts = SimOpts
  End If
  optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set" 'save last settings
  End
End Sub

Sub infos(ByVal cyc As Single, tot As Integer, tnv As Integer, tv As Integer, brn As Long, totcyc As Long, tottim As Long)
  Dim sec As Long
  Dim Min As Long
  Dim h As Long
  Dim i As Integer
  Dim k As Integer
 ' Dim AvgSimEnergyLastHundredCycles As Long
  Dim AvgSimEnergyLastTenCycles As Long
  Dim delta As Double
  
  If tot = 0 Then Exit Sub
  StatusBar1.Panels(1).text = SBcycsec + Str$(Round(cyc, 3)) + " "
  StatusBar1.Panels(2).text = "Tot " + Str$(tot) + " "
  StatusBar1.Panels(3).text = "Bots " + Str$(tnv) + " "
  StatusBar1.Panels(4).text = "Vegs " + Str$(tv) + " "
  StatusBar1.Panels(5).text = SBborn + Str$(brn) + " "
  StatusBar1.Panels(6).text = "Cycles" + Str$(totcyc) + " "
  sec = tottim
  Min = Fix(sec / 60)
  sec = sec Mod 60
  h = Fix(Min / 60)
  Min = Min Mod 60
  StatusBar1.Panels(7).text = Str$(h) + "h" + Str$(Min) + "m" + Str$(sec) + "s  "
  StatusBar1.Panels(8).text = "Mut " + Str$(SimOpts.MutCurrMult) + "x "
  StatusBar1.Panels(9).text = "Restarts " + Str$(ReStarts) + " "
  StatusBar1.Panels(10).text = "Shots " + Str$(Shots_Module.ShotsThisCycle) + " "
  
  AvgSimEnergyLastTenCycles = 0
  'This delibertly counts the 10 cycles *before* this one to avoid cases where the timer invokes
  'this routine before the calculations for the current energy cycle have completed.
  For i = 99 To 90 Step -1
    k = (CurrentEnergyCycle + i) Mod 100
    AvgSimEnergyLastTenCycles = AvgSimEnergyLastTenCycles + (TotalSimEnergy(k) * 0.1)
  Next i
  
' AvgSimEnergyLastHundredCycles = AvgSimEnergyLastTenCycles
'    k = (CurrentEnergyCycle + 100 - i) Mod 100
'    AvgSimEnergyLastHundredCycles = AvgSimEnergyLastHundredCycles + TotalSimEnergy(k)
 ' Next i
 ' AvgSimEnergyLastTenCycles = AvgSimEnergyLastTenCycles * 0.1
 ' AvgSimEnergyLastHundredCycles = AvgSimEnergyLastHundredCycles * 0.01

  If AvgSimEnergyLastTenCycles <> 0 Then delta = TotalSimEnergyDisplayed - AvgSimEnergyLastTenCycles
  
  StatusBar1.Panels(11).text = "Nrg " + Str$(TotalSimEnergyDisplayed) + " "
  StatusBar1.Panels(12).text = "Delta " + Str$(Round(delta, 5)) + " "
  StatusBar1.Panels(13).text = "CostX " + Str$(Round(SimOpts.Costs(COSTMULTIPLIER), 5)) + " "
End Sub

Private Sub newsim_Click(Index As Integer)
  TmpOpts = SimOpts
  NetEvent.Timer1.Enabled = False
  NetEvent.Hide
  optionsform.SSTab1.Tab = 0 ' EricL 3/29/2006 Insures we start at the first tab when starting a new sim
  optionsform.Show
End Sub

Private Sub quit_Click()
  MDIForm_QueryUnload 0, 0
  If MsgBox(MBsure, vbYesNo + vbExclamation, MBwarning) = vbYes = vbYes Then MDIForm_Unload 0
End Sub

Private Sub sdna_Click()
  robsave
End Sub

Private Sub robsave()
  On Error GoTo fine
  CommonDialog1.DialogTitle = MBSaveDNA
  CommonDialog1.filename = ""
  CommonDialog1.Filter = "DNA file(*.txt)|*.txt"
  CommonDialog1.InitDir = MainDir + "\robots"
  CommonDialog1.ShowSave
  If CommonDialog1.filename <> "" Then salvarob robfocus, CommonDialog1.filename
  Exit Sub
fine:
  MsgBox MBDNANotSaved
End Sub

Private Sub selorg_Click()
  FreezeOrganism robfocus
End Sub

Private Sub TrashCompactor_Click()
  Obstacles.InitTrashCompactorMaze
End Sub

Private Sub ucci_Click()
  KillRobot -1
End Sub

Private Sub VerticaMaze_Click()
  Obstacles.DrawVerticalMaze
End Sub

Private Sub walls_Click()
  MuriForm.Show
End Sub

Public Sub enablesim()
  edit.Enabled = True
  popup.Enabled = True
  czin.Enabled = True
  czo.Enabled = True
End Sub

Public Sub disablesim()
 ' edit.Enabled = False
 ' popup.Enabled = False
 ' czin.Enabled = False
 ' czo.Enabled = False
End Sub

Private Sub waste_Click()
  Gridmode = 1
  'DispGrid
End Sub

Private Sub ZoomLock_Click()
  If Not MDIForm1.ZoomLock Then
     Form1.visiblew = Screen.Width / Screen.Height * 4 / 3 * Form1.visibleh
  Else
     Form1.visiblew = 0.75 * Form1.visibleh
  End If
       
End Sub
