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
Public Const SEXREPRO As Integer = 302
Public Const SYSFERTILIZED As Integer = 303
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
Public Const TotalBots As Integer = 401
Public Const TOTALMYSPECIES As Integer = 402



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
Public Const TIEANG As Integer = 450
Public Const TIELEN As Integer = 451
Public Const tieloc As Integer = 452
Public Const tieval As Integer = 453
Public Const TIEPRES As Integer = 454
Public Const TIENUM As Integer = 455
Public Const trefnrg As Integer = 464

Public Const TREFUPSYS As Integer = 456
Public Const TREFDNSYS As Integer = 457
Public Const TREFSXSYS As Integer = 458
Public Const TREFDXSYS As Integer = 459

Public Const numties As Integer = 466
Public Const DELTIE As Integer = 467
Public Const FIXANG As Integer = 468
Public Const FIXLEN As Integer = 469
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
Public Const out6 As Integer = 805
Public Const out7 As Integer = 806
Public Const out8 As Integer = 807
Public Const out9 As Integer = 808
Public Const out10 As Integer = 809
Public Const in1 As Integer = 810
Public Const in2 As Integer = 811
Public Const in3 As Integer = 812
Public Const in4 As Integer = 813
Public Const in5 As Integer = 814
Public Const in6 As Integer = 815
Public Const in7 As Integer = 816
Public Const in8 As Integer = 817
Public Const in9 As Integer = 818
Public Const in10 As Integer = 819
Public Const poison As Integer = 827
Public Const backshot As Integer = 900
Public Const aimshoot As Integer = 901

Private Type ancestorType
  num As Long ' unique ID of ancestor
  mut As Long ' mutations this ancestor had at time next descendent was born
  sim As Long ' the sim this ancestor was born in
End Type

' robot structure
Private Type robot

  exist As Boolean        ' the robot exists?
  radius As Single
  Shape As Integer        ' shape of the robot, how many sides
  
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
  
  Chlr As Single            ' Number of chloropasts.
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
  
  numties As Single         ' the number of ties attached to a robot
  Multibot As Boolean       ' Is robot part of a multi-bot
  
  Poisoned As Boolean       ' Is robot poisoned and confused
  Poisoncount As Single     ' Countdown till poison is out of his system
  
  Bouyancy As Single        ' Does robot float or sink
  DecayTimer As Integer     ' controls decay cycle
  Kills As Long             ' How many other robots has it killed? Might not work properly
  Dead As Boolean           ' Allows program to define a robot as dead after a certain operation
  Ploc As Integer           ' Location for custom poison to strike
  Pval As Integer           ' Value to insert into venom location
  Vloc As Integer           ' Location for custom venom to strike
  Vval As Integer           ' Value to insert into venom location
  Vtimer As Long            ' Count down timer to produce a virus
  
  vars(1000) As var
  vnum As Integer           '| about private variables
  maxusedvars As Integer    '|
  usedvars(1000) As Integer '| used memory cells
  
  ' virtual machine
  mem(1000) As Integer      ' memory array
  DNA() As block            ' program array
  
  lastopp As Long           ' Index of last object in the focus eye.  Could be a bot or shape or something else.
  lastopptype As Integer    ' Indicates the type of lastopp.
                            ' 0 - bot
                            ' 1 - shape
                            ' 2 - edge of the playing field
  lastopppos As vector      ' the position of the closest portion of the viewed object
  
  AbsNum As Long            ' absolute robot number
  sim As Long               ' GUID of sim in which this bot was born
    
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
  
  virusshot As Long                 ' the viral shot being stored
  ga() As Boolean                   ' EricL March 15, 2006  Used to store gene activation state
  oldBotNum As Integer              ' EricL New for 2.42.8 - used only for remapping ties when loading multi-cell organisms
  reproTimer As Integer             ' New for 2.42.9 - the time in cycles before the act of reproduction is free
  CantSee As Boolean                ' Indicates whether bot's eyes get populated
  DisableDNA As Boolean             ' Indicates whether bot's DNA should be executed
  DisableMovementSysvars As Boolean ' Indicates whether movement sysvars for this bot should be disabled.
  CantReproduce As Boolean          ' Indicates whether reproduction for this robot has been disabled
  VirusImmune As Boolean            ' Indicates whether this robot is immune to viruses
  SubSpecies As Integer             ' Indicates this bot's subspecies.  Changed when mutation or virus infection occurs
  Ancestors(500) As ancestorType    ' Orderred list of ancestor bot numbers.
  AncestorIndex As Integer          ' Index into the Ancestors array.  Points to the bot's immediate parent.  Older ancestors have lower numbers then wrap.
  
  fertilized As Integer             ' If non-zero, indicates this bot has been fertilized via a sperm shot.  This bot can choose to sexually reproduce
                                    ' with this DNA until the counter hits 0.  Will be zero if unfertilized.
  spermDNA() As block               ' Contains the DNA this bot has been fertilized with.
  spermDNAlen As Integer

End Type

Public Const RobSize As Integer = 120       ' rob diameter in fixed diameter sims
Public Const half As Integer = 60           ' and so on...
Public Const CubicTwipPerBody As Long = 905 'seems like a random number, I know.
                                            'It's cube root of volume * some constants to give
                                            'radius of 60 for a bot of 1000 body

Public Const ROBARRAYMAX As Integer = 32000 'robot array must be an array for swift retrieval times.
Public rob() As robot                       ' array of robots  start at 500 and up dynamically in chunks of 500 as needed
Public rep(ROBARRAYMAX) As Integer          ' array for pointing to robots attempting reproduction
Dim rp As Integer
Public kil(ROBARRAYMAX) As Integer          ' array of robots to kill
Dim kl As Integer
Public MaxRobs As Integer                   ' max used robots array index
Public robfocus As Integer                  ' the robot which has the focus (selected)
Public TotalRobots As Integer               ' total robots in the sim
Public TotalRobotsDisplayed As Integer      ' Display value to avoid displaying half updated numbers
'Public MaxAbsNum As Long                   ' robots born (used to assign unique code)
Public MaxMem As Integer


'Following used for crossover during sexual reproduction
Private Type blockarray
  DNA() As block
End Type
Dim strand(2) As blockarray
Dim Matching() As Integer
Dim strandlen(2) As Integer

Const MinMatchLength = 3

                           
                           


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'  R O B O T S    M A N A G E M E N T
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function FindRadius(ByVal bodypoints As Single, ByVal chloroplasts As Single) As Single
  If bodypoints < 1 Then bodypoints = 1
  If chloroplasts < 1 Then chloroplasts = 1
  If SimOpts.FixedBotRadii Then
    FindRadius = half
  Else
    ' EricL 10/20/2007 Added log(bodypoints) to increase the size variation in bots.
    FindRadius = (Log(bodypoints) * bodypoints * CubicTwipPerBody * 3 * 0.25 / PI) ^ (1 / 3) + (Log(chloroplasts) * chloroplasts * CubicTwipPerBody * 3 * 0.25 / PI) ^ (1 / 3)
    If FindRadius < 1 Then FindRadius = 1
  End If

End Function

' returns an absolute acceleration, given up-down,
' left-right values and aim
Public Function absx(aim As Single, ByVal up As Integer, ByVal dn As Integer, ByVal sx As Integer, ByVal dx As Integer) As Single
  Dim upTotal As Single
  Dim sxTotal As Single
'  On Error Resume Next
'  up = up - dn
'  sx = sx - dx
   upTotal = up - dn
   sxTotal = sx - dx
   If upTotal > 32000 Then upTotal = 32000
   If upTotal < -32000 Then upTotal = -32000
   If sxTotal > 32000 Then sxTotal = 32000
   If sxTotal < -32000 Then sxTotal = -32000
  absx = Cos(aim) * upTotal + Sin(aim) * sxTotal
End Function

Public Function absy(aim As Single, ByVal up As Integer, ByVal dn As Integer, ByVal sx As Integer, ByVal dx As Integer) As Single
  Dim upTotal As Single
  Dim sxTotal As Single
  'On Error Resume Next
  'up = up - dn
  'sx = sx - dx
   upTotal = up - dn
   sxTotal = sx - dx
   If upTotal > 32000 Then upTotal = 32000
   If upTotal < -32000 Then upTotal = -32000
   If sxTotal > 32000 Then sxTotal = 32000
   If sxTotal < -32000 Then sxTotal = -32000
  absy = -Sin(aim) * upTotal + Cos(aim) * sxTotal
End Function

