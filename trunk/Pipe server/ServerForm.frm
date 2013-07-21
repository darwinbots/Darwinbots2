VERSION 5.00
Begin VB.Form ServerForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Calculation Server"
   ClientHeight    =   6210
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   10245
   LinkTopic       =   "ServerForm"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6210
   ScaleWidth      =   10245
   StartUpPosition =   3  'Windows Default
   WindowState     =   1  'Minimized
   Begin VB.TextBox Text1 
      Height          =   6015
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   9975
   End
   Begin Server.PipeRPC pipeCalculate 
      Left            =   1020
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      MaxRequest      =   200
      MaxResponse     =   200
      PipeName        =   "CalcServerPipe"
   End
End
Attribute VB_Name = "ServerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    pipeCalculate.Listen
End Sub

Private Sub Form_Unload(Cancel As Integer)
    pipeCalculate.ClosePipe
End Sub

Private Sub pipeCalculate_Called(ByVal Pipe As Long, Request() As Byte, Response() As Byte)
Text1 = Text1 & CStr(Request) & vbCrLf
Response = "0"
End Sub
