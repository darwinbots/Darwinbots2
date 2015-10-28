VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmGset 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Global Settings"
   ClientHeight    =   5700
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   10770
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5700
   ScaleWidth      =   10770
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8160
      TabIndex        =   2
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   9480
      TabIndex        =   1
      Top             =   5280
      Width           =   1215
   End
   Begin TabDlg.SSTab tb 
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10755
      _ExtentX        =   18971
      _ExtentY        =   9128
      _Version        =   393216
      Style           =   1
      Tabs            =   4
      TabsPerRow      =   4
      TabHeight       =   520
      BackColor       =   12632256
      TabCaption(0)   =   "Main settings"
      TabPicture(0)   =   "frmGset.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "ffmUI"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "ffmCheatin"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Frame1"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "ffmMainDir"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "chkSafeMode"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "ffmFBSBO"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "ffmInitChlr"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "chkEpiGene"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "chkIntRnd"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).ControlCount=   9
      TabCaption(1)   =   "Mutations"
      TabPicture(1)   =   "frmGset.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "ffmEpiReset"
      Tab(1).Control(1)=   "ffmSunMut"
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "Leagues"
      TabPicture(2)   =   "frmGset.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "chkFilter"
      Tab(2).Control(1)=   "Command1"
      Tab(2).Control(2)=   "chkAddarob"
      Tab(2).Control(3)=   "ffmDisqualification"
      Tab(2).Control(4)=   "ffmFudge"
      Tab(2).Control(5)=   "chkStepladder"
      Tab(2).Control(6)=   "txtSourceDir"
      Tab(2).Control(7)=   "chkTournament"
      Tab(2).Control(8)=   "lblSource"
      Tab(2).ControlCount=   9
      TabCaption(3)   =   "Evolution"
      TabPicture(3)   =   "frmGset.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "ffmSurvival"
      Tab(3).Control(1)=   "chkSurvivalSimple"
      Tab(3).Control(2)=   "ffmZeroBot"
      Tab(3).Control(3)=   "chkZBmode"
      Tab(3).Control(4)=   "chkSurvivalEco"
      Tab(3).Control(5)=   "btnEvoRES"
      Tab(3).ControlCount=   6
      Begin VB.CheckBox chkIntRnd 
         Caption         =   "Use Internet Pictures to seed Randomizer"
         Height          =   255
         Left            =   7080
         TabIndex        =   93
         Top             =   1920
         Width           =   3375
      End
      Begin VB.CheckBox chkEpiGene 
         Caption         =   "Save epigenetic memory as a temporary gene when saving robot DNA to file.        Warning: This uses delgene."
         Height          =   375
         Left            =   5520
         TabIndex        =   92
         Top             =   4560
         Width           =   4815
      End
      Begin VB.CheckBox chkFilter 
         Caption         =   "Filter by specific robot"
         Height          =   195
         Left            =   -72000
         TabIndex        =   91
         Top             =   2280
         Width           =   5415
      End
      Begin VB.CommandButton Command1 
         Caption         =   "League Restrictions"
         Height          =   375
         Left            =   -68880
         TabIndex        =   87
         Top             =   4080
         Width           =   2175
      End
      Begin VB.CommandButton btnEvoRES 
         Caption         =   "Evolution Restrictions"
         Height          =   375
         Left            =   -74760
         TabIndex        =   86
         Top             =   3480
         Width           =   2175
      End
      Begin VB.CheckBox chkAddarob 
         Caption         =   "Add a single robot to existing league"
         Height          =   195
         Left            =   -70200
         TabIndex        =   85
         Top             =   1920
         Visible         =   0   'False
         Width           =   5415
      End
      Begin VB.CheckBox chkSurvivalEco 
         Caption         =   "Eco Survival Mode"
         Height          =   255
         Left            =   -71040
         TabIndex        =   67
         Top             =   4080
         Width           =   2295
      End
      Begin VB.CheckBox chkZBmode 
         Caption         =   "Zerobot Mode"
         Height          =   255
         Left            =   -72600
         TabIndex        =   84
         Top             =   4080
         Width           =   2295
      End
      Begin VB.Frame ffmZeroBot 
         Caption         =   "Zerobot settings"
         Height          =   1095
         Left            =   -67680
         TabIndex        =   81
         Top             =   600
         Visible         =   0   'False
         Width           =   2175
         Begin VB.TextBox txtZlength 
            Height          =   375
            Left            =   720
            TabIndex        =   82
            Text            =   "128"
            Top             =   480
            Width           =   1215
         End
         Begin VB.Label lblZlength 
            Caption         =   "Initial length:"
            Height          =   495
            Left            =   120
            TabIndex        =   83
            Top             =   360
            Width           =   615
         End
      End
      Begin VB.CheckBox chkSurvivalSimple 
         Caption         =   "Simple Survival Mode"
         Height          =   255
         Left            =   -74640
         TabIndex        =   80
         Top             =   4080
         Width           =   2295
      End
      Begin VB.Frame ffmSurvival 
         Caption         =   "Survival Mode Settings"
         Height          =   2775
         Left            =   -74760
         TabIndex        =   68
         Top             =   600
         Visible         =   0   'False
         Width           =   6855
         Begin VB.CheckBox chkNormSize 
            Caption         =   "Dynamically normalize DNA size"
            Height          =   255
            Left            =   120
            TabIndex        =   76
            Top             =   2400
            Visible         =   0   'False
            Width           =   2655
         End
         Begin VB.CheckBox chkIM 
            Caption         =   "Start with IM on"
            Height          =   255
            Left            =   3000
            TabIndex        =   75
            Top             =   2400
            Visible         =   0   'False
            Width           =   1935
         End
         Begin VB.TextBox txtCycSM 
            Height          =   375
            Left            =   2520
            TabIndex        =   74
            Text            =   "1500"
            Top             =   1080
            Width           =   855
         End
         Begin VB.CheckBox chkShowGraphs 
            Caption         =   "Auto run Population, Mutation, Total energy graphs with saving enabled"
            Height          =   375
            Left            =   120
            TabIndex        =   73
            Top             =   2040
            Width           =   5895
         End
         Begin VB.TextBox txtRob 
            Height          =   405
            Left            =   120
            TabIndex        =   72
            Top             =   480
            Width           =   5415
         End
         Begin VB.CommandButton btnBrowseRob 
            Caption         =   "Browse..."
            Height          =   375
            Left            =   5640
            TabIndex        =   71
            Top             =   480
            Width           =   1095
         End
         Begin VB.TextBox txtLFOR 
            Height          =   375
            Left            =   2760
            TabIndex        =   70
            Text            =   "2"
            Top             =   1560
            Width           =   945
         End
         Begin VB.CommandButton btnHelp 
            Caption         =   "?"
            Height          =   255
            Left            =   4320
            TabIndex        =   69
            Top             =   1650
            Width           =   255
         End
         Begin VB.Label lblCycSM 
            Caption         =   "Initial reintroduction on/off length  XXXXXXXX cycles"
            Height          =   255
            Left            =   120
            TabIndex        =   79
            Top             =   1150
            Width           =   4215
         End
         Begin VB.Label lblRob 
            Caption         =   "Source Robot"
            Height          =   375
            Left            =   120
            TabIndex        =   78
            Top             =   240
            Width           =   1935
         End
         Begin VB.Label lblLFOR 
            Caption         =   "Initial population oscillation reduction   XXXXXXXX units"
            Height          =   255
            Left            =   120
            TabIndex        =   77
            Top             =   1635
            Width           =   5535
         End
      End
      Begin VB.Frame ffmDisqualification 
         Caption         =   "Disqualification Rules on Contest"
         Height          =   975
         Left            =   -72120
         TabIndex        =   63
         Top             =   3720
         Width           =   3015
         Begin VB.OptionButton optDisqua 
            Caption         =   "F3"
            Height          =   255
            Index           =   2
            Left            =   1920
            TabIndex        =   66
            ToolTipText     =   "Look for Disqualifications.txt in your main directory."
            Top             =   480
            Width           =   735
         End
         Begin VB.OptionButton optDisqua 
            Caption         =   "F2"
            Height          =   255
            Index           =   1
            Left            =   1200
            TabIndex        =   65
            ToolTipText     =   "Look for Disqualifications.txt in your main directory."
            Top             =   480
            Width           =   615
         End
         Begin VB.OptionButton optDisqua 
            Caption         =   "None"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   64
            Top             =   480
            Value           =   -1  'True
            Width           =   855
         End
      End
      Begin VB.Frame ffmInitChlr 
         Caption         =   "Advanced Chloroplast Options"
         Height          =   975
         Left            =   4920
         TabIndex        =   60
         Top             =   3480
         Width           =   5655
         Begin VB.TextBox txtStartChlr 
            Height          =   375
            Left            =   2400
            TabIndex        =   61
            Text            =   "0"
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label lblStartChlr 
            Caption         =   "Start Repopulating Robots with  XXXXXXXXXXXXX  Chloroplasts"
            Height          =   255
            Left            =   120
            TabIndex        =   62
            Top             =   435
            Width           =   5295
         End
      End
      Begin VB.Frame ffmFudge 
         Caption         =   "Fudging on F1 Contest"
         Height          =   975
         Left            =   -72120
         TabIndex        =   56
         Top             =   2640
         Width           =   5535
         Begin VB.OptionButton optFudging 
            Caption         =   "All possible recognition methods"
            Height          =   255
            Index           =   2
            Left            =   2760
            TabIndex        =   59
            Top             =   480
            Width           =   2655
         End
         Begin VB.OptionButton optFudging 
            Caption         =   "Eyes only"
            Height          =   255
            Index           =   1
            Left            =   1440
            TabIndex        =   58
            Top             =   480
            Width           =   1095
         End
         Begin VB.OptionButton optFudging 
            Caption         =   "None"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   57
            Top             =   480
            Value           =   -1  'True
            Width           =   1095
         End
      End
      Begin VB.CheckBox chkStepladder 
         Caption         =   "Stepladder league     (click for more options)"
         Height          =   195
         Left            =   -72000
         TabIndex        =   55
         Top             =   1920
         Width           =   5415
      End
      Begin VB.TextBox txtSourceDir 
         Height          =   405
         Left            =   -72000
         TabIndex        =   54
         Text            =   "C:\"
         Top             =   960
         Visible         =   0   'False
         Width           =   5415
      End
      Begin VB.CheckBox chkTournament 
         Caption         =   "Tournament league"
         Height          =   195
         Left            =   -72000
         TabIndex        =   52
         Top             =   1560
         Width           =   1815
      End
      Begin VB.Frame ffmSunMut 
         Caption         =   "Sunline Mutations"
         Height          =   3775
         Left            =   -74160
         TabIndex        =   30
         Top             =   1280
         Width           =   9135
         Begin MSComctlLib.Slider sldMain 
            Height          =   285
            Left            =   7080
            TabIndex        =   50
            ToolTipText     =   "Probability Delta2 Chance"
            Top             =   960
            Visible         =   0   'False
            Width           =   1935
            _ExtentX        =   3413
            _ExtentY        =   503
            _Version        =   393216
            Max             =   100
            TickFrequency   =   10
         End
         Begin VB.TextBox txtWTC 
            Height          =   285
            Left            =   6960
            TabIndex        =   48
            ToolTipText     =   "Oscillation between type and value"
            Top             =   1920
            Width           =   615
         End
         Begin VB.TextBox txtMxDnalen 
            Height          =   285
            Left            =   6240
            TabIndex        =   46
            Top             =   2760
            Width           =   615
         End
         Begin VB.TextBox txtDnalen 
            Height          =   285
            Left            =   3600
            TabIndex        =   44
            Top             =   2760
            Width           =   615
         End
         Begin VB.CheckBox chkNorm 
            Caption         =   "Normalize default mutation rates and slowest possible rate based on DNA length"
            Height          =   255
            Left            =   120
            TabIndex        =   43
            Top             =   2400
            Width           =   6015
         End
         Begin VB.TextBox txtPMinter 
            Height          =   285
            Left            =   4320
            TabIndex        =   42
            Top             =   1920
            Width           =   615
         End
         Begin VB.TextBox txtDevLn 
            Height          =   285
            Left            =   6480
            TabIndex        =   40
            Top             =   1440
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.TextBox txtDevExp 
            Height          =   285
            Left            =   5280
            TabIndex        =   38
            Top             =   1440
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.TextBox txtMainLn 
            Height          =   285
            Left            =   6240
            TabIndex        =   37
            Top             =   960
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.TextBox txtMainExp 
            Height          =   285
            Left            =   4995
            TabIndex        =   35
            Top             =   960
            Visible         =   0   'False
            Width           =   615
         End
         Begin VB.CheckBox chkDelta2 
            Caption         =   "Enable Delta2 Mutations"
            Height          =   255
            Left            =   120
            TabIndex        =   34
            Top             =   600
            Width           =   2055
         End
         Begin VB.PictureBox picIcon 
            AutoSize        =   -1  'True
            ClipControls    =   0   'False
            Height          =   540
            Left            =   120
            Picture         =   "frmGset.frx":0070
            ScaleHeight     =   337.12
            ScaleMode       =   0  'User
            ScaleWidth      =   337.12
            TabIndex        =   33
            Top             =   3120
            Width           =   540
         End
         Begin VB.CheckBox chkSunbelt 
            Caption         =   "Enable Point2, CopyError2, Amplification, and Translocation Mutations"
            Height          =   255
            Left            =   120
            TabIndex        =   32
            Top             =   300
            Width           =   5295
         End
         Begin MSComctlLib.Slider sldDev 
            Height          =   285
            Left            =   7080
            TabIndex        =   51
            ToolTipText     =   "Mean/Stddev Delta2 Chance"
            Top             =   1440
            Visible         =   0   'False
            Width           =   1935
            _ExtentX        =   3413
            _ExtentY        =   503
            _Version        =   393216
            Max             =   100
            TickFrequency   =   10
         End
         Begin VB.Label lblD2 
            Alignment       =   2  'Center
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Click here for some really advanced delta2 settings."
            Height          =   255
            Left            =   2640
            TabIndex        =   88
            Top             =   1200
            Width           =   6135
         End
         Begin VB.Label lblChance 
            Caption         =   "Chance of mutation %"
            Height          =   255
            Left            =   7200
            TabIndex        =   49
            Top             =   720
            Visible         =   0   'False
            Width           =   1575
         End
         Begin VB.Label lblWTC 
            Caption         =   "Delta2 for value(s) of what to change:     ±"
            Height          =   495
            Left            =   5280
            TabIndex        =   47
            ToolTipText     =   "Oscillation between type and value"
            Top             =   1800
            Width           =   1575
         End
         Begin VB.Label lblDnalen 
            Caption         =   "DNA length *    XXXX     Slowest rate DNA length * "
            Height          =   255
            Left            =   2520
            TabIndex        =   45
            Top             =   2760
            Width           =   4455
         End
         Begin VB.Label lblPMDelta2 
            Caption         =   "Delta2 cycle interval for Point mutations:"
            Height          =   495
            Left            =   2520
            TabIndex        =   41
            Top             =   1800
            Width           =   1695
         End
         Begin VB.Label lblMmean 
            Caption         =   "Mean/Stddev:    Multiply by (10 ^ ± 1/   XXXX   ) ± Liner"
            Height          =   375
            Left            =   2520
            TabIndex        =   39
            Top             =   1440
            Visible         =   0   'False
            Width           =   4335
         End
         Begin VB.Label lblMmain 
            Caption         =   "Probablity:    Multiply by (10 ^ ± 1/   XXXX   ) ± Liner"
            Height          =   375
            Left            =   2520
            TabIndex        =   36
            Top             =   960
            Visible         =   0   'False
            Width           =   3975
         End
         Begin VB.Label lblExplMut 
            Caption         =   $"frmGset.frx":0CB2
            Height          =   600
            Left            =   720
            TabIndex        =   31
            Top             =   3100
            Width           =   8175
         End
      End
      Begin VB.Frame ffmEpiReset 
         Caption         =   "Epigenetic Reset"
         Height          =   735
         Left            =   -73440
         TabIndex        =   23
         Top             =   460
         Width           =   7575
         Begin VB.TextBox txtOP 
            Height          =   375
            Left            =   6840
            TabIndex        =   27
            Text            =   "17"
            ToolTipText     =   "This is how much exponential amplified mutations a robot must have in order to trigger an epigenetic memory reset."
            Top             =   240
            Width           =   615
         End
         Begin VB.TextBox txtMEmp 
            Height          =   375
            Left            =   4920
            TabIndex        =   25
            Text            =   "1.3"
            ToolTipText     =   $"frmGset.frx":0DC4
            Top             =   240
            Width           =   615
         End
         Begin VB.CheckBox chkEpiReset 
            Caption         =   "Periodically reset Epigenetic memory"
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   300
            Width           =   2895
         End
         Begin VB.Label lblOP 
            Caption         =   "overload point:"
            Height          =   255
            Left            =   5640
            TabIndex        =   28
            Top             =   240
            Width           =   1215
         End
         Begin VB.Label lblMEmp 
            Caption         =   "mutation amplification:"
            Height          =   255
            Left            =   3240
            TabIndex        =   26
            Top             =   240
            Width           =   1695
         End
      End
      Begin VB.Frame ffmFBSBO 
         Caption         =   "Find Best Settings base on:"
         Height          =   915
         Left            =   4920
         TabIndex        =   16
         Top             =   2280
         Width           =   5655
         Begin MSComctlLib.Slider sldFindBest 
            Height          =   570
            Left            =   1320
            TabIndex        =   17
            TabStop         =   0   'False
            Top             =   240
            Width           =   2955
            _ExtentX        =   5212
            _ExtentY        =   1005
            _Version        =   393216
            LargeChange     =   40
            Max             =   200
            TickStyle       =   2
            TickFrequency   =   10
         End
         Begin VB.Label lblTP 
            Caption         =   "Total Population"
            Height          =   195
            Left            =   120
            TabIndex        =   19
            Top             =   420
            Width           =   1215
         End
         Begin VB.Label lblIE 
            Caption         =   "Invested Energy"
            Height          =   195
            Left            =   4300
            TabIndex        =   18
            Top             =   420
            Width           =   1200
         End
      End
      Begin VB.CheckBox chkSafeMode 
         Caption         =   "Use Safe Mode"
         Height          =   255
         Left            =   5160
         TabIndex        =   15
         Top             =   1920
         Width           =   1575
      End
      Begin VB.Frame ffmMainDir 
         Caption         =   "Main Directory"
         Height          =   1215
         Left            =   4920
         TabIndex        =   12
         Top             =   480
         Width           =   5655
         Begin VB.TextBox txtCD 
            Height          =   375
            Left            =   120
            TabIndex        =   14
            Text            =   "Text1"
            Top             =   720
            Width           =   5415
         End
         Begin VB.CheckBox chkUseCD 
            Caption         =   "Change Directory"
            Height          =   195
            Left            =   120
            TabIndex        =   13
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Randomization"
         Height          =   1095
         Left            =   120
         TabIndex        =   9
         Top             =   3960
         Width           =   4695
         Begin VB.CheckBox chkchseedloadsim 
            Caption         =   "Generate new seed when you click 'Load Simulation'"
            Height          =   375
            Left            =   240
            TabIndex        =   11
            Top             =   600
            Width           =   4275
         End
         Begin VB.CheckBox chkchseedstartnew 
            Caption         =   "Generate new seed when you click 'Start new'"
            Height          =   375
            Left            =   240
            TabIndex        =   10
            Top             =   240
            Width           =   4275
         End
      End
      Begin VB.Frame ffmCheatin 
         Caption         =   "Cheating Prevention"
         Height          =   1575
         Left            =   120
         TabIndex        =   5
         Top             =   2375
         Width           =   4695
         Begin VB.CheckBox chkGreedy 
            Caption         =   "Kill robots that are excessively greedy to there kids, using them to dump there energy."
            Height          =   375
            Left            =   240
            TabIndex        =   8
            Top             =   960
            Width           =   3615
         End
         Begin VB.TextBox txtBodyFix 
            Height          =   375
            Left            =   1200
            TabIndex        =   7
            Text            =   "32100"
            Top             =   480
            Width           =   1455
         End
         Begin VB.Label CheatinLab 
            Caption         =   "Kill robots that have more then this amound of body to prevent BigBerthas:"
            Height          =   615
            Left            =   120
            TabIndex        =   6
            Top             =   240
            Width           =   4455
         End
      End
      Begin VB.Frame ffmUI 
         Caption         =   "UI Settings"
         Height          =   2000
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   4695
         Begin VB.CheckBox chkHide 
            Caption         =   "Hide Darwinbots on restart mode in system tray"
            Height          =   255
            Left            =   240
            TabIndex        =   90
            Top             =   1650
            Width           =   3975
         End
         Begin VB.CheckBox chkScreenRatio 
            Caption         =   "Fix Screen Ratio when simulation starts"
            Height          =   255
            Left            =   240
            TabIndex        =   4
            Top             =   270
            Width           =   3075
         End
         Begin VB.CheckBox chkGraphUp 
            Caption         =   "Automatically assume to keep updating graphs"
            Height          =   255
            Left            =   240
            TabIndex        =   89
            Top             =   1365
            Width           =   3975
         End
         Begin VB.CheckBox chkNoVid 
            Caption         =   "Turn off Video when simulation starts"
            Height          =   255
            Left            =   240
            TabIndex        =   22
            Top             =   1080
            Width           =   3495
         End
         Begin VB.CheckBox chkNoBoyMsg 
            Caption         =   "Don't display Buoyancy Warning"
            Height          =   255
            Left            =   240
            TabIndex        =   21
            Top             =   810
            Width           =   2775
         End
         Begin VB.CheckBox chkOldColor 
            Caption         =   "Use old simulation colors"
            Height          =   375
            Left            =   240
            TabIndex        =   20
            Top             =   480
            Width           =   3075
         End
      End
      Begin VB.Label lblSource 
         Caption         =   "Source Directory"
         Height          =   375
         Left            =   -72000
         TabIndex        =   53
         Top             =   720
         Visible         =   0   'False
         Width           =   1935
      End
   End
   Begin VB.Label lbl 
      Caption         =   "Note: To reset all values delete global.gset file from your main directory."
      Height          =   255
      Left            =   120
      TabIndex        =   29
      Top             =   5400
      Width           =   7455
   End