Private Function SetAimFunc(t As Integer) As Single
  Dim diff As Single
  Dim newaim As Single
  With rob(t)
  
  diff = CSng(.mem(aimsx)) - CSng(.mem(aimdx))
   
  If .mem(SetAim) = Round(.aim * 200, 0) Then
    'Setaim is the same as .aim so nothing set into .setaim this cycle
    SetAimFunc = (.aim * 200 + diff)
  Else
    ' .setaim overrides .aimsx and .aimdx
    SetAimFunc = .mem(SetAim)          ' this is where .aim needs to be
    diff = (.aim * 200) + .mem(SetAim) ' this is the diff to get there
  End If
    
  'diff is now the amount, positive or negative to turn.  Could be multiple turns, round and round.
  .nrg = .nrg - Abs((Round((diff / 200), 3) * SimOpts.Costs(TURNCOST) * SimOpts.Costs(COSTMULTIPLIER)))
  
        
  'Well, we have no way currently to spin round and round.  So we just return the new aim independent of turn direction
      
  SetAimFunc = SetAimFunc Mod (1256)
  If SetAimFunc < 0 Then SetAimFunc = SetAimFunc + 1256
  SetAimFunc = SetAimFunc / 200
  
  'Overflow Protection
  While .ma > 2 * PI: .ma = .ma - 2 * PI: Wend
  While .ma < -2 * PI: .ma = .ma + 2 * PI: Wend
    
  .aim = SetAimFunc + .ma  ' Add in the angular momentum
  
  'Voluntary rotation can reduce angular momentum but for the time being, does not add to it.
  '.setaim doesn't impact angular momentum presently - should fix this
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
    UpdateBotBucket n
   ' If .pos.x > 10000000 Then t = 1 / 0 ' Crash inducing line for debugging
  Else
    .vel = VectorSet(0, 0)
  End If
    
  'Have to do these here for both fixed and unfixed bots to avoid build up of forces in case fixed bots become unfixed.
  .ImpulseInd = VectorSet(0, 0)
  .ImpulseRes = .ImpulseInd
  .ImpulseStatic = 0
  
  If SimOpts.ZeroMomentum = True Then .vel = VectorSet(0, 0)
  
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
Dim oldshell As Single
Dim Cost As Single
Dim delta As Single
Dim shellNrgConvRate As Single

  shellNrgConvRate = 0.1 ' Make 10 shell for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake shell if nrg is negative
    oldshell = .shell
    
    If .mem(822) > 32000 Then .mem(822) = 32000
    If .mem(822) < -32000 Then .mem(822) = -32000
    
    delta = .mem(822) ' This is what the bot wants to do to his shell, up or down
    
    If Abs(delta) > .nrg / shellNrgConvRate Then delta = Sgn(delta) * .nrg / shellNrgConvRate  ' Can't make or unmake more shell than you have nrg
    
    If Abs(delta) > 100 Then delta = Sgn(delta) * 100      ' Can't make or unmake more than 100 shell at a time
    If .shell + delta > 32000 Then delta = 32000 - .shell  ' shell can't go above 32000
    If .shell + delta < 0 Then delta = -.shell             ' shell can't go below 0
    
    .shell = .shell + delta                                ' Make the change in shell
    .nrg = .nrg - (Abs(delta) * shellNrgConvRate)          ' Making or unmaking shell takes nrg
    
    'This is the transaction cost
    Cost = Abs(delta) * SimOpts.Costs(SHELLCOST) * SimOpts.Costs(COSTMULTIPLIER)
    
    If .Multibot Then
      .nrg = .nrg - Cost / (.numties + 1)  'lower cost for multibot
    Else
      .nrg = .nrg - Cost
    End If
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(822) = 0                          ' reset the .mkshell sysvar
    .mem(823) = CInt(.shell)               ' update the .shell sysvar
getout:
  End With
End Sub

Private Sub makeslime(n)
Dim oldslime As Single
Dim Cost As Single
Dim delta As Single
Dim slimeNrgConvRate As Single

  slimeNrgConvRate = 0.1 ' Make 10 slime for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake slime if nrg is negative
    oldslime = .Slime
    
    If .mem(820) > 32000 Then .mem(820) = 32000
    If .mem(820) < -32000 Then .mem(820) = -32000
    
    delta = .mem(820) ' This is what the bot wants to do to his slime, up or down
    
    If Abs(delta) > .nrg / slimeNrgConvRate Then delta = Sgn(delta) * .nrg / slimeNrgConvRate  ' Can't make or unmake more slime than you have nrg
    
    If Abs(delta) > 100 Then delta = Sgn(delta) * 100      ' Can't make or unmake more than 100 slime at a time
    If .Slime + delta > 32000 Then delta = 32000 - .Slime  ' Slime can't go above 32000
    If .Slime + delta < 0 Then delta = -.Slime             ' Slime can't go below 0
    
    .Slime = .Slime + delta                                ' Make the change in slime
    .nrg = .nrg - (Abs(delta) * slimeNrgConvRate)          ' Making or unmaking slime takes nrg
    
    'This is the transaction cost
    Cost = Abs(delta) * SimOpts.Costs(SLIMECOST) * SimOpts.Costs(COSTMULTIPLIER)
    
    If .Multibot Then
      .nrg = .nrg - Cost / (.numties + 1) 'lower cost for multibot
    Else
      .nrg = .nrg - Cost
    End If
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(820) = 0                          ' reset the .mkslime sysvar
    .mem(821) = CInt(.Slime)               ' update the .slime sysvar
getout:
  End With
End Sub

Private Sub altzheimer(n As Integer)
'makes robots with high waste act in a bizarre fashion.
  Dim loc As Integer, val As Integer
  Dim loops As Integer
  Dim t As Integer
  loops = (rob(n).Pwaste + rob(n).Waste - SimOpts.BadWastelevel) / 4

  For t = 1 To loops
    loc = Random(1, 1000)
    val = Random(-32000, 32000)
    rob(n).mem(loc) = val
  Next t
  
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
    If .Slime < 0.5 Then .Slime = 0 ' To keep things sane for integer rounding, etc.
    .mem(821) = CInt(.Slime)
    
    'degrade poison
    .poison = .poison * 0.98
    If .poison < 0.5 Then .Slime = 0
    .mem(827) = CInt(.poison)
    
  End With
End Sub

Public Function genelength(n As Integer, P As Integer) As Long
  'measures the length of gene p in robot n
  Dim pos As Long
 
  pos = genepos(rob(n).DNA(), P)
  genelength = GeneEnd(rob(n).DNA(), pos) - pos + 1
  
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
  
  If .mem(DelgeneSys) > 0 Then
    delgene n, .mem(DelgeneSys)
    .mem(DelgeneSys) = 0
  End If
  
  .mem(DnaLenSys) = .DnaLen
  .mem(GenesSys) = rob(n).genenum
 
  End With
End Sub

Private Sub Poisons(n As Integer)
  With rob(n)
  'Paralyzed means venomized
  
  If .Paralyzed Then .mem(.Vloc) = .Vval
    
  If .Paralyzed Then
    .Paracount = .Paracount - 1
    If .Paracount < 1 Then .Paralyzed = False: .Vloc = 0: .Vval = 0
  End If
  
  .mem(837) = .Paracount
  
  If .Poisoned Then .mem(.Ploc) = .Pval

  If .Poisoned Then
    .Poisoncount = .Poisoncount - 1
    If .Poisoncount < 1 Then .Poisoned = False: .Ploc = 0: .Pval = 0
  End If
  
  .mem(838) = .Poisoncount
  End With
End Sub

Private Sub UpdateCounters(n As Integer)
Dim i As Integer

  i = 0

    TotalRobots = TotalRobots + 1
    
    'Update the number of bots in each species
    While SimOpts.Specie(i).Name <> rob(n).FName And i < SimOpts.SpeciesNum
        i = i + 1
    Wend
    
    'If no species structure for the bot, then create one
    If Not rob(n).Corpse Then
      If i = SimOpts.SpeciesNum And SimOpts.SpeciesNum < MAXNATIVESPECIES Then
        AddSpecie n, False
      ElseIf SimOpts.SpeciesNum < MAXNATIVESPECIES Then
        SimOpts.Specie(i).population = SimOpts.Specie(i).population + 1
      End If
    End If
    'Overflow protection.  Need to make sure teleported in species grow the species array correctly.
    If SimOpts.Specie(i).population > 32000 Then SimOpts.Specie(i).population = 32000
       
   If rob(n).Corpse Then
      totcorpse = totcorpse + 1
      If rob(n).body > 0 Then
        Decay n
      Else
        KillRobot n
      End If
    End If

End Sub

Private Sub MakeStuff(n As Integer)
   
  If rob(n).mem(316) <> 0 Then storechlr n
  If rob(n).mem(317) <> 0 Then feedchlr n
  If rob(n).mem(824) <> 0 Then storevenom n
  If rob(n).mem(826) <> 0 Then storepoison n
  If rob(n).mem(822) <> 0 Then makeshell n
  If rob(n).mem(820) <> 0 Then makeslime n
 
End Sub

Private Sub HandleWaste(n As Integer)

    If SimOpts.BadWastelevel = 0 Then SimOpts.BadWastelevel = 400
    If SimOpts.BadWastelevel > 0 And rob(n).Pwaste + rob(n).Waste > SimOpts.BadWastelevel Then altzheimer n
    If rob(n).Waste > 32000 Then defacate n
    If rob(n).Pwaste > 32000 Then rob(n).Pwaste = 32000
    If rob(n).Waste < 0 Then rob(n).Waste = 0
    rob(n).mem(828) = rob(n).Waste
    rob(n).mem(829) = rob(n).Pwaste
 
End Sub

Private Sub Ageing(n As Integer)
  Dim tempAge As Long ' EricL 4/13/2006 Added this to allow age to grow beyond 32000

    'aging
    rob(n).age = rob(n).age + 1
    tempAge = rob(n).age
    If tempAge > 32000 Then tempAge = 32000
    rob(n).mem(robage) = CInt(tempAge)        'line added to copy robots age into a memory location
    rob(n).mem(timersys) = rob(n).mem(timersys) + 1 'update epigenetic timer
    If rob(n).mem(timersys) > 32000 Then rob(n).mem(timersys) = -32000

End Sub

Private Sub Shooting(n As Integer)
  'shooting
  If rob(n).mem(shoot) Then robshoot n
  rob(n).mem(shoot) = 0
End Sub

Private Sub ManageBody(n As Integer)

  'body management
  rob(n).obody = rob(n).body      'replaces routine above
    
  If rob(n).mem(strbody) > 0 Then storebody n
  If rob(n).mem(fdbody) > 0 Then feedbody n
  
  If rob(n).body > 32000 Then rob(n).body = 32000
  If rob(n).body < 0 Then rob(n).body = 0   'Ericl 4/6/2006 Overflow protection.
  rob(n).mem(body) = CInt(rob(n).body)
  
  'rob(n).radius = FindRadius(rob(n).body)
  
End Sub

Private Sub Shock(n As Integer)

  'shock code:
  'later make the shock threshold based on body and age
  If rob(n).nrg > 3000 Then
    Dim temp As Double
    temp = rob(n).onrg - rob(n).nrg
    If temp > (rob(n).onrg / 2) Then
      rob(n).nrg = 0
      rob(n).body = rob(n).body + (rob(n).nrg / 10)
      If rob(n).body > 32000 Then rob(n).body = 32000
      rob(n).radius = FindRadius(rob(n).body, rob(n).Chlr)
    End If
  End If

End Sub

