Attribute VB_Name = "F1Mode"
Option Explicit

Public Type pop
  SpName As String
  population As Integer
  Wins As Integer
  exist As Integer
End Type

'For F1 Contests:
Public PopArray(20) As pop
Public F1count As Single
Public ContestMode As Boolean
Public Contests As Integer
Public TotSpecies As Integer
Public RestartMode As Boolean
Public ReStarts As Long
Public FirstCycle As Boolean
Public SampFreq As Integer
Public Over As Boolean

Public optMinRounds As Integer 'for settings only
Public MinRounds As Integer
Public Maxrounds As Integer
Public MaxCycles As Long
Public MaxPop As Integer
Public optMaxCycles As Long

'For League mode
Private eye11 As Integer 'for eye fudging.  Search 'fudge' to see what I mean
Public StartAnotherRound As Boolean

'For restarts
Public robotA As String
Public robotB As String

Public Sub ResetContest()
  Dim t As Integer
  Contests = 0
  Contest_Form.Winner.Caption = ""
  Contest_Form.Winner1.Caption = ""
  For t = 1 To 5
    PopArray(t).SpName = ""
    PopArray(t).population = 0
    PopArray(t).Wins = 0
  Next t
End Sub

Public Sub FindSpecies()
'counts species of robots at beginning of simulation
  Dim SpeciePointer As Integer
  Dim t As Integer
  Dim robcol(10) As Long
  Dim realname As String
  TotSpecies = 0
  If Contests = 0 Then ResetContest
  
  For t = 1 To 20
    PopArray(t).SpName = ""
    PopArray(t).population = 0
    'If Contests = 0 Then PopArray(t).Wins = 0
  Next t
  Contest_Form.Show
  Contest_Form.Contests.Caption = Str(Contests)
  
  For t = 0 To MaxRobs 'Botsareus 2/5/2014 A little mod here
  
      If Not rob(t).Veg And Not rob(t).Corpse And rob(t).exist Then
        For SpeciePointer = 1 To 20
          
          realname = Left(rob(t).FName, Len(rob(t).FName) - 4)
          If realname = PopArray(SpeciePointer).SpName Then
            PopArray(SpeciePointer).population = PopArray(SpeciePointer).population + 1
            Exit For
          End If
          If PopArray(SpeciePointer).SpName = "" Then
            TotSpecies = TotSpecies + 1
            PopArray(SpeciePointer).SpName = realname
            PopArray(SpeciePointer).population = PopArray(SpeciePointer).population + 1
            robcol(SpeciePointer) = rob(t).color
            Exit For
          End If
        Next SpeciePointer
      End If
   
  Next t
  If TotSpecies = 1 Then
      ContestMode = False
      MDIForm1.F1Piccy.Visible = False
      Contest_Form.Visible = False
      t = MsgBox("You have only selected one species for combat. Formula 1 mode disabled", vbOKOnly)
      GoTo getout
  End If
  'Botsareus 2/11/2014 reset time limit and stuff
  If TotSpecies > 2 And (MaxCycles > 0 Or MaxPop > 0) Then
    MaxCycles = 0
    MaxPop = 0
    MsgBox "You have selected more then two species for combat. Cycle limit and max population disabled", vbOKOnly
  End If
  '
  If PopArray(1).SpName <> "" Then
    Contest_Form.Robname1.Caption = PopArray(1).SpName
    Contest_Form.wins1.Caption = Str(PopArray(1).Wins)
    Contest_Form.Pop1.Caption = Str(PopArray(1).population)
    Contest_Form.Robname1.ForeColor = robcol(1)
    Contest_Form.Option1(1).Visible = True
  Else
    Contest_Form.Robname1.Caption = ""
    Contest_Form.wins1.Caption = ""
    Contest_Form.Pop1.Caption = ""
    Contest_Form.Option1(1).Visible = False
  End If
  If PopArray(2).SpName <> "" Then
    Contest_Form.Robname2.Caption = PopArray(2).SpName
    Contest_Form.Wins2.Caption = Str(PopArray(2).Wins)
    Contest_Form.Pop2.Caption = Str(PopArray(2).population)
    Contest_Form.Robname2.ForeColor = robcol(2)
    Contest_Form.Option1(2).Visible = True
  Else
    Contest_Form.Robname2.Caption = ""
    Contest_Form.Wins2.Caption = ""
    Contest_Form.Pop2.Caption = ""
    Contest_Form.Option1(2).Visible = False
  End If
  If PopArray(3).SpName <> "" Then
    Contest_Form.Robname3.Caption = PopArray(3).SpName
    Contest_Form.Wins3.Caption = Str(PopArray(3).Wins)
    Contest_Form.Pop3.Caption = Str(PopArray(3).population)
    Contest_Form.Robname3.ForeColor = robcol(3)
    Contest_Form.Option1(3).Visible = True
  Else
    Contest_Form.Robname3.Caption = ""
    Contest_Form.Wins3.Caption = ""
    Contest_Form.Pop3.Caption = ""
    Contest_Form.Option1(3).Visible = False
  End If
  If PopArray(4).SpName <> "" Then
    Contest_Form.Robname4.Caption = PopArray(4).SpName
    Contest_Form.Wins4.Caption = Str(PopArray(4).Wins)
    Contest_Form.Pop4.Caption = Str(PopArray(4).population)
    Contest_Form.Robname4.ForeColor = robcol(4)
    Contest_Form.Option1(4).Visible = True
  Else
    Contest_Form.Robname4.Caption = ""
    Contest_Form.Wins4.Caption = ""
    Contest_Form.Pop4.Caption = ""
    Contest_Form.Option1(4).Visible = False
  End If
  If PopArray(5).SpName <> "" Then
    Contest_Form.Robname5.Caption = PopArray(5).SpName
    Contest_Form.Wins5.Caption = Str(PopArray(5).Wins)
    Contest_Form.Pop5.Caption = Str(PopArray(5).population)
    Contest_Form.Robname5.ForeColor = robcol(5)
    Contest_Form.Option1(5).Visible = True
  Else
    Contest_Form.Robname5.Caption = ""
    Contest_Form.Wins5.Caption = ""
    Contest_Form.Pop5.Caption = ""
    Contest_Form.Option1(5).Visible = False
  End If
  If ContestMode Then
    Contest_Form.Visible = True
    'Contests = 0
  End If
