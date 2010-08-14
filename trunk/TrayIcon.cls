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
    hWnd As Long
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
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_LBUTTONUP = &H202
Private Const WM_RBUTTONDBLCLK = &H206
Private Const WM_RBUTTONDOWN = &H204
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

Public Event MouseDown(ByVal Button As Integer)
Public Event MouseUp(ByVal Button As Integer)
Public Event MouseDblClick(ByVal Button As Integer)

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
        .hWnd = OwnerForm.hWnd
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
        .hWnd = OwnerForm.hWnd
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

Private Sub OwnerForm_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Select Case Button
  Case 0 'no button is pressed
  Case 1 'only left button is pressed
  RaiseEvent MouseDown(1)
  Case 2 'only right button is pressed
  RaiseEvent MouseDown(2)
  Case 3 'only left and right buttons are pressed
  Case 4 'only middle button is pressed
  Case 5 'only left and middle buttons are pressed
  Case 6 'only right and middle buttons are pressed
  Case 7 'all three buttons are pressed
End Select
End Sub