End
Attribute VB_Name = "frmGset"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 3/15/2013 The global settings form
Dim robpath As String

Private Sub btnBrowseRob_Click()
On Error GoTo fine
  optionsform.CommonDialog1.FileName = ""
  optionsform.CommonDialog1.Filter = "Dna file(*.txt)|*.txt" 'Botsareus 1/11/2013 DNA only
  optionsform.CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
  optionsform.CommonDialog1.DialogTitle = WSchoosedna
  optionsform.CommonDialog1.ShowOpen
  If optionsform.CommonDialog1.FileName <> "" Then 'Botsareus 1/11/2013 Do not insert robot if filename is blank
   txtRob = optionsform.CommonDialog1.FileName
  End If
fine:
End Sub

Private Sub btnCancel_Click()
'cancel has been pressed
Unload Me
End Sub


Private Sub btnEvoRES_Click()
    frmRestriOps.res_state = 4
    frmRestriOps.Show vbModal
End Sub

Private Sub btnHelp_Click()
MsgBox "Survival mode consists of a base species and a mutating species. The base species gets 'turned on and off.'" & _
" The mutating species get there energy changed during the time the base species are 'not updating.'" & _
" This is a handicap for the Base species. Because, a negative value means mutating species are losing energy." & vbCrLf _
& vbCrLf & "Formula1:" & vbCrLf _
& "new_value = ((Average energy gain with Base.txt on (species average, time average)) minus " & _
"(Average energy gain with Base.txt off (species average, time average))) / (LFOR / 3) " & vbCrLf & _
"If new_value is less then old_value then current_value = new_value else current_value = (old_value * 9 + new_value) / 10 " _
& vbCrLf & "Formula 2:" & vbCrLf _
& "((Average energy gain last on/off cycle (species average, time average)) minus " & _
"(Average energy gain this on/off cycle (species average, time average))) / (LFOR / 3) * 2 " & vbCrLf & _
"Result = Formula1 minus Formula2 or just Formula1 if Formula2 is greater then zero. Result takes full effect after 6 on/off cycles." _
& vbCrLf & vbCrLf & "For current simulation's data go to the help menu." _
& vbCrLf & vbCrLf & "www.darwinbots.com", vbInformation, "Dev. By: Paul Kononov a.k.a. Botsareus"
End Sub

