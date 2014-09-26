VERSION 5.00
Begin VB.Form grafico 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   Caption         =   "Form2"
   ClientHeight    =   10950
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7995
   Icon            =   "grafico.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10950
   ScaleWidth      =   7995
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox chk_GDsave 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Save on d.p. 999"
      Height          =   255
      Left            =   6600
      TabIndex        =   139
      ToolTipText     =   "Saves graph data to file(s) on every data point 999"
      Top             =   5520
      Width           =   1695
   End
   Begin VB.CommandButton ResetButton 
      Caption         =   "Reset"
      Height          =   255
      Left            =   5400
      TabIndex        =   138
      TabStop         =   0   'False
      ToolTipText     =   "Updates graph now without waiting for next update interval"
      Top             =   5520
      Width           =   1095
   End
   Begin VB.CommandButton UpdateNow 
      Caption         =   "Update Now"
      Height          =   255
      Left            =   4200
      TabIndex        =   12
      TabStop         =   0   'False
      ToolTipText     =   "Updates graph now without waiting for next update interval"
      Top             =   5520
      Width           =   1095
   End
   Begin VB.Label secret_exit 
      BackStyle       =   0  'Transparent
      Caption         =   "T"
      BeginProperty Font 
         Name            =   "Wingdings 2"
         Size            =   6.75
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   140
      Top             =   0
      Width           =   375
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   65
      Left            =   2400
      TabIndex        =   137
      Top             =   5760
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   64
      Left            =   2400
      TabIndex        =   136
      Top             =   5880
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   63
      Left            =   2400
      TabIndex        =   135
      Top             =   6000
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   62
      Left            =   2400
      TabIndex        =   134
      Top             =   6120
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   61
      Left            =   2400
      TabIndex        =   133
      Top             =   6240
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   60
      Left            =   2400
      TabIndex        =   132
      Top             =   6360
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   59
      Left            =   2400
      TabIndex        =   131
      Top             =   6480
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   58
      Left            =   2400
      TabIndex        =   130
      Top             =   6600
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   57
      Left            =   2400
      TabIndex        =   129
      Top             =   6840
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   56
      Left            =   2400
      TabIndex        =   128
      Top             =   6960
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   55
      Left            =   2400
      TabIndex        =   127
      Top             =   7080
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   54
      Left            =   2400
      TabIndex        =   126
      Top             =   7200
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   53
      Left            =   2400
      TabIndex        =   125
      Top             =   7320
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   52
      Left            =   2400
      TabIndex        =   124
      Top             =   7440
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   51
      Left            =   2400
      TabIndex        =   123
      Top             =   7560
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   50
      Left            =   2400
      TabIndex        =   122
      Top             =   7680
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   49
      Left            =   2400
      TabIndex        =   121
      Top             =   7800
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   48
      Left            =   2400
      TabIndex        =   120
      Top             =   7920
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   47
      Left            =   2400
      TabIndex        =   119
      Top             =   8040
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   46
      Left            =   2400
      TabIndex        =   118
      Top             =   8160
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   45
      Left            =   2400
      TabIndex        =   117
      Top             =   8280
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   44
      Left            =   2400
      TabIndex        =   116
      Top             =   11160
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   43
      Left            =   2400
      TabIndex        =   115
      Top             =   11040
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   42
      Left            =   2400
      TabIndex        =   114
      Top             =   10920
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   67
      Left            =   1125
      TabIndex        =   113
      Top             =   5520
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   66
      Left            =   1125
      TabIndex        =   112
      Top             =   5760
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   65
      Left            =   1125
      TabIndex        =   111
      Top             =   6000
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   64
      Left            =   1125
      TabIndex        =   110
      Top             =   6240
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   63
      Left            =   1125
      TabIndex        =   109
      Top             =   6480
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   62
      Left            =   1125
      TabIndex        =   108
      Top             =   6720
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   61
      Left            =   1125
      TabIndex        =   107
      Top             =   6960
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   60
      Left            =   1125
      TabIndex        =   106
      Top             =   7200
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   59
      Left            =   1125
      TabIndex        =   105
      Top             =   7440
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   58
      Left            =   1125
      TabIndex        =   104
      Top             =   7680
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   57
      Left            =   1125
      TabIndex        =   103
      Top             =   7920
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   56
      Left            =   1080
      TabIndex        =   102
      Top             =   8235
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   55
      Left            =   1080
      TabIndex        =   101
      Top             =   8475
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   54
      Left            =   1080
      TabIndex        =   100
      Top             =   8715
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   53
      Left            =   1080
      TabIndex        =   99
      Top             =   8955
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   52
      Left            =   1080
      TabIndex        =   98
      Top             =   9195
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   51
      Left            =   1080
      TabIndex        =   97
      Top             =   9435
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   50
      Left            =   1080
      TabIndex        =   96
      Top             =   9675
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   49
      Left            =   1080
      TabIndex        =   95
      Top             =   9915
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   48
      Left            =   1080
      TabIndex        =   94
      Top             =   10155
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   47
      Left            =   1080
      TabIndex        =   93
      Top             =   10275
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   46
      Left            =   1125
      TabIndex        =   92
      Top             =   11640
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   45
      Left            =   1125
      TabIndex        =   91
      Top             =   11400
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   44
      Left            =   1125
      TabIndex        =   90
      Top             =   11160
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   43
      Left            =   1080
      TabIndex        =   89
      Top             =   10875
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   42
      Left            =   1125
      TabIndex        =   88
      Top             =   10680
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00008000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   66
      Left            =   645
      Shape           =   3  'Circle
      Top             =   5595
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   65
      Left            =   645
      Shape           =   3  'Circle
      Top             =   5835
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   64
      Left            =   645
      Shape           =   3  'Circle
      Top             =   6075
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   63
      Left            =   645
      Shape           =   3  'Circle
      Top             =   6315
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF00FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   62
      Left            =   645
      Shape           =   3  'Circle
      Top             =   6555
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00E0E0E0&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   61
      Left            =   645
      Shape           =   3  'Circle
      Top             =   6795
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00808000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   60
      Left            =   645
      Shape           =   3  'Circle
      Top             =   7035
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00C0C0FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   59
      Left            =   645
      Shape           =   3  'Circle
      Top             =   7275
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF8080&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   58
      Left            =   645
      Shape           =   3  'Circle
      Top             =   7515
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   57
      Left            =   645
      Shape           =   3  'Circle
      Top             =   7755
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   56
      Left            =   645
      Shape           =   3  'Circle
      Top             =   7995
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   55
      Left            =   600
      Shape           =   3  'Circle
      Top             =   8190
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   54
      Left            =   600
      Shape           =   3  'Circle
      Top             =   8430
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   53
      Left            =   600
      Shape           =   3  'Circle
      Top             =   8670
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   52
      Left            =   600
      Shape           =   3  'Circle
      Top             =   8910
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   51
      Left            =   600
      Shape           =   3  'Circle
      Top             =   9150
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   50
      Left            =   600
      Shape           =   3  'Circle
      Top             =   9390
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   49
      Left            =   600
      Shape           =   3  'Circle
      Top             =   9750
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   48
      Left            =   600
      Shape           =   3  'Circle
      Top             =   9990
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   47
      Left            =   600
      Shape           =   3  'Circle
      Top             =   10350
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   46
      Left            =   600
      Shape           =   3  'Circle
      Top             =   10590
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   45
      Left            =   645
      Shape           =   3  'Circle
      Top             =   11475
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   44
      Left            =   645
      Shape           =   3  'Circle
      Top             =   11235
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   43
      Left            =   645
      Shape           =   3  'Circle
      Top             =   10995
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00008000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   42
      Left            =   645
      Shape           =   3  'Circle
      Top             =   10755
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label YLab 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   1920
      TabIndex        =   87
      Top             =   9480
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   41
      Left            =   6405
      TabIndex        =   86
      Top             =   5205
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   40
      Left            =   6360
      TabIndex        =   85
      Top             =   5400
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   39
      Left            =   6405
      TabIndex        =   84
      Top             =   5685
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   38
      Left            =   6405
      TabIndex        =   83
      Top             =   5925
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   37
      Left            =   6405
      TabIndex        =   82
      Top             =   6165
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   36
      Left            =   6405
      TabIndex        =   81
      Top             =   6405
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   35
      Left            =   6405
      TabIndex        =   80
      Top             =   6645
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   34
      Left            =   6405
      TabIndex        =   79
      Top             =   6885
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   33
      Left            =   6405
      TabIndex        =   78
      Top             =   7125
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00008000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   41
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   5205
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   40
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   5445
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   39
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   5685
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   38
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   5925
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF00FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   37
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   6165
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00E0E0E0&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   36
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   6405
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00808000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   35
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   6645
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00C0C0FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   34
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   6885
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF8080&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   33
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   7125
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   32
      Left            =   6405
      TabIndex        =   77
      Top             =   7365
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   32
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   7365
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   31
      Left            =   6405
      TabIndex        =   76
      Top             =   7605
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   31
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   7605
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   30
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   7800
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   30
      Left            =   6360
      TabIndex        =   75
      Top             =   7920
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   29
      Left            =   6360
      TabIndex        =   74
      Top             =   8160
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   28
      Left            =   6360
      TabIndex        =   73
      Top             =   8400
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   27
      Left            =   6360
      TabIndex        =   72
      Top             =   8640
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   26
      Left            =   6360
      TabIndex        =   71
      Top             =   8880
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   25
      Left            =   6360
      TabIndex        =   70
      Top             =   9120
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   24
      Left            =   6360
      TabIndex        =   69
      Top             =   9360
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   23
      Left            =   6360
      TabIndex        =   68
      Top             =   9600
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   22
      Left            =   6360
      TabIndex        =   67
      Top             =   9840
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   29
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   8040
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   28
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   8280
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   27
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   8520
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   26
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   8760
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   25
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   9000
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   24
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   9360
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   23
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   9600
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   22
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   9960
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   41
      Left            =   5520
      TabIndex        =   66
      Top             =   5160
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   40
      Left            =   5520
      TabIndex        =   65
      Top             =   5280
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   39
      Left            =   5520
      TabIndex        =   64
      Top             =   5400
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   38
      Left            =   5520
      TabIndex        =   63
      Top             =   5520
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   37
      Left            =   5520
      TabIndex        =   62
      Top             =   5640
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   36
      Left            =   5520
      TabIndex        =   61
      Top             =   5760
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   35
      Left            =   5520
      TabIndex        =   60
      Top             =   5880
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   34
      Left            =   5520
      TabIndex        =   59
      Top             =   6000
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   33
      Left            =   5520
      TabIndex        =   58
      Top             =   6240
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   32
      Left            =   5520
      TabIndex        =   57
      Top             =   6360
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   31
      Left            =   5520
      TabIndex        =   56
      Top             =   6480
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   30
      Left            =   5520
      TabIndex        =   55
      Top             =   6600
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   29
      Left            =   5520
      TabIndex        =   54
      Top             =   6720
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   28
      Left            =   5520
      TabIndex        =   53
      Top             =   6840
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   27
      Left            =   5520
      TabIndex        =   52
      Top             =   6960
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   26
      Left            =   5520
      TabIndex        =   51
      Top             =   7080
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   25
      Left            =   5520
      TabIndex        =   50
      Top             =   7200
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   24
      Left            =   5520
      TabIndex        =   49
      Top             =   7320
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   23
      Left            =   5520
      TabIndex        =   48
      Top             =   7440
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   22
      Left            =   5520
      TabIndex        =   47
      Top             =   7560
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   21
      Left            =   6360
      TabIndex        =   46
      Top             =   9960
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   21
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   10200
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   21
      Left            =   5520
      TabIndex        =   45
      Top             =   7680
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   20
      Left            =   5520
      TabIndex        =   44
      Top             =   2520
      Width           =   540
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   20
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   5040
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   20
      Left            =   6360
      TabIndex        =   43
      Top             =   4800
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   19
      Left            =   5520
      TabIndex        =   42
      Top             =   2400
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   18
      Left            =   5520
      TabIndex        =   41
      Top             =   2280
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   17
      Left            =   5520
      TabIndex        =   40
      Top             =   2160
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   16
      Left            =   5520
      TabIndex        =   39
      Top             =   2040
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   15
      Left            =   5520
      TabIndex        =   38
      Top             =   1920
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   14
      Left            =   5520
      TabIndex        =   37
      Top             =   1800
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   13
      Left            =   5520
      TabIndex        =   36
      Top             =   1680
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   12
      Left            =   5520
      TabIndex        =   35
      Top             =   1560
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   11
      Left            =   5520
      TabIndex        =   34
      Top             =   1440
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   10
      Left            =   5520
      TabIndex        =   33
      Top             =   1320
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   9
      Left            =   5520
      TabIndex        =   32
      Top             =   1200
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   8
      Left            =   5520
      TabIndex        =   31
      Top             =   1080
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   7
      Left            =   5520
      TabIndex        =   30
      Top             =   840
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   6
      Left            =   5520
      TabIndex        =   29
      Top             =   720
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   5
      Left            =   5520
      TabIndex        =   28
      Top             =   600
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   4
      Left            =   5520
      TabIndex        =   27
      Top             =   480
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   3
      Left            =   5520
      TabIndex        =   26
      Top             =   360
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   2
      Left            =   5520
      TabIndex        =   25
      Top             =   240
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   5520
      TabIndex        =   24
      Top             =   120
      Width           =   540
   End
   Begin VB.Label popnum 
      BackStyle       =   0  'Transparent
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   5520
      TabIndex        =   23
      Top             =   0
      Width           =   540
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   19
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   4800
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   18
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   4440
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   17
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   4200
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   16
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   3840
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   15
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   3600
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   14
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   3360
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   13
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   3120
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   12
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   2880
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   19
      Left            =   6360
      TabIndex        =   22
      Top             =   4680
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   18
      Left            =   6360
      TabIndex        =   21
      Top             =   4440
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   17
      Left            =   6360
      TabIndex        =   20
      Top             =   4200
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   16
      Left            =   6360
      TabIndex        =   19
      Top             =   3960
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   15
      Left            =   6360
      TabIndex        =   18
      Top             =   3720
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   14
      Left            =   6360
      TabIndex        =   17
      Top             =   3480
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   13
      Left            =   6360
      TabIndex        =   16
      Top             =   3240
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   12
      Left            =   6360
      TabIndex        =   15
      Top             =   3000
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   11
      Left            =   6360
      TabIndex        =   14
      Top             =   2760
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   11
      Left            =   6120
      Shape           =   3  'Circle
      Top             =   2640
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   10
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   2445
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   10
      Left            =   6405
      TabIndex        =   13
      Top             =   2445
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label YLab 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   1920
      TabIndex        =   11
      Top             =   10440
      Width           =   1095
   End
   Begin VB.Label XLabel 
      BackStyle       =   0  'Transparent
      Caption         =   "Cycles"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   10
      Top             =   5520
      Width           =   4695
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   9
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   2205
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   9
      Left            =   6405
      TabIndex        =   9
      Top             =   2205
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF8080&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   8
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   1965
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00C0C0FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   7
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   1725
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00808000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   6
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   1485
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00E0E0E0&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   5
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   1245
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF00FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   4
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   1005
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   3
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   765
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   2
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   525
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   1
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   285
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00008000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   0
      Left            =   6165
      Shape           =   3  'Circle
      Top             =   45
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   8
      Left            =   6405
      TabIndex        =   8
      Top             =   1965
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   7
      Left            =   6405
      TabIndex        =   7
      Top             =   1725
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   6
      Left            =   6405
      TabIndex        =   6
      Top             =   1485
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   5
      Left            =   6405
      TabIndex        =   5
      Top             =   1245
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   4
      Left            =   6405
      TabIndex        =   4
      Top             =   1005
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   3
      Left            =   6405
      TabIndex        =   3
      Top             =   765
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   2
      Left            =   6405
      TabIndex        =   2
      Top             =   525
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   6405
      TabIndex        =   1
      Top             =   285
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   6405
      TabIndex        =   0
      Top             =   45
      Visible         =   0   'False
      Width           =   3500
   End
   Begin VB.Shape Riquadro 
      BackColor       =   &H00400000&
      BorderColor     =   &H80000006&
      Height          =   5355
      Left            =   120
      Top             =   30
      Visible         =   0   'False
      Width           =   5355
   End
