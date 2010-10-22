Attribute VB_Name = "Master"
Option Explicit
Public DynamicCountdown As Integer ' Used to countdown the cycles until we modify the dynamic costs
Public CostsWereZeroed As Boolean ' Flag used to indicate to the reinstatement threshodl that the costs were zeroed
Public PopulationLast10Cycles(10) As Integer


Public Sub UpdateSim()
  Dim AmountOff As Single
  Dim UpperRange As Single
  Dim LowerRange As Single
  Dim CorrectionAmount As Single
  Dim CurrentPopulation As Integer
  Dim i As Integer

  
  SimOpts.TotRunCycle = SimOpts.TotRunCycle + 1
  Form1.MutCyc = Form1.MutCyc + 1

  TotalSimEnergyDisplayed = TotalSimEnergy(CurrentEnergyCycle)
  CurrentEnergyCycle = SimOpts.TotRunCycle Mod 100
  TotalSimEnergy(CurrentEnergyCycle) = 0
  
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
  
  ExecRobs
  If datirob.Visible And datirob.ShowMemoryEarlyCycle Then
    With rob(robfocus)
      datirob.infoupdate robfocus, .nrg, .parent, .Mutations, .age, .SonNumber, 1, .FName, .genenum, .LastMut, .generation, .DnaLen, .LastOwner, .Waste, .body, .mass, .venom, .shell, .Slime, .Chlr
    End With
  End If
  
  updateshots
  UpdateBots
  
  If numObstacles > 0 Then MoveObstacles
  If numTeleporters > 0 Then UpdateTeleporters
   
  'If SimOpts.TotRunCycle Mod 200 = 0 And SimOpts.KillDistVegs Then KillDistVegs RobSize * 30
  feedvegs SimOpts.MaxEnergy
  
  If SimOpts.EnableAutoSpeciation Then
    'If SimOpts.TotRunCycle Mod SimOpts.SpeciationForkInterval = 0 Then ForkSpecies SimOpts.SpeciationGeneticDistance, SimOpts.SpeciationGenerationalDistance, SimOpts.SpeciationMinimumPopulation
    
  End If
     
End Sub
