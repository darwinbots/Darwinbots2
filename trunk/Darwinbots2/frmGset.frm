VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmGset 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Global Settings"
   ClientHeight    =   2235
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3810
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2235
   ScaleWidth      =   3810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   1800
      Width           =   1215
   End
   Begin TabDlg.SSTab tb 
      Height          =   1695
      Left            =   -120
      TabIndex        =   0
      Top             =   0
      Width           =   3915
      _ExtentX        =   6906
      _ExtentY        =   2990
      _Version        =   393216
      Style           =   1
      Tabs            =   1
      TabHeight       =   520
      BackColor       =   12632256
      TabCaption(0)   =   "Main Tab"
      TabPicture(0)   =   "frmGset.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "ffmUI"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      Begin VB.Frame ffmUI 
         Caption         =   "UI Settings"
         Height          =   975
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   3495
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
    Close #1
'unload
Unload Me
End Sub

Private Sub Form_Load()
'load all global settings into controls
chkScreenRatio.value = IIf(screenratiofix, 1, 0)
End Sub