End
Attribute VB_Name = "grafico"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Const MaxData As Integer = 1000
Const MaxItems As Integer = 65
Dim data(1000, MaxItems) As Single
Dim SerCol(MaxItems) As Long
Dim SerName(MaxItems) As String
Dim Sum(MaxItems) As Single
Dim Pivot As Integer
Dim MaxSeries As Byte
Dim maxy As Single

Dim secretunloadoverwrite As Boolean 'Botsareus 6/29/2013

' EricL 4/7/2006
'Public Sub SetYLabel(a As String)
'  Dim b As String
'  b = ""
'  For t = 1 To Len(a)
'    b = b + Mid(a, t, 1) + vbCrLf
'  Next t
'  'YLabel.Caption = b
'  Me.Caption = a + " / Cycles graph"
'End Sub

Public Sub ResetGraph()
  Dim t As Integer
  Erase data
  Erase SerCol
  Erase SerName
  Pivot = 0
  MaxSeries = 0
  For t = 0 To MaxItems
    Label1(t).Visible = False
    Shape3(t).Visible = False
    popnum(t).Visible = False
  Next t
End Sub

Public Function AddSeries(n As String, c As Long)
  If MaxSeries >= MaxItems Then MaxSeries = MaxItems - 1 ' maxed out the number of series in the graph, so replace the last one with the new
  SerName(MaxSeries) = n
  If Right(n, 4) = ".txt" Then
    n = Left(n, Len(n) - 4)
  End If
  If Len(n) > 28 Then
    Label1(MaxSeries).Caption = Left(n, 25) + "..."
  Else
    Label1(MaxSeries).Caption = n
  End If
  Shape3(MaxSeries).FillColor = c
  Label1(MaxSeries).Visible = True
  Shape3(MaxSeries).Visible = True
  popnum(MaxSeries).Visible = True
  SerCol(MaxSeries) = Shape3(MaxSeries).FillColor
  MaxSeries = MaxSeries + 1
  AddSeries = MaxSeries - 1
