VERSION 5.00
Begin VB.UserControl PipeRPC 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   CanGetFocus     =   0   'False
   ClientHeight    =   480
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   480
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   HasDC           =   0   'False
   HitBehavior     =   0  'None
   InvisibleAtRuntime=   -1  'True
   PaletteMode     =   4  'None
   Picture         =   "PipeRPC.ctx":0000
   ScaleHeight     =   480
   ScaleWidth      =   480
   ToolboxBitmap   =   "PipeRPC.ctx":04A4
   Begin VB.Timer tmrPoll 
      Enabled         =   0   'False
      Left            =   0
      Top             =   60
   End
End
Attribute VB_Name = "PipeRPC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const VERSION_MAJOR = 1
Private Const VERSION_MINOR = 1
Private Const COPYRIGHT_NOTICE = "PipeRPC: Copyright © 2011 by Robert D. Riemersma, Jr." & vbNewLine _
                               & "All Rights Reserved"

Private Const PIPERPC_SERVER_DEFAULT_TIMEOUT = 250 'ms.
Private Const PIPERPC_SERVER_POLL_INTERVAL = 16 'ms.

Private Const FILE_ATTRIBUTE_NORMAL = &H80&
Private Const FILE_FLAG_WRITE_THROUGH = &H80000000

Private Const FILE_SHARE_EXCLUSIVE = 0&

Private Const GENERIC_READ = &H80000000
Private Const GENERIC_WRITE = &H40000000
Private Const GENERIC_READWRITE = GENERIC_READ Or GENERIC_WRITE

Private Const OPEN_EXISTING = 3&

Private Const PIPE_ACCESS_DUPLEX = &H3&
Private Const PIPE_NOWAIT = &H1&
Private Const PIPE_READMODE_MESSAGE = &H2&
Private Const PIPE_TYPE_MESSAGE = &H4&
Private Const PIPE_WAIT = &H0&

Private Const PIPE_UNLIMITED_INSTANCES = 255

Private Const NMPWAIT_USE_DEFAULT_WAIT = 0&
Private Const NMPWAIT_NOWAIT = 1&
Private Const NMPWAIT_WAIT_FOREVER = -1&

Private Const ERROR_BROKEN_PIPE = 109&
Private Const ERROR_MORE_DATA = 234&
Private Const ERROR_NO_DATA = 232&
Private Const ERROR_PIPE_NOT_CONNECTED = 233&
Private Const ERROR_PIPE_CONNECTED = 535&
Private Const ERROR_PIPE_LISTENING = 536&
Private Const ERROR_SEM_TIMEOUT = 121&

Private Const NULL_VALUE = 0&
Private Const INVALID_HANDLE_VALUE = -1&

Private Const SECURITY_DESCRIPTOR_MIN_LENGTH = 20&
Private Const SECURITY_DESCRIPTOR_REVISION = 1&

Private Const MAX_COMPUTER_LENGTH = 31

Private Type SECURITY_ATTRIBUTES
    nLength As Long
    lpSecurityDescriptor As Long
    bInheritHandle As Long
End Type

Private Const GMEM_FIXED = &H0
Private Const GMEM_ZEROINIT = &H40
Private Const GPTR = (GMEM_FIXED Or GMEM_ZEROINIT)

Private Declare Function CallNamedPipe Lib "kernel32" Alias "CallNamedPipeW" ( _
    ByVal lpNamedPipeName As Long, _
    ByVal lpInBuffer As Long, _
    ByVal nInBufferSize As Long, _
    ByVal lpOutBuffer As Long, _
    ByVal nOutBufferSize As Long, _
    ByRef lpBytesRead As Long, _
    ByVal nTimeOut As Long) As Long

Private Declare Function CloseHandle Lib "kernel32" ( _
    ByVal hObject As Long) As Long

Private Declare Function ConnectNamedPipe Lib "kernel32" ( _
    ByVal hNamedPipe As Long, _
    ByVal lpOverlapped As Long) As Long

Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileW" ( _
    ByVal lpFileName As Long, _
    ByVal dwDesiredAccess As Long, _
    ByVal dwShareMode As Long, _
    ByVal lpSecurityAttributes As Long, _
    ByVal dwCreationDisposition As Long, _
    ByVal dwFlagsAndAttributes As Long, _
    ByVal hTemplateFile As Long) As Long

