VERSION 5.00
Begin VB.Form frmFirstTimeInfo 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Getting Started: Please select your first simulation"
   ClientHeight    =   11160
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   14115
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmFirstTimeInfo.frx":0000
   ScaleHeight     =   11160
   ScaleWidth      =   14115
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C00000&
      Caption         =   "&Got it!"
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
      Left            =   6360
      MaskColor       =   &H00800000&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   10200
      Width           =   1815
   End
End
Attribute VB_Name = "frmFirstTimeInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub
