VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Le informazioni di cui non potete fare a meno!"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6120
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   6120
   StartUpPosition =   3  'Windows Default
   Tag             =   "12001"
   Begin VB.TextBox Text1 
      BackColor       =   &H80000000&
      Height          =   1455
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Text            =   "frmAbout.frx":058A
      Top             =   1920
      Width           =   5775
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "Mi sento meglio"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   4320
      TabIndex        =   0
      Tag             =   "12008"
      Top             =   3960
      Width           =   1500
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Caption         =   "Further revisions by EricL (eric@sulaadventures.com)"
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
      Left            =   1080
      TabIndex        =   9
      Top             =   1440
      Width           =   4815
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Revisions by Purple Youko (Higginsb@missouri.edu)"
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
      Left            =   1320
      TabIndex        =   8
      Top             =   1200
      Width           =   4575
   End
   Begin VB.Label lblTitle 
      Caption         =   "DarwinBots"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   660
      Left            =   1560
      TabIndex        =   6
      Top             =   120
      Width           =   3015
   End
   Begin VB.Label lblDescription 
      Caption         =   "Carlo Comis   (comis@libero.it)"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   210
      Left            =   3240
      TabIndex        =   5
      Top             =   960
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "Robottini genetici!"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2880
      TabIndex        =   4
      Tag             =   "12002"
      Top             =   735
      Width           =   1485
   End
   Begin VB.Line Line1 
      X1              =   1935
      X2              =   3885
      Y1              =   705
      Y2              =   705
   End
   Begin VB.Label Label2 
      Caption         =   "Se vorrete segnalarmi un bug o un commento o qualsiasi altra cosa ve ne saro' grato!              E-mail: comis@libero.it "
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   540
      Left            =   120
      TabIndex        =   3
      Tag             =   "12006"
      Top             =   3480
      Width           =   3060
   End
   Begin VB.Label Label8 
      Caption         =   "2002-2003 Carlo Comis"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   120
      TabIndex        =   2
      Top             =   4080
      Width           =   2370
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Version 2.44.1 - Dec 2008"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   120
      TabIndex        =   1
      Top             =   960
      Width           =   2505
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
  Hide
End Sub

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  Text1.text = ""
  Text1.text = Text1.text + "DarwinBots v" + CStr(App.Major) + "." + CStr(App.Minor) + "." + CStr(App.Revision) + vbCrLf
  Text1.text = Text1.text + "http://www.darwinbots.com" + vbCrLf
  Text1.text = Text1.text + "Original Copyright (C) 2003 Carlo Comis" + vbCrLf
  Text1.text = Text1.text + "comis@libero.it" + vbCrLf
  Text1.text = Text1.text + "http://digilander.libero.it/darwinbots" + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "Subsequent revisions by Purple Youko" + vbCrLf
  Text1.text = Text1.text + "higginsb@missouri.edu" + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "2.4 - 2.42 work by Numsqil" + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "2.42 and beyond Copyright (C) Eric Lockard" + vbCrLf
  Text1.text = Text1.text + "ericl@sulaadventures.com" + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "All rights reserved. " + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "Redistribution and use in source and binary forms, with or without "
  Text1.text = Text1.text + "modification, are permitted provided that:" + vbCrLf
  Text1.text = Text1.text + "(1) source code distributions retain the above copyright notice and this "
  Text1.text = Text1.text + "paragraph in its entirety," + vbCrLf
  Text1.text = Text1.text + "(2) distributions including binary code include the above copyright notice and "
  Text1.text = Text1.text + "this paragraph in its entirety in the documentation or other materials "
  Text1.text = Text1.text + "provided with the distribution, and " + vbCrLf
  Text1.text = Text1.text + "(3) Without the agreement of the authors redistribution of this product is only allowed "
  Text1.text = Text1.text + "in non commercial terms and non profit distributions." + vbCrLf
  Text1.text = Text1.text + "" + vbCrLf
  Text1.text = Text1.text + "THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED "
  Text1.text = Text1.text + "WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF "
  Text1.text = Text1.text + "MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE."
End Sub