End Function

Public Sub IncSeries(n As String)
  Dim k As Byte
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) <> n Then
    AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    k = MaxSeries - 1
  End If
  data(Pivot, k) = data(Pivot, k) + 1
End Sub

Public Sub SetValues(n As String, v As Single)
  Dim k As Byte
  Dim i As Integer
  Dim GraphNumber As Integer
  
  If v = 0 Then Exit Sub
  
  i = 0
  k = 0
  
  ' see if the series exists in the graph
  While k < MaxSeries And SerName(k) <> n And k < MaxItems
     k = k + 1
  Wend
  
  ' SerName(k) will <> n if this is a new series
  
  If SerName(k) <> n Or k = MaxItems Then
     
    GraphNumber = WhichGraphAmI
    
    If GraphNumber = 10 Then ' Autocosts graph
      If n = "Cost Multiplier" Then
         AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Population / Target" Then
         AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Total Bots" Then
         AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Upper Range" Then
         AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Lower Range" Then
         AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Zero Level" Then
        AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      ElseIf n = "Reinstatement Level" Then
        AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
      End If
    Else ' all other graphs uses species as series labels
      'Check if the name matches a species.  Might be a new species from the internet
      While SimOpts.Specie(i).Name <> n And i < SimOpts.SpeciesNum And i <= MAXNATIVESPECIES
        i = i + 1
      Wend
      If i = SimOpts.SpeciesNum Then ' Internet Species not in this sim yet
        i = 0
        While InternetSpecies(i).Name <> n And i < numInternetSpecies
          i = i + 1
          If i > MAXINTERNETSPECIES Then Exit Sub
        Wend
        AddSeries n, InternetSpecies(i).color
      Else ' species already in the species list
        AddSeries n, SimOpts.Specie(i).color
      End If
    End If
    
    k = MaxSeries - 1
  End If
  
  
  data(Pivot, k) = v
 