Private Sub ManageDeath(n As Integer)
  Dim i As Integer
  With rob(n)
  
  'We kill bots with nrg of body less than 0.5 rather than 0 to avoid rounding issues with refvars and such
  'showing extant bots with nrg or body of 0.
    
  If SimOpts.CorpseEnabled Then
    If Not .Corpse Then
      If (.nrg < 0.5 Or .body < 0.5) And .age > 0 Then
        .Corpse = True
        .FName = "Corpse"
      '  delallties n
        Erase .occurr
        .color = vbWhite
        .Fixed = False
        .nrg = 0
        .DisableDNA = True
        .DisableMovementSysvars = True
        .CantSee = True
        .VirusImmune = True
                
        'Zero out the eyes
        For i = (EyeStart + 1) To (EyeEnd - 1)
          .mem(i) = 0
        Next i
        If SimOpts.Bouyancy Then .Bouyancy = -1.5
      End If
    End If
  ElseIf (.nrg < 0.5 Or .body < 0.5) Then .Dead = True
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

  'Fixed/ not fixed
    If rob(n).mem(216) > 0 Then
      rob(n).Fixed = True
    Else
      rob(n).Fixed = False
    End If

End Sub

'Add bots reproducing this cycle to the rep array
'Currently possible to reproduce both sexually and asexually in the same cycle!
Private Sub ManageReproduction(n As Integer)
   
  'Decrement the fertilization counter
  If rob(n).fertilized >= 0 Then ' This is >= 0 so that we decrement it to -1 the cycle after the last birth is possible
    rob(n).fertilized = rob(n).fertilized - 1
    If rob(n).fertilized >= 0 Then
      rob(n).mem(SYSFERTILIZED) = rob(n).fertilized
    Else
      rob(n).mem(SYSFERTILIZED) = 0
    End If
  Else
    If rob(n).fertilized = -1 Then  ' Safe now to delete the spermDNA
      ReDim rob(n).spermDNA(0)
      rob(n).spermDNAlen = 0
    End If
    rob(n).fertilized = -2  'This is so we don't keep reDiming every time through
  End If
    
  'Asexual reproduction
  If (rob(n).mem(Repro) > 0 Or rob(n).mem(mrepro) > 0) And Not rob(n).CantReproduce Then
    rep(rp) = n ' positive value indicates asexual reproduction
    rp = rp + 1
  End If
        
  'Sexual Reproduction
  If rob(n).mem(SEXREPRO) > 0 And rob(n).fertilized >= 0 And Not rob(n).CantReproduce Then
    rep(rp) = -n 'negative value indicates sexual reproduction
    rp = rp + 1
  End If

End Sub

Private Sub FireTies(n As Integer)
  Dim length As Single, maxLength As Single
  
  With rob(n)
  If .mem(mtie) <> 0 Then
    If .lastopp > 0 And Not SimOpts.DisableTies And (.lastopptype = 0) Then
      
      '2 robot lengths
      length = VectorMagnitude(VectorSub(rob(.lastopp).pos, .pos))
      maxLength = RobSize * 4# + rob(n).radius + rob(rob(n).lastopp).radius
      
      If length <= maxLength Then
        'maketie auto deletes existing ties for you
        maketie n, rob(n).lastopp, rob(n).radius + rob(rob(n).lastopp).radius + RobSize * 2, -20, rob(n).mem(mtie)
      End If
    End If
    .mem(mtie) = 0
  End If
  End With
End Sub

Private Sub DeleteSpecies(i As Integer)
  Dim X As Integer
  
  For X = i To SimOpts.SpeciesNum - 1
    SimOpts.Specie(X) = SimOpts.Specie(X + 1)
  Next X
  SimOpts.Specie(SimOpts.SpeciesNum - 1).Native = False ' Do this just in case
  SimOpts.SpeciesNum = SimOpts.SpeciesNum - 1
   
End Sub


Private Sub RemoveExtinctSpecies()
Dim i, j As Integer
  
  i = 0
  While i < SimOpts.SpeciesNum
    If SimOpts.Specie(i).population = 0 And Not SimOpts.Specie(i).Native Then
      DeleteSpecies (i)
      ' Don't increment i since we need to recheck the i postion after deleting the species
    Else
      i = i + 1
    End If
  Wend
End Sub

'The heart of the robots to simulation interfacing
Public Sub UpdateBots()
  Dim t As Integer
  Dim i As Integer
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
  TotalRobotsDisplayed = TotalRobots
  TotalRobots = 0
  
  If ContestMode Then
    F1count = F1count + 1
    If F1count = SampFreq And Contests <= Maxrounds Then Countpop
  End If
  
  'Need to do this first as NetForces can update bots later in the loop
  For t = 1 To MaxRobs
    If rob(t).exist Then
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
      If (rob(t).Corpse = False) Then Upkeep t ' No upkeep costs if you are dead!
      If ((rob(t).Corpse = False) And (rob(t).DisableDNA = False)) Then Poisons t
      ManageFixed t
      CalcMass t
      If numObstacles > 0 Then DoObstacleCollisions t
      bordercolls t
     
      TieHooke t ' Handles tie lengths, tie hardening and compressive, elastic tie forces
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then TieTorque t 'EricL 4/21/2006 Handles tie angles
      If Not rob(t).Fixed Then NetForces t 'calculate forces on all robots
      BucketsCollision t
      'Colls2 t
      
      If rob(t).ImpulseStatic > 0 Then
        staticV = VectorScalar(VectorUnit(rob(t).ImpulseInd), rob(t).ImpulseStatic)
        If VectorMagnitudeSquare(staticV) > VectorMagnitudeSquare(rob(t).ImpulseInd) Then
          rob(t).ImpulseInd = VectorSub(rob(t).ImpulseInd, staticV)
        End If
      End If
      rob(t).ImpulseInd = VectorSub(rob(t).ImpulseInd, rob(t).ImpulseRes)
    
      
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then tieportcom t 'transfer data through ties
      If Not rob(t).Corpse And Not rob(t).DisableDNA Then readtie t 'reads all of the tref variables from a given tie number
      
    End If
  Next t
  
  DoEvents
    
  ' Don't handle events durign this next section cause we are updating species population numbers...
  i = 0
  While i < SimOpts.SpeciesNum
    SimOpts.Specie(i).population = 0
    i = i + 1
  Wend
  For t = 1 To MaxRobs
    If rob(t).exist Then UpdateCounters t ' Counts the number of bots and decays body...
  Next t
  
  DoEvents
  
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
     
    If rob(t).exist Then
        Update_Ties t                    ' Carries out all tie routines
             
        'EricL Transfer genetic meomory locations for newborns through the birth tie during their first 15 cycles
        If rob(t).age < 15 Then DoGeneticMemory t
        
        If Not rob(t).Corpse And Not rob(t).DisableDNA Then SetAimFunc t  'Setup aiming
        If Not rob(t).Corpse And Not rob(t).DisableDNA Then BotDNAManipulation t
        UpdatePosition t 'updates robot's position
        'EricL 4/9/2006 Got rid of a loop below by moving these inside this loop.  Should speed things up a little.
        If rob(t).nrg > 32000 Then rob(t).nrg = 32000
        
        'EricL 4/14/2006 Allow energy to continue to be negative to address loophole
        'where bots energy goes neagative above, gets reset to 0 here and then they only have to feed a tiny bit
        'from body.
        If rob(t).nrg < -32000 Then rob(t).nrg = -32000
                
        If rob(t).poison > 32000 Then rob(t).poison = 32000
        If rob(t).poison < 0 Then rob(t).poison = 0
      
        If rob(t).venom > 32000 Then rob(t).venom = 32000
        If rob(t).venom < 0 Then rob(t).venom = 0
      
        If rob(t).Waste > 32000 Then rob(t).Waste = 32000
        If rob(t).Waste < 0 Then rob(t).Waste = 0
    End If
   
  Next t
  DoEvents
    
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
    UpdateTieAngles t                ' Updates .tielen and .tieang.  Have to do this here after all bot movement happens above.
  
    If Not rob(t).Corpse And Not rob(t).DisableDNA And rob(t).exist Then
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
    If Not rob(t).Corpse And rob(t).exist Then
      Ageing t      ' Even bots with disabled DNA age...
      ManageDeath t ' Even bots with disabled DNA can die...
    End If
    If rob(t).exist Then TotalSimEnergy(CurrentEnergyCycle) = TotalSimEnergy(CurrentEnergyCycle) + rob(t).nrg + rob(t).body * 10
   
  Next t
  'DoEvents
  ReproduceAndKill
  RemoveExtinctSpecies
  
  
  'Restart
  'Leaguemode handles restarts differently so only restart here if not in leaguemode
  ' Contests = Contests + 1
  '  ReStarts = ReStarts + 1
  ' Form1.StartSimul
  '  StartAnotherRound = True
  'End If
End Sub

Private Sub ReproduceAndKill()
  Dim t As Integer
  Dim temp As Integer
  Dim temp2 As Integer
    
  t = 1
  While t < rp
    If rep(t) > 0 Then
       If rob(rep(t)).mem(mrepro) > 0 And rob(rep(t)).mem(Repro) > 0 Then
         If Rnd > 0.5 Then
           temp = rob(rep(t)).mem(Repro)
         Else
           temp = rob(rep(t)).mem(mrepro)
         End If
       Else
         If rob(rep(t)).mem(mrepro) > 0 Then temp = rob(rep(t)).mem(mrepro)
         If rob(rep(t)).mem(Repro) > 0 Then temp = rob(rep(t)).mem(Repro)
       End If
       temp2 = rep(t)
       Reproduce temp2, temp
  
    ElseIf rep(t) < 0 Then
      ' negative values in the rep array indicate sexual reproduction
      SexReproduce -rep(t)
     ' rob(-rep(t)).fertilized = 0 ' sperm shots only work for one birth for now
     ' rob(-rep(t)).mem(SYSFERTILIZED) = 0
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
  rob(t).radius = FindRadius(rob(t).body, rob(t).Chlr)
  rob(t).mem(313) = 0
End Sub

Private Sub feedbody(t As Integer)
  If rob(t).mem(fdbody) > 100 Then rob(t).mem(fdbody) = 100
  rob(t).nrg = rob(t).nrg + rob(t).mem(fdbody)
  rob(t).body = rob(t).body - CSng(rob(t).mem(fdbody)) / 10#
  If rob(t).nrg > 32000 Then rob(t).nrg = 32000
  rob(t).radius = FindRadius(rob(t).body, rob(t).Chlr)
  rob(t).mem(fdbody) = 0
