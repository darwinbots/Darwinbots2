VERSION 5.00
Begin VB.Form RobDebug 
   Caption         =   "Robot Debugger"
   ClientHeight    =   3450
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6720
   LinkTopic       =   "Form2"
   ScaleHeight     =   3450
   ScaleWidth      =   6720
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Stack 
      Caption         =   "Stack"
      Height          =   3255
      Left            =   4620
      TabIndex        =   38
      Top             =   60
      Width           =   1995
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   19
         Left            =   1320
         TabIndex        =   58
         Text            =   "32000"
         Top             =   2940
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   18
         Left            =   1320
         TabIndex        =   57
         Text            =   "32000"
         Top             =   2640
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   17
         Left            =   1320
         TabIndex        =   56
         Text            =   "32000"
         Top             =   2340
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   16
         Left            =   1320
         TabIndex        =   55
         Text            =   "32000"
         Top             =   2040
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   15
         Left            =   1320
         TabIndex        =   54
         Text            =   "32000"
         Top             =   1740
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   14
         Left            =   1320
         TabIndex        =   53
         Text            =   "32000"
         Top             =   1440
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   13
         Left            =   1320
         TabIndex        =   52
         Text            =   "32000"
         Top             =   1140
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   12
         Left            =   1320
         TabIndex        =   51
         Text            =   "32000"
         Top             =   840
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   11
         Left            =   1320
         TabIndex        =   50
         Text            =   "32000"
         Top             =   540
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   10
         Left            =   1320
         TabIndex        =   49
         Text            =   "32000"
         Top             =   240
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   48
         Text            =   "32000"
         Top             =   2940
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   47
         Text            =   "32000"
         Top             =   2640
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   46
         Text            =   "32000"
         Top             =   2340
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   45
         Text            =   "32000"
         Top             =   2040
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   44
         Text            =   "32000"
         Top             =   1740
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   43
         Text            =   "32000"
         Top             =   1440
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   42
         Text            =   "32000"
         Top             =   1140
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   41
         Text            =   "32000"
         Top             =   840
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   40
         Text            =   "32000"
         Top             =   540
         Width           =   555
      End
      Begin VB.TextBox Text4 
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   39
         Text            =   "32000"
         Top             =   240
         Width           =   555
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "DNA Code Debugger"
      Height          =   315
      Left            =   1200
      TabIndex        =   25
      Top             =   2820
      Width           =   1755
   End
   Begin VB.Frame Frame1 
      Caption         =   "Parts"
      Height          =   3255
      Left            =   3060
      TabIndex        =   18
      Top             =   60
      Width           =   1395
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   5
         Left            =   840
         TabIndex        =   37
         Top             =   1680
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   4
         Left            =   840
         TabIndex        =   36
         Top             =   1380
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   3
         Left            =   840
         TabIndex        =   35
         Top             =   1080
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   2
         Left            =   840
         TabIndex        =   34
         Top             =   780
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   1
         Left            =   840
         TabIndex        =   33
         Top             =   480
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Index           =   0
         Left            =   840
         TabIndex        =   32
         Top             =   180
         Width           =   495
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   3
         Left            =   780
         Locked          =   -1  'True
         TabIndex        =   30
         Top             =   2820
         Width           =   495
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   2
         Left            =   120
         TabIndex        =   29
         Top             =   2820
         Width           =   495
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   1
         Left            =   780
         Locked          =   -1  'True
         TabIndex        =   28
         Top             =   2460
         Width           =   495
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   27
         Top             =   2460
         Width           =   495
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Custom Memory"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   26
         Top             =   2100
         Width           =   1185
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Venom"
         Height          =   195
         Index           =   5
         Left            =   120
         TabIndex        =   24
         Top             =   1740
         Width           =   495
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Slime"
         Height          =   195
         Index           =   4
         Left            =   120
         TabIndex        =   23
         Top             =   1140
         Width           =   375
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Poison"
         Height          =   195
         Index           =   3
         Left            =   120
         TabIndex        =   22
         Top             =   1440
         Width           =   480
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Shell"
         Height          =   195
         Index           =   2
         Left            =   120
         TabIndex        =   21
         Top             =   840
         Width           =   465
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Body"
         Height          =   195
         Index           =   1
         Left            =   120
         TabIndex        =   20
         Top             =   540
         Width           =   480
      End
      Begin VB.Label Label3 
         Caption         =   "Nrg"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   19
         Top             =   240
         Width           =   315
      End
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   8
      Left            =   180
      TabIndex        =   8
      Top             =   0
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   7
      Left            =   180
      TabIndex        =   7
      Top             =   2880
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   6
      Left            =   180
      TabIndex        =   6
      Top             =   2520
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   5
      Left            =   180
      TabIndex        =   5
      Top             =   2160
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   4
      Left            =   180
      TabIndex        =   4
      Top             =   1800
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   3
      Left            =   180
      TabIndex        =   3
      Top             =   1440
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   2
      Left            =   180
      TabIndex        =   2
      Top             =   1080
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   1
      Left            =   180
      TabIndex        =   1
      Top             =   720
      Width           =   435
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Index           =   0
      Left            =   180
      TabIndex        =   0
      Top             =   360
      Width           =   435
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Robot X - ""No text.txt"""
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1080
      TabIndex        =   31
      Top             =   60
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "9"
      Height          =   255
      Index           =   8
      Left            =   0
      TabIndex        =   17
      Top             =   2880
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "8"
      Height          =   255
      Index           =   7
      Left            =   0
      TabIndex        =   16
      Top             =   2520
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "7"
      Height          =   255
      Index           =   6
      Left            =   0
      TabIndex        =   15
      Top             =   2160
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "6"
      Height          =   255
      Index           =   5
      Left            =   0
      TabIndex        =   14
      Top             =   1800
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "5"
      Height          =   255
      Index           =   4
      Left            =   0
      TabIndex        =   13
      Top             =   1440
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "4"
      Height          =   255
      Index           =   3
      Left            =   0
      TabIndex        =   12
      Top             =   1080
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "3"
      Height          =   255
      Index           =   2
      Left            =   0
      TabIndex        =   11
      Top             =   720
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "2"
      Height          =   255
      Index           =   1
      Left            =   0
      TabIndex        =   10
      Top             =   360
      Width           =   135
   End
   Begin VB.Label Label1 
      Caption         =   "1"
      Height          =   255
      Index           =   0
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   135
   End
   Begin VB.Line Line7 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   1740
   End
   Begin VB.Line Line6 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   1380
   End
   Begin VB.Line Line5 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   1020
   End
   Begin VB.Line Line9 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   2460
   End
   Begin VB.Line Line8 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   2100
   End
   Begin VB.Line Line4 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   660
   End
   Begin VB.Line Line3 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   300
   End
   Begin VB.Line Line2 
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   2820
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   2100
      X2              =   660
      Y1              =   1440
      Y2              =   3120
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   600
      X2              =   2100
      Y1              =   0
      Y2              =   1440
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   10
      Height          =   195
      Left            =   1620
      Shape           =   3  'Circle
      Top             =   1380
      Width           =   100
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H000000FF&
      BorderWidth     =   3
      Height          =   795
      Left            =   1740
      Shape           =   3  'Circle
      Top             =   1080
      Width           =   795
   End
End
Attribute VB_Name = "RobDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

