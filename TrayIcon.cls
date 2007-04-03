VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TrayIcon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private Type NOTIFYICONDATA
    cbSize As Long
    hwnd As Long
    uId As Long
    uFlags As Long
    ucallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const WM_MOUSEMOVE = &H200
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4

Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = 536 '513
Private Const WM_LBUTTONUP = &H202
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = 603 '516
Private Const WM_RBUTTONUP = &H205

Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Private theTray As NOTIFYICONDATA

Public Enum theStates
    TI_ADDED = 1
    TI_MODIFIED = 2
    TI_REMOVED = 0
End Enum

Private mvarTooltip As String
Private mvarIcon As StdPicture
Private mvarOwnerForm As Object
Private mvarState As Integer

Public Event MouseDown(ByVal button As Integer)
Public Event MouseUp(ByVal button As Integer)
Public Event MouseDblClick(ByVal button As Integer)

Public WithEvents OwnerForm As Form
Attribute OwnerForm.VB_VarHelpID = -1

Public Property Get State() As Integer
    State = mvarState
End Property

Public Sub Remove()
    Shell_NotifyIcon NIM_DELETE, theTray
    mvarState = TI_REMOVED
End Sub

Public Sub Modify()
    With theTray
        .cbSize = Len(theTray)
        .hIcon = mvarIcon
        .hwnd = OwnerForm.hwnd
        .szTip = mvarTooltip
        .ucallbackMessage = WM_MOUSEMOVE
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .uId = 1&
    End With
    Shell_NotifyIcon NIM_MODIFY, theTray
    mvarState = TI_MODIFIED
End Sub

Public Sub Add()
    With theTray
        .cbSize = Len(theTray)
        .hIcon = mvarIcon
        .hwnd = OwnerForm.hwnd
        .szTip = mvarTooltip
        .ucallbackMessage = WM_MOUSEMOVE
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .uId = 1&
    End With
    Shell_NotifyIcon NIM_ADD, theTray
    mvarState = TI_ADDED
End Sub

Public Property Set Icon(ByVal vData As StdPicture)
    Set mvarIcon = vData
End Property

Public Property Get Icon() As StdPicture
    Set Icon = mvarIcon
End Property

Public Property Let Tooltip(ByVal vData As String)
    'Add Null to the Tooltip
    mvarTooltip = vData & vbNullChar
End Property

Public Property Get Tooltip() As String
    'Strip Null
    Tooltip = Left(mvarTooltip, Len(mvarTooltip) - 1)
End Property

Private Sub OwnerForm_MouseMove(button As Integer, Shift As Integer, x As Single, y As Single)
    Static rec As Boolean, MSG As Long
    MSG = x / Screen.TwipsPerPixelX
    If rec = False Then
        rec = True
        If MSG <> 535 Then
          RaiseEvent MouseDown(1)
        End If
        Select Case MSG
            Case WM_LBUTTONDBLCLK:
                RaiseEvent MouseDblClick(vbLeftButton)
            Case WM_LBUTTONDOWN:
                RaiseEvent MouseDown(vbLeftButton)
            Case WM_LBUTTONUP:
                RaiseEvent MouseUp(vbLeftButton)
            Case WM_RBUTTONDBLCLK:
                RaiseEvent MouseDblClick(vbRightButton)
            Case WM_RBUTTONDOWN:
                RaiseEvent MouseDown(vbRightButton)
            Case WM_RBUTTONUP:
                RaiseEvent MouseUp(vbRightButton)
        End Select
        rec = False
    End If
End Sub

