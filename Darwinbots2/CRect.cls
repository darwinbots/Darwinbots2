VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CRect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'FormDsgn - Run-Time Form Design Demo Program
'Copyright (c) 1997 SoftCircuits Programming (R)
'Redistributed by Permission.
'
'This Visual Basic 5.0 example program demonstrates code that allows
'the user to move and size control at run time much as Visual Basic
'allows at design time. The code implements sizing handles and a drag
'rectangle that appears as the user is sizing and moving controls.
'
'This version of the code works with most controls. Special code was
'added to deal with Line controls. However, the code was not designed
'to work with controls that are contained within container controls.
'Additional code would be required to handle this case.
'
'This program may be distributed on the condition that it is
'distributed in full and unchanged, and that no fee is charged for
'such distribution with the exception of reasonable shipping and media
'charged. In addition, the code in this program may be incorporated
'into your own programs and the resulting programs may be distributed
'without payment of royalties.
'
'This example program was provided by:
' SoftCircuits Programming
' http://www.softcircuits.com
' P.O. Box 16262
' Irvine, CA 92623
'
'Special thanks to Doug Marquardt who wrote the original code on which
'this demo program was based.
Option Explicit

'Unfortunately, a fair amount of additional logic
'is required only for line controls
#Const ADD_LINE_LOGIC = True

Private Type POINTAPI
    x As Long
    y As Long
End Type

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function ScreenToClient Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long

Private m_Rect As RECT

#If ADD_LINE_LOGIC Then

'
Private Const SWAP_NONE = &H0
Private Const SWAP_X = &H1
Private Const SWAP_Y = &H2
Private m_fRectSwap As Integer

#End If

Public Property Let Left(NewLeft As Long)
    m_Rect.Left = NewLeft
End Property

Public Property Get Left() As Long
    Left = m_Rect.Left
End Property

Public Property Let Top(NewTop As Long)
    m_Rect.Top = NewTop
End Property

Public Property Get Top() As Long
    Top = m_Rect.Top
End Property

Public Property Let Right(NewRight As Long)
    m_Rect.Right = NewRight
End Property

Public Property Get Right() As Long
    Right = m_Rect.Right
End Property

Public Property Let Bottom(NewBottom As Long)
    m_Rect.Bottom = NewBottom
End Property

Public Property Get Bottom() As Long
    Bottom = m_Rect.Bottom
End Property

Public Property Let Width(NewWidth As Long)
    m_Rect.Right = m_Rect.Left + NewWidth
End Property

Public Property Get Width() As Long
    Width = m_Rect.Right - m_Rect.Left
End Property

Public Property Let Height(NewHeight As Long)
    m_Rect.Bottom = m_Rect.Top + NewHeight
End Property

Public Property Get Height() As Long
    Height = m_Rect.Bottom - m_Rect.Top
End Property

Public Sub SetRectToCtrl(ctl As Control, parent As Control, superparent As Control, masterparent As Control)

#If ADD_LINE_LOGIC Then
    'Reset swap flags
    m_fRectSwap = SWAP_NONE
    m_Rect.Left = ctl.Left + parent.Left + superparent.Left + masterparent.Left
    m_Rect.Top = ctl.Top + parent.Top + superparent.Top + masterparent.Top
    m_Rect.Right = ctl.Left + ctl.Width + parent.Left + superparent.Left + masterparent.Left
    m_Rect.Bottom = ctl.Top + ctl.Height + parent.Top + superparent.Top + masterparent.Top
#Else

    m_Rect.Left = ctl.Left + parent.Left + superparent.Left + masterparent.Left
    m_Rect.Top = ctl.Top + parent.Top + superparent.Top + masterparent.Top
    m_Rect.Right = ctl.Left + ctl.Width + parent.Left + superparent.Left + masterparent.Left
    m_Rect.Bottom = ctl.Top + ctl.Height + parent.Top + superparent.Top + masterparent.Top

#End If

End Sub

Public Sub SetCtrlToRect(ctl As Control, parent As Control, superparent As Control, masterparent As Control)

#If ADD_LINE_LOGIC Then

    'Force to valid rectangle
    NormalizeRect
    ctl.Move m_Rect.Left - parent.Left - superparent.Left - masterparent.Left, m_Rect.Top - parent.Top - superparent.Top - masterparent.Top, Width, Height

#Else
    'Force to valid rectangle
    NormalizeRect
    ctl.Move m_Rect.Left - parent.Left - superparent.Left - masterparent.Left, m_Rect.Top - parent.Top - superparent.Top - masterparent.Top, Width, Height
#End If

End Sub

Public Sub ScreenToTwips(ctl As Object)
    Dim pt As POINTAPI

    pt.x = m_Rect.Left
    pt.y = m_Rect.Top
    ScreenToClient ctl.parent.hwnd, pt
    m_Rect.Left = pt.x * Screen.TwipsPerPixelX
    m_Rect.Top = pt.y * Screen.TwipsPerPixelX
    pt.x = m_Rect.Right
    pt.y = m_Rect.Bottom
    ScreenToClient ctl.parent.hwnd, pt
    m_Rect.Right = pt.x * Screen.TwipsPerPixelX
    m_Rect.Bottom = pt.y * Screen.TwipsPerPixelX
End Sub

Public Sub TwipsToScreen(ctl As Object)
    Dim pt As POINTAPI
    Dim offsetx As Long
    Dim offsety As Long
    
    offsetx = 0
    offsety = 0
    
    pt.x = (m_Rect.Left + offsetx) / Screen.TwipsPerPixelX
    pt.y = (m_Rect.Top + offsety) / Screen.TwipsPerPixelX
    ClientToScreen ctl.parent.hwnd, pt
    m_Rect.Left = pt.x
    m_Rect.Top = pt.y
    pt.x = (m_Rect.Right + offsetx) / Screen.TwipsPerPixelX
    pt.y = (m_Rect.Bottom + offsety) / Screen.TwipsPerPixelX
    ClientToScreen ctl.parent.hwnd, pt
    m_Rect.Right = pt.x
    m_Rect.Bottom = pt.y
End Sub

Public Sub NormalizeRect()
    Dim nTemp As Long

    If m_Rect.Left > m_Rect.Right Then
        nTemp = m_Rect.Right
        m_Rect.Right = m_Rect.Left
        m_Rect.Left = nTemp
    End If
    If m_Rect.Top > m_Rect.Bottom Then
        nTemp = m_Rect.Bottom
        m_Rect.Bottom = m_Rect.Top
        m_Rect.Top = nTemp
    End If
End Sub

Public Function PtInRect(x As Single, y As Single) As Integer
    If x >= m_Rect.Left And x < m_Rect.Right And _
        y >= m_Rect.Top And y < m_Rect.Bottom Then
        PtInRect = True
    Else
        PtInRect = False
    End If
End Function

