VERSION 5.00
Begin VB.Form Contest_Form 
   BackColor       =   &H00E0E0E0&
   Caption         =   "Contest Results"
   ClientHeight    =   2295
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4935
   Icon            =   "Contest_Form.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   30.972
   ScaleMode       =   0  'User
   ScaleWidth      =   48.573
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton Option1 
      Caption         =   "W"
      Height          =   255
      Index           =   5
      Left            =   4260
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   1680
      Width           =   315
   End
   Begin VB.OptionButton Option1 
      Caption         =   "W"
      Height          =   255
      Index           =   4
      Left            =   4260
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   1440
      Width           =   315
   End
   Begin VB.OptionButton Option1 
      Caption         =   "W"
      Height          =   255
      Index           =   3
      Left            =   4260
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   1200
      Width           =   315
   End
   Begin VB.OptionButton Option1 
      Caption         =   "W"
      Height          =   255
      Index           =   2
      Left            =   4260
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   960
      Width           =   315
   End
   Begin VB.OptionButton Option1 
      Caption         =   "W"
      Height          =   255
      Index           =   1
      Left            =   4260
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   720
      Width           =   315
   End
   Begin VB.OptionButton Option1 
      Height          =   255
      Index           =   0
      Left            =   5160
      MaskColor       =   &H8000000F&
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   1980
      Width           =   315
   End
   Begin VB.Label Label4 
      Caption         =   "The 0th option1 box is hidden behind screen --->>>>>"
      Height          =   255
      Left            =   780
      TabIndex        =   31
      Top             =   1980
      Visible         =   0   'False
      Width           =   3795
   End
   Begin VB.Label Label3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "InstaWin"
      Height          =   195
      Left            =   4140
      TabIndex        =   24
      ToolTipText     =   "Give this round to this robot."
      Top             =   240
      Width           =   675
   End
   Begin VB.Label Maxrounds 
      BackColor       =   &H00E0E0E0&
      Caption         =   "5"
      Height          =   255
      Left            =   2520
      TabIndex        =   23
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Round"
      Height          =   255
      Left            =   720
      TabIndex        =   22
      Top             =   0
      Width           =   495
   End
   Begin VB.Label Winner1 
      BackColor       =   &H00E0E0E0&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   21
      Top             =   480
      Width           =   975
   End
   Begin VB.Label Winner 
      BackColor       =   &H00E0E0E0&
      Height          =   255
      Left            =   1200
      TabIndex        =   20
      Top             =   480
      Width           =   3375
   End
   Begin VB.Label Pop5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "0"
      Height          =   255
      Left            =   3600
      TabIndex        =   19
      Top             =   1680
      Width           =   615
   End
   Begin VB.Label Pop4 
      BackColor       =   &H00E0E0E0&
      Caption         =   "0"
      Height          =   255
      Left            =   3600
      TabIndex        =   18
      Top             =   1440
      Width           =   615
   End
   Begin VB.Label Pop3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "0"
      Height          =   255
      Left            =   3600
      TabIndex        =   17
      Top             =   1200
      Width           =   615
   End
   Begin VB.Label Pop2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "0"
      Height          =   255
      Left            =   3600
      TabIndex        =   16
      Top             =   960
      Width           =   615
   End
   Begin VB.Label Pop1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "0"
      Height          =   255
      Left            =   3600
      TabIndex        =   15
      Top             =   720
      Width           =   615
   End
   Begin VB.Label PopLabel 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Population"
      Height          =   255
      Left            =   3240
      TabIndex        =   14
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Wins5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins5"
      Height          =   255
      Left            =   2760
      TabIndex        =   13
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Wins4 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins4"
      Height          =   255
      Left            =   2760
      TabIndex        =   12
      Top             =   1440
      Width           =   735
   End
   Begin VB.Label Robname5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robname5"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   1680
      Width           =   2535
   End
   Begin VB.Label Robname4 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robname4"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1440
      Width           =   2535
   End
   Begin VB.Label Wins3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins3"
      Height          =   255
      Left            =   2760
      TabIndex        =   9
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label Wins2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins2"
      Height          =   255
      Left            =   2760
      TabIndex        =   8
      Top             =   960
      Width           =   735
   End
   Begin VB.Label Robname3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robname3"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   2535
   End
   Begin VB.Label Robname2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robname2"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   960
      Width           =   2535
   End
   Begin VB.Label Contests 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Caption         =   "1"
      Height          =   255
      Left            =   1320
      TabIndex        =   5
      Top             =   0
      Width           =   495
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "of"
      Height          =   255
      Left            =   2040
      TabIndex        =   4
      Top             =   0
      Width           =   255
   End
   Begin VB.Label wins1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins1"
      Height          =   255
      Left            =   2760
      TabIndex        =   3
      Top             =   720
      Width           =   735
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robname1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   2535
   End
   Begin VB.Label Wins 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Wins"
      Height          =   255
      Left            =   2640
      TabIndex        =   1
      Top             =   240
      Width           =   615
   End
   Begin VB.Label RoName 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Robot Name"
      Height          =   255
      Left            =   600
      TabIndex        =   0
      Top             =   240
      Width           =   1335
   End
End
Attribute VB_Name = "Contest_Form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 6/12/2012 form's icon change

' Stuff for automatic restarts and F1 contest mode
Private Sub Form_Load()
'  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub Option1_Click(Index As Integer) 'Botsareus 2/25/2014 Simplified
If Index = 0 Then Exit Sub
  'robot species index wins this round
    Dim t As Integer
    Dim realname As String
    For t = 1 To MaxRobs
        If Not rob(t).Veg And Not rob(t).Corpse And rob(t).exist Then
          realname = Left(rob(t).FName, Len(rob(t).FName) - 4)
          If realname <> PopArray(Index).SpName Then KillRobot t
        End If
    Next t
End Sub

Private Sub Form_Resize()
  If Contest_Form.WindowState = 0 Then
    Contest_Form.Height = 2700
    Contest_Form.Width = 5000
  End If
End Sub
