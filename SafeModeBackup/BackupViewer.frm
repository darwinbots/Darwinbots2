VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Safemode backup"
   ClientHeight    =   510
   ClientLeft      =   45
   ClientTop       =   360
   ClientWidth     =   7530
   Icon            =   "BackupViewer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   510
   ScaleWidth      =   7530
   StartUpPosition =   3  'Windows Default
   WindowState     =   1  'Minimized
   Begin VB.Timer tmr 
      Interval        =   2000
      Left            =   6000
      Top             =   0
   End
   Begin VB.Label lbl 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   7695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub tmr_Timer()
On Error Resume Next
'The nature of the beast - very simple code to do autosave backups
lbl.Caption = "Time until next backup: " & (60 * 60 * 6 - (Timer \ 3) * 3 Mod (60 * 60 * 6)) & " seconds"
If (60 * 60 * 6 - (Timer \ 3) * 3 Mod (60 * 60 * 6)) < 4 Then
    FileCopy App.Path & "\Saves\lastautosave.sim", App.Path & "\Autosave\autosave" & Replace(Time$, ":", "-") & ".sim"
End If
End Sub