Private Declare Function CreateNamedPipe Lib "kernel32" _
    Alias "CreateNamedPipeW" ( _
    ByVal lpName As Long, _
    ByVal dwOpenMode As Long, _
    ByVal dwPipeMode As Long, _
    ByVal nMaxInstances As Long, _
    ByVal nOutBufferSize As Long, _
    ByVal nInBufferSize As Long, _
    ByVal nDefaultTimeOut As Long, _
    ByVal lpSecurityAttributes As Long) As Long

Private Declare Function DisconnectNamedPipe Lib "kernel32" ( _
    ByVal hNamedPipe As Long) As Long

Private Declare Function FlushFileBuffers Lib "kernel32" ( _
    ByVal hFile As Long) As Long

Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameW" ( _
    ByVal lpBuffer As Long, _
    ByRef nSize As Long) As Long

Private Declare Function GlobalAlloc Lib "kernel32" ( _
    ByVal wFlags As Long, _
    ByVal dwBytes As Long) As Long

Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long

Private Declare Function InitializeSecurityDescriptor Lib "advapi32" ( _
    ByVal pSecurityDescriptor As Long, _
    ByVal dwRevision As Long) As Long

Private Declare Function ReadFile Lib "kernel32" ( _
    ByVal hFile As Long, _
    ByVal lpBuffer As Long, _
    ByVal nNumberOfBytesToRead As Long, _
    ByRef lpNumberOfBytesRead As Long, _
    ByVal lpOverlapped As Long) As Long

Private Declare Sub RtlMoveMemory Lib "kernel32" ( _
    ByVal lpDestination As Long, _
    ByVal lpSource As Long, _
    ByVal Length As Long)

Private Declare Function SetNamedPipeHandleState Lib "kernel32" ( _
    ByVal hNamedPipe As Long, _
    ByVal lpMode As Long, _
    ByVal lpMaxCollectionCount As Long, _
    ByVal lpCollectDataTimeout As Long) As Long

Private Declare Function SetSecurityDescriptorDacl Lib "advapi32" ( _
    ByVal pSecurityDescriptor As Long, _
    ByVal bDaclPresent As Long, _
    ByVal pDacl As Long, _
    ByVal bDaclDefaulted As Long) As Long

Private Declare Function TransactNamedPipe Lib "kernel32" ( _
    ByVal hNamedPipe As Long, _
    ByVal lpInBuffer As Long, _
    ByVal nInBufferSize As Long, _
    ByVal lpOutBuffer As Long, _
    ByVal nOutBufferSize As Long, _
    ByRef lpBytesRead As Long, _
    ByVal lpOverlapped As Long) As Long

Private Declare Function WaitNamedPipe Lib "kernel32" Alias "WaitNamedPipeW" ( _
    ByVal lpNamedPipeName As Long, _
    ByVal nTimeOut As Long) As Long

Private Declare Function WriteFile Lib "kernel32" ( _
    ByVal hFile As Long, _
    ByVal lpBuffer As Long, _
    ByVal nNumberOfBytesToWrite As Long, _
    ByRef lpNumberOfBytesWritten As Long, _
    ByVal lpOverlapped As Long) As Long

Public Enum PipeRPCDisconnectReason
    pdrNoReason = 0
    pdrConnectFailed
    pdrClientDisconnect
    pdrClosePipe
    pdrRequestTooLong
    pdrResponseTooShort
    pdrReadError
    pdrWriteError
End Enum
'Preserve identifer case:
#If False Then
Dim pdrNoReason, pdrConnectFailed, pdrClientDisconnect, pdrClosePipe, pdrRequestTooLong
Dim pdrResponseTooShort, pdrReadError, pdrWriteError
#End If

Public Enum PipeRPCState
    pstFree = 0
    pstListening
    pstClientOpen
End Enum
'Preserve identifer case:
#If False Then
Dim pstFree, pstListening, pstClientOpen
#End If

Public Enum PipeRPCTimeoutMs
    ptoServerDefault = NMPWAIT_USE_DEFAULT_WAIT
    ptoNoWait = NMPWAIT_NOWAIT
    ptoForever = NMPWAIT_WAIT_FOREVER
End Enum
'Preserve identifer case:
#If False Then
Dim ptoServerDefault, ptoNoWait, ptoForever
#End If