End Sub

Private Sub storechlr(t As Integer)
  If rob(t).mem(316) > 100 Then rob(t).mem(316) = 100
  rob(t).nrg = rob(t).nrg - rob(t).mem(316)
  rob(t).Chlr = rob(t).Chlr + rob(t).mem(316) / 100
  If rob(t).Chlr > 32000 Then rob(t).Chlr = 32000
  rob(t).radius = FindRadius(rob(t).body, rob(t).Chlr)
  rob(t).mem(316) = 0
  rob(t).mem(318) = CInt(rob(t).Chlr)
End Sub

Private Sub feedchlr(t As Integer)
  If rob(t).mem(317) > 100 Then rob(t).mem(317) = 100
  rob(t).nrg = rob(t).nrg + rob(t).mem(317) / 20
  rob(t).Chlr = rob(t).Chlr - CSng(rob(t).mem(317)) / 10#
  If rob(t).nrg > 32000 Then rob(t).nrg = 32000
  rob(t).radius = FindRadius(rob(t).body, rob(t).Chlr)
  rob(t).mem(317) = 0
  rob(t).mem(318) = CInt(rob(t).Chlr)
End Sub

' here we catch the attempt of a robot to shoot,
' and actually build the shot
Private Sub robshoot(n As Integer)
  Dim shtype As Integer
  Dim value As Single
  Dim multiplier As Single
  Dim Cost As Single
  Dim rngmultiplier As Single
  Dim valmode As Boolean
  Dim EnergyLost As Single
  
  If rob(n).nrg <= 0 Then GoTo CantShoot
  
  shtype = rob(n).mem(shoot)
  value = rob(n).mem(shootval)
  
   
  If shtype >= -1 Or shtype = -6 Then ' nrg feeed, body feeding or info shot
    
    'Negative value for .shootval
    If value < 0 Then                 ' negative values of .shootval impact shot range?
      multiplier = 1                  ' no impact on shot power
      rngmultiplier = -value          ' set the range multplier equal to .shootval
    End If
    
    
    If value > 0 Then             ' postive values of .shootval impact shot power?
      multiplier = value
      rngmultiplier = 1
      valmode = True
    End If
    If value = 0 Then
      multiplier = 1
      rngmultiplier = 1
    End If
  
    If rngmultiplier > 4 Then
      Cost = rngmultiplier * SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
      rngmultiplier = Log(rngmultiplier / 2) / Log(2)
    ElseIf valmode = False Then
      rngmultiplier = 1
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).numties + 1))
    End If
  
    If multiplier > 4 Then
      Cost = multiplier * SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
      multiplier = Log(multiplier / 2) / Log(2)
    ElseIf valmode = True Then
      multiplier = 1
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).numties + 1))
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
      value = 20 + (rob(n).body / 5) * (rob(n).numties + 1)
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
    EnergyLost = value + SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).numties + 1)
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
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).numties + 1)
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
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (rob(n).numties + 1)
    If EnergyLost > rob(n).nrg Then
     ' EnergyLostPerCycle = EnergyLostPerCycle - rob(n).nrg
      rob(n).nrg = 0
    Else
      rob(n).nrg = rob(n).nrg - EnergyLost
    End If
    newshot n, shtype, value, 1
  ' no -5 shot here as poison can only be shot in response to an attack
  Case -6 'shoot body
    If rob(n).Multibot Then
      value = 10 + (rob(n).body / 2) * (rob(n).numties + 1)
    Else
      value = 10 + Abs(rob(n).body) / 2
    End If
    If rob(n).nrg < Cost Then Cost = rob(n).nrg
    rob(n).nrg = rob(n).nrg - Cost
    value = value * multiplier
    newshot n, shtype, value, rngmultiplier
  Case -8 ' shoot sperm
    Cost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
    If rob(n).nrg < Cost Then Cost = rob(n).nrg
    rob(n).nrg = rob(n).nrg - Cost ' EricL - postive shots should cost the shotcost
    newshot n, shtype, value, 1
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
    .mem(823) = CInt(.shell)               ' update the .shell sysvar
    rob(.Ties(k).pnt).mem(823) = rob(.Ties(k).pnt).shell
  End With

