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

Private Sub OwnerForm_MouseMove(button As Integer, Shift As Integer, X As Single, Y As Single)
    Static rec As Boolean, MSG As Long
    MSG = X / Screen.TwipsPerPixelX
    Debug.Print (MSG)
    If rec = False Then
        rec = True
        'Tests all the Mouse Down values are in the right places on all sim size
        '  No Sim       Size 1       Size 2       Size3        Size 4       Size 5        Size 6        Size 7        Size 8        Size 9        Size 10       Size 11       Size 12       Size 13       Size 14        Size 15        Size 16        Size 17        Size 18        Size 19        Size 20        Size 21        Size 22        Size 23        Size 24        Size 25
        If MSG = 514 Or MSG = 250 Or MSG = 430 Or MSG = 645 Or MSG = 859 Or MSG = 1074 Or MSG = 1289 Or MSG = 1504 Or MSG = 1719 Or MSG = 1934 Or MSG = 2148 Or MSG = 2363 Or MSG = 2578 Or MSG = 5156 Or MSG = 10312 Or MSG = 15468 Or MSG = 20624 Or MSG = 25781 Or MSG = 30937 Or MSG = 36023 Or MSG = 41249 Or MSG = 46405 Or MSG = 51561 Or MSG = 56717 Or MSG = 61873 Or MSG = 67029 Then
            RaiseEvent MouseDown(1)
        End If
        Select Case MSG
            Case WM_LBUTTONDBLCLK:
                'RaiseEvent MouseDown(1)
            Case WM_LBUTTONDOWN:
                'RaiseEvent MouseDown(1)
            Case WM_LBUTTONUP:
                'RaiseEvent MouseDown(1)
            Case WM_RBUTTONDBLCLK:
                'RaiseEvent MouseDown(1)
            Case WM_RBUTTONDOWN:
                'RaiseEvent MouseDown(1)
            Case WM_RBUTTONUP:
                'RaiseEvent MouseDown(1)
        End Select
        rec = False
        End If
End Sub


