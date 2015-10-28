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

Public LightAval As Double 'Botsareus 8/14/2013 amount of avaialble light

'Botsareus 8/16/2014 Variable Sun
Public SunPosition As Double
Public SunRange As Double
Public SunChange As Byte '0 1 2 position + 10 20 range

' adds vegetables in random positions
Public Sub VegsRepopulate()
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

'Sun position calculation
If SimOpts.SunOnRnd Then
Dim Sposition As Byte
Dim Srange As Byte
'0 1 2 position + 10 20 range (calculated as one byte, being aware of memory at this pont)
Sposition = SunChange Mod 10
Srange = SunChange \ 10

If Int(Rndy * 2000) = 0 Then Srange = IIf(Srange = 0, 1, 0)
If Int(Rndy * 2000) = 0 Then Sposition = Int(Rndy * 3)

    If Srange = 1 Then SunRange = SunRange + 0.0005
    If Srange = 0 Then SunRange = SunRange - 0.0005
    If SunRange >= 1 Then Srange = 0
    If SunRange <= 0 Then Srange = 1

    If Sposition = 0 Then SunPosition = SunPosition - 0.0005
    If Sposition = 2 Then SunPosition = SunPosition + 0.0005
    If SunPosition >= 1 Then Sposition = 0
    If SunPosition <= 0 Then Sposition = 2
'0 1 2 position + 10 20 range
SunChange = Sposition + Srange * 10
End If
  
  Dim t As Integer
  Dim tok As Single
  Dim depth As Long
  Dim FeedThisCycle As Boolean
  Dim OverrideDayNight As Boolean
  
  
  Dim ScreenArea As Double
  Dim TotalRobotArea As Single
  Dim AreaCorrection As Single
  Dim ChloroplastCorrection As Single
  Dim AddEnergyRate As Single
  Dim SubtractEnergyRate As Single
  Dim acttok As Single
  
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
  
  'Botsareus 8/16/2014 All robots are set to think there is no sun, sun is calculated later
  For t = 1 To MaxRobs
    If rob(t).nrg > 0 And rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
        rob(t).mem(218) = 0
   End If
  Next
  
  If Not FeedThisCycle Then GoTo getout
  
  ScreenArea = CDbl(SimOptModule.SimOpts.FieldWidth) * CDbl(SimOptModule.SimOpts.FieldHeight) 'Botsareus 12/28/2013 Formula simplified, people are getting resonable frame rates with 3ghz cpus
  
  'Botsareus 12/28/2013 Subtract Obstacles
  For t = 1 To numObstacles
    If Obstacles.Obstacles(t).exist Then
     ScreenArea = ScreenArea - Obstacles.Obstacles(t).Width * Obstacles.Obstacles(t).Height
    End If
  Next
  
  For t = 1 To MaxRobs 'Panda 8/14/2013 Figure out total robot area
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then   'Botsareus 8/14/2013 We have to make sure the robot is alive first
        TotalRobotArea = TotalRobotArea + rob(t).radius ^ 2 * PI
    End If
  Next t
  
  If ScreenArea < 1 Then ScreenArea = 1
  
  LightAval = TotalRobotArea / ScreenArea 'Panda 8/14/2013 Figure out AreaInverted a.k.a. available light
  If LightAval > 1 Then LightAval = 1 'Botsareus make sure LighAval never goes negative
  
  AreaCorrection = (1 - LightAval) ^ 2 * 4
  
  'Botsareus 8/16/2014 Sun calculation
  Dim sunstart As Long
  Dim sunstop As Long
  Dim sunstart2 As Long 'wrap logic
  Dim sunstop2 As Long
  
    'Botsareus 8/16/2014 calculate the sun
    sunstart = (SunPosition - (0.25 + (SunRange ^ 3) * 0.75) / 2) * SimOpts.FieldWidth
    sunstop = (SunPosition + (0.25 + (SunRange ^ 3) * 0.75) / 2) * SimOpts.FieldWidth
    '
    sunstop2 = sunstop
    sunstart2 = sunstart 'Do not delete, bug fix!
    '
    If sunstart < 0 Then
        sunstart2 = SimOpts.FieldWidth + sunstart
        sunstop2 = SimOpts.FieldWidth
    End If
    If sunstop > SimOpts.FieldWidth Then
        sunstop2 = sunstop - SimOpts.FieldWidth
        sunstart2 = 0
    End If
    
 
  For t = 1 To MaxRobs
  With rob(t)
    If .nrg > 0 And .exist And Not (.FName = "Base.txt" And hidepred) Then
    
    'Botsareus 8/16/2014 Allow robots to share chloroplasts again
    If .chloroplasts > 0 Then
      If .Chlr_Share_Delay > 0 Then
        .Chlr_Share_Delay = .Chlr_Share_Delay - 1
      End If
    
      acttok = 0
        
      If (.pos.x < sunstart2 Or .pos.x > sunstop2) And (.pos.x < sunstart Or .pos.x > sunstop) Then GoTo nextrob

      If SimOpts.Pondmode Then
        depth = (.pos.y / 2000) + 1
        If depth < 1 Then depth = 1
        tok = (SimOpts.LightIntensity / depth ^ SimOpts.Gradient) 'Botsareus 3/26/2013 No longer add one, robots get fed more accuratly
      Else
        tok = totnrg
      End If
            
      If tok < 0 Then tok = 0
      
      tok = tok / 3.5 'Botsareus 2/25/2014 A little mod for PhinotPi
      
      'Panda 8/14/2013 New chloroplast codez
      ChloroplastCorrection = .chloroplasts / 16000
      AddEnergyRate = (AreaCorrection * ChloroplastCorrection) * 1.25
      SubtractEnergyRate = (.chloroplasts / 32000) ^ 2
          
      acttok = (AddEnergyRate - SubtractEnergyRate) * tok
    End If
      .mem(218) = 1 'Botsareus 8/16/2014 Now it is time view the sun
      