End Sub
Public Sub sharenrg(t As Integer, k As Integer)
  Dim totnrg As Single
  Dim portionThatsMine As Single
  Dim myChangeInNrg As Single
  
  With rob(t)
  
    'This is an order of operation thing.  A bot earlier in the rob array might have taken all your nrg, taking your
    'nrg to 0.  You should still be able to take some back.
    If rob(t).nrg < 0 Or rob(.Ties(k).pnt).nrg < 0 Then GoTo getout ' Can't transfer nrg if nrg is negative
  
    '.mem(830) is the percentage of the total nrg this bot wants to receive
    'has to be positive to come here, so no worries about changing the .mem location here
    If rob(t).mem(830) <= 0 Then
      rob(t).mem(830) = 0
    Else
      rob(t).mem(830) = rob(t).mem(830) Mod 100
      If rob(t).mem(830) = 0 Then rob(t).mem(830) = 100
    End If

    
    'Total nrg of both bots combined
    totnrg = rob(t).nrg + rob(.Ties(k).pnt).nrg
    
    portionThatsMine = totnrg * (CSng(rob(t).mem(830)) / 100#)      ' This is what the bot wants to have out of the total
    If portionThatsMine > 32000 Then portionThatsMine = 32000 ' Can't want more than the max a bot can have
    myChangeInNrg = portionThatsMine - rob(t).nrg                   ' This is what the bot's change in nrg would be
    
    'If the bot is taking nrg, then he can't take more than that represented by his own body.  If giving nrg away, same thing.  The bot
    'can't give away more than that represented by his body.  Should make it so that larger bots win tie feeding battles.
    If Abs(myChangeInNrg) > (.body) Then myChangeInNrg = Sgn(myChangeInNrg) * (.body)
    
    If .nrg + myChangeInNrg > 32000 Then myChangeInNrg = 32000 - .nrg    'Limit change if it would put bot over the limit
    If .nrg + myChangeInNrg < 0 Then myChangeInNrg = -.nrg               'Limit change if it would take the bot below 0
    
    'Now we have to check the limits on the other bot
    'sign is negative since the negative of myChangeinNrg is what the other bot is going to get/recevie
    If rob(.Ties(k).pnt).nrg - myChangeInNrg > 32000 Then myChangeInNrg = -(32000 - rob(.Ties(k).pnt).nrg)  'Limit change if it would put bot over the limit
    If rob(.Ties(k).pnt).nrg - myChangeInNrg < 0 Then myChangeInNrg = rob(.Ties(k).pnt).nrg       ' limit change if it would take the bot below 0
        
    'Do the actual nrg exchange
    .nrg = .nrg + myChangeInNrg
    rob(.Ties(k).pnt).nrg = rob(.Ties(k).pnt).nrg - myChangeInNrg
        
    'Transferring nrg costs nrg.  1% of the transfer gets deducted from the bot iniating the transfer
    .nrg = .nrg - (Abs(myChangeInNrg) * 0.01)
    
    'Bots with 32000 nrg can still take or receive nrg, but everything over 32000 disappears
    If .nrg > 32000 Then .nrg = 32000
    If rob(.Ties(k).pnt).nrg > 32000 Then rob(.Ties(k).pnt).nrg = 32000
getout:
  End With
End Sub
Public Sub sharechlr(t As Integer, k As Integer)

  Dim totchlr As Single
  Dim portionThatsMine As Single
  Dim myChangeInChlr As Single
  
  With rob(t)
  
    'This is an order of operation thing.  A bot earlier in the rob array might have taken all your nrg, taking your
    'nrg to 0.  You should still be able to take some back.
    'If rob(t).Chlr < 0 Or rob(.Ties(k).pnt).Chlr < 0 Then GoTo getout ' Can't transfer nrg if nrg is negative
  
    '.mem(830) is the percentage of the total nrg this bot wants to receive
    'has to be positive to come here, so no worries about changing the .mem location here
    If rob(t).mem(840) <= 0 Then
      rob(t).mem(840) = 0
    Else
      rob(t).mem(840) = rob(t).mem(840) Mod 100
      If rob(t).mem(840) = 0 Then rob(t).mem(840) = 100
    End If

    
    'Total nrg of both bots combined
    totchlr = rob(t).Chlr + rob(.Ties(k).pnt).Chlr
    
    portionThatsMine = totchlr * (CSng(rob(t).mem(840)) / 100#)      ' This is what the bot wants to have out of the total
    If portionThatsMine > 32000 Then portionThatsMine = 32000 ' Can't want more than the max a bot can have
    myChangeInChlr = portionThatsMine - rob(t).Chlr                 ' This is what the bot's change in nrg would be
    
    
    If .Chlr + myChangeInChlr > 32000 Then myChangeInChlr = 32000 - .Chlr    'Limit change if it would put bot over the limit
    If .Chlr + myChangeInChlr < 0 Then myChangeInChlr = -.Chlr               'Limit change if it would take the bot below 0
    
    'Now we have to check the limits on the other bot
    'sign is negative since the negative of myChangeinNrg is what the other bot is going to get/recevie
    If rob(.Ties(k).pnt).Chlr - myChangeInChlr > 32000 Then myChangeInChlr = -(32000 - rob(.Ties(k).pnt).Chlr)  'Limit change if it would put bot over the limit
    If rob(.Ties(k).pnt).Chlr - myChangeInChlr < 0 Then myChangeInChlr = rob(.Ties(k).pnt).Chlr       ' limit change if it would take the bot below 0
        
    'Do the actual chlr exchange
    .Chlr = .Chlr + myChangeInChlr
    rob(.Ties(k).pnt).Chlr = rob(.Ties(k).pnt).Chlr - myChangeInChlr
        
    'Transferring chlr costs nrg.  1% of the transfer gets deducted from the bot iniating the transfer
    .nrg = .nrg - (Abs(myChangeInChlr) * 0.01)
    
 '   'Bots with 32000 chlr can still take or receive nrg, but everything over chlr disappears
    If .Chlr > 32000 Then .Chlr = 32000
    If rob(.Ties(k).pnt).Chlr > 32000 Then rob(.Ties(k).pnt).Chlr = 32000
    
    rob(t).mem(318) = CInt(rob(t).Chlr)
    rob(k).mem(318) = CInt(rob(k).Chlr)
 
getout:
  End With
End Sub
'Robot n converts some of his energy to venom
Public Sub storevenom(n As Integer)
  Dim Cost As Single
  Dim delta As Single
  Dim venomNrgConvRate As Single

  venomNrgConvRate = 1 ' Make 1 venom for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake venom if nrg is negative
     
    If .mem(824) > 32000 Then .mem(824) = 32000
    If .mem(824) < -32000 Then .mem(824) = -32000
    
    delta = .mem(824) ' This is what the bot wants to do to his venom, up or down
    
    If Abs(delta) > .nrg / venomNrgConvRate Then delta = Sgn(delta) * .nrg / venomNrgConvRate  ' Can't make or unmake more venom than you have nrg
    
    If Abs(delta) > 100 Then delta = Sgn(delta) * 100      ' Can't make or unmake more than 100 venom at a time
    If .venom + delta > 32000 Then delta = 32000 - .venom  ' venom can't go above 32000
    If .venom + delta < 0 Then delta = -.venom             ' venom can't go below 0
    
    .venom = .venom + delta                                ' Make the change in venom
    .nrg = .nrg - (Abs(delta) * venomNrgConvRate)          ' Making or unmaking venom takes nrg
    
    'This is the transaction cost
    Cost = Abs(delta) * SimOpts.Costs(VENOMCOST) * SimOpts.Costs(COSTMULTIPLIER)
   
    .nrg = .nrg - Cost
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(824) = 0                          ' reset the .mkvenom sysvar
    .mem(825) = Int(.venom)               ' update the .venom sysvar
getout:
  End With
End Sub
' Robot n converts some of his energy to poison
Public Sub storepoison(n As Integer)
  Dim Cost As Single
  Dim delta As Single
  Dim poisonNrgConvRate As Single

  poisonNrgConvRate = 1 ' Make 1 poison for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake poison if nrg is negative
     
    If .mem(826) > 32000 Then .mem(826) = 32000
    If .mem(826) < -32000 Then .mem(826) = -32000
    
    delta = .mem(826) ' This is what the bot wants to do to his poison, up or down
    
    If Abs(delta) > .nrg / poisonNrgConvRate Then delta = Sgn(delta) * .nrg / poisonNrgConvRate  ' Can't make or unmake more poison than you have nrg
    
    If Abs(delta) > 100 Then delta = Sgn(delta) * 100        ' Can't make or unmake more than 100 poison at a time
    If .poison + delta > 32000 Then delta = 32000 - .poison  ' poison can't go above 32000
    If .poison + delta < 0 Then delta = -.poison             ' poison can't go below 0
    
    .poison = .poison + delta                                ' Make the change in poison
    .nrg = .nrg - (Abs(delta) * poisonNrgConvRate)           ' Making or unmaking poison takes nrg
    
    'This is the transaction cost
    Cost = Abs(delta) * SimOpts.Costs(POISONCOST) * SimOpts.Costs(COSTMULTIPLIER)
   
    .nrg = .nrg - Cost
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(826) = 0                          ' reset the .mkpoison sysvar
    .mem(827) = CInt(.poison)              ' update the .poison sysvar
getout:
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
Public Sub Reproduce(n As Integer, per As Integer)
  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Single, nwaste As Single, npwaste As Single
  Dim nbody As Integer
  Dim nchlr As Single
  Dim nx As Long
  Dim ny As Long
  Dim t As Integer
  Dim tests As Boolean
  tests = False
  Dim i As Integer
  Dim tempnrg As Single
  
  
  If n = -1 Then n = robfocus
  
  If rob(n).body <= 2 Or rob(n).CantReproduce Then GoTo getout 'bot is too small to reproduce
  

  per = per Mod 100 ' per should never be <=0 as this is checked in ManageReproduction()
  If per <= 0 Then GoTo getout
  sondist = FindRadius(rob(n).body * (per / 100), rob(n).Chlr * (per / 100)) + FindRadius(rob(n).body * ((100 - per) / 100), rob(n).Chlr * ((100 - per) / 100))
  
  nnrg = (rob(n).nrg / 100#) * CSng(per)
  nbody = (rob(n).body / 100#) * CSng(per)
  nchlr = (rob(n).Chlr / 100#) * CSng(per)
  'rob(n).nrg = rob(n).nrg - DNALength(n) * 3
  
  tempnrg = rob(n).nrg
  If tempnrg > 0 Then
    nx = rob(n).pos.X + absx(rob(n).aim, sondist, 0, 0, 0)
    ny = rob(n).pos.Y + absy(rob(n).aim, sondist, 0, 0, 0)
    tests = tests Or simplecoll(nx, ny, n)
    'tests = tests Or (rob(n).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
  '    If MaxRobs = 500 Then MsgBox "Maxrobs = 500 in Reproduce, about to call posto"
      nuovo = posto()
      
      SimOpts.TotBorn = SimOpts.TotBorn + 1
      ReDim rob(nuovo).DNA(UBound(rob(n).DNA))
      For t = 1 To UBound(rob(nuovo).DNA)
        rob(nuovo).DNA(t) = rob(n).DNA(t)
      Next t
      rob(nuovo).DnaLen = rob(n).DnaLen
      rob(nuovo).genenum = rob(n).genenum
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
      rob(nuovo).exist = True
      rob(nuovo).BucketPos.X = -2
      rob(nuovo).BucketPos.Y = -2
      UpdateBotBucket nuovo
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
      rob(n).Chlr = rob(n).Chlr - nchlr
      rob(n).radius = FindRadius(rob(n).body, rob(n).Chlr)
      rob(nuovo).body = nbody
      rob(nuovo).Chlr = nchlr
      rob(nuovo).radius = FindRadius(nbody, nchlr)
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
      rob(nuovo).Fixed = rob(n).Fixed
      rob(nuovo).CantSee = rob(n).CantSee
      rob(nuovo).DisableDNA = rob(n).DisableDNA
      rob(nuovo).DisableMovementSysvars = rob(n).DisableMovementSysvars
      rob(nuovo).CantReproduce = rob(n).CantReproduce
      rob(nuovo).VirusImmune = rob(n).VirusImmune
      If rob(nuovo).Fixed Then rob(nuovo).mem(Fixed) = 1
      rob(nuovo).Shape = rob(n).Shape
      rob(nuovo).SubSpecies = rob(n).SubSpecies
    
  
      For i = 0 To 500
        rob(nuovo).Ancestors(i) = rob(n).Ancestors(i)  ' copy the parents ancestor list
      Next i
      rob(nuovo).AncestorIndex = rob(n).AncestorIndex + 1  ' increment the ancestor index
      If rob(nuovo).AncestorIndex > 500 Then rob(nuovo).AncestorIndex = 0  ' wrap it
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).num = rob(n).AbsNum  ' add the parent as the most recent ancestor
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).mut = rob(n).LastMut ' add the number of mutations the parent has had up until now.
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).sim = SimOpts.SimGUID ' Use this seed to uniqufiy this ancestor in Internet mode
        
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
        
        rob(nuovo).Mutables.Mutations = True ' mutate even if mutations disabled for this bot
        
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
      rob(nuovo).genenum = CountGenes(rob(nuovo).DNA())
      rob(nuovo).mem(DnaLenSys) = rob(nuovo).DnaLen
      rob(nuovo).mem(GenesSys) = rob(nuovo).genenum
            
      maketie n, nuovo, sondist, 100, 0 'birth ties last 100 cycles
      rob(n).onrg = rob(n).nrg 'saves parent from dying from shock after giving birth
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
      rob(nuovo).mem(timersys) = rob(n).mem(timersys) 'epigenetic timer
                
      'Successfully reproduced
      rob(n).mem(Repro) = 0
      rob(n).mem(mrepro) = 0
    End If
  End If
getout:
End Sub


' New Sexual Reproduction routine from EricL Jan 2008
Public Function SexReproduce(female As Integer)
  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Single, nwaste As Single, npwaste As Single
  Dim nbody As Integer
  Dim nchlr As Integer
  Dim nx As Long
  Dim ny As Long
  Dim t As Integer
  Dim tests As Boolean
  Dim i As Integer
  Dim per As Single
  Dim tempnrg As Single
  
  tests = False
  
  If Not rob(female).exist Then GoTo getout      ' bot must exist
  If rob(female).Corpse Then GoTo getout          ' no sex with corpses
  If rob(female).CantReproduce Then GoTo getout    ' bot must be able to reproduce
  If rob(female).body <= 2 Then GoTo getout        ' female must be large enough to have sex
  If Not IsRobDNABounded(rob(female).spermDNA) Then GoTo getout ' sperm dna must exist
  
  'The percent of resources given to the offspring comes exclusivly from the mother
  'Perhaps this will lead to sexual selection since sex is expensive for females but not for males
  per = rob(female).mem(SEXREPRO)
    
  'veggies can reproduce sexually, but we still have to test for veggy population controls
  'we let male veggies fertilize nonveggie females all they want since the offspring's "species" and thus vegginess
  'will be determined by their mother.  Perhaps a strategy will emerge where plants compete to reproduce
  'with nonveggies so as to bypass the popualtion limtis?  Who knows.
  ' If we got here and the female is a veg, then we are below the reproduction threshold.  Let a random 10% of the veggis reproduce
  ' so as to avoid all the veggies reproducing on the same cycle.  This adds some randomness
  ' so as to avoid giving preference to veggies with lower bot array numbers.  If the veggy population is below 90% of the threshold
  ' then let them all reproduce.
  per = per Mod 100 ' per should never be <=0 as this is checked in ManageReproduction()
  If per <= 0 Then Exit Function ' Can't give 100% or 0% of resources to offspring
  sondist = FindRadius(rob(female).body * (per / 100), rob(female).Chlr * (per / 100)) + FindRadius(rob(female).body * ((100 - per) / 100)) + FindRadius(rob(female).Chlr * ((100 - per) / 100))
  
  nnrg = (rob(female).nrg / 100#) * CSng(per)
  nbody = (rob(female).body / 100#) * CSng(per)
  nchlr = (rob(female).Chlr / 100#) * CSng(per)
  
  tempnrg = rob(female).nrg
  If tempnrg > 0 Then
    nx = rob(female).pos.X + absx(rob(female).aim, sondist, 0, 0, 0)
    ny = rob(female).pos.Y + absy(rob(female).aim, sondist, 0, 0, 0)
    tests = tests Or simplecoll(nx, ny, female)
    'tests = tests Or (rob(n).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
      nuovo = posto()
      SimOpts.TotBorn = SimOpts.TotBorn + 1
           
      ' Do the crossover.  The sperm DNA is on the mom's bot structure
      Crossover female, nuovo
          
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).DNA())     ' Set the DNA length of the offspring
      rob(nuovo).genenum = CountGenes(rob(nuovo).DNA())
      rob(nuovo).Mutables = rob(female).Mutables
      rob(nuovo).Mutations = rob(female).Mutations
      rob(nuovo).LastMut = 0
      rob(nuovo).LastMutDetail = rob(female).LastMutDetail
      
      For t = 1 To rob(female).maxusedvars
        rob(nuovo).usedvars(t) = rob(female).usedvars(t)
      Next t
      
      For t = 0 To 12
        rob(nuovo).Skin(t) = rob(female).Skin(t)
      Next t
      
      rob(nuovo).maxusedvars = rob(female).maxusedvars
      Erase rob(nuovo).mem
      Erase rob(nuovo).Ties
      
      rob(nuovo).pos.X = rob(female).pos.X + absx(rob(female).aim, sondist, 0, 0, 0)
      rob(nuovo).pos.Y = rob(female).pos.Y + absy(rob(female).aim, sondist, 0, 0, 0)
      rob(nuovo).exist = True
      rob(nuovo).BucketPos.X = -2
      rob(nuovo).BucketPos.Y = -2
      UpdateBotBucket nuovo
      
      rob(nuovo).vel = rob(female).vel
      rob(nuovo).color = rob(female).color
      rob(nuovo).aim = rob(female).aim + PI
      If rob(nuovo).aim > 6.28 Then rob(nuovo).aim = rob(nuovo).aim - 2 * PI
      rob(nuovo).aimvector = VectorSet(Cos(rob(nuovo).aim), Sin(rob(nuovo).aim))
      rob(nuovo).mem(SetAim) = rob(nuovo).aim * 200
      rob(nuovo).mem(468) = 32000
      rob(nuovo).mem(480) = 32000
      rob(nuovo).mem(481) = 32000
      rob(nuovo).mem(482) = 32000
      rob(nuovo).mem(483) = 32000
      rob(nuovo).Corpse = False
      rob(nuovo).Dead = False
      rob(nuovo).NewMove = rob(female).NewMove
      rob(nuovo).generation = rob(female).generation + 1
      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
      rob(nuovo).vnum = 1
      
      nnrg = (rob(female).nrg / 100#) * CSng(per)
      nwaste = rob(female).Waste / 100# * CSng(per)
      npwaste = rob(female).Pwaste / 100# * CSng(per)
      
      rob(female).nrg = rob(female).nrg - nnrg - (nnrg * 0.001) ' Make reproduction cost 0.1% of nrg transfer for females
      'The male paid a cost to shoot the sperm but nothing more.
      
      rob(female).Waste = rob(female).Waste - nwaste
      rob(female).Pwaste = rob(female).Pwaste - npwaste
      rob(female).body = rob(female).body - nbody
      rob(female).Chlr = rob(female).Chlr - nchlr
      rob(female).radius = FindRadius(rob(female).body, rob(female).Chlr)
      rob(nuovo).body = nbody
      rob(nuovo).Chlr = nchlr
      rob(nuovo).radius = FindRadius(nbody, nchlr)
      rob(nuovo).Waste = nwaste
      rob(nuovo).Pwaste = npwaste
      rob(female).mem(Energy) = CInt(rob(female).nrg)
      rob(female).mem(311) = rob(female).body
      rob(female).SonNumber = rob(female).SonNumber + 1
      
      ' Need to track the absnum of shot parents before we can do this...
      ' rob(male).SonNumber = rob(male).SonNumber + 1
            
      If rob(female).SonNumber > 32000 Then rob(female).SonNumber = 32000 ' EricL Overflow protection.  Should change to Long at some point.
      ' Need to track the absnum of shot parents before we can do this...
      ' If rob(male).SonNumber > 32000 Then rob(male).SonNumber = 32000 ' EricL Overflow protection.  Should change to Long at some point.
      
      rob(nuovo).nrg = nnrg * 0.999  ' Make reproduction cost 1% of nrg transfer for offspring
      rob(nuovo).onrg = nnrg * 0.999
      rob(nuovo).mem(Energy) = CInt(rob(nuovo).nrg)
      rob(nuovo).Poisoned = False
      rob(nuovo).parent = rob(female).AbsNum
      rob(nuovo).FName = rob(female).FName
      rob(nuovo).LastOwner = rob(female).LastOwner
      rob(nuovo).Fixed = rob(female).Fixed
      rob(nuovo).CantSee = rob(female).CantSee
      rob(nuovo).DisableDNA = rob(female).DisableDNA
      rob(nuovo).DisableMovementSysvars = rob(female).DisableMovementSysvars
      rob(nuovo).CantReproduce = rob(female).CantReproduce
      rob(nuovo).VirusImmune = rob(female).VirusImmune
      If rob(nuovo).Fixed Then rob(nuovo).mem(Fixed) = 1
      rob(nuovo).Shape = rob(female).Shape
      rob(nuovo).SubSpecies = rob(female).SubSpecies
    
  
      For i = 0 To 500
        rob(nuovo).Ancestors(i) = rob(female).Ancestors(i)  ' copy the parents ancestor list
      Next i
      rob(nuovo).AncestorIndex = rob(female).AncestorIndex + 1  ' increment the ancestor index
      If rob(nuovo).AncestorIndex > 500 Then rob(nuovo).AncestorIndex = 0  ' wrap it
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).num = rob(female).AbsNum  ' add the parent as the most recent ancestor
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).mut = rob(female).LastMut ' add the number of mutations the parent has had up until now.
      rob(nuovo).Ancestors(rob(nuovo).AncestorIndex).sim = SimOpts.SimGUID ' Use this seed to uniqufiy this ancestor in Internet mode
      
         
      rob(nuovo).Vtimer = 0
      rob(nuovo).virusshot = 0
      
      'First 5 genetic memory locations happen instantly
      For i = 0 To 4
        rob(nuovo).mem(971 + i) = rob(female).mem(971 + i)
      Next i
      
      rob(nuovo).LastMutDetail = "Female DNA len " + Str(rob(female).DnaLen) + " and male DNA len " + _
      Str(UBound(rob(female).spermDNA)) + " had offspring DNA len " + Str(rob(nuovo).DnaLen) + " during cycle " + Str(SimOpts.TotRunCycle) + _
      vbCrLf + rob(nuovo).LastMutDetail
            
      ' Mutate the offspring
      Mutate nuovo, True
        
      makeoccurrlist nuovo
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).DNA())
      rob(nuovo).genenum = CountGenes(rob(nuovo).DNA())
      rob(nuovo).mem(DnaLenSys) = rob(nuovo).DnaLen
      rob(nuovo).mem(GenesSys) = rob(nuovo).genenum
            
      maketie female, nuovo, sondist, 100, 0 'birth ties last 100 cycles
      rob(female).onrg = rob(female).nrg 'saves mother from dying from shock after giving birth
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
      rob(nuovo).mem(timersys) = rob(female).mem(timersys) 'epigenetic timer
      
      rob(female).mem(SEXREPRO) = 0 ' sucessfully reproduced, so reset .sexrepro
      rob(female).fertilized = -1           ' Set to -1 so spermDNA space gets reclaimed next cycle
      rob(female).mem(SYSFERTILIZED) = 0    ' Sperm is only good for one birth presently
    End If
  End If