Private Sub btnOK_Click()
'Botsareus 5/10/2013 Make sure txtCD points to a valid directory
If Not FolderExists(txtCD.text) And chkUseCD.value = 1 Then
 MsgBox "Please use a valid directory for the main directory.", vbCritical
 Exit Sub
End If

If chkUseCD.value = 0 Then
 'delete the maindir setting if no longer used
 If dir(App.path & "\Maindir.gset") <> "" Then Kill (App.path & "\Maindir.gset")
Else
 'write current path to setting
     Open App.path & "\Maindir.gset" For Output As #1
      Write #1, txtCD.text
     Close #1
End If

    Dim specielist As String
    specielist = ""
    Dim i As Integer

  
'Botsareus 1/31/2014 The league modes
If txtSourceDir.Visible Then
    If txtCD <> MDIForm1.MainDir Then
        MsgBox "Can not start a league while changing main directory.", vbCritical
        txtCD = MDIForm1.MainDir
        Exit Sub
    End If
    If txtSourceDir.text = MDIForm1.MainDir & "\league" Or txtSourceDir.text Like MDIForm1.MainDir & "\league\*" Then
        MsgBox "League source directory can not be the same as league engine directory.", vbCritical
        Exit Sub
    End If
    If Not FolderExists(txtSourceDir.text) Then
        MsgBox "Please use a valid directory for the league source directory.", vbCritical
        Exit Sub
    End If
    If FolderExists(MDIForm1.MainDir & "\league") Then
        If MsgBox("The current league will be restarted. Continue?", vbYesNo + vbQuestion) = vbYes Then
            RecursiveRmDir MDIForm1.MainDir & "\league"
        Else
            Exit Sub
        End If
    End If
    'create folder
    RecursiveMkDir MDIForm1.MainDir & "\league"
    RecursiveMkDir MDIForm1.MainDir & "\league\seeded"
    RecursiveMkDir MDIForm1.MainDir & "\league\stepladder"
    'generate list of species that are not repopulating
    For i = 0 To UBound(TmpOpts.Specie)
        If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
            specielist = specielist & TmpOpts.Specie(i).Name & vbNewLine
        End If
    Next
    'remove all nonrepopulating robots
    If specielist <> "" Then
        If MsgBox("The following robots must be removed first:" & vbCrLf & vbCrLf & specielist & vbCrLf & "Continue?", vbYesNo + vbQuestion) = vbYes Then
            For i = 0 To UBound(TmpOpts.Specie)
                If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
                    optionsform.SpecList.ListIndex = i
                    optionsform.DelSpec_Click
                    i = i - 1
                End If
            Next
        Else
            If x_restartmode = 1 Or x_restartmode = 2 Or x_restartmode = 3 Or x_restartmode = 10 Then  'Botsareus 10/6/2015 Bug fix
             Kill App.path & "\restartmode.gset"
             x_restartmode = 0
            End If
            Exit Sub
        End If
    End If
