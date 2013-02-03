VERSION 5.00
Begin VB.Form LeagueForm 
   Caption         =   "League Table"
   ClientHeight    =   5955
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   9120
   FontTransparent =   0   'False
   Icon            =   "LeagueForm.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   Picture         =   "LeagueForm.frx":08CA
   ScaleHeight     =   5955
   ScaleMode       =   0  'User
   ScaleWidth      =   9120
   StartUpPosition =   1  'CenterOwner
   Begin VB.OptionButton ChallengersOption 
      Appearance      =   0  'Flat
      BackColor       =   &H00004080&
      Caption         =   "Challengers"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   495
      Left            =   6360
      MaskColor       =   &H00004080&
      Style           =   1  'Graphical
      TabIndex        =   61
      TabStop         =   0   'False
      Top             =   120
      Width           =   2655
   End
   Begin VB.OptionButton F1ChallengeOption 
      Appearance      =   0  'Flat
      BackColor       =   &H00004080&
      Caption         =   "F1 Challange League"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   495
      Left            =   300
      MaskColor       =   &H00004080&
      Style           =   1  'Graphical
      TabIndex        =   60
      TabStop         =   0   'False
      Top             =   120
      UseMaskColor    =   -1  'True
      Width           =   5775
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00004080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   30
      Left            =   4440
      TabIndex        =   63
      Top             =   5400
      Width           =   2535
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Current Challenger:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   435
      Left            =   1860
      TabIndex        =   62
      Top             =   5340
      Width           =   2475
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "30"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   29
      Left            =   6060
      TabIndex        =   59
      Top             =   4860
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "29"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   28
      Left            =   6060
      TabIndex        =   58
      Top             =   4440
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "28"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   27
      Left            =   6060
      TabIndex        =   57
      Top             =   4020
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "27"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   26
      Left            =   6060
      TabIndex        =   56
      Top             =   3600
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "26"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   25
      Left            =   6060
      TabIndex        =   55
      Top             =   3180
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "25"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   24
      Left            =   6060
      TabIndex        =   54
      Top             =   2760
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "24"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   23
      Left            =   6060
      TabIndex        =   53
      Top             =   2340
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "23"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   22
      Left            =   6060
      TabIndex        =   52
      Top             =   1920
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   21
      Left            =   6060
      TabIndex        =   51
      Top             =   1500
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "21"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   20
      Left            =   6060
      TabIndex        =   50
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   19
      Left            =   3060
      TabIndex        =   49
      Top             =   4860
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "19"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   18
      Left            =   3060
      TabIndex        =   48
      Top             =   4440
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "18"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   17
      Left            =   3060
      TabIndex        =   47
      Top             =   4020
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "17"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   16
      Left            =   3060
      TabIndex        =   46
      Top             =   3600
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "16"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   15
      Left            =   3060
      TabIndex        =   45
      Top             =   3180
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "15"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   14
      Left            =   3060
      TabIndex        =   44
      Top             =   2760
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "14"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   13
      Left            =   3060
      TabIndex        =   43
      Top             =   2340
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "13"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   12
      Left            =   3060
      TabIndex        =   42
      Top             =   1920
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   11
      Left            =   3060
      TabIndex        =   41
      Top             =   1500
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   10
      Left            =   3060
      TabIndex        =   40
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   9
      Left            =   60
      TabIndex        =   39
      Top             =   4860
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   8
      Left            =   60
      TabIndex        =   38
      Top             =   4440
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   7
      Left            =   60
      TabIndex        =   37
      Top             =   4020
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   6
      Left            =   60
      TabIndex        =   36
      Top             =   3600
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   5
      Left            =   60
      TabIndex        =   35
      Top             =   3180
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   4
      Left            =   60
      TabIndex        =   34
      Top             =   2760
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   3
      Left            =   60
      TabIndex        =   33
      Top             =   2340
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   2
      Left            =   60
      TabIndex        =   32
      Top             =   1920
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   1
      Left            =   60
      TabIndex        =   31
      Top             =   1500
      Width           =   255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   0
      Left            =   60
      TabIndex        =   30
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   29
      Left            =   6420
      TabIndex        =   29
      Top             =   4860
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   28
      Left            =   6420
      TabIndex        =   28
      Top             =   4440
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   27
      Left            =   6420
      TabIndex        =   27
      Top             =   4020
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   26
      Left            =   6420
      TabIndex        =   26
      Top             =   3600
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   25
      Left            =   6420
      TabIndex        =   25
      Top             =   3180
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   24
      Left            =   6420
      TabIndex        =   24
      Top             =   2760
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   23
      Left            =   6420
      TabIndex        =   23
      Top             =   2340
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   22
      Left            =   6420
      TabIndex        =   22
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   21
      Left            =   6420
      TabIndex        =   21
      Top             =   1500
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   20
      Left            =   6420
      TabIndex        =   20
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   19
      Left            =   3420
      TabIndex        =   19
      Top             =   4860
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   18
      Left            =   3420
      TabIndex        =   18
      Top             =   4440
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   17
      Left            =   3420
      TabIndex        =   17
      Top             =   4020
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   16
      Left            =   3420
      TabIndex        =   16
      Top             =   3600
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   15
      Left            =   3420
      TabIndex        =   15
      Top             =   3180
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   14
      Left            =   3420
      TabIndex        =   14
      Top             =   2760
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   13
      Left            =   3420
      TabIndex        =   13
      Top             =   2340
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   12
      Left            =   3420
      TabIndex        =   12
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   11
      Left            =   3420
      TabIndex        =   11
      Top             =   1500
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   10
      Left            =   3420
      TabIndex        =   10
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   9
      Left            =   420
      TabIndex        =   9
      Top             =   4860
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   8
      Left            =   420
      TabIndex        =   8
      Top             =   4440
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   7
      Left            =   420
      TabIndex        =   7
      Top             =   4020
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   6
      Left            =   420
      TabIndex        =   6
      Top             =   3600
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   5
      Left            =   420
      TabIndex        =   5
      Top             =   3180
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   4
      Left            =   420
      TabIndex        =   4
      Top             =   2760
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   3
      Left            =   420
      TabIndex        =   3
      Top             =   2340
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   2
      Left            =   420
      TabIndex        =   2
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   1
      Left            =   420
      TabIndex        =   1
      Top             =   1500
      Width           =   2535
   End
   Begin VB.Label Robname1 
      BackColor       =   &H00000080&
      BackStyle       =   0  'Transparent
      Caption         =   "Robname"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0E0FF&
      Height          =   255
      Index           =   0
      Left            =   420
      TabIndex        =   0
      Top             =   1080
      Width           =   2535
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Index           =   0
      Begin VB.Menu Save 
         Caption         =   "Save"
         Index           =   1
      End
      Begin VB.Menu Reset 
         Caption         =   "Reset"
         Index           =   2
      End
   End