getout:
End Function

' Returns the length the longest shared DNA sequence between a and b
' Changes c to contain the sequence
Private Function FindLongestMatch(a As blockarray, b As blockarray, ByRef c() As block) As Integer
Dim X As Integer
Dim Y As Integer
Dim Index As Integer
Dim maxLength
Dim length As Integer
'Dim ReturnMe() As block

  maxLength = 0
  length = 0
  X = 1
  Y = 1

  While X <= UBound(a.DNA)
    While Y <= UBound(b.DNA)
      If (X + length <= UBound(a.DNA)) Then
        If a.DNA(X + length).tipo = b.DNA(Y).tipo And _
           a.DNA(X + length).value = b.DNA(Y).value Then
          length = length + 1
        Else
          length = 0
        End If
        If length > maxLength Then
          Index = X
          maxLength = length
        End If
      Else
        'we ran off the end of sequence a.  Must have found the longest sequence already.
        GoTo done
      End If
      Y = Y + 1
    Wend
    X = X + 1
  Wend
  
done:
  ' Index should now point to the starting location in a of the longest matching sequence of length maxLength
  ' Note that the end base pair is not matched and not returned in the matching sequence
  ReDim c(maxLength)
  For Y = 0 To maxLength - 1
    c(Y + 1).tipo = a.DNA(Index + Y).tipo
    c(Y + 1).value = a.DNA(Index + Y).value
  Next Y
  
  FindLongestMatch = maxLength
    
End Function

' Finds the all the places in sequence 'a' which match sequence 'match' and sets the locations in 'matchindex'
' Returns the number of matches
Private Function FindMatches(a As blockarray, match As blockarray, ByRef matchindex() As Integer) As Integer
Dim X As Integer
Dim Y As Integer
Dim z As Integer
Dim foundmatch As Boolean
Dim matchlen As Integer

  z = 0
  matchlen = UBound(match.DNA)
  
  ReDim matchindex(UBound(a.DNA)) ' dimension the size of the match array large

  X = 1
  While X <= UBound(a.DNA)
    foundmatch = True
    Y = 0
    While foundmatch And Y < matchlen
      If X + Y <= UBound(a.DNA) Then
        If (a.DNA(X + Y).tipo <> match.DNA(Y + 1).tipo) Or (a.DNA(X + Y).value <> match.DNA(Y + 1).value) Then
          foundmatch = False
        End If
      Else
        foundmatch = False
        GoTo done
      End If
      Y = Y + 1
    Wend
    If foundmatch Then
      z = z + 1
      matchindex(z) = X
    End If
  X = X + 1
  Wend