getout:
End Sub
Public Sub Countpop()
'counts population of robots at regular intervals
'for auto-combat mode and for automatic reset of starting conditions
  Dim SpeciePointer As Integer
  Dim SpeciesLeft As Integer
  Dim t As Integer
  Dim p As Integer
  Dim Winner As String
  Dim Wins As Single
  Dim realname As String
  
Static oldpop1 As Integer 'Botsareus 2/14/2014 These are static holds population from last mode change
Static oldpop2 As Integer
Static setoldpop As Boolean
  
  
  For t = 1 To 20
    PopArray(t).population = 0
    PopArray(t).exist = 0
  Next t
  
  For t = 1 To MaxRobs
      If Not rob(t).Veg And Not rob(t).Corpse And rob(t).exist Then
        For SpeciePointer = 1 To TotSpecies
          realname = Left(rob(t).FName, Len(rob(t).FName) - 4)
          If realname = PopArray(SpeciePointer).SpName Then
            PopArray(SpeciePointer).population = PopArray(SpeciePointer).population + 1
            PopArray(SpeciePointer).exist = 1
            Exit For
          End If
        Next SpeciePointer
      End If
  Next t
  If Contests < MinRounds Then
    Contest_Form.Contests.Caption = Contests + 1
  End If
  Contest_Form.Maxrounds.Caption = IIf(optMinRounds < Maxrounds And Contest_Form.Winner.Caption = "" Or Maxrounds = 0, optMinRounds, Maxrounds)
  SpeciesLeft = 0
  For p = 1 To TotSpecies
    SpeciesLeft = SpeciesLeft + PopArray(p).exist
  Next p
  If SpeciesLeft = 1 And Contests + 1 <= MinRounds And Over = False Then
    For t = 1 To TotSpecies
      If PopArray(t).population <> 0 Then
        PopArray(t).Wins = PopArray(t).Wins + 1
      End If
    Next t
  End If
  Contest_Form.Visible = True
  If PopArray(1).SpName <> "" Then
    Contest_Form.Robname1.Caption = PopArray(1).SpName
    Contest_Form.wins1.Caption = Str(PopArray(1).Wins)
    Contest_Form.Pop1.Caption = Str(PopArray(1).population)
  Else
    Contest_Form.Robname1.Caption = ""
    Contest_Form.wins1.Caption = ""
    Contest_Form.Pop1.Caption = ""
  End If
  If PopArray(2).SpName <> "" Then
    Contest_Form.Robname2.Caption = PopArray(2).SpName
    Contest_Form.Wins2.Caption = Str(PopArray(2).Wins)
    Contest_Form.Pop2.Caption = Str(PopArray(2).population)
  Else
    Contest_Form.Robname2.Caption = ""
    Contest_Form.Wins2.Caption = ""
    Contest_Form.Pop2.Caption = ""
  End If
  If PopArray(3).SpName <> "" Then
    Contest_Form.Robname3.Caption = PopArray(3).SpName
    Contest_Form.Wins3.Caption = Str(PopArray(3).Wins)
    Contest_Form.Pop3.Caption = Str(PopArray(3).population)
  Else
    Contest_Form.Robname3.Caption = ""
    Contest_Form.Wins3.Caption = ""
    Contest_Form.Pop3.Caption = ""
  End If
  If PopArray(4).SpName <> "" Then
    Contest_Form.Robname4.Caption = PopArray(4).SpName
    Contest_Form.Wins4.Caption = Str(PopArray(4).Wins)
    Contest_Form.Pop4.Caption = Str(PopArray(4).population)
  Else
    Contest_Form.Robname4.Caption = ""
    Contest_Form.Wins4.Caption = ""
    Contest_Form.Pop4.Caption = ""
  End If
  If PopArray(5).SpName <> "" Then
    Contest_Form.Robname5.Caption = PopArray(5).SpName
    Contest_Form.Wins5.Caption = Str(PopArray(5).Wins)
    Contest_Form.Pop5.Caption = Str(PopArray(5).population)
  Else
    Contest_Form.Robname5.Caption = ""
    Contest_Form.Wins5.Caption = ""
    Contest_Form.Pop5.Caption = ""
  End If
  
  'Botsareus 2/11/2014 Population control
  If MaxPop > 0 Then
    If PopArray(1).population > MaxPop Or PopArray(2).population > MaxPop Then
        Dim erase1 As Integer
        Dim erase2 As Integer
        If PopArray(1).population > PopArray(2).population Then
            erase1 = MaxPop - PopArray(1).population
            erase2 = erase1 * (PopArray(2).population / PopArray(1).population)
        Else
            erase2 = MaxPop - PopArray(2).population
            erase1 = erase2 * (PopArray(1).population / PopArray(2).population)
        End If
        Dim l As Integer 'loop each erase
        Dim calcminenergy As Single
        Dim selectrobot As Integer
        
        For l = 0 To -erase1 'only erase robots with lowest energy
            calcminenergy = 320000
            For t = 1 To MaxRobs
                If rob(t).exist Then
                    If Left(rob(t).FName, Len(rob(t).FName) - 4) = PopArray(1).SpName Then
                        If (rob(t).nrg + rob(t).body * 10) < calcminenergy Then
                            calcminenergy = (rob(t).nrg + rob(t).body * 10)
                            selectrobot = t
                        End If
                    End If
                End If
            Next t
            Call KillRobot(selectrobot)
        Next l
        
        For l = 0 To -erase2 'only erase robots with lowest energy
            calcminenergy = 320000
            For t = 1 To MaxRobs
                If rob(t).exist Then
                    If Left(rob(t).FName, Len(rob(t).FName) - 4) = PopArray(2).SpName Then
                        If (rob(t).nrg + rob(t).body * 10) < calcminenergy Then
                            calcminenergy = (rob(t).nrg + rob(t).body * 10)
                            selectrobot = t
                        End If
                    End If
                End If
            Next t
            Call KillRobot(selectrobot)
        Next l
        
    End If
  End If
  
  If optMaxCycles > 0 Then 'Botsareus 2/14/2014 The max cycles code
    If SimOpts.TotRunCycle < 500 And Not setoldpop Then 'reset old pop
        If PopArray(1).population > 0 And PopArray(2).population > 0 Then
            oldpop1 = PopArray(1).population
            oldpop2 = PopArray(2).population
            setoldpop = True
        End If
    End If
    If ModeChangeCycles > 1000 Then
        If PopArray(1).population > PopArray(2).population Then
            If (PopArray(1).population - oldpop1) < (PopArray(2).population - oldpop2) And PopArray(2).population > 10 Then optMaxCycles = optMaxCycles + 1000 / (MaxCycles / (MaxCycles * PopArray(1).population / PopArray(2).population - MaxCycles) + 1)
        End If
        If PopArray(2).population > PopArray(1).population Then
            If (PopArray(2).population - oldpop2) < (PopArray(1).population - oldpop1) And PopArray(1).population > 10 Then optMaxCycles = optMaxCycles + 1000 / (MaxCycles / (MaxCycles * PopArray(2).population / PopArray(1).population - MaxCycles) + 1)
        End If
        oldpop1 = PopArray(1).population
        oldpop2 = PopArray(2).population
        ModeChangeCycles = 0
    End If
    If SimOpts.TotRunCycle > optMaxCycles Then 'Botsareus 2/14/2014 kill losing species
        If PopArray(1).population > PopArray(2).population Then
        
            optMaxCycles = MaxCycles
            SimOpts.TotRunCycle = 0
            setoldpop = False
            
            For t = 1 To MaxRobs
                If rob(t).exist Then
                    If Left(rob(t).FName, Len(rob(t).FName) - 4) = PopArray(2).SpName Then KillRobot t
                End If
            Next
        End If
        If PopArray(2).population > PopArray(1).population Then
        
            optMaxCycles = MaxCycles
            SimOpts.TotRunCycle = 0
            setoldpop = False
            
        
            For t = 1 To MaxRobs
                If rob(t).exist Then
                    If Left(rob(t).FName, Len(rob(t).FName) - 4) = PopArray(1).SpName Then KillRobot t
                End If
            Next
        End If
    End If
  End If
  
  'Botsareus 2/11/2014 check here for max per contestent
  If Maxrounds > 0 Then
  For t = 1 To TotSpecies
    If PopArray(t).Wins > Maxrounds - 1 Then
        Winner = PopArray(t).SpName
        GoTo won
    End If
  Next t
  End If
  '
  F1count = 0
  Wins = Sqr(MinRounds) + (MinRounds / 2)
  
  If SpeciesLeft = 0 Then 'in very rear cases both robots are dead when checking, start another round
      StartAnotherRound = True
      startnovid = loadstartnovid 'Botsareus bugfix for no vedio
  End If
  
  
  If SpeciesLeft = 1 And Contests + 1 <= MinRounds Then
    If Contests + 1 = MinRounds And Over = False Then 'contest is over now
      For t = 1 To TotSpecies
        If PopArray(t).Wins > Wins Then
          Winner = PopArray(t).SpName