End If

'2/16/2014 Evolution modes
If chkSurvivalSimple.value = 1 Or chkSurvivalEco.value = 1 Then
    If txtCD <> MDIForm1.MainDir Then
        MsgBox "Can not start a evolution mode while changing main directory.", vbCritical
        txtCD = MDIForm1.MainDir
        Exit Sub
    End If
    If extractpath(txtRob) = MDIForm1.MainDir & "\evolution" Or extractpath(txtRob) Like MDIForm1.MainDir & "\evolution\*" Then
        MsgBox "Robot source directory can not be the same as evolution engine directory.", vbCritical
        Exit Sub
    End If
    If dir(txtRob) = "" Or txtRob = "" Then
        MsgBox "Please use a valid file name for robot.", vbCritical
        Exit Sub
    End If
    If FolderExists(MDIForm1.MainDir & "\evolution") Then
        If MsgBox("The current evolution mode will be restarted. Continue?", vbYesNo + vbQuestion) = vbYes Then
            RecursiveRmDir MDIForm1.MainDir & "\evolution"
        Else
            Exit Sub
        End If
    End If
    'the folders
    RecursiveMkDir MDIForm1.MainDir & "\evolution"
    RecursiveMkDir MDIForm1.MainDir & "\evolution\stages"
    'generate list of species that are not repopulating
    For i = 0 To UBound(TmpOpts.Specie)
        If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
            specielist = specielist & TmpOpts.Specie(i).Name & vbNewLine
        End If
    Next
    'remove all nonrepopulating robots
    If specielist <> "" Then
        If MsgBox("The following robots must be removed first:" & vbCrLf & vbCrLf & specielist & vbCrLf & "Continue?", vbYesNo + vbQuestion) = vbYes Then
            For i = 0 To UBound(TmpOpts.Specie)
                If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
                    optionsform.SpecList.ListIndex = i
                    optionsform.DelSpec_Click
                    i = i - 1
                End If
            Next
        Else
            If x_restartmode = 4 Or x_restartmode = 5 Or x_restartmode = 6 Then   'Botsareus 10/6/2015 Bug fix
             Kill App.path & "\restartmode.gset"
             x_restartmode = 0
            End If
            Exit Sub
        End If
    End If
