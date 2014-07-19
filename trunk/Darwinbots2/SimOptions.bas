Attribute VB_Name = "SimOptModule"
Public Const NUMCOST As Integer = 0
Public Const DOTNUMCOST As Integer = 1
Public Const BCCMDCOST As Integer = 2
Public Const ADCMDCOST As Integer = 3
Public Const BTCMDCOST As Integer = 4
Public Const CONDCOST As Integer = 5
Public Const LOGICCOST As Integer = 6
Public Const COSTSTORE As Integer = 7
Public Const CHLRCOST As Integer = 8 'Botsareus 8/24/2013 The new chloroplast cost
Public Const FLOWCOST As Integer = 9

Public Const MOVECOST As Integer = 20
Public Const TURNCOST As Integer = 21
Public Const TIECOST As Integer = 22
Public Const SHOTCOST As Integer = 23
Public Const DNACYCCOST As Integer = 24
Public Const DNACOPYCOST As Integer = 25
Public Const VENOMCOST As Integer = 26
Public Const POISONCOST As Integer = 27
Public Const SLIMECOST As Integer = 28
Public Const SHELLCOST As Integer = 29
Public Const BODYUPKEEP As Integer = 30
Public Const AGECOST As Integer = 31
Public Const AGECOSTSTART As Integer = 32
Public Const AGECOSTLINEARFRACTION As Integer = 33

Public Const AGECOSTMAKELOG As Integer = 51 'Set this high casue it does not use the Cost's control array
Public Const BOTNOCOSTLEVEL As Integer = 52
Public Const DYNAMICCOSTTARGET As Integer = 53
Public Const COSTMULTIPLIER As Integer = 54
Public Const DYNAMICCOSTSENSITIVITY As Integer = 55
Public Const USEDYNAMICCOSTS As Integer = 56
Public Const DYNAMICCOSTTARGETUPPERRANGE As Integer = 57
Public Const DYNAMICCOSTTARGETLOWERRANGE As Integer = 58
Public Const COSTXREINSTATEMENTLEVEL As Integer = 59
Public Const AGECOSTMAKELINEAR As Integer = 60
Public Const DYNAMICCOSTINCLUDEPLANTS As Integer = 61
Public Const ALLOWNEGATIVECOSTX As Integer = 62

Public Const TEMPSUNSUSPEND As Integer = 0
Public Const ADVANCESUN As Integer = 2
Public Const PERMSUNSUSPEND As Integer = 1


Public Const MAXSPECIES As Integer = 500 ' Used to count species in other sims for IM mode
Public Const MAXNATIVESPECIES As Integer = 76 ' Max number of species that can be in this sim

Public Species(MAXSPECIES) As datispecie

Public Const MAXNUMEYES As Integer = 8