won:
          Over = True
          DisplayActivations = False
          Form1.Active = False
          Form1.SecTimer.Enabled = False
          Select Case x_restartmode 'all new league components start with "x_"
          Case 6
            If Winner = "Test" Then UpdateWonF1
            If Winner = "Base" Then UpdateLostF1
          Case 0
            MsgBox Winner & " has won.", , "F1 mode"
          Case 2
          'R E S T A R T  N E X T
            'first we make sure next round folder is there
            If Not FolderExists(MDIForm1.MainDir & "\league\round" & (x_filenumber + 1)) Then MkDir MDIForm1.MainDir & "\league\round" & (x_filenumber + 1)
            If Winner = "robotA" Then FileCopy MDIForm1.MainDir & "\league\robotA.txt", MDIForm1.MainDir & "\league\round" & (x_filenumber + 1) & "\" & robotA
            If Winner = "robotB" Then FileCopy MDIForm1.MainDir & "\league\robotB.txt", MDIForm1.MainDir & "\league\round" & (x_filenumber + 1) & "\" & robotB
            Open App.path & "\Safemode.gset" For Output As #1
             Write #1, False
            Close #1
            Call restarter
          Case 3
            If Winner = "robotA" Then populateladder
            If Winner = "robotB" Then
                'move file to current position
                robotB = dir$(leagueSourceDir & "\*.*")
                movetopos leagueSourceDir & "\" & robotB, x_filenumber
                'reset filenumber
                x_filenumber = 0
                'start another round
                populateladder
            End If
          End Select
          Exit Sub
        Else
          Winner = "Statistical Draw. Extending contest."
        End If
      Next t
      Contest_Form.Winner.Caption = Winner
      If Winner <> "Statistical Draw. Extending contest." Then
        Contest_Form.Winner1.Caption = "Winner"
      Else
        MinRounds = MinRounds + 1
      End If
    End If
    If Contests + 1 <= MinRounds And Over = False Then
      Contests = Contests + 1
      StartAnotherRound = True
      startnovid = loadstartnovid 'Botsareus bugfix for no vedio
    Else
      StartAnotherRound = False
    End If
  End If