End If
If chkZBmode.value Then
    If txtCD <> MDIForm1.MainDir Then
        MsgBox "Can not start zerobot evolution mode while changing main directory.", vbCritical
        txtCD = MDIForm1.MainDir
        Exit Sub
    End If
    If FolderExists(MDIForm1.MainDir & "\evolution") Then
        If MsgBox("The current evolution mode will be restarted. Continue?", vbYesNo + vbQuestion) = vbYes Then
            RecursiveRmDir MDIForm1.MainDir & "\evolution"
        Else
            Exit Sub
        End If
    End If
    'the folders
    RecursiveMkDir MDIForm1.MainDir & "\evolution"
    RecursiveMkDir MDIForm1.MainDir & "\evolution\stages"
    'generate list of species that are not repopulating
    For i = 0 To UBound(TmpOpts.Specie)
        If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
            specielist = specielist & TmpOpts.Specie(i).Name & vbNewLine
        End If
    Next
    'remove all nonrepopulating robots
    If specielist <> "" Then
        If MsgBox("The following robots must be removed first:" & vbCrLf & vbCrLf & specielist & vbCrLf & "Continue?", vbYesNo + vbQuestion) = vbYes Then
            For i = 0 To UBound(TmpOpts.Specie)
                If TmpOpts.Specie(i).Veg = False And TmpOpts.Specie(i).Name <> "" Then
                    optionsform.SpecList.ListIndex = i
                    optionsform.DelSpec_Click
                    i = i - 1
                End If
            Next
        Else
            If x_restartmode = 7 Or x_restartmode = 8 Or x_restartmode = 9 Then 'Botsareus 10/6/2015 Bug fix
             Kill App.path & "\restartmode.gset"
             x_restartmode = 0
            End If
            Exit Sub
        End If
    End If
End If

'prompt that settings will take place when you restart db
MsgBox "Global settings will take effect the next time DarwinBots starts.", vbInformation

'save all settings
    Open MDIForm1.MainDir & "\Global.gset" For Output As #1
      Write #1, chkScreenRatio = 1
      Write #1, val(txtBodyFix)
      Write #1, chkGreedy = 1
      Write #1, chkchseedstartnew = 1
      Write #1, chkchseedloadsim = 1
      Write #1, chkSafeMode = 1
      Write #1, sldFindBest.value
      Write #1, chkOldColor = 1
      Write #1, chkNoBoyMsg = 1
      Write #1, chkNoVid = 1
      Write #1, chkEpiReset = 1
      Write #1, val(txtMEmp)
      Write #1, val(txtOP)
      Write #1, chkSunbelt = 1
      Write #1, chkDelta2 = 1
      Write #1, val(txtMainExp)
      Write #1, val(txtMainLn)
      Write #1, val(txtDevExp)
      Write #1, val(txtDevLn)
      Write #1, val(txtPMinter)
      Write #1, chkNorm = 1
      Write #1, val(txtDnalen)
      Write #1, val(txtMxDnalen)
      Write #1, val(txtWTC)
      Write #1, val(sldMain)
      Write #1, val(sldDev)
      Write #1, IIf(chkAddarob.value = 1, MDIForm1.MainDir & "\league\singlerob", txtSourceDir)
      Write #1, (chkStepladder = 1 And chkTournament = 1)
      
      Dim tmpopt As OptionButton
      For Each tmpopt In optFudging
        If tmpopt.value Then Write #1, tmpopt.Index
      Next
      
      Write #1, val(txtStartChlr.text)
      
      For Each tmpopt In optDisqua
        If tmpopt.value Then Write #1, tmpopt.Index
      Next
      
      'evolution
      
      Write #1, txtRob
      Write #1, chkShowGraphs.value = 1
      Write #1, chkNormSize.value = 1
      Write #1, val(txtCycSM)
      Write #1, val(txtLFOR)
      
      Write #1, False 'Replacing with better rules
      
      Write #1, val(txtZlength)
      
      'Restrictions
      
      Write #1, x_res_kill_chlr
      Write #1, x_res_kill_mb
      Write #1, x_res_other
      '
      Write #1, y_res_kill_chlr
      Write #1, y_res_kill_mb
      Write #1, y_res_kill_dq
      Write #1, y_res_other
      '
      Write #1, x_res_kill_mb_veg
      Write #1, x_res_other_veg
      '
      Write #1, y_res_kill_mb_veg
      Write #1, y_res_kill_dq_veg
      Write #1, y_res_other_veg
      
      Write #1, chkGraphUp.value = 1
      Write #1, chkHide.value = 1
      
      'New way to preserve epigenetic memory
      
      Write #1, chkEpiGene.value = 1
      
      'Use internet as randomizer
      
      Write #1, chkIntRnd.value = 1
      
    Close #1
    
