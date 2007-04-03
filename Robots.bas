Attribute VB_Name = "Robots"
Option Explicit

'
' robot system locations constants
'
Public Const dirup As Integer = 1
Public Const dirdn As Integer = 2
Public Const dirdx As Integer = 3
Public Const dirsx As Integer = 4
Public Const aimdx As Integer = 5
Public Const aimsx As Integer = 6
Public Const shoot As Integer = 7
Public Const shootval As Integer = 8
Public Const robage As Integer = 9
Public Const masssys As Integer = 10
Public Const maxvelsys As Integer = 11
Public Const timersys As Integer = 12
Public Const AimSys As Integer = 18
Public Const SetAim As Integer = 19
Public Const bodgain As Integer = 194
Public Const bodloss As Integer = 195
Public Const velscalar As Integer = 196
Public Const velsx As Integer = 197
Public Const veldx As Integer = 198
Public Const veldn As Integer = 199
Public Const velup As Integer = 200
Public Const vel As Integer = 200
Public Const hit As Integer = 201
Public Const shflav As Integer = 202
Public Const pain As Integer = 203
Public Const pleas As Integer = 204
Public Const hitup As Integer = 205
Public Const hitdn As Integer = 206
Public Const hitdx As Integer = 207
Public Const hitsx As Integer = 208
Public Const shup As Integer = 210
Public Const shdn As Integer = 211
Public Const shdx As Integer = 212
Public Const shsx As Integer = 213
Public Const Fixed As Integer = 216
Public Const Kills As Integer = 220
Public Const Repro As Integer = 300
Public Const mrepro As Integer = 301
Public Const sexrepro As Integer = 302
Public Const Energy As Integer = 310
Public Const body As Integer = 311
Public Const fdbody As Integer = 312
Public Const strbody As Integer = 313
Public Const setboy As Integer = 314
Public Const rdboy As Integer = 315
Public Const mtie As Integer = 330
Public Const stifftie As Integer = 331
Public Const mkvirus As Integer = 335
Public Const DnaLenSys As Integer = 336
Public Const Vtimer As Integer = 337
Public Const VshootSys As Integer = 338
Public Const GenesSys As Integer = 339
Public Const DelgeneSys As Integer = 340
Public Const thisgene As Integer = 341
Public Const LandM As Integer = 400
Public Const trefbody As Integer = 437
Public Const trefxpos As Integer = 438
Public Const trefypos As Integer = 439
Public Const trefvelmysx As Integer = 440
Public Const trefvelmydx As Integer = 441
Public Const trefvelmydn As Integer = 442
Public Const trefvelmyup As Integer = 443
Public Const trefvelscalar As Integer = 444
Public Const trefvelyoursx As Integer = 445
Public Const trefvelyourdx As Integer = 446
Public Const trefvelyourdn As Integer = 447
Public Const trefvelyourup As Integer = 448
Public Const trefshell As Integer = 449
Public Const tieport1 As Integer = 450
Public Const tieloc As Integer = 452
Public Const tieval As Integer = 453
Public Const tiepres As Integer = 454
Public Const tienum As Integer = 455
Public Const trefnrg As Integer = 456
Public Const fixang As Integer = 468
Public Const fixlen As Integer = 469
Public Const multi As Integer = 470
Public Const readtiesys As Integer = 471
Public Const EyeStart As Integer = 500
Public Const EyeEnd As Integer = 510
Public Const EYEF As Integer = 510
Public Const FOCUSEYE As Integer = 511
Public Const EYE1DIR As Integer = 521
Public Const EYE2DIR As Integer = 522
Public Const EYE3DIR As Integer = 523
Public Const EYE4DIR As Integer = 524
Public Const EYE5DIR As Integer = 525
Public Const EYE6DIR As Integer = 526
Public Const EYE7DIR As Integer = 527
Public Const EYE8DIR As Integer = 528
Public Const EYE9DIR As Integer = 529
Public Const EYE1WIDTH As Integer = 531
Public Const EYE2WIDTH As Integer = 532
Public Const EYE3WIDTH As Integer = 533
Public Const EYE4WIDTH As Integer = 534
Public Const EYE5WIDTH As Integer = 535
Public Const EYE6WIDTH As Integer = 536
Public Const EYE7WIDTH As Integer = 537
Public Const EYE8WIDTH As Integer = 538
Public Const EYE9WIDTH As Integer = 539
Public Const REFTYPE As Integer = 685
Public Const refmulti = 686
Public Const refshell = 687
Public Const refbody = 688
Public Const refxpos = 689
Public Const refypos = 690
Public Const refvelscalar As Integer = 695
Public Const refvelsx As Integer = 696
Public Const refveldx As Integer = 697
Public Const refveldn As Integer = 698
Public Const refvelup As Integer = 699
Public Const occurrstart As Integer = 700
Public Const out1 As Integer = 800
Public Const out2 As Integer = 801
Public Const out3 As Integer = 802
Public Const out4 As Integer = 803
Public Const out5 As Integer = 804
Public Const in1 As Integer = 810
Public Const in2 As Integer = 811
Public Const in3 As Integer = 812
Public Const in4 As Integer = 813
Public Const in5 As Integer = 814
Public Const poison As Integer = 827
Public Const backshot As Integer = 900
Public Const aimshoot As Integer = 901

' robot structure
Private Type robot

  exist As Boolean        ' the robot exists?
  radius As Single
  Shape As Integer        ' shape of the robot, how many sides
  
  Veg As Boolean          ' is it a vegetable?
  
  wall As Boolean         ' is it a wall?
  Corpse As Boolean
  Fixed As Boolean        ' is it blocked?
  
  View As Boolean         ' has this bot ever tried to see?
  NewMove As Boolean      ' is the bot using the new physics paradigms?
  
  ' physics
  pos As vector
  BucketPos As vector
  
  vel As vector
   
  ImpulseInd As vector      ' independant forces vector
  ImpulseRes As vector      ' Resistive forces vector
  ImpulseStatic As Single   ' static force scalar (always opposes current forces)
    
  AddedMass As Single     'From fluid displacement
  
  aim As Single           ' aim angle
  aimvector As vector     ' the unit vector for aim
  
  oaim As Single          ' old aim angle
  ma As Single              ' angular momentum
  mt As Single              ' torch
  Ties(10) As tie           ' array of ties
  order As Integer          'order in the roborder array
    
  occurr(20) As Integer     ' array with the ref* values
  nrg As Single             ' energy
  onrg As Single            ' old energy
  
  body As Single            ' Body points. A corpse still has a body after all
  obody As Single           ' old body points, for use with pain pleas versions for body
  vbody As Single           ' Virtual Body used to calculate body functions of MBs
    
  mass As Single            ' mass of robot
  
  shell As Single          ' Hard shell. protection from shots 1-100 reduces each cycle
  Slime As Single          ' slime layer. protection from ties 1-100 reduces each cycle
  Waste As Single          ' waste buildup in a robot. Too much and he dies. some can be removed by various methods
  Pwaste As Single         ' Permanent waste. cannot be removed. Builds up as waste is removed.
  poison As Single         ' How poisonous is robot
  venom As Single          ' How venomous is robot
    
  Paralyzed As Boolean      ' true when robot is paralyzed
  Paracount As Single       ' countdown until paralyzed robot is free to move again
  
  Numties As Single         ' the number of ties attached to a robot
  Multibot As Boolean       ' Is robot part of a multi-bot
  
  Poisoned As Boolean       ' Is robot poisoned and confused
  Poisoncount As Single     ' Countdown till poison is out of his system
  
  Bouyancy As Single        ' Does robot float or sink
  DecayTimer As Integer     ' controls decay cycle
  Kills As Long             ' How many other robots has it killed? Might not work properly
  Dead As Boolean           ' Allows program to define a robot as dead after a certain operation
  Ploc As Integer           ' Location for custom poison to strike
  Vloc As Integer           ' Location for custom venom to strike
  Vval As Integer           ' Value to insert into venom location
  Vtimer As Long            ' Count down timer to produce a virus
  
  vars(50) As var           '|
  vnum As Integer           '| about private variables
  maxusedvars As Integer    '|
  usedvars(1000) As Integer '| used memory cells
  
  ' virtual machine
  mem(1000) As Integer      ' memory array
  DNA() As block            ' program array
  
  lastopp As Long           ' index of last object in the focus eye, usually eye5
  lastopptype As Integer    ' Indicates the type of lastopp.
                            ' 0 - bot
                            ' 1 - shape
  
  AbsNum As Long            ' absolute robot number
  
  'Mutation related
  Mutables As mutationprobs
   
  PointMutCycle As Long     ' Next cycle to point mutate (expressed in cycles since birth.  ie: age)
  PointMutBP As Long        ' the base pair to mutate
  
  condnum As Integer        ' number of conditions (used for cost calculations)
  console As Consoleform    ' console object associated to the robot
  
  ' informative
  SonNumber As Integer      ' number of sons
  Mutations As Integer      ' total mutations
  LastMut As Integer        ' last mutations
  parent As Long            ' parent absolute number
  age As Long               ' age in cycles
  BirthCycle As Long        ' birth cycle
  genenum As Integer        ' genes number
  generation As Integer     ' generation
  LastOwner As String       ' last internet owner's name
  FName As String           ' species name
  DnaLen As Integer         ' dna length
  LastMutDetail As String   ' description of last mutations
  
  ' aspetto
  Skin(13) As Integer       ' skin definition
  OSkin(13) As Integer      ' Old skin definition
  color As Long             ' colour
  highlight As Boolean      ' is it highlighted?
  flash As Integer          ' EricL - used for blinking the entire bot a specific color for 1 cycle when various things happen
  
  'These store the last direction values the bot stored for voluntary movement.  Used to display movement vectors.
  lastup As Integer
  lastdown As Integer
  lastleft As Integer
  lastright As Integer
  
  virusshot As Long         ' the viral shot being stored
  ga() As Boolean           ' EricL March 15, 2006  Used to store gene activation state
  oldBotNum As Integer      ' EricL New for 2.42.8 - used only for remapping ties when loading multi-cell organisms
  reproTimer As Integer     ' New for 2.42.9 - the time in cycles before the act of reproduction is free
  CantSee As Boolean        ' Indicates whether bot's eyes get populated
  DisableDNA As Boolean     ' Indicates whether bot's DNA shoudl be executed
  DisableMovementSysvars As Boolean ' Indicates whether movement sysvars for this bot should be disabled.
  CantReproduce As Boolean  ' Indicates whether reproduction for this robot has been disabled

