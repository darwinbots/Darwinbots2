Attribute VB_Name = "F1Mode"
Option Explicit

Public Type pop
  SpName As String
  Population As Integer
  Wins As Integer
  exist As Integer
End Type

'For F1 Contests:
Public PopArray(20) As pop
Public F1count As Single
Public ContestMode As Boolean
Public Contests As Integer
Public TotSpecies As Integer
Public Maxrounds As Integer
Public RestartMode As Boolean
Public ReStarts As Long
Public FirstCycle As Boolean
Public SampFreq As Integer
Public Over As Boolean
Public MaxRoundsToDraw As Integer
Public MaxCycles As Long

'For League mode: (runs a series of F1 contests, 1 on 1)
Public LeagueMode As Boolean
Public Leaguename As String
Public Leaguererun As Boolean
Public LeagueEntrants(30) As datispecie 'all those already in the league
Public numLeagueEntrants As Integer
Public LeagueChallengers(31) As datispecie 'all those challenging (31 instead of 30 for some loop functions)
Public Defender As Integer 'couple used to determine which bots are facing which in League mode
Public Attacker As Integer
Private eye11 As Integer 'for eye fudging.  Search 'fudge' to see what I mean

Public StartAnotherRound As Boolean

Public Sub ResetContest()
  Dim t As Integer
  Contests = 0
  Contest_Form.Winner.Caption = ""
  Contest_Form.Winner1.Caption = ""
  For t = 1 To 5
    PopArray(t).SpName = ""
    PopArray(t).Population = 0
    PopArray(t).Wins = 0
  Next t
End Sub

Public Sub FindSpecies()
'counts species of robots at beginning of simulation
  Dim SpeciePointer As Integer
  Dim t As Integer
  Dim nd As node
  Dim robcol(10) As Long
  Dim realname As String
  TotSpecies = 0
  If Contests = 0 Then ResetContest
  
  For t = 1 To 20
    PopArray(t).SpName = ""
    PopArray(t).Population = 0
    'If Contests = 0 Then PopArray(t).Wins = 0
  Next t
  Contest_Form.Show
  Contest_Form.Contests.Caption = Str(Contests)
  
  For t = 1 To MaxRobs
    With rob(t)
      'If Not .Veg And Not .Corpse And Not .wall And .exist Then
      If Not .Veg And Not .Corpse And .exist Then
        For SpeciePointer = 1 To 20
          
          realname = Left(.FName, Len(.FName) - 4)
          If realname = PopArray(SpeciePointer).SpName Then
            PopArray(SpeciePointer).Population = PopArray(SpeciePointer).Population + 1
            Exit For
          End If
          If PopArray(SpeciePointer).SpName = "" Then
            TotSpecies = TotSpecies + 1
            PopArray(SpeciePointer).SpName = realname
            PopArray(SpeciePointer).Population = PopArray(SpeciePointer).Population + 1
            robcol(SpeciePointer) = .color
            Exit For
          End If
        Next SpeciePointer
      End If
    End With
  Next t
  If TotSpecies = 1 Then
