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
      Tabs            =   2
      Tab             =   1
      TabHeight       =   520
      BackColor       =   12632256
      TabCaption(0)   =   "Main settings"
      TabPicture(0)   =   "frmGset.frx":0000
      Tab(0).ControlEnabled=   0   'False
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
      TabCaption(1)   =   "Mutations"
      TabPicture(1)   =   "frmGset.frx":001C
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "ffmEpiReset"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "ffmSunMut"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      Begin VB.Frame ffmSunMut 
         Caption         =   "Sunline Mutations"
         Height          =   3775
         Left            =   840
         TabIndex        =   30
         Top             =   1280
         Width           =   9135
         Begin MSComctlLib.Slider sldMain 
            Height          =   285
            Left            =   7080
            TabIndex        =   50
            ToolTipText     =   "Probability Delta2 Chance"
            Top             =   960
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
            Left            =   6435
            TabIndex        =   40
            Top             =   1440
            Width           =   615
         End
         Begin VB.TextBox txtDevExp 
            Height          =   285
            Left            =   5280
            TabIndex        =   38
            Top             =   1440
            Width           =   615
         End
         Begin VB.TextBox txtMainLn 
            Height          =   285
            Left            =   6240
            TabIndex        =   37
            Top             =   960
            Width           =   615
         End
         Begin VB.TextBox txtMainExp 
            Height          =   285
            Left            =   4995
            TabIndex        =   35
            Top             =   960
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
            Picture         =   "frmGset.frx":0038
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
            Width           =   1935
            _ExtentX        =   3413
            _ExtentY        =   503
            _Version        =   393216
            Max             =   100
            TickFrequency   =   10
         End
         Begin VB.Label lblChance 
            Caption         =   "Chance of mutation %"
            Height          =   255
            Left            =   7200
            TabIndex        =   49
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label lblWTC 
            Caption         =   "Delta2 for what to change:    ±"
            Height          =   495
            Left            =   5760
            TabIndex        =   47
            Top             =   1800
            Width           =   1095
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
            Caption         =   "Mean/Stddev:    Exponential(10^) ± 1/   XXXX  ± Liner"
            Height          =   375
            Left            =   2520
            TabIndex        =   39
            Top             =   1440
            Width           =   4335
         End
         Begin VB.Label lblMmain 
            Caption         =   "Probablity:    Exponential(10^) ± 1/   XXXX    ± Liner"
            Height          =   375
            Left            =   2520
            TabIndex        =   36
            Top             =   960
            Width           =   3975
         End
         Begin VB.Label lblExplMut 
            Caption         =   $"frmGset.frx":0C7A
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
         Left            =   1560
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
            ToolTipText     =   $"frmGset.frx":0D8C
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
         Left            =   -70080
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
         Left            =   -68280
         TabIndex        =   15
         Top             =   1920
         Width           =   1935
      End
      Begin VB.Frame ffmMainDir 
         Caption         =   "Main Directory"
         Height          =   1215
         Left            =   -70080
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
         Left            =   -74880
         TabIndex        =   9
         Top             =   3840
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
         Left            =   -74880
         TabIndex        =   5
         Top             =   2160
         Width           =   4695
         Begin VB.CheckBox chkGreedy 
            Caption         =   "Nearly kill robots that are excessively greedy to there kids, using them to dump there energy."
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
         Height          =   1575
         Left            =   -74880
         TabIndex        =   3
         Top             =   480
         Width           =   4695
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
         Begin VB.CheckBox chkScreenRatio 
            Caption         =   "Fix Screen Ratio when simulation starts"
            Height          =   375
            Left            =   240
            TabIndex        =   4
            Top             =   240
            Width           =   3075
         End
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
    Close #1
'unload
Unload Me
End Sub

Private Function FolderExists(sFullPath As String) As Boolean
Dim myFSO As Object
Set myFSO = CreateObject("Scripting.FileSystemObject")
FolderExists = myFSO.FolderExists(sFullPath)
End Function


Private Sub chkDelta2_Click()
lblMmain.Visible = chkDelta2.value = 1
lblMmean.Visible = chkDelta2.value = 1
lblPMDelta2.Visible = chkDelta2.value = 1
txtMainExp.Visible = chkDelta2.value = 1
txtMainLn.Visible = chkDelta2.value = 1
txtDevExp.Visible = chkDelta2.value = 1
txtDevLn.Visible = chkDelta2.value = 1
txtPMinter.Visible = chkDelta2.value = 1
lblWTC.Visible = chkDelta2.value = 1
txtWTC.Visible = chkDelta2.value = 1
lblChance.Visible = chkDelta2.value = 1
sldMain.Visible = chkDelta2.value = 1
sldDev.Visible = chkDelta2.value = 1
End Sub

Private Sub chkEpiReset_Click()
txtMEmp.Enabled = chkEpiReset.value = 1
txtOP.Enabled = chkEpiReset.value = 1
End Sub

Private Sub chkNorm_Click()
txtDnalen.Visible = chkNorm.value = 1
lblDnalen.Visible = chkNorm.value = 1
txtMxDnalen.Visible = chkNorm.value = 1
End Sub

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
lblMmain.Visible = chkDelta2.value = 1
lblMmean.Visible = chkDelta2.value = 1
lblPMDelta2.Visible = chkDelta2.value = 1
txtMainExp.Visible = chkDelta2.value = 1
txtMainLn.Visible = chkDelta2.value = 1
txtDevExp.Visible = chkDelta2.value = 1
txtDevLn.Visible = chkDelta2.value = 1
txtPMinter.Visible = chkDelta2.value = 1
lblWTC.Visible = chkDelta2.value = 1
txtWTC.Visible = chkDelta2.value = 1
lblChance.Visible = chkDelta2.value = 1
sldMain.Visible = chkDelta2.value = 1
sldDev.Visible = chkDelta2.value = 1
'
txtDnalen.Visible = chkNorm.value = 1
lblDnalen.Visible = chkNorm.value = 1
txtMxDnalen.Visible = chkNorm.value = 1
End Sub

Private Sub txtBodyFix_LostFocus()
'make sure the value is sane
txtBodyFix = Abs(val(txtBodyFix))
If txtBodyFix > 32100 Then txtBodyFix = 32100
End Sub

Private Sub txtDevLn_LostFocus()
txtDevLn = Abs(val(txtDevLn))
If txtDevLn > 5000 Then txtDevLn = 3000
End Sub

Private Sub txtDnalen_LostFocus()
'make sure the value is sane
txtDnalen = Abs(val(txtDnalen))
If txtDnalen < 1 Then txtDnalen = 1
If txtDnalen > 2000 Then txtDnalen = 2000
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

Private Sub txtWTC_Change()
'make sure the value is sane
txtWTC = Abs(val(txtWTC))
If txtWTC > 100 Then txtWTC = 100
End Sub