done:
  ReDim Preserve matchindex(UBound(matchindex)) ' dimension the size of the match array so it contains only the match indecies
  
  FindMatches = z

End Function


Public Function MatchLongestSequence(StartOffsetA As Integer, LengthInA As Integer, StartOffsetB As Integer, LengthInB As Integer)
Dim X As Integer
Dim Y As Integer
Dim z As Integer
Dim a As Integer
Dim b As Integer
Dim match As blockarray
Dim aList() As Integer
Dim bList() As Integer
Dim DistanceUp As Integer
Dim DistanceDown As Integer
Dim ARemaining As Integer
Dim BRemaining As Integer
Dim TotalDistance As Integer
Dim BestDistance As Integer
Dim AStart As Integer
Dim BStart As Integer
Dim Longest As Integer
Dim Asegment As blockarray
Dim Bsegment As blockarray

  If LengthInA < MinMatchLength Or LengthInB < MinMatchLength Then GoTo getout
  
  'ReDim Asegment.DNA(LengthInA)
  'ReDim Bsegment.DNA(LengthInB)
  
  'For x = 1 To LengthInA
  '  Asegment.DNA(x) = strand(1).DNA(x)
  'Next x
  
  'For x = 1 To LengthInB
  '  Bsegment.DNA(x) = strand(2).DNA(x)
  'Next x
 
  Asegment.DNA = strand(1).DNA
  Bsegment.DNA = strand(2).DNA
  ReDim Preserve Asegment.DNA(LengthInA)
  ReDim Preserve Bsegment.DNA(LengthInB)
 
  Longest = FindLongestMatch(Asegment, Bsegment, match.DNA)
  
  If Longest < MinMatchLength Then Exit Function ' No sequence long enough to match
  
  a = FindMatches(Asegment, match, aList)
  b = FindMatches(Bsegment, match, bList)
  
  BestDistance = 32001
  AStart = -1
  BStart = -1
  
  For Y = 1 To a
    For z = 1 To b
      DistanceUp = Abs(aList(Y) - bList(z))
      ARemaining = UBound(Asegment.DNA) - aList(Y) - Longest + 1
      BRemaining = UBound(Bsegment.DNA) - bList(z) - Longest + 1
      DistanceDown = Abs(ARemaining - BRemaining)
      
      TotalDistance = DistanceUp + DistanceDown
      If TotalDistance < BestDistance Then
        AStart = aList(Y)
        BStart = bList(z)
        BestDistance = TotalDistance
      End If
    Next z
  Next Y
  
  For X = 1 To Longest
    Matching(AStart + StartOffsetA + X - 1) = BStart + StartOffsetB + X - 1
  Next X
  
  MatchLongestSequence StartOffsetA, AStart, StartOffsetB, BStart
  MatchLongestSequence StartOffsetA + AStart + Longest, LengthInA - AStart - Longest, _
                       StartOffsetB + BStart + Longest, LengthInB - BStart - Longest

getout:
End Function

Public Function DoOneCrossOver()
Dim AtLeastOnePlace As Boolean
Dim X As Integer
Dim numOfMatches As Integer
Dim RandPlace As Integer
Dim ADown As blockarray
Dim BDown As blockarray
Dim temp As block

  AtLeastOnePlace = False
  numOfMatches = strandlen(2)
  
  For X = 1 To numOfMatches
    If Matching(X) > 0 Then
      AtLeastOnePlace = True
      GoTo Out
    End If
  Next X
Out:
  If Not AtLeastOnePlace Then Exit Function
  
  RandPlace = Random(1, numOfMatches)
  While Matching(RandPlace) = 0
    RandPlace = RandPlace + 1
    If RandPlace > numOfMatches Then RandPlace = 1
  Wend
  
  'Swap the downstream sections of the strands
  'down to end of the shorter strand
  For X = Matching(RandPlace) To strandlen(2)
    temp = strand(1).DNA(X)
    strand(1).DNA(X) = strand(2).DNA(Matching(X))
    strand(2).DNA(Matching(X)) = temp
  Next X
    
  'Swap downstreams of strands
 ' ReDim ADown.DNA(UBound(strand(1).DNA) - Matching(RandPlace))
 ' ReDim BDown.DNA(UBound(strand(2).DNA) - Matching(RandPlace))
  
 ' For x = Matching(RandPlace) To UBound(strand(1).DNA)
 '  ADown.DNA(x) = strand(1).DNA(x)
 ' Next x
 ' For x = Matching(RandPlace) To UBound(strand(2).DNA)
 '   BDown.DNA(x) = strand(2).DNA(x)
 ' Next x
 '
 ' ReDim Preserve strand(1).DNA(Matching(RandPlace) + UBound(BDown.DNA))
 ' ReDim Preserve strand(2).DNA(Matching(RandPlace) + UBound(ADown.DNA))
 '
 ' For x = Matching(RandPlace) To UBound(strand(1).DNA)
 '   strand(1).DNA(x) = BDown.DNA(x)
 ' Next x
 ' For x = Matching(RandPlace) To UBound(strand(2).DNA)
 '   strand(2).DNA(x) = ADown.DNA(x)
 ' Next x
 
End Function


Public Function Crossover(female As Integer, offspring As Integer)
Dim parent As Integer
Dim i As Integer
Dim t As Integer
Dim X As Integer
Dim NumCrossOverEvents As Integer
Dim z As Integer

  
  'Strand(1) is assumed to be as long or longer than strand(2)
  If rob(female).spermDNAlen > rob(female).DnaLen Then
    strand(1).DNA = rob(female).spermDNA
    strandlen(1) = rob(female).spermDNAlen - 1
    strand(2).DNA = rob(female).DNA
    strandlen(2) = rob(female).DnaLen - 1
    'Strip off the end base pairs.  We will add it back on the offspring DNA
    ReDim Preserve strand(1).DNA(rob(female).spermDNAlen - 1)
    ReDim Preserve strand(2).DNA(rob(female).DnaLen - 1)
    NumCrossOverEvents = CInt(rob(female).spermDNAlen) / 10
  Else
    strand(2).DNA = rob(female).spermDNA
    strandlen(2) = rob(female).spermDNAlen - 1
    strand(1).DNA = rob(female).DNA
    strandlen(1) = rob(female).DnaLen - 1
    'Strip off the end base pairs.  We will add it back on the offspring DNA
    ReDim Preserve strand(2).DNA(rob(female).spermDNAlen - 1)
    ReDim Preserve strand(1).DNA(rob(female).DnaLen - 1)
    NumCrossOverEvents = CInt(rob(female).DnaLen / 10)
  End If
  
  ReDim Matching(strandlen(2)) ' The array of matches cannot be longer than the shorter strand
  
  'Seed the Recursion
  MatchLongestSequence 0, strandlen(1), 0, strandlen(2)
  
  'ReDim rob(offspring).DNA(UBound(strand(1).DNA))
  X = FindLongestMatch(strand(1), strand(2), rob(offspring).DNA())
    
  'Do the crossover
  For X = 1 To NumCrossOverEvents
    DoOneCrossOver
  Next X
  
  'Choose one of the two strands at random
  z = Random(1, 2)
  
  'Copy the strand to the offspring
  rob(offspring).DNA = strand(z).DNA
  ReDim Preserve rob(offspring).DNA(strandlen(z) + 1)
  
  ' Add the end base pair back
  rob(offspring).DNA(strandlen(z) + 1).tipo = 10
  rob(offspring).DNA(strandlen(z) + 1).value = 1
 ' DoEvents
End Function