'Botsareus 1/31/2014 Setup a league
If txtSourceDir.Visible Then
    'R E S T A R T  I N I T
    If chkStepladder = 1 And chkTournament = 0 Then
        optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set"
        Dim file_name As String
        Dim files As Collection
        If chkAddarob = 1 Then 'Botsareus 6/28/2014 Just add one robot
            Set files = getfiles(txtSourceDir.text)
            'move all robots
            For i = 1 To files.count
                FileCopy files(i), MDIForm1.MainDir & "\league\stepladder\" & extractname(files(i))
            Next
            'move a single robot
            MkDir MDIForm1.MainDir & "\league\singlerob"
            FileCopy robpath, MDIForm1.MainDir & "\league\singlerob\" & extractname(robpath)
            Open MDIForm1.MainDir & "\league\singlerob\" & extractname(robpath) For Append As #1
             Print #1, vbCrLf & "'#tag:" & extractname(robpath)
            Close #1
            leagueSourceDir = MDIForm1.MainDir & "\league\singlerob"
            x_filenumber = 0
            populateladder
        Else
            leagueSourceDir = txtSourceDir.text
            'add tags to files
            Set files = getfiles(leagueSourceDir)
            For i = 1 To files.count
                Open files(i) For Append As #1
                 Print #1, vbCrLf & "'#tag:" & extractname(files(i))
                Close #1
            Next
            '
            file_name = dir$(leagueSourceDir & "\*.*")
            FileCopy leagueSourceDir & "\" & file_name, MDIForm1.MainDir & "\league\stepladder\1-" & file_name
            Kill leagueSourceDir & "\" & file_name
            x_filenumber = 0
            populateladder
        End If
    ElseIf chkFilter.value = 1 Then
        optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set" 'save last settings
        FileCopy robpath, MDIForm1.MainDir & "\league\robotB.txt"
        Open App.path & "\restartmode.gset" For Output As #1
            Write #1, 10
            Write #1, 1
        Close #1
        Open App.path & "\Safemode.gset" For Output As #1
         Write #1, False
        Close #1
        Open App.path & "\autosaved.gset" For Output As #1
         Write #1, False
        Close #1
        Call restarter
    Else
        optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set" 'save last settings
        Open App.path & "\restartmode.gset" For Output As #1
            Write #1, 1
            Write #1, 1
        Close #1
        Open App.path & "\Safemode.gset" For Output As #1
         Write #1, False
        Close #1
        Open App.path & "\autosaved.gset" For Output As #1
         Write #1, False
        Close #1
        Call restarter
    End If
End If

 '2/16/2014 Evolution modes
If chkSurvivalSimple.value = 1 Or chkSurvivalEco.value = 1 Then
    'let us init basic survival evolution mode
    'copy robots
    If chkSurvivalSimple.value = 1 Then
        FileCopy txtRob, MDIForm1.MainDir & "\evolution\Base.txt"
        FileCopy txtRob, MDIForm1.MainDir & "\evolution\Mutate.txt"
        FileCopy txtRob, MDIForm1.MainDir & "\evolution\stages\stage0.txt"
    Else
        'Botsareus 10/21/2015 Append tag at start of eco evo
        Open txtRob For Append As #1
         Print #1, vbCrLf & "'#tag:" & extractname(txtRob)
        Close #1
        Dim ecocount As Byte
        For ecocount = 1 To 15
             MkDir MDIForm1.MainDir & "\evolution\baserob" & ecocount
             FileCopy txtRob, MDIForm1.MainDir & "\evolution\baserob" & ecocount & "\Base.txt"
             MkDir MDIForm1.MainDir & "\evolution\mutaterob" & ecocount
             FileCopy txtRob, MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.txt"
             MkDir MDIForm1.MainDir & "\evolution\stages\stagerob" & ecocount
             FileCopy txtRob, MDIForm1.MainDir & "\evolution\stages\stagerob" & ecocount & "\stage0.txt"
        Next
    End If
    'generate mrate filename
    Dim mratefn As String
    mratefn = extractpath(txtRob) & "\" & extractexactname(extractname(txtRob)) & ".mrate"
    If dir(mratefn) <> "" Then
        'copy mrates
        If chkSurvivalSimple.value = 1 Then
            FileCopy mratefn, MDIForm1.MainDir & "\evolution\Mutate.mrate"
            FileCopy mratefn, MDIForm1.MainDir & "\evolution\stages\stage0.mrate"
        Else
            For ecocount = 1 To 15
             FileCopy mratefn, MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.mrate"
             FileCopy mratefn, MDIForm1.MainDir & "\evolution\stages\stagerob" & ecocount & "\stage0.mrate"
            Next
        End If
    End If
    'calculate robot's size
    Dim Length As Integer
    'we have to calculate length of robot here
    ReDim rob(0)
    If LoadDNA(txtRob, 0) Then
        Length = DnaLen(rob(0).dna)
    End If
    'generate data file
    Open MDIForm1.MainDir & "\evolution\data.gset" For Output As #1
        Write #1, val(txtLFOR) 'LFOR init
        Write #1, True 'dir
        Write #1, 5 'corr
        '
        Write #1, val(txtCycSM) 'hidePredCycl
        '
        Write #1, val(Length + CInt(5)) 'curr_dna_size
        Write #1, TargetDNASize(Length) 'target_dna_size
        '
        Write #1, val(txtCycSM) 'Init hidePredCycl
        '
        Write #1, 0 'stgwins
    Close #1
    'for eco evo
    If chkSurvivalEco.value = 1 Then
        Open App.path & "\im.gset" For Output As #1
            Write #1, chkIM.value
        Close #1
    Else
        If dir(App.path & "\im.gset") <> "" Then Kill App.path & "\im.gset"
    End If
    'other
    optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set" 'save last settings
    Open App.path & "\restartmode.gset" For Output As #1
        Write #1, 4
        Write #1, 0
    Close #1
    Open App.path & "\Safemode.gset" For Output As #1
     Write #1, False
    Close #1
    Open App.path & "\autosaved.gset" For Output As #1
     Write #1, False
    Close #1
    Call restarter
End If
'4/14/2014
If chkZBmode.value = 1 Then
    For ecocount = 1 To 8
        'generate folders for multi
        MkDir MDIForm1.MainDir & "\evolution\baserob" & ecocount
        MkDir MDIForm1.MainDir & "\evolution\mutaterob" & ecocount
        'generate the zb file (multi)
        Open MDIForm1.MainDir & "\evolution\baserob" & ecocount & "\Base.txt" For Output As #1
            Dim zerocount As Integer
            For zerocount = 1 To val(txtZlength)
                Write #1, 0
            Next
        Close #1
        FileCopy MDIForm1.MainDir & "\evolution\baserob" & ecocount & "\Base.txt", MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.txt"
    Next
    'Botsareus 10/22/2015 the stages are singuler
    FileCopy MDIForm1.MainDir & "\evolution\baserob1\Base.txt", MDIForm1.MainDir & "\evolution\stages\stage0.txt"
    optionsform.savesett MDIForm1.MainDir + "\settings\lastexit.set" 'save last settings
    'other
    Open App.path & "\restartmode.gset" For Output As #1
        Write #1, 7
        Write #1, 0
    Close #1
    Open App.path & "\Safemode.gset" For Output As #1
     Write #1, False
    Close #1
    Open App.path & "\autosaved.gset" For Output As #1
     Write #1, False
    Close #1
    Call restarter
End If

'unload
Unload Me
End Sub