End Sub

Public Sub KillZeroValuedSeries(k As Integer)
Dim i As Integer
Dim Sum As Single

  Sum = 0

  For i = 0 To MaxData
    Sum = data(i, k) + Sum
  Next i
  
  If Sum = 0 Then DelSeries (CInt(k))
End Sub

Public Sub SetValuesP(k As Integer, v As Single)
  data(Pivot, k) = v
End Sub

Public Function GetPosition(n As String) As Integer
  Dim k As Integer
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) <> n Then
    AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    k = MaxSeries - 1
  End If
  GetPosition = k
End Function

Public Sub setcolor(n As String, c As Long)
Dim k As Integer
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) = n Then
    Shape3(k).FillColor = c
    SerCol(k) = c
  End If
End Sub


Public Function SwapSeries(i As Integer, t As Integer)
Dim X As Integer
  For X = 0 To MaxData
     data(X, MaxItems) = data(X, i)
     data(X, i) = data(X, t)
     data(X, t) = data(X, MaxItems)
  Next X
  Label1(MaxItems).Caption = Label1(i).Caption
  Shape3(MaxItems).FillColor = Shape3(i).FillColor
  popnum(MaxItems).Caption = popnum(i).Caption
  Label1(i).Caption = Label1(t).Caption
  Shape3(i).FillColor = Shape3(t).FillColor
  popnum(i).Caption = popnum(t).Caption
  Label1(t).Caption = Label1(MaxItems).Caption
  Shape3(t).FillColor = Shape3(MaxItems).FillColor
  popnum(t).Caption = popnum(MaxItems).Caption
  SerName(MaxItems) = SerName(i)
  SerName(i) = SerName(t)
  SerName(t) = SerName(MaxItems)
  SerName(MaxItems) = ""
  SerCol(MaxItems) = SerCol(i)
  SerCol(i) = SerCol(t)
  SerCol(t) = SerCol(MaxItems)