End Type

'Public Badwastelevel As Integer ' EricL 4/1/2006 Moved this to Sim Options Type
Public Const RobSize As Integer = 120    ' rob diameter
Public Const half As Integer = 60        ' and so on...
Public Const CubicTwipPerBody As Long = 905 'seems like a random number, I know.
                                            'It's cube root of volume * some constants to give
                                            'radius of 60 for a bot of 1000 body

Public Const RobArrayMax As Integer = 10000 'robot array must be an array for swift retrieval times.
Public rob(RobArrayMax) As robot    ' array of robots
Public rep(RobArrayMax) As Integer  ' array for pointing to robots attempting reproduction
Dim rp As Integer
Public kil(RobArrayMax) As Integer  ' array of robots to kill
Dim kl As Integer
Public MaxRobs As Integer    ' max used robots array index
Public robfocus As Integer  ' the robot which has the focus (selected)
Public TotalRobots As Integer  ' total robots in the sim
Public TotalRobotsDisplayed As Integer ' Display value to avoid displaying half updated numbers
'Public MaxAbsNum As Long          ' robots born (used to assign unique code)
Public MaxMem As Integer

                           
                           


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'  R O B O T S    M A N A G E M E N T
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function FindRadius(ByVal bodypoints As Single) As Single
  If bodypoints < 1 Then bodypoints = 1
  If SimOpts.FixedBotRadii Then
    FindRadius = half
  Else
    FindRadius = (bodypoints * CubicTwipPerBody * 3 / 4 / PI) ^ (1 / 3)
  End If
End Function

' returns an absolute acceleration, given up-down,
' left-right values and aim
Public Function absx(aim As Single, ByVal up As Integer, ByVal dn As Integer, ByVal sx As Integer, ByVal dx As Integer) As Integer
  On Error Resume Next
  up = up - dn
  sx = sx - dx
  absx = Cos(aim) * up + Sin(aim) * sx
End Function

Public Function absy(aim As Single, ByVal up As Integer, ByVal dn As Integer, ByVal sx As Integer, ByVal dx As Integer) As Integer
  On Error Resume Next
  up = up - dn
  sx = sx - dx
  absy = -Sin(aim) * up + Cos(aim) * sx
End Function

Private Function SetAimFunc(t As Integer) As Single
  'ByVal aim As Single, ByVal sx As Long, ByVal dx As Long, Optional ByVal setittothis As Single = 32000) As Single
  Dim diff As Single
  With rob(t)
  
  diff = .mem(aimsx) - .mem(aimdx)
  If .mem(SetAim) = Round(.aim * 200, 0) Then
    SetAimFunc = (.aim * 200 + diff)
  Else
    SetAimFunc = .mem(SetAim)
  End If
  
  SetAimFunc = SetAimFunc Mod (1256)
  If SetAimFunc < 0 Then SetAimFunc = SetAimFunc + 1256
  SetAimFunc = SetAimFunc / 200
  
  .nrg = .nrg - (SetAimFunc * SimOpts.Costs(TURNCOST) * SimOpts.Costs(COSTMULTIPLIER))

  
  'Overflow Protection
  While .ma > 2 * PI: .ma = .ma - 2 * PI: Wend
  While .ma < -2 * PI: .ma = .ma + 2 * PI: Wend
    
  .aim = SetAimFunc + .ma  ' Add in the angular momentum
  
  'Voluntary rotation can reduce angular momentum but for the time being, does not add to it.
  If .ma > 0 And diff < 0 Then
    .ma = .ma + diff
    If .ma < 0 Then .ma = 0
  End If
  If .ma < 0 And diff > 0 Then
    .ma = .ma + diff
    If .ma > 0 Then .ma = 0
  End If
  '.ma = .ma + (.mem(aimsx) Mod 1256) - (.mem(aimdx) Mod 1256) ' Can't do this yet without changing whole rotation paradym
  .aimvector = VectorSet(Cos(.aim), Sin(.aim))
  
  .mem(aimsx) = 0
  .mem(aimdx) = 0
  .mem(AimSys) = CInt(.aim * 200)
  .mem(SetAim) = .mem(AimSys)
  End With
End Function

' updates positions, transforming calculated accelerations
' in velocities, and velocities in new positions
Public Sub UpdatePosition(ByVal n As Integer)
  Dim t As Integer
  Dim vt As Single
  
  With rob(n)
  
  'Following line commented out since mass is set earlier in CalcMass
  '.mass = (.body / 1000) + (.shell / 200) 'set value for mass
  If .mass + .AddedMass < 0.25 Then .mass = 0.25 - .AddedMass ' a fudge since Euler approximation can't handle it when mass -> 0
  
  If Not .Fixed Then
    ' speed normalization
            
    .vel = VectorAdd(.vel, VectorScalar(.ImpulseInd, 1 / (.mass + .AddedMass)))
        
    vt = VectorMagnitudeSquare(.vel)
    If vt > SimOpts.MaxVelocity * SimOpts.MaxVelocity Then
      .vel = VectorScalar(VectorUnit(.vel), SimOpts.MaxVelocity)
      vt = SimOpts.MaxVelocity * SimOpts.MaxVelocity
    End If
    
    .pos = VectorAdd(.pos, .vel)
  Else
    .vel = VectorSet(0, 0)
  End If
  
  'Have to do these here for both fixed and unfixed bots to avoid build up of forces in case fixed bots become unfixed.
  .ImpulseInd = VectorSet(0, 0)
  .ImpulseRes = .ImpulseInd
  .ImpulseStatic = 0
  
  If SimOpts.ZeroMomentum = True Then .vel = VectorSet(0, 0)
  
  'UpdateBotBucket n
  
  ' if it's time, sends a robot on the net
  If IntOpts.Active And IntOpts.LastUploadCycle = 0 Then VerificaPosizione n
  
  .lastup = .mem(dirup)
  .lastdown = .mem(dirdn)
  .lastleft = .mem(dirsx)
  .lastright = .mem(dirdx)
  .mem(dirup) = 0
  .mem(dirdn) = 0
  .mem(dirdx) = 0
  .mem(dirsx) = 0
  
  .mem(velscalar) = iceil(Sqr(vt))
  .mem(vel) = iceil(Cos(.aim) * .vel.X + Sin(.aim) * .vel.Y * -1)
  .mem(veldn) = .mem(vel) * -1
  .mem(veldx) = iceil(Sin(.aim) * .vel.X + Cos(.aim) * .vel.Y)
  .mem(velsx) = .mem(veldx) * -1
  
  .mem(masssys) = .mass
  .mem(maxvelsys) = SimOpts.MaxVelocity
  End With
