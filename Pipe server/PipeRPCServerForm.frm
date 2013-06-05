VERSION 5.00
Begin VB.Form PipeRPCServerForm 
   Caption         =   "PipeRPC Server Demo"
   ClientHeight    =   5250
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   7410
   Icon            =   "PipeRPCServerForm.frx":0000
   LinkTopic       =   "PipeRPCServerForm"
   ScaleHeight     =   5250
   ScaleWidth      =   7410
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4515
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   720
      Width           =   7395
   End
   Begin PipeRPCServerDemo.PipeRPC PipeRPC1 
      Left            =   2820
      Top             =   120
      _extentx        =   847
      _extenty        =   847
   End
   Begin VB.CommandButton cmdClosePipe 
      Caption         =   "ClosePipe"
      Enabled         =   0   'False
      Height          =   495
      Left            =   1380
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdListen 
      Caption         =   "Listen"
      Height          =   495
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "PipeRPCServerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const MaxClients = 2
Private Const MaxRequest = 4
Private Const MaxResponse = 20000
Private Const PipeName = "PipeRPC#Demo"

Dim a As Byte

Public population As Long
Public cycles_per_second As Long
Public Size As Long
Public mutation_rate As Long
Private Sub Log(ByVal Text As String)
    With Text1
        .SelStart = &HFFFF&
        .SelText = Text
        .SelText = vbNewLine
    End With
End Sub

Private Sub LogClear()
    Text1.Text = ""
End Sub

Private Sub cmdClosePipe_Click()
    On Error Resume Next
    PipeRPC1.ClosePipe
    If Err Then
        Log "Error " & Hex$(Err.Number) & ": " & Err.Description
    Else
        Log "Pipe closed"
        cmdClosePipe.Enabled = False
        cmdListen.Enabled = True
    End If
End Sub

Private Sub cmdListen_Click()
    On Error Resume Next
    PipeRPC1.Listen
    If Err Then
        Log "Error " & Hex$(Err.Number) & ": " & Err.Description
    Else
        Log "Listening: MaxClients=" & CStr(MaxClients) _
                   & ", MaxRequest=" & CStr(MaxRequest) _
                   & ", RaxResponse=" & CStr(MaxResponse)
        cmdClosePipe.Enabled = True
        cmdListen.Enabled = False
    End If
End Sub

Private Sub Form_Load()
    Caption = Caption & " @ " & PipeRPC1.ComputerName
    With PipeRPC1
        .MaxClients = MaxClients
        .MaxRequest = MaxRequest
        .MaxResponse = MaxResponse
        .PipeName = PipeName
    End With
End Sub

Private Sub Form_Resize()
    If WindowState <> vbMinimized Then
        With Text1
            .Move 0, .Top, ScaleWidth, ScaleHeight - .Top
        End With
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    PipeRPC1.ClosePipe
End Sub

Private Sub PipeRPC1_Called(ByVal Pipe As Long, Request() As Byte, Response() As Byte)
    Dim nCount As Long
    'Dim I As Long
    
    PipeRPC1.CopyMemory VarPtr(nCount), VarPtr(Request(0)), LenB(nCount)
    If nCount = -1 Then
        a = 10
    Else
        If a > 0 Then
            a = a - 1
            If a = 9 Then population = nCount
            If a = 8 Then cycles_per_second = nCount
            If a = 7 Then Size = nCount
            If a = 6 Then
                mutation_rate = nCount
                MsgBox "Pop:" & population & " Cycles:" & cycles_per_second & " Size:" & Size & " Mutrate:" & mutation_rate
            End If
            
            '-1 population, cycles_per_second, size and mutation_rate
        End If
    End If
    ReDim Response(0)
End Sub

Private Sub PipeRPC1_Connected(ByVal Pipe As Long)
    Log "Connect by #" & CStr(Pipe)
End Sub

Private Sub PipeRPC1_Disconnected(ByVal Pipe As Long, ByVal Reason As PipeRPCDisconnectReason, ByVal SystemError As Long)
    Log "Disconnect by #" & CStr(Pipe) _
      & ", Reason: " & Array("NoReason", _
                             "ConnectFailed", _
                             "ClientDisconnect", _
                             "ClosePipe", _
                             "RequestTooLong", _
                             "ResponseTooShort", _
                             "ReadError", _
                             "WriteError")(Reason) _
      & ", Sys Err: " & CStr(SystemError)
End Sub
