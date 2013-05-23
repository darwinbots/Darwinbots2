VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Welcome to Snapshot Search"
   ClientHeight    =   690
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   4935
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   690
   ScaleWidth      =   4935
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAbout 
      Caption         =   "&About"
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton btnHelp 
      Caption         =   "&Help"
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton btnExtract 
      Caption         =   "&Extract DNA from Snapshot"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnAbout_Click()
MsgBox "Snapshot search was created by: Botsareus a.k.a. Paul Kononov", vbInformation, "About"
End Sub
