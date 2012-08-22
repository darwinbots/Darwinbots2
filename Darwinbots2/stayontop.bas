Attribute VB_Name = "stayontop"
Declare Function SetWindowPos Lib "user32" _
  (ByVal hwnd As Long, _
  ByVal hWndInsertAfter As Long, _
  ByVal X As Long, ByVal Y As Long, _
  ByVal cx As Long, ByVal cy As Long, _
  ByVal wFlags As Long) As Long
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const HWND_TOP = 0
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2

