Attribute VB_Name = "Robots"
'Botsareus 4/2/2013 Removed old cross over code and replaced it with a working one
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
Public Const chlr As Integer = 920 'Panda 8/13/2013 The Chloroplast variable
Public Const mkchlr As Integer = 921 'Panda 8/15/2013 The add chloroplast variable
Public Const rmchlr As Integer = 922 'Panda 8/15/2013 The remove chloroplast variable
Public Const light As Integer = 923 'Botsareus 8/14/2013 A variable to let robots know how much light is available
Public Const sharechlr As Integer = 924 'Panda 08/26/2013 Share Chloroplasts between ties variable

Private Type ancestorType
  num As Long ' unique ID of ancestor
  mut As Long ' mutations this ancestor had at time next descendent was born
  sim As Long ' the sim this ancestor was born in
End Type

Private Type delgenerestore 'Botsareus 9/16/2014 A new bug fix from Billy
position As Integer
dna() As block
End Type

' robot structure
Private Type robot

  exist As Boolean        ' the robot exists?
  radius As Single
  Shape As Integer        ' shape of the robot, how many sides
  
  Veg As Boolean          ' is it a vegetable?
  NoChlr As Boolean       ' no chloroplasts?
  
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
  
  chloroplasts As Single    'Panda 8/11/2013 number of chloroplasts
  
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
  TieAngOverwrite(3) As Boolean 'Botsareus 3/22/2013 allowes program to handle tieang...tielen 1...4 as input
  TieLenOverwrite(3) As Boolean
  
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
  epimem(14) As Integer
  mem(1000) As Integer      ' memory array
  dna() As block            ' program array
  
  lastopp As Long           ' Index of last object in the focus eye.  Could be a bot or shape or something else.
  lastopptype As Integer    ' Indicates the type of lastopp.
                            ' 0 - bot
                            ' 1 - shape
                            ' 2 - edge of the playing field
  lastopppos As vector      ' the position of the closest portion of the viewed object
  
  lasttch As Long           ' Botsareus 11/26/2013 The robot who is touching our robot.
  
  AbsNum As Long            ' absolute robot number
  sim As Long               ' GUID of sim in which this bot was born
    
  'Mutation related
  Mutables As mutationprobs
   
  PointMutCycle As Long     ' Next cycle to point mutate (expressed in cycles since birth.  ie: age)
  PointMutBP As Long        ' the base pair to mutate
  Point2MutCycle As Long    ' Botsareus 12/10/2013 The new point2 cycle
  
  condnum As Integer        ' number of conditions (used for cost calculations)
  console As Consoleform    ' console object associated to the robot
  
  ' informative
  SonNumber As Integer      ' number of sons
  
  Mutations As Long         ' total mutations
  GenMut As Single          ' figure out how many mutations before the next genetic test
  OldGD As Single           ' our old genetic distance
  LastMut As Long           ' last mutations
  MutEpiReset As Double     ' how many mutations until epigenetic reset
  
  parent As Long            ' parent absolute number
  age As Long               ' age in cycles
  newage As Long            ' age this simulation
  BirthCycle As Long        ' birth cycle
  genenum As Integer        ' genes number
  generation As Integer     ' generation
  ''TODO Look at this
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
  
  tag As String * 50
  
  monitor_r As Integer
  monitor_g As Integer
  monitor_b As Integer
  
  multibot_time As Byte
  Chlr_Share_Delay As Byte
  dq As Byte
  
  delgenes() As delgenerestore  'Botsareus 9/16/2014 A new bug fix from Billy

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

'Botsareus 4/3/2013 crossover section
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Const GeneticSensitivity As Integer = 75  'Botsareus 4/9/2013 used by genetic distance graph. The higher this number, the more the robot is checked

Private Type block2
  tipo As Integer
  value As Integer
  match As Integer
End Type

Private Type block3
  nucli As Integer
  match As Integer
End Type


Private Function scanfromn(ByRef rob() As block2, ByVal n As Integer, ByRef layer As Integer)
Dim a As Integer
For a = n To UBound(rob)
    If rob(a).match <> layer Then
        scanfromn = a
        layer = rob(a).match
        Exit Function
    End If
Next
scanfromn = UBound(rob) + 1
End Function

Private Function GeneticDistance(ByRef rob1() As block3, ByRef rob2() As block3) As Single
Dim diffcount As Integer
Dim a As Integer

For a = 0 To UBound(rob1)
If rob1(a).match = 0 Then diffcount = diffcount + 1
Next

For a = 0 To UBound(rob2)
If rob2(a).match = 0 Then diffcount = diffcount + 1
Next

GeneticDistance = diffcount / (UBound(rob1) + UBound(rob2) + 2)
End Function

Private Sub simplematch(ByRef r1() As block3, ByRef r2() As block3)
Dim newmatch As Boolean
Dim inc As Integer

Dim ei1 As Integer
Dim ei2 As Integer
ei1 = UBound(r1)
ei2 = UBound(r2)

'the list of variables in r1
Dim matchlist1() As Integer
ReDim matchlist1(0)

'the list of variables in r2
Dim matchlist2() As Integer
ReDim matchlist2(0)

Dim count As Integer
count = 0

'add data to match list until letters match to each other on opposite sides
Dim loopr1 As Integer
Dim loopr2 As Integer
Dim loopold As Integer
Dim laststartmatch1 As Integer
Dim laststartmatch2 As Integer

loopr1 = 0
loopr2 = 0
laststartmatch1 = 0
laststartmatch2 = 0

Do

'keep building until both sides max out
If loopr1 > ei1 Then loopr1 = ei1
If loopr2 > ei2 Then loopr2 = ei2

    matchlist1(count) = r1(loopr1).nucli
    matchlist2(count) = r2(loopr2).nucli
    
    count = count + 1
    ReDim Preserve matchlist1(count)
    ReDim Preserve matchlist2(count)

    'does anything match
    Dim match As Boolean
    Dim matchr2 As Boolean
    match = False
    
    For loopold = 0 To count - 1
            If r2(loopr2).nucli = matchlist1(loopold) Then
                matchr2 = True
                match = True
                Exit For
            End If
            If r1(loopr1).nucli = matchlist2(loopold) Then
                matchr2 = False
                match = True
                Exit For
            End If
    Next
    
    If match Then
        If matchr2 Then
            loopr1 = loopold + laststartmatch1
        Else
            loopr2 = loopold + laststartmatch2
        End If
        
        'start matching
        
        Do
            If r2(loopr2).nucli = r1(loopr1).nucli Then
                'increment only in newmatch
                If newmatch = False Then inc = inc + 1
                newmatch = True
                r1(loopr1).match = inc
                r2(loopr2).match = inc
            Else
                newmatch = False
                'no more match
                laststartmatch1 = loopr1
                laststartmatch2 = loopr2
                loopr1 = loopr1 - 1
                loopr2 = loopr2 - 1
                Exit Do
            End If
            loopr1 = loopr1 + 1
            loopr2 = loopr2 + 1
        Loop Until loopr1 > ei1 Or loopr2 > ei2
        
        'reset match list so it will not get too long
        ReDim matchlist1(0)
        ReDim matchlist2(0)
        count = 0
    End If
    

loopr1 = loopr1 + 1
loopr2 = loopr2 + 1

Loop Until loopr1 > ei1 And loopr2 > ei2
End Sub

Public Function DoGeneticDistance(r1 As Integer, r2 As Integer) As Single
Dim t As Integer

Dim ndna1() As block3
Dim ndna2() As block3
Dim length1 As Integer
Dim length2 As Integer
length1 = UBound(rob(r1).dna)
length2 = UBound(rob(r2).dna)
ReDim ndna1(length1)
ReDim ndna2(length2)

'map to nucli

'if step is 1 then normal nucli
For t = 0 To UBound(rob(r1).dna)
 ndna1(t).nucli = DNAtoInt(rob(r1).dna(t).tipo, rob(r1).dna(t).value)
Next
For t = 0 To UBound(rob(r2).dna)
 ndna2(t).nucli = DNAtoInt(rob(r2).dna(t).tipo, rob(r2).dna(t).value)
Next
      
'Step3 Figure out genetic distance
simplematch ndna1, ndna2

DoGeneticDistance = GeneticDistance(ndna1, ndna2)
End Function

Private Sub crossover(ByRef rob1() As block2, ByRef rob2() As block2, ByRef Outdna() As block)
Dim i As Integer 'layer
Dim n1 As Integer 'start pos
Dim n2 As Integer
Dim nn As Integer
Dim res1 As Integer 'result1
Dim res2 As Integer
Dim resn As Integer
Dim upperbound As Integer
Dim a As Integer 'looper

Dim nfirst As Boolean 'is it not the first loop

Do

'diff search

n1 = res1 + resn - nn
n2 = res2 + resn - nn

'presets
i = 0
If nfirst Then
    upperbound = UBound(Outdna)
Else
    nfirst = True
    upperbound = -1
End If