End Sub

Private Function iceil(X As Single) As Integer
    If (Abs(X) > 32000) Then X = Sgn(X) * 32000
    iceil = X
End Function

Private Sub makeshell(n)
Dim oldshell As Integer
Dim Cost As Single
    With rob(n)
        oldshell = .shell
        .shell = .shell + .mem(822)
        If .shell > 32000 Then .shell = 32000
        If .shell < 0 Then .shell = 0
        Cost = (.shell - oldshell) * SimOpts.Costs(SHELLCOST) * SimOpts.Costs(COSTMULTIPLIER)
        If Cost < 0 Then Cost = 0
        .nrg = .nrg - Cost / (.Numties + 1)
       ' EnergyLostPerCycle = EnergyLostPerCycle - cost / (.Numties + 1)
        .Waste = .Waste + Cost / 10
        .mem(822) = 0
        .mem(823) = .shell
    End With
End Sub

Private Sub makeslime(n)
Dim oldslime As Integer
Dim Cost As Single
  With rob(n)
    oldslime = .Slime
    .Slime = .Slime + .mem(820)
    If .Slime > 32000 Then .Slime = 32000
    If .Slime < 0 Then .Slime = 0
    Cost = (.Slime - oldslime) * SimOpts.Costs(SLIMECOST) * SimOpts.Costs(COSTMULTIPLIER)
    If Cost < 0 Then Cost = 0
    .nrg = .nrg - Cost / (.Numties + 1) 'lower cost for multibot
   ' EnergyLostPerCycle = EnergyLostPerCycle - cost / (.Numties + 1)
    .Waste = .Waste + Cost / 10
    .mem(820) = 0
    .mem(821) = .Slime
  End With
End Sub

Private Sub altzheimer(n As Integer)
'makes robots with high waste act in a bizarre fashion.
  Dim loc As Integer, val As Integer
  Dim loops As Integer
  Dim t As Integer
  loops = (rob(n).Pwaste + rob(n).Waste - SimOpts.BadWastelevel) / 4
  With rob(n)
  For t = 1 To loops
    loc = Random(1, 1000)
    val = Random(-32000, 32000)
    .mem(loc) = val
  Next t
  End With
End Sub

Private Sub Upkeep(n As Integer)
  Dim Cost As Single
  Dim ageDelta As Long
  With rob(n)
       
    'EricL 4/12/2006 Growing old is a bitch
    'Age Cost
    ageDelta = .age - CLng(SimOpts.Costs(AGECOSTSTART))
    If ageDelta > 0 And .age > 0 Then
      If SimOpts.Costs(AGECOSTMAKELOG) = 1 Then
        Cost = SimOpts.Costs(AGECOST) * Math.Log(ageDelta)
      ElseIf SimOpts.Costs(AGECOSTMAKELINEAR) = 1 Then
        Cost = SimOpts.Costs(AGECOST) + (ageDelta * SimOpts.Costs(AGECOSTLINEARFRACTION))
      Else
        Cost = SimOpts.Costs(AGECOST)
      End If
      .nrg = .nrg - (Cost * SimOpts.Costs(COSTMULTIPLIER))
    End If
  
    'BODY UPKEEP
    Cost = .body * SimOpts.Costs(BODYUPKEEP) * SimOpts.Costs(COSTMULTIPLIER)
    .nrg = .nrg - Cost
    
    'DNA upkeep cost
    Cost = (.DnaLen - 1) * SimOpts.Costs(BPCYCCOST) * SimOpts.Costs(COSTMULTIPLIER)
    .nrg = .nrg - Cost
    
    'degrade slime
    .Slime = .Slime * 0.98
  End With
End Sub

Public Function genelength(n As Integer, P As Integer) As Long
  'measures the length of gene p in robot n
  Dim k As Long, genes As Long
  Dim i As Long
  Dim f As Long
  
  k = 1
  With rob(n)
  While True
    If .DNA(k).tipo = 10 And .DNA(k).value = 1 Then Exit Function
    If .DNA(k).tipo = 9 And .DNA(k).value <> 1 And .DNA(k).value <> 4 Then
      genes = genes + 1
    End If
    
    If genes = P Then
      f = NextStop(rob(n).DNA, k + 1)
      genelength = f - k
      Exit Function
    End If
    k = k + 1
  Wend
  End With
End Function

Private Sub BotDNAManipulation(n As Integer)
Dim length As Long

  With rob(n)
  
  'count down
  If .Vtimer > 1 Then
    .Vtimer = .Vtimer - 1
  End If
  .mem(Vtimer) = .Vtimer
  
  'Viruses
  If .mem(mkvirus) > 0 And .Vtimer = 0 Then
   
    'make the virus
    If MakeVirus(n, .mem(mkvirus)) Then
       length = genelength(n, .mem(mkvirus)) * 2
       If length < 32000 Then
         .Vtimer = length
       Else
         .Vtimer = 32000
       End If
    Else
      .Vtimer = 0
      .virusshot = 0
    End If
    
  End If
  
  'shoot it!
  If .mem(VshootSys) > 0 And .Vtimer = 1 Then
    If .virusshot <= maxshotarray And .virusshot > 0 Then Vshoot n, rob(n).virusshot
    
    .mem(VshootSys) = 0
    .mem(Vtimer) = 0
    .mem(mkvirus) = 0
    .Vtimer = 0
    .virusshot = 0
  End If
  
  'Other stuff
  .mem(DnaLenSys) = .DnaLen
  .mem(GenesSys) = CountGenes(.DNA)
  If .mem(DelgeneSys) > 0 Then
    delgene n, .mem(DelgeneSys)
    .mem(DelgeneSys) = 0
  End If
  
  End With
End Sub

Private Sub Poisons(n As Integer)
  With rob(n)
  'Paralyzed means venomized
  
  If .Paralyzed Then .mem(.Vloc) = .Vval
    
  If .Paralyzed Then
    .Paracount = .Paracount - 1
    .mem(837) = .Paracount
    If .Paracount < 1 Then .Paralyzed = False: .Vloc = 0: .Vval = 0
  End If
  
  If .Poisoned Then .mem(.Ploc) = 0

  If .Poisoned Then
    .Poisoncount = .Poisoncount - 1
    .mem(838) = .Poisoncount
    If .Poisoncount < 1 Then .Poisoned = False: .Ploc = 0: .Poisoncount = 0
  End If
  End With
End Sub

Private Sub UpdateCounters(n As Integer)
  With rob(n)
    TotalRobots = TotalRobots + 1
      If .Veg Then
        totvegs = totvegs + 1
      ElseIf .Corpse Then
        totcorpse = totcorpse + 1
        If .body > 0 Then
          Decay n
        Else
          KillRobot n
        End If
      Else
        totnvegs = totnvegs + 1
      End If
  End With
End Sub

Private Sub MakeStuff(n As Integer)
  With rob(n)
  
  If .mem(824) <> 0 Then storevenom n
  If .mem(826) <> 0 Then storepoison n
  If .mem(822) <> 0 Then makeshell n
  If .mem(820) <> 0 Then makeslime n
  
  End With
End Sub

Private Sub HandleWaste(n As Integer)
  With rob(n)
    If .Waste > 0 And .Veg Then feedveg2 n
    If SimOpts.BadWastelevel = 0 Then SimOpts.BadWastelevel = 400
    If SimOpts.BadWastelevel > 0 And .Pwaste + .Waste > SimOpts.BadWastelevel Then altzheimer n
    If .Waste > 32000 Then defacate n
    If .Pwaste > 32000 Then .Pwaste = 32000
    If .Waste < 0 Then .Waste = 0
    .mem(828) = .Waste
    .mem(829) = .Pwaste
  End With
End Sub

Private Sub Ageing(n As Integer)
  Dim tempAge As Long ' EricL 4/13/2006 Added this to allow age to grow beyond 32000
  With rob(n)
    'aging
    .age = .age + 1
    tempAge = .age
    If tempAge > 32000 Then tempAge = 32000
    .mem(robage) = CInt(tempAge)        'line added to copy robots age into a memory location
    .mem(timersys) = .mem(timersys) + 1 'update epigenetic timer
    If .mem(timersys) > 32000 Then .mem(timersys) = -32000
  End With
End Sub

Private Sub Shooting(n As Integer)
  'shooting
  If rob(n).mem(shoot) Then robshoot n
  rob(n).mem(shoot) = 0
