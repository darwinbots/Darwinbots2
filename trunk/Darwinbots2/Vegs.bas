Attribute VB_Name = "Vegs"
Option Explicit

'
'  V E G E T A B L E S   M A N A G E M E N T
'

Public totvegs As Integer           ' total vegs in sim
Public totvegsDisplayed As Integer  ' Value to display so as to not get a half-updated value
Public cooldown As Long

Public TotalSimEnergy(100) As Long ' Any array of the total amount of sim energy over the past 100 cycles.
Public CurrentEnergyCycle As Integer ' Index into he above array for calculating this cycle's sim energy.
Public TotalSimEnergyDisplayed As Long
Public PopulationLastCycle As Integer

Public LightAval As Double 'Botsareus 8/14/2013 amount of avaialble light

' adds vegetables in random positions
Public Sub VegsRepopulate()
  Dim n As node
  Dim r As Integer
  Dim Rx As Long
  Dim Ry As Long
  Dim t As Integer
  cooldown = cooldown + 1
  If cooldown >= SimOpts.RepopCooldown Then
    For t = 1 To SimOpts.RepopAmount
      'If Form1.Active Then 'Botsareus 3/20/2013 Bug fix to load vegs when cycle button pressed
        aggiungirob -1, Random(60, SimOpts.FieldWidth - 60), Random(60, SimOpts.FieldHeight - 60)
        totvegs = totvegs + 1
      'End If
    Next t
    cooldown = cooldown - SimOpts.RepopCooldown
  End If
End Sub

' gives vegs their energy meal
Public Sub feedvegs(totnrg As Long) 'Panda 8/23/2013 Removed totv as it is no longer needed
  Dim n As node
  Dim t As Integer
  Dim tok As Single
  Dim depth As Long
  Dim daymod As Single
  Dim Energy As Single
  Dim body As Single
  Dim FeedThisCycle As Boolean
  Dim OverrideDayNight As Boolean
  
  Dim ScreenArea As Double
  Dim TotalRobotArea As Single
  Dim AreaCorrection As Single
  Dim ChloroplastCorrection As Single
  Dim AddEnergyRate As Single
  Dim SubtractEnergyRate As Single
  Dim acttok As Single
    
  Const Constant As Single = 0.00000005859375
  Dim temp As Single
  
  FeedThisCycle = SimOpts.Daytime 'Default is to feed if it is daytime, not feed if night
  OverrideDayNight = False
  
  If TotalSimEnergyDisplayed < SimOpts.SunUpThreshold And SimOpts.SunUp Then
    'Sim Energy has fallen below the threshold.  Let the sun shine!
    Select Case SimOpts.SunThresholdMode
      Case TEMPSUNSUSPEND:
        ' We only suspend the sun cycles for this cycle.  We want to feed this cycle, but not
        ' advance the sun or disable day/night cycles
        FeedThisCycle = True
        OverrideDayNight = True
      Case ADVANCESUN:
        'Speed up time until Dawn.  No need to override the day night cycles as we want them to take over.
        'Note that the real dawn won't actually start until the nrg climbs above the threshold since
        'we will keep coming in here and zeroing the counter, but that's probably okay.
        SimOpts.DayNightCycleCounter = 0
        SimOpts.Daytime = True
        FeedThisCycle = True
      Case PERMSUNSUSPEND:
        'We don't care about cycles.  We are just bouncing back and forth between the thresholds.
        'We want to feed this cycle.
        'We also want to turn on the sun.  The test below should avoid trying to execute day/night cycles.
        FeedThisCycle = True
        SimOpts.Daytime = True
    End Select
  ElseIf TotalSimEnergyDisplayed > SimOpts.SunDownThreshold And SimOpts.SunDown Then
    Select Case SimOpts.SunThresholdMode
      Case TEMPSUNSUSPEND:
        ' We only suspend the sun cycles for this cycle.  We do not want to feed this cycle, nor do we
        ' advance the sun or disable day/night cycles
        FeedThisCycle = False
        OverrideDayNight = True
      Case ADVANCESUN:
        'Speed up time until Dusk.  No need to override the day night cycles as we want them to take over.
        'Note that the real night time won't actually start until the nrg falls below the threshold since
        'we will keep coming in here and zeroing the counter, but that's probably okay.
        SimOpts.DayNightCycleCounter = 0
        SimOpts.Daytime = False
        FeedThisCycle = False
      Case PERMSUNSUSPEND:
        'We don't care about cycles.  We are just bouncing back and forth between the thresholds.
        'We do not want to feed this cycle.
        'We also want to turn off the sun.  The test below should avoid trying to execute day/night cycles
        FeedThisCycle = False
        SimOpts.Daytime = False
    End Select
  End If
  
  'In this mode, we ignore sun cycles and just bounce between thresholds.  I don't really want to add another
  'feature enable checkbox, so we will just test to make sure the user is using both thresholds.  If not, we
  'don't override the cycles even if one of the thresholds is set.
  If SimOpts.SunThresholdMode = PERMSUNSUSPEND And SimOpts.SunDown And SimOpts.SunUp Then OverrideDayNight = True
  
  If SimOpts.DayNight And Not OverrideDayNight Then
      'Well, we are neither above nor below the thresholds or we arn't using thresholds so lets see if it's time to rise and shine
      SimOpts.DayNightCycleCounter = SimOpts.DayNightCycleCounter + 1
      If SimOpts.DayNightCycleCounter > SimOpts.CycleLength Then
        SimOpts.Daytime = Not SimOpts.Daytime
        SimOpts.DayNightCycleCounter = 0
      End If
      If SimOpts.Daytime Then
        FeedThisCycle = True
      Else
        FeedThisCycle = False
      End If
  End If
  
  If FeedThisCycle Then