Private Sub chkAddarob_Click()
If chkAddarob.value Then
If MsgBox("Make sure all robots in source dir. have a prefix ""1-"" ""2-"" etc. and #tag metadata contains name of robot.", vbOKCancel) = vbCancel Then GoTo fine:
On Error GoTo fine
  optionsform.CommonDialog1.FileName = ""
  optionsform.CommonDialog1.Filter = "Dna file(*.txt)|*.txt" 'Botsareus 1/11/2013 DNA only
  optionsform.CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
  optionsform.CommonDialog1.DialogTitle = WSchoosedna
  optionsform.CommonDialog1.ShowOpen
  If optionsform.CommonDialog1.FileName <> "" Then 'Botsareus 1/11/2013 Do not insert robot if filename is blank
   robpath = optionsform.CommonDialog1.FileName
  Else
    GoTo fine
  End If
End If
Exit Sub
fine:
chkAddarob.value = 0
End Sub

Private Sub chkDelta2_Click()
If chkDelta2.value = 1 And Visible Then
    If MsgBox("Enabling Delta2 mutations may slow down your simulation considerably as it may optimize for extreme mutation rates. Are you sure?", vbExclamation + vbYesNo, "Global Darwinbots Settings") = vbNo Then chkDelta2.value = 0 'Botsareus 9/13/2014 Warnings for Shvarz
End If
lblD2.Visible = chkDelta2.value = 1
lblPMDelta2.Visible = chkDelta2.value = 1
txtPMinter.Visible = chkDelta2.value = 1
lblWTC.Visible = chkDelta2.value = 1
txtWTC.Visible = chkDelta2.value = 1
'
If chkDelta2.value = 0 Then
    lblMmain.Visible = False
    lblMmean.Visible = False
    txtMainExp.Visible = False
    txtMainLn.Visible = False
    txtDevExp.Visible = False
    txtDevLn.Visible = False
    lblChance.Visible = False
    sldMain.Visible = False
    sldDev.Visible = False
End If
End Sub

Private Sub chkEpiReset_Click()
txtMEmp.Enabled = chkEpiReset.value = 1
txtOP.Enabled = chkEpiReset.value = 1
End Sub

Private Sub chkFilter_Click()
If chkFilter.value = 1 Then
    chkTournament.value = 0
    chkStepladder.value = 0
    chkSurvivalSimple.value = 0
    chkZBmode.value = 0
    chkSurvivalEco.value = 0
    lblSource.Visible = True
    txtSourceDir.Visible = True
  optionsform.CommonDialog1.FileName = ""
  optionsform.CommonDialog1.Filter = "Dna file(*.txt)|*.txt" 'Botsareus 1/11/2013 DNA only
  optionsform.CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
  optionsform.CommonDialog1.DialogTitle = WSchoosedna
  optionsform.CommonDialog1.ShowOpen
  If optionsform.CommonDialog1.FileName <> "" Then 'Botsareus 1/11/2013 Do not insert robot if filename is blank
   robpath = optionsform.CommonDialog1.FileName
  Else
    GoTo fine
  End If
Else
    If Not chkStepladder.value = 1 And Not chkTournament.value = 1 Then
        lblSource.Visible = False
        txtSourceDir.Visible = False
    End If
End If
Exit Sub
fine:
chkFilter.value = 0
End Sub

Private Sub chkIntRnd_Click()
If chkIntRnd.value = 1 And Visible Then
     MsgBox "The pictures are loaded from urls listed in the " & App.path & "\web.gset file.", vbInformation
End If
End Sub

Private Sub chkNorm_Click()
txtDnalen.Visible = chkNorm.value = 1
lblDnalen.Visible = chkNorm.value = 1
txtMxDnalen.Visible = chkNorm.value = 1
End Sub

Private Sub chkStepladder_Click()
If chkStepladder.value = 1 Then
    lblSource.Visible = True
    txtSourceDir.Visible = True
    chkSurvivalSimple.value = 0
    chkSurvivalEco.value = 0
    chkZBmode.value = 0
    chkFilter.value = 0
Else
    If Not chkTournament.value = 1 And Not chkFilter.value = 1 Then
        lblSource.Visible = False
        txtSourceDir.Visible = False
    End If
End If
'default chloroplasts
txtStartChlr = 16000
chkAddarob.Visible = chkStepladder.value = 1 And chkTournament.value = 0
End Sub

Private Sub chkSurvivalEco_Click()
If chkSurvivalEco.value = 1 Then
    chkStepladder.value = 0
    chkTournament.value = 0
    chkZBmode.value = 0
    chkSurvivalSimple.value = 0
    chkIM.Visible = True
    chkNormSize.Visible = False
    chkNormSize.value = 0
    chkFilter.value = 0
End If
ffmSurvival.Visible = chkSurvivalEco.value = 1
'default chloroplasts
txtStartChlr = 16000 'default chloroplasts
End Sub

Private Sub chkSurvivalSimple_Click()
If chkSurvivalSimple.value = 1 Then
    chkStepladder.value = 0
    chkTournament.value = 0
    chkFilter.value = 0
    chkZBmode.value = 0
    chkSurvivalEco.value = 0
    chkNormSize.Visible = True
    chkIM.Visible = False
End If
ffmSurvival.Visible = chkSurvivalSimple.value = 1
'default chloroplasts
txtStartChlr = 16000 'default chloroplasts
End Sub

Private Sub chkTournament_Click()
If chkTournament.value = 1 Then
    chkStepladder.Caption = "Stepladder league (starts between 16 and 31 robots)"
    lblSource.Visible = True
    txtSourceDir.Visible = True
    chkSurvivalSimple.value = 0
    chkZBmode.value = 0
    chkSurvivalEco.value = 0
    chkFilter.value = 0
Else
    chkStepladder.Caption = "Stepladder league"
    If Not chkStepladder.value = 1 And Not chkFilter.value = 1 Then
        lblSource.Visible = False
        txtSourceDir.Visible = False
    End If
End If
'default chloroplasts
txtStartChlr = 16000
chkAddarob.Visible = chkStepladder.value = 1 And chkTournament.value = 0
End Sub

Private Sub chkUseCD_Click()
If chkUseCD.value = 1 Then
 If Visible Then MsgBox "If you are running parallel simulations on a single computer, make sure you disable this setting or make the path is unique for each instance. Also, don't forget to have each Darwin.exe in a separate directory"
 txtCD.Enabled = True
Else
 txtCD.Enabled = False
End If
End Sub

Private Sub chkZBmode_Click()
If chkZBmode.value = 1 Then
    chkStepladder.value = 0
    chkTournament.value = 0
    chkSurvivalSimple.value = 0
    chkNormSize.value = 0
    chkShowGraphs.value = 0
    chkSurvivalEco.value = 0
    chkFilter.value = 0
End If
ffmZeroBot.Visible = chkZBmode.value = 1
txtStartChlr = 16000 'default chloroplasts
End Sub

Private Sub Command1_Click()
    frmRestriOps.res_state = 2
    frmRestriOps.Show vbModal
End Sub