nextrob:
      
      If .chloroplasts > 0 Then
      acttok = acttok - CSng(.age) * CSng(.chloroplasts) / 1000000000# 'Botsareus 10/6/2015 Robots should start losing body at around 32000 cycles
      
      If TmpOpts.Tides > 0 Then acttok = acttok * (1 - BouyancyScaling) 'Botsareus 10/6/2015 Cancer effect corrected for
      
      .nrg = .nrg + acttok * (1 - SimOpts.VegFeedingToBody)
      .body = .body + (acttok * SimOpts.VegFeedingToBody) / 10
      
      If .nrg > 32000 Then
        .nrg = 32000
      End If
      If .body > 32000 Then
        .body = 32000
      End If
      .radius = FindRadius(t)
      End If
    
    End If
  End With
  Next t
getout:
End Sub

Public Sub feedveg2(t As Integer) 'gives veg an additional meal based on waste 'Botsareus 8/25/2013 Fix for all robots based on chloroplasts
  'Botsareus 9/21/2013 completely redesigned to be liner and spread body vs energy
  Dim Energy As Single
  Dim body As Single
  
  With rob(t)
   Energy = .chloroplasts / 64000 * (1 - SimOpts.VegFeedingToBody)
   body = (.chloroplasts / 64000 * SimOpts.VegFeedingToBody) / 10
   
   If Int(Rndy * 2) = 0 Then
   
   'energy first
   
        If .Waste > 0 Then
         If .nrg + Energy < 32000 Then
          .nrg = .nrg + Energy
          .Waste = .Waste - .chloroplasts / 32000 * (1 - SimOpts.VegFeedingToBody)
         End If
         If .Waste < 0 Then .Waste = 0
        End If
        
        If .Waste > 0 Then
         If .body + body < 32000 Then
          .body = .body + body
          .Waste = .Waste - .chloroplasts / 32000 * SimOpts.VegFeedingToBody
         End If
         If .Waste < 0 Then .Waste = 0
        End If
   
   Else
   
       'body first
    
       If .Waste > 0 Then
        If .body + body < 32000 Then
         .body = .body + body
         .Waste = .Waste - .chloroplasts / 32000 * SimOpts.VegFeedingToBody
        End If
        If .Waste < 0 Then .Waste = 0
       End If
       
       If .Waste > 0 Then
        If .nrg + Energy < 32000 Then
         .nrg = .nrg + Energy
         .Waste = .Waste - .chloroplasts / 32000 * (1 - SimOpts.VegFeedingToBody)
        End If
        If .Waste < 0 Then .Waste = 0
       End If
   
   End If
   
  End With
End Sub