'    MDIForm1.daypic.Visible = True
 '   MDIForm1.nightpic.Visible = False
    MDIForm1.SunButton.value = 0
  Else
 '   MDIForm1.daypic.Visible = False
'    MDIForm1.nightpic.Visible = True
    MDIForm1.SunButton.value = 1
  End If
   
  If Not FeedThisCycle Then GoTo getout
   
  If SimOpts.Daytime Then daymod = 1 Else daymod = 0
  
  ScreenArea = ((CDbl(SimOptModule.SimOpts.FieldWidth) * CDbl(SimOptModule.SimOpts.FieldHeight)) ^ 0.92) * 2.05   'Panda 8/14/2013 Figure out screen area 'Botsareus 8/24/2013 Area corrected to have less effect in larger simulations
  
  For t = 1 To MaxRobs 'Panda 8/14/2013 Figure out total robot area
    If rob(t).exist Then 'Botsareus 8/14/2013 We have to make sure the robot is alive first
        TotalRobotArea = TotalRobotArea + rob(t).radius ^ 2 * PI
    End If
  Next t
  
  LightAval = TotalRobotArea / ScreenArea 'Panda 8/14/2013 Figure out AreaInverted a.k.a. available light
  If LightAval > 1 Then LightAval = 1 'Botsareus make sure LighAval never goes negative
  
  AreaCorrection = (1 - LightAval) ^ 2 * 4
 
  For t = 1 To MaxRobs
    If rob(t).nrg > 0 And rob(t).exist Then
    
      If SimOpts.Pondmode Then
        depth = (rob(t).pos.Y / 2000) + 1
        If depth < 1 Then depth = 1
        tok = (SimOpts.LightIntensity / depth ^ SimOpts.Gradient) * daymod 'Botsareus 3/26/2013 No longer add one, robots get fed more accuratly
      Else
        tok = totnrg
      End If
      
      If tok < 0 Then tok = 0
      
      'Panda 8/14/2013 New chloroplast codez
      ChloroplastCorrection = rob(t).chloroplasts / 16000
      AddEnergyRate = AreaCorrection * ChloroplastCorrection * tok * 1.25
      SubtractEnergyRate = (rob(t).chloroplasts / 32000) ^ 2 * tok
      
      acttok = AddEnergyRate - SubtractEnergyRate
      
      Select Case SimOpts.VegFeedingMethod
      Case 0 'per veg
        Energy = acttok * (1 - SimOpts.VegFeedingToBody)
        body = (acttok * SimOpts.VegFeedingToBody) / 10
      Case 1 'per kilobody
        Energy = acttok * (1 - SimOpts.VegFeedingToBody) * rob(t).body / 1000
        body = (acttok * (SimOpts.VegFeedingToBody) * rob(t).body / 1000) / 10
      Case 2 'quadratically based on body.  Close to type 0 near 1000 body points, but quickly diverges at about 5K body points
        acttok = acttok * ((rob(t).body ^ 2 * Constant) + (1 - Constant * 1000 * 1000))
        Energy = acttok * (1 - SimOpts.VegFeedingToBody)
        body = (acttok * SimOpts.VegFeedingToBody) / 10
      End Select
      rob(t).nrg = rob(t).nrg + Energy
      rob(t).body = rob(t).body + body
      
      If rob(t).nrg > 32000 Then
     '   Energy = Energy - (rob(t).nrg - 32000)
        rob(t).nrg = 32000
      End If
      If rob(t).body > 32000 Then
    '    body = body - (rob(t).body - 32000)
        rob(t).body = 32000
      End If
      rob(t).radius = FindRadius(rob(t).body)
      
     ' EnergyAddedPerCycle = EnergyAddedPerCycle + energy + (body * 10)
    End If
    Next t
getout:
End Sub

Public Sub feedveg2(t As Integer) 'gives veg an additional meal based on waste 'Botsareus 8/25/2013 Fix for all robots based on chloroplasts
  With rob(t)
  If .nrg + (.Waste / 2) * (.chloroplasts / 32000) < 32000 Then
    .nrg = .nrg + (.Waste / 2) * (.chloroplasts / 32000)
    .Waste = .Waste - .Waste * (.chloroplasts / 32000)
  End If
  End With
End Sub

'' kill vegetables which are too distant from any robot
''currently broken, so it's commented out
'Public Sub KillDistVegs(mdist As Long)
'  Dim n As node
'  Dim t As Integer
'  Dim k As Integer
'  Dim mdist2 As Long
'  Dim dist2 As Long
'  Dim currdist2 As Long
'  mdist2 = mdist ^ 2
'  For t = 1 To MaxRobs
''    If rob(t).Veg And rob(t).Exist Then
''      currdist2 = 10 ^ 8
''      While Abs(nn.xpos - n.xpos) < mdist And Not nn Is rlist.last
''        k = nn.robn
''        If rob(k).Exist And Not rob(k).Veg Then
''          dist2 = (rob(k).pos.x - rob(t).pos.x) ^ 2 + (rob(k).pos.y - rob(t).pos.y) ^ 2
''          If dist2 < currdist2 Then currdist2 = dist2
''        End If
''        Set nn = rlist.nextorder(nn)
''      Wend
''      Set nn = rlist.prevorder(n)
''      While Abs(nn.xpos - n.xpos) < mdist And Not nn Is rlist.head
''        k = nn.robn
''        If Not rob(k).Veg Then
''          dist2 = (rob(k).pos.x - rob(t).pos.x) ^ 2 + (rob(k).pos.y - rob(t).pos.y) ^ 2
''          If dist2 < currdist2 Then currdist2 = dist2
''        End If
''        Set nn = rlist.prevorder(nn)
''      Wend
''      If currdist2 > mdist2 Then KillRobot (t)
''    End If
'  Next t
'End Sub