'    If Not LeagueMode Then
      ContestMode = False
      MDIForm1.F1Piccy.Visible = False
      Contest_Form.Visible = False
      t = MsgBox("You have only selected one species for combat. Formula 1 mode disabled", vbOKOnly)
      Exit Sub
 '   End If
  End If
  If PopArray(1).SpName <> "" Then
    Contest_Form.Robname1.Caption = PopArray(1).SpName
    Contest_Form.wins1.Caption = Str(PopArray(1).Wins)
    Contest_Form.Pop1.Caption = Str(PopArray(1).Population)
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
    Contest_Form.Pop2.Caption = Str(PopArray(2).Population)
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
    Contest_Form.Pop3.Caption = Str(PopArray(3).Population)
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
    Contest_Form.Pop4.Caption = Str(PopArray(4).Population)
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
    Contest_Form.Pop5.Caption = Str(PopArray(5).Population)
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
End Sub
Public Sub Countpop()
'counts population of robots at regular intervals
'for auto-combat mode and for automatic reset of starting conditions
  Dim SpeciePointer As Integer
  Dim SpeciesLeft As Integer
  Dim t As Integer
  Dim P As Integer
  Dim nd As node
  Dim Winner As String
  Dim Wins As Single
  Dim realname As String
  
  
  For t = 1 To 20
    PopArray(t).Population = 0
    PopArray(t).exist = 0
  Next t
  
  For t = 1 To MaxRobs
    With rob(t)
      'If Not .Veg And Not .Corpse And Not .wall And .exist Then
      If Not .Veg And Not .Corpse And .exist Then
        For SpeciePointer = 1 To TotSpecies
          realname = Left(.FName, Len(.FName) - 4)
          If realname = PopArray(SpeciePointer).SpName Then
            PopArray(SpeciePointer).Population = PopArray(SpeciePointer).Population + 1
            PopArray(SpeciePointer).exist = 1
            Exit For
          End If
        Next SpeciePointer
      End If
    End With
  Next t
  If Contests < Maxrounds Then
    Contest_Form.Contests.Caption = Contests + 1
  End If
  Contest_Form.Maxrounds.Caption = Maxrounds
  Contest_Form.Refresh
  SpeciesLeft = 0
  For P = 1 To TotSpecies
    SpeciesLeft = SpeciesLeft + PopArray(P).exist
  Next P
  If SpeciesLeft = 1 And Contests + 1 <= Maxrounds And Over = False Then
    For t = 1 To TotSpecies
      If PopArray(t).Population <> 0 Then
        PopArray(t).Wins = PopArray(t).Wins + 1
      End If
    Next t
  End If
  Contest_Form.Visible = True
  If PopArray(1).SpName <> "" Then
    Contest_Form.Robname1.Caption = PopArray(1).SpName
    Contest_Form.wins1.Caption = Str(PopArray(1).Wins)
    Contest_Form.Pop1.Caption = Str(PopArray(1).Population)
  Else
    Contest_Form.Robname1.Caption = ""
    Contest_Form.wins1.Caption = ""
    Contest_Form.Pop1.Caption = ""
  End If
  If PopArray(2).SpName <> "" Then
    Contest_Form.Robname2.Caption = PopArray(2).SpName
    Contest_Form.Wins2.Caption = Str(PopArray(2).Wins)
    Contest_Form.Pop2.Caption = Str(PopArray(2).Population)
  Else
    Contest_Form.Robname2.Caption = ""
    Contest_Form.Wins2.Caption = ""
    Contest_Form.Pop2.Caption = ""
  End If
  If PopArray(3).SpName <> "" Then
    Contest_Form.Robname3.Caption = PopArray(3).SpName
    Contest_Form.Wins3.Caption = Str(PopArray(3).Wins)
    Contest_Form.Pop3.Caption = Str(PopArray(3).Population)
  Else
    Contest_Form.Robname3.Caption = ""
    Contest_Form.Wins3.Caption = ""
    Contest_Form.Pop3.Caption = ""
  End If
  If PopArray(4).SpName <> "" Then
    Contest_Form.Robname4.Caption = PopArray(4).SpName
    Contest_Form.Wins4.Caption = Str(PopArray(4).Wins)
    Contest_Form.Pop4.Caption = Str(PopArray(4).Population)
  Else
    Contest_Form.Robname4.Caption = ""
    Contest_Form.Wins4.Caption = ""
    Contest_Form.Pop4.Caption = ""
  End If
  If PopArray(5).SpName <> "" Then
    Contest_Form.Robname5.Caption = PopArray(5).SpName
    Contest_Form.Wins5.Caption = Str(PopArray(5).Wins)
    Contest_Form.Pop5.Caption = Str(PopArray(5).Population)
  Else
    Contest_Form.Robname5.Caption = ""
    Contest_Form.Wins5.Caption = ""
    Contest_Form.Pop5.Caption = ""
  End If
  Contest_Form.Refresh
  F1count = 0
  Wins = Sqr(Maxrounds) + (Maxrounds / 2)
  If SpeciesLeft = 1 And Contests + 1 <= Maxrounds Then
    If Contests + 1 = Maxrounds And Over = False Then 'contest is over now
      For t = 1 To TotSpecies
        If PopArray(t).Wins > Wins Then
          Winner = PopArray(t).SpName
          Over = True
          'set up next league round
          If LeagueMode Then
            If Winner + ".txt" = LeagueEntrants(Defender).Name Then
              'attacker lost, move to next challenger
              Attacker = -1
              Defender = 29
              
              LeagueEnd
              
            ElseIf Attacker < 0 Then
              'attacker won.  He was in the challenge array, move him to the
              'league array and the bot he defeated to the challenge array
              'This defeated bot will have another chance to get back into the
              'league later.
              If Winner + ".txt" = LeagueChallengers(-Attacker - 1).Name Then
                Dim temp As datispecie
                temp = LeagueChallengers(-Attacker - 1)
                If LeagueEntrants(Defender).Name <> "EMPTY.TXT" And LeagueEntrants(Defender).Name <> "" Then
                  LeagueChallengers(-Attacker - 1) = LeagueEntrants(Defender)
                  LeagueEntrants(Defender) = temp
                End If
                
                Attacker = Defender
                Defender = Defender - 1
                
              End If
            ElseIf Attacker > 0 Then
              If Winner + ".txt" = LeagueEntrants(Attacker).Name Then
              'attacker won, he was in the league already, swap with defender
                Dim tempa As datispecie
                tempa = LeagueEntrants(Attacker)
                LeagueEntrants(Attacker) = LeagueEntrants(Defender)
                LeagueEntrants(Defender) = tempa
                Attacker = Defender
                Defender = Defender - 1
              End If
            Else
              MsgBox "Unknown Winner.  Poor programmer to blame.", vbOKOnly, "Get a Real Job"
            End If
            
            If Defender = -1 Then
              'that's it, we've hit the top.  Congrats, start the next round
              Attacker = -1
              Defender = 29
              If LeagueChallengers(0).Name = "" Then LeagueEnd
            End If
            Contests = 0
            ReStarts = 0
            ResetContest
            Maxrounds = 5
            LeagueForm.Erase_League_Highlights
            If Form1.Active = True Then SetupLeagueRound
                          
              'update on screen list
            If LeagueForm.F1ChallengeOption.value = True Then
              LeagueForm.F1ChallengeOption_Click
            Else
              LeagueForm.ChallengersOption_Click
            End If
            
            If Form1.Active = True Then   'Form1.StartSimul
              StartAnotherRound = True
            Else
              StartAnotherRound = False
            End If
          End If
          Contest_Form.Refresh
          Exit Sub
        Else
          Winner = "Statistical Draw. Extending contest."
        End If
      Next t
      Contest_Form.Winner.Caption = Winner
      If Winner <> "Statistical Draw. Extending contest." Then
        Contest_Form.Winner1.Caption = "Winner"
      Else
        Maxrounds = Maxrounds + 1
        If MaxRoundsToDraw <> 0 And Maxrounds >= 10 And Maxrounds > MaxRoundsToDraw Then
          Contest_Form.Winner1.Caption = "Win By Draw"
          Winner = "Maximum Rounds Reached."
          Contest_Form.Refresh
          Over = True
          
          'Declare Defender to have won
          Attacker = -1
          Defender = 29
          LeagueEnd
          
          Contests = 0
          ReStarts = 0
          ResetContest
          Maxrounds = 5
          LeagueForm.Erase_League_Highlights
          If Form1.Active = True Then SetupLeagueRound
                          
          'update on screen list
          If LeagueForm.F1ChallengeOption.value = True Then
            LeagueForm.F1ChallengeOption_Click
          Else
            LeagueForm.ChallengersOption_Click
          End If
            
          If Form1.Active = True Then   'Form1.StartSimul
            StartAnotherRound = True
          Else
            StartAnotherRound = False
          End If
          Contest_Form.Refresh
          Exit Sub
        Else
          Contest_Form.Winner1.Caption = "No Winner"
          Over = False
        End If
      End If
    End If
    Contest_Form.Refresh
    If Contests + 1 <= Maxrounds And Over = False Then
      Contests = Contests + 1
      StartAnotherRound = True
     'Form1.StartSimul
    Else
      StartAnotherRound = False
    End If
  End If