Private pSD As Long
Private sa As SECURITY_ATTRIBUTES
Private FullPipeName As String
Private hPipe As Long 'Client pipe.
Private hPipes() As Long 'Server pipes.
Private bPipesConnected() As Boolean
Private Listeners As Long 'Count of server hPipes listening.
Private ReadBuffer() As Byte

Private mComputerName As String
Private mPipeName As String
Private mMaxClients As Integer
Private mMaxRequest As Long
Private mMaxResponse As Long
Private mMultiPoll As Boolean
Private mServer As String
Private mState As PipeRPCState
Private mTimeout As PipeRPCTimeoutMs

Public Event Called( _
    ByVal Pipe As Long, _
    ByRef Request() As Byte, _
    ByRef Response() As Byte)

Public Event Connected(ByVal Pipe As Long)

Public Event Disconnected( _
    ByVal Pipe As Long, _
    ByVal Reason As PipeRPCDisconnectReason, _
    ByVal SystemError As Long)

#If ServerTracing Then
Public Event ServerTrace(ByVal Information As String)
#End If

Public Property Get ComputerName() As String
    ComputerName = mComputerName
End Property

Public Property Get Copyright() As String
    Copyright = COPYRIGHT_NOTICE
End Property

Public Property Get MaxClients() As Integer
    MaxClients = mMaxClients
End Property

Public Property Let MaxClients(ByVal RHS As Integer)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    If 1 > MaxClients Or MaxClients > 255 Then Err.Raise 5, TypeName(Me), "MaxClients must be from 1 to 255 (unlimited)"
    
    mMaxClients = RHS
    PropertyChanged "MaxClients"
End Property

Public Property Get MaxRequest() As Long
    MaxRequest = mMaxRequest
End Property

Public Property Let MaxRequest(ByVal RHS As Long)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    If 1 > MaxRequest Or MaxRequest > 65536 Then Err.Raise 5, TypeName(Me), "MaxRequest must be from 1 to 65536"
    
    mMaxRequest = RHS
    PropertyChanged "MaxRequest"
End Property

Public Property Get MaxResponse() As Long
    MaxResponse = mMaxResponse
End Property

Public Property Let MaxResponse(ByVal RHS As Long)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    If 1 > MaxResponse Or MaxResponse > 65536 Then Err.Raise 5, TypeName(Me), "MaxResponse must be from 1 to 65536"
    
    mMaxResponse = RHS
    PropertyChanged "MaxResponse"
End Property

Public Property Get MultiPoll() As Boolean
    MultiPoll = mMultiPoll
End Property

Public Property Let MultiPoll(ByVal RHS As Boolean)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    
    mMultiPoll = RHS
    PropertyChanged "MultiPoll"
End Property

Public Property Get PipeName() As String
    PipeName = mPipeName
End Property