Private Sub Form_Load()
'load all global settings into controls
chkScreenRatio.value = IIf(screenratiofix, 1, 0)
txtBodyFix = bodyfix
chkGreedy = IIf(reprofix, 1, 0)
chkchseedstartnew.value = IIf(chseedstartnew, 1, 0)
chkchseedloadsim.value = IIf(chseedloadsim, 1, 0)
chkNoBoyMsg.value = IIf(loadboylabldisp, 1, 0) 'some global settings change within simulation
chkNoVid.value = IIf(loadstartnovid, 1, 0) 'some global settings change within simulation
txtCD = MDIForm1.MainDir
'only eanable txtCD and chkUseCD if maindir.gset exisits
If dir(App.path & "\Maindir.gset") <> "" Then
chkUseCD.value = 1
txtCD.Enabled = True
Else
chkUseCD.value = 0
txtCD.Enabled = False
End If
'are we using safemode
chkSafeMode = IIf(UseSafeMode, 1, 0)
'find best
sldFindBest.value = intFindBestV2
'use old color
chkOldColor = IIf(UseOldColor, 1, 0)
'epigenetic reset
chkEpiReset = IIf(epireset, 1, 0)
txtMEmp = epiresetemp
txtOP = epiresetOP
txtMEmp.Enabled = chkEpiReset.value = 1
txtOP.Enabled = chkEpiReset.value = 1
'Eclipse mutations
chkSunbelt.value = IIf(sunbelt, 1, 0)
'Delta2
chkDelta2.value = IIf(Delta2, 1, 0)
txtMainExp = DeltaMainExp
txtMainLn = DeltaMainLn
txtDevExp = DeltaDevExp
txtDevLn = DeltaDevLn
txtPMinter = DeltaPM
txtWTC = DeltaWTC
sldMain = DeltaMainChance
sldDev = DeltaDevChance
'Norm Mut
chkNorm = IIf(NormMut, 1, 0)
txtDnalen = valNormMut
txtMxDnalen = valMaxNormMut
'Set values Delta2 and Norm mut
lblD2.Visible = chkDelta2.value = 1
lblPMDelta2.Visible = chkDelta2.value = 1
txtPMinter.Visible = chkDelta2.value = 1
lblWTC.Visible = chkDelta2.value = 1
txtWTC.Visible = chkDelta2.value = 1
'
txtDnalen.Visible = chkNorm.value = 1
lblDnalen.Visible = chkNorm.value = 1
txtMxDnalen.Visible = chkNorm.value = 1
'
txtSourceDir = leagueSourceDir
optFudging(x_fudge).value = True
'
txtStartChlr.text = StartChlr
'
optDisqua(Disqualify).value = True
'
txtRob = y_robdir
chkShowGraphs = IIf(y_graphs, 1, 0)
chkNormSize = IIf(y_normsize, 1, 0)
txtCycSM = y_hidePredCycl
txtLFOR = y_LFOR
'
txtZlength = y_zblen
'
If y_eco_im > 0 Then chkIM.value = y_eco_im - 1
'
chkGraphUp.value = IIf(GraphUp, 1, 0)
chkHide.value = IIf(HideDB, 1, 0)
'
chkEpiGene = IIf(UseEpiGene, 1, 0)
'
chkIntRnd = IIf(UseIntRnd, 1, 0)
End Sub

Private Sub lblD2_Click()
lblMmain.Visible = True
lblMmean.Visible = True
txtMainExp.Visible = True
txtMainLn.Visible = True
txtDevExp.Visible = True
txtDevLn.Visible = True
lblChance.Visible = True
sldMain.Visible = True
sldDev.Visible = True
lblD2.Visible = False
End Sub

Private Sub txtBodyFix_LostFocus()
'make sure the value is sane
txtBodyFix = Abs(val(txtBodyFix))
If txtBodyFix > 32100 Then txtBodyFix = 32100
If txtBodyFix < 2500 Then
   If MsgBox("It is not recommended to set 'Cheating Prevention' below 2500 because it may result in your robots never getting enough body to survive. Do you want to set to 2500 instead?", vbExclamation + vbYesNo, "Global Darwinbots Settings") = vbYes Then txtBodyFix = 2500 'Botsareus 9/13/2014 Warnings for Shvarz
End If
If txtBodyFix < 1000 Then txtBodyFix = 1000
End Sub

Private Sub txtCycSM_LostFocus()
'make sure the value is sane
txtCycSM = Int(Abs(val(txtCycSM)))
If txtCycSM < 150 Then txtCycSM = 150
If txtCycSM > 15000 Then txtCycSM = 15000
End Sub

Private Sub txtDevLn_LostFocus()
'make sure the value is sane
txtDevLn = Abs(val(txtDevLn))
If txtDevLn > 5000 Then txtDevLn = 3000
End Sub

Private Sub txtDnalen_LostFocus()
'make sure the value is sane
txtDnalen = Abs(val(txtDnalen))
If txtDnalen < 1 Then txtDnalen = 1
If txtDnalen > 2000 Then txtDnalen = 2000
End Sub

Private Sub txtLFOR_LostFocus()
'make sure the value is sane
txtLFOR = Abs(val(txtLFOR))
If txtLFOR < 0.01 Then txtLFOR = 0.01
If txtLFOR > 100 Then txtLFOR = 100
End Sub

Private Sub txtMainExp_LostFocus()
'make sure the value is sane
txtMainExp = Abs(val(txtMainExp))
If txtMainExp = 0 Then Exit Sub
If txtMainExp < 0.4 Then txtMainExp = 0.4
If txtMainExp > 25 Then txtMainExp = 25
End Sub

Private Sub txtDevExp_LostFocus()
'make sure the value is sane
txtDevExp = Abs(val(txtDevExp))
If txtDevExp = 0 Then Exit Sub
If txtDevExp < 0.4 Then txtDevExp = 0.4
If txtDevExp > 25 Then txtDevExp = 25
End Sub

Private Sub txtMainLn_LostFocus()
'make sure the value is sane
txtMainLn = Round(Abs(val(txtMainLn)))
If txtMainLn > 5000 Then txtMainLn = 3000
End Sub

Private Sub txtMEmp_LostFocus()
'make sure the value is sane
txtMEmp = Abs(val(txtMEmp))
If txtMEmp > 5 Then txtMEmp = 5
End Sub

Private Sub txtMxDnalen_LostFocus()
'make sure the value is sane
txtMxDnalen = Abs(val(txtMxDnalen))
If txtMxDnalen < 1 Then txtMxDnalen = 1
If txtMxDnalen > 32000 Then txtMxDnalen = 32000
End Sub

Private Sub txtOP_LostFocus()
'make sure the value is sane
txtOP = Abs(val(txtOP))
If txtOP > 32000 Then txtOP = 32000
End Sub

Private Sub txtPMinter_LostFocus()
'make sure the value is sane
txtPMinter = Round(Abs(val(txtPMinter)))
If txtPMinter > 32000 Then txtPMinter = 32000
End Sub

Private Sub txtStartChlr_LostFocus()
'make sure the value is sane
txtStartChlr = Abs(val(txtStartChlr))
If txtStartChlr > 32000 Then txtStartChlr = 32000
End Sub

Private Sub txtWTC_Change()
'make sure the value is sane
txtWTC = Abs(val(txtWTC))
If txtWTC > 100 Then txtWTC = 100
End Sub


Private Sub txtZlength_LostFocus()
'make sure the value is sane
txtZlength = Abs(Int(val(txtZlength)))
If txtZlength > 32000 Then txtZlength = 32000
If txtZlength < 4 Then txtZlength = 4
End Sub