' hot hot: sex reproduction
' same as above, but: dna comes from two parents, is crossed-over,
' and the resulting dna is then mutated.
'Public Sub SexReproduce(robA As Integer, robB As Integer)
'  Dim perA As Integer, perB As Integer
'  Dim nrgA As Long, nrgB As Long
'  Dim bodyA As Long, bodyB As Long
'  Dim sondist As Long
'  Dim nuovo As Integer
'  Dim nnrg As Long
'  Dim nbody As Long
'  Dim nx As Long
'  Dim ny As Long
'  Dim t As Integer
'  Dim tests As Boolean
'  Dim n As Integer
'  Dim i As Integer
'
'  tests = False
'  sondist = RobSize * 1.3
'
'  If Sqr((rob(robA).pos.x - rob(robB).pos.x) ^ 2 + (rob(robA).pos.Y - rob(robB).pos.Y) ^ 2) >= RobSize * 2 Then Exit Sub
'
'  perA = rob(robA).mem(sexrepro)
'  perB = rob(robB).mem(sexrepro)
'  perA = Abs(perA) Mod 100
'  If perA = 0 Then Exit Sub
'  perB = Abs(perB) Mod 100
'  If perB = 0 Then Exit Sub
' ' If perA < 1 Then perA = 1
' ' If perA > 99 Then perA = 99
' ' If perB < 1 Then perB = 1
' ' If perB > 99 Then perB = 99
'  nrgA = (rob(robA).nrg / 100) * perA
'  nrgB = (rob(robB).nrg / 100) * perB
'  nnrg = nrgA + nrgB
'  If nnrg > 32000 Then
'    nnrg = 32000
'    nrgA = 32000 * (perA / 100)
'    nrgB = 32000 * (perB / 100)
'  End If
'  bodyA = (rob(robA).body / 100) * perA
'  bodyB = (rob(robB).body / 100) * perB
'  nbody = bodyA + bodyB
'  If nbody > 32000 Then
'    nbody = 32000
'    bodyA = 32000 * (perA / 100)
'    bodyB = 32000 * (perB / 100)
'  End If
'  rob(perA).nrg = rob(perA).nrg - rob(robA).DnaLen * 1.5
'  rob(perB).nrg = rob(perB).nrg - rob(robB).DnaLen * 1.5
'  If rob(perA).nrg > 0 And rob(perB).nrg > 0 Then
'    nx = rob(perA).pos.x + absx(rob(perA).aim, sondist, 0, 0, 0)
'    ny = rob(perA).pos.Y + absy(rob(perA).aim, sondist, 0, 0, 0)
'    'tests = tests Or simplecoll(nx, ny, n)
'    'tests = tests Or (rob(robA).Fixed And IsInSpawnArea(nx, ny))
'    If Not tests Then
'      nuovo = posto()
'      SimOpts.TotBorn = SimOpts.TotBorn + 1
'
'      ReDim rob(nuovo).DNA(100)
'
'      'Reimplement below!
'
'      'DNA is redimed inside a sub function of CrossingOver
'      'CrossingOver rob(robA).DNA, rob(robB).DNA, rob(nuovo).DNA
'
'      ScanUsedVars nuovo
'      For t = 0 To 20 ' EricL Changed from 14 to 20
'        rob(nuovo).Mutables.mutarray(t) = (rob(robA).Mutables.mutarray(t) + rob(robB).Mutables.mutarray(t)) / 2
'      Next t
'      If rob(robA).Mutables.Mutations Or rob(robB).Mutables.Mutations Then
'        rob(nuovo).Mutables.Mutations = True
'      Else
'        rob(nuovo).Mutables.Mutations = False
'      End If
'      For t = 0 To 12
'        rob(nuovo).Skin(t) = (rob(robA).Skin(t) + rob(robB).Skin(t)) / 2
'      Next t
'      Erase rob(nuovo).mem
'      Erase rob(nuovo).Ties
'      rob(nuovo).pos.x = rob(robA).pos.x + absx(rob(robA).aim, sondist, 0, 0, 0)
'      rob(nuovo).pos.Y = rob(robA).pos.Y + absy(rob(robA).aim, sondist, 0, 0, 0)
'      rob(nuovo).vel.x = rob(robA).vel.x
'      rob(nuovo).vel.Y = rob(robA).vel.Y
'      rob(nuovo).color = rob(robA).color
'      rob(nuovo).aim = rob(robA).aim + PI
'      If rob(nuovo).aim > 6.28 Then rob(nuovo).aim = rob(nuovo).aim - 2 * PI
'      rob(nuovo).aimvector = VectorSet(Cos(rob(nuovo).aim), Sin(rob(nuovo).aim))
'      rob(nuovo).mem(SetAim) = rob(nuovo).aim * 200
'      rob(nuovo).mem(468) = 32000
'      rob(nuovo).mem(480) = 32000
'      rob(nuovo).mem(481) = 32000
'      rob(nuovo).mem(482) = 32000
'      rob(nuovo).mem(483) = 32000
'      rob(nuovo).exist = True
'      rob(nuovo).Dead = False
'      rob(nuovo).generation = rob(robA).generation + 1
'      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
'      rob(nuovo).vnum = 1
'      rob(robA).nrg = rob(robA).nrg - nrgA
'      rob(robB).nrg = rob(robB).nrg - nrgB
'      rob(robA).mem(Energy) = rob(robA).nrg
'      rob(robB).mem(Energy) = rob(robB).nrg
'      rob(robA).body = rob(robA).body - bodyA
'      rob(robA).radius = FindRadius(rob(robA).body)
'      rob(robB).body = rob(robB).body - bodyB
'      rob(robB).radius = FindRadius(rob(robB).body)
'      rob(robA).mem(315) = rob(robA).body
'      rob(robB).mem(315) = rob(robB).body
'      rob(robA).SonNumber = rob(robA).SonNumber + 1
'      rob(robB).SonNumber = rob(robB).SonNumber + 1
'      rob(nuovo).nrg = nnrg
'      rob(nuovo).body = nbody
'      rob(nuovo).radius = FindRadius(rob(nuovo).body)
'      rob(nuovo).Poisoned = False
'      rob(nuovo).parent = rob(robA).AbsNum
'      rob(nuovo).FName = rob(robA).FName
'      rob(nuovo).LastOwner = rob(robA).LastOwner
'      rob(nuovo).Veg = rob(robA).Veg
'      rob(nuovo).NewMove = rob(robA).NewMove
'      rob(nuovo).Fixed = rob(robA).Fixed
'      If rob(nuovo).Fixed Then rob(nuovo).mem(216) = 1
'      rob(nuovo).Corpse = False
'      rob(nuovo).Mutations = rob(robA).Mutations
'      rob(nuovo).LastMutDetail = rob(robA).LastMutDetail
'      rob(nuovo).Shape = rob(robA).Shape
'
'      rob(nuovo).Vtimer = 0
'      rob(nuovo).virusshot = 0
'
'      'First 5 genetic memory locations happen instantly
'      'Take the values randomly from either parent
'      For i = 0 To 4
'        n = Random(1, 2)
'        rob(nuovo).mem(971 + i) = rob(n).mem(971 + i)
'      Next i
'
'      'UpdateBotBucket nuovo
'      'BucketsProximity robA
'      'BucketsProximity robB
'      'BucketsProximity nuovo
'      Mutate nuovo
'
'      'If Not CheckIntegrity(rob(nuovo).DNA) Then
'      '  'parents aren't suposed to be penalized,
'      '  'so they need to get their nrg and body back
'      '  'NOT YET IMPLEMENTED!
'      '  rob(nuovo).nrg = 0
'      'End If
'
'      makeoccurrlist nuovo
'      rob(nuovo).DnaLen = DnaLen(rob(nuovo).DNA())
'      maketie robA, nuovo, RobSize * 1.3, 90, 0
'      maketie robB, nuovo, RobSize * 1.3, 90, 0
'
'      'to prevent shock
'      rob(robA).onrg = rob(robA).nrg
'      rob(robB).onrg = rob(robB).nrg
'      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
'    End If
'  End If
'End Sub


'EricL 4/20/2006 This feature was never ported from 2.3X so implement it here
Public Function DoGeneticMemory(t As Integer)
  Dim loc As Integer ' memory location to copy from parent to offspring
  
  'Make sure the bot has a tie
  If rob(t).numties > 0 Then
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
          GoTo getout
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
       GoTo getout
    End If
  Next t
  
  If SimOpts.Dxsxconnected = False Then
    If X < rob(k).radius + smudgefactor Or X + rob(k).radius + smudgefactor > SimOpts.FieldWidth Then simplecoll = True
  End If
  
  If SimOpts.Updnconnected = False Then
    If Y < rob(k).radius + smudgefactor Or Y + rob(k).radius + smudgefactor > SimOpts.FieldHeight Then simplecoll = True
  End If
getout:
End Function

' searches a free slot in the robots array, to store a new rob
Public Function posto() As Integer
  Dim newsize As Long
  Dim t As Integer
  Dim foundone As Boolean
  Dim X As Long
  
  t = 1
  foundone = False
  While Not foundone And t <= MaxRobs
    If Not rob(t).exist Then
      foundone = True
    Else
      t = t + 1
    End If
  Wend
  
  ' t could be MaxRobs + 1
  If t > MaxRobs Then
    MaxRobs = t ' The array is fully packed.  Every slot is taken.
  End If
  
  newsize = UBound(rob())
  If MaxRobs > newsize Then 'the array is fully packed and we need more space
    newsize = newsize + 100
  '  Form1.Timer2.Enabled = False
  '  While Form1.InTimer2
  '    'Do nothing
  '  Wend
  '  Form1.SecTimer.Enabled = False
  ' Form1.Enabled = False
  '  For x = 1 To 10000000
  '  Next x
    
    'DoEvents
   ' MsgBox "About to Redim the bot array"
    ReDim Preserve rob(newsize) As robot ' Should bump the array up in increments of 500
  '  Form1.Enabled = True
  '  Form1.SecTimer.Enabled = True
  '  Form1.Timer2.Enabled = True
    'MaxRobs = t
  End If
  
  'At some point should add logic to keep the rob array below RobArrayMax for the day when bots reference other bot numbers
  'Shouldn't cause problems at the moment though.
    
    
  'If t = UBound(rob()) Then
  '  MaxRobs = MaxRobs - 1
  '  t = t - 1
  'End If
  
  posto = t
  
  'potential memory leak:  I'm not sure if VB will catch and release the dereferenced memory or not
  Dim blank As robot
  rob(posto) = blank
  
 ' MaxAbsNum = MaxAbsNum + 1
  GiveAbsNum posto
End Function

' Kill Bill
Public Sub KillRobot(n As Integer)
 Dim newsize As Long
 Dim X As Long
 
  If n = -1 Then n = robfocus
  
  If SimOpts.DBEnable Then
      AddRecord n
  End If
   
  rob(n).Fixed = False
  rob(n).View = False
  rob(n).NewMove = False
  rob(n).LastOwner = ""
  rob(n).SonNumber = 0
  rob(n).age = 0
  delallties n
  rob(n).exist = False ' do this after deleting the ties...
  UpdateBotBucket n
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
  
  rob(n).spermDNAlen = 0
  ReDim rob(n).spermDNA(0)
  
  If n = MaxRobs Then
    Dim b As Integer
    b = MaxRobs - 1
    While Not rob(b).exist And b > 1  ' EricL Loop now counts down, not up and works correctly.
      b = b - 1
    Wend
    MaxRobs = b 'b is now the last actual array element
    
    'If the number of bots is 250 less than the array size, shrink the array.  The array is still potentially sparse
    'since this only happens if the highest numbr bot happened to die.  There are probably still open slots to put new bots
    'so hopefully we shouldn't be redimming up and down all the time.
    'We take the array up in increments of 100 and down in increments of 250 so as not to grow and shrink the array in the same cycle
    newsize = UBound(rob())
    If MaxRobs + 250 < newsize And MaxRobs > 500 Then
      ' MsgBox "About to shrink the rob array"
      ' Form1.Timer2.Enabled = False
      ' While Form1.InTimer2
      '   'Do nothing
      ' Wend
      ' Form1.SecTimer.Enabled = False
      ' Form1.Enabled = False
      '        For x = 1 To 10000000
      ' Next x
       ReDim Preserve rob(newsize - 250)
      ' Form1.Enabled = True
      ' Form1.SecTimer.Enabled = True
      ' Form1.Timer2.Enabled = True
    End If
  End If
End Sub


