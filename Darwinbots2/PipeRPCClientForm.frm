VERSION 5.00
Begin VB.Form PipeRPCClientForm 
   Caption         =   "Special Data"
   ClientHeight    =   5445
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   6930
   Icon            =   "PipeRPCClientForm.frx":0000
   LinkTopic       =   "PipeRPCClientForm"
   ScaleHeight     =   5445
   ScaleWidth      =   6930
   StartUpPosition =   3  'Windows Default
   Begin DarwinBots.PipeRPC PipeRPC1 
      Left            =   3120
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
   End
   Begin VB.CommandButton cmdClosePipe 
      Caption         =   "ClosePipe"
      Enabled         =   0   'False
      Height          =   495
      Left            =   5520
      TabIndex        =   4
      Top             =   780
      Width           =   1245
   End
   Begin VB.CommandButton cmdOpenPipe 
      Caption         =   "OpenPipe"
      Height          =   495
      Left            =   5520
      TabIndex        =   3
      Top             =   180
      Width           =   1245
   End
   Begin VB.TextBox txtServer 
      Height          =   315
      Left            =   1140
      TabIndex        =   0
      Text            =   "."
      Top             =   180
      Width           =   2865
   End
   Begin VB.TextBox txtReceived 
      Height          =   4035
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   1380
      Width           =   6915
   End
   Begin VB.CommandButton cmdPipeCall 
      Caption         =   "PipeCall"
      Default         =   -1  'True
      Height          =   495
      Left            =   4140
      TabIndex        =   2
      Top             =   180
      Width           =   1245
   End
   Begin VB.TextBox txtCbBytes 
      Height          =   315
      Left            =   1140
      TabIndex        =   1
      Text            =   "512"
      Top             =   600
      Width           =   1245
   End
   Begin VB.Label Label2 
      Caption         =   "Server"
      Height          =   195
      Left            =   150
      TabIndex        =   7
      Top             =   240
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Bytes"
      Height          =   195
      Left            =   150
      TabIndex        =   5
      Top             =   660
      Width           =   975
   End
End
Attribute VB_Name = "PipeRPCClientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Const PIPE_NAME As String = "PipeRPC#Demo"

Private Const ERROR_FILE_NOT_FOUND = 2&
Private Const ERROR_SEM_TIMEOUT = 121&
Private Const ERROR_PIPE_BUSY = 231&
Private Const ERROR_PIPE_NOT_CONNECTED = 233&

Private Function CloseThePipe() As String
    PipeRPC1.ClosePipe
    cmdClosePipe.Enabled = False
    cmdOpenPipe.Enabled = True
    CloseThePipe = "ClosePipe called"
End Function

Private Function Description(ByVal Result As Long) As String
    Select Case Result
        Case ERROR_FILE_NOT_FOUND
            Description = "Pipe Server is not listening"
        Case ERROR_SEM_TIMEOUT
            Description = "Open timed out"
        Case ERROR_PIPE_BUSY
            Description = "Pipe server is full (max clents)"
        Case ERROR_PIPE_NOT_CONNECTED
            Description = "Pipe disconnected, server stopped listening"
        Case 1300 To 1399
            Description = "User/Group security error=" & CStr(Result)
        Case Else
            Description = "Other result=" & CStr(Result)
    End Select
End Function

Sub cmdClosePipe_Click()
    txtReceived.text = CloseThePipe()
End Sub

Sub cmdOpenPipe_Click()
    Dim Result As Long
    
    PipeRPC1.Server = txtServer.text
    Result = PipeRPC1.OpenPipe()
    If Result = 0 Then
        cmdOpenPipe.Enabled = False
        cmdClosePipe.Enabled = True
        txtReceived.text = "OpenPipe successful"
    Else
        txtReceived.text = "OpenPipe failed, error: " & CStr(Result) & ":" & vbNewLine _
                         & vbTab & Description(Result)
    End If
End Sub

Sub cmdPipeCall_Click()
    Dim BytesRequested As Long
    Dim Request(3) As Byte
    Dim Response() As Byte
    Dim Result As Long
    Dim I As Long
    
    txtReceived.text = ""
    txtReceived.Refresh
    txtReceived.Visible = False
    
    BytesRequested = CLng(txtCbBytes.text)
'    If BytesRequested < 0 Then
'        MsgBox "Value must be at least 0.", vbOKOnly
'        Exit Sub
'    End If
'    If BytesRequested > 20000 Then
'        BytesRequested = 20000
'    End If
    
    'Put parameters into request buffer.
    PipeRPC1.CopyMemory VarPtr(Request(0)), VarPtr(BytesRequested), LenB(BytesRequested)
    
    'Allocate response buffer.
    ReDim Response(0)
    
    'Call CallNamedPipe to do the transaction all at once
    Result = PipeRPC1.PipeCall(Request, Response)
    
    If Result = 0 Then
        With txtReceived
            .text = ""
            .SelStart = 0
            For I = 0 To UBound(Response)
                .SelText = Format(Response(I), " 000")
                If ((I + 1) Mod 16) = 0 Then .SelText = vbNewLine
            Next I
        End With
    Else
        txtReceived.text = "Error number " & CStr(Result) & " making the PipeCall:" & vbNewLine _
                         & vbTab & Description(Result) & vbNewLine _
                         & vbTab & IIf(Result = ERROR_PIPE_NOT_CONNECTED, CloseThePipe(), "")
    End If
    txtReceived.Visible = True
End Sub

Private Sub Form_Load()
    PipeRPC1.PipeName = PIPE_NAME
    PipeRPC1.Timeout = 2000
End Sub

Private Sub Form_Resize()
    If WindowState <> vbMinimized Then
        If Width < 7170 Then Width = 7170
        With txtReceived
            .Move 0, .Top, ScaleWidth, ScaleHeight - .Top
        End With
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If PipeRPC1.State = pstClientOpen Then PipeRPC1.ClosePipe
End Sub
