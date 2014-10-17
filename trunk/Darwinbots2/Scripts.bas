Attribute VB_Name = "Scripts"
Option Explicit

' for DNA scripts
Private Type Script
  Index As Integer
  Condition As String
  Item As String
  Action As String
End Type

Public Sub SaveScripts()
  Dim ScriptList(9) As Script
  Dim t As Integer
  
  For t = 1 To 9
    Write #1, ScriptList(t).Action
    Write #1, ScriptList(t).Condition
    Write #1, ScriptList(t).Index
    Write #1, ScriptList(t).Item
  Next t
End Sub
Public Sub LoadScripts()
  Dim ScriptList(9) As Script
  Dim t As Integer
  For t = 1 To 9
    ScriptList(t).Action = ""
    ScriptList(t).Condition = ""
    ScriptList(t).Index = 0
    ScriptList(t).Item = ""
    If Not EOF(1) Then Input #1, ScriptList(t).Action
    If Not EOF(1) Then Input #1, ScriptList(t).Condition
    If Not EOF(1) Then Input #1, ScriptList(t).Index
    If Not EOF(1) Then Input #1, ScriptList(t).Item
  Next t
End Sub
