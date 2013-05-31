VERSION 5.00
Begin VB.Form frmDir 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Select out folder"
   ClientHeight    =   6720
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5430
   ControlBox      =   0   'False
   Icon            =   "frmDir.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6720
   ScaleWidth      =   5430
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   3480
      TabIndex        =   1
      Top             =   6240
      Width           =   1815
   End
   Begin VB.DirListBox Dir1 
      Height          =   5940
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5175
   End
End
Attribute VB_Name = "frmDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Me.Hide
End Sub
