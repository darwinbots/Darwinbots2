Attribute VB_Name = "Module1"
Option Explicit
Sub Main()
Dim t As Integer
t = Timer
Do
DoEvents
Loop Until t + 5 < Timer
Shell Command$, vbNormalFocus
End Sub