End
Attribute VB_Name = "LeagueForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Botsareusnotdone to be replaced later by external controlers
Option Explicit

Public Sub ChallengersOption_Click()
'switch view to a list of all challengers
  Erase_League_Highlights
  Dim Index As Integer
  For Index = 0 To 29
    If LeagueChallengers(Index).Name <> "" And LeagueChallengers(Index).Name <> "EMPTY.TXT" Then
      Robname1(Index).Caption = Left(LeagueChallengers(Index).Name, Len(LeagueChallengers(Index).Name) - 4)
      Robname1(Index).Visible = True
      Label2(Index).Visible = True
    Else
      Robname1(Index).Visible = False
      Label2(Index).Visible = False
    End If
  Next Index
  
  Write_Challenger
  
  If Attacker < 0 Then Highlight_Challenger_Challenger
End Sub

Public Sub F1ChallengeOption_Click()
  Dim Index As Integer
  Erase_League_Highlights
  For Index = 0 To 29
    
    If LeagueEntrants(Index).Name <> "" And LeagueEntrants(Index).Name <> "EMPTY.TXT" Then
      Robname1(Index).Caption = Left(LeagueEntrants(Index).Name, Len(LeagueEntrants(Index).Name) - 4)
      Robname1(Index).Visible = True
      Label2(Index).Visible = True
    Else
      Robname1(Index).Visible = False
      Label2(Index).Visible = False
    End If
  Next Index
  
  Highlight_Defender
  If Attacker > -31 And Attacker < 30 Then Write_Challenger
  If Attacker > 0 Then Highlight_League_Challenger
End Sub

Private Sub Write_Challenger()
  If Attacker >= 0 Then
    Robname1(30).Caption = Left(LeagueEntrants(Attacker).Name, Len(LeagueEntrants(Attacker).Name) - 4)
  Else
    If LeagueChallengers(-Attacker - 1).Name = "" Then LeagueChallengers(-Attacker - 1).Name = "EMPTY.TXT"
    Robname1(30).Caption = Left(LeagueChallengers(-Attacker - 1).Name, Len(LeagueChallengers(-Attacker - 1).Name) - 4)
  End If
End Sub

Private Sub Highlight_Defender()
  Robname1(Defender).BackStyle = 1
End Sub

Private Sub Highlight_League_Challenger()
  Robname1(Attacker).BackStyle = 1
End Sub

Private Sub Highlight_Challenger_Challenger()
  Robname1(-Attacker - 1).BackStyle = 1
End Sub

Public Sub Erase_League_Highlights()
  Dim Index As Integer
  
  For Index = 0 To 29
    Robname1(Index).BackStyle = 0
  Next Index
End Sub

Private Sub Form_Resize()
  If LeagueForm.WindowState <> 1 Then
    LeagueForm.Width = 9240
    LeagueForm.Height = 6500 'EricL - 3/20/2006 increased height from 6360 to 6500 so Challenger woudl display
  End If
End Sub

Private Sub Reset_Click(Index As Integer)
  If MsgBox("This will reload all league settings, losing current results.  Are you sure?", vbYesNo, "Reset League") = vbYes Then
    optionsform.StartNew_Click
  End If
End Sub

Private Sub save_Click(Index As Integer)
  If Save_League_File(Leaguename) <> -1 Then
    MsgBox "League file saved successfully.", vbOKOnly, "Saving league..."
  End If
End Sub