End Sub

Public Sub SetupLeague_Options()
  If optionsform.Leaguename.text <> "" And LeagueMode Then
    Dim LeagueError As Integer
    
    F1Mode.Leaguename = optionsform.Leaguename.text
    
    LeagueError = Load_League_File(F1Mode.Leaguename)
    If LeagueError = -1 Then
      If MsgBox("League file does not exist.  Make a new one?", vbYesNo, "League Undetected") = vbNo Then
        Exit Sub
      Else
        'make a new league file and directory.
        'does this automatically when user hits save after
        'league runs.
      End If
    ElseIf LeagueError > 0 Then
      If MsgBox("A robot listed doesn't exist.  Delete from league table?", vbYesNo, "League Robot Not Found") = vbNo Then
        Exit Sub
      Else
        'delete robot leaguerror from league table
      End If
    End If
    LeagueForm.F1ChallengeOption.Caption = optionsform.Leaguename.text + " Challenge League"
    'LeagueForm.Visible = True ' EricL 3/20/2006 Moved this to StartNew_Click in the Options Form
  ElseIf optionsform.Leaguename.text = "" And LeagueMode Then
    MsgBox "No league name.  League must have a name.", vbOKOnly, "League Name Needed"
    Exit Sub
  ElseIf LeagueMode = False Then
    LeagueForm.Visible = False
  End If
  Attacker = -1
  Defender = 29
  
  If Leaguererun = True Then
      Dim Index As Integer
      Dim numLeagueEntrants As Integer
         
      numLeagueEntrants = 0
      For Index = 0 To 29
        If LeagueEntrants(Index).Name <> "" And LeagueEntrants(Index).Name <> "EMPTY" Then
          numLeagueEntrants = numLeagueEntrants + 1
        End If
      Next Index
      
      If numLeagueEntrants <= 1 Then
        MsgBox "Can't rerun league.  Not enough league entrants."
        Leaguererun = False
        optionsform.RerunCheck.value = 0
      Else
        For Index = 0 To 29
          LeagueChallengers(Index) = LeagueEntrants(Index)
          LeagueEntrants(Index).Name = ""
        Next Index
      End If
  End If
  
  SetupLeagueRound
