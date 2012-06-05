VERSION 5.00
Begin VB.Form InfoForm 
   BackColor       =   &H00C00000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Darwinbots"
   ClientHeight    =   6000
   ClientLeft      =   2205
   ClientTop       =   2550
   ClientWidth     =   9615
   Icon            =   "InfoForm.frx":0000
   LinkTopic       =   "Form10"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "InfoForm.frx":08CA
   ScaleHeight     =   400
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   641
   StartUpPosition =   1  'CenterOwner
   Tag             =   "16000"
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C00000&
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7680
      MaskColor       =   &H00800000&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   5520
      Width           =   1815
   End
   Begin VB.Label Label8 
      Appearance      =   0  'Flat
      BackColor       =   &H00300000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"InfoForm.frx":912B
      ForeColor       =   &H00FFC0C0&
      Height          =   1035
      Left            =   5070
      TabIndex        =   7
      Top             =   4785
      Width           =   2295
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":91C5
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1320
      Left            =   6840
      TabIndex        =   6
      Tag             =   "16002"
      Top             =   15
      Width           =   2730
   End
   Begin VB.Line Line6 
      BorderColor     =   &H00FFC0C0&
      X1              =   3
      X2              =   552
      Y1              =   92
      Y2              =   92
   End
   Begin VB.Line Line5 
      BorderColor     =   &H00FFC0C0&
      X1              =   71
      X2              =   159
      Y1              =   393
      Y2              =   393
   End
   Begin VB.Line Line4 
      BorderColor     =   &H00FFC0C0&
      X1              =   379
      X2              =   471
      Y1              =   182
      Y2              =   182
   End
   Begin VB.Line Line3 
      BorderColor     =   &H00FFC0C0&
      X1              =   322
      X2              =   402
      Y1              =   277
      Y2              =   277
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00FFC0C0&
      X1              =   34
      X2              =   79
      Y1              =   265
      Y2              =   265
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFC0C0&
      X1              =   36
      X2              =   80
      Y1              =   188
      Y2              =   188
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":92B1
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1275
      Left            =   4845
      TabIndex        =   5
      Tag             =   "16007"
      Top             =   1500
      Width           =   2175
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Attraverso i legami permanenti si possono spedire informazioni ed energia. "
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   885
      Left            =   4770
      TabIndex        =   4
      Tag             =   "16006"
      Top             =   3210
      Width           =   2205
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":9357
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1110
      Left            =   1305
      TabIndex        =   3
      Tag             =   "16005"
      Top             =   4830
      Width           =   2520
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":93FC
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1335
      Left            =   1230
      TabIndex        =   2
      Tag             =   "16004"
      Top             =   3270
      Width           =   2730
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":94FB
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1650
      Left            =   1230
      TabIndex        =   1
      Tag             =   "16003"
      Top             =   1485
      Width           =   3435
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"InfoForm.frx":9699
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFC0C0&
      Height          =   1320
      Left            =   4200
      TabIndex        =   0
      Tag             =   "16001"
      Top             =   15
      Width           =   2550
   End
End
Attribute VB_Name = "InfoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 3/24/2012 simplified the info form

Private Sub Command1_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  InfoForm.Show
End Sub
