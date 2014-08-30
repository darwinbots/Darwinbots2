Attribute VB_Name = "HDRoutines"
Option Explicit

'
'   D I S K    O P E R A T I O N S
'

Public Sub movetopos(ByVal s As String, ByVal pos As Integer)  'Botsareus 3/7/2014 Used in Stepladder to move files in specific order
    Dim files As Collection
    Dim tmpname As String
    Dim i As Integer
    Dim j As Integer
    Set files = getfiles(MDIForm1.MainDir & "\league\stepladder")
    If pos > files.count Then
        'just put at end
        FileCopy s, MDIForm1.MainDir & "\league\stepladder\" & (files.count + 1) & "-" & extractname(s)
    Else
        'move files first
        For i = files.count To pos Step -1
            'find a file prefixed i
            For j = 1 To files.count
                tmpname = extractname(files(j))
                If tmpname Like CStr(i) & "-*" Then
                    FileCopy files(j), MDIForm1.MainDir & "\league\stepladder\" & (i + 1) & "-" & Right(tmpname, Len(tmpname) - Len(CStr(i) & "-"))
                    Kill files(j)
                Exit For
                End If
            Next
        Next
        FileCopy s, MDIForm1.MainDir & "\league\stepladder\" & pos & "-" & extractname(s)
    End If
    
    Kill s
End Sub

Public Sub deseed(ByVal s As String) 'Botsareus 2/25/2014 Used in Tournament to get back original names of the files and move to result folder
Dim lastline As String
Dim files As Collection
Set files = getfiles(s)
    Dim i As Integer
    For i = 1 To files.count
        Open files(i) For Input As #1 ' Open file for input.
            Do While Not EOF(1) ' Check for end of file.
            Line Input #1, lastline
            Loop
        Close #1
        lastline = Replace(lastline, "'#tag:", "")
        FileCopy files(i), MDIForm1.MainDir & "\league\Tournament_Results\" & lastline
    Next
End Sub

Public Function NamefileRecursive(ByVal s As String) As String 'Botsareus 1/31/2014 .txt files only
Dim i As Byte
i = Asc("a") - 1
NamefileRecursive = s
Do While dir(NamefileRecursive) <> ""
i = i + 1
If Asc("z") < i Then
    NamefileRecursive = Replace(s, ".txt", "") & "a" & Chr(i - 26) & ".txt"
Else
    NamefileRecursive = Replace(s, ".txt", "") & Chr(i) & ".txt"
End If
Loop
End Function

Public Sub movefilemulti(ByVal source As String, ByVal Out As String, ByVal count As Integer) 'Botsareus 2/18/2014 top/buttom pattern file move
    Dim files As Collection
    Dim last As Boolean
    Dim i As Integer
    For i = 1 To count
        Set files = getfiles(source)
        SortCollection files
        If last Then
            FileCopy files(1), Out & "\" & extractname(files(1))
            Kill files(1)
        Else
            FileCopy files(files.count), Out & "\" & extractname(files(files.count))
            Kill files(files.count)
        End If
        last = Not last
    Next
End Sub

Public Function FolderExists(sFullPath As String) As Boolean
Dim myFSO As Object
Set myFSO = CreateObject("Scripting.FileSystemObject")
FolderExists = myFSO.FolderExists(sFullPath)
End Function

'Botsareus 1/31/2014 Delete this directory and all the files it contains.
Public Sub RecursiveRmDir(ByVal dir_name As String)
Dim file_name As String
Dim files As Collection
Dim i As Integer

    ' Get a list of files it contains.
    Set files = New Collection
    file_name = dir$(dir_name & "\*.*", vbReadOnly + _
        vbHidden + vbSystem + vbDirectory)
    Do While Len(file_name) > 0
        If (file_name <> "..") And (file_name <> ".") Then
            files.Add dir_name & "\" & file_name
        End If
        file_name = dir$()
    Loop

    ' Delete the files.
    For i = 1 To files.count
        file_name = files(i)
        ' See if it is a directory.
        If GetAttr(file_name) And vbDirectory Then
            ' It is a directory. Delete it.
            RecursiveRmDir file_name
        Else
            ' It's a file. Delete it.
            SetAttr file_name, vbNormal
            Kill file_name
        End If
    Next i

    ' The directory is now empty. Delete it.
    RmDir dir_name
End Sub

'Botsareus 1/31/2014  stores all files names in folder into Collection
Function getfiles(ByVal dir_name As String) As Collection
Dim file_name As String
Dim i As Integer

    ' Get a list of files it contains.
    Set getfiles = New Collection
    file_name = dir$(dir_name & "\*.*")
    Do While Len(file_name) > 0
        getfiles.Add dir_name & "\" & file_name
        file_name = dir$()
    Loop
End Function

Private Sub SortCollection(ByRef ColVar As Collection)  'special code to reorder by name
    Dim oCol As Collection
    Dim i As Integer
    Dim i2 As Integer
    Dim iBefore As Integer
    If Not (ColVar Is Nothing) Then
        If ColVar.count > 0 Then
            Set oCol = New Collection
            For i = 1 To ColVar.count
                If oCol.count = 0 Then
                    oCol.Add ColVar(i)
                Else
                    iBefore = 0
                    For i2 = oCol.count To 1 Step -1
                        If val(extractexactname(extractname(ColVar(i)))) < val(extractexactname(extractname(oCol(i2)))) Then
                            iBefore = i2
                        Else
                            Exit For
                        End If
                    Next
                    If iBefore = 0 Then
                        oCol.Add ColVar(i)
                    Else
                        oCol.Add ColVar(i), , iBefore
                    End If
                End If
            Next
            Set ColVar = oCol
            Set oCol = Nothing
        End If
    End If
