Attribute VB_Name = "Scripts"
Option Explicit

' for DNA scripts
Private Type Script
  Index As Integer
  Condition As String
  Item As String
  Action As String
End Type
Public ScriptList(9) As Script

Public Sub CompStr(n As Integer, DNAfrom As String, DNAto As String)
  Dim Kill As Boolean
  Dim pause As Boolean
  Dim Snap As Boolean
  Dim Sc As Integer
  Dim CondFilled As Boolean
  Dim Item As String
  Dim Test As Integer
  
  'If DNAfrom = "" And DNAto = "" Then Exit Sub 'kick it out if nothing is gained or lost.
  
  'scan through the scripts
  Kill = False
  pause = False
  Snap = False
  
  For Sc = 1 To 9
    If ScriptList(Sc).Item <> "" Then
      Item = Right(ScriptList(Sc).Item, Len(ScriptList(Sc).Item) - 1)
    End If
    CondFilled = False
    If ScriptList(Sc).Condition = "Robot gains" Then
      If InStr(DNAto, Item) Then CondFilled = True
    End If
    If ScriptList(Sc).Condition = "Robot loses" Then
      If InStr(DNAfrom, Item) Then CondFilled = True
    End If
    If ScriptList(Sc).Condition = "Robot DNA contains" Then
      Test = SearchDNA(n, Sc)
      If Test > 0 Then CondFilled = True
    End If
    If ScriptList(Sc).Condition = "Robot DNA doesn't contain" Then
      Test = SearchDNA(n, Sc)
      If Test = 0 Then CondFilled = True
    End If
    If CondFilled = True Then
      If ScriptList(Sc).Action = "Kill Robot" Then Kill = True
      If ScriptList(Sc).Action = "Pause and highlight robot" Then pause = True
      If ScriptList(Sc).Action = "Take snapshot" Then Snap = True
    End If
  Next Sc
  
  If pause Then
    rob(n).highlight = True     'pause sim and highlight the robot
    Form1.Active = False
    Form1.SecTimer.Enabled = False
  End If
  If Kill Then                  'kill the robot
    rob(n).Dead = True
  End If
  If Snap Then
    Snapshot
  End If
  
  '"Robot gains"
  '"Robot loses"
  '"Robot DNA contains"
  '"Robot DNA doesn't contain"
  'All the possible actions
  '"Pause and highlight robot"
  '"Kill robot"
  '"Take Snapshot"
  
End Sub

Public Sub AddNewScript()
  Dim Line As Integer
  Dim newscript As String
  'add a new script to the ScriptList
  'First check that a valid script is ready
  If OptionsForm.Condition.text = "Condition" Or OptionsForm.Action.text = "Action" Or OptionsForm.Item.text = "None" Then
    MsgBox ("Invalid entry")
    Exit Sub
  End If
  'find first open line in the ScriptList
  For Line = 1 To 9
    If ScriptList(Line).Index = 0 Then Exit For
  Next Line
  
  If Line > 9 Then MsgBox ("Maximum number of Scripts exceeded"): Exit Sub
  ScriptList(Line).Condition = OptionsForm.Condition.text
  ScriptList(Line).Item = OptionsForm.Item.text
  ScriptList(Line).Action = OptionsForm.Action.text
  ScriptList(Line).Index = Line
  newscript = Str$(ScriptList(Line).Index) + ":  If " + ScriptList(Line).Condition + " Sysvar -- " + ScriptList(Line).Item + " -- then " + ScriptList(Line).Action
  OptionsForm.Scripts.additem newscript
End Sub
Public Sub DeleteScript()
  'deletes the selected script from the list
  Dim OldScript As String
  Dim newscript As String
  Dim Line As Integer
  'First check to see if a script has been selected
  If OptionsForm.Scripts.text = "" Or OptionsForm.Scripts.text = "Scripts" Then
    MsgBox ("No Script selected")
    Exit Sub
  End If
  OldScript = OptionsForm.Scripts.text
  'Remove script from the list
  Line = val(Mid(OldScript, 2, 1))
  ScriptList(Line).Action = ""
  ScriptList(Line).Condition = ""
  ScriptList(Line).Index = 0
  ScriptList(Line).Item = ""
  For Line = 1 To 8
    If ScriptList(Line).Index = 0 Then
      'pull data down to fill an empty space
      ScriptList(Line).Index = ScriptList(Line + 1).Index
      ScriptList(Line).Item = ScriptList(Line + 1).Item
      ScriptList(Line).Condition = ScriptList(Line + 1).Condition
      ScriptList(Line).Action = ScriptList(Line + 1).Action
      'delete copied line
      ScriptList(Line + 1).Action = ""
      ScriptList(Line + 1).Condition = ""
      ScriptList(Line + 1).Index = 0
      ScriptList(Line + 1).Item = ""
    End If
  Next Line
  DispScript
  
End Sub
Public Sub DispScript()
  Dim Line As Integer
  Dim newscript As String
  'clear the Scripts List Box
  OptionsForm.Scripts.Clear
  'reload data
  For Line = 1 To 9
    If ScriptList(Line).Index <> 0 Then
      newscript = Str$(Line) + ":  If " + ScriptList(Line).Condition + " Sysvar -- " + ScriptList(Line).Item + " -- then " + ScriptList(Line).Action
      OptionsForm.Scripts.additem newscript
    End If
  Next Line
End Sub
Public Sub SaveScripts()
  Dim t As Integer
  
  For t = 1 To 9
    Write #1, ScriptList(t).Action
    Write #1, ScriptList(t).Condition
    Write #1, ScriptList(t).Index
    Write #1, ScriptList(t).Item
  Next t
End Sub
Public Sub LoadScripts()
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

Public Sub LoadLists()
  Dim t As Integer
  Dim Name As String
  t = 1
  OptionsForm.Condition.Clear
  OptionsForm.Item.Clear
  OptionsForm.Action.Clear
  
  OptionsForm.Condition.additem "None"
  OptionsForm.Item.additem "None"
  OptionsForm.Action.additem "None"
  While sysvar(t).Name <> ""
    Name = " " + sysvar(t).Name
    OptionsForm.Item.additem (Name)
    t = t + 1
  Wend
  'All the possible conditions
  OptionsForm.Condition.additem "Robot gains"
  OptionsForm.Condition.additem "Robot loses"
  OptionsForm.Condition.additem "Robot DNA contains"
  OptionsForm.Condition.additem "Robot DNA doesn't contain"
  'All the possible actions
  OptionsForm.Action.additem "Pause and highlight robot"
  OptionsForm.Action.additem "Kill robot"
  OptionsForm.Action.additem "Take Snapshot"

End Sub

Private Function SearchDNA(n As Integer, Index As Integer)
  Dim t As Integer
  Dim c As Integer
  Dim f As String
  Dim count As Integer
  Dim Item As String
  Dim Memloc As Integer
  
  Item = Right(ScriptList(Index).Item, Len(ScriptList(Index).Item) - 1)
  
  'find the sysvar memloc for this item
  For t = 1 To 200
    If sysvar(t).Name = Item Then Memloc = sysvar(t).value: Exit For
  Next t
  
  f = rob(n).fname
  
  If f <> "Alga_Minimalis.txt" Then
    f = Item
  End If
  
  t = 1
  While Not rob(n).DNA(t).tipo = 4 And Not rob(n).DNA(t).value = 4
    If rob(n).DNA(t).tipo = 1 Or rob(n).DNA(t).tipo = 0 Then
      If rob(n).DNA(t).value = Memloc Then
        count = count + 1
        GoTo endloop
      End If
    End If
  Wend
endloop:
  
  SearchDNA = count
End Function
