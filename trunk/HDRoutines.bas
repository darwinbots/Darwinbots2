Attribute VB_Name = "HDRoutines"
Option Explicit

'
'   D I S K    O P E R A T I O N S
'

' inserts organism file in the simulation
' remember that organisms could be made of more than one robot
Public Sub InsertOrganism(path As String)
  Dim X As Single, Y As Single
  Dim n As Integer
  X = Random(Form1.ScaleLeft, Form1.ScaleWidth)
  Y = Random(Form1.ScaleTop, Form1.ScaleHeight)
  n = LoadOrganism(path, X, Y)
  'rob(n).BucketPos.x = -2
  'rob(n).BucketPos.Y = -2
  'UpdateBotBucket n
End Sub

' saves organism file
Public Sub SaveOrganism(path As String, r As Integer)
  Dim clist(50) As Integer
  Dim k As Integer, cnum As Integer
  k = 0
  clist(0) = r
  ListCells clist()
  While clist(cnum) > 0
    cnum = cnum + 1
  Wend
  On Error GoTo problem
  Open path For Binary As 1
    Put #1, , cnum
    For k = 0 To cnum - 1
      rob(clist(k)).LastOwner = IntOpts.IName
      SaveRobotBody 1, clist(k)
    Next k
  Close 1
  Exit Sub
problem:

 ' MsgBox ("Error saving organism.")
  Close 1
End Sub

'Adds a record to the species array when a bot with a new species is loaded or teleported in
Public Function AddSpecie(n As Integer, IsNative As Boolean) As Integer
  Dim k As Integer
  Dim fso As New FileSystemObject
  Dim robotFile As File
  
  If rob(n).Corpse Or rob(n).FName = "Corpse" Or rob(n).exist = False Then
    AddSpecie = 0
    Exit Function
  End If
  
  k = SimOpts.SpeciesNum
  If k < MAXNATIVESPECIES Then SimOpts.SpeciesNum = SimOpts.SpeciesNum + 1
   
  SimOpts.Specie(k).Name = rob(n).FName
  SimOpts.Specie(k).Veg = rob(n).Veg
  SimOpts.Specie(k).CantSee = rob(n).CantSee
  SimOpts.Specie(k).DisableMovementSysvars = rob(n).DisableMovementSysvars
  SimOpts.Specie(k).DisableDNA = rob(n).DisableDNA
  SimOpts.Specie(k).CantReproduce = rob(n).CantReproduce
  SimOpts.Specie(k).VirusImmune = rob(n).VirusImmune
  SimOpts.Specie(k).population = 1
  SimOpts.Specie(k).SubSpeciesCounter = 0
  'If rob(n).FName = "Corpse" Then
  '  SimOpts.Specie(k).color = vbBlack
  'Else
   SimOpts.Specie(k).color = rob(n).color
  'End If
  SimOpts.Specie(k).Comment = "Species arrived from the Internet"
  SimOpts.Specie(k).Posrg = 1
  SimOpts.Specie(k).Posdn = 1
  SimOpts.Specie(k).Poslf = 0
  SimOpts.Specie(k).Postp = 0
  
  SetDefaultMutationRates SimOpts.Specie(k).Mutables
  SimOpts.Specie(k).Mutables.Mutations = rob(n).Mutables.Mutations
  SimOpts.Specie(k).qty = 5
  SimOpts.Specie(k).Stnrg = 3000
  SimOpts.Specie(k).Native = IsNative
'  On Error GoTo bypass
'  Set robotFile = fso.GetFile(MDIForm1.MainDir + "\robots\" + rob(n).FName)
 ' If robotFile.size > 0 Then
 '   SimOpts.Specie(k).Native = True
'    MDIForm1.Combo1.additem rob(n).FName
'  End If
'bypass:
  SimOpts.Specie(k).path = MDIForm1.MainDir + "\robots"
  
  ' Have to do this becuase of the crazy way SimOpts is NOT copied into TmpOpts when the options dialog is opened
 ' TmpOpts.Specie(k) = SimOpts.Specie(k)
 ' TmpOpts.SpeciesNum = SimOpts.SpeciesNum
  
  AddSpecie = k
  
End Function

' loads an organism file
Public Function LoadOrganism(path As String, X As Single, Y As Single) As Integer
  Dim clist(50) As Integer
  Dim OList(50) As Integer
  Dim k As Integer, cnum As Integer
  Dim i As Integer
  Dim nuovo As Integer
  Dim foundSpecies As Boolean
  
tryagain:
  On Error GoTo problem
  Open path For Binary As 1
    Get #1, , cnum
    For k = 0 To cnum - 1
      nuovo = posto()
      clist(k) = nuovo
      LoadRobot 1, nuovo
      LoadOrganism = nuovo
      i = SimOpts.SpeciesNum
      foundSpecies = False
      While i > 0
        i = i - 1
        If rob(nuovo).FName = SimOpts.Specie(i).Name Then
          foundSpecies = True
          i = 0
        End If
      Wend
      If Not foundSpecies Then AddSpecie nuovo, False
      
    Next k
  Close 1
  If X > -1 And Y > -1 Then
    PlaceOrganism clist(), X, Y
  End If
  RemapTies clist(), OList, cnum

  Exit Function
problem:
  Close 1
  LoadOrganism = -1
  If nuovo > 0 Then
    rob(nuovo).exist = False
    UpdateBotBucket nuovo
  End If
 ' MsgBox ("Error Loading Organism.  Will try next cycle.")
  'GoTo TryAgain
End Function

' places an organism (made of robots listed in clist())
' in the specified x,y position
Public Sub PlaceOrganism(clist() As Integer, X As Single, Y As Single)
  Dim k As Integer
  Dim dx As Single, dy As Single
  k = 0
  
  dx = X - rob(clist(0)).pos.X
  dy = Y - rob(clist(0)).pos.Y
  While clist(k) > 0
    rob(clist(k)).pos.X = rob(clist(k)).pos.X + dx
    rob(clist(k)).pos.Y = rob(clist(k)).pos.Y + dy
    rob(clist(k)).BucketPos.X = -2
    rob(clist(k)).BucketPos.Y = -2
    UpdateBotBucket clist(k)
    k = k + 1
  Wend
End Sub

' remaps ties from the old index numbers - those the robots had
' when saved to disk- to the new indexes assigned in this simulation
Public Sub RemapTies(clist() As Integer, OList() As Integer, cnum As Integer)
  Dim t As Integer, ind As Integer, j As Integer, k As Integer
  Dim TiePointsToNode As Boolean
    
  For t = 0 To cnum - 1  ' Loop through each cell
    ind = rob(clist(t)).oldBotNum
    For k = 0 To cnum - 1  ' Loop through each cell
      j = 1
      While rob(clist(k)).Ties(j).pnt > 0  ' Loop through each tie
        If rob(clist(k)).Ties(j).pnt = ind Then
          rob(clist(k)).Ties(j).pnt = clist(t)
        End If
        j = j + 1
      Wend
    Next k
  Next t
  
  For k = 0 To cnum - 1 ' All cells
    j = 1
    While rob(clist(k)).Ties(j).pnt > 0 'All Ties
      TiePointsToNode = False
      For t = 0 To cnum - 1
        ind = clist(t)
        If rob(clist(k)).Ties(j).pnt = ind Then
          TiePointsToNode = True
        End If
      Next t
      If Not TiePointsToNode Then rob(clist(k)).Ties(j).pnt = 0
      j = j + 1
    Wend
  Next k
End Sub

Public Function RemapAllTies(numOfBots As Integer)
Dim i As Integer
Dim j As Integer
Dim k As Integer
  
  For i = 1 To numOfBots
      j = 1
      While rob(i).Ties(j).pnt > 0  ' Loop through each tie
        For k = 1 To numOfBots
          If rob(i).Ties(j).pnt = rob(k).oldBotNum Then
            rob(i).Ties(j).pnt = k
            GoTo nexttie
          End If
        Next k
nexttie:
        j = j + 1
      Wend
  Next i
End Function

Public Function RemapAllShots(numOfShots As Long)
Dim i As Long
Dim j As Integer
  
  For i = 1 To numOfShots
    If Shots(i).exist Then
      For j = 1 To MaxRobs
        If rob(j).exist Then
          If Shots(i).parent = rob(j).oldBotNum Then
            Shots(i).parent = j
            If Shots(i).stored Then rob(j).virusshot = i
            GoTo nextshot
          End If
        End If
      Next j
      Shots(i).stored = False ' Could not find parent.  Should probalby never happen but if it does, release the shot
    End If
nextshot:
  Next i
End Function

'Saves a small file with per species population informaton
'Used for aggregating the population stats from multiple connected sims
Public Sub SaveSimPopulation(path As String)
  Dim X As Integer
  Dim numSpecies As Integer
  Const Fe As Byte = 254
  Dim fso As New FileSystemObject
  Dim fileToDelete As File
  
  Form1.MousePointer = vbHourglass
  On Error GoTo bypass
  Set fileToDelete = fso.GetFile(path)
  fileToDelete.Delete
    
bypass:
  Open path For Binary As 10
  
  Put #10, , Len(IntOpts.IName)
  Put #10, , IntOpts.IName
  
  numSpecies = 0
  For X = 0 To SimOpts.SpeciesNum - 1
     If SimOpts.Specie(X).population > 0 Then numSpecies = numSpecies + 1
  Next X
  
  Put #10, , numSpecies  ' Only save non-zero populations
  
      
  For X = 0 To SimOpts.SpeciesNum - 1
    If SimOpts.Specie(X).population > 0 Then
      Put #10, , Len(SimOpts.Specie(X).Name)
      Put #10, , SimOpts.Specie(X).Name
      Put #10, , SimOpts.Specie(X).population
      Put #10, , SimOpts.Specie(X).Veg
      Put #10, , SimOpts.Specie(X).color
      
      'write any future data here
    
      'Record ending bytes
      Put #10, , Fe
      Put #10, , Fe
      Put #10, , Fe
    End If
            
  Next X
  
  
  Close 10
  Form1.MousePointer = vbArrow

End Sub

Public Sub LoadSimPopulationFile(path As String)
Dim X As Integer
Dim k As Long
Dim Fe As Byte
Dim internetName As String
Dim numSpeciesThisFile As Integer

  
  Form1.MousePointer = vbHourglass
  Open path For Binary As 10
   
  Get #10, , k: internetName = Space(k)
  Get #10, , internetName
  Get #10, , numSpeciesThisFile
      
  'numInternetSims is set to the current sim number before this routine is called.  So sloppy...
  
  
  
  InternetSims(numInternetSims).population = 0
  If (numInternetSpecies + numSpeciesThisFile - 1) < MAXINTERNETSPECIES Then
  For X = numInternetSpecies To (numInternetSpecies + numSpeciesThisFile - 1)
    Get #10, , k: InternetSpecies(X).Name = Space(k)
    Get #10, , InternetSpecies(X).Name
    Get #10, , InternetSpecies(X).population
    InternetSims(numInternetSims).population = InternetSims(numInternetSims).population + InternetSpecies(X).population
    Get #10, , InternetSpecies(X).Veg
    Get #10, , InternetSpecies(X).color
    If InternetSpecies(X).Name = "Corpse" Then InternetSpecies(X).color = vbBlack
      
    'grab the three FE codes
    Get #10, , Fe
    Get #10, , Fe
    Get #10, , Fe
            
  Next X
  numInternetSpecies = numInternetSpecies + numSpeciesThisFile
  End If
  Close 10
  Form1.MousePointer = vbArrow

End Sub

' saves a whole simulation
Public Sub SaveSimulation(path As String)
  Dim t As Integer
  Dim n As Integer
  Dim X As Integer
  Dim j As Long
  Dim s2 As String
  Dim temp As String
  Dim numOfExistingBots As Integer
  
  Form1.MousePointer = vbHourglass
  
  numOfExistingBots = 0
  
  For X = 1 To MaxRobs
    If rob(X).exist Then numOfExistingBots = numOfExistingBots + 1
  Next X
  
  
  Open path For Binary As 1
    
    Put #1, , numOfExistingBots
    
    For t = 1 To MaxRobs
      If rob(t).exist Then
        SaveRobotBody 1, t
      End If
    Next t
    
    Put #1, , Len(SimOpts.AutoRobPath)
    Put #1, , SimOpts.AutoRobPath
    Put #1, , SimOpts.AutoRobTime
    Put #1, , Len(SimOpts.AutoSimPath)
    Put #1, , SimOpts.AutoSimPath
    Put #1, , SimOpts.AutoSimTime
    Put #1, , SimOpts.BlockedVegs
    Put #1, , SimOpts.Costs(SHOTCOST)
    Put #1, , SimOpts.CostExecCond
    Put #1, , SimOpts.Costs(COSTSTORE)
    Put #1, , SimOpts.DBEnable
    Put #1, , SimOpts.DBExcludeVegs
    Put #1, , Len(SimOpts.DBName)
    Put #1, , SimOpts.DBName
    Put #1, , SimOpts.DBRecDna
    Put #1, , SimOpts.DisableTies
    Put #1, , SimOpts.EnergyExType
    Put #1, , SimOpts.EnergyFix
    Put #1, , SimOpts.EnergyProp
    Put #1, , SimOpts.FieldHeight
    Put #1, , SimOpts.FieldSize
    Put #1, , SimOpts.FieldWidth
    Put #1, , SimOpts.KillDistVegs
    Put #1, , SimOpts.MaxEnergy
    Put #1, , SimOpts.MaxPopulation
    Put #1, , SimOpts.MinVegs
    Put #1, , SimOpts.MutCurrMult
    Put #1, , SimOpts.MutCycMax
    Put #1, , SimOpts.MutCycMin
    Put #1, , SimOpts.MutOscill
    Put #1, , SimOpts.PhysBrown
    Put #1, , SimOpts.Ygravity
    Put #1, , SimOpts.Zgravity
    Put #1, , SimOpts.PhysMoving
    Put #1, , SimOpts.PhysSwim
    Put #1, , SimOpts.PopLimMethod
    Put #1, , Len(SimOpts.SimName)
    Put #1, , SimOpts.SimName
    Put #1, , SimOpts.SpeciesNum
    Put #1, , SimOpts.Toroidal
    Put #1, , SimOpts.TotBorn
    Put #1, , SimOpts.TotRunCycle
    Put #1, , SimOpts.TotRunTime
    
    'new stuff
    
    Put #1, , SimOpts.Pondmode
    
    'Put #1, , SimOpts.KineticEnergy
    Put #1, , False
    
    Put #1, , SimOpts.LightIntensity
    Put #1, , SimOpts.CorpseEnabled
    Put #1, , SimOpts.Decay
    Put #1, , SimOpts.Gradient
    Put #1, , SimOpts.DayNight
    Put #1, , SimOpts.CycleLength
    
    'new new stuff
    
    Put #1, , SimOpts.Decaydelay
    Put #1, , SimOpts.DecayType
    
    'obsolete
    Put #1, , SimOpts.Costs(MOVECOST)
    
    Put #1, , SimOpts.F1
    Put #1, , SimOpts.Restart
    
    'even even newer newer stuff
    Put #1, , SimOpts.Dxsxconnected
    Put #1, , SimOpts.Updnconnected
    Put #1, , SimOpts.RepopAmount
    Put #1, , SimOpts.RepopCooldown
    Put #1, , SimOpts.ZeroMomentum
    Put #1, , SimOpts.UserSeedNumber
    Put #1, , SimOpts.UserSeedToggle
    
    Put #1, , SimOpts.SpeciesNum
    
    Dim k As Integer
    For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).Colind
      Put #1, , SimOpts.Specie(k).color
      Put #1, , SimOpts.Specie(k).Fixed
      Put #1, , SimOpts.Specie(k).Mutables.mutarray
      Put #1, , SimOpts.Specie(k).Mutables.Mutations
      Put #1, , Len(SimOpts.Specie(k).Name)
      Put #1, , SimOpts.Specie(k).Name
      
      'obsolete, so we do this instead
      'Put #1, , SimOpts.Specie(k).omnifeed
      Put #1, , 8
      
      Put #1, , Len(SimOpts.Specie(k).path)
      Put #1, , SimOpts.Specie(k).path
      
      Put #1, , CLng(SimOpts.FieldHeight)
      Put #1, , CLng(0)
      Put #1, , CLng(SimOpts.FieldWidth)
      Put #1, , CLng(0)
      
      'Put #1, , SimOpts.Specie(k).Posdn
      'Put #1, , SimOpts.Specie(k).Poslf
      'Put #1, , SimOpts.Specie(k).Posrg
      'Put #1, , SimOpts.Specie(k).Postp
      
      Put #1, , SimOpts.Specie(k).qty
      Put #1, , SimOpts.Specie(k).Skin
      Put #1, , SimOpts.Specie(k).Stnrg
      Put #1, , SimOpts.Specie(k).Veg
    Next k
    
    Put #1, , SimOpts.VegFeedingMethod
    Put #1, , SimOpts.VegFeedingToBody
    Put #1, , SimOpts.CoefficientStatic
    Put #1, , SimOpts.CoefficientKinetic
    Put #1, , SimOpts.PlanetEaters
    Put #1, , SimOpts.PlanetEatersG
    Put #1, , SimOpts.Viscosity
    Put #1, , SimOpts.Density
    
    'New for 2.4:
    For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).Mutables.CopyErrorWhatToChange
      Put #1, , SimOpts.Specie(k).Mutables.PointWhatToChange
      
      Dim h As Integer
      
      For h = 0 To 20
        Put #1, , SimOpts.Specie(k).Mutables.Mean(h)
        Put #1, , SimOpts.Specie(k).Mutables.StdDev(h)
      Next h
      
      'Put #1, , SimOpts.p
    Next k
    
    For k = 0 To 70
      Put #1, , SimOpts.Costs(k)
    Next k
    
    'EricL 4/1/2006 Fixed bug below by added -1.  Loop was executing one too many times...
    For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).Poslf
      Put #1, , SimOpts.Specie(k).Posrg
      Put #1, , SimOpts.Specie(k).Postp
      Put #1, , SimOpts.Specie(k).Posdn
    Next k
    
    Put #1, , SimOpts.BadWastelevel    'EricL 4/1/2006 Added this
    Put #1, , SimOpts.chartingInterval 'EricL 4/1/2006 Added this
    Put #1, , SimOpts.CoefficientElasticity 'EricL 4/29/2006 Added this
    Put #1, , SimOpts.FluidSolidCustom ' EricL 5/7/2006
    Put #1, , SimOpts.CostRadioSetting ' EricL 5/7/2006
    Put #1, , SimOpts.MaxVelocity ' EricL 5/15/2006
    Put #1, , SimOpts.NoShotDecay ' EricL 6/8/2006
    Put #1, , SimOpts.SunUpThreshold 'EricL 6/8/2006 Added this
    Put #1, , SimOpts.SunUp 'EricL 6/8/2006 Added this
    Put #1, , SimOpts.SunDownThreshold 'EricL 6/8/2006 Added this
    Put #1, , SimOpts.SunDown 'EricL 6/8/2006 Added this
    Put #1, , SimOpts.AutoSaveStripMutations
    Put #1, , SimOpts.AutoSaveDeleteOlderFiles
    Put #1, , SimOpts.FixedBotRadii
    Put #1, , SimOpts.DayNightCycleCounter
    Put #1, , SimOpts.Daytime
    Put #1, , SimOpts.SunThresholdMode
    
    Put #1, , numTeleporters
    
    For X = 1 To numTeleporters
      SaveTeleporter 1, X
    Next X
                
    Put #1, , numObstacles
    
    For X = 1 To numObstacles
      SaveObstacle 1, X
    Next X
    
    Put #1, , SimOpts.AutoSaveDeleteOldBotFiles
    
    For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).CantSee
      Put #1, , SimOpts.Specie(k).DisableDNA
      Put #1, , SimOpts.Specie(k).DisableMovementSysvars
    Next k
    
    Put #1, , SimOpts.shapesAreVisable
    Put #1, , SimOpts.allowVerticalShapeDrift
    Put #1, , SimOpts.allowHorizontalShapeDrift
    Put #1, , SimOpts.shapesAreSeeThrough
    Put #1, , SimOpts.shapesAbsorbShots
    Put #1, , SimOpts.shapeDriftRate
    Put #1, , SimOpts.makeAllShapesTransparent
    Put #1, , SimOpts.makeAllShapesBlack
    
    For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).CantReproduce
    Next k
    
    Put #1, , maxshotarray
    
    For j = 1 To maxshotarray
      SaveShot 1, j
    Next j
    
    Put #1, , SimOpts.MaxAbsNum
    
   For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).VirusImmune
    Next k
    
   For k = 0 To SimOpts.SpeciesNum - 1
      Put #1, , SimOpts.Specie(k).population
      Put #1, , SimOpts.Specie(k).SubSpeciesCounter
   Next k
   
   For k = 0 To SimOpts.SpeciesNum - 1
     Put #1, , SimOpts.Specie(k).Native
   Next k
   
   Put #1, , SimOpts.EGridWidth
   Put #1, , SimOpts.EGridEnabled
   Put #1, , SimOpts.oldCostX
   Put #1, , SimOpts.DisableMutations
   Put #1, , SimOpts.SimGUID
   Put #1, , SimOpts.SpeciationGenerationalDistance
   Put #1, , SimOpts.SpeciationGeneticDistance
   Put #1, , SimOpts.EnableAutoSpeciation
   Put #1, , SimOpts.SpeciationMinimumPopulation
   Put #1, , SimOpts.SpeciationForkInterval
       
  Close 1
  Form1.MousePointer = vbArrow
End Sub

' loads a whole simulation
Public Sub LoadSimulation(path As String)
  'Because of the way that loadrobot and saverobot work, all save and load
  'sim routines are backwards and forwards compatible after 2.37.2
  '(not 2.37.2, but everything that comes after)
  Dim j As Long
  Dim k As Long
  Dim X As Integer
  Dim t As Integer
  Dim s As Single 'EricL 4/1/2006 Use this to read in single values
  Dim tempbool As Boolean
  Dim temp As String
  Dim s2 As String
  
  
  Form1.MousePointer = vbHourglass
    
  'For k = 0 To MaxRobs
  '  Erase rob(k).DNA()
  '  ReDim rob(k).DNA(1)
  '  rob(k).exist = False
  'Next k
  'Erase rob()
  'Init_Buckets
  
  Open path For Binary As 1
    
    'As of 2.42.8, indicates a value less than the "real" MaxRobs, not a high water mark, since only existing bots are stored post 2.42.8
    Get #1, , MaxRobs
    
    'Round up to the next multiple of 500
    ReDim rob(MaxRobs + (500 - (MaxRobs Mod 500)))
    
    For k = 1 To MaxRobs
     LoadRobot 1, k
     ' DoEvents
    Next k
    
    ' As of 2.42.8, the sim file is packed.  Every bot stored is guarenteed to exist, yet their bot numbers, when loaded, may be
    ' different from the sim they came from.  Thus, we remap all the ties from all the loaded bots.
    RemapAllTies MaxRobs

    
    Get #1, , k: SimOpts.AutoRobPath = Space(k)
    Get #1, , SimOpts.AutoRobPath
    Get #1, , SimOpts.AutoRobTime
    Get #1, , k: SimOpts.AutoSimPath = Space(k)
    Get #1, , SimOpts.AutoSimPath
    Get #1, , SimOpts.AutoSimTime
    Get #1, , SimOpts.BlockedVegs
    Get #1, , SimOpts.Costs(SHOTCOST)
    Get #1, , SimOpts.CostExecCond
    Get #1, , SimOpts.Costs(COSTSTORE)
    Get #1, , SimOpts.DBEnable
    Get #1, , SimOpts.DBExcludeVegs
    Get #1, , k: SimOpts.DBName = Space(k)
    Get #1, , SimOpts.DBName
    Get #1, , SimOpts.DBRecDna
    Get #1, , SimOpts.DisableTies
    Get #1, , SimOpts.EnergyExType
    Get #1, , SimOpts.EnergyFix
    Get #1, , SimOpts.EnergyProp
    Get #1, , SimOpts.FieldHeight
    Get #1, , SimOpts.FieldSize
    Get #1, , SimOpts.FieldWidth
    Get #1, , SimOpts.KillDistVegs
    Get #1, , SimOpts.MaxEnergy
    Get #1, , SimOpts.MaxPopulation
    Get #1, , SimOpts.MinVegs
    Get #1, , SimOpts.MutCurrMult
    Get #1, , SimOpts.MutCycMax
    Get #1, , SimOpts.MutCycMin
    Get #1, , SimOpts.MutOscill
    Get #1, , SimOpts.PhysBrown
    Get #1, , SimOpts.Ygravity
    Get #1, , SimOpts.Zgravity
    Get #1, , SimOpts.PhysMoving
    Get #1, , SimOpts.PhysSwim
    Get #1, , SimOpts.PopLimMethod
    Get #1, , k: SimOpts.SimName = Space(Abs(k))
    Get #1, , SimOpts.SimName
    Get #1, , SimOpts.SpeciesNum
    Get #1, , SimOpts.Toroidal
    Get #1, , SimOpts.TotBorn
    Get #1, , SimOpts.TotRunCycle
    Get #1, , SimOpts.TotRunTime
    Get #1, , SimOpts.Pondmode
    'Get #1, , SimOpts.KineticEnergy
    Get #1, , SimOpts.CorpseEnabled 'dummy variable
    Get #1, , SimOpts.LightIntensity
    Get #1, , SimOpts.CorpseEnabled
    Get #1, , SimOpts.Decay
    Get #1, , SimOpts.Gradient
    Get #1, , SimOpts.DayNight
    Get #1, , SimOpts.CycleLength
    Get #1, , SimOpts.Decaydelay
    Get #1, , SimOpts.DecayType
    
    'obsolete
    Get #1, , SimOpts.Costs(MOVECOST)
    
    Get #1, , SimOpts.F1
    Get #1, , SimOpts.Restart
    
    'newer stuff
    If Not EOF(1) Then Get #1, , SimOpts.Dxsxconnected
    If Not EOF(1) Then Get #1, , SimOpts.Updnconnected
    If Not EOF(1) Then Get #1, , SimOpts.RepopAmount
    If Not EOF(1) Then Get #1, , SimOpts.RepopCooldown
    If Not EOF(1) Then Get #1, , SimOpts.ZeroMomentum
    If Not EOF(1) Then Get #1, , SimOpts.UserSeedNumber
    If Not EOF(1) Then Get #1, , SimOpts.UserSeedToggle
    
    If Not EOF(1) Then Get #1, , SimOpts.SpeciesNum
    
    For k = 0 To SimOpts.SpeciesNum - 1
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Colind
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).color
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Fixed
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.mutarray
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.Mutations
      If Not EOF(1) Then Get #1, , j: SimOpts.Specie(k).Name = Space(Abs(j))
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Name
      
      'obsolete
      'If Not EOF(1) Then Get #1, , SimOpts.Specie(k).omnifeed
      If Not EOF(1) Then Get #1, , tempbool
      
      If Not EOF(1) Then Get #1, , j: SimOpts.Specie(k).path = Space(j)
      If Not EOF(1) Then
        Get #1, , SimOpts.Specie(k).path
        
        'New for 2.42.5.  Insure the path points to our main directory. It might be a sim that was saved before hand on a different machine.
        'First, we strip off the working directory portion of the robot path
        'We have to do it this way since the sim could have come from a different machine with a different install directory
        temp = SimOpts.Specie(k).path
        s2 = Left(temp, 7)
        While s2 <> "\Robots" And Len(temp) > 7
          temp = Right(temp, Len(temp) - 1)
          s2 = Left(temp, 7)
        Wend
        SimOpts.Specie(k).path = temp
                
        'Now we add on the main directory to get the full path.  The sim may have come from a different machine, but at least
        'now the path points to the right main directory...
        SimOpts.Specie(k).path = MDIForm1.MainDir + SimOpts.Specie(k).path
      End If
      
      If Not EOF(1) Then Get #1, , s 'SimOpts.Specie(k).Posdn 'EricL 4/1/06 Changed these to use the variable s
      If Not EOF(1) Then Get #1, , s 'SimOpts.Specie(k).Poslf
      If Not EOF(1) Then Get #1, , s 'SimOpts.Specie(k).Posrg
      If Not EOF(1) Then Get #1, , s 'SimOpts.Specie(k).Postp
      
      SimOpts.Specie(k).Posdn = 1
      SimOpts.Specie(k).Posrg = 1
      SimOpts.Specie(k).Poslf = 0
      SimOpts.Specie(k).Postp = 0
      
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).qty
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Skin
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Stnrg
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Veg
    Next k
    
    If Not EOF(1) Then Get #1, , SimOpts.VegFeedingMethod
    If Not EOF(1) Then Get #1, , SimOpts.VegFeedingToBody
    
    'New for 2.4
    If Not EOF(1) Then Get #1, , SimOpts.CoefficientStatic
    If Not EOF(1) Then Get #1, , SimOpts.CoefficientKinetic
    If Not EOF(1) Then Get #1, , SimOpts.PlanetEaters
    If Not EOF(1) Then Get #1, , SimOpts.PlanetEatersG
    If Not EOF(1) Then Get #1, , SimOpts.Viscosity
    If Not EOF(1) Then Get #1, , SimOpts.Density
    
    'EricL - 4/1/06 Fixed bug by adding -1.  Loop was executing one too many times...
    For k = 0 To SimOpts.SpeciesNum - 1
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.CopyErrorWhatToChange
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.PointWhatToChange
      
      For j = 0 To 20
        If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.Mean(j)
        If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Mutables.StdDev(j)
      Next j
    Next k
    
    For k = 0 To 70
      If Not EOF(1) Then Get #1, , SimOpts.Costs(k)
    Next k
    
    For k = 0 To SimOpts.SpeciesNum - 1
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Poslf
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Posrg
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Postp
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Posdn
    Next k
    
    If Not EOF(1) Then Get #1, , SimOpts.BadWastelevel 'EricL 4/1/2006 Added this
    'EricL 4/1/2006 Default value so as to avoid divide by zero problems when loading older saved sim files
    If SimOpts.BadWastelevel = 0 Then SimOpts.BadWastelevel = 400
    
    If Not EOF(1) Then Get #1, , SimOpts.chartingInterval 'EricL 4/1/2006 Added this
    'EricL May be cases where 0 is read from old format files which can cause divide by 0 problems later
    If SimOpts.chartingInterval <= 0 Or SimOpts.chartingInterval > 32000 Then SimOpts.chartingInterval = 200
     
    SimOpts.CoefficientElasticity = 0 'Set a reasonable value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.CoefficientElasticity 'EricL 4/29/2006 Added this
        
    SimOpts.FluidSolidCustom = 2 'Set to custom as a default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.FluidSolidCustom 'EricL 5/7/2006 Added this for UI initialization
    If SimOpts.FluidSolidCustom < 0 Or SimOpts.FluidSolidCustom > 2 Then SimOpts.FluidSolidCustom = 2
    
    SimOpts.CostRadioSetting = 2 'Set to custom as a default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.CostRadioSetting 'EricL 5/7/2006 Added this for UI initialization
    If SimOpts.CostRadioSetting < 0 Or SimOpts.CostRadioSetting > 2 Then SimOpts.CostRadioSetting = 2
    
    SimOpts.MaxVelocity = 40     'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.MaxVelocity 'EricL 5/16/2006 Added this - was not saved before
    If SimOpts.MaxVelocity <= 0 Or SimOpts.MaxVelocity > 200 Then SimOpts.MaxVelocity = 40
    
    SimOpts.NoShotDecay = False   'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.NoShotDecay 'EricL 6/8/2006 Added this
    
    SimOpts.SunUpThreshold = 500000   'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.SunUpThreshold 'EricL 6/8/2006 Added this
    
    SimOpts.SunUp = False   'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.SunUp 'EricL 6/8/2006 Added this
    
    SimOpts.SunDownThreshold = 1000000   'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.SunDownThreshold 'EricL 6/8/2006 Added this
    
    SimOpts.SunDown = False   'Set to a reasonable default value for older saved sim files
    If Not EOF(1) Then Get #1, , SimOpts.SunDown 'EricL 6/8/2006 Added this
    
    SimOpts.AutoSaveStripMutations = False
    If Not EOF(1) Then Get #1, , SimOpts.AutoSaveStripMutations
    
    SimOpts.AutoSaveDeleteOlderFiles = False
    If Not EOF(1) Then Get #1, , SimOpts.AutoSaveDeleteOlderFiles
    
    SimOpts.FixedBotRadii = False
    If Not EOF(1) Then Get #1, , SimOpts.FixedBotRadii
    
    SimOpts.DayNightCycleCounter = 0
    If Not EOF(1) Then Get #1, , SimOpts.DayNightCycleCounter
    
    SimOpts.Daytime = True
    If Not EOF(1) Then Get #1, , SimOpts.Daytime
    
    SimOpts.SunThresholdMode = 0
    If Not EOF(1) Then Get #1, , SimOpts.SunThresholdMode
      
    numTeleporters = 0
    If Not EOF(1) Then Get #1, , numTeleporters
    
    t = numTeleporters
        
    For X = 1 To numTeleporters
      LoadTeleporter 1, X
    Next X
    
    For X = 1 To numTeleporters
     If Teleporters(X).Internet Then
       DeleteTeleporter (X)
     End If
    Next X
    
    numObstacles = 0
    If Not EOF(1) Then Get #1, , numObstacles
           
    For X = 1 To numObstacles
      LoadObstacle 1, X
    Next X
    
    SimOpts.AutoSaveDeleteOldBotFiles = False
    If Not EOF(1) Then Get #1, , SimOpts.AutoSaveDeleteOldBotFiles
    
    For k = 0 To SimOpts.SpeciesNum - 1
      SimOpts.Specie(k).CantSee = False
      SimOpts.Specie(k).DisableDNA = False
      SimOpts.Specie(k).DisableMovementSysvars = False
    
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).CantSee
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).DisableDNA
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).DisableMovementSysvars
    Next k
    
    SimOpts.shapesAreVisable = False
    If Not EOF(1) Then Get #1, , SimOpts.shapesAreVisable
    
    SimOpts.allowVerticalShapeDrift = False
    If Not EOF(1) Then Get #1, , SimOpts.allowVerticalShapeDrift
    
    SimOpts.allowHorizontalShapeDrift = False
    If Not EOF(1) Then Get #1, , SimOpts.allowHorizontalShapeDrift
    
    SimOpts.shapesAreSeeThrough = False
    If Not EOF(1) Then Get #1, , SimOpts.shapesAreSeeThrough
    
    SimOpts.shapesAbsorbShots = False
    If Not EOF(1) Then Get #1, , SimOpts.shapesAbsorbShots
    
    SimOpts.shapeDriftRate = 0
    If Not EOF(1) Then Get #1, , SimOpts.shapeDriftRate
    
    SimOpts.makeAllShapesTransparent = False
    If Not EOF(1) Then Get #1, , SimOpts.makeAllShapesTransparent
    
    SimOpts.makeAllShapesBlack = False
    If Not EOF(1) Then Get #1, , SimOpts.makeAllShapesBlack
     
    For k = 0 To SimOpts.SpeciesNum - 1
      SimOpts.Specie(k).CantReproduce = False
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).CantReproduce
    Next k
    
    maxshotarray = 0
    If Not EOF(1) Then Get #1, , maxshotarray
        
    If maxshotarray <> 0 And maxshotarray > 0 And maxshotarray < 1000000 Then
      ReDim Shots(maxshotarray)
               
      For j = 1 To maxshotarray
        LoadShot 1, j
      Next j
      RemapAllShots maxshotarray
    Else
      ' Old sim with no saved shots
      ' Init the shots array (this used to be done in StartLoaded
      maxshotarray = 100
      ReDim Shots(maxshotarray)
      For j = 1 To maxshotarray
        Shots(j).stored = False
        Shots(j).exist = False
        Shots(j).parent = 0
      Next j
    End If
    
    SimOpts.MaxAbsNum = MaxRobs
    If Not EOF(1) Then Get #1, , SimOpts.MaxAbsNum
    
    For k = 0 To SimOpts.SpeciesNum - 1
      SimOpts.Specie(k).VirusImmune = False
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).VirusImmune
    Next k
    
    For k = 0 To SimOpts.SpeciesNum - 1
      SimOpts.Specie(k).population = 0
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).population
      
      SimOpts.Specie(k).SubSpeciesCounter = 0
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).SubSpeciesCounter
    Next k
    
    For k = 0 To SimOpts.SpeciesNum - 1
      SimOpts.Specie(k).Native = True  ' Default
      If Not EOF(1) Then Get #1, , SimOpts.Specie(k).Native
    Next k
        
    If Not EOF(1) Then Get #1, , SimOpts.EGridWidth
    
    SimOpts.EGridEnabled = False
    If Not EOF(1) Then Get #1, , SimOpts.EGridEnabled
    
    If Not EOF(1) Then Get #1, , SimOpts.oldCostX
    
    SimOpts.DisableMutations = False
    If Not EOF(1) Then Get #1, , SimOpts.DisableMutations
    If CInt(SimOpts.DisableMutations) > 1 Or CInt(SimOpts.DisableMutations) < 0 Then
      SimOpts.DisableMutations = False
    End If
              
    SimOpts.SimGUID = CLng(Rnd)
    If Not EOF(1) Then Get #1, , SimOpts.SimGUID
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationGenerationalDistance
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationGeneticDistance
    If Not EOF(1) Then Get #1, , SimOpts.EnableAutoSpeciation
    
    SimOpts.SpeciationMinimumPopulation = 10
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationMinimumPopulation
    
    SimOpts.SpeciationForkInterval = 5000
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationForkInterval
    
  Close 1
  
  If SimOpts.Costs(DYNAMICCOSTSENSITIVITY) = 0 Then SimOpts.Costs(DYNAMICCOSTSENSITIVITY) = 500
   
  'EricL 3/28/2006 This line insures that all the simulation dialog options get set to match the loaded sim
  TmpOpts = SimOpts
  Form1.MousePointer = vbArrow
End Sub

' loads a single robot
Public Sub LoadRobot(fnum As Integer, ByVal n As Integer)
  LoadRobotBody 1, n
  If rob(n).exist Then
    GiveAbsNum n
    insertsysvars n
    ScanUsedVars n
    makeoccurrlist n
    rob(n).DnaLen = DnaLen(rob(n).DNA())
    rob(n).genenum = CountGenes(rob(n).DNA())
    rob(n).mem(DnaLenSys) = rob(n).DnaLen
    rob(n).mem(GenesSys) = rob(n).genenum
   ' UpdateBotBucket n
  End If
End Sub

' assignes a robot his unique code
Public Sub GiveAbsNum(k As Integer)
 ' Dim n As Integer, Max As Long
  'For n = 1 To MaxRobs
  '  If Max < rob(n).AbsNum Then
  '    Max = rob(n).AbsNum
  '  End If
  'Next n
  'rob(k).AbsNum = Max + 1
  If rob(k).AbsNum = 0 Then
    SimOpts.MaxAbsNum = SimOpts.MaxAbsNum + 1
    rob(k).AbsNum = SimOpts.MaxAbsNum
  End If
End Sub

' saves a single robot
Public Sub SaveRobot(n As Integer, path As String)
  Open path For Binary As 1
    SaveRobotBody 1, n
  Close 1
End Sub
' loads the body of the robot
Private Sub LoadRobotBody(n As Integer, r As Integer)
'robot r
'file #n,
  Dim t As Integer, k As Integer, ind As Integer, Fe As Byte, L1 As Long
  Dim MessedUpMutations As Boolean
  
  MessedUpMutations = False
  With rob(r)
    Get #n, , .Veg
    Get #n, , .wall
    Get #n, , .Fixed
    
    Get #n, , .pos.X
    Get #n, , .pos.Y
    Get #n, , .vel.X
    Get #n, , .vel.Y
    Get #n, , .aim
    Get #n, , .ma           'momento angolare
    Get #n, , .mt           'momento torcente
    
    .BucketPos.X = -2
    .BucketPos.Y = -2
     
    'ties
    For t = 0 To MAXTIES
      Get #n, , .Ties(t).Port
      Get #n, , .Ties(t).pnt
      Get #n, , .Ties(t).ptt
      Get #n, , .Ties(t).ang
      Get #n, , .Ties(t).bend
      Get #n, , .Ties(t).angreg
      Get #n, , .Ties(t).ln
      Get #n, , .Ties(t).shrink
      Get #n, , .Ties(t).stat
      Get #n, , .Ties(t).last
      Get #n, , .Ties(t).mem
      Get #n, , .Ties(t).back
      Get #n, , .Ties(t).nrgused
      Get #n, , .Ties(t).infused
      Get #n, , .Ties(t).sharing
    Next t
    
    Get #n, , .nrg
    
    For t = 1 To 50
      Get #n, , k: .vars(t).Name = Space(k)
      Get #n, , .vars(t).Name   '|
      Get #n, , .vars(t).value
    Next t
    Get #n, , .vnum             '| variabili private
    
    ' macchina virtuale
    Get #n, , .mem()       ' memoria dati
    Get #n, , k: ReDim .DNA(k)
    
    For t = 1 To k
      Get #n, , .DNA(t).tipo
      Get #n, , .DNA(t).value
    Next t
    
    'Force an end base pair to protect against DNA corruption
    .DNA(k).tipo = 10
    .DNA(k).value = 1
        
        
    'EricL Set reasonable default values to protect against corrupted sims that don't read these values
    SetDefaultMutationRates .Mutables
    
    For t = 0 To 20
      Get #n, , .Mutables.mutarray(t)
    Next t
    
    ' informative
    Get #n, , .SonNumber
    Get #n, , .Mutations
    Get #n, , .LastMut
    Get #n, , .parent
    Get #n, , .age
    Get #n, , .BirthCycle
    Get #n, , .genenum
    Get #n, , .generation
    Get #n, , .DnaLen
    
    ' aspetto
    Get #n, , .Skin()
    Get #n, , .color
    
    'new stuff using FileContinue conditions for backward and forward compatability
    If FileContinue(1) Then Get #n, , .body: .radius = FindRadius(.body)
    If FileContinue(1) Then Get #n, , .Bouyancy
    If FileContinue(1) Then Get #n, , .Corpse
    If FileContinue(1) Then Get #n, , .Pwaste
    If FileContinue(1) Then Get #n, , .Waste
    If FileContinue(1) Then Get #n, , .poison
    If FileContinue(1) Then Get #n, , .venom
    If FileContinue(1) Then Get #n, , .Shape
    If FileContinue(1) Then Get #n, , .exist
    If FileContinue(1) Then Get #n, , .Dead
    
    If FileContinue(1) Then Get #n, , k: .FName = Space(k)
    If FileContinue(1) Then Get #n, , .FName
            
    If FileContinue(1) Then Get #n, , k: .LastOwner = Space(k)
    If FileContinue(1) Then Get #n, , .LastOwner
    If .LastOwner = "" Then .LastOwner = "Local"
    
    If FileContinue(1) Then Get #n, , k
       
    'EricL 5/2/2006  This needs some explaining.  The length of the mutation details can exceed 2^15 -1 for bots with lots
    'of mutations.  If we are reading an old file, the length could be negative in which case we read what we can and then punt and skip the
    'rest of the bot.  We will miss some stuff, like the mutation settings, but at least the sim will load.
    'If the sim file was stored with 2.42.4 or later and this bot has a ton of mutation details, then an Int value of 1
    'indicates the actual length of the mutation details is stored as a Long in which case we read that and continue.
    If k < 0 Then
      'Its an old corrupted file with > 2^15 worth of mutation details.  Bail.
      .LastMutDetail = "Problem reading mutation details.  May be a very old sim.  Please tell the developers.  Mutation Details deleted."
      
      'EricL Set reasonable default values for everything read from this point on.
      .Mutables.Mutations = True

      SetDefaultMutationRates .Mutables
    
      .View = True
      .NewMove = False
      .oldBotNum = 0
      .CantSee = False
      .DisableDNA = False
      .DisableMovementSysvars = False
      .CantReproduce = False
      .VirusImmune = False
      .shell = 0
      .Slime = 0
                     
      GoTo OldFile
    End If
    If k = 1 Then
      'Its a new file with lots of mutations.  Read the actual length stored as a Long
      Get #1, , L1
    Else
      'Not that many mutations for this bot (It's possible its an old file with lots of mutations and the len wrapped.
      'If so, we just read the postiive len and keep going.  Everything following this will be wrong, but the sim should
      'still load.  It's a corner case.  The alternative is to try to parse the mutation details strings directly.  No thanks.
      L1 = CLng(k)
    End If
    
    .LastMutDetail = Space(L1)
    If FileContinue(1) Then Get #1, , .LastMutDetail
    
    If FileContinue(1) Then Get #1, , .Mutables.Mutations
    
    For t = 0 To 20
      If FileContinue(1) Then Get #1, , .Mutables.Mean(t)
      If FileContinue(1) Then Get #1, , .Mutables.StdDev(t)
    Next t
    
    For t = 0 To 20
      If .Mutables.Mean(t) < 0 Or .Mutables.Mean(t) > 32000 Or .Mutables.StdDev(t) < 0 Or .Mutables.StdDev(t) > 32000 Then MessedUpMutations = True
    Next t
        
    If FileContinue(1) Then Get #1, , .Mutables.CopyErrorWhatToChange
    If FileContinue(1) Then Get #1, , .Mutables.PointWhatToChange
    
    If .Mutables.CopyErrorWhatToChange < 0 Or .Mutables.CopyErrorWhatToChange > 32000 Or .Mutables.PointWhatToChange < 0 Or .Mutables.PointWhatToChange > 32000 Then
      MessedUpMutations = True
    End If
    
     'If we read wacky values, the file was saved with an older version which messed these up.  Set the defaults.
    If MessedUpMutations Then
      SetDefaultMutationRates .Mutables
    End If
    
    If FileContinue(1) Then Get #1, , .View
    If FileContinue(1) Then Get #1, , .NewMove
    
    .oldBotNum = 0
    If FileContinue(1) Then Get #1, , .oldBotNum
      
    .CantSee = False
    If FileContinue(1) Then Get #1, , .CantSee
    If CInt(.CantSee) > 0 Or CInt(.CantSee) < -1 Then .CantSee = False ' Protection against corrpt sim files.
    
    .DisableDNA = False
    If FileContinue(1) Then Get #1, , .DisableDNA
    If CInt(.DisableDNA) > 0 Or CInt(.DisableDNA) < -1 Then .DisableDNA = False ' Protection against corrpt sim files.
    
    .DisableMovementSysvars = False
    If FileContinue(1) Then Get #1, , .DisableMovementSysvars
    If CInt(.DisableMovementSysvars) > 0 Or CInt(.DisableMovementSysvars) < -1 Then .DisableMovementSysvars = False    ' Protection against corrpt sim files.
    
    .CantReproduce = False
    If FileContinue(1) Then Get #1, , .CantReproduce
    If CInt(.CantReproduce) > 0 Or CInt(.CantReproduce) < -1 Then .CantReproduce = False ' Protection against corrpt sim files.
    
    .shell = 0
    If FileContinue(1) Then Get #1, , .shell
    
    If .shell > 32000 Then .shell = 32000
    If .shell < 0 Then .shell = 0
    
    .Slime = 0
    If FileContinue(1) Then Get #1, , .Slime
            
    If .Slime > 32000 Then .Slime = 32000
    If .Slime < 0 Then .Slime = 0
    
    .VirusImmune = False
    If FileContinue(1) Then Get #1, , .VirusImmune
    If CInt(.VirusImmune) > 0 Or CInt(.VirusImmune) < -1 Then .VirusImmune = False ' Protection against corrpt sim files.
    
    .SubSpecies = 0 ' For older sims saved before this was implemented, set the sup species to be the bot's number.  Every bot is a sub species.
    If FileContinue(1) Then Get #1, , .SubSpecies
    
    .spermDNAlen = 0
    If FileContinue(1) Then Get #1, , .spermDNAlen: ReDim .spermDNA(.spermDNAlen)
    For t = 1 To .spermDNAlen
      If FileContinue(1) Then Get #1, , .spermDNA(t).tipo
      If FileContinue(1) Then Get #1, , .spermDNA(t).value
    Next t
    
    .fertilized = -1
    If FileContinue(1) Then Get #1, , .fertilized
    
    If FileContinue(1) Then Get #1, , .AncestorIndex
    For t = 0 To 500
      If FileContinue(1) Then Get #1, , .Ancestors(t).mut
      If FileContinue(1) Then Get #1, , .Ancestors(t).num
      If FileContinue(1) Then Get #1, , .Ancestors(t).sim
    Next t
    
    .sim = 0
    If FileContinue(1) Then Get #1, , .sim
    If FileContinue(1) Then Get #1, , .AbsNum
    
    'read in any future data here
    
OldFile:
    'burn through any new data from a different version
    While FileContinue(1)
      Get #1, , Fe
    Wend
    
    'grab these three FE codes
    Get #1, , Fe
    Get #1, , Fe
    Get #1, , Fe
    
    'don't you dare put anything after this!
    'except some initialization stuff
    .Vtimer = 0
    .virusshot = 0
  End With
End Sub

Private Function FileContinue(filenumber As Integer) As Boolean
  'three FE bytes (ie: 254) means we are at the end of the record
  
  Dim Fe As Byte
  Dim Position As Long
  Dim k As Integer
  
  FileContinue = False
  Position = Seek(1)
   
  Do
    If Not EOF(1) Then
      Get #1, , Fe
    Else
      FileContinue = False
      Fe = 254
    End If
    
    k = k + 1
    
    If Fe <> 254 Then
      FileContinue = True
      'exit immediatly, we are done
    End If
  Loop While Not FileContinue And k < 3
  
  'reset position
  Get #1, Position - 1, Fe
End Function
' saves the body of the robot
Private Sub SaveRobotBody(n As Integer, r As Integer)
  Dim t As Integer, k As Integer
  Dim s As String
  Dim s2 As String
  Dim temp As String
  
  Const Fe As Byte = 254
 ' Dim space As Integer
  
  s = "Mutation Details removed in last save."
  
  With rob(r)
    
    Put #n, , .Veg
    Put #n, , .wall
    Put #n, , .Fixed
    
    ' fisiche
    Put #n, , .pos.X
    Put #n, , .pos.Y
    Put #n, , .vel.X
    Put #n, , .vel.Y
    Put #n, , .aim
    Put #n, , .ma           'momento angolare
    Put #n, , .mt           'momento torcente
    
    For t = 0 To MAXTIES
      Put #n, , .Ties(t).Port
      Put #n, , .Ties(t).pnt
      Put #n, , .Ties(t).ptt
      Put #n, , .Ties(t).ang
      Put #n, , .Ties(t).bend
      Put #n, , .Ties(t).angreg
      Put #n, , .Ties(t).ln
      Put #n, , .Ties(t).shrink
      Put #n, , .Ties(t).stat
      Put #n, , .Ties(t).last
      Put #n, , .Ties(t).mem
      Put #n, , .Ties(t).back
      Put #n, , .Ties(t).nrgused
      Put #n, , .Ties(t).infused
      Put #n, , .Ties(t).sharing
    Next t
    
    ' biologiche
    Put #n, , .nrg
    
    'custom variables we're saving
    For t = 1 To 50
      Put #n, , CInt(Len(.vars(t).Name))
      Put #n, , .vars(t).Name         '|
      Put #n, , .vars(t).value
    Next t

    Put #n, , .vnum            '| variabili private
    
    ' macchina virtuale
    Put #n, , .mem()
    k = DnaLen(rob(r).DNA()): Put #n, , k
    For t = 1 To k
      Put #n, , .DNA(t).tipo
      Put #n, , .DNA(t).value
    Next t
    
    For t = 0 To 20
      Put #n, , .Mutables.mutarray(t)
    Next t
    
    ' informative
    Put #n, , .SonNumber
    Put #n, , .Mutations
    Put #n, , .LastMut
    Put #n, , .parent
    Put #n, , .age
    Put #n, , .BirthCycle
    Put #n, , .genenum
    Put #n, , .generation
    Put #n, , .DnaLen
    
    ' aspetto

    Put #n, , .Skin()
    Put #n, , .color
    
    ' new features
    Put #n, , .body
    Put #n, , .Bouyancy
    Put #n, , .Corpse
    Put #n, , .Pwaste
    Put #n, , .Waste
    Put #n, , .poison
    Put #n, , .venom
    Put #n, , .Shape
    Put #n, , .exist
    Put #n, , .Dead
    
    Put #n, , CInt(Len(.FName))
    Put #n, , .FName
    
    Put #n, , CInt(Len(.LastOwner))
    Put #n, , .LastOwner
    
    'EricL 5/8/2006 New feature allows for saving sims without all the mutations details
    If MDIForm1.SaveWithoutMutations Then
      Put #n, , CInt(Len(s))
      Put #n, , s
    Else
      'EricL 5/3/2006  This needs some explaining.  It's all about backward compatability.  The length of the mutation details
      'was stored as an Integer in older sim file versions.  It can overflow and go negative or even wrap positive
      'again in sims with lots of mutations.  So, we test to see if it would have overflowed and it so, we write
      'the interger 1 there instead of the actual length.  Since the actual details, being string descriptions,
      'should never have length 1, this is a signal to the sim file read routine that the real length is a Long
      'stored right after the Int.
      If CLng(Len(.LastMutDetail)) > CLng((2 ^ 15 - 1)) Then
        ' Lots of mutations.  Tell the read routine that the real length is Long valued and coming up next.
        Put #n, , CInt(1)
        Put #n, , CLng(Len(.LastMutDetail)) ' The real length
      Else
        'Not so many mutation details.  Leave the length as an Int for backward compatability
        Put #n, , CInt(Len(.LastMutDetail))
      End If
      Put #n, , .LastMutDetail
    End If
    
    'EricL 3/30/2006 Added the following line.  Looks like it was just missing.  Mutations were turned off after loading save...
    Put #n, , .Mutables.Mutations
        
    For t = 0 To 20
      Put #n, , .Mutables.Mean(t)
      Put #n, , .Mutables.StdDev(t)
    Next t
    
    Put #n, , .Mutables.CopyErrorWhatToChange
    Put #n, , .Mutables.PointWhatToChange
    
    Put #n, , .View
    Put #n, , .NewMove
    Put #n, , r  'EricL  New for 2.42.8.  Save Robot number for use in re-mapping ties and shots when re-loaded

    Put #n, , .CantSee
    Put #n, , .DisableDNA
    Put #n, , .DisableMovementSysvars
    Put #n, , .CantReproduce
    Put #n, , .shell
    Put #n, , .Slime
    Put #n, , .VirusImmune
    Put #n, , .SubSpecies
    
    If .fertilized < 0 Then .spermDNAlen = 0
    
    Put #n, , .spermDNAlen
    For t = 1 To .spermDNAlen
      Put #n, , .spermDNA(t).tipo
      Put #n, , .spermDNA(t).value
    Next t
    Put #n, , .fertilized
    
    Put #n, , .AncestorIndex
    For t = 0 To 500
      Put #n, , .Ancestors(t).mut
      Put #n, , .Ancestors(t).num
      Put #n, , .Ancestors(t).sim
    Next t
    
    Put #n, , .sim
    Put #n, , .AbsNum
    
    
    'write any future data here
    
    Put #n, , Fe
    Put #n, , Fe
    Put #n, , Fe
  End With
End Sub

' saves a robot dna     !!!New routine from Carlo!!!
Sub salvarob(n As Integer, path As String, Optional nombox As Boolean)
  Dim t As Integer
  Dim a As String
  Dim ti As Byte
  Dim va As Integer
  Dim hold As String
  Dim hashed As String
  t = 1
  Open path For Output As #1
  hold = SaveRobHeader(n)
  hold = hold + DetokenizeDNA(n, True)
  hashed = Hash(hold, 20)
  Print #1, hold
  Print #1, ""
  Print #1, "'#hash: " + hashed
  Close #1
  If Not nombox Then
    If MsgBox("Do you want to change robot's name to " + extractname(path) + " ?", vbYesNo, "Robot DNA saved") = vbYes Then
      rob(n).FName = extractname(path)
    End If
  End If
End Sub

Public Function Load_League_File(Leaguename As String) As Integer
'returns -1 if league doesn't exist,
'0 if successful,
'[1-30] if a robot in the list doesn't exist
'-2 if leaguefile exists but not directory
'-3 if leaguefile contains too many entrants
'-4 if leaguefile contains too few entrants
'-5 if leaguefile contains an unknown error
  Dim FileName As String
  Dim Line As String
  Dim singlecharacter As String
  Dim currpos As Long
  Dim robotname As String
  Dim robotcomment As String
  Dim length As Long
 
  FileName = MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt"
  
  On Error GoTo Nosuchfile
  Open FileName For Input As 1
    
  Line Input #1, Line
  Line = Line + "'"
  currpos = 1
  singlecharacter = Mid(Line, currpos, 1)
  
  On Error GoTo invalidfile
  While True
    While singlecharacter <> "#"
      If singlecharacter = "1" Then
        If Left(Line, 3) = "1 -" Then
          'start of robot list, exit physics loop
          GoTo endloop
        End If
      End If
      
      currpos = currpos + 1
      If singlecharacter = "'" Then
        Line Input #1, Line
        currpos = 1
        singlecharacter = Mid(Line, currpos, 1)
      End If
    Wend
    
    'we now have the pos of a physics line
    If Mid(Line, currpos, 3) = "#F1" Then
      SimOpts.F1 = True
      SimOpts.CorpseEnabled = False
      SimOpts.Costs(SHOTCOST) = 2
      SimOpts.CostExecCond = 0.004
      SimOpts.Costs(COSTSTORE) = 0.04
      SimOpts.DayNight = False
      SimOpts.FieldWidth = 9237
      SimOpts.FieldHeight = 6928
      SimOpts.FieldSize = 1
      SimOpts.MaxEnergy = 40
      SimOpts.MaxPopulation = 25
      SimOpts.MinVegs = 10
      SimOpts.Pondmode = False
      SimOpts.PhysBrown = 0
      SimOpts.Toroidal = True
    Else
      'custom physics.
    End If
    
    Line Input #1, Line
    singlecharacter = Mid(Line, currpos, 1)
  Wend
endloop:
  
  'we are now at the start of the robot declaration list.  Add these robots to
  'the league table
  Dim Index As Integer
  
  For Index = 0 To 30
    FileName = MDIForm1.MainDir + "\Leagues\" + Leaguename + "league\" 'directory of league robots
    Line = Line + "'"
    
    length = InStr(Line, "'") - 1
    If Right(Left(Line, length), 1) = " " Then length = length - 1
    robotname = Left(Line, length)
    robotcomment = Right(Line, Len(Line) - length)
    robotcomment = Left(robotcomment, Len(robotcomment) - 1)
    robotname = Right(robotname, Len(robotname) - 4) 'takes everything besides teh "1 - " at start of line and " 'blah..." at end of line
    If robotname = "EMPTY" Or robotname = "" Then
      Add_Blank_Specie Index
    Else
      robotname = FileName + robotname + ".txt" 'now we have the path and filename of the robot
      'add robot robotname to LeagueEntrants array
      Add_Specie robotname, Index, robotcomment
    End If
    
    If EOF(1) Then GoTo endloop2
    
    Line Input #1, Line
  Next Index
endloop2:
  
  Index = Index + 1
  'write emptys to the rest of the array
  For Index = Index To 30
    Add_Blank_Specie Index
  Next Index
  
  Close_League_File
  Load_League_File = 0
  Exit Function
  
Nosuchfile:
  Close_League_File
  MsgBox FileName + " doesn't exist.", vbOKOnly, "League File Not Found"
  Load_League_File = -1
  Exit Function
invalidfile:
  Close_League_File
  MsgBox "Error reading from " + FileName + ".  Abandoning attempt.", vbOKOnly, "File Reading Error"
  Load_League_File = -5
  Exit Function
End Function

Public Sub Close_League_File()
  Close 1
End Sub

Private Sub Add_Specie(path As String, k As Integer, leaguecomment As String)
  LeagueEntrants(k).Posrg = 1
  LeagueEntrants(k).Posdn = 1
  LeagueEntrants(k).Poslf = 0
  LeagueEntrants(k).Postp = 0
  LeagueEntrants(k).Name = extractname(path)
  LeagueEntrants(k).path = extractpath(path)
  LeagueEntrants(k).path = relpath(LeagueEntrants(k).path)
  LeagueEntrants(k).Veg = False
  LeagueEntrants(k).color = vbBlue
  Dim t As Integer
  LeagueEntrants(k).Mutables.Mutations = False
  'For t = 0 To 15
  '  LeagueEntrants(k).mutarray(t) = 0
  'Next t
  LeagueEntrants(k).qty = 5
  LeagueEntrants(k).Stnrg = 3000
  LeagueEntrants(k).Fixed = False
  
  Dim i As Integer
  For i = 0 To 7 Step 2
    LeagueEntrants(k).Skin(i) = Random(0, half)
    LeagueEntrants(k).Skin(i + 1) = Random(0, 628)
  Next i
  
  LeagueEntrants(k).Leaguefilecomment = leaguecomment
End Sub

Private Sub Add_Blank_Specie(k As Integer)
  Dim Specie As datispecie
   
  LeagueEntrants(k) = Specie
End Sub

Public Function Save_League_File(FName As String) As Integer
  Dim FileName As String
  Dim tofilename As String
  Dim Line As String
  Dim singlecharacter As String
  Dim currpos As Long
  Dim robotname As String
  Dim length As Long
  Dim loopdone As Boolean
  Dim originalleague As Boolean
 
  FileName = MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt"
  tofilename = MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.tmp"
     
  'EricL - new code added March 15, 2006
  'If the Leagues directory doesn't exist yet, create it
  If dir$(MDIForm1.MainDir + "\Leagues\*.*") = "" Then
    MkDir MDIForm1.MainDir + "\Leagues"
  End If
       
  'EricL - Moved following three lines here from below
  'Create the directory for the specific league name if it does not exist.
  If dir$(MDIForm1.MainDir + "\Leagues\" + Leaguename + "league\*.*") = "" Then
    MkDir MDIForm1.MainDir + "\Leagues\" + Leaguename + "league"
  End If
  
  On Error GoTo Nosuchfile
  Open FileName For Input As 1
enderror:
   
  On Error GoTo problem
  Open tofilename For Output As 2
    
  If originalleague = False Then
    Line Input #1, Line
    If Left(Line, 4) = "1 - " Then loopdone = True
    While Not loopdone And Not EOF(1)
      Print #2, Line
      Line Input #1, Line
      If Left(Line, 4) = "1 - " Then loopdone = True
    Wend
  Else
    Line = "'New league created by program."
    Print #2, Line
    Line = "#F1"
    Print #2, Line
  End If
  
  'now we write robot data
 
  'EricL - Three lines above used to be here
  
  Dim Index As Integer
  For Index = 1 To 9
    Line = Index
    Line = Line + " - "
    If LeagueEntrants(Index - 1).Name = "" Then LeagueEntrants(Index - 1).Name = "EMPTY.TXT"
    Line = Line + Left(LeagueEntrants(Index - 1).Name, Len(LeagueEntrants(Index - 1).Name) - 4)
    Line = Line + LeagueEntrants(Index - 1).Leaguefilecomment
    Print #2, Line
    
    If Not LeagueEntrants(Index - 1).Name = "EMPTY.TXT" Then
      'if this robot doesn't exist in the league directory, copy its file to the league directory
      If dir$(MDIForm1.MainDir + "\Leagues\" + Leaguename + "league\" + LeagueEntrants(Index - 1).Name) = "" And LeagueEntrants(Index - 1).Name <> "" Then
        Dim tempstring As String
      
        tempstring = LeagueEntrants(Index - 1).path + "\" + LeagueEntrants(Index - 1).Name
        If (Left(tempstring, 2) = "&#") Then
          tempstring = MDIForm1.MainDir + Right(tempstring, Len(tempstring) - 2)
        End If
        If dir$(tempstring) <> "" Then
          FileCopy tempstring, MDIForm1.MainDir + "\Leagues\" + Leaguename + "league\" + LeagueEntrants(Index - 1).Name
        Else
          MsgBox "Error copying " + LeagueEntrants(Index - 1).path + "\" + LeagueEntrants(Index - 1).Name + " into league directory.  Continuing...", vbOKOnly, "Copy File Error"
        End If
      End If
    End If
  Next Index
  
  For Index = 10 To 30
    Line = Index
    Line = Line + "- "
    If LeagueEntrants(Index - 1).Name = "" Then LeagueEntrants(Index - 1).Name = "EMPTY.TXT"
    Line = Line + Left(LeagueEntrants(Index - 1).Name, Len(LeagueEntrants(Index - 1).Name) - 4)
    Line = Line + LeagueEntrants(Index - 1).Leaguefilecomment
    Print #2, Line
  Next Index
  
  Close #1
  Close #2
  
  If dir$(MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.bak") = " " Then
    Kill MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.bak"
  End If
  
  'move leaguetable.txt to leaguetable.bak.
  If Not originalleague Then
    FileCopy MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt", MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.bak"
  End If
  
  If dir$(MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt") = " " Then
     Kill MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt"
  End If
  
  'replace leaguetable.txt with leaguetable.tmp
  FileCopy MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.tmp", MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.txt"
  
  Exit Function
  
Nosuchfile:
  Close #1
  originalleague = True
  GoTo enderror
  
problem:
  Close #1
  Close #2
  MsgBox "Error writing to " + MDIForm1.MainDir + "\Leagues\" + Leaguename + "leaguetable.tmp.  Abandoning save attempt.", vbOKOnly, "Save file error"
  Save_League_File = -1
  Exit Function
End Function

' saves a Teleporter
Private Sub SaveTeleporter(n As Integer, t As Integer)
    
  Const Fe As Byte = 254

  With Teleporters(t)
    Put #n, , .pos
    Put #n, , .Width
    Put #n, , .Height
    Put #n, , .color
    Put #n, , .vel
    Put #n, , CInt(Len(.path))
    Put #n, , .path
    Put #n, , .In
    Put #n, , .Out
    Put #n, , .local
    Put #n, , .driftHorizontal
    Put #n, , .driftVertical
    Put #n, , .highlight
    Put #n, , .teleportVeggies
    Put #n, , .teleportCorpses
    Put #n, , .RespectShapes
    Put #n, , .NumTeleported
    Put #n, , .teleportHeterotrophs
    Put #n, , .InboundPollCycles
    Put #n, , .BotsPerPoll
    Put #n, , .PollCountDown
    Put #n, , .Internet
        
    'write any future data here
    
    Put #n, , Fe
    Put #n, , Fe
    Put #n, , Fe
    'don't you dare put anything after this!
    
  End With
End Sub

' loads a Teleporter
Private Sub LoadTeleporter(n As Integer, t As Integer)
  Dim k As Integer
  Dim Fe As Byte

  With Teleporters(t)
    Get #n, , .pos
    Get #n, , .Width
    Get #n, , .Height
    Get #n, , .color
    Get #n, , .vel
    Get #n, , k: .path = Space(k)
    Get #n, , .path
    Get #n, , .In
    Get #n, , .Out
    Get #n, , .local
    Get #n, , .driftHorizontal
    Get #n, , .driftVertical
    Get #n, , .highlight
    Get #n, , .teleportVeggies
    Get #n, , .teleportCorpses
    Get #n, , .RespectShapes
    Get #n, , .NumTeleported
    
    .teleportHeterotrophs = True
    .InboundPollCycles = 10
    .BotsPerPoll = 10
    .PollCountDown = 10
    
    If FileContinue(n) Then Get #n, , .teleportHeterotrophs
    If FileContinue(n) Then Get #n, , .InboundPollCycles
    If FileContinue(n) Then Get #n, , .BotsPerPoll
    If FileContinue(n) Then Get #n, , .PollCountDown
    If FileContinue(n) Then Get #n, , .Internet
    
        
    'burn through any new data from a newer version
    While FileContinue(n)
      Get #n, , Fe
    Wend
    
    'grab these three FE codes
    Get #n, , Fe
    Get #n, , Fe
    Get #n, , Fe
    'don't you dare put anything after this!
    
  End With
End Sub

' saves a Obstacle
Private Sub SaveObstacle(n As Integer, t As Integer)
    
  Const Fe As Byte = 254

  With Obstacles.Obstacles(t)
    Put #n, , .exist
    Put #n, , .pos
    Put #n, , .Width
    Put #n, , .Height
    Put #n, , .color
    Put #n, , .vel
    
    'write any future data here
    
    Put #n, , Fe
    Put #n, , Fe
    Put #n, , Fe
    'don't you dare put anything after this!
    
  End With
End Sub

' loads an Obstacle
Private Sub LoadObstacle(n As Integer, t As Integer)
  Dim k As Integer
  Dim Fe As Byte

  With Obstacles.Obstacles(t)
    Get #n, , .exist
    Get #n, , .pos
    Get #n, , .Width
    Get #n, , .Height
    Get #n, , .color
    Get #n, , .vel
    
    'burn through any new data from a different version
    While FileContinue(n)
      Get #n, , Fe
    Wend
    
    'grab these three FE codes
    Get #n, , Fe
    Get #n, , Fe
    Get #n, , Fe
    
    'don't you dare put anything after this!
  End With
End Sub

'Saves a Shot
'New routine by EricL
Private Sub SaveShot(n As Integer, t As Long)
  Dim k As Integer
  Dim X As Integer
  
  Const Fe As Byte = 254

  With Shots(t)
    Put #n, , .exist       ' exists?
    Put #n, , .pos         ' position vector
    Put #n, , .opos        ' old position vector
    Put #n, , .velocity    ' velocity vector
    Put #n, , .parent      ' who shot it?
    Put #n, , .age         ' shot age
    Put #n, , .nrg         ' energy carrier
    Put #n, , .Range       ' shot range (the maximum .nrg ever was)
    Put #n, , .value       ' power of shot for negative shots (or amt of shot, etc.), value to write for > 0
    Put #n, , .color       ' colour
    Put #n, , .shottype    ' carried location/value couple
    Put #n, , .fromveg     ' does shot come from veg?
    Put #n, , CInt(Len(.FromSpecie))
    Put #n, , .FromSpecie  ' Which species fired the shot
    Put #n, , .Memloc      ' Memory location for custom poison and venom
    Put #n, , .Memval      ' Value to insert into custom venom location
    
    ' Somewhere to store genetic code for a virus or sperm
    If (.shottype = -7 Or .shottype = -8) And .exist And .DnaLen > 0 Then
      Put #n, , .DnaLen
      For X = 1 To .DnaLen
        Put #n, , .DNA(X).tipo
        Put #n, , .DNA(X).value
      Next X
    Else
      k = 0: Put #n, , k
    End If
    
    Put #n, , .genenum     ' which gene to copy in host bot
    Put #n, , .stored      ' for virus shots (and maybe future types) this shot is stored inside the bot until it's ready to be launched
  
    
    'write any future data here
    
    Put #n, , Fe
    Put #n, , Fe
    Put #n, , Fe
    'don't you dare put anything after this!
    
  End With
End Sub

'Loads a Shot
'New routine from EricL
Private Sub LoadShot(n As Integer, t As Long)
  Dim k As Integer
  Dim X As Integer
  Dim Fe As Byte

  With Shots(t)
    Get #n, , .exist       ' exists?
    Get #n, , .pos         ' position vector
    Get #n, , .opos        ' old position vector
    Get #n, , .velocity    ' velocity vector
    Get #n, , .parent      ' who shot it?
    Get #n, , .age         ' shot age
    Get #n, , .nrg         ' energy carrier
    Get #n, , .Range       ' shot range (the maximum .nrg ever was)
    Get #n, , .value       ' power of shot for negative shots (or amt of shot, etc.), value to write for > 0
    Get #n, , .color       ' colour
    Get #n, , .shottype    ' carried location/value couple
    Get #n, , .fromveg     ' does shot come from veg?
    
    Get #n, , k: .FromSpecie = Space(k)
    Get #n, , .FromSpecie  ' Which species fired the shot
    
    Get #n, , .Memloc      ' Memory location for custom poison and venom
    Get #n, , .Memval      ' Value to insert into custom venom location

    
    ' Somewhere to store genetic code for a virus
    Get #n, , k
    If k > 0 Then
      ReDim .DNA(k)
      For X = 1 To k
        Get #n, , .DNA(X).tipo
        Get #n, , .DNA(X).value
      Next X
    End If
    
    .DnaLen = k
    
    Get #n, , .genenum     ' which gene to copy in host bot
    Get #n, , .stored      ' for virus shots (and maybe future types) this shot is stored inside the bot until it's ready to be launched
    
   'burn through any new data from a different version
    While FileContinue(n)
      Get #n, , Fe
    Wend
    
    'grab these three FE codes
    Get #n, , Fe
    Get #n, , Fe
    Get #n, , Fe
    
    'don't you dare put anything after this!
  End With
End Sub