End Function


Public Sub ReorderSeries()
Dim i As Integer
Dim t As Integer
  For i = 0 To MaxSeries - 1
    For t = i To MaxSeries - 1
      If data(Pivot - 1, i) < data(Pivot - 1, t) Then SwapSeries i, t
    Next t
  Next i
End Sub


Public Sub DelSeries(n As Integer)
Dim k As Integer
Dim t As Integer

  If n < MaxSeries - 1 Then
    For k = n To MaxSeries - 1
      For t = 0 To MaxData
        data(t, k) = data(t, k + 1)
      Next t
      Label1(k).Caption = Label1(k + 1).Caption
      Shape3(k).FillColor = Shape3(k + 1).FillColor
      popnum(k).Caption = popnum(k + 1).Caption
      SerName(k) = SerName(k + 1)
      SerCol(k) = SerCol(k + 1)
    Next k
  End If
  Label1(MaxSeries - 1).Visible = False
  Shape3(MaxSeries - 1).Visible = False
  popnum(MaxSeries - 1).Visible = False
  SerName(MaxSeries - 1) = ""
  MaxSeries = MaxSeries - 1
End Sub

Private Sub chk_GDsave_Click()
graphsave(WhichGraphAmI) = chk_GDsave.value = 1
End Sub

Private Sub Form_Activate()
  Dim s As String
  Dim t As Integer
  For t = 0 To MaxItems
    If SerName(t) <> "" Then
      Label1(t).Visible = True
      Shape3(t).Visible = True
      popnum(t).Visible = True
      s = SerName(t)
      If Right(s, 4) = ".txt" Then
        s = Left(s, Len(s) - 4)
      End If
      If Len(s) > 32 Then
        Label1(t).Caption = Left(s, 25) + "..." + Right(s, 4)
      Else
        Label1(t).Caption = s
      End If
      Shape3(t).FillColor = SerCol(t)
    End If
  Next t
  
  'Botsareus 5/31/2013 Special graph info
  graphvisible(WhichGraphAmI) = True
  
  'Botsareus 3/19/2014 Auto save
  If y_graphs And (x_restartmode = 4 Or x_restartmode = 5) Then
    graphsave(WhichGraphAmI) = True
    chk_GDsave.value = 1
  End If