End Sub

Public Sub populateladder() 'populate one step ladder round
'erase robots A and B optionally
Open MDIForm1.MainDir & "\league\robotA.txt" For Append As #1
 Print #1, "0"
Close #1
Open MDIForm1.MainDir & "\league\robotB.txt" For Append As #1
 Print #1, "0"
Close #1
Kill MDIForm1.MainDir & "\league\robotA.txt"
Kill MDIForm1.MainDir & "\league\robotB.txt"
'update file number
x_filenumber = x_filenumber + 1
Open App.path & "\restartmode.gset" For Output As #1
        Write #1, 3
        Write #1, x_filenumber
Close #1
Dim tmpname As String
Dim file_name As String

'files in stepladder
Dim files As Collection
Set files = getfiles(MDIForm1.MainDir & "\league\stepladder")

If x_filenumber > files.count Then 'if filenumber maxed out we need to move robot and reset filenumber

    'move file to last position
    file_name = dir$(leagueSourceDir & "\*.*")
    movetopos leagueSourceDir & "\" & file_name, x_filenumber

    'reset file number
    x_filenumber = 1
    Open App.path & "\restartmode.gset" For Output As #1
            Write #1, 3
            Write #1, x_filenumber
    Close #1

End If

'RobotB
file_name = dir$(leagueSourceDir & "\*.*")
If file_name = "" Then
    x_restartmode = 0
    Kill App.path & "\restartmode.gset"
    MsgBox "Go to " & MDIForm1.MainDir & "\league\stepladder to view your results.", vbExclamation, "League Complete!"
    Exit Sub
Else
FileCopy leagueSourceDir & "\" & file_name, MDIForm1.MainDir & "\league\robotB.txt"
End If

Dim j As Integer
'RobotA
'find a file prefixed i
For j = 1 To files.count
    tmpname = extractname(files(j))
    If tmpname Like x_filenumber & "-*" Then
        FileCopy files(j), MDIForm1.MainDir & "\league\robotA.txt"
    End If
Next

'Restart
Open App.path & "\Safemode.gset" For Output As #1
 Write #1, False
Close #1
Call restarter
End Sub

Public Sub dreason(ByVal Name As String, ByVal tag As String, ByVal reason As String)

'format the tag
Dim blank As String * 50
If Left(tag, 45) = Left(blank, 45) Then tag = "" Else tag = "(" & Trim(Left(tag, 45)) & ")"

'update list
Open MDIForm1.MainDir & "\Disqualifications.txt" For Append As #1
    Print #1, "Robot """ & Name & """" & tag & " has been disqualified for " & reason & "."
Close #1

    Dim t As Integer

'kill species
For t = 1 To MaxRobs
    If Not rob(t).Veg And Not rob(t).Corpse And rob(t).exist Then
        If rob(t).FName = Name Then KillRobot t
    End If
Next t
End Sub
