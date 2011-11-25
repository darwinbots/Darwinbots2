VERSION 5.00
Begin VB.Form CustomGauss 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   4200
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5085
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Moveable        =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   5085
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox LinearDist 
      Caption         =   "Linear Distribution of all possible values"
      Height          =   195
      Left            =   780
      TabIndex        =   7
      Top             =   2400
      Width           =   3075
   End
   Begin VB.TextBox Upper 
      Height          =   285
      Left            =   3720
      TabIndex        =   6
      Text            =   "32000"
      Top             =   2940
      Width           =   555
   End
   Begin VB.TextBox Lower 
      Height          =   285
      Left            =   840
      TabIndex        =   3
      Text            =   "32000"
      Top             =   2940
      Width           =   555
   End
   Begin VB.TextBox Mean 
      Height          =   285
      Left            =   2280
      TabIndex        =   1
      Text            =   "32000"
      Top             =   2940
      Width           =   555
   End
   Begin VB.PictureBox Picture1 
      Height          =   2595
      Left            =   -60
      Picture         =   "CustomGauss.frx":0000
      ScaleHeight     =   2535
      ScaleWidth      =   5115
      TabIndex        =   0
      Top             =   -300
      Width           =   5175
   End
   Begin VB.Label Label2 
      Caption         =   "Integers /Percents"
      Height          =   495
      Left            =   60
      TabIndex        =   8
      Top             =   2700
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Upper"
      Height          =   255
      Index           =   2
      Left            =   3780
      TabIndex        =   5
      Top             =   2640
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Lower"
      Height          =   255
      Index           =   1
      Left            =   900
      TabIndex        =   4
      Top             =   2640
      Width           =   435
   End
   Begin VB.Label Label1 
      Caption         =   "Mean"
      Height          =   255
      Index           =   0
      Left            =   2370
      TabIndex        =   2
      Top             =   2640
      Width           =   435
   End
End
Attribute VB_Name = "CustomGauss"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

