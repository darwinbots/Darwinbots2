VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmGset 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Global Settings"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   10770
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   10770
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   8160
      TabIndex        =   2
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   9480
      TabIndex        =   1
      Top             =   5040
      Width           =   1215
   End
   Begin TabDlg.SSTab tb 
      Height          =   4935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10755
      _ExtentX        =   18971
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
      Tab(0).Control(3)=   "ffmMainDir"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "chkSafeMode"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "ffmFBSBO"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).ControlCount=   6
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
         Left            =   6720
         TabIndex        =   15
         Top             =   1920
         Width           =   1935
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

'prompt that settings will take place when you restart db
MsgBox "Global settings will take effect when you restart DarwinBots.", vbInformation
'save all settings
    Open MDIForm1.MainDir & "\Global.gset" For Output As #1
      Write #1, chkScreenRatio = 1
      Write #1, val(txtBodyFix)
      Write #1, chkGreedy = 1
      Write #1, chkchseedstartnew = 1
      Write #1, chkchseedloadsim = 1
      Write #1, chkSafeMode = 1
      Write #1, sldFindBest.value
    Close #1
'unload
Unload Me
End Sub

Private Function FolderExists(sFullPath As String) As Boolean
Dim myFSO As Object
Set myFSO = CreateObject("Scripting.FileSystemObject")
FolderExists = myFSO.FolderExists(sFullPath)
End Function


Private Sub chkUseCD_Click()
If chkUseCD.value = 1 Then
 If Visible Then MsgBox "If you are running parallel simulations on a single computer, make sure you disable this setting or make the path is unique for each instance. Also, don't forget to have each Darwin.exe in a separate directory"
 txtCD.Enabled = True
Else
 txtCD.Enabled = False
End If
End Sub


Private Sub Form_Load()
'load all global settings into controls
chkScreenRatio.value = IIf(screenratiofix, 1, 0)
txtBodyFix = bodyfix
chkGreedy = IIf(reprofix, 1, 0)
chkchseedstartnew.value = IIf(chseedstartnew, 1, 0)
chkchseedloadsim.value = IIf(chseedloadsim, 1, 0)
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
End Sub

Private Sub txtBodyFix_LostFocus()
'make sure the value is sane
txtBodyFix = Abs(val(txtBodyFix))
If txtBodyFix > 32100 Then txtBodyFix = 32100
End Sub