End Sub


Public Function RecursiveMkDir(destDir As String) As Boolean
   
   Dim i As Long
   Dim prevDir As String
   
   On Error Resume Next
   
   For i = Len(destDir) To 1 Step -1
       If Mid(destDir, i, 1) = "\" Then
           prevDir = Left(destDir, i - 1)
           Exit For
       End If
   Next i
   
   If prevDir = "" Then RecursiveMkDir = False: Exit Function
   If Not Len(dir(prevDir & "\", vbDirectory)) > 0 Then
       If Not RecursiveMkDir(prevDir) Then RecursiveMkDir = False: Exit Function
   End If
   
   On Error GoTo errDirMake
   MkDir destDir
   RecursiveMkDir = True
   Exit Function
   
errDirMake:
   RecursiveMkDir = False

End Function

' inserts organism file in the simulation
' remember that organisms could be made of more than one robot
Public Sub InsertOrganism(path As String)
  Dim x As Single, y As Single
  Dim n As Integer
  x = Random(60, SimOpts.FieldWidth - 60) 'Botsareus 2/24/2013 bug fix: robots location within screen limits
  y = Random(60, SimOpts.FieldHeight - 60)
  n = LoadOrganism(path, x, y)
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
  Close #401
  Open path For Binary As #401
    Put #401, , cnum
    For k = 0 To cnum - 1
      rob(clist(k)).LastOwner = IntOpts.IName
      SaveRobotBody 401, clist(k)
    Next k
  Close #401
  Exit Sub
problem:

 ' MsgBox ("Error saving organism.")
  Close #401
End Sub

'Adds a record to the species array when a bot with a new species is loaded or teleported in
Public Function AddSpecie(n As Integer, IsNative As Boolean) As Integer
  Dim k As Integer
  Dim fso As New FileSystemObject
  Dim robotFile As file
  
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
Public Function LoadOrganism(path As String, x As Single, y As Single) As Integer
  Dim clist(50) As Integer
  Dim OList(50) As Integer
  Dim k As Integer, cnum As Integer
  Dim i As Integer
  Dim nuovo As Integer
  Dim foundSpecies As Boolean
  
tryagain:
  On Error GoTo problem
  Close #402
  Open path For Binary As #402
    Get #402, , cnum
    For k = 0 To cnum - 1
      nuovo = posto()
      clist(k) = nuovo
      LoadRobot 402, nuovo
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
  Close #402
  If x > -1 And y > -1 Then
    PlaceOrganism clist(), x, y
  End If
  RemapTies clist(), OList, cnum

  Exit Function
problem:
  Close #402
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
Public Sub PlaceOrganism(clist() As Integer, x As Single, y As Single)
  Dim k As Integer
  Dim dx As Single, dy As Single
  k = 0
  
  dx = x - rob(clist(0)).pos.x
  dy = y - rob(clist(0)).pos.y
  While clist(k) > 0
    rob(clist(k)).pos.x = rob(clist(k)).pos.x + dx
    rob(clist(k)).pos.y = rob(clist(k)).pos.y + dy
    rob(clist(k)).BucketPos.x = -2
    rob(clist(k)).BucketPos.y = -2
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
  Dim x As Integer
  Dim numSpecies As Integer
  Const Fe As Byte = 254
  Dim fso As New FileSystemObject
  Dim fileToDelete As file
  
  Form1.MousePointer = vbHourglass
  On Error GoTo bypass
  Set fileToDelete = fso.GetFile(path)
  fileToDelete.Delete
    
bypass:
  Open path For Binary As 10
  
  Put #10, , Len(IntOpts.IName)
  Put #10, , IntOpts.IName
  
  numSpecies = 0
  For x = 0 To SimOpts.SpeciesNum - 1
     If SimOpts.Specie(x).population > 0 Then numSpecies = numSpecies + 1
  Next x
  
  Put #10, , numSpecies  ' Only save non-zero populations
  
      
  For x = 0 To SimOpts.SpeciesNum - 1
    If SimOpts.Specie(x).population > 0 Then
      Put #10, , Len(SimOpts.Specie(x).Name)
      Put #10, , SimOpts.Specie(x).Name
      Put #10, , SimOpts.Specie(x).population
      Put #10, , SimOpts.Specie(x).Veg
      Put #10, , SimOpts.Specie(x).color
      
      'write any future data here
    
      'Record ending bytes
      Put #10, , Fe
      Put #10, , Fe
      Put #10, , Fe
    End If
            
  Next x
  
  
  Close 10
  Form1.MousePointer = vbArrow

End Sub

Public Function GetFilePath(FileName As String) As String
    Dim i As Long
    For i = Len(FileName) To 1 Step -1
        Select Case Mid$(FileName, i, 1)
            Case ":"
                ' colons are always included in the result
                GetFilePath = Left$(FileName, i)
                Exit For
            Case "\"
                ' backslash aren't included in the result
                GetFilePath = Left$(FileName, i - 1)
                Exit For
        End Select
    Next
End Function


' saves a whole simulation
Public Sub SaveSimulation(path As String)
  Dim t As Integer
  Dim n As Integer
  Dim x As Integer
  Dim j As Long
  Dim s2 As String
  Dim temp As String
  Dim numOfExistingBots As Integer
  
  Form1.MousePointer = vbHourglass
  
  numOfExistingBots = 0
  
  For x = 1 To MaxRobs
    If rob(x).exist Then numOfExistingBots = numOfExistingBots + 1
  Next x
  
  Dim justPath As String
  justPath = GetFilePath(path)
  
  RecursiveMkDir (justPath)
  
  Close #1
  Open path For Binary As #1
    
    Put #1, , numOfExistingBots
    
    Form1.lblSaving.Visible = True 'Botsareus 1/14/2014 New code to display save status
    
    For t = 1 To MaxRobs
      If rob(t).exist Then
        SaveRobotBody 1, t
      End If
      If t Mod 20 = 0 Then
        Form1.lblSaving.Caption = "Saving... (" & Int(t / MaxRobs * 100) & "%)" 'Botsareus 1/14/2014
        DoEvents
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
    Put #1, , True
    
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
    
    For x = 1 To numTeleporters
      SaveTeleporter 1, x
    Next x
                
    Put #1, , numObstacles
    
    For x = 1 To numObstacles
      SaveObstacle 1, x
    Next x
    
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
   
   'Botsareus 4/17/2013
   Put #1, , SimOpts.DisableTypArepro
       
   'Botsareus 5/31/2013 Save all graph data
   'strings
   Put #1, , Len(strGraphQuery1)
   Put #1, , strGraphQuery1
   Put #1, , Len(strGraphQuery2)
   Put #1, , strGraphQuery2
   Put #1, , Len(strGraphQuery3)
   Put #1, , strGraphQuery3
   Put #1, , Len(strSimStart)
   Put #1, , strSimStart

   'the graphs themselfs
   For k = 1 To NUMGRAPHS
     Put #1, , graphfilecounter(k)
     Put #1, , graphvisible(k)
     Put #1, , graphleft(k)
     Put #1, , graphtop(k)
     Put #1, , graphsave(k)
   Next k
   
   Put #1, , SimOpts.NoWShotDecay 'Botsareus 9/28/2013
   
   'evo stuff
   Put #1, , energydif
   Put #1, , energydifX
   Put #1, , energydifXP
   Put #1, , ModeChangeCycles
   Put #1, , hidePredOffset
   Put #1, , hidepred
   Put #1, , energydif2
   Put #1, , energydifX2
   Put #1, , energydifXP2
   
   'some mor simopts stuff
   Put #1, , SimOpts.SunOnRnd
   
   'Botsareus 8/5/2014
   Put #1, , SimOpts.DisableFixing
   
   'Botsareus 8/16/2014
   Put #1, , SunPosition
   Put #1, , SunRange
   Put #1, , SunChange
       
    Form1.lblSaving.Visible = False 'Botsareus 1/14/2014
    
  Close #1
  Form1.MousePointer = vbArrow
End Sub

'Botsareus 3/15/2013 load global settings
Public Sub LoadGlobalSettings()
'defaults
bodyfix = 32100
chseedstartnew = True
chseedloadsim = True
MDIForm1.MainDir = App.path
UseSafeMode = True
intFindBestV2 = 100
UseOldColor = True
'mutations tab
epiresetemp = 1.3
epiresetOP = 17
'Delta2
Delta2 = False
DeltaMainExp = 1
DeltaMainLn = 0
DeltaDevExp = 7
DeltaDevLn = 1
DeltaPM = 3000
DeltaWTC = 15
DeltaMainChance = 100
DeltaDevChance = 30
'Normailize mutation rates
NormMut = False
valNormMut = 1071
valMaxNormMut = 1071
Dim holdmaindir As String
'
y_hidePredCycl = 1500
y_LFOR = 30
'
y_zblen = 255

'see if maindir overwrite exisits
If dir(App.path & "\Maindir.gset") <> "" Then
    'load the new maindir
    Open App.path & "\Maindir.gset" For Input As #1
      Input #1, holdmaindir
    Close #1
    If dir(holdmaindir & "\", vbDirectory) <> "" Then 'Botsareus 6/11/2013 small bug fix to do with no longer finding a main directory
        MDIForm1.MainDir = holdmaindir
    End If
End If

leagueSourceDir = MDIForm1.MainDir & "\Robots\F1league"

'see if eco exsists
y_eco_im = 0
If dir(App.path & "\im.gset") <> "" Then
  Open App.path & "\im.gset" For Input As #1
    Input #1, y_eco_im
  Close #1
  y_eco_im = y_eco_im + 1
End If

'see if restartmode exisit

If dir(App.path & "\restartmode.gset") <> "" Then
    Open App.path & "\restartmode.gset" For Input As #1
      Input #1, x_restartmode
      Input #1, x_filenumber
    Close #1
End If

'see if settings exsist
If dir(MDIForm1.MainDir & "\Global.gset") <> "" Then
    'load all settings
    Open MDIForm1.MainDir & "\Global.gset" For Input As #1
      Input #1, screenratiofix
      If Not EOF(1) Then Input #1, bodyfix
      If Not EOF(1) Then Input #1, reprofix
      If Not EOF(1) Then Input #1, chseedstartnew
      If Not EOF(1) Then Input #1, chseedloadsim
      If Not EOF(1) Then Input #1, UseSafeMode
      If Not EOF(1) Then Input #1, intFindBestV2
      If Not EOF(1) Then Input #1, UseOldColor
      If Not EOF(1) Then Input #1, boylabldisp
      If Not EOF(1) Then Input #1, startnovid
      If Not EOF(1) Then Input #1, epireset
      If Not EOF(1) Then Input #1, epiresetemp
      If Not EOF(1) Then Input #1, epiresetOP
      If Not EOF(1) Then Input #1, sunbelt
      '
      If Not EOF(1) Then Input #1, Delta2
      If Not EOF(1) Then Input #1, DeltaMainExp
      If Not EOF(1) Then Input #1, DeltaMainLn
      If Not EOF(1) Then Input #1, DeltaDevExp
      If Not EOF(1) Then Input #1, DeltaDevLn
      If Not EOF(1) Then Input #1, DeltaPM
      '
      If Not EOF(1) Then Input #1, NormMut
      If Not EOF(1) Then Input #1, valNormMut
      If Not EOF(1) Then Input #1, valMaxNormMut
      '
      If Not EOF(1) Then Input #1, DeltaWTC
      If Not EOF(1) Then Input #1, DeltaMainChance
      If Not EOF(1) Then Input #1, DeltaDevChance
      '
      If Not EOF(1) Then Input #1, leagueSourceDir
      If Not EOF(1) Then Input #1, UseStepladder
      If Not EOF(1) Then Input #1, x_fudge
      If Not EOF(1) Then Input #1, StartChlr
      If Not EOF(1) Then Input #1, Disqualify
      '
      If Not EOF(1) Then Input #1, y_robdir
      If Not EOF(1) Then Input #1, y_graphs
      If Not EOF(1) Then Input #1, y_normsize
      If Not EOF(1) Then Input #1, y_hidePredCycl
      If Not EOF(1) Then Input #1, y_LFOR
      '
      Dim unused As Boolean
      If Not EOF(1) Then Input #1, unused
      '
      If Not EOF(1) Then Input #1, y_zblen
      '
      If Not EOF(1) Then Input #1, x_res_kill_chlr
      If Not EOF(1) Then Input #1, x_res_kill_mb
      If Not EOF(1) Then Input #1, x_res_other
      '
      If Not EOF(1) Then Input #1, y_res_kill_chlr
      If Not EOF(1) Then Input #1, y_res_kill_mb
      If Not EOF(1) Then Input #1, y_res_kill_dq
      If Not EOF(1) Then Input #1, y_res_other
      '
      If Not EOF(1) Then Input #1, x_res_kill_mb_veg
      If Not EOF(1) Then Input #1, x_res_other_veg
      '
      If Not EOF(1) Then Input #1, y_res_kill_mb_veg
      If Not EOF(1) Then Input #1, y_res_kill_dq_veg
      If Not EOF(1) Then Input #1, y_res_other_veg
    Close #1
End If

'some global settings change during simulation (copy is here)
loadboylabldisp = boylabldisp
loadstartnovid = startnovid

'see if safemode settings exisit
If dir(App.path & "\Safemode.gset") <> "" Then
    'load all settings
    Open App.path & "\Safemode.gset" For Input As #1
      Input #1, simalreadyrunning
    Close #1
End If


'see if autosaved file exisit
If dir(App.path & "\autosaved.gset") <> "" Then
    'load all settings
    Open App.path & "\autosaved.gset" For Input As #1
      Input #1, autosaved
    Close #1
End If

'Botsareus 3/16/2014 If autosaved, we change restartmode, this forces system to run in diagnostic mode
'The difference between x_restartmode 0 and 5 is that 5 uses hidepred settings
If autosaved And x_restartmode = 4 Then
    x_restartmode = 5
     MDIForm1.y_info.Visible = True
End If
If autosaved And x_restartmode = 7 Then x_restartmode = 8 'Botsareus 4/14/2014 same deal for zb evo

'Botsareus 3/19/2014 Load data for evo mode
If x_restartmode = 4 Or x_restartmode = 5 Or x_restartmode = 6 Then
    Open MDIForm1.MainDir & "\evolution\data.gset" For Input As #1
        Input #1, LFOR   'LFOR init
        Input #1, LFORdir  'dir
        Input #1, LFORcorr  'corr
        '
        Input #1, hidePredCycl  'hidePredCycl
        '
        Input #1, curr_dna_size  'curr_dna_size
        Input #1, target_dna_size   'target_dna_size
        '
        Input #1, Init_hidePredCycl
        '
        Input #1, y_Stgwins
    Close #1
Else
    y_eco_im = 0
End If

'Botsareus 3/22/2014 Initial hidepred offset is normal

hidePredOffset = hidePredCycl / 6

'If we are not using safe mode assume simulation is not runnin'
If UseSafeMode = False Then simalreadyrunning = False

If simalreadyrunning = False Then autosaved = False

End Sub


' loads a whole simulation
Public Sub LoadSimulation(path As String)
Form1.camfix = False 'Botsareus 2/23/2013 When simulation starts the screen is normailized

  'Because of the way that loadrobot and saverobot work, all save and load
  'sim routines are backwards and forwards compatible after 2.37.2
  '(not 2.37.2, but everything that comes after)
  Dim j As Long
  Dim k As Long
  Dim x As Integer
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
    
    Form1.lblSaving.Visible = True 'Botsareus 1/14/2014 New code to display load status
    Form1.Visible = True
    
    For k = 1 To MaxRobs
     LoadRobot 1, k
      If k Mod 20 = 0 Then
        Form1.lblSaving.Caption = "Loading... (" & Int(k / MaxRobs * 100) & "%)" 'Botsareus 1/14/2014
        DoEvents
      End If
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
    If Not EOF(1) Then Get #1, , tempbool
    
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
        
        'Botsareus 8/21/2012 Had to dump this, VERY BUGY!
'        'New for 2.42.5.  Insure the path points to our main directory. It might be a sim that was saved before hand on a different machine.
'        'First, we strip off the working directory portion of the robot path
'        'We have to do it this way since the sim could have come from a different machine with a different install directory
'        temp = SimOpts.Specie(k).path
'        s2 = Left(temp, 7)
'        While s2 <> "\Robots" And Len(temp) > 7
'          temp = Right(temp, Len(temp) - 1)
'          s2 = Left(temp, 7)
'        Wend
'        SimOpts.Specie(k).path = temp
'
'        'Now we add on the main directory to get the full path.  The sim may have come from a different machine, but at least
'        'now the path points to the right main directory...
'        SimOpts.Specie(k).path = MDIForm1.MainDir + SimOpts.Specie(k).path
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
        
    For x = 1 To numTeleporters
      LoadTeleporter 1, x
    Next x
    
    For x = 1 To numTeleporters
     If Teleporters(x).Internet Then
       DeleteTeleporter (x)
     End If
    Next x
    
    numObstacles = 0
    If Not EOF(1) Then Get #1, , numObstacles
           
    For x = 1 To numObstacles
      LoadObstacle 1, x
    Next x
    
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
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationMinimumPopulation
    
    SimOpts.SpeciationForkInterval = 5000
    If Not EOF(1) Then Get #1, , SimOpts.SpeciationForkInterval
    
    'Botsareus 4/17/2013
    SimOpts.DisableTypArepro = False
    If Not EOF(1) Then Get #1, , SimOpts.DisableTypArepro
    
    'Botsareus 5/31/2013 Load all graph data
    'strings
    If Not EOF(1) Then Get #1, , j: strGraphQuery1 = Space(j)
    If Not EOF(1) Then Get #1, , strGraphQuery1
    If Not EOF(1) Then Get #1, , j: strGraphQuery2 = Space(j)
    If Not EOF(1) Then Get #1, , strGraphQuery2
    If Not EOF(1) Then Get #1, , j: strGraphQuery3 = Space(j)
    If Not EOF(1) Then Get #1, , strGraphQuery3
    If Not EOF(1) Then Get #1, , j: strSimStart = Space(j)
    If Not EOF(1) Then Get #1, , strSimStart
    'the graphs themselfs
    For k = 1 To NUMGRAPHS
     If Not EOF(1) Then Get #1, , graphfilecounter(k)
     If Not EOF(1) Then Get #1, , graphvisible(k)
     If Not EOF(1) Then Get #1, , graphleft(k)
     If Not EOF(1) Then Get #1, , graphtop(k)
     If Not EOF(1) Then Get #1, , graphsave(k)
     If graphvisible(k) Then
       Select Case k
        Case 1
          Form1.NewGraph POPULATION_GRAPH, "Populations"
        Case 2
          Form1.NewGraph MUTATIONS_GRAPH, "Average_Mutations"
        Case 3
          Form1.NewGraph AVGAGE_GRAPH, "Average_Age"
        Case 4
          Form1.NewGraph OFFSPRING_GRAPH, "Average_Offspring"
        Case 5
          Form1.NewGraph ENERGY_GRAPH, "Average_Energy"
        Case 6
          Form1.NewGraph DNALENGTH_GRAPH, "Average_DNA_length"
        Case 7
          Form1.NewGraph DNACOND_GRAPH, "Average_DNA_Cond_statements"
        Case 8
          Form1.NewGraph MUT_DNALENGTH_GRAPH, "Average_Mutations_per_DNA_length_x1000-"
        Case 9
          Form1.NewGraph ENERGY_SPECIES_GRAPH, "Total_Energy_per_Species_x1000-"
        Case 10
          Form1.NewGraph DYNAMICCOSTS_GRAPH, "Dynamic_Costs"
        Case 11
          Form1.NewGraph SPECIESDIVERSITY_GRAPH, "Species_Diversity"
        Case 12
          Form1.NewGraph AVGCHLR_GRAPH, "Average_Chloroplasts"
        Case 13
          Form1.NewGraph GENETIC_DIST_GRAPH, "Genetic_Distance_x1000-"
        Case 14
          Form1.NewGraph GENERATION_DIST_GRAPH, "Max_Generational_Distance"
        Case 15
          Form1.NewGraph GENETIC_SIMPLE_GRAPH, "Simple_Genetic_Distance_x1000-"
        Case 16
            Form1.NewGraph CUSTOM_1_GRAPH, "Customizable_Graph_1-"
        Case 17
            Form1.NewGraph CUSTOM_2_GRAPH, "Customizable_Graph_2-"
        Case 18
            Form1.NewGraph CUSTOM_3_GRAPH, "Customizable_Graph_3-"
      End Select
     End If
    Next k
    
    SimOpts.NoWShotDecay = False 'Load information about not decaying waste shots
    If Not EOF(1) Then Get #1, , SimOpts.NoWShotDecay 'EricL 6/8/2006 Added this
    
       'evo stuff
   If Not EOF(1) Then Get #1, , energydif
   If Not EOF(1) Then Get #1, , energydifX
   If Not EOF(1) Then Get #1, , energydifXP
   If Not EOF(1) Then Get #1, , ModeChangeCycles
   If Not EOF(1) Then Get #1, , hidePredOffset
   If Not EOF(1) Then Get #1, , hidepred
   If Not EOF(1) Then Get #1, , energydif2
   If Not EOF(1) Then Get #1, , energydifX2
   If Not EOF(1) Then Get #1, , energydifXP2
   
        'some more simopts stuff
   If Not EOF(1) Then Get #1, , SimOpts.SunOnRnd
   
   SimOpts.DisableFixing = False
   If Not EOF(1) Then Get #1, , SimOpts.DisableFixing
    
   If Not EOF(1) Then Get #1, , SunPosition
   If Not EOF(1) Then Get #1, , SunRange
   If Not EOF(1) Then Get #1, , SunChange
    
   Form1.lblSaving.Visible = False 'Botsareus 1/14/2014
    
  Close 1
  
  If SimOpts.Costs(DYNAMICCOSTSENSITIVITY) = 0 Then SimOpts.Costs(DYNAMICCOSTSENSITIVITY) = 500
   
  'EricL 3/28/2006 This line insures that all the simulation dialog options get set to match the loaded sim
  TmpOpts = SimOpts
  
  Form1.MousePointer = vbArrow
End Sub

' loads a single robot
Public Sub LoadRobot(fnum As Integer, ByVal n As Integer)
  LoadRobotBody fnum, n
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

' loads the body of the robot
Private Sub LoadRobotBody(n As Integer, r As Integer)
'robot r
'file #n,
  Dim t As Integer, k As Integer, ind As Integer, Fe As Byte, L1 As Long, inttmp As Integer
  Dim MessedUpMutations As Boolean
  
  MessedUpMutations = False
  With rob(r)
    Get #n, , .Veg
    Get #n, , .wall
    Get #n, , .Fixed
    
    Get #n, , .pos.x
    Get #n, , .pos.y
    Get #n, , .vel.x
    Get #n, , .vel.y
    Get #n, , .aim
    Get #n, , .ma           'momento angolare
    Get #n, , .mt           'momento torcente
    
    .BucketPos.x = -2
    .BucketPos.y = -2
     
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
    SetDefaultMutationRates .Mutables, True
    
    For t = 0 To 20
      Get #n, , .Mutables.mutarray(t)
    Next t
    
    ' informative
    Get #n, , .SonNumber
    Get #n, , inttmp
    .Mutations = inttmp
    Get #n, , inttmp
    .LastMut = inttmp
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
    If FileContinue(n) Then Get #n, , .body: .radius = FindRadius(.body)
    If FileContinue(n) Then Get #n, , .Bouyancy
    If FileContinue(n) Then Get #n, , .Corpse
    If FileContinue(n) Then Get #n, , .Pwaste
    If FileContinue(n) Then Get #n, , .Waste
    If FileContinue(n) Then Get #n, , .poison
    If FileContinue(n) Then Get #n, , .venom
    If FileContinue(n) Then Get #n, , .Shape
    If FileContinue(n) Then Get #n, , .exist
    If FileContinue(n) Then Get #n, , .Dead
    
    If FileContinue(n) Then Get #n, , k: .FName = Space(k)
    If FileContinue(n) Then Get #n, , .FName
            
    If FileContinue(n) Then Get #n, , k: .LastOwner = Space(k)
    If FileContinue(n) Then Get #n, , .LastOwner
    If .LastOwner = "" Then .LastOwner = "Local"
    
    If FileContinue(n) Then Get #n, , k
       
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

      SetDefaultMutationRates .Mutables, True
    
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
      Get #n, , L1
    Else
      'Not that many mutations for this bot (It's possible its an old file with lots of mutations and the len wrapped.
      'If so, we just read the postiive len and keep going.  Everything following this will be wrong, but the sim should
      'still load.  It's a corner case.  The alternative is to try to parse the mutation details strings directly.  No thanks.
      L1 = CLng(k)
    End If
    
    .LastMutDetail = Space(L1)
    If FileContinue(n) Then Get #n, , .LastMutDetail
    
    If FileContinue(n) Then Get #n, , .Mutables.Mutations
    
    For t = 0 To 20
      If FileContinue(n) Then Get #n, , .Mutables.Mean(t)
      If FileContinue(n) Then Get #n, , .Mutables.StdDev(t)
    Next t
    
    For t = 0 To 20
      If .Mutables.Mean(t) < 0 Or .Mutables.Mean(t) > 32000 Or .Mutables.StdDev(t) < 0 Or .Mutables.StdDev(t) > 32000 Then MessedUpMutations = True
    Next t
        
    If FileContinue(n) Then Get #n, , .Mutables.CopyErrorWhatToChange
    If FileContinue(n) Then Get #n, , .Mutables.PointWhatToChange
    
    If .Mutables.CopyErrorWhatToChange < 0 Or .Mutables.CopyErrorWhatToChange > 32000 Or .Mutables.PointWhatToChange < 0 Or .Mutables.PointWhatToChange > 32000 Then
      MessedUpMutations = True
    End If
    
     'If we read wacky values, the file was saved with an older version which messed these up.  Set the defaults.
    If MessedUpMutations Then
      SetDefaultMutationRates .Mutables, True
    End If
    
    If FileContinue(n) Then Get #n, , .View
    If FileContinue(n) Then Get #n, , .NewMove
    
    .oldBotNum = 0
    If FileContinue(n) Then Get #n, , .oldBotNum
      
    .CantSee = False
    If FileContinue(n) Then Get #n, , .CantSee
    If CInt(.CantSee) > 0 Or CInt(.CantSee) < -1 Then .CantSee = False ' Protection against corrpt sim files.
    
    .DisableDNA = False
    If FileContinue(n) Then Get #n, , .DisableDNA
    If CInt(.DisableDNA) > 0 Or CInt(.DisableDNA) < -1 Then .DisableDNA = False ' Protection against corrpt sim files.
    
    .DisableMovementSysvars = False
    If FileContinue(n) Then Get #n, , .DisableMovementSysvars
    If CInt(.DisableMovementSysvars) > 0 Or CInt(.DisableMovementSysvars) < -1 Then .DisableMovementSysvars = False    ' Protection against corrpt sim files.
    
    .CantReproduce = False
    If FileContinue(n) Then Get #n, , .CantReproduce
    If CInt(.CantReproduce) > 0 Or CInt(.CantReproduce) < -1 Then .CantReproduce = False ' Protection against corrpt sim files.
    
    .shell = 0
    If FileContinue(n) Then Get #n, , .shell
    
    If .shell > 32000 Then .shell = 32000
    If .shell < 0 Then .shell = 0
    
    .Slime = 0
    If FileContinue(n) Then Get #n, , .Slime
            
    If .Slime > 32000 Then .Slime = 32000
    If .Slime < 0 Then .Slime = 0
    
    .VirusImmune = False
    If FileContinue(n) Then Get #n, , .VirusImmune
    If CInt(.VirusImmune) > 0 Or CInt(.VirusImmune) < -1 Then .VirusImmune = False ' Protection against corrpt sim files.
    
    .SubSpecies = 0 ' For older sims saved before this was implemented, set the sup species to be the bot's number.  Every bot is a sub species.
    If FileContinue(n) Then Get #n, , .SubSpecies
    
    .spermDNAlen = 0
    If FileContinue(n) Then Get #n, , .spermDNAlen: ReDim .spermDNA(.spermDNAlen)
    For t = 1 To .spermDNAlen
      If FileContinue(n) Then Get #n, , .spermDNA(t).tipo
      If FileContinue(n) Then Get #n, , .spermDNA(t).value
    Next t
    
    .fertilized = -1
    If FileContinue(n) Then Get #n, , .fertilized
    
    If FileContinue(n) Then Get #n, , .AncestorIndex
    For t = 0 To 500
      If FileContinue(n) Then Get #n, , .Ancestors(t).mut
      If FileContinue(n) Then Get #n, , .Ancestors(t).num
      If FileContinue(n) Then Get #n, , .Ancestors(t).sim
    Next t
    
    .sim = 0
    If FileContinue(n) Then Get #n, , .sim
    If FileContinue(n) Then Get #n, , .AbsNum
    
    'Botsareus 2/23/2013 Rest of tie data
    If FileContinue(n) Then Get #n, , .Multibot
    For t = 0 To MAXTIES
        If FileContinue(n) Then Get #n, , .Ties(t).type
        If FileContinue(n) Then Get #n, , .Ties(t).b
        If FileContinue(n) Then Get #n, , .Ties(t).k
        If FileContinue(n) Then Get #n, , .Ties(t).NaturalLength
    Next
    
    'Botsareus 4/9/2013 For genetic distance graph
    If FileContinue(n) Then Get #n, , .OldGD
    .GenMut = .DnaLen / GeneticSensitivity
    
    'Panda 2013/08/11 chloroplasts
    If FileContinue(n) Then Get #n, , .chloroplasts
    
    'Botsareus 12/3/2013 Read epigenetic information
    
    For t = 0 To 14
        If FileContinue(n) Then Get #n, , .epimem(t)
    Next
    
    'Botsareus 1/28/2014 Read robot tag
    
    If FileContinue(n) Then Get #n, , .tag
    
    'Read if robot is using sunbelt
        
    Dim usesunbelt As Boolean 'sunbelt mutations
    
    If FileContinue(n) Then Get #n, , usesunbelt
    
    'Botsareus 3/28/2014 Read if disable chloroplasts
    
    If FileContinue(n) Then Get #n, , .NoChlr
    
    'Botsareus 3/28/2014 Read kill resrictions
    
    If FileContinue(n) Then Get #n, , .multibot_time
    If FileContinue(n) Then Get #n, , .Chlr_Share_Delay
    If FileContinue(n) Then Get #n, , .dq
    
    If Not .Veg Then
     If y_eco_im > 0 And Form1.lblSaving.Visible = False Then
      If Right(.tag, 5) <> Left(.nrg & .nrg, 5) Then
        .dq = 2
      End If
      If .FName <> "Mutate.txt" And .FName <> "Base.txt" Then
        .dq = 2
      End If
     End If
    Else
     If TotalChlr > SimOpts.MaxPopulation Then .Dead = True
    End If
    
    'read in any future data here
    
OldFile:
    'burn through any new data from a different version
    While FileContinue(n)
      Get #n, , Fe
    Wend
    
    'grab these three FE codes
    Get #n, , Fe
    Get #n, , Fe
    Get #n, , Fe
    
    'don't you dare put anything after this!
    'except some initialization stuff
    .Vtimer = 0
    .virusshot = 0
    
    'Botsareus 2/21/2014 Special case reset sunbelt mutations
    
    If Not usesunbelt Then
        .Mutables.mutarray(P2UP) = 0
        .Mutables.mutarray(CE2UP) = 0
        .Mutables.mutarray(AmplificationUP) = 0
        .Mutables.mutarray(TranslocationUP) = 0
    End If
  End With
End Sub

Private Function FileContinue(filenumber As Integer) As Boolean
  'three FE bytes (ie: 254) means we are at the end of the record
  
  Dim Fe As Byte
  Dim Position As Long
  Dim k As Integer
  
  FileContinue = False
  Position = Seek(filenumber)
   
  Do
    If Not EOF(filenumber) Then
      Get #filenumber, , Fe
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
  Get #filenumber, Position - 1, Fe
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
    Put #n, , .pos.x
    Put #n, , .pos.y
    Put #n, , .vel.x
    Put #n, , .vel.y
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
    Put #n, , sint(.Mutations)
    Put #n, , sint(.LastMut)
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
    
    'Botsareus 2/23/2013 Rest of tie data
    Put #n, , .Multibot
    For t = 0 To MAXTIES
        Put #n, , .Ties(t).type
        Put #n, , .Ties(t).b
        Put #n, , .Ties(t).k
        Put #n, , .Ties(t).NaturalLength
    Next
    
    'Botsareus 4/9/2013 For genetic distance graph
    Put #n, , .OldGD
    
    'Panda 8/13/2013 Write chloroplasts
    Put #n, , .chloroplasts
    
    'Botsareus 12/3/2013 Write epigenetic information
    For t = 0 To 14
        Put #n, , .epimem(t)
    Next
    
    'Botsareus 1/28/2014 Write robot tag
    
    Dim blank As String * 50
    
    If Not .Veg Then
     If y_eco_im > 0 And Form1.lblSaving.Visible = False And .dq <> 2 Then
      If Left(.tag, 45) = Left(blank, 45) Then .tag = "Please create a description."
      .tag = Left(.tag, 45) & Left(.nrg & .nrg, 5)
     End If
    End If
    
    Put #n, , .tag
    
    'Botsareus 1/28/2014 Write if robot is using sunbelt
    
    Put #n, , sunbelt
    
    'Botsareus 3/28/2014 Write if disable chloroplasts
    
    Put #n, , .NoChlr
    
    'Botsareus 3/28/2014 Read kill resrictions
    
    Put #n, , .multibot_time
    Put #n, , .Chlr_Share_Delay
    Put #n, , .dq
    
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
  Close #1
  Open path For Output As #1
  hold = SaveRobHeader(n)
  savingtofile = True 'Botsareus 2/28/2014 when saving to file the def sysvars should not save
  hold = hold + DetokenizeDNA(n)
  savingtofile = False
  hashed = Hash(hold, 20)
  Print #1, hold
  Print #1, ""
  If Not nombox Then Print #1, "'#hash: " + hashed
  Close #1
  
  'Botsareus 12/11/2013 Save mrates file
  Save_mrates rob(n).Mutables, extractpath(path) & "\" & extractexactname(extractname(path)) & ".mrate"
  
  If y_eco_im > 0 Then Exit Sub 'Under eco restart mode you will not be able to rename a robot
  If Not nombox Then
    If MsgBox("Do you want to change robot's name to " + extractname(path) + " ?", vbYesNo, "Robot DNA saved") = vbYes Then
      rob(n).FName = extractname(path)
    End If
  End If
End Sub

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
  Dim x As Integer
  
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
    Put #n, , .memloc      ' Memory location for custom poison and venom
    Put #n, , .Memval      ' Value to insert into custom venom location
    
    ' Somewhere to store genetic code for a virus or sperm
    If (.shottype = -7 Or .shottype = -8) And .exist And .DnaLen > 0 Then
      Put #n, , .DnaLen
      For x = 1 To .DnaLen
        Put #n, , .DNA(x).tipo
        Put #n, , .DNA(x).value
      Next x
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
  Dim x As Integer
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
    
    Get #n, , .memloc      ' Memory location for custom poison and venom
    Get #n, , .Memval      ' Value to insert into custom venom location

    
    ' Somewhere to store genetic code for a virus
    Get #n, , k
    If k > 0 Then
      ReDim .DNA(k)
      For x = 1 To k
        Get #n, , .DNA(x).tipo
        Get #n, , .DNA(x).value
      Next x
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

'M U T A T I O N  F I L E Botsareus 12/11/2013

'generate mrates file
Sub Save_mrates(mut As mutationprobs, FName As String)
Dim m As Byte
    Open FName For Output As #1
        With mut
            Write #1, .PointWhatToChange
            Write #1, .CopyErrorWhatToChange
            For m = 0 To 10 'Need to change this if adding more mutation types (Trying to keep some backword compatability here)
                Write #1, .mutarray(m)
                Write #1, .Mean(m)
                Write #1, .StdDev(m)
            Next
        End With
    Close #1
End Sub
'load mrates file
Public Function Load_mrates(FName As String) As mutationprobs
Dim m As Byte
    Open FName For Input As #1
        With Load_mrates
            Input #1, .PointWhatToChange
            Input #1, .CopyErrorWhatToChange
            For m = 0 To 10 'Need to change this if adding more mutation types (needs to have eofs if more then 10 for backword compatability)
                Input #1, .mutarray(m)
                Input #1, .Mean(m)
                Input #1, .StdDev(m)
            Next
        End With
    Close #1
End Function

'D A T A C O N V E R S I O N S Botsareus 12/18/2013

Private Function sint(ByVal lval As Long) As Integer
lval = lval Mod 32000
sint = lval
End Function