' definition of the SimOpts structure
'BE VERY CAREFUL changing the TYPE of a variable
'the read/write functions for saving sim settings/bots/simulations are
'very particular about variable TYPE
Public Type SimOptions
  SimName As String
  TotRunCycle As Long
  CycSec As Single
  TotRunTime As Long
  TotBorn As Long
  SpeciesNum As Integer
  Specie(MAXNATIVESPECIES + 1) As datispecie 'Botsareus 3/15/2013 Had to resize this so it works better with nonnative species elimination
  FieldSize As Integer
  FieldWidth As Long
  FieldHeight As Long
  MaxPopulation As Integer
  MinVegs As Integer
  KillDistVegs As Boolean
  BlockedVegs As Boolean
  DisableTies As Boolean
  DisableTypArepro As Boolean
  PopLimMethod As Integer
  
  'toroidal is updnconnected = dxsxconected = true
  Toroidal As Boolean
  Updnconnected As Boolean
  Dxsxconnected As Boolean
  '
  AutoSimPath As String
  AutoSimTime As Integer
  AutoRobPath As String
  AutoRobTime As Integer
  '
  MutCurrMult As Single
  MutOscill As Boolean
  MutCycMax As Long
  MutCycMin As Long
  DisableMutations As Boolean ' Indicates whether all mutations should be disabled
  '
  DBName As String
  DBEnable As Boolean
  DBExcludeVegs As Boolean
  DBRecDna As Boolean
  '
  F1 As Boolean
  League As Boolean
  Restart As Boolean
  
  'UserSeedToggle As Boolean 'Botsareus 5/3/2013 Replaced by safemode
  UserSeedNumber As Long
  
  MaxEnergy As Long
  ZeroMomentum As Boolean 'used to tell the simulation that robots don't get to keep velocity they've acquired.
   
  'obsolete
  CostExecCond As Single
  
  'above replaced by:
  Costs(70) As Single
  'first 20 costs 0..19 are for DNA types (that's right, an extra 9 slots for future types)
  
  'then it goes:
  'move cost = 20
  'turn cost = 21
  'tie cost = 22
  'shot cost = 23
  'cost per bp per cycle = 24
  'cost per bp per copy = 25
  'Lots of room for future costs
    
  Pondmode As Boolean
  LightIntensity As Integer
  Gradient As Single
  DayNight As Boolean 'the toggle
  Daytime As Boolean 'the variable
  CycleLength As Integer
  CorpseEnabled As Boolean
  Decay As Single
  Decaydelay As Integer
  DecayType As Integer
  EnergyProp As Single
  EnergyFix As Integer
  EnergyExType As Boolean
  '
  CoefficientStatic As Single
  CoefficientKinetic As Single
  Zgravity As Single
  Ygravity As Single
  Density As Double
  Viscosity As Double
  'FlowType As Byte Botsareus 2/6/2013 never implemented
  '
  PhysBrown As Single
  PhysMoving As Single
  
  'swimming constant will hopefully soon be either obsolete or revamped.
  PhysSwim As Single
  
  PlanetEaters As Boolean
  PlanetEatersG As Single
    
  RepopCooldown As Integer
  RepopAmount As Integer
  
  Diffuse As Single
  VegFeedingMethod As Integer
  VegFeedingToBody As Single
  
  MaxVelocity As Single
  BadWastelevel As Integer    ' EricL 4/1/2006 Added this
  chartingInterval As Integer ' EricL 4/1/2006 Added this
  CoefficientElasticity As Single ' EricL 4/29/2006
  FluidSolidCustom As Integer ' EricL 5/7/2006 Used for initializing the field properties UI
  CostRadioSetting As Integer 'EricL 5/7/2006 Used for iniitializing the costs radio button UI
  NoShotDecay As Boolean ' EricL 6/8/2006 Used to indicate shots should not decay
  NoWShotDecay As Boolean 'Botsareus 9/28/2013 Do not decay waste shots
  
  SunUp As Boolean 'EricL 6/7/2006 Indicates if we are using the option of setting the sun at an nrg threshold
  SunUpThreshold As Long
  SunDown As Boolean 'EricL 6/7/2006 Indicates if we are using the option to have the sun rise on a nrg threshold
  SunDownThreshold As Long
  DynamicCosts As Boolean ' Indicates whether dynamic cost adjustment is enabled
  AutoSaveStripMutations As Boolean ' Should mutation details be stripped in auto-saved sim files
  AutoSaveDeleteOlderFiles As Boolean ' Should old auto-saved files be deleted as new ones are created?
  FixedBotRadii As Boolean
  DayNightCycleCounter As Long
  SunThresholdMode As Integer
  AutoSaveDeleteOldBotFiles As Boolean ' Should old auto-saved best bot files be deleted as new ones are created?
  
  'Shapes Stuff
  shapesAreVisable As Boolean ' Flag indicates whether to populate bot eye values for shapes
  allowVerticalShapeDrift As Boolean
  allowHorizontalShapeDrift As Boolean
  shapesAreSeeThrough As Boolean
  shapesAbsorbShots As Boolean
  shapeDriftRate As Integer
  makeAllShapesTransparent As Boolean
  makeAllShapesBlack As Boolean
  
  'Egrid Stuff
  EGridEnabled As Boolean
  EGridWidth As Integer
    
  oldCostX As Single
  
  MaxAbsNum As Long ' Highest Maximum number assigned so far in the sim
  SimGUID As Long   ' Unique ID for this sim
  
  EnableAutoSpeciation As Boolean
  SpeciationGeneticDistance As Integer
  SpeciationGenerationalDistance As Integer
  SpeciationMinimumPopulation As Integer
  SpeciationForkInterval As Long
  
  SunOnRnd As Boolean
     
End Type

Public SimOpts As SimOptions
Public TmpOpts As SimOptions
