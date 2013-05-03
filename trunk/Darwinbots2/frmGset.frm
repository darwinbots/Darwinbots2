VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmGset 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Global Settings"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5040
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   5040
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   1
      Top             =   5040
      Width           =   1215
   End
   Begin TabDlg.SSTab tb 
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4995
      _ExtentX        =   8811
      _ExtentY        =   8705
      _Version        =   393216
      Style           =   1
      Tabs            =   1
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
      Tab(0).ControlCount=   3
      Begin VB.Frame Frame1 
         Caption         =   "Randomization"
         Height          =   1455
         Left            =   120
         TabIndex        =   9
         Top             =   3240
         Width           =   4695
         Begin VB.CheckBox chkchseedloadsim 
            Caption         =   "Generate new seed when you click 'Load Simulation'"
            Height          =   375
            Left            =   240
            TabIndex        =   11
            Top             =   720
            Width           =   4275
         End
         Begin VB.CheckBox chkchseedstartnew 
            Caption         =   "Generate new seed when you click 'Start new'"
            Height          =   375
            Left            =   240
            TabIndex        =   10
            Top             =   360
            Width           =   4275
         End
      End
      Begin VB.Frame ffmCheatin 
         Caption         =   "Cheating Prevention"
         Height          =   1575
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   4695
         Begin VB.CheckBox chkGreedy 
            Caption         =   "Nearly kill robots that are excessively to there kids, using them to dump there energy."
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
            Width           =   1935
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
         Height          =   975
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   4695
         Begin VB.CheckBox chkScreenRatio 
            Caption         =   "Fix Screen Ratio when simulation starts"
            Height          =   375
            Left            =   240
            TabIndex        =   4
            Top             =   360
            Width           =   3075
         End
      End
   End
End
Attribute VB_Name = "frmGset"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Botsareus 3/15/2013 The global settings form

Private Sub btnCancel_Click()
'cancel has been pressed
Unload Me
End Sub


Private Sub btnOK_Click()
'prompt that settings will take place when you restart db
MsgBox "Global settings will take effect when you restart DarwinBots.", vbInformation
'save all settings
    Open App.path & "\Global.gset" For Output As #1
      Write #1, chkScreenRatio = 1
      Write #1, val(txtBodyFix)
      Write #1, chkGreedy = 1
      Write #1, chkchseedstartnew = 1
      Write #1, chkchseedloadsim = 1
    Close #1
'unload
Unload Me
End Sub

Private Sub Form_Load()
'load all global settings into controls
chkScreenRatio.value = IIf(screenratiofix, 1, 0)
txtBodyFix = bodyfix
chkGreedy = IIf(reprofix, 1, 0)
chkchseedstartnew.value = IIf(chseedstartnew, 1, 0)
chkchseedloadsim.value = IIf(chseedloadsim, 1, 0)
End Sub

Private Sub txtBodyFix_LostFocus()
'make sure the value is sane
txtBodyFix = Abs(val(txtBodyFix))
If txtBodyFix > 32100 Then txtBodyFix = 32100
End Sub