End Sub

Private Sub Form_Load()
Dim t As Integer
  For t = 0 To MaxItems
    Label1(t).Visible = False
    Shape3(t).Visible = False
    popnum(t).Visible = False
    popnum(t).Height = 255
  Next t
  SetWindowPos hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  Me.Height = 4000
  Me.Width = 8400
  XLabel.Caption = Str(SimOpts.chartingInterval) + " cycles per data point"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
'Botsareus 6/14/2013 Fix to keep updating graph
Visible = False
If secretunloadoverwrite Then 'Botsareus 6/29/2013
    Visible = True
    graphvisible(WhichGraphAmI) = False
    secretunloadoverwrite = False
Else
If GraphUp Then GoTo skipmsg 'Botsareus 9/26/2014 From Shvarz, make UI more frindly
    If MsgBox("Would you like to keep updating this graph?", vbYesNo + vbQuestion) = vbYes Then
skipmsg:
        Cancel = True
        Left = Screen.Width
        Top = Screen.Height
        Visible = True
    Else
        'Botsareus 5/31/2013 Special graph info
        Visible = True
        graphvisible(WhichGraphAmI) = False
    End If
End If
End Sub

Private Sub Form_Resize()
On Error GoTo patch 'Botsareus 10/12/2013 Attempt to fix a 380 error viea patch

  Dim t As Integer
  
  If Me.Height > 900 And Me.Width > 3000 Then
    Riquadro.Height = Me.Height - 850
    Riquadro.Width = Me.Width - 3400
    Riquadro.Top = 20
    For t = 0 To MaxItems - 1
      Shape3(t).Left = Riquadro.Left + Riquadro.Width + 50
      popnum(t).Width = 600 ' should be enough for five digits left and one right of the decimal
      popnum(t).Left = Shape3(t).Left + Shape3(t).Width + 30
      Label1(t).Left = popnum(t).Left + popnum(t).Width + 30
      Shape3(t).Top = 45 + (t * 200)
      popnum(t).Top = Shape3(t).Top
      Label1(t).Top = Shape3(t).Top
    Next t
    UpdateNow.Left = Riquadro.Left + Riquadro.Width - 2000
    UpdateNow.Top = Riquadro.Height + 30
    ResetButton.Left = UpdateNow.Left + UpdateNow.Width + 30
    ResetButton.Top = Riquadro.Height + 30
    chk_GDsave.Top = Riquadro.Height + 30 'Botsareus 8/3/2012 reposition the save graph data checkbox
    chk_GDsave.Left = ResetButton.Left + ResetButton.Width + 30
    XLabel.Top = Me.Height - XLabel.Height - 550
    RedrawGraph
  End If