End Sub

Private Sub ManageBody(n As Integer)
  With rob(n)
  'body management
  .obody = .body      'replaces routine above
    
  If .mem(strbody) > 0 Then storebody n
  If .mem(fdbody) > 0 Then feedbody n
 ' If .wall Then .body = 1
  
  If .body > 32000 Then .body = 32000
  If .body < 0 Then .body = 0   'Ericl 4/6/2006 Overflow protection.
  .mem(body) = .body
  
  .radius = FindRadius(.body)
  End With
End Sub

Private Sub Shock(n As Integer)
  With rob(n)
  'shock code:
  'later make the shock threshold based on body and age
  If Not .Veg And .nrg > 3000 Then
    Dim temp As Double
    temp = .onrg - .nrg
    If temp > (.onrg / 2) Then
      .nrg = 0
      .body = .body + (.nrg / 10)
      If .body > 32000 Then .body = 32000
      .radius = FindRadius(.body)
    End If
  End If
  End With
End Sub

Private Sub ManageDeath(n As Integer)
  Dim i As Integer
  With rob(n)
 ' If .nrg <= 0 And Not SimOpts.CorpseEnabled Then
 '   .Dead = True
 ' End If
  
  If SimOpts.CorpseEnabled Then
    If Not .Corpse Then
      If .nrg < 1 And .age > 0 Then
        .Corpse = True
        .FName = "Corpse"
      '  delallties n
        Erase .occurr
        .color = vbWhite
        .Veg = False
        .Fixed = False
        'Zero out the eyes
        For i = (EyeStart + 1) To (EyeEnd - 1)
          .mem(i) = 0
        Next i
        If SimOpts.Bouyancy Then .Bouyancy = -1.5
      End If
    End If
    If .Corpse = True Then
     .nrg = 0
    End If
  Else
    If .nrg <= 0 Then .Dead = True
  End If
  
  If .body <= 0 Then
    .Dead = True
  End If
  
  If .Dead Then
    kil(kl) = n
    kl = kl + 1
  End If
  End With
End Sub

Private Sub ManageBouyancy(n As Integer)
  With rob(n)
    'Bouyancy
    'obsolete, so how to fix?
    If .mem(setboy) > 2000 Or .mem(setboy) < -2000 Then .mem(setboy) = 2000 * Sgn(.mem(setboy))
    If SimOpts.Bouyancy Then
       .Bouyancy = .mem(setboy) / 1000
    Else
        .Bouyancy = 0
    End If
    .mem(rdboy) = .Bouyancy * 1000
  End With
End Sub

Private Sub ManageFixed(n As Integer)
  With rob(n)
  'Fixed/ not fixed
    If .mem(216) > 0 Then
      .Fixed = True
    Else
      .Fixed = False
    End If
  End With
End Sub

Private Sub ManageReproduction(n As Integer)
  With rob(n)
  If (.mem(Repro) > 0 Or .mem(mrepro) > 0) And Not .CantReproduce Then
    rep(rp) = n
    rp = rp + 1
  End If
        
  If .mem(sexrepro) > 0 And Not .CantReproduce Then
    If .lastopp > 0 And rob(.lastopp).mem(sexrepro) <> 0 And Not rob(.lastopp).CantReproduce Then
      rep(rp) = -n
      rep(rp + 1) = -.lastopp
      rp = rp + 2
    End If
  End If
  End With
End Sub

Private Sub FireTies(n As Integer)
  Dim length As Single, maxlength As Single
  
  With rob(n)
  If .mem(mtie) > 0 Then
    If .View = False Then BasicProximity n, True
    If .lastopp > 0 And Not SimOpts.DisableTies Then
      '2 robot lengths
   
      length = VectorMagnitude(VectorSub(rob(.lastopp).pos, .pos))
      maxlength = RobSize * 4#
      
      If length <= maxlength Then
        'maketie auto deletes existing ties for you
        maketie n, rob(n).lastopp, rob(n).radius + rob(rob(n).lastopp).radius + RobSize * 2, -20, rob(n).mem(mtie)
      End If
    End If
    .mem(mtie) = 0
  End If
  End With
End Sub

'The heart of the robots to simulation interfacing
Public Sub UpdateBots()
  Dim t As Integer
  Dim k As Integer
  Dim c As Integer
  Dim z As Integer
  Dim q As Integer
  Dim ti As Single
  Dim X As Integer
  Dim staticV As vector
  

  
  rp = 1
  kl = 1
  kil(1) = 0
  rep(1) = 0
  TotalEnergy = 0
  totwalls = 0
  totcorpse = 0
  PopulationLastCycle = totnvegsDisplayed
  TotalRobotsDisplayed = TotalRobots
  TotalRobots = 0
  totnvegsDisplayed = totnvegs
  totnvegs = 0
  totvegsDisplayed = totvegs
  totvegs = 0
  
  If ContestMode Then
    F1count = F1count + 1
    If F1count = SampFreq And Contests <= Maxrounds Then Countpop
  End If
  
  'Need to do this first as NetForces can update bots later in the loop
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If Not rob(t).DisableDNA Then EraseSenses t
      If numTeleporters > 0 Then CheckTeleporters t
    End If
  Next t
  
  'Only calculate mass due to fuild displacement if the sim medium has density.
  If SimOpts.Density <> 0 Then
    For t = 1 To MaxRobs
      If rob(t).exist Then AddedMass t
    Next t
  End If
  
  'this loops is for pre update
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
    If rob(t).exist Then
      If Not rob(t).Corpse Then Upkeep t ' No upkeep costs if you are dead!
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then Poisons t
      ManageFixed t
      CalcMass t
      If numObstacles > 0 Then DoObstacleCollisions t
      bordercolls t
     
      TieHooke t ' Handles tie lengths, tie hardening and compressive, elastic tie forces
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then TieTorque t 'EricL 4/21/2006 Handles tie angles
      If Not rob(t).Fixed Then NetForces t 'calculate forces on all robots
      Colls2 t
      
      With rob(t)
      If .ImpulseStatic > 0 Then
        staticV = VectorScalar(VectorUnit(.ImpulseInd), .ImpulseStatic)
        If VectorMagnitudeSquare(staticV) > VectorMagnitudeSquare(.ImpulseInd) Then
          .ImpulseInd = VectorSub(.ImpulseInd, staticV)
        End If
      End If
     .ImpulseInd = VectorSub(.ImpulseInd, .ImpulseRes)
      End With
      
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then tieportcom t 'transfer data through ties
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then readtie t 'reads all of the tref variables from a given tie number
      UpdateCounters t
    End If
  Next t
  DoEvents
  
  For t = 1 To MaxRobs
    With rob(t)
    If t Mod 250 = 0 Then DoEvents
    If .exist Then
        Update_Ties t ' Carries out all tie routines
        
        'EricL Transfer genetic meomory locations for newborns through the birth tie during their first 15 cycles
        If rob(t).age < 15 Then DoGeneticMemory t
        
        If Not .Corpse And Not .DisableDNA Then SetAimFunc t  'Setup aiming
        If Not .Corpse And Not .DisableDNA Then BotDNAManipulation t
        UpdatePosition t 'updates robot's position
        'EricL 4/9/2006 Got rid of a loop below by moving these inside this loop.  Should speed things up a little.
        If .nrg > 32000 Then .nrg = 32000
        
        'EricL 4/14/2006 Allow energy to continue to be neagative to address loophole
        'where bots energy goes neagative above, gets reset to 0 here and then they only have to feed a tiny bit
        'from body.
        If .nrg < -32000 Then .nrg = -32000
                
        If .poison > 32000 Then .poison = 32000
        If .poison < 0 Then .poison = 0
      
        If .venom > 32000 Then .venom = 32000
        If .venom < 0 Then .venom = 0
      
        If .Waste > 32000 Then .Waste = 32000
        If .Waste < 0 Then .Waste = 0
    End If
    End With
  Next t
  DoEvents
    
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
    With rob(t)
     ' If Not .Corpse And Not .wall And .exist Then
      If Not .Corpse And Not .DisableDNA And .exist Then
        Mutate t
        MakeStuff t
        HandleWaste t
        Shooting t
        ManageBody t
        Shock t
        ManageBouyancy t
        ManageReproduction t
        WriteSenses t
        FireTies t
      End If
      If Not .Corpse And .exist Then
        Ageing t      ' Even bots with disabled DNA age...
        ManageDeath t ' Even bots with disabled DNA can die...
      End If
      If .exist Then TotalSimEnergy(CurrentEnergyCycle) = TotalSimEnergy(CurrentEnergyCycle) + rob(t).nrg + rob(t).body * 10
    End With
  Next t
  DoEvents
  ReproduceAndKill
  
  
  'Restart
  'Leaguemode handles restarts differently so only restart here if not in leaguemode
  If totnvegs = 0 And RestartMode And Not LeagueMode Then
  ' totnvegs = 1
  ' Contests = Contests + 1
    ReStarts = ReStarts + 1
  ' Form1.StartSimul
    StartAnotherRound = True
  End If