End Sub

Public Sub LeagueInputChallengers()
  Dim Index As Integer
  Dim offset As Integer
  Dim blank As datispecie
    
  For Index = 0 To SimOpts.SpeciesNum - 1
    If SimOpts.Specie(Index).Veg = True Then
      offset = offset + 1
    Else
      LeagueChallengers(Index - offset) = SimOpts.Specie(Index)
      If Index > 2 Then SimOpts.Specie(Index) = blank
      
      LeagueChallengers(Index - offset).Mutables.Mutations = False
    End If
    
    If Index - offset > 29 Then
      MsgBox "Not enough challenger slots to accomodate so many.  Only running the first 30 bots.", vbOKOnly, "Too Many Challengers"
      Exit Sub
    End If
  Next Index
    
End Sub

Public Sub SetupLeagueRound()
  Dim attackerfound As Boolean
  Dim defenderfound As Boolean
  Dim loopdone As Boolean
    
  SimOpts.SpeciesNum = 3
  'SimOpts.Specie(0) = veg spot
  
  While Not loopdone
    DoEvents
    If Attacker < 0 And Not attackerfound Then
      SimOpts.Specie(1) = LeagueChallengers(-Attacker - 1)
    ElseIf Attacker > 0 And Not attackerfound Then
      SimOpts.Specie(1) = LeagueEntrants(Attacker)
    End If
  
    If Not defenderfound Then
      SimOpts.Specie(2) = LeagueEntrants(Defender)
      SimOpts.Specie(2).Posrg = SimOpts.Specie(1).Posrg
      SimOpts.Specie(2).Posdn = SimOpts.Specie(1).Posdn
    End If
  
    'check to see if attacker and defender are the same
    'if so, then prompt the user for action
    
    If SimOpts.Specie(1).Name = "" Then
      SimOpts.Specie(1).Name = "EMPTY.TXT"
      TmpOpts.Specie(1).Name = "EMPTY.TXT"
    End If
    If SimOpts.Specie(2).Name = "" Then
      SimOpts.Specie(2).Name = "EMPTY.TXT"
      TmpOpts.Specie(2).Name = "EMPTY.TXT"
    End If
    
    If Left(SimOpts.Specie(1).Name, Len(SimOpts.Specie(1).Name) - 4) = "EMPTY" Then
      attackerfound = False
      If Attacker < 0 Then
        Attacker = Attacker + 1
        If Attacker = 0 Then Attacker = 29
      Else
        Attacker = Attacker - 1
      End If
    Else
      attackerfound = True
    End If
    
    If Left(SimOpts.Specie(2).Name, Len(SimOpts.Specie(2).Name) - 4) = "EMPTY" Then
      defenderfound = False
      Defender = Defender - 1
      If Defender < 0 Then
        Defender = 0
        defenderfound = True
      End If
    Else
      defenderfound = True
    End If
    
    If attackerfound And defenderfound And SimOpts.Specie(2).Name = SimOpts.Specie(1).Name Then
      If MsgBox("Challenger and Defender are the same bot.  Continue with this Challenger?", vbYesNo, "Identical Bots") = vbYes Then
        'run these two bots against each other.
      Else
        'bot has lost, move on to next challenger
      End If
    End If
    If attackerfound And defenderfound Then loopdone = True
  Wend

  'now check to see if we need to move challenger up slots
  'for an empty league
  If LeagueEntrants(0).Name = "" Or Left(LeagueEntrants(0).Name, 5) = "EMPTY" Then
    'empty league file
    LeagueEntrants(0) = LeagueChallengers(-Attacker - 1)
    LeagueEnd
    SetupLeagueRound
  ElseIf Defender <> 29 And Attacker < 0 Then
    LeagueEntrants(Defender + 1) = LeagueChallengers(-Attacker - 1)
    LeagueChallengers(-Attacker - 1).Name = ""
    Attacker = Defender + 1
    'empty league
  End If

 ' If SimOpts.Specie(1).color = vbBlue And SimOpts.Specie(2).color = vbBlue Then
    SimOpts.Specie(0).color = vbGreen
    TmpOpts.Specie(0).color = vbGreen
    SimOpts.Specie(1).color = vbRed
    TmpOpts.Specie(1).color = vbRed
    SimOpts.Specie(2).color = vbBlue
    TmpOpts.Specie(2).color = vbBlue
 ' End If
