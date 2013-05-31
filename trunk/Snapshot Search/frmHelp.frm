VERSION 5.00
Begin VB.Form frmHelp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Help"
   ClientHeight    =   7155
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7875
   ControlBox      =   0   'False
   Icon            =   "frmHelp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7155
   ScaleWidth      =   7875
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   6495
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "frmHelp.frx":08CA
      Top             =   120
      Width           =   7695
   End
   Begin VB.CommandButton btnExit 
      Caption         =   "&Exit Help"
      Height          =   375
      Left            =   6000
      TabIndex        =   0
      Top             =   6720
      Width           =   1815
   End
End
Attribute VB_Name = "frmHelp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnExit_Click()
Unload Me
End Sub