End Sub

Private Sub ReproduceAndKill()
  Dim t As Integer
 ' Dim temp As Single
'  temp = 0
  
  t = 1
  While t < rp
    If rep(t) > 0 Then
      
     ' temp = rob(rep(t)).mem(mrepro)
   '   temp = rob(rep(t)).mem(Repro) ' was temp + ...
   '   If temp > 32000 Then temp = 32000
   '   If temp < -32000 Then temp = -32000
      Reproduce rep(t), rob(rep(t)).mem(Repro)
      rob(rep(t)).mem(Repro) = 0
      rob(rep(t)).mem(mrepro) = 0
    ElseIf rep(t) < 0 Then
      'SexReproduce -rep(t), -rep(t + 1)
      rob(-rep(t)).mem(sexrepro) = 0
      rob(-rep(t + 1)).mem(sexrepro) = 0
      t = t + 1
    End If
    
    t = t + 1
  Wend
  t = 1
  
  'kill robots
  While t < kl
    KillRobot kil(t)
    t = t + 1
  Wend
End Sub

Private Sub storebody(t As Integer)
  If rob(t).mem(313) > 100 Then rob(t).mem(313) = 100
  rob(t).nrg = rob(t).nrg - rob(t).mem(313)
  rob(t).body = rob(t).body + rob(t).mem(313) / 10
  If rob(t).body > 32000 Then rob(t).body = 32000
  rob(t).radius = FindRadius(rob(t).body)
  rob(t).mem(313) = 0
End Sub

Private Sub feedbody(t As Integer)
  If rob(t).mem(fdbody) > 100 Then rob(t).mem(fdbody) = 100
  rob(t).nrg = rob(t).nrg + rob(t).mem(fdbody)
  rob(t).body = rob(t).body - CSng(rob(t).mem(fdbody)) / 10#
  If rob(t).nrg > 32000 Then rob(t).nrg = 32000
  rob(t).radius = FindRadius(rob(t).body)
  rob(t).mem(fdbody) = 0
End Sub