res1 = scanfromn(rob1, n1, 0)
res2 = scanfromn(rob2, n2, i)


'subloop
If res1 - n1 > 0 And res2 - n2 > 0 Then 'run both sides
    If Int(Rnd * 2) = 0 Then 'which side?
        ReDim Preserve Outdna(upperbound + res1 - n1)
        For a = n1 To res1 - 1
            Outdna(upperbound + 1 + a - n1).tipo = rob1(a).tipo
            Outdna(upperbound + 1 + a - n1).value = rob1(a).value
        Next
    Else
        ReDim Preserve Outdna(upperbound + res2 - n2)
        For a = n2 To res2 - 1
            Outdna(upperbound + 1 + a - n2).tipo = rob2(a).tipo
            Outdna(upperbound + 1 + a - n2).value = rob2(a).value
        Next
    End If
ElseIf res1 - n1 > 0 Then 'run one side
    If Int(Rnd * 2) = 0 Then
        ReDim Preserve Outdna(upperbound + res1 - n1)
        For a = n1 To res1 - 1
            Outdna(upperbound + 1 + a - n1).tipo = rob1(a).tipo
            Outdna(upperbound + 1 + a - n1).value = rob1(a).value
        Next
    End If
ElseIf res2 - n2 > 0 Then 'run other side
    If Int(Rnd * 2) = 0 Then
        ReDim Preserve Outdna(upperbound + res2 - n2)
        For a = n2 To res2 - 1
            Outdna(upperbound + 1 + a - n2).tipo = rob2(a).tipo
            Outdna(upperbound + 1 + a - n2).value = rob2(a).value
        Next
    End If
End If


'same search
Dim whatside As Boolean

If i = 0 Then Exit Sub
upperbound = UBound(Outdna)
nn = res1
resn = scanfromn(rob1(), nn, i)
ReDim Preserve Outdna(upperbound + resn - nn)

whatside = Int(Rnd * 2) = 0

''''debug
'Dim debugme As Boolean
'debugme = False
'Dim k As String
'Dim temp As String
'Dim bp As block
'Dim converttosysvar As Boolean
''''debug

For a = nn To resn - 1
    Outdna(upperbound + 1 + a - nn).tipo = IIf(whatside, rob1(a).tipo, rob2(a - nn + res2).tipo) 'left hand side or right hand?
    Outdna(upperbound + 1 + a - nn).value = IIf(IIf(rob1(a).tipo = rob2(a - nn + res2).tipo And Abs(rob1(a).value) > 999 And Abs(rob2(a - nn + res2).value) > 999, Int(Rnd * 2) = 0, whatside), rob1(a).value, rob2(a - nn + res2).value)  'if typo is different or in var range then all left/right hand, else choose a random side
    'If rob1(a).tipo = rob2(a - nn + res2).tipo And Abs(rob1(a).value) > 999 And Abs(rob2(a - nn + res2).value) > 999 And rob1(a).value <> rob2(a - nn + res2).value Then debugme = True 'debug
Next

'If debugme Then
'Dim a2 As Integer
'Dim a3 As Integer
'k = ""
'      For a = nn To resn - 1
'
'        If a = UBound(rob1) Then converttosysvar = False Else converttosysvar = IIf(rob1(a + 1).tipo = 7, True, False)
'        bp.tipo = rob1(a).tipo
'        bp.value = rob1(a).value
'        temp = ""
'        Parse temp, bp, 1, converttosysvar
'
'      k = k & temp & vbTab
'
'        a2 = a - nn + res2
'        If a2 = UBound(rob2) Then converttosysvar = False Else converttosysvar = IIf(rob2(a2 + 1).tipo = 7, True, False)
'        bp.tipo = rob2(a2).tipo
'        bp.value = rob2(a2).value
'        temp = ""
'        Parse temp, bp, 1, converttosysvar
'
'      k = k & temp & vbTab
'
'        a3 = upperbound + 1 + a - nn
'        If a3 = UBound(Outdna) Then converttosysvar = False Else converttosysvar = IIf(Outdna(a3 + 1).tipo = 7, True, False)
'        bp.tipo = Outdna(a3).tipo
'        bp.value = Outdna(a3).value
'        temp = ""
'        Parse temp, bp, 1, converttosysvar
'
'      k = k & temp & vbCrLf
'
'      Next
'
'      MsgBox k
'End If

Loop

End Sub


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'End crossover section

                           
                           


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
    ' EricL 10/20/2007 Added log(bodypoints) to increase the size variation in bots.
    FindRadius = (Log(bodypoints) * bodypoints * CubicTwipPerBody * 3 * 0.25 / PI) ^ (1 / 3)
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

Private Function SetAimFunc(t As Integer) As Single 'Botsareus 6/29/2013 Turn costs and ma more accurate
  Dim diff As Single
  Dim diff2 As Single
  Dim newaim As Single
  With rob(t)
  
  diff = CSng(.mem(aimsx)) - CSng(.mem(aimdx))
   
  If .mem(SetAim) = Round(.aim * 200, 0) Then
    'Setaim is the same as .aim so nothing set into .setaim this cycle
    SetAimFunc = (.aim * 200 + diff)
  Else
    ' .setaim overrides .aimsx and .aimdx
    SetAimFunc = .mem(SetAim)          ' this is where .aim needs to be
    diff = -AngDiff(.aim, CSng(.mem(SetAim) / 200)) * 200  ' this is the diff to get there
    diff2 = Abs(Round((.aim * 200 - .mem(SetAim)) / 1256, 0) * 1256) * Sgn(diff) ' this is how much we add to momentum
  End If
  
  'diff + diff2 is now the amount, positive or negative to turn.
  .nrg = .nrg - Abs((Round((diff / 200 + diff2 / 200), 3) * SimOpts.Costs(TURNCOST) * SimOpts.Costs(COSTMULTIPLIER)))
      
  SetAimFunc = SetAimFunc Mod (1256)
  If SetAimFunc < 0 Then SetAimFunc = SetAimFunc + 1256
  SetAimFunc = SetAimFunc / 200
  
  'Overflow Protection
  While .ma > 2 * PI: .ma = .ma - 2 * PI: Wend
  While .ma < -2 * PI: .ma = .ma + 2 * PI: Wend
    
  .aim = SetAimFunc + .ma  ' Add in the angular momentum
  
  'Voluntary rotation can reduce angular momentum but does not add to it.
    
  If .ma > 0 And diff < 0 Then
    .ma = .ma + (diff + diff2) / 400
    If .ma < 0 Then .ma = 0
  End If
  If .ma < 0 And diff > 0 Then
    .ma = .ma + (diff + diff2) / 400
    If .ma > 0 Then .ma = 0
  End If
  
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

Private Sub makeshell(n As Integer)
Dim oldshell As Single
Dim Cost As Single
Dim Delta As Single
Dim shellNrgConvRate As Single

  shellNrgConvRate = 0.1 ' Make 10 shell for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake shell if nrg is negative
    oldshell = .shell
    
    If .mem(822) > 32000 Then .mem(822) = 32000
    If .mem(822) < -32000 Then .mem(822) = -32000
    
    Delta = .mem(822) ' This is what the bot wants to do to his shell, up or down
    
    If Abs(Delta) > .nrg / shellNrgConvRate Then Delta = Sgn(Delta) * .nrg / shellNrgConvRate  ' Can't make or unmake more shell than you have nrg
    
    If Abs(Delta) > 100 Then Delta = Sgn(Delta) * 100      ' Can't make or unmake more than 100 shell at a time
    If .shell + Delta > 32000 Then Delta = 32000 - .shell  ' shell can't go above 32000
    If .shell + Delta < 0 Then Delta = -.shell             ' shell can't go below 0
    
    .shell = .shell + Delta                                ' Make the change in shell
    
    .nrg = .nrg - (Abs(Delta) * shellNrgConvRate)          ' Making or unmaking shell takes nrg
    
    'This is the transaction cost
    Cost = Abs(Delta) * SimOpts.Costs(SHELLCOST) * SimOpts.Costs(COSTMULTIPLIER)
    
    If .Multibot Then
      .nrg = .nrg - Cost / (IIf(.numties < 0, 0, .numties) + 1)  'lower cost for multibot
    Else
      .nrg = .nrg - Cost
    End If
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(822) = 0                          ' reset the .mkshell sysvar
    .mem(823) = CInt(.shell)               ' update the .shell sysvar
getout:
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason .FName, .tag, "making shell"
    If Not SimOpts.F1 And .dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
  End With
End Sub