End Sub

Public Function League_Eyefudge(robotnumber As Integer, t As Long)
'tests to see if two bots have the same number of refeye statements.
'if so, it adds the following gene at teh end of the DNA
'This is definately a fudge, both in practice and implementation.
'A better system will be needed if anything is done to break this
'(such as a bot not using refeyes for conspec identification)
'or bots that are so close that this gives a virus bot an undue edge
'Later: add a prompt for action and a small timer.  If timer runs out then
'we use the default action below

  If eye11 = rob(robotnumber).occurr(8) Then
  'If SimOpts.TotRunCycle < 3 And eye11 = rob(robotnumber).occurr(8) Then
  ReDim Preserve rob(robotnumber).DNA(UBound(rob(robotnumber).DNA) + 6)
    
    'cond
    rob(robotnumber).DNA(t).tipo = 4
    rob(robotnumber).DNA(t).value = 1
    t = t + 1
    
    '*.eye5
    rob(robotnumber).DNA(t).tipo = 1
    rob(robotnumber).DNA(t).value = 505
    t = t + 1
    
    'dup
    rob(robotnumber).DNA(t).tipo = 2
    rob(robotnumber).DNA(t).value = 23
    t = t + 1
    
    '!=
    rob(robotnumber).DNA(t).tipo = 3
    rob(robotnumber).DNA(t).value = 4
    t = t + 1
    
    'start
    rob(robotnumber).DNA(t).tipo = 4
    rob(robotnumber).DNA(t).value = 2
    t = t + 1
    
    'stop
    rob(robotnumber).DNA(t).tipo = 4
    rob(robotnumber).DNA(t).value = 3
    t = t + 1
    
    'end
    rob(robotnumber).DNA(t).tipo = 10       ' EricL - Changed tipo from 4 to 10, March 15, 2006
    rob(robotnumber).DNA(t).value = 1       ' EricL - Changed value from 4 to 1, March 15, 2006
  
    rob(robotnumber).occurr(8) = rob(robotnumber).occurr(8) + 1
  End If
End Function

Public Sub Record_11eyes(eyes As Integer)
  eye11 = eyes
End Sub

Private Sub LeagueEnd()
  Dim i As Integer
  
  If LeagueChallengers(-Attacker).Name = "EMPTY" Or LeagueChallengers(-Attacker).Name = "" Then
    LeagueMode = False
    ContestMode = False
 '   SimOpts.F1 = False
    
    'pause simulation.
    Form1.Active = False
    Form1.SecTimer.Enabled = False
    
    If MsgBox("The league has finished running.  Simulation paused.  Save league file?", vbYesNo, "League Finished.") = vbYes Then
      'save results into file
      Save_League_File Leaguename
    End If
    LeagueForm.Hide
    Contest_Form.Hide
  
  Else
    Dim Index As Integer
    
    For Index = 0 To 29
      LeagueChallengers(Index) = LeagueChallengers(Index + 1)
    Next Index
    
    LeagueChallengers(29).Name = ""
  End If
   
  Attacker = -1
  Defender = 29
    
  'Puts things back the way they were before the league began so that the species list looks okay.
  TmpOpts = SimOpts

  
  'Let the sim play again so that it's not paused for the user
 ' Form1.Active = True
 ' Form1.SecTimer.Enabled = True
End Sub

Private Sub stuff()

'move up all challengers
    Dim Index As Integer
    For Index = 1 To 29
      LeagueChallengers(Index - 1) = LeagueChallengers(Index)
    Next Index
    
    Dim empty0 As datispecie
    LeagueChallengers(29) = empty0
End Sub