Public Property Let PipeName(ByVal RHS As String)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    If InStr(PipeName, "\") > 0 Or InStr(PipeName, vbNullChar) > 0 Then
        Err.Raise 5, TypeName(Me), "Cannot contain ""\"" or NUL characters"
    End If
    
    mPipeName = RHS
    PropertyChanged "PipeName"
End Property

Public Property Get Server() As String
    Server = mServer
End Property

Public Property Let Server(ByVal RHS As String)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    
    mServer = RHS
    PropertyChanged "Server"
End Property

Public Property Get State() As PipeRPCState
    State = mState
End Property

Public Property Get Timeout() As PipeRPCTimeoutMs
    Timeout = mTimeout
End Property

Public Property Let Timeout(ByVal RHS As PipeRPCTimeoutMs)
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Can only be changed while State = pstFree"
    mTimeout = RHS
    PropertyChanged "Timeout"
End Property

Public Property Get Version() As Currency
    Version = CCur(VERSION_MAJOR) + (CCur(VERSION_MINOR) / 10000@)
End Property

Public Property Get VersionMajor() As Integer
    VersionMajor = VERSION_MAJOR
End Property

Public Property Get VersionMinor() As Integer
    VersionMinor = VERSION_MINOR
End Property

Public Sub ClosePipe()
    Dim Pipe As Long
    
    Select Case mState
        Case pstFree
            'Nothing.
        Case pstListening
            'Server close.
            For Pipe = 0 To UBound(hPipes)
                CleanUpServerPipe Pipe, pdrClosePipe
            Next
            tmrPoll.Enabled = False
            ReDim hPipes(0), bPipesConnected(0)
            hPipes(0) = INVALID_HANDLE_VALUE
            Listeners = 0
            mState = pstFree
        Case pstClientOpen
            'Client close.
            If hPipe <> INVALID_HANDLE_VALUE Then CloseHandle hPipe
            hPipe = INVALID_HANDLE_VALUE
            mState = pstFree
    End Select
End Sub

Public Sub CopyMemory(ByVal DestPointer As Long, ByVal SourcePointer As Long, ByVal LengthInBytes As Long)
    RtlMoveMemory DestPointer, SourcePointer, LengthInBytes
End Sub

Public Sub Listen()
    If mState <> pstFree Then Err.Raise &H80048A04, TypeName(Me), "Invalid call while connected"
    
    ReDim ReadBuffer(mMaxRequest - 1)
    If mTimeout = ptoForever Or _
       mTimeout = ptoNoWait Or _
       mTimeout = ptoServerDefault Then mTimeout = PIPERPC_SERVER_DEFAULT_TIMEOUT
    
    FullPipeName = "\\.\pipe\" & mPipeName
    NewListener
    tmrPoll.Enabled = True
    mState = pstListening
End Sub

Public Function OpenPipe() As Long
    Dim dwMode As Long
    
    If mState <> pstFree Then Err.Raise 5, TypeName(Me), "Pipe can only be opened while State = pstFree"
    
    If WaitNamedPipe(StrPtr("\\" & mServer & "\pipe\" & mPipeName), mTimeout) = 0 Then
        OpenPipe = ERROR_SEM_TIMEOUT
    Else
        hPipe = CreateFile(StrPtr("\\" & mServer & "\pipe\" & mPipeName), _
                           GENERIC_READWRITE, _
                           FILE_SHARE_EXCLUSIVE, _
                           NULL_VALUE, _
                           OPEN_EXISTING, _
                           FILE_ATTRIBUTE_NORMAL Or FILE_FLAG_WRITE_THROUGH, _
                           NULL_VALUE)
        If hPipe = INVALID_HANDLE_VALUE Then
            OpenPipe = Err.LastDllError
        Else
            dwMode = PIPE_READMODE_MESSAGE
                    'PIPE_READMODE_MESSAGE Or PIPE_NOWAIT
            If SetNamedPipeHandleState(hPipe, _
                                       VarPtr(dwMode), _
                                       NULL_VALUE, _
                                       NULL_VALUE) = 0 Then
                OpenPipe = Err.LastDllError
            Else
                mState = pstClientOpen
            End If
        End If
    End If
End Function

Public Function PipeCall(ByRef Request() As Byte, ByRef Response() As Byte) As Long
    Dim BytesToWrite As Long
    Dim BytesToRead As Long
    Dim ErrorOccurred As Boolean
    Dim BytesRead As Long
    
    If mState = pstListening Then
        Err.Raise 5, TypeName(Me), "Cannot make calls while listening"
    Else
        If mState = pstFree And Len(mPipeName) < 1 Then _
            Err.Raise 5, _
                      TypeName(Me), _
                      "PipeName is required (cannot be empty) to make calls while State = pstFree"
        
        BytesToWrite = UBound(Request) - LBound(Request) + 1
        BytesToRead = UBound(Response) - LBound(Response) + 1
        If mState = pstFree Then
            ErrorOccurred = _
                CallNamedPipe(StrPtr("\\" & mServer & "\pipe\" & mPipeName), _
                              VarPtr(Request(LBound(Request))), BytesToWrite, _
                              VarPtr(Response(LBound(Response))), BytesToRead, _
                              BytesRead, mTimeout) = 0
        Else 'pstClientOpen:
            ErrorOccurred = _
                TransactNamedPipe(hPipe, _
                                  VarPtr(Request(LBound(Request))), BytesToWrite, _
                                  VarPtr(Response(LBound(Response))), BytesToRead, _
                                  BytesRead, NULL_VALUE) = 0
        End If
        If ErrorOccurred Then
            PipeCall = Err.LastDllError
        Else
            If BytesRead < BytesToRead Then
                ReDim Preserve Response(LBound(Response) To LBound(Response) + BytesRead - 1)
            End If
        End If
    End If
End Function

Private Sub CleanUpMe()
    ClosePipe
    GlobalFree pSD
End Sub

Private Sub CleanUpServerPipe( _
    ByVal Pipe As Long, _
    ByVal Reason As PipeRPCDisconnectReason, _
    Optional ByVal CleanUpSysErr As Long = 0)
    
    Dim SysErr As Long
    
    If hPipes(Pipe) <> INVALID_HANDLE_VALUE Then
        If bPipesConnected(Pipe) Then
            If DisconnectNamedPipe(hPipes(Pipe)) = 0 Then
                SysErr = Err.LastDllError
            End If
            
            bPipesConnected(Pipe) = False
            CloseHandle hPipes(Pipe)
            hPipes(Pipe) = INVALID_HANDLE_VALUE
            If Listeners = 0 Then NewListener
            
            If SysErr <> 0 Then
                RaiseEvent Disconnected(Pipe, Reason, SysErr)
            Else
                RaiseEvent Disconnected(Pipe, Reason, CleanUpSysErr)
            End If
        Else
            CloseHandle hPipes(Pipe)
            hPipes(Pipe) = INVALID_HANDLE_VALUE
            If CleanUpSysErr <> 0 Then
                Err.Raise &H80048A00, TypeName(Me), "System error " & CStr(CleanUpSysErr)
            End If
        End If
    End If
End Sub

Private Sub ListenOnPipe(ByVal Pipe As Long)
    Dim SysErr As Long
    
    If ConnectNamedPipe(hPipes(Pipe), NULL_VALUE) = 0 Then
        SysErr = Err.LastDllError
        Select Case SysErr
            Case ERROR_PIPE_LISTENING, ERROR_PIPE_CONNECTED
                'Nothing.  Will be marked/signaled "connected" and NewListener called later.
            Case Else
                CleanUpServerPipe Pipe, pdrConnectFailed, SysErr
        End Select
    End If
End Sub

Private Sub NewListener()
    Dim Pipe As Long
    Dim dwOpenMode As Long
    Dim dwPipeMode As Long
    
    For Pipe = 0 To UBound(hPipes)
        If hPipes(Pipe) = INVALID_HANDLE_VALUE Then Exit For
    Next
    If Pipe > UBound(hPipes) Then
        If Pipe + 1 > mMaxClients And mMaxClients <> PIPE_UNLIMITED_INSTANCES Then
            Exit Sub
        Else
            ReDim Preserve hPipes(Pipe), bPipesConnected(Pipe)
            hPipes(Pipe) = INVALID_HANDLE_VALUE
        End If
    End If
    
    dwOpenMode = PIPE_ACCESS_DUPLEX Or FILE_FLAG_WRITE_THROUGH
    dwPipeMode = PIPE_NOWAIT Or PIPE_TYPE_MESSAGE Or PIPE_READMODE_MESSAGE
    hPipes(Pipe) = CreateNamedPipe(StrPtr(FullPipeName), dwOpenMode, dwPipeMode, _
                                   mMaxClients, mMaxResponse, mMaxRequest, mTimeout, VarPtr(sa))
    If hPipes(Pipe) = INVALID_HANDLE_VALUE Then
        Err.Raise &H80048A00, TypeName(Me), "Pipe #" & CStr(Pipe) & ", System error " & CStr(Err.LastDllError)
    End If
    ListenOnPipe Pipe
    Listeners = Listeners + 1
End Sub

Private Sub tmrPoll_Timer()
    Dim Pipe As Long
    Dim BytesRead As Long
    Dim SysErr As Long
    Dim BytesToWrite As Long
    Dim BytesWritten As Long
    Dim Request() As Byte
    Dim Response() As Byte
    Dim WasCalled As Boolean
    
    tmrPoll.Enabled = False
    ReDim Request(mMaxRequest - 1)
    Do
        WasCalled = False
        Pipe = 0
        Do
            If hPipes(Pipe) <> INVALID_HANDLE_VALUE Then
                If ReadFile(hPipes(Pipe), VarPtr(Request(0)), mMaxRequest, BytesRead, NULL_VALUE) = 0 Then
                    SysErr = Err.LastDllError
                    Select Case SysErr
                        Case ERROR_PIPE_LISTENING
                            'Nothing.
                        Case ERROR_NO_DATA
                            If Not bPipesConnected(Pipe) Then
                                'CreateFile connect case.
                                ListenOnPipe Pipe
                                bPipesConnected(Pipe) = True
                                Listeners = Listeners - 1
                                NewListener
                                RaiseEvent Connected(Pipe)
                            End If
                        Case ERROR_BROKEN_PIPE
                            CleanUpServerPipe Pipe, pdrClientDisconnect, SysErr
                        Case ERROR_MORE_DATA
                            CleanUpServerPipe Pipe, pdrRequestTooLong, SysErr
                        Case Else
                            CleanUpServerPipe Pipe, pdrReadError, SysErr
                    End Select
                Else
                    If Not bPipesConnected(Pipe) Then
                        'CallNamedPipe connect case.
                        bPipesConnected(Pipe) = True
                        Listeners = Listeners - 1
                        NewListener
                        RaiseEvent Connected(Pipe)
                    End If
                    ReDim Preserve Request(BytesRead - 1)
                    Erase Response
                    RaiseEvent Called(Pipe, Request, Response)
                    ReDim Request(mMaxRequest - 1)
                    BytesToWrite = UBound(Response) - LBound(Response) + 1
                    If WriteFile(hPipes(Pipe), VarPtr(Response(LBound(Response))), _
                                 BytesToWrite, BytesWritten, NULL_VALUE) = 0 Then
                        CleanUpServerPipe Pipe, pdrWriteError, Err.LastDllError
                    Else
                        FlushFileBuffers hPipes(Pipe)
                        If BytesWritten < BytesToWrite Then
                            CleanUpServerPipe Pipe, pdrResponseTooShort
                        End If
                    End If
                    WasCalled = mMultiPoll
                End If
            End If
            Pipe = Pipe + 1
        Loop Until Pipe > UBound(hPipes) 'Not a For loop since we may have added to hPipes in the loop.
    Loop While WasCalled
    tmrPoll.Enabled = True
End Sub

Private Sub UserControl_Initialize()
    Dim Length As Long
    
    'Create the NULL security token for the pipe.
    pSD = GlobalAlloc(GPTR, SECURITY_DESCRIPTOR_MIN_LENGTH)
    InitializeSecurityDescriptor pSD, SECURITY_DESCRIPTOR_REVISION
    SetSecurityDescriptorDacl pSD, True, NULL_VALUE, False
    With sa
        .nLength = LenB(sa)
        .lpSecurityDescriptor = pSD
        .bInheritHandle = True
    End With
    
    'Initialize server values.
    ReDim hPipes(0)
    ReDim bPipesConnected(0)
    hPipes(0) = INVALID_HANDLE_VALUE
    tmrPoll.Interval = PIPERPC_SERVER_POLL_INTERVAL
    
    'Initialize client values.
    hPipe = INVALID_HANDLE_VALUE
    
    'Initialize general values.
    mTimeout = ptoServerDefault
    mComputerName = Space$(MAX_COMPUTER_LENGTH)
    Length = MAX_COMPUTER_LENGTH + 1
    If GetComputerName(StrPtr(mComputerName), Length) = 0 Then
        mComputerName = ""
    Else
        mComputerName = Left$(mComputerName, Length)
    End If
End Sub

Private Sub UserControl_InitProperties()
    mMaxClients = 1
    mMaxRequest = 1024
    mMaxResponse = 1024
    mMultiPoll = False
    mPipeName = ""
    mServer = "."
    mTimeout = ptoServerDefault
End Sub

Private Sub UserControl_Paint()
    Width = 480
    Height = 480
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    With PropBag
        mMaxClients = .ReadProperty("MaxClients", 1)
        mMaxRequest = .ReadProperty("MaxRequest", 1024)
        mMaxResponse = .ReadProperty("MaxResponse", 1024)
        mMultiPoll = .ReadProperty("MultiPoll", False)
        mPipeName = .ReadProperty("PipeName", "")
        mServer = .ReadProperty("Server", ".")
        mTimeout = .ReadProperty("Timeout", ptoServerDefault)
    End With
End Sub

Private Sub UserControl_Terminate()
    If hPipe <> INVALID_HANDLE_VALUE Then CloseHandle hPipe
    CleanUpMe
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    With PropBag
        .WriteProperty "MaxClients", mMaxClients, 1
        .WriteProperty "MaxRequest", mMaxRequest, 1024
        .WriteProperty "MaxResponse", mMaxResponse, 1024
        .WriteProperty "MultiPoll", mMultiPoll, False
        .WriteProperty "PipeName", mPipeName, ""
        .WriteProperty "Server", mServer, "."
        .WriteProperty "Timeout", mTimeout, ptoServerDefault
    End With
End Sub