' here we catch the attempt of a robot to shoot,
' and actually build the shot
Private Sub robshoot(n As Integer)
  Dim shtype As Integer
  Dim value As Single
  Dim multiplier As Single
  Dim Cost As Long
  Dim rngmultiplier As Single
  Dim valmode As Boolean
  Dim EnergyLost As Single
  
  If rob(n).nrg <= 0 Then GoTo CantShoot
  
  shtype = rob(n).mem(shoot)
  value = rob(n).mem(shootval)
   
  If shtype >= -1 Or shtype = -6 Then
    If value < 0 Then
      multiplier = 1
      rngmultiplier = -value
    ElseIf value > 0 Then
      multiplier = value
      rngmultiplier = 1
      valmode = True
    Else
      multiplier = 1
      rngmultiplier = 1
    End If
  
    If rngmultiplier > 4 Then
      Cost = rngmultiplier * SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
      rngmultiplier = Log(rngmultiplier / 2) / Log(2)
    ElseIf valmode = False Then
      rngmultiplier = 1
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).Numties + 1))
    End If
  
    If multiplier > 4 Then
      Cost = multiplier * SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
      multiplier = Log(multiplier / 2) / Log(2)
    ElseIf valmode = True Then
      multiplier = 1
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).Numties + 1))
    End If
  
    If Cost > rob(n).nrg And Cost > 2 And rob(n).nrg > 2 And valmode Then
      Cost = rob(n).nrg
      multiplier = Log(rob(n).nrg / (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER))) / Log(2)
    End If
  
    If Cost > rob(n).nrg And Cost > 2 And rob(n).nrg > 2 And Not valmode Then
      Cost = rob(n).nrg
      rngmultiplier = Log(rob(n).nrg / (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER))) / Log(2)
    End If
  End If
  
  ''''''''''''''''''''''''''''''''''''''''''''''
  ''''''''''''''''''''''''''''''''''''''''''''''
  ''''''''''''''''''''''''''''''''''''''''''''''
  
  Select Case shtype
  
  Case Is >= 0 ' Memory Shot
    shtype = shtype Mod MaxMem
    Cost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
    If rob(n).nrg < Cost Then Cost = rob(n).nrg
    rob(n).nrg = rob(n).nrg - Cost ' EricL - postive shots should cost the shotcost
    newshot n, shtype, value, 1
  Case -1 ' Nrg request Feeding Shot
    If rob(n).Multibot Then
      value = 20 + (rob(n).body / 5) * (rob(n).Numties + 1)
    Else
      value = 20 + (rob(n).body / 5)
    End If
    value = value * multiplier
    If rob(n).nrg < Cost Then Cost = rob(n).nrg
    rob(n).nrg = rob(n).nrg - Cost
    newshot n, shtype, value, rngmultiplier
  Case -2 ' Nrg shot
    value = Abs(value)
    If rob(n).nrg < value Then value = rob(n).nrg
    If value = 0 Then value = rob(n).nrg / 100#  'default energy shot.  Very small.
    EnergyLost = value + SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).Numties + 1)
    If EnergyLost > rob(n).nrg Then
      rob(n).nrg = 0
    Else
      rob(n).nrg = rob(n).nrg - EnergyLost
    End If
    newshot n, shtype, value, 1
  Case -3 'shoot venom
    value = Abs(value)
    If value > rob(n).venom Then value = rob(n).venom
    If value = 0 Then value = rob(n).venom / 20# 'default venom shot.  Not too small.
    rob(n).venom = rob(n).venom - value
    rob(n).mem(825) = rob(n).venom
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).Numties + 1)
    If EnergyLost > rob(n).nrg Then
    '  EnergyLostPerCycle = EnergyLostPerCycle - rob(n).nrg
      rob(n).nrg = 0
    Else
      rob(n).nrg = rob(n).nrg - EnergyLost
     ' EnergyLostPerCycle = EnergyLostPerCycle - EnergyLost
    End If
    newshot n, shtype, value, 1
  Case -4 'shoot waste
    value = Abs(value)
    If value > rob(n).Waste Then value = rob(n).Waste
    rob(n).Waste = rob(n).Waste - value
    If value < 0 Then value = rob(n).Waste / 10 'default waste shot.
    rob(n).Pwaste = rob(n).Pwaste + value / 100
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).Numties + 1)
    If EnergyLost > rob(n).nrg Then
     ' EnergyLostPerCycle = EnergyLostPerCycle - rob(n).nrg
      rob(n).nrg = 0
    Else
      rob(n).nrg = rob(n).nrg - EnergyLost
     ' EnergyLostPerCycle = EnergyLostPerCycle - EnergyLost
    End If
    newshot n, shtype, value, 1
  ' no -5 shot here as poison can only be shot in response to an attack
  Case -6 'shoot body
    If rob(n).Multibot Then
      value = 10 + (rob(n).body / 2) * (rob(n).Numties + 1)
    Else
      value = 10 + Abs(rob(n).body) / 2
    End If
    If rob(n).nrg < Cost Then Cost = rob(n).nrg
    rob(n).nrg = rob(n).nrg - Cost
   ' EnergyLostPerCycle = EnergyLostPerCycle - cost
    value = value * multiplier
    newshot n, shtype, value, rngmultiplier
  End Select
CantShoot:
  rob(n).mem(shoot) = 0
  rob(n).mem(shootval) = 0
End Sub

Public Sub shareslime(t As Integer, k As Integer) 'robot shares slime with others in the same multibot structure
  Dim totslime As Single
  With rob(t)
    If .mem(833) > 99 Then .mem(833) = 99
    If .mem(833) < 0 Then .mem(833) = 0
    totslime = .Slime + rob(.Ties(k).pnt).Slime
    
    If totslime * (CSng(.mem(833)) / 100#) < 32000 Then
      .Slime = totslime * (CSng(.mem(833)) / 100#)
    Else
      .Slime = 32000
    End If
      If totslime * ((100# - CSng(.mem(833))) / 100#) < 32000 Then
      rob(.Ties(k).pnt).Slime = totslime * ((100 - CSng(.mem(833))) / 100#)
    Else
      rob(.Ties(k).pnt).Slime = 32000
    End If
  End With
End Sub
Public Sub sharewaste(t As Integer, k As Integer)
  Dim totwaste As Single
  With rob(t)
    If .mem(831) > 99 Then .mem(831) = 99
    If .mem(831) < 0 Then .mem(831) = 0
    totwaste = .Waste + rob(.Ties(k).pnt).Waste
    
    If totwaste * (CSng(.mem(831)) / 100#) < 32000 Then
      .Waste = totwaste * (CSng(.mem(831)) / 100#)
    Else
      .Waste = 32000
    End If
      If totwaste * ((100# - CSng(.mem(831))) / 100#) < 32000 Then
      rob(.Ties(k).pnt).Waste = totwaste * ((100 - CSng(.mem(831))) / 100#)
    Else
      rob(.Ties(k).pnt).Waste = 32000
    End If
  End With
End Sub
Public Sub shareshell(t As Integer, k As Integer)
  Dim totshell As Single
  
  With rob(t)
    If .mem(832) > 99 Then .mem(832) = 99
    If .mem(832) < 0 Then .mem(832) = 0
    totshell = .shell + rob(.Ties(k).pnt).shell
    
    If totshell * ((100# - CSng(.mem(832))) / 100#) < 32000 Then
      rob(.Ties(k).pnt).shell = totshell * ((100# - CSng(.mem(832))) / 100#)
    Else
      rob(.Ties(k).pnt).shell = 32000
    End If
    If totshell * (CSng(.mem(832)) / 100#) < 32000 Then
      .shell = totshell * (CSng(.mem(832)) / 100#)
    Else
      .shell = 32000
    End If
  End With
End Sub
Public Sub sharenrg(t As Integer, k As Integer)
  Dim totnrg As Single
  With rob(t)
    If .mem(830) > 99 Then .mem(830) = 99
    If .mem(830) < 0 Then .mem(830) = 0
    totnrg = .nrg + rob(.Ties(k).pnt).nrg
    
    If totnrg * ((100 - .mem(830)) / 100) < 32000 Then
      rob(.Ties(k).pnt).nrg = totnrg * ((100# - CSng(.mem(830))) / 100#)
    Else
      rob(.Ties(k).pnt).nrg = 32000
    End If
    If totnrg * (CSng(.mem(830)) / 100#) < 32000 Then
      .nrg = totnrg * (CSng(.mem(830)) / 100#)
    Else
      .nrg = 32000
    End If
    
  End With
End Sub

'Robot n converts some of his energy to venom
Public Sub storevenom(n As Integer)
  Dim Cost As Single
  Dim tempVenom As Single
  Dim delta As Single
  
  With rob(n)
    If .nrg <= 0 Then Exit Sub ' Can't make or unmake venom if nrg is negative
    Cost = .mem(824) * SimOpts.Costs(VENOMCOST) * SimOpts.Costs(COSTMULTIPLIER)
    If Cost > .nrg And Cost > 0 Then
      tempVenom = .nrg / (SimOpts.Costs(VENOMCOST) * SimOpts.Costs(COSTMULTIPLIER))
      If tempVenom > 32000 Then tempVenom = 32000
      .mem(824) = tempVenom
    End If
    If .venom + .mem(824) > 32000 Then
      delta = 32000 - .venom
      .venom = 32000
    ElseIf .venom + .mem(824) < 0 Then
      delta = .venom
      .venom = 0
    Else
      .venom = .venom + .mem(824)
      delta = .mem(824)
    End If
    .nrg = .nrg - Abs(Cost) ' EricL Unmaking venom still takes energy
  '  EnergyLostPerCycle = EnergyLostPerCycle - Abs(cost)
    .Waste = .Waste + Abs(delta) / 100
    .mem(825) = .venom
    .mem(824) = 0
  End With
End Sub
' Robot n converts some of his energy to poison
Public Sub storepoison(n As Integer)
  Dim Cost As Single
  Dim tempPoison As Single
  Dim delta As Single
  
  With rob(n)
    If .nrg <= 0 Then Exit Sub ' Can't make or unmake poison if nrg is negative
    Cost = .mem(826) * SimOpts.Costs(POISONCOST) * SimOpts.Costs(COSTMULTIPLIER)
    If Cost > .nrg And Cost > 0 Then
      'Not enough nrg to make requested amount.  Calculate how much to make with remaining nrg
      tempPoison = .nrg / (SimOpts.Costs(POISONCOST) * SimOpts.Costs(COSTMULTIPLIER))
      If tempPoison > 32000 Then tempPoison = 32000 ' overflow protection
      .mem(826) = tempPoison
    End If
    If .poison + .mem(826) > 32000 Then
      delta = 32000 - .poison
      .poison = 32000
    ElseIf .poison + .mem(826) < 0 Then
      delta = .poison
      .poison = 0
    Else
      .poison = .poison + .mem(826)
      delta = .mem(826)
    End If
    Cost = delta * SimOpts.Costs(POISONCOST) * SimOpts.Costs(COSTMULTIPLIER)
    .nrg = .nrg - Abs(Cost) ' EricL Unmaking posion still takes energy
    .Waste = .Waste + Abs(delta) / 100
    .mem(827) = .poison
    .mem(826) = 0
  End With
End Sub

' Reproduction
' makes some tests regarding the available space for
' spawning a new robot, the position (not off the field, nor
' on the internet d/l gate), the energy of the parent,
' then finally copies the dna and most of the two data
' structures (with some modif. - for example generation),
' sends the newborn rob to the mutation division,
' reanalizes the resulting dna (usedvars, condlist, and so on)
' ties parent and son, and the miracle of birth is accomplished
Public Sub Reproduce(n As Integer, ByVal per As Integer)
  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Single, nwaste As Single, npwaste As Single
  Dim nbody As Integer
  Dim nx As Long
  Dim ny As Long
  Dim t As Integer
  Dim tests As Boolean
  tests = False
  Dim i As Integer
  
  
  If n = -1 Then n = robfocus
  
  If rob(n).body <= 2 Or rob(n).CantReproduce Then Exit Sub 'bot is too small to reproduce
  
  'attempt to stop veg overpopulation but will it work?
  If rob(n).Veg = True And totvegsDisplayed > SimOpts.MaxPopulation Then Exit Sub
 

  per = per Mod 100 ' per should never be <=0 as this is checked in ManageReproduction()
  If per <= 0 Then Exit Sub
  sondist = FindRadius(rob(n).body * (per / 100)) + FindRadius(rob(n).body * ((100 - per) / 100))
  
  nnrg = (rob(n).nrg / 100#) * CSng(per)
  nbody = (rob(n).body / 100#) * CSng(per)
  'rob(n).nrg = rob(n).nrg - DNALength(n) * 3
  If rob(n).nrg > 0 Then
    nx = rob(n).pos.X + absx(rob(n).aim, sondist, 0, 0, 0)
    ny = rob(n).pos.Y + absy(rob(n).aim, sondist, 0, 0, 0)
    tests = tests Or simplecoll(nx, ny, n)
    tests = tests Or (rob(n).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
      nuovo = posto()
      SimOpts.TotBorn = SimOpts.TotBorn + 1
      If rob(n).Veg Then totvegs = totvegs + 1
      ReDim rob(nuovo).DNA(UBound(rob(n).DNA))
      For t = 1 To UBound(rob(nuovo).DNA)
        rob(nuovo).DNA(t) = rob(n).DNA(t)
      Next t
      rob(nuovo).DnaLen = rob(n).DnaLen
      
      rob(nuovo).Mutables = rob(n).Mutables
      rob(nuovo).Mutations = rob(n).Mutations
      rob(nuovo).LastMut = 0
      rob(nuovo).LastMutDetail = rob(n).LastMutDetail
      
      For t = 1 To rob(n).maxusedvars
        rob(nuovo).usedvars(t) = rob(n).usedvars(t)
      Next t
      
      For t = 0 To 12
        rob(nuovo).Skin(t) = rob(n).Skin(t)
      Next t
      
      rob(nuovo).maxusedvars = rob(n).maxusedvars
      Erase rob(nuovo).mem
      Erase rob(nuovo).Ties
      
      rob(nuovo).pos.X = rob(n).pos.X + absx(rob(n).aim, sondist, 0, 0, 0)
      rob(nuovo).pos.Y = rob(n).pos.Y + absy(rob(n).aim, sondist, 0, 0, 0)
      'UpdateBotBucket nuovo
      rob(nuovo).vel = rob(n).vel
      rob(nuovo).color = rob(n).color
      rob(nuovo).aim = rob(n).aim + PI
      If rob(nuovo).aim > 6.28 Then rob(nuovo).aim = rob(nuovo).aim - 2 * PI
      rob(nuovo).aimvector = VectorSet(Cos(rob(nuovo).aim), Sin(rob(nuovo).aim))
      rob(nuovo).mem(SetAim) = rob(nuovo).aim * 200
      rob(nuovo).mem(468) = 32000
      rob(nuovo).mem(480) = 32000
      rob(nuovo).mem(481) = 32000
      rob(nuovo).mem(482) = 32000
      rob(nuovo).mem(483) = 32000
      rob(nuovo).exist = True
      rob(nuovo).Corpse = False
      rob(nuovo).Dead = False
      rob(nuovo).NewMove = rob(n).NewMove
      rob(nuovo).generation = rob(n).generation + 1
      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
      rob(nuovo).vnum = 1
      nnrg = (rob(n).nrg / 100#) * CSng(per)
      nwaste = rob(n).Waste / 100# * CSng(per)
      npwaste = rob(n).Pwaste / 100# * CSng(per)
      rob(n).nrg = rob(n).nrg - nnrg - (nnrg * 0.001) ' Make reproduction cost 0.1% of nrg transfer
      rob(n).Waste = rob(n).Waste - nwaste
      rob(n).Pwaste = rob(n).Pwaste - npwaste
      rob(n).body = rob(n).body - nbody
      rob(n).radius = FindRadius(rob(n).body)
      rob(nuovo).body = nbody
      rob(nuovo).radius = FindRadius(nbody)
      rob(nuovo).Waste = nwaste
      rob(nuovo).Pwaste = npwaste
      rob(n).mem(Energy) = CInt(rob(n).nrg)
      rob(n).mem(311) = rob(n).body
      rob(n).SonNumber = rob(n).SonNumber + 1
      If rob(n).SonNumber > 32000 Then rob(n).SonNumber = 32000 ' EricL Overflow protection.  Should change to Long at some point.
      rob(nuovo).nrg = nnrg * 0.999  ' Make reproduction cost 1% of nrg transfer
      rob(nuovo).onrg = nnrg * 0.999
      rob(nuovo).mem(Energy) = CInt(rob(nuovo).nrg)
      rob(nuovo).Poisoned = False
      rob(nuovo).parent = rob(n).AbsNum
      rob(nuovo).FName = rob(n).FName
      rob(nuovo).LastOwner = rob(n).LastOwner
      rob(nuovo).Veg = rob(n).Veg
      rob(nuovo).Fixed = rob(n).Fixed
      rob(nuovo).CantSee = rob(n).CantSee
      rob(nuovo).DisableDNA = rob(n).DisableDNA
      rob(nuovo).DisableMovementSysvars = rob(n).DisableMovementSysvars
      rob(nuovo).CantReproduce = rob(n).CantReproduce
      If rob(nuovo).Fixed Then rob(nuovo).mem(Fixed) = 1
      rob(nuovo).Shape = rob(n).Shape
      'BucketsProximity n, 12
      'BucketsProximity nuovo, 12
      
      rob(nuovo).Vtimer = 0
      rob(nuovo).virusshot = 0
      
      'First 5 genetic memory locations happen instantly
      For i = 0 To 4
        rob(nuovo).mem(971 + i) = rob(n).mem(971 + i)
      Next i
            
      If rob(n).mem(mrepro) > 0 Then
        Dim temp As mutationprobs
        
        temp = rob(nuovo).Mutables
        
        For t = 0 To 20
          rob(nuovo).Mutables.mutarray(t) = rob(nuovo).Mutables.mutarray(t) / 10
          If rob(nuovo).Mutables.mutarray(t) = 0 Then rob(nuovo).Mutables.mutarray(t) = 1000
        Next t
        
        Mutate nuovo, True
        
        rob(nuovo).Mutables = temp
      Else
        'Mutate n, True 'mutate parent and child, note that these mutations are independant of each other.
        Mutate nuovo, True
      End If
      
      makeoccurrlist nuovo
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).DNA())
            
      maketie n, nuovo, sondist, 100, 0 'birth ties last 100 cycles
      rob(n).onrg = rob(n).nrg 'saves parent from dying from shock after giving birth
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
      rob(nuovo).mem(timersys) = rob(n).mem(timersys) 'epigenetic timer
    End If
  End If
End Sub

' hot hot: sex reproduction
' same as above, but: dna comes from two parents, is crossed-over,
' and the resulting dna is then mutated.
Public Sub SexReproduce(robA As Integer, robB As Integer)
  Dim perA As Integer, perB As Integer
  Dim nrgA As Long, nrgB As Long
  Dim bodyA As Long, bodyB As Long
  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Long
  Dim nbody As Long
  Dim nx As Long
  Dim ny As Long
  Dim t As Integer
  Dim tests As Boolean
  Dim n As Integer
  Dim i As Integer
  
  tests = False
  sondist = RobSize * 1.3
  
  If Sqr((rob(robA).pos.X - rob(robB).pos.X) ^ 2 + (rob(robA).pos.Y - rob(robB).pos.Y) ^ 2) >= RobSize * 2 Then Exit Sub
  
  perA = rob(robA).mem(sexrepro)
  perB = rob(robB).mem(sexrepro)
  perA = Abs(perA) Mod 100
  If perA = 0 Then Exit Sub
  perB = Abs(perB) Mod 100
  If perB = 0 Then Exit Sub
 ' If perA < 1 Then perA = 1
 ' If perA > 99 Then perA = 99
 ' If perB < 1 Then perB = 1
 ' If perB > 99 Then perB = 99
  nrgA = (rob(robA).nrg / 100) * perA
  nrgB = (rob(robB).nrg / 100) * perB
  nnrg = nrgA + nrgB
  If nnrg > 32000 Then
    nnrg = 32000
    nrgA = 32000 * (perA / 100)
    nrgB = 32000 * (perB / 100)
  End If
  bodyA = (rob(robA).body / 100) * perA
  bodyB = (rob(robB).body / 100) * perB
  nbody = bodyA + bodyB
  If nbody > 32000 Then
    nbody = 32000
    bodyA = 32000 * (perA / 100)
    bodyB = 32000 * (perB / 100)
  End If
  rob(perA).nrg = rob(perA).nrg - rob(robA).DnaLen * 1.5
  rob(perB).nrg = rob(perB).nrg - rob(robB).DnaLen * 1.5
  If rob(perA).nrg > 0 And rob(perB).nrg > 0 Then
    nx = rob(perA).pos.X + absx(rob(perA).aim, sondist, 0, 0, 0)
    ny = rob(perA).pos.Y + absy(rob(perA).aim, sondist, 0, 0, 0)
    'tests = tests Or simplecoll(nx, ny, n)
    tests = tests Or (rob(robA).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
      nuovo = posto()
      SimOpts.TotBorn = SimOpts.TotBorn + 1
      
      ReDim rob(nuovo).DNA(100)
      
      'Reimplement below!
      
      'DNA is redimed inside a sub function of CrossingOver
      'CrossingOver rob(robA).DNA, rob(robB).DNA, rob(nuovo).DNA
      
      ScanUsedVars nuovo
      For t = 0 To 20 ' EricL Changed from 14 to 20
        rob(nuovo).Mutables.mutarray(t) = (rob(robA).Mutables.mutarray(t) + rob(robB).Mutables.mutarray(t)) / 2
      Next t
      If rob(robA).Mutables.Mutations Or rob(robB).Mutables.Mutations Then
        rob(nuovo).Mutables.Mutations = True
      Else
        rob(nuovo).Mutables.Mutations = False
      End If
      For t = 0 To 12
        rob(nuovo).Skin(t) = (rob(robA).Skin(t) + rob(robB).Skin(t)) / 2
      Next t
      Erase rob(nuovo).mem
      Erase rob(nuovo).Ties
      rob(nuovo).pos.X = rob(robA).pos.X + absx(rob(robA).aim, sondist, 0, 0, 0)
      rob(nuovo).pos.Y = rob(robA).pos.Y + absy(rob(robA).aim, sondist, 0, 0, 0)
      rob(nuovo).vel.X = rob(robA).vel.X
      rob(nuovo).vel.Y = rob(robA).vel.Y
      rob(nuovo).color = rob(robA).color
      rob(nuovo).aim = rob(robA).aim + PI
      If rob(nuovo).aim > 6.28 Then rob(nuovo).aim = rob(nuovo).aim - 2 * PI
      rob(nuovo).aimvector = VectorSet(Cos(rob(nuovo).aim), Sin(rob(nuovo).aim))
      rob(nuovo).mem(SetAim) = rob(nuovo).aim * 200
      rob(nuovo).mem(468) = 32000
      rob(nuovo).mem(480) = 32000
      rob(nuovo).mem(481) = 32000
      rob(nuovo).mem(482) = 32000
      rob(nuovo).mem(483) = 32000
      rob(nuovo).exist = True
      rob(nuovo).Dead = False
      rob(nuovo).generation = rob(robA).generation + 1
      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
      rob(nuovo).vnum = 1
      rob(robA).nrg = rob(robA).nrg - nrgA
      rob(robB).nrg = rob(robB).nrg - nrgB
      rob(robA).mem(Energy) = rob(robA).nrg
      rob(robB).mem(Energy) = rob(robB).nrg
      rob(robA).body = rob(robA).body - bodyA
      rob(robA).radius = FindRadius(rob(robA).body)
      rob(robB).body = rob(robB).body - bodyB
      rob(robB).radius = FindRadius(rob(robB).body)
      rob(robA).mem(315) = rob(robA).body
      rob(robB).mem(315) = rob(robB).body
      rob(robA).SonNumber = rob(robA).SonNumber + 1
      rob(robB).SonNumber = rob(robB).SonNumber + 1
      rob(nuovo).nrg = nnrg
      rob(nuovo).body = nbody
      rob(nuovo).radius = FindRadius(rob(nuovo).body)
      rob(nuovo).Poisoned = False
      rob(nuovo).parent = rob(robA).AbsNum
      rob(nuovo).FName = rob(robA).FName
      rob(nuovo).LastOwner = rob(robA).LastOwner
      rob(nuovo).Veg = rob(robA).Veg
      rob(nuovo).NewMove = rob(robA).NewMove
      rob(nuovo).Fixed = rob(robA).Fixed
      If rob(nuovo).Fixed Then rob(nuovo).mem(216) = 1
      rob(nuovo).Corpse = False
      rob(nuovo).Mutations = rob(robA).Mutations
      rob(nuovo).LastMutDetail = rob(robA).LastMutDetail
      rob(nuovo).Shape = rob(robA).Shape
      
      rob(nuovo).Vtimer = 0
      rob(nuovo).virusshot = 0
      
      'First 5 genetic memory locations happen instantly
      'Take the values randomly from either parent
      For i = 0 To 4
        n = Random(1, 2)
        rob(nuovo).mem(971 + i) = rob(n).mem(971 + i)
      Next i
      
      'UpdateBotBucket nuovo
      'BucketsProximity robA
      'BucketsProximity robB
      'BucketsProximity nuovo
      Mutate nuovo
      
      'If Not CheckIntegrity(rob(nuovo).DNA) Then
      '  'parents aren't suposed to be penalized,
      '  'so they need to get their nrg and body back
      '  'NOT YET IMPLEMENTED!
      '  rob(nuovo).nrg = 0
      'End If
      
      makeoccurrlist nuovo
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).DNA())
      maketie robA, nuovo, RobSize * 1.3, 90, 0
      maketie robB, nuovo, RobSize * 1.3, 90, 0
      
      'to prevent shock
      rob(robA).onrg = rob(robA).nrg
      rob(robB).onrg = rob(robB).nrg
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
    End If
  End If
End Sub
'EricL 4/20/2006 This feature was never ported from 2.3X so implement it here
Public Function DoGeneticMemory(t As Integer)
  Dim loc As Integer ' memory location to copy from parent to offspring
  
  'Make sure the bot has a tie
  If rob(t).Numties > 0 Then
    'Make sure parent still exists.  Birth tie should always be the offspring's first tie, so will always be Ties(1)
    If rob(rob(t).Ties(1).pnt).exist Then
      'Make sure it really is the birth tie and not some other tie that has formed AND that we are the child
      If rob(t).Ties(1).Port = 0 And rob(t).Ties(1).back Then
        'Make sure robot isn't too old.  Age is 0 the first time through.
        If rob(t).age < 15 Then
          'Copy the memory locations 976 to 990 from parent to child. One per cycle.
          loc = 976 + rob(t).age ' the location to copy
          'only copy the value if the location is 0 in the child and the parent has something to copy
          If rob(t).mem(loc) = 0 And rob(rob(t).Ties(1).pnt).mem(loc) <> 0 Then
            rob(t).mem(loc) = rob(rob(t).Ties(1).pnt).mem(loc)
          End If
        End If
      End If
    End If
  End If
End Function

' verifies rapidly if a field position is already occupied
Public Function simplecoll(X As Long, Y As Long, k As Integer) As Boolean
  Dim t As Integer
  Dim radius As Long
  
  simplecoll = False
  
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If Abs(rob(t).pos.X - X) < rob(t).radius + rob(k).radius And _
        Abs(rob(t).pos.Y - Y) < rob(t).radius + rob(k).radius Then
        If k <> t Then
          simplecoll = True
          Exit Function
        End If
      End If
    End If
  Next t
  
  'EricL Can't reproduce into or across a shape
  For t = 1 To numObstacles
    If Not ((Obstacles.Obstacles(t).pos.X > Max(rob(k).pos.X, X)) Or _
           (Obstacles.Obstacles(t).pos.X + Obstacles.Obstacles(t).Width < Min(rob(k).pos.X, X)) Or _
           (Obstacles.Obstacles(t).pos.Y > Max(rob(k).pos.Y, Y)) Or _
           (Obstacles.Obstacles(t).pos.Y + Obstacles.Obstacles(t).Height < Min(rob(k).pos.Y, Y))) Then
       simplecoll = True
       Exit Function
    End If
  Next t
  
  If SimOpts.Dxsxconnected = False Then
    If X < rob(k).radius + smudgefactor Or X + rob(k).radius + smudgefactor > SimOpts.FieldWidth Then simplecoll = True
  End If
  
  If SimOpts.Updnconnected = False Then
    If Y < rob(k).radius + smudgefactor Or Y + rob(k).radius + smudgefactor > SimOpts.FieldHeight Then simplecoll = True
  End If
End Function

' searches a free slot in the robots array, to store a new rob
Public Function posto() As Integer
  Dim t As Integer
  t = 1
  While rob(t).exist And t <= MaxRobs And t < UBound(rob())
    t = t + 1
  Wend
  
  If t > MaxRobs Then MaxRobs = t
  
  If t = UBound(rob()) Then
    MaxRobs = MaxRobs - 1
    t = t - 1
  End If
  
  posto = t
  
  'potential memory leak:  I'm not sure if VB will catch and release the dereferenced memory or not
  Dim blank As robot
  rob(posto) = blank
  
 ' MaxAbsNum = MaxAbsNum + 1
  GiveAbsNum posto
End Function

' Kill Bill
Public Sub KillRobot(n As Integer)
  If n = -1 Then n = robfocus
  
  If SimOpts.DBEnable Then
    If rob(n).Veg And SimOpts.DBExcludeVegs Then
    Else
      AddRecord n
    End If
  End If
  
  If n = MaxRobs Then
    Dim b As Integer
    b = MaxRobs - 1
    While Not rob(b).exist And b > 1  ' EricL Loop now counts down, not up and works correctly.
      b = b - 1
    Wend
    MaxRobs = b 'b is now the last actual array element
  End If
  
  rob(n).exist = False
 ' rob(n).wall = False
  rob(n).Fixed = False
  rob(n).Veg = False
  rob(n).View = False
  rob(n).NewMove = False
  rob(n).LastOwner = ""
  rob(n).SonNumber = 0
  rob(n).age = 0
  'UpdateBotBucket n
  delallties n
  If Not MDIForm1.nopoff Then
    makepoff n
  End If
  If Not (rob(n).console Is Nothing) Then rob(n).console.textout "Robot has died." 'EricL 3/19/2006 Indicate robot has died in console
  If robfocus = n Then
    robfocus = 0 ' EricL 6/9/2006 get rid of the eye viewer thingy now that the bot is dead.
    MDIForm1.DisableRobotsMenu
  End If
  
  If rob(n).virusshot > 0 And rob(n).virusshot <= maxshotarray Then
    Shots(rob(n).virusshot).exist = False ' We have to kill any stored shots for this bot
    rob(n).virusshot = 0
  End If
  
End Sub