patch:
End Sub

'Public Sub AddVal(n As String, x As Single, s As Integer)
'  Dim k As Byte
'  k = 0
'  While k < MaxSeries And SerName(k) <> n
'    k = k + 1
'  Wend
'  If SerName(k) <> n Then
'    AddSeries n, RGB(Random(0, 255), Random(0, 255), Random(0, 255))
'    s = MaxSeries - 1
'  End If
'  data(Pivot, s) = x
'End Sub

Public Sub NewPoints()
  Dim t As Byte
  Pivot = Pivot + 1
  If Pivot > MaxData Then Pivot = 0
  For t = 0 To MaxItems - 1
    data(Pivot, t) = 0
  Next t
  
  RedrawGraph
End Sub

Public Sub RedrawGraph()
BackColor = chartcolor 'Botsareus 4/37/2013 Set Chart Skin
chk_GDsave.BackColor = chartcolor
'Botsareus 5/31/2013 Special graph info
If Left <> Screen.Width Then graphleft(WhichGraphAmI) = Left 'A little mod here not to update graph position if invisible mode
If Top <> Screen.Height Then graphtop(WhichGraphAmI) = Top
  
  Dim k, p As Integer
  Dim t, X As Integer
  Dim maxv As Single
  Dim xunit As Single, yunit As Single
  maxv = -1000
  Dim an As Integer
  Dim inc As Single, xo As Single, yo As Single
  Dim lp(MaxItems, 1) As Single
 
  
  On Error GoTo bypass 'EricL in case chart window gets closed just at the right moment...
  If maxy < 1 Then
    maxy = 1
  End If
  
  xunit = (Riquadro.Width - 200) / (MaxData + 1)
  yunit = (Riquadro.Height - 200) / maxy ' EricL - Multithread divide by zero bug here...
  xo = Riquadro.Left
  yo = Riquadro.Top + Riquadro.Height - 50
  Me.Cls
  DrawAxes maxy
  k = Pivot + 1
  If k > MaxData Then k = 0
  
  ReorderSeries
  
  For t = 0 To MaxSeries - 1
    Me.PSet (xo + xunit * 1, yo - yunit * data(k, t)), SerCol(t)
    lp(t, 0) = xo
    lp(t, 1) = yo - yunit * data(k, t)
    Sum(t) = 0
  Next t
  an = 2

  While k <> Pivot
    For t = 0 To MaxSeries - 1
      Me.Line (lp(t, 0), lp(t, 1))-(xo + xunit * an, yo - yunit * data(k, t)), SerCol(t)
      lp(t, 0) = xo + xunit * an
      lp(t, 1) = yo - yunit * data(k, t)
      If data(k, t) > maxv Then maxv = data(k, t)
      Sum(t) = data(k, t) + Sum(t)
      Label1(t).ToolTipText = Str(data(k, t)) ' EricL 4/6/2006 - Updates the tooltip to display that last value
      popnum(t).Caption = Str(data(k, t)) ' EricL 8/2007 - Display the actual population
    Next t
    an = an + 1
    k = k + 1
    If k > MaxData Then k = 0
  Wend
  
  If t > 10 Then
    For X = (MaxSeries - 1) To 0 Step -1
      If Sum(X) = 0 Then
        DelSeries (X)
      End If
    Next X
  End If
  
  p = Pivot - 1
  If p < 0 Then p = MaxData
  
  If t > 50 Or SimOpts.EnableAutoSpeciation Then 'Botsareus attempt to fix forking issue, may lead to graph instability
   For X = (MaxSeries - 1) To 0 Step -1
      If data(p, X) = 0 Then
        DelSeries (X)
      End If
    Next X
  End If
    
  maxy = maxv
  
  'Botsareus 6/1/2013 Graph saves
  Dim whatgraph As Byte
  Dim strCGraph As String
  If k = 999 Then
    If chk_GDsave.value = 1 Then
       'figure out what graph am I
       whatgraph = WhichGraphAmI
       'figure out string od custom graph
       strCGraph = "normal"
       If whatgraph = CUSTOM_1_GRAPH Then strCGraph = strGraphQuery1
       If whatgraph = CUSTOM_2_GRAPH Then strCGraph = strGraphQuery2
       If whatgraph = CUSTOM_3_GRAPH Then strCGraph = strGraphQuery3
       'update counter
       graphfilecounter(whatgraph) = graphfilecounter(whatgraph) + 1
       'write folder if non exisits
       RecursiveMkDir (MDIForm1.MainDir & "\" & strSimStart)
       'write data
       Open MDIForm1.MainDir & "\" & strSimStart & "\" & Caption & graphfilecounter(whatgraph) & ".gsave" For Output As #100
        'write custom graph data
        Print #100, strCGraph
        'write headers
        strCGraph = ""
        For X = 0 To MaxSeries - 1
            strCGraph = strCGraph & Shape3(X).FillColor & ":" & Label1(X).Caption & ","
        Next
        Print #100, strCGraph
        Dim k2, t2 As Integer
        For k2 = 0 To 998
            strCGraph = ""
            For t2 = 0 To MaxSeries - 1
                strCGraph = strCGraph & data(k2, t2) & vbTab
            Next t2
            Print #100, strCGraph
        Next
       Close #100
    End If
  End If
  
  
  XLabel.Caption = Str(SimOpts.chartingInterval) + " cycles per data point. " + Str(k) + " data points."

bypass:
End Sub

Private Sub DrawAxes(Max As Single)
  Dim d As Single
  Dim yunit As Single
  Dim o As Long
  Dim xo As Long
  Dim yo As Long
  xo = Riquadro.Left
  yo = Riquadro.Top + Riquadro.Height
  yunit = Riquadro.Height / Max
  'Midline
  Line (xo, yo - yunit * Max / 2)-(Riquadro.Left + Riquadro.Width, yo - yunit * Max / 2), vbBlack
  YLab(0).Caption = CStr(Max / 2)
  YLab(0).Left = xo
  YLab(0).Top = (yo - yunit * Max / 2)
  'Top
  Line (xo, Riquadro.Top)-(xo + Riquadro.Width, Riquadro.Top), vbBlack
  YLab(1).Caption = CStr(Max)
  YLab(1).Left = xo
  YLab(1).Top = Riquadro.Top
End Sub


Private Sub ResetBUtton_Click()
  Form1.ResetGraphs (WhichGraphAmI)
End Sub

Private Sub secret_exit_Click() 'Botsareus 6/29/2013
secretunloadoverwrite = True
Unload Me
End Sub

Private Sub UpdateNow_Click()
  Form1.FeedGraph (WhichGraphAmI)
End Sub

Private Function WhichGraphAmI() As Integer 'Botsareus 8/3/2012 use names for graph id mod
  Dim chartNumber As Integer
  
  chartNumber = 0
  
  'EricL Figuring out which graph I am this way is a total hack, but it works
  Select Case Me.Caption
    Case "Populations"
      chartNumber = POPULATION_GRAPH
    Case "Average_Mutations"
      chartNumber = MUTATIONS_GRAPH
    Case "Average_Age"
      chartNumber = AVGAGE_GRAPH
    Case "Average_Offspring"
      chartNumber = OFFSPRING_GRAPH
    Case "Average_Energy"
      chartNumber = ENERGY_GRAPH
    Case "Average_DNA_length"
      chartNumber = DNALENGTH_GRAPH
    Case "Average_DNA_Cond_statements"
      chartNumber = DNACOND_GRAPH
    Case "Average_Mutations_per_DNA_length_x1000-"
      chartNumber = MUT_DNALENGTH_GRAPH
    Case "Total_Energy_per_Species_x1000-"
      chartNumber = ENERGY_SPECIES_GRAPH
    Case "Dynamic_Costs"
      chartNumber = DYNAMICCOSTS_GRAPH
    Case "Species_Diversity"
      chartNumber = SPECIESDIVERSITY_GRAPH
    Case "Average_Chloroplasts"
      chartNumber = AVGCHLR_GRAPH
    Case "Genetic_Distance_x1000-"
      chartNumber = GENETIC_DIST_GRAPH
    Case "Max_Generational_Distance"
      chartNumber = GENERATION_DIST_GRAPH
    Case "Simple_Genetic_Distance_x1000-"
      chartNumber = GENETIC_SIMPLE_GRAPH
    Case "Customizable_Graph_1-"
      chartNumber = CUSTOM_1_GRAPH
    Case "Customizable_Graph_2-"
      chartNumber = CUSTOM_2_GRAPH
    Case "Customizable_Graph_3-"
      chartNumber = CUSTOM_3_GRAPH
  End Select
  
  WhichGraphAmI = chartNumber
End Function