Private Sub makeslime(n As Integer)
Dim oldslime As Single
Dim Cost As Single
Dim Delta As Single
Dim slimeNrgConvRate As Single

  slimeNrgConvRate = 0.1 ' Make 10 slime for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake slime if nrg is negative
    oldslime = .Slime
    
    If .mem(820) > 32000 Then .mem(820) = 32000
    If .mem(820) < -32000 Then .mem(820) = -32000
    
    Delta = .mem(820) ' This is what the bot wants to do to his slime, up or down
    
    If Abs(Delta) > .nrg / slimeNrgConvRate Then Delta = Sgn(Delta) * .nrg / slimeNrgConvRate  ' Can't make or unmake more slime than you have nrg
    
    If Abs(Delta) > 100 Then Delta = Sgn(Delta) * 100      ' Can't make or unmake more than 100 slime at a time
    If .Slime + Delta > 32000 Then Delta = 32000 - .Slime  ' Slime can't go above 32000
    If .Slime + Delta < 0 Then Delta = -.Slime             ' Slime can't go below 0
    
    .Slime = .Slime + Delta                                ' Make the change in slime
    
    .nrg = .nrg - (Abs(Delta) * slimeNrgConvRate)          ' Making or unmaking slime takes nrg
    
    'This is the transaction cost
    Cost = Abs(Delta) * SimOpts.Costs(SLIMECOST) * SimOpts.Costs(COSTMULTIPLIER)
    
    If .Multibot Then
      .nrg = .nrg - Cost / (IIf(.numties < 0, 0, .numties) + 1) 'lower cost for multibot
    Else
      .nrg = .nrg - Cost
    End If
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(820) = 0                          ' reset the .mkslime sysvar
    .mem(821) = CInt(.Slime)                ' update the .slime sysvar
    
getout:
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason .FName, .tag, "making slime"
    If Not SimOpts.F1 And .dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
  End With
End Sub

Private Sub altzheimer(n As Integer)
'makes robots with high waste act in a bizarre fashion.
  Dim loc As Integer, val As Integer
  Dim loops As Integer
  Dim t As Integer
  loops = (rob(n).Pwaste + rob(n).Waste - SimOpts.BadWastelevel) / 4

  For t = 1 To loops
    Do 'Botsareus 9/12/2014 From Testlund waste can not change chloroplasts
     loc = Random(1, 1000)
    Loop Until loc <> mkchlr And loc <> rmchlr
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
    Cost = (.DnaLen - 1) * SimOpts.Costs(DNACYCCOST) * SimOpts.Costs(COSTMULTIPLIER)
    .nrg = .nrg - Cost
    
    'degrade slime
    .Slime = .Slime * 0.98
    If .Slime < 0.5 Then .Slime = 0 ' To keep things sane for integer rounding, etc.
    .mem(821) = CInt(.Slime)
    
    'degrade poison
    .poison = .poison * 0.98
    If .poison < 0.5 Then .poison = 0 'Botsareus 3/15/2013 bug fix for poison so it does not change slime
    .mem(827) = CInt(.poison)
    
  End With
End Sub

Public Function genelength(n As Integer, p As Integer) As Long
  'measures the length of gene p in robot n
  Dim pos As Long
 
  pos = genepos(rob(n).dna(), p)
  genelength = GeneEnd(rob(n).dna(), pos) - pos + 1
  
End Function

Private Sub BotDNAManipulation(n As Integer)
Dim Length As Long

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
       Length = genelength(n, .mem(mkvirus)) * 2
       rob(n).nrg = rob(n).nrg - Length / 2 * SimOpts.Costs(DNACOPYCOST) * SimOpts.Costs(COSTMULTIPLIER) 'Botsareus 7/20/2013 Creating a virus costs a copy cost
       If Length < 32000 Then
         .Vtimer = Length
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
       
    If rob(n).Veg Then
      totvegs = totvegs + 1
    ElseIf rob(n).Corpse Then
      totcorpse = totcorpse + 1
      If rob(n).body > 0 Then
        Decay n
      Else
        KillRobot n
      End If
    Else
      totnvegs = totnvegs + 1
    End If

End Sub

Private Sub MakeStuff(ByVal n As Integer)
   
  If rob(n).mem(824) <> 0 Then storevenom n
  If rob(n).mem(826) <> 0 Then storepoison n
  If rob(n).mem(822) <> 0 Then makeshell n
  If rob(n).mem(820) <> 0 Then makeslime n
 
End Sub

Private Sub HandleWaste(ByVal n As Integer)
    If rob(n).Waste > 0 Then feedveg2 n 'Botsareus 8/25/2013 Mod to effect all robots
    If SimOpts.BadWastelevel = 0 Then SimOpts.BadWastelevel = 400
    If SimOpts.BadWastelevel > 0 And rob(n).Pwaste + rob(n).Waste > SimOpts.BadWastelevel Then altzheimer n
    If rob(n).Waste > 32000 Then defacate n
    If rob(n).Pwaste > 32000 Then rob(n).Pwaste = 32000
    If rob(n).Waste < 0 Then rob(n).Waste = 0
    rob(n).mem(828) = rob(n).Waste
    rob(n).mem(829) = rob(n).Pwaste
 
End Sub

Private Sub Ageing(ByVal n As Integer)
  Dim tempAge As Long ' EricL 4/13/2006 Added this to allow age to grow beyond 32000

    'aging
    rob(n).age = rob(n).age + 1
    rob(n).newage = rob(n).newage + 1 'Age this simulation to be used by tie code
    tempAge = rob(n).age
    If tempAge > 32000 Then tempAge = 32000
    rob(n).mem(robage) = CInt(tempAge)        'line added to copy robots age into a memory location
    rob(n).mem(timersys) = rob(n).mem(timersys) + 1 'update epigenetic timer
    If rob(n).mem(timersys) > 32000 Then rob(n).mem(timersys) = -32000

End Sub

Private Sub Shooting(ByVal n As Integer)
  'shooting
  If rob(n).mem(shoot) Then robshoot n
  rob(n).mem(shoot) = 0
End Sub

Private Sub ManageChlr(ByVal n As Integer) 'Panda 8/15/2013 The new chloroplast function
    If rob(n).mem(mkchlr) > 0 Or rob(n).mem(rmchlr) > 0 Then ChangeChlr n
    
    rob(n).chloroplasts = rob(n).chloroplasts - 0.05 'From Panda 8/22/2014 Robots slowly lose chloroplasts
    
    If rob(n).chloroplasts > 32000 Then rob(n).chloroplasts = 32000
    If rob(n).chloroplasts < 0 Then rob(n).chloroplasts = 0 'Panda 9/5/2013 Bug fix
    
    rob(n).mem(chlr) = rob(n).chloroplasts
    
    rob(n).mem(light) = 32000 - (LightAval * 32000) 'Botsareus 8/24/2013 Tells the robot how much light is aval. (I want this here because it is chloroplast related)
    
End Sub


Private Sub ChangeChlr(t As Integer) 'Panda 8/15/2013 change the number of chloroplasts
With rob(t)
 
  Dim tmpchlr As Single 'Botsareus 8/24/2013 used to charge energy for adding chloroplasts
  tmpchlr = .chloroplasts
  
  'add chloroplasts
  .chloroplasts = .chloroplasts + .mem(mkchlr)
  
  'remove chloroplasts
  .chloroplasts = .chloroplasts - .mem(rmchlr)
  
  If tmpchlr < .chloroplasts Then
  
    If TotalChlr > SimOpts.MaxPopulation And .Veg = True Then 'Botsareus 12/3/2013 Attempt to stop vegy spikes
      .chloroplasts = tmpchlr
    Else
     .nrg = .nrg - (.chloroplasts - tmpchlr) * SimOpts.Costs(CHLRCOST) * SimOpts.Costs(COSTMULTIPLIER) 'Botsareus 8/24/2013 only charge energy for adding chloroplasts to prevent robots from cheating by adding and subtracting there chlroplasts in 3 cycles
    End If
    
  End If
  rob(t).mem(mkchlr) = 0
  rob(t).mem(rmchlr) = 0
  
End With
  
End Sub

Private Sub ManageBody(ByVal n As Integer)

  'body management
  rob(n).obody = rob(n).body      'replaces routine above
    
  If rob(n).mem(strbody) > 0 Then storebody n
  If rob(n).mem(fdbody) > 0 Then feedbody n
  
  If rob(n).body > 32000 Then rob(n).body = 32000
  If rob(n).body < 0 Then rob(n).body = 0   'Ericl 4/6/2006 Overflow protection.
  rob(n).mem(body) = CInt(rob(n).body)
  
  'rob(n).radius = FindRadius(rob(n).body)
  
End Sub

Private Sub Shock(ByVal n As Integer)

  'shock code:
  'later make the shock threshold based on body and age
  If Not rob(n).Veg And rob(n).nrg > 3000 Then
    Dim temp As Double
    temp = rob(n).onrg - rob(n).nrg
    If temp > (rob(n).onrg / 2) Then
      rob(n).nrg = 0
      rob(n).body = rob(n).body + (rob(n).nrg / 10)
      If rob(n).body > 32000 Then rob(n).body = 32000
      rob(n).radius = FindRadius(rob(n).body)
    End If
  End If

End Sub

