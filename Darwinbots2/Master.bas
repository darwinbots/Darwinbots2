Attribute VB_Name = "Master"
Option Explicit
Public DynamicCountdown As Integer ' Used to countdown the cycles until we modify the dynamic costs
Public CostsWereZeroed As Boolean ' Flag used to indicate to the reinstatement threshodl that the costs were zeroed
Public PopulationLast10Cycles(10) As Integer
Public Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer 'Botsareus 12/11/2012 Pause Break Key to Pause code
'

Public energydif As Double 'Total last hide pred
Public energydifX As Double 'Avg last hide pred
Public energydifXP As Double 'The actual handycap

Public energydif2 As Double 'Total last hide pred
Public energydifX2 As Double 'Avg last hide pred
Public energydifXP2 As Double 'The actual handycap

Public Sub UpdateSim()

  'core evo
  Dim avrnrgStart As Double
  Dim avrnrgEnd As Double

  Dim AmountOff As Single
  Dim UpperRange As Single
  Dim LowerRange As Single
  Dim CorrectionAmount As Single
  Dim CurrentPopulation As Integer
  Dim AllChlr As Long 'Panda 8/13/2013 The new way to figure out total number vegys
  Dim i As Integer
  Dim t As Integer
  
  Dim Base_count As Integer
  Dim Mutate_count As Integer

  'Botsareus 12/11/2012 Pause Break Key to Pause code
  If GetAsyncKeyState(vbKeyF12) Then
      DisplayActivations = False
      Form1.Active = False
      Form1.SecTimer.Enabled = False
      MDIForm1.unpause.Enabled = True
  End If
  
  ModeChangeCycles = ModeChangeCycles + 1
  SimOpts.TotRunCycle = SimOpts.TotRunCycle + 1
  
  'Botsareus 3/22/2014 Main hidepred logic (hide pred means hide base robot a.k.a. Predator)
  Dim usehidepred As Boolean
  usehidepred = x_restartmode = 4 Or x_restartmode = 5 'Botsareus expend to evo mode
  '
  Dim avgsize As Long
  Dim k As Integer 'robots moved last attempt
  Dim k2 As Integer 'robots moved total
  '
  If usehidepred Then
    'Count species for end of evo
    Base_count = 0
    Mutate_count = 0
    avgsize = 0
    For t = 1 To MaxRobs
      If rob(t).exist Then
          If rob(t).FName = "Base.txt" Then
            Base_count = Base_count + 1
            avgsize = avgsize + rob(t).body
          End If
          If rob(t).FName = "Mutate.txt" Then Mutate_count = Mutate_count + 1
      End If
    Next t
    'See if end of evo
    If Base_count = 0 Then UpdateWonEvo Form1.fittest
    If Mutate_count = 0 Then UpdateLostEvo
     If Base_count = 0 Or Mutate_count = 0 Then 'Botsareus 3/22/2014 Bug fix
          DisplayActivations = False
          Form1.Active = False
          Form1.SecTimer.Enabled = False
     End If
    If ModeChangeCycles > (hidePredCycl / 1.2 + hidePredOffset) Then
      'calculate new energy handycap
      energydif2 = energydif2 + energydif / ModeChangeCycles 'inverse handycap
      If hidepred Then
        Dim holdXP As Double
        holdXP = (energydifX - (energydif / ModeChangeCycles)) / (LFOR / 3)
        If holdXP < energydifXP Then energydifXP = holdXP Else energydifXP = (energydifXP * 9 + holdXP) / 10
        
        'inverse handycap
        energydifXP2 = (energydifX2 - energydif2) / (LFOR / 3)
        If energydifXP2 > 0 Then energydifXP2 = 0
        If (energydifXP - energydifXP2) > 0.1 Then energydifXP2 = energydifXP - 0.1
        energydifX2 = energydif2
        energydif2 = 0
      End If
      energydifX = energydif / ModeChangeCycles
      energydif = 0
      If hidepred And Mutate_count > Base_count Then 'only if there is more mutate robots
        'lets reposition the robots
        avgsize = avgsize / Base_count
        k2 = 0
        Do
        k = 0
        For t = 1 To MaxRobs
             If rob(t).exist And rob(t).FName = "Base.txt" Then
                  For i = 1 To MaxRobs
                      If rob(i).exist And rob(i).FName = "Mutate.txt" Then
                        If ((rob(i).pos.X - rob(t).pos.X) ^ 2 + (rob(i).pos.Y - rob(t).pos.Y) ^ 2) ^ 0.5 < avgsize Then
                        'if the distance between the robots is less then avgsize then move mutate robot out of the way
                            With rob(i)
                                'tie mod
                                Dim pozdif As vector
                                pozdif.X = 9237 * Rnd - .pos.X
                                pozdif.Y = 6928 * Rnd - .pos.Y
                                If .numties > 0 Then
                                    Dim clist(50) As Integer, tk As Integer
                                    clist(0) = i
                                    ListCells clist()
                                    'move multibot
                                    tk = 1
                                    While clist(tk) > 0
                                        rob(clist(tk)).pos.X = rob(clist(tk)).pos.X + pozdif.X
                                        rob(clist(tk)).pos.Y = rob(clist(tk)).pos.Y + pozdif.Y
                                        tk = tk + 1
                                    Wend
                                End If
                                .pos.X = .pos.X + pozdif.X
                                .pos.Y = .pos.Y + pozdif.Y
                            End With
                            k = k + 1
                            k2 = k2 + 1
                        End If
                      End If
                  Next
             End If
        Next t
        Loop Until k = 0 Or k2 > 7000
      End If
      'change hide pred
      hidepred = Not hidepred
      hidePredOffset = hidePredCycl / 3 * Rnd
      ModeChangeCycles = 0
    End If
  End If
  
  'provides the mutation rates oscillation Botsareus 8/3/2013 moved to UpdateSim)
  If SimOpts.MutOscill Then
   With SimOpts
    'Botsareus 8/3/2013 a more frindly mut oscill
    Dim fullrange As Long
    fullrange = .TotRunCycle Mod (.MutCycMax + .MutCycMin)
    If fullrange < .MutCycMax Then
     .MutCurrMult = 20 ^ Sin(fullrange / .MutCycMax * PI)
    Else
     .MutCurrMult = 20 ^ -Sin((fullrange - .MutCycMax) / .MutCycMin * PI)
    End If
   End With
  End If
  

  TotalSimEnergyDisplayed = TotalSimEnergy(CurrentEnergyCycle)
  CurrentEnergyCycle = SimOpts.TotRunCycle Mod 100
  TotalSimEnergy(CurrentEnergyCycle) = 0
  
  CurrentPopulation = totnvegsDisplayed
  If SimOpts.Costs(DYNAMICCOSTINCLUDEPLANTS) <> 0 Then
    CurrentPopulation = CurrentPopulation + totvegsDisplayed      'Include Plants in target population
  End If
  
  'If (SimOpts.TotRunCycle + 200) Mod 2000 = 0 Then MsgBox "sup" & SimOpts.TotRunCycle 'debug only
  
  If SimOpts.TotRunCycle Mod 10 = 0 Then
    For i = 10 To 2 Step -1
      PopulationLast10Cycles(i) = PopulationLast10Cycles(i - 1)
    Next i
    PopulationLast10Cycles(1) = CurrentPopulation
  End If
    
  If SimOpts.Costs(USEDYNAMICCOSTS) Then
    AmountOff = CurrentPopulation - SimOpts.Costs(DYNAMICCOSTTARGET)
         
    'If we are more than X% off of our target population either way AND the population isn't moving in the
    'the direction we want or hasn't moved at all in the past 10 cycles then adjust the cost multiplier
    UpperRange = TmpOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) * 0.01 * SimOpts.Costs(DYNAMICCOSTTARGET)
    LowerRange = TmpOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) * 0.01 * SimOpts.Costs(DYNAMICCOSTTARGET)
    If (CurrentPopulation = PopulationLast10Cycles(10)) Then
      DynamicCountdown = DynamicCountdown - 1
      If DynamicCountdown < -10 Then DynamicCountdown = -10
    Else
      DynamicCountdown = 10
    End If
    
    If (AmountOff > UpperRange And (PopulationLast10Cycles(10) < CurrentPopulation Or DynamicCountdown <= 0)) Or _
       (AmountOff < -LowerRange And (PopulationLast10Cycles(10) > CurrentPopulation Or DynamicCountdown <= 0)) Then
       
       If AmountOff > UpperRange Then
         CorrectionAmount = AmountOff - UpperRange
       Else
         CorrectionAmount = Abs(AmountOff) - LowerRange
       End If
       
      'Adjust the multiplier. The idea is to rachet this over time as bots evolve to be more effecient.
      'We don't muck with it if the bots are within X% of the target.  If they are outside the target, then
      'we adjust only if the populatiuon isn't heading towards the range and then we do it my an amount that is a function
      'of how far out of the range we are (not how far from the target itself) and the sensitivity set in the sim
      SimOpts.Costs(COSTMULTIPLIER) = SimOpts.Costs(COSTMULTIPLIER) + (0.0000001 * CorrectionAmount * Sgn(AmountOff) * SimOpts.Costs(DYNAMICCOSTSENSITIVITY))
      
      'Don't let the costs go negative if the user doesn't want them to
      If (SimOpts.Costs(ALLOWNEGATIVECOSTX) <> 1) Then
        If SimOpts.Costs(COSTMULTIPLIER) < 0 Then SimOpts.Costs(COSTMULTIPLIER) = 0
      End If
      DynamicCountdown = 10 ' Reset the countdown timer
    End If
 ' Else
 '   SimOpts.Costs(COSTMULTIPLIER) = 1
  End If
  
  If (CurrentPopulation < SimOpts.Costs(BOTNOCOSTLEVEL)) And (SimOpts.Costs(COSTMULTIPLIER) <> 0) Then
    CostsWereZeroed = True
    SimOpts.oldCostX = SimOpts.Costs(COSTMULTIPLIER)
    SimOpts.Costs(COSTMULTIPLIER) = 0 ' The population has fallen below the threshold to 0 all costs
  ElseIf (CurrentPopulation > SimOpts.Costs(COSTXREINSTATEMENTLEVEL)) And CostsWereZeroed Then
    CostsWereZeroed = False ' Set the flag so we don't do this again unless they get zeored again
    SimOpts.Costs(COSTMULTIPLIER) = SimOpts.oldCostX
  End If
  
  'Store new energy handycap
    For t = 1 To MaxRobs
     If rob(t).exist Then
         If rob(t).FName = "Mutate.txt" And hidepred Then
            If rob(t).LastMut > 0 Then '4/17/2014 New rule from Botsareus, only handycap fresh robots
             'we only handycap one value type per run as robots can select body or energy at startup to trick the system
             If x_filenumber Mod 2 = 1 Then rob(t).nrg = rob(t).nrg + (energydifXP - energydifXP2) * IIf(SimOpts.TotRunCycle < (CLng(hidePredCycl) * CLng(8)), SimOpts.TotRunCycle / (CLng(hidePredCycl) * CLng(8)), 1)
             If x_filenumber Mod 2 = 0 Then rob(t).body = rob(t).body + (energydifXP - energydifXP2) * IIf(SimOpts.TotRunCycle < (CLng(hidePredCycl) * CLng(8)), SimOpts.TotRunCycle / (CLng(hidePredCycl) * CLng(8)), 1)
            Else
             'we only handycap one value type per run as robots can select body or energy at startup to trick the system
             If x_filenumber Mod 2 = 1 Then rob(t).nrg = rob(t).nrg + (energydifXP - energydifXP2) * IIf(SimOpts.TotRunCycle < (CLng(hidePredCycl) * CLng(8)), SimOpts.TotRunCycle / (CLng(hidePredCycl) * CLng(8)), 1) / 2
             If x_filenumber Mod 2 = 0 Then rob(t).body = rob(t).body + (energydifXP - energydifXP2) * IIf(SimOpts.TotRunCycle < (CLng(hidePredCycl) * CLng(8)), SimOpts.TotRunCycle / (CLng(hidePredCycl) * CLng(8)), 1) / 2
            End If
         End If
     End If
    Next t
  
  If usehidepred Then
  'Calculate average energy before sim update
  avrnrgStart = 0
  i = 0
  For t = 1 To MaxRobs
        If rob(t).FName = "Mutate.txt" And rob(t).exist Then
            If rob(t).LastMut > 0 Then '4/17/2014 New rule from Botsareus, only handycap fresh robots
                i = i + 1
                avrnrgStart = avrnrgStart + IIf(x_filenumber Mod 2 = 1, rob(t).nrg, rob(t).body)
            End If
        End If
  Next t
   If i > 0 Then
    avrnrgStart = avrnrgStart / i
   End If
  End If
  
  ExecRobs
  If datirob.Visible And datirob.ShowMemoryEarlyCycle Then
    With rob(robfocus)
      datirob.infoupdate robfocus, .nrg, .parent, .Mutations, .age, .SonNumber, 1, .FName, .genenum, .LastMut, .generation, .DnaLen, .LastOwner, .Waste, .body, .mass, .venom, .shell, .Slime, .chloroplasts
    End With
  End If
  
  'updateshots can write to bot sense, so we need to clear bot senses before updating shots
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If (rob(t).DisableDNA = False) Then EraseSenses t
    End If
  Next t
  
  'it is time for some overwrites by playerbot mode
   For t = 1 To MaxRobs
    With rob(t)
     If .exist Then
      If t = robfocus Or .highlight Then
       If Not (Mouse_loc.X = 0 And Mouse_loc.Y = 0) Then .mem(SetAim) = angnorm(angle(.pos.X, .pos.Y, Mouse_loc.X, Mouse_loc.Y)) * 200
       For i = 1 To UBound(PB_keys)
        If PB_keys(i).Active <> PB_keys(i).Invert Then .mem(PB_keys(i).memloc) = PB_keys(i).value
       Next
      End If
     End If
    End With
   Next t
  
  'okay, time to store some values for RGB monitor
  If MDIForm1.MonitorOn Then
    For t = 1 To MaxRobs
      If rob(t).exist Then
       With frmMonitorSet
        rob(t).monitor_r = rob(t).mem(.Monitor_mem_r)
        rob(t).monitor_g = rob(t).mem(.Monitor_mem_g)
        rob(t).monitor_b = rob(t).mem(.Monitor_mem_b)
       End With
      End If
    Next t
  End If
  
  updateshots
  UpdateBots
  
  If numObstacles > 0 Then MoveObstacles
  If numTeleporters > 0 Then UpdateTeleporters
   
  For t = 1 To MaxRobs 'Panda 8/14/2013 to figure out how much vegys to repopulate across all robots
   If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then 'Botsareus 8/14/2013 We have to make sure the robot is alive first
    AllChlr = AllChlr + rob(t).chloroplasts
   End If
  Next t
  
  TotalChlr = AllChlr / 16000 'Panda 8/23/2013 Calculate total unit chloroplasts
  
  If TotalChlr < CLng(SimOpts.MinVegs) Then   'Panda 8/23/2013 Only repopulate vegs when total chlroplasts below value
    If totvegsDisplayed <> -1 Then VegsRepopulate  'Will be -1 first cycle after loading a sim.  Prevents spikes.
  End If
  
  feedvegs SimOpts.MaxEnergy
  
  If usehidepred Then
  'Calculate average energy after sim update
  avrnrgEnd = 0
  i = 0
  For t = 1 To MaxRobs
        If rob(t).FName = "Mutate.txt" And rob(t).exist Then
            If rob(t).LastMut > 0 Then '4/17/2014 New rule from Botsareus, only handycap fresh robots
                i = i + 1
                avrnrgEnd = avrnrgEnd + IIf(x_filenumber Mod 2 = 1, rob(t).nrg, rob(t).body)
            End If
        End If
  Next t
   If i > 0 Then
    avrnrgEnd = avrnrgEnd / i
    energydif = energydif - avrnrgStart + avrnrgEnd
   End If
  End If
  
  'Kill some robots to prevent out of memory
  Dim totlen As Long
  totlen = 0
  For t = 1 To MaxRobs
    If rob(t).exist Then totlen = totlen + rob(t).DnaLen
  Next t
  If totlen > 3825000 Then
    Dim calcminenergy As Single
    Dim selectrobot As Integer
    Dim maxdel As Long
    
    maxdel = 1500 * (CLng(TotalRobotsDisplayed) * 425 / totlen)
    
    For i = 0 To maxdel
        calcminenergy = 320000 'only erase robots with lowest energy
        For t = 1 To MaxRobs
            If rob(t).exist Then
                If (rob(t).nrg + rob(t).body * 10) < calcminenergy Then
                    calcminenergy = (rob(t).nrg + rob(t).body * 10)
                    selectrobot = t
                End If
            End If
        Next t
        Call KillRobot(selectrobot)
    Next i
  End If
  
  'Botsareus 5/6/2013 The safemode system
  If UseSafeMode Then 'special modes does not apply, may need to expended to other restart modes
    If SimOpts.TotRunCycle Mod 2000 = 0 And SimOpts.TotRunCycle > 0 Then
      If x_restartmode = 0 Or x_restartmode = 4 Or x_restartmode = 6 Or x_restartmode = 7 Or x_restartmode = 8 Then
        SaveSimulation MDIForm1.MainDir + "\saves\lastautosave.sim"
        'Botsareus 5/13/2013 delete local copy
        If dir(MDIForm1.MainDir + "\saves\localcopy.sim") <> "" Then Kill (MDIForm1.MainDir + "\saves\localcopy.sim")
        Open App.path & "\autosaved.gset" For Output As #1
         Write #1, True
        Close #1
      End If
    End If
  End If
  
  'R E S T A R T  N E X T
  'Botsareus 1/31/2014 seeding
  If x_restartmode = 1 Then
    If SimOpts.TotRunCycle = 2000 Then
        FileCopy MDIForm1.MainDir & "\league\Test.txt", NamefileRecursive(MDIForm1.MainDir & "\league\seeded\" & totnvegsDisplayed & ".txt")
        Open App.path & "\restartmode.gset" For Output As #1
         Write #1, x_restartmode
         Write #1, x_filenumber
        Close #1
        Open App.path & "\Safemode.gset" For Output As #1
         Write #1, False
        Close #1
        shell App.path & "\Restarter.exe " & App.path & "\" & App.EXEName
    End If
  End If
  
 
  'Z E R O B O T
'evo mode
If x_restartmode = 7 Or x_restartmode = 8 Then
  If SimOpts.TotRunCycle Mod 50 = 0 And SimOpts.TotRunCycle > 0 Then
      Form1.fittest
  End If
  Base_count = 0
  Mutate_count = 0
  Dim spppos As Integer
  Static reduce As Byte
  'count robots for repop
  For t = 1 To MaxRobs
      If rob(t).exist Then
          If rob(t).FName = "Base.txt" Then Base_count = Base_count + 1
          If rob(t).FName = "Mutate.txt" Then Mutate_count = Mutate_count + 1
      End If
  Next t
  If Base_count < Sqr(CDbl(TmpOpts.FieldHeight) * CDbl(TmpOpts.FieldWidth)) / 160 / (1 + reduce / 5) Then
    'figure out specie pos
    For spppos = 0 To UBound(TmpOpts.Specie)
        If TmpOpts.Specie(spppos).Name = "Base.txt" Then Exit For
    Next
    If spppos < 78 Then 'make sure specie is still alive
    For Base_count = 0 To Sqr(CDbl(TmpOpts.FieldHeight) * CDbl(TmpOpts.FieldWidth)) / 160 / (1 + reduce / 5)
     aggiungirob spppos, Random(60, SimOpts.FieldWidth - 60), Random(60, SimOpts.FieldHeight - 60)
    Next
    reduce = reduce + 1
    logevo "Repopulation attempt " & reduce & " base robot", x_filenumber
    End If
  End If
  If Mutate_count < Sqr(CDbl(TmpOpts.FieldHeight) * CDbl(TmpOpts.FieldWidth)) / 160 / (1 + reduce / 5) Then
    'figure out specie pos
    For spppos = 0 To UBound(TmpOpts.Specie)
        If TmpOpts.Specie(spppos).Name = "Mutate.txt" Then Exit For
    Next
    If spppos < 78 Then 'make sure specie is still alive
    For Mutate_count = 0 To Sqr(CDbl(TmpOpts.FieldHeight) * CDbl(TmpOpts.FieldWidth)) / 160 / (1 + reduce / 5)
     aggiungirob spppos, Random(60, SimOpts.FieldWidth - 60), Random(60, SimOpts.FieldHeight - 60)
    Next
    reduce = reduce + 1
    logevo "Repopulation attempt " & reduce & " mutate robot", x_filenumber
    End If
  End If
  If reduce = 50 Then
    'at some point it has to stop
    'Restart
        Dim dbnnxtmut As Integer
        Dim dbnnxtbase As Integer
        '
        Do
            dbnnxtmut = Int(x_filenumber - 15 + Rnd * 16)
        Loop Until dbnnxtmut >= 0 And dbnnxtmut <= x_filenumber
        '
        Do
            dbnnxtbase = Int(x_filenumber - 15 + Rnd * 16)
        Loop Until dbnnxtbase >= 0 And dbnnxtbase <= x_filenumber
        '
        logevo "A restart is needed. New Base: " & dbnnxtbase & " New Mutate: " & dbnnxtmut
        FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbnnxtbase & ".txt", MDIForm1.MainDir & "\evolution\Base.txt"
        FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbnnxtmut & ".txt", MDIForm1.MainDir & "\evolution\Mutate.txt"
        If dbnnxtmut = 0 Then
            If dir(MDIForm1.MainDir & "\evolution\Mutate.mrate") <> "" Then Kill MDIForm1.MainDir & "\evolution\Mutate.mrate"
        Else
            FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbnnxtmut & ".mrate", MDIForm1.MainDir & "\evolution\Mutate.mrate"
        End If
        '
    DisplayActivations = False
    Form1.Active = False
    Form1.SecTimer.Enabled = False
    '
    Open App.path & "\Safemode.gset" For Output As #1
     Write #1, False
    Close #1
    Open App.path & "\autosaved.gset" For Output As #1
     Write #1, False
    Close #1
    shell App.path & "\Restarter.exe " & App.path & "\" & App.EXEName
  End If
End If

Static totnrgnvegs As Double
Dim cmptotnrgnvegs As Double

'test mode
If x_restartmode = 9 Then
  If SimOpts.TotRunCycle = 1 Then 'record starting energy
    For t = 1 To MaxRobs
        If rob(t).exist Then
            If rob(t).FName = "Test.txt" Then totnrgnvegs = totnrgnvegs + rob(t).nrg + rob(t).body * 10
        End If
    Next t
  End If
  If SimOpts.TotRunCycle = 2000 Then 'ending energy must be more
    For t = 1 To MaxRobs
        If rob(t).exist Then
            If rob(t).FName = "Test.txt" Then cmptotnrgnvegs = cmptotnrgnvegs + rob(t).nrg + rob(t).body * 10
        End If
    Next t
    If totnvegsDisplayed > 10 And cmptotnrgnvegs > totnrgnvegs * 2 Then 'did population and energy x2?
        ZBpassedtest
    Else
        ZBfailedtest
    End If
  End If
End If
End Sub
