VERSION 5.00
Begin VB.Form MuriForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Muri"
   ClientHeight    =   1920
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4110
   Icon            =   "Form8.frx":0000
   LinkTopic       =   "Form8"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1920
   ScaleWidth      =   4110
   StartUpPosition =   3  'Windows Default
   Tag             =   "8001"
   Begin VB.CommandButton Command2 
      Caption         =   "Disegna "
      Height          =   495
      Left            =   3045
      TabIndex        =   1
      Tag             =   "8003"
      Top             =   1050
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Traccia percorso"
      Height          =   495
      Left            =   105
      TabIndex        =   0
      Tag             =   "8002"
      Top             =   1050
      Width           =   1695
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"Form8.frx":08CA
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Tag             =   "8004"
      Top             =   105
      Width           =   3795
   End
End
Attribute VB_Name = "MuriForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public stat As Integer
Dim points(1000, 1) As Long
Dim ind As Integer

Private Sub Command2_Click()
    Form1.DrawAllRobs
End Sub

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  stat = 0
  ind = 1
  Form1.Active = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Form1.Active = True
  stat = 0
End Sub

Private Sub Command1_Click()
  If stat = 0 Then
    Command1.Caption = "Fine traccia"
    stat = 1
    ind = 1
    Form1.DrawAllRobs
  Else
    If stat = 1 Then
      stat = 0
      Command1.Caption = "Traccia un muro"
    End If
  End If
End Sub

Sub storepoints(x As Single, y As Single)
  points(ind, 0) = Int(x)
  points(ind, 1) = Int(y)
  If ind > 1 Then
    Form1.Line (points(ind - 1, 0), points(ind - 1, 1))-(x, y), vbWhite
  End If
  ind = ind + 1
End Sub