Private Sub ManageDeath(ByVal n As Integer)
  Dim i As Integer
  With rob(n)
  
  'We kill bots with nrg of body less than 0.5 rather than 0 to avoid rounding issues with refvars and such
  'showing extant bots with nrg or body of 0.
    
  If SimOpts.CorpseEnabled Then
    If Not .Corpse Then
      If (.nrg < 15) And .age > 0 Then 'Botsareus 1/5/2013 Corpse forms more often
        .Corpse = True
        .FName = "Corpse"
      '  delallties n
        Erase .occurr
        .color = vbWhite
        .Veg = False
        .Fixed = False
        .nrg = 0
        .DisableDNA = True
        .DisableMovementSysvars = True
        .CantSee = True
        .VirusImmune = True
        .chloroplasts = 0 'Botsareus 11/10/2013 Reset chloroplasts for corpse
                
        'Zero out the eyes
        For i = (EyeStart + 1) To (EyeEnd - 1)
          .mem(i) = 0
        Next i
        .Bouyancy = 0 'Botsareus 2/2/2013 dead robot no bouy.
      End If
    End If
    If .body < 0.5 Then .Dead = True 'Botsareus 6/9/2013 Small bug fix to kill robots with zero body
  ElseIf (.nrg < 0.5 Or .body < 0.5) Then .Dead = True
  End If
  
  If .Dead Then
    kil(kl) = n
    kl = kl + 1
  End If
  End With
End Sub

Private Sub ManageBouyancy(ByVal n As Integer) 'Botsareus 2/2/2013 Bouyancy fix 'Botsareus 11/23/2013 More mods, more old school now
  With rob(n)
    If .mem(setboy) <> 0 Then
     .Bouyancy = .Bouyancy + .mem(setboy) / 32000
     If .Bouyancy < 0 Then .Bouyancy = 0
     If .Bouyancy > 1 Then .Bouyancy = 1
     .mem(rdboy) = .Bouyancy * 32000
     .mem(setboy) = 0
    End If
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
Private Sub ManageReproduction(ByVal n As Integer)
   
  'Decrement the fertilization counter
  If rob(n).fertilized >= 0 Then ' This is >= 0 so that we decrement it to -1 the cycle after the last birth is possible
    rob(n).fertilized = rob(n).fertilized - 1
    If rob(n).fertilized >= 0 Then
      rob(n).mem(SYSFERTILIZED) = rob(n).fertilized
    Else
      rob(n).mem(SYSFERTILIZED) = 0
    End If
  Else
    'new code here to block sex repro
    If rob(n).fertilized < -10 Then
        rob(n).fertilized = rob(n).fertilized + 1
    Else
        If rob(n).fertilized = -1 Then  ' Safe now to delete the spermDNA
          ReDim rob(n).spermDNA(0)
          rob(n).spermDNAlen = 0
        End If
        rob(n).fertilized = -2  'This is so we don't keep reDiming every time through
    End If
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

Private Sub FireTies(ByVal n As Integer)
  Dim Length As Single, maxLength As Single
  Dim resetlastopp As Boolean 'Botsareus 8/26/2012 only if lastopp is zero, this will reset it back to zero
  
  With rob(n)
  
  If .lastopp = 0 And (.age < 2) And .parent <= UBound(rob) Then 'Botsareus 8/31/2012 new way to calculate lastopp overwrite: blind ties to parent
   If rob(.parent).exist Then
    .lastopp = .parent
    resetlastopp = True
   End If
  End If
  
  'Botsareus 11/26/2013 The tie by touch code
  If .lastopp = 0 And .lasttch <> 0 And .lasttch <= UBound(rob) Then
   If rob(.lasttch).exist Then
    .lastopp = .lasttch
    resetlastopp = True
   End If
  End If
  
  
  If .mem(mtie) <> 0 Then
    If .lastopp > 0 And Not SimOpts.DisableTies And (.lastopptype = 0) Then
      
      '2 robot lengths
      Length = VectorMagnitude(VectorSub(rob(.lastopp).pos, .pos))
      maxLength = RobSize * 4# + rob(n).radius + rob(rob(n).lastopp).radius
      
      If Length <= maxLength Then
        'maketie auto deletes existing ties for you
        maketie n, rob(n).lastopp, rob(n).radius + rob(rob(n).lastopp).radius + RobSize * 2, -20, rob(n).mem(mtie)
        'Botsareus 3/14/2014 Disqualify
        If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason rob(n).FName, rob(n).tag, "making a tie"
        If Not SimOpts.F1 And rob(n).dq = 1 And Disqualify = 2 Then rob(n).Dead = True  'safe kill robot
      End If
      
    End If
    .mem(mtie) = 0
  End If
  
  If resetlastopp Then .lastopp = 0 'Botsareus 8/26/2012 reset lastopp to zero
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
  'PopulationLastCycle = totnvegsDisplayed Botsareus 8/4/2014 Trying to save on memory by removing pointless defenitions
  TotalRobotsDisplayed = TotalRobots
  TotalRobots = 0
  totnvegsDisplayed = totnvegs
  totnvegs = 0
  totvegsDisplayed = totvegs
  totvegs = 0
  
  If ContestMode Then
    F1count = F1count + 1
    If F1count = SampFreq Then Countpop
  End If
  
  'Need to do this first as NetForces can update bots later in the loop
  For t = 1 To MaxRobs
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
      If numTeleporters > 0 Then CheckTeleporters t
    End If
  Next t
  
  
  'Only calculate mass due to fuild displacement if the sim medium has density.
  If SimOpts.Density <> 0 Then
    For t = 1 To MaxRobs
      If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then AddedMass t
    Next t
  End If
  
  'Botsareus 8/23/2014 Lets figure out tidal force
    If TmpOpts.Tides = 0 Then
        BouyancyScaling = 1
    Else
        BouyancyScaling = (1 + Sin((SimOpts.TotRunCycle Mod TmpOpts.Tides) / SimOpts.Tides * PI * 2 + PI / 2)) / 2
        BouyancyScaling = Sqr(BouyancyScaling)
        SimOpts.Ygravity = 0.01 + (1 - BouyancyScaling)
        SimOpts.PhysBrown = IIf(BouyancyScaling > 0.8, 10, 0)
    End If
  
  'this loops is for pre update
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
      If (rob(t).Corpse = False) Then Upkeep t ' No upkeep costs if you are dead!
      If ((rob(t).Corpse = False) And (rob(t).DisableDNA = False)) Then Poisons t
      If Not SimOpts.DisableFixing Then ManageFixed t 'Botsareus 8/5/2014 Call function only if allowed
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
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then UpdateCounters t ' Counts the number of bots and decays body...
  Next t
  
  DoEvents
  
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
     
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
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
  
  'Botsareus 4/17/2013 Prevent big birthas Replaced with chloroplasts check later, chloroplasts must be less then 1/2 of body for check to happen
  For t = 1 To MaxRobs
   If rob(t).chloroplasts < rob(t).body / 2 Or rob(t).Kills > 5 Then 'Bug fix here to prevent huge killer vegys
    If rob(t).exist And rob(t).body > bodyfix Then KillRobot t
   End If
  Next
    
  For t = 1 To MaxRobs
    If t Mod 250 = 0 Then DoEvents
    UpdateTieAngles t                ' Updates .tielen and .tieang.  Have to do this here after all bot movement happens above.
  
    If Not rob(t).Corpse And Not rob(t).DisableDNA And rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
      Mutate t
      MakeStuff t
      HandleWaste t
      Shooting t
      If Not rob(t).NoChlr Then ManageChlr t 'Botsareus 3/28/2014 Disable Chloroplasts
      ManageBody t
      Shock t
      ManageBouyancy t
      ManageReproduction t
      WriteSenses t
      FireTies t
    End If
    If Not rob(t).Corpse And rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
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
  If totnvegs = 0 And SimOpts.Restart And Not SimOpts.F1 Then 'Botsareus 6/11/2013 Using SimOpts instead of raw RestartMode
  ' totnvegs = 1
  ' Contests = Contests + 1
    ReStarts = ReStarts + 1
  ' Form1.StartSimul
    StartAnotherRound = True
  End If
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
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1))
    End If
  
    If multiplier > 4 Then
      Cost = multiplier * SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER)
      multiplier = Log(multiplier / 2) / Log(2)
    ElseIf valmode = True Then
      multiplier = 1
      Cost = (SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1)) 'Botsareus 6/12/2014 Bug fix
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
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason rob(n).FName, rob(n).tag, "firing an info shot"
    If Not SimOpts.F1 And rob(n).dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
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
    EnergyLost = value + SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1)
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
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1)
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
    EnergyLost = SimOpts.Costs(SHOTCOST) * SimOpts.Costs(COSTMULTIPLIER) / (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1)
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
      value = 10 + (rob(n).body / 2) * (IIf(rob(n).numties < 0, 0, rob(n).numties) + 1)
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

