VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmEYE 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Eye Designer"
   ClientHeight    =   5595
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3975
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   3975
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2880
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton btnOut 
      Caption         =   "Write DNA ..."
      Height          =   375
      Left            =   120
      TabIndex        =   32
      Top             =   3720
      Width           =   1335
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   8
      Left            =   1920
      TabIndex        =   31
      Text            =   "0"
      Top             =   3240
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   7
      Left            =   1920
      TabIndex        =   30
      Text            =   "0"
      Top             =   2880
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   6
      Left            =   1920
      TabIndex        =   29
      Text            =   "0"
      Top             =   2520
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   5
      Left            =   1920
      TabIndex        =   28
      Text            =   "0"
      Top             =   2160
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   4
      Left            =   1920
      TabIndex        =   27
      Text            =   "0"
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   3
      Left            =   1920
      TabIndex        =   26
      Text            =   "0"
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   2
      Left            =   1920
      TabIndex        =   25
      Text            =   "0"
      Top             =   1080
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   1
      Left            =   1920
      TabIndex        =   24
      Text            =   "0"
      Top             =   720
      Width           =   975
   End
   Begin VB.TextBox txtWth 
      Height          =   285
      Index           =   0
      Left            =   1920
      TabIndex        =   23
      Text            =   "0"
      Top             =   360
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   8
      Left            =   840
      TabIndex        =   22
      Text            =   "0"
      Top             =   3240
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   7
      Left            =   840
      TabIndex        =   21
      Text            =   "0"
      Top             =   2880
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   6
      Left            =   840
      TabIndex        =   20
      Text            =   "0"
      Top             =   2520
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   5
      Left            =   840
      TabIndex        =   19
      Text            =   "0"
      Top             =   2160
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   4
      Left            =   840
      TabIndex        =   18
      Text            =   "0"
      Top             =   1800
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   3
      Left            =   840
      TabIndex        =   17
      Text            =   "0"
      Top             =   1440
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   2
      Left            =   840
      TabIndex        =   16
      Text            =   "0"
      Top             =   1080
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   1
      Left            =   840
      TabIndex        =   15
      Text            =   "0"
      Top             =   720
      Width           =   975
   End
   Begin VB.TextBox txtDir 
      Height          =   285
      Index           =   0
      Left            =   840
      TabIndex        =   14
      Text            =   "0"
      Top             =   360
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "Ease of Access"
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   4320
      Width           =   3735
      Begin VB.CommandButton btnCosts 
         Caption         =   "Disable Costs"
         Height          =   375
         Left            =   2280
         TabIndex        =   33
         Top             =   720
         Width           =   1335
      End
      Begin VB.CommandButton btnRaim 
         Caption         =   "Reset Aim"
         Height          =   375
         Left            =   2280
         TabIndex        =   2
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton btnBoff 
         Caption         =   "Turn off Brownian Motion"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.Label Label11 
      Caption         =   "eye9"
      Height          =   255
      Left            =   240
      TabIndex        =   13
      Top             =   3240
      Width           =   495
   End
   Begin VB.Label Label10 
      Caption         =   "eye8"
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   2880
      Width           =   495
   End
   Begin VB.Label Label9 
      Caption         =   "eye7"
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   2520
      Width           =   495
   End
   Begin VB.Label Label8 
      Caption         =   "eye6"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   2160
      Width           =   495
   End
   Begin VB.Label Label7 
      Caption         =   "eye5"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   1800
      Width           =   495
   End
   Begin VB.Label Label6 
      Caption         =   "eye4"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   1440
      Width           =   495
   End
   Begin VB.Label Label5 
      Caption         =   "eye3"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   1080
      Width           =   495
   End
   Begin VB.Label Label4 
      Caption         =   "eye2"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   720
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "eye1"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   360
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "width"
      Height          =   255
      Left            =   2040
      TabIndex        =   4
      Top             =   120
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "direction"
      Height          =   255
      Left            =   960
      TabIndex        =   3
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmEYE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnBoff_Click()
SimOpts.PhysBrown = 0
End Sub

Private Sub btnCosts_Click()
SimOpts.Costs(COSTMULTIPLIER) = 0
End Sub

Private Sub btnOut_Click()
Dim i As Byte
  On Error GoTo fine
  CommonDialog1.DialogTitle = MBSaveDNA
  CommonDialog1.FileName = ""
  CommonDialog1.Filter = "DNA file(*.txt)|*.txt"
  CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
  CommonDialog1.ShowSave
  If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Output As #437
     Print #437, "Cond"
     Print #437, "*.robage 0 ="
     Print #437, "Start"
     For i = 0 To 8
      Print #437, txtDir(i).text & " .eye" & (i + 1) & "dir store"
      Print #437, txtWth(i).text & " .eye" & (i + 1) & "width store"
      Print #437, "'"
     Next
     Print #437, "Stop"
    Close
  End If
  Exit Sub
fine:
  MsgBox MBDNANotSaved
End Sub

Private Sub btnRaim_Click()
On Error Resume Next
rob(robfocus).mem(SetAim) = 0
End Sub

Private Sub Form_Activate()
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE 'Botsareus 12/12/2012 Info form is always on top
End Sub

Private Sub txtDir_Change(Index As Integer)
On Error Resume Next
rob(robfocus).mem(Index + EYE1DIR) = txtDir(Index).text
End Sub

Private Sub txtWth_Change(Index As Integer)
On Error Resume Next
rob(robfocus).mem(Index + EYE1WIDTH) = txtWth(Index).text
End Sub
