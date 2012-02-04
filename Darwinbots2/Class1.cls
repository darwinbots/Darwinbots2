VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cevent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' event definition for console input
' I really can't remember why I have defined
' an event for it

Public Event textentered(ind As Integer, text As String)

Public Sub fire(a As Integer, t As String)
  RaiseEvent textentered(a, t)
End Sub