Public Sub sharechloroplasts(t As Integer, k As Integer) 'Panda 8/31/2013 code to share chloroplasts
  Dim totchlr As Single
  With rob(t)
  
  If DoGeneticDistance(t, .Ties(k).pnt) > 0.25 Then
    .Chlr_Share_Delay = 8
    Exit Sub
  End If
  
    If .mem(sharechlr) > 99 Then .mem(sharechlr) = 99
    If .mem(sharechlr) < 0 Then .mem(sharechlr) = 0
    totchlr = .chloroplasts + rob(.Ties(k).pnt).chloroplasts
    
    If totchlr * (CSng(.mem(sharechlr)) / 100#) < 32000 Then
      .chloroplasts = totchlr * (CSng(.mem(sharechlr)) / 100#)
    Else
      .chloroplasts = 32000
    End If
    
    If totchlr * ((100# - CSng(.mem(sharechlr))) / 100#) < 32000 Then
      rob(.Ties(k).pnt).chloroplasts = totchlr * ((100 - CSng(.mem(sharechlr))) / 100#)
    Else
      rob(.Ties(k).pnt).chloroplasts = 32000
    End If
  End With
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

'Robot n converts some of his energy to venom
Public Sub storevenom(n As Integer)
  Dim Cost As Single
  Dim Delta As Single
  Dim venomNrgConvRate As Single

  venomNrgConvRate = 1 ' Make 1 venom for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake venom if nrg is negative
     
    If .mem(824) > 32000 Then .mem(824) = 32000
    If .mem(824) < -32000 Then .mem(824) = -32000
    
    Delta = .mem(824) ' This is what the bot wants to do to his venom, up or down
    
    If Abs(Delta) > .nrg / venomNrgConvRate Then Delta = Sgn(Delta) * .nrg / venomNrgConvRate  ' Can't make or unmake more venom than you have nrg
    
    If Abs(Delta) > 100 Then Delta = Sgn(Delta) * 100      ' Can't make or unmake more than 100 venom at a time
    If .venom + Delta > 32000 Then Delta = 32000 - .venom  ' venom can't go above 32000
    If .venom + Delta < 0 Then Delta = -.venom             ' venom can't go below 0
    
    .venom = .venom + Delta                                ' Make the change in venom
    .nrg = .nrg - (Abs(Delta) * venomNrgConvRate)          ' Making or unmaking venom takes nrg
    
    'This is the transaction cost
    Cost = Abs(Delta) * SimOpts.Costs(VENOMCOST) * SimOpts.Costs(COSTMULTIPLIER)
   
    .nrg = .nrg - Cost
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(824) = 0                          ' reset the .mkvenom sysvar
    .mem(825) = Int(.venom)               ' update the .venom sysvar
getout:
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason .FName, .tag, "making venom"
    If Not SimOpts.F1 And .dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
  End With
End Sub
' Robot n converts some of his energy to poison
Public Sub storepoison(n As Integer)
  Dim Cost As Single
  Dim Delta As Single
  Dim poisonNrgConvRate As Single

  poisonNrgConvRate = 1 ' Make 1 poison for 1 nrg

  With rob(n)
    If .nrg <= 0 Then GoTo getout ' Can't make or unmake poison if nrg is negative
     
    If .mem(826) > 32000 Then .mem(826) = 32000
    If .mem(826) < -32000 Then .mem(826) = -32000
    
    Delta = .mem(826) ' This is what the bot wants to do to his poison, up or down
    
    If Abs(Delta) > .nrg / poisonNrgConvRate Then Delta = Sgn(Delta) * .nrg / poisonNrgConvRate  ' Can't make or unmake more poison than you have nrg
    
    If Abs(Delta) > 100 Then Delta = Sgn(Delta) * 100        ' Can't make or unmake more than 100 poison at a time
    If .poison + Delta > 32000 Then Delta = 32000 - .poison  ' poison can't go above 32000
    If .poison + Delta < 0 Then Delta = -.poison             ' poison can't go below 0
    
    .poison = .poison + Delta                                ' Make the change in poison
    .nrg = .nrg - (Abs(Delta) * poisonNrgConvRate)           ' Making or unmaking poison takes nrg
    
    'This is the transaction cost
    Cost = Abs(Delta) * SimOpts.Costs(POISONCOST) * SimOpts.Costs(COSTMULTIPLIER)
   
    .nrg = .nrg - Cost
    
    .Waste = .Waste + Cost                 ' waste is created proportional to the transaction cost
    
    .mem(826) = 0                          ' reset the .mkpoison sysvar
    .mem(827) = CInt(.poison)              ' update the .poison sysvar
getout:
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason .FName, .tag, "making poison"
    If Not SimOpts.F1 And .dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
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
If reprofix Then If per < 3 Then rob(n).Dead = True 'Botsareus 4/27/2013 kill 8/26/2014 greedy robots

If rob(n).body < 5 Then Exit Sub 'Botsareus 3/27/2014 An attempt to prevent 'robot bursts'

If SimOpts.DisableTypArepro And rob(n).Veg = False Then Exit Sub
  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Single, nwaste As Single, npwaste As Single, nchloroplasts As Single  'Botsareus 8/24/2013 nchloroplasts
  Dim nbody As Integer
  Dim nx As Long
  Dim ny As Long
  Dim t As Integer
  Dim tests As Boolean
  tests = False
  Dim i As Integer
  Dim tempnrg As Single
  
  
  If n = -1 Then n = robfocus
  
  If rob(n).body <= 2 Or rob(n).CantReproduce Then GoTo getout 'bot is too small to reproduce
  
  'attempt to stop veg overpopulation but will it work?
  If rob(n).Veg = True And (TotalChlr > SimOpts.MaxPopulation Or totvegsDisplayed < 0) Then GoTo getout 'Panda 8/23/2013 Based on TotalChlr now
 
  ' If we got here and it's a veg, then we are below the reproduction threshold.  Let a random 10% of the veggis reproduce
  ' so as to avoid all the veggies reproducing on the same cycle.  This adds some randomness
  ' so as to avoid giving preference to veggies with lower bot array numbers.  If the veggy population is below 90% of the threshold
  ' then let them all reproduce.
  If rob(n).Veg = True And (Random(0, 10) <> 5) And (TotalChlr > (SimOpts.MaxPopulation * 0.9)) Then GoTo getout 'Panda 8/23/2013 Based on TotalChlr now
  If totvegsDisplayed = -1 Then GoTo getout ' no veggies can reproduce on the first cycle after the sim is restarted.

  per = per Mod 100 ' per should never be <=0 as this is checked in ManageReproduction()
  If per <= 0 Then GoTo getout
  sondist = FindRadius(rob(n).body * (per / 100)) + FindRadius(rob(n).body * ((100 - per) / 100))
  
  nnrg = (rob(n).nrg / 100#) * CSng(per)
  nbody = (rob(n).body / 100#) * CSng(per)
  'rob(n).nrg = rob(n).nrg - DNALength(n) * 3
  
  tempnrg = rob(n).nrg
  If tempnrg > 0 Then
    nx = rob(n).pos.X + absx(rob(n).aim, sondist, 0, 0, 0)
    ny = rob(n).pos.Y + absy(rob(n).aim, sondist, 0, 0, 0)
    tests = tests Or simplecoll(nx, ny, n)
    tests = tests Or Not rob(n).exist 'Botsareus 6/4/2014 Can not reproduce from a dead robot
    'tests = tests Or (rob(n).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
  '    If MaxRobs = 500 Then MsgBox "Maxrobs = 500 in Reproduce, about to call posto"
      nuovo = posto()
      
      SimOpts.TotBorn = SimOpts.TotBorn + 1
      If rob(n).Veg Then totvegs = totvegs + 1
      ReDim rob(nuovo).dna(UBound(rob(n).dna))
      For t = 1 To UBound(rob(nuovo).dna)
        rob(nuovo).dna(t) = rob(n).dna(t)
      Next t
      
      rob(nuovo).delgenes = rob(n).delgenes
        
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
'      rob(nuovo).mem(480) = 32000 Botsareus 2/21/2013 Broken
'      rob(nuovo).mem(481) = 32000
'      rob(nuovo).mem(482) = 32000
'      rob(nuovo).mem(483) = 32000
      rob(nuovo).Corpse = False
      rob(nuovo).Dead = False
      rob(nuovo).NewMove = rob(n).NewMove
      rob(nuovo).generation = rob(n).generation + 1
      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
      rob(nuovo).vnum = 1
      
      nnrg = (rob(n).nrg / 100#) * CSng(per)
      nwaste = rob(n).Waste / 100# * CSng(per)
      npwaste = rob(n).Pwaste / 100# * CSng(per)
      nchloroplasts = (rob(n).chloroplasts / 100#) * CSng(per) 'Panda 8/23/2013 Distribute the chloroplasts
      
      rob(n).nrg = rob(n).nrg - nnrg - (nnrg * 0.001) ' Make reproduction cost 0.1% of nrg transfer
      rob(n).Waste = rob(n).Waste - nwaste
      rob(n).Pwaste = rob(n).Pwaste - npwaste
      rob(n).body = rob(n).body - nbody
      rob(n).radius = FindRadius(rob(n).body)
      rob(n).chloroplasts = rob(n).chloroplasts - nchloroplasts 'Panda 8/23/2013 Distribute the chloroplasts
      
      rob(nuovo).chloroplasts = nchloroplasts 'Panda 8/23/2013 Distribute the chloroplasts
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
      rob(nuovo).NoChlr = rob(n).NoChlr 'Botsareus 3/28/2014 Disable chloroplasts
      rob(nuovo).Fixed = rob(n).Fixed
      rob(nuovo).CantSee = rob(n).CantSee
      rob(nuovo).DisableDNA = rob(n).DisableDNA
      rob(nuovo).DisableMovementSysvars = rob(n).DisableMovementSysvars
      rob(nuovo).CantReproduce = rob(n).CantReproduce
      rob(nuovo).VirusImmune = rob(n).VirusImmune
      If rob(nuovo).Fixed Then rob(nuovo).mem(Fixed) = 1
      rob(nuovo).Shape = rob(n).Shape
      rob(nuovo).SubSpecies = rob(n).SubSpecies
      
      'Botsareus 4/9/2013 we need to copy some variables for genetic distance
      rob(nuovo).OldGD = rob(n).OldGD
      rob(nuovo).GenMut = rob(n).GenMut
      'Botsareus 1/29/2014 Copy the tag
      rob(nuovo).tag = rob(n).tag
      'Botsareus 7/22/2014 Both robots should have same boyancy
      rob(nuovo).Bouyancy = rob(n).Bouyancy
      
      'Botsareus 7/29/2014 New kill restrictions
      If rob(n).multibot_time > 0 Then rob(nuovo).multibot_time = rob(n).multibot_time / 2 + 2
      rob(nuovo).dq = rob(n).dq
    
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
      'The other 15 genetic memory locations are stored now but can be used later
      For i = 0 To 14
        rob(nuovo).epimem(i) = rob(n).mem(976 + i)
      Next i
      'Erase parents genetic memory now to prevent him from completing his own transfer by using his kid
      For i = 0 To 14
        rob(n).epimem(i) = 0
      Next i
      
      'Botsareus 12/17/2013 Delta2
      If Delta2 Then
        With rob(nuovo)
            Dim MratesMax As Long
            MratesMax = IIf(NormMut, CLng(.DnaLen) * CLng(valMaxNormMut), 2000000000)
            'dynamic mutation overload correction
            Dim dmoc As Double
            dmoc = 1 + (rob(nuovo).DnaLen - curr_dna_size) / 500
            If Not y_normsize Or (x_restartmode < 4) Then dmoc = 1
            'zerobot stabilization
            If x_restartmode = 7 Or x_restartmode = 8 Then
                If .FName = "Mutate.txt" Then
                    'normalize child
                    .Mutables.mutarray(PointUP) = .Mutables.mutarray(PointUP) * 1.75
                    If .Mutables.mutarray(PointUP) > MratesMax Then .Mutables.mutarray(PointUP) = MratesMax
                    .Mutables.mutarray(P2UP) = .Mutables.mutarray(P2UP) * 1.75
                    If .Mutables.mutarray(P2UP) > MratesMax Then .Mutables.mutarray(P2UP) = MratesMax
                End If
            End If
            '
            Dim mrep As Byte
            For mrep = 0 To (Int(3 * Rnd) + 1) * -(rob(n).mem(mrepro) > 0)   '2x to 4x
                For t = 1 To 10
                 If t = 9 Then GoTo skip 'ignore PM2 mutation here
                 If .Mutables.mutarray(t) < 1 Then GoTo skip 'Botsareus 1/3/2014 if mutation off then skip it
                 If Rnd < DeltaMainChance / 100 Then
                    If DeltaMainExp <> 0 Then
                        '
                        If (t = CopyErrorUP Or t = TranslocationUP Or t = ReversalUP Or t = CE2UP) Then
                          .Mutables.mutarray(t) = .Mutables.mutarray(t) * (dmoc + 2) / 3
                        Else
                          If Not (t = MinorDeletionUP Or t = MajorDeletionUP) Then .Mutables.mutarray(t) = .Mutables.mutarray(t) * dmoc 'dynamic mutation overload correction
                        End If
                        '
                        .Mutables.mutarray(t) = .Mutables.mutarray(t) * 10 ^ ((Rnd * 2 - 1) / DeltaMainExp)
                    End If
                  .Mutables.mutarray(t) = .Mutables.mutarray(t) + (Rnd * 2 - 1) * DeltaMainLn
                  If .Mutables.mutarray(t) < 1 Then .Mutables.mutarray(t) = 1
                  If .Mutables.mutarray(t) > MratesMax Then .Mutables.mutarray(t) = MratesMax
                 End If
                 If Rnd < DeltaDevChance / 100 Then
                  If DeltaDevExp <> 0 Then .Mutables.StdDev(t) = .Mutables.StdDev(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
                  .Mutables.StdDev(t) = .Mutables.StdDev(t) + (Rnd * 2 - 1) * DeltaDevLn
                  If DeltaDevExp <> 0 Then .Mutables.Mean(t) = .Mutables.Mean(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
                  .Mutables.Mean(t) = .Mutables.Mean(t) + (Rnd * 2 - 1) * DeltaDevLn
                  'Max range is always 0 to 800
                  If .Mutables.StdDev(t) < 0 Then .Mutables.StdDev(t) = 0
                  If .Mutables.StdDev(t) > 200 Then .Mutables.StdDev(t) = 200
                  If .Mutables.Mean(t) < 1 Then .Mutables.Mean(t) = 1
                  If .Mutables.Mean(t) > 400 Then .Mutables.Mean(t) = 400
                 End If
skip:
                Next
                .Mutables.CopyErrorWhatToChange = .Mutables.CopyErrorWhatToChange + (Rnd * 2 - 1) * DeltaWTC
                If .Mutables.CopyErrorWhatToChange < 0 Then .Mutables.CopyErrorWhatToChange = 0
                If .Mutables.CopyErrorWhatToChange > 100 Then .Mutables.CopyErrorWhatToChange = 100
                Mutate nuovo, True
            Next
        End With
      Else
      
      
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
        
      End If
      
      makeoccurrlist nuovo
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).dna())
      rob(nuovo).genenum = CountGenes(rob(nuovo).dna())
      rob(nuovo).mem(DnaLenSys) = rob(nuovo).DnaLen
      rob(nuovo).mem(GenesSys) = rob(nuovo).genenum

      maketie n, nuovo, sondist, 100, 0 'birth ties last 100 cycles
      rob(n).onrg = rob(n).nrg 'saves parent from dying from shock after giving birth
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
      rob(nuovo).mem(timersys) = rob(n).mem(timersys) 'epigenetic timer
      
      'A little hack here to remain in control of reproduced robots
      If MDIForm1.pbOn.Checked Then
        If n = robfocus Or rob(n).highlight Then rob(nuovo).highlight = True
      End If
                
      'Successfully reproduced
      rob(n).mem(Repro) = 0
      rob(n).mem(mrepro) = 0
            
      'Botsareus 11/29/2013 Reset epigenetic memory
      If epireset Then
       rob(nuovo).MutEpiReset = rob(n).MutEpiReset + rob(nuovo).LastMut ^ epiresetemp
       If rob(nuovo).MutEpiReset > epiresetOP And rob(n).MutEpiReset > 0 Then
         rob(nuovo).MutEpiReset = 0
         For i = 0 To 4
          rob(nuovo).mem(971 + i) = 0
         Next i
         For i = 0 To 14
          rob(nuovo).epimem(i) = 0
         Next i
       End If
      End If
      
      rob(n).nrg = rob(n).nrg - rob(n).DnaLen * SimOpts.Costs(DNACOPYCOST) * SimOpts.Costs(COSTMULTIPLIER) 'Botsareus 7/7/2013 Reproduction DNACOPY cost
      If rob(n).nrg < 0 Then rob(n).nrg = 0
    End If
  End If
getout:
End Sub


' New Sexual Reproduction routine from EricL Jan 2008  -Botsareus 4/2/2013 Sexrepro fix
Public Function SexReproduce(female As Integer)
If reprofix Then If rob(female).mem(SEXREPRO) < 3 Then rob(female).Dead = True 'Botsareus 4/27/2013 kill 8/26/2014 greedy robots

If rob(female).body < 5 Then Exit Function 'Botsareus 3/27/2014 An attempt to prevent 'robot bursts'

  Dim sondist As Long
  Dim nuovo As Integer
  Dim nnrg As Single, nwaste As Single, npwaste As Single, nchloroplasts As Single   'Botsareus 8/24/2013 nchloroplasts
  Dim nbody As Integer
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
  If rob(female).Veg = True And (TotalChlr > SimOpts.MaxPopulation Or totvegsDisplayed < 0) Then Exit Function  'Panda 8/23/2013 Based on TotalChlr now
 
  ' If we got here and the female is a veg, then we are below the reproduction threshold.  Let a random 10% of the veggis reproduce
  ' so as to avoid all the veggies reproducing on the same cycle.  This adds some randomness
  ' so as to avoid giving preference to veggies with lower bot array numbers.  If the veggy population is below 90% of the threshold
  ' then let them all reproduce.
  If rob(female).Veg = True And (Random(0, 9) <> 5) And (TotalChlr > (SimOpts.MaxPopulation * 0.9)) Then Exit Function 'Panda 8/23/2013 Based on TotalChlr now
  If totvegsDisplayed = -1 Then Exit Function ' no veggies can reproduce on the first cycle after the sim is restarted.

  per = per Mod 100 ' per should never be <=0 as this is checked in ManageReproduction()
  If per <= 0 Then Exit Function ' Can't give 100% or 0% of resources to offspring
  sondist = FindRadius(rob(female).body * (per / 100)) + FindRadius(rob(female).body * ((100 - per) / 100))
  
  nnrg = (rob(female).nrg / 100#) * CSng(per)
  nbody = (rob(female).body / 100#) * CSng(per)
  
  tempnrg = rob(female).nrg
  If tempnrg > 0 Then
    nx = rob(female).pos.X + absx(rob(female).aim, sondist, 0, 0, 0)
    ny = rob(female).pos.Y + absy(rob(female).aim, sondist, 0, 0, 0)
    tests = tests Or simplecoll(nx, ny, female)
    tests = tests Or Not rob(female).exist 'Botsareus 6/4/2014 Can not reproduce from a dead robot
    'tests = tests Or (rob(n).Fixed And IsInSpawnArea(nx, ny))
    If Not tests Then
    
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason rob(female).FName, rob(female).tag, "attempting to reproduce sexually"
    If Not SimOpts.F1 And rob(female).dq = 1 And Disqualify = 2 Then
        rob(female).Dead = True 'safe kill robot
        GoTo getout
    End If
      'Do the crossover.  The sperm DNA is on the mom's bot structure
      'Botsareus 4/2/2013 Crossover fix
      'Botsareus 5/24/2014 Crossover fix
      
      'Step1 Copy both dnas into block2
      
      Dim dna1() As block2
      Dim dna2() As block2

      ReDim dna1(UBound(rob(female).dna))
      For t = 0 To UBound(dna1)
       dna1(t).tipo = rob(female).dna(t).tipo
       dna1(t).value = rob(female).dna(t).value
      Next
      
      ReDim dna2(UBound(rob(female).spermDNA))
      For t = 0 To UBound(dna2)
       dna2(t).tipo = rob(female).spermDNA(t).tipo
       dna2(t).value = rob(female).spermDNA(t).value
      Next
      
      'Step2 map nucli
        
        Dim ndna1() As block3
        Dim ndna2() As block3
        Dim length1 As Integer
        Dim length2 As Integer
        length1 = UBound(dna1)
        length2 = UBound(dna2)
        ReDim ndna1(length1)
        ReDim ndna2(length2)
        
        'map to nucli
      
            For t = 0 To UBound(dna1)
             ndna1(t).nucli = DNAtoInt(dna1(t).tipo, dna1(t).value)
            Next
            For t = 0 To UBound(dna2)
             ndna2(t).nucli = DNAtoInt(dna2(t).tipo, dna2(t).value)
            Next

      'Step3 Check longest sequences

      simplematch ndna1, ndna2
      
      'If robot is too unsimiler then do not reproduce and block sex reproduction for 8 cycles
      
      If GeneticDistance(ndna1, ndna2) > 0.6 Then
        rob(female).fertilized = -18
        Exit Function
      End If
      
      'Step4 map back
      
        For t = 0 To UBound(dna1)
            dna1(t).match = ndna1(t).match
        Next
        
        For t = 0 To UBound(dna2)
            dna2(t).match = ndna2(t).match
        Next
        
'      'debug
'      Dim k As String
'      Dim temp As String
'      Dim bp As block
'      Dim converttosysvar As Boolean
'      k = ""
'      For t = 0 To UBound(dna1)
'
'        If t = UBound(dna1) Then converttosysvar = False Else converttosysvar = IIf(dna1(t + 1).tipo = 7, True, False)
'        bp.tipo = dna1(t).tipo
'        bp.value = dna1(t).value
'        temp = ""
'        Parse temp, bp, 1, converttosysvar
'
'      k = k & dna1(t).match & vbTab & temp & vbCrLf
'      Next
'
'      Clipboard.CLEAR
'      Clipboard.SetText k
'      MsgBox "---", , UBound(dna1) & " " & UBound(dna2)
'      k = ""
'      For t = 0 To UBound(dna2)
'
'        If t = UBound(dna2) Then converttosysvar = False Else converttosysvar = IIf(dna2(t + 1).tipo = 7, True, False)
'        bp.tipo = dna2(t).tipo
'        bp.value = dna2(t).value
'        temp = ""
'        Parse temp, bp, 2, converttosysvar
'
'      k = k & dna2(t).match & vbTab & temp & vbCrLf
'
'      Next
'      Clipboard.CLEAR
'      Clipboard.SetText k
'      MsgBox "done"
      
      'Step5 do crossover
    
      Dim Outdna() As block
      ReDim Outdna(0)
      crossover dna1, dna2, Outdna
      
      'Bug fix remove starting zero
      If Outdna(0).value = 0 And Outdna(0).tipo = 0 Then
        For t = 1 To UBound(Outdna)
         Outdna(t - 1) = Outdna(t)
        Next
        ReDim Preserve Outdna(UBound(Outdna) - 1)
      End If
    
      nuovo = posto()
      SimOpts.TotBorn = SimOpts.TotBorn + 1
      If rob(female).Veg Then totvegs = totvegs + 1
          
      'Step4 after robot is created store the dna
      
      rob(nuovo).dna = Outdna
          
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).dna())     ' Set the DNA length of the offspring

      'Bugfix actual length = virtual length
      ReDim Preserve rob(nuovo).dna(rob(nuovo).DnaLen)
      
      
      rob(nuovo).genenum = CountGenes(rob(nuovo).dna())
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
'      rob(nuovo).mem(480) = 32000 Botsareus 2/21/2013 Broken
'      rob(nuovo).mem(481) = 32000
'      rob(nuovo).mem(482) = 32000
'      rob(nuovo).mem(483) = 32000
      rob(nuovo).Corpse = False
      rob(nuovo).Dead = False
      rob(nuovo).NewMove = rob(female).NewMove
      rob(nuovo).generation = rob(female).generation + 1
      rob(nuovo).BirthCycle = SimOpts.TotRunCycle
      rob(nuovo).vnum = 1
      
      nnrg = (rob(female).nrg / 100#) * CSng(per)
      nwaste = rob(female).Waste / 100# * CSng(per)
      npwaste = rob(female).Pwaste / 100# * CSng(per)
      nchloroplasts = (rob(female).chloroplasts / 100#) * CSng(per) 'Panda 8/23/2013 Distribute the chloroplasts
      
      rob(female).nrg = rob(female).nrg - nnrg - (nnrg * 0.001) ' Make reproduction cost 0.1% of nrg transfer for females
      'The male paid a cost to shoot the sperm but nothing more.
      
      rob(female).Waste = rob(female).Waste - nwaste
      rob(female).Pwaste = rob(female).Pwaste - npwaste
      rob(female).body = rob(female).body - nbody
      rob(female).radius = FindRadius(rob(female).body)
      rob(female).chloroplasts = rob(female).chloroplasts - nchloroplasts 'Panda 8/23/2013 Distribute the chloroplasts
      
      rob(nuovo).chloroplasts = nchloroplasts 'Botsareus 8/24/2013 Distribute the chloroplasts
      rob(nuovo).body = nbody
      rob(nuovo).radius = FindRadius(nbody)
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
      rob(nuovo).Veg = rob(female).Veg
      rob(nuovo).NoChlr = rob(female).NoChlr 'Botsareus 3/28/2014 Disable chloroplasts
      rob(nuovo).Fixed = rob(female).Fixed
      rob(nuovo).CantSee = rob(female).CantSee
      rob(nuovo).DisableDNA = rob(female).DisableDNA
      rob(nuovo).DisableMovementSysvars = rob(female).DisableMovementSysvars
      rob(nuovo).CantReproduce = rob(female).CantReproduce
      rob(nuovo).VirusImmune = rob(female).VirusImmune
      If rob(nuovo).Fixed Then rob(nuovo).mem(Fixed) = 1
      rob(nuovo).Shape = rob(female).Shape
      rob(nuovo).SubSpecies = rob(female).SubSpecies
    
      'Botsareus 4/9/2013 we need to copy some variables for genetic distance
      rob(nuovo).OldGD = rob(female).OldGD
      rob(nuovo).GenMut = rob(female).GenMut
      'Botsareus 1/29/2014 Copy the tag
      rob(nuovo).tag = rob(female).tag
      'Botsareus 7/22/2014 Both robots should have same boyancy
      rob(nuovo).Bouyancy = rob(female).Bouyancy
      
      'Botsareus 7/29/2014 New kill restrictions
      If rob(female).multibot_time > 0 Then rob(nuovo).multibot_time = rob(female).multibot_time / 2 + 2
      rob(nuovo).dq = rob(female).dq
      
      rob(nuovo).delgenes = rob(female).delgenes
  
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
      'The other 15 genetic memory locations are stored now but can be used later
      For i = 0 To 14
        rob(nuovo).epimem(i) = rob(female).mem(976 + i)
      Next i
      'Erase parents genetic memory now to prevent him from completing his own transfer by using his kid
      For i = 0 To 14
        rob(female).epimem(i) = 0
      Next i
      
      
      rob(nuovo).LastMutDetail = "Female DNA len " + Str(rob(female).DnaLen) + " and male DNA len " + _
      Str(UBound(rob(female).spermDNA)) + " had offspring DNA len " + Str(rob(nuovo).DnaLen) + " during cycle " + Str(SimOpts.TotRunCycle) + _
      vbCrLf + rob(nuovo).LastMutDetail
            
      If Delta2 Then
        With rob(nuovo)
            Dim MratesMax As Long
            MratesMax = IIf(NormMut, CLng(.DnaLen) * CLng(valMaxNormMut), 2000000000)
            'dynamic mutation overload correction
            Dim dmoc As Double
            dmoc = 1 + (rob(nuovo).DnaLen - curr_dna_size) / 500
            If Not y_normsize Or (x_restartmode < 4) Then dmoc = 1
            'zerobot stabilization
            If x_restartmode = 7 Or x_restartmode = 8 Then
                If .FName = "Mutate.txt" Then
                    'normalize child
                    .Mutables.mutarray(PointUP) = .Mutables.mutarray(PointUP) * 1.75
                    If .Mutables.mutarray(PointUP) > MratesMax Then .Mutables.mutarray(PointUP) = MratesMax
                    .Mutables.mutarray(P2UP) = .Mutables.mutarray(P2UP) * 1.75
                    If .Mutables.mutarray(P2UP) > MratesMax Then .Mutables.mutarray(P2UP) = MratesMax
                End If
            End If
            '
            For t = 1 To 10
             If t = 9 Then GoTo skip 'ignore PM2 mutation here
             If .Mutables.mutarray(t) < 1 Then GoTo skip 'Botsareus 1/3/2014 if mutation off then skip it
             If Rnd < DeltaMainChance / 100 Then
                If DeltaMainExp <> 0 Then
                    '
                    If (t = CopyErrorUP Or t = TranslocationUP Or t = ReversalUP Or t = CE2UP) Then
                      .Mutables.mutarray(t) = .Mutables.mutarray(t) * (dmoc + 2) / 3
                    Else
                      If Not (t = MinorDeletionUP Or t = MajorDeletionUP) Then .Mutables.mutarray(t) = .Mutables.mutarray(t) * dmoc 'dynamic mutation overload correction
                    End If                    '
                    .Mutables.mutarray(t) = .Mutables.mutarray(t) * 10 ^ ((Rnd * 2 - 1) / DeltaMainExp)
                End If
              .Mutables.mutarray(t) = .Mutables.mutarray(t) + (Rnd * 2 - 1) * DeltaMainLn
              If .Mutables.mutarray(t) < 1 Then .Mutables.mutarray(t) = 1
              If .Mutables.mutarray(t) > MratesMax Then .Mutables.mutarray(t) = MratesMax
             End If
             If Rnd < DeltaDevChance / 100 Then
              If DeltaDevExp <> 0 Then .Mutables.StdDev(t) = .Mutables.StdDev(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
              .Mutables.StdDev(t) = .Mutables.StdDev(t) + (Rnd * 2 - 1) * DeltaDevLn
              If DeltaDevExp <> 0 Then .Mutables.Mean(t) = .Mutables.Mean(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
              .Mutables.Mean(t) = .Mutables.Mean(t) + (Rnd * 2 - 1) * DeltaDevLn
              'Max range is always 0 to 800
              If .Mutables.StdDev(t) < 0 Then .Mutables.StdDev(t) = 0
              If .Mutables.StdDev(t) > 200 Then .Mutables.StdDev(t) = 200
              If .Mutables.Mean(t) < 1 Then .Mutables.Mean(t) = 1
              If .Mutables.Mean(t) > 400 Then .Mutables.Mean(t) = 400
             End If
skip:
            Next
            .Mutables.CopyErrorWhatToChange = .Mutables.CopyErrorWhatToChange + (Rnd * 2 - 1) * DeltaWTC
            If .Mutables.CopyErrorWhatToChange < 0 Then .Mutables.CopyErrorWhatToChange = 0
            If .Mutables.CopyErrorWhatToChange > 100 Then .Mutables.CopyErrorWhatToChange = 100
            Mutate nuovo, True
        End With
      Else
        Mutate nuovo, True
      End If
        
      makeoccurrlist nuovo
      rob(nuovo).DnaLen = DnaLen(rob(nuovo).dna())
      rob(nuovo).genenum = CountGenes(rob(nuovo).dna())
      rob(nuovo).mem(DnaLenSys) = rob(nuovo).DnaLen
      rob(nuovo).mem(GenesSys) = rob(nuovo).genenum
            
      maketie female, nuovo, sondist, 100, 0 'birth ties last 100 cycles
      rob(female).onrg = rob(female).nrg 'saves mother from dying from shock after giving birth
      rob(nuovo).mass = nbody / 1000 + rob(nuovo).shell / 200
      rob(nuovo).mem(timersys) = rob(female).mem(timersys) 'epigenetic timer
      
      'A little hack here to remain in control of reproduced robots
      If MDIForm1.pbOn.Checked Then
        If female = robfocus Or rob(female).highlight Then rob(nuovo).highlight = True
      End If
      
      rob(female).mem(SEXREPRO) = 0 ' sucessfully reproduced, so reset .sexrepro
      rob(female).fertilized = -1           ' Set to -1 so spermDNA space gets reclaimed next cycle
      rob(female).mem(SYSFERTILIZED) = 0    ' Sperm is only good for one birth presently
      
      'Botsareus 11/29/2013 Reset epigenetic memory
      If epireset Then
       rob(nuovo).MutEpiReset = rob(female).MutEpiReset + rob(nuovo).LastMut ^ epiresetemp
       If rob(nuovo).MutEpiReset > epiresetOP And rob(female).MutEpiReset > 0 Then
         rob(nuovo).MutEpiReset = 0
         For i = 0 To 4
          rob(nuovo).mem(971 + i) = 0
         Next i
         For i = 0 To 14
          rob(nuovo).epimem(i) = 0
         Next i
       End If
      End If
                  
      rob(female).nrg = rob(female).nrg - rob(female).DnaLen * SimOpts.Costs(DNACOPYCOST) * SimOpts.Costs(COSTMULTIPLIER) 'Botsareus 7/7/2013 Reproduction DNACOPY cost
      If rob(female).nrg < 0 Then rob(female).nrg = 0
    End If
  End If
getout:
End Function

'Botsareus 12/1/2013 Redone to work in all cases
Public Sub DoGeneticMemory(t As Integer)
 Dim loc As Integer ' memory location to copy from parent to offspring
  
  'Make sure the bot has a tie
  If rob(t).numties > 0 Then
      'Make sure it really is the birth tie and not some other tie
      If rob(t).Ties(1).last > 0 Then
          'Copy the memory locations 976 to 990 from parent to child. One per cycle.
          loc = 976 + rob(t).age ' the location to copy
          'only copy the value if the location is 0 in the child and the parent has something to copy
          If rob(t).mem(loc) = 0 And rob(t).epimem(rob(t).age) <> 0 Then
            rob(t).mem(loc) = rob(t).epimem(rob(t).age)
          End If
      End If
  End If
End Sub

' verifies rapidly if a field position is already occupied
Public Function simplecoll(X As Long, Y As Long, k As Integer) As Boolean
  Dim t As Integer
  Dim radius As Long
  
  simplecoll = False
  
  For t = 1 To MaxRobs
    If rob(t).exist And Not (rob(t).FName = "Base.txt" And hidepred) Then
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
'robfocus to next highlighted robot on kill robot for playerbot mode
If n = robfocus And MDIForm1.pbOn.Checked Then
  Dim t As Integer
  For t = 1 To MaxRobs
    With rob(t)
     If .exist And .highlight And t <> n Then
        robfocus = t
     End If
    End With
  Next
End If


 Dim newsize As Long
 Dim X As Long
 
  If n = -1 Then n = robfocus
  
  If SimOpts.DBEnable Then
    If rob(n).Veg And SimOpts.DBExcludeVegs Then
    Else
      AddRecord n
    End If
  End If
   
  rob(n).Fixed = False
  rob(n).Veg = False
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
  '
  ReDim rob(n).delgenes(0)
  ReDim rob(n).delgenes(0).dna(0)
  '
  
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


