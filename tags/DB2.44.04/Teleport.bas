Attribute VB_Name = "Teleport"
' Copyright (c) 2006, 2007 Eric Lockard
' eric@sulaadventures.com
' All rights reserved.
'
'Redistribution and use in source and binary forms, with or without
'modification, are permitted provided that:
'
'(1) source code distributions retain the above copyright notice and this
'    paragraph in its entirety,
'(2) distributions including binary code include the above copyright notice and
'    this paragraph in its entirety in the documentation or other materials
'    provided with the distribution, and
'(3) Without the agreement of the author redistribution of this product is only allowed
'    in non commercial terms and non profit distributions.
'
'THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
'WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
'MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

Option Explicit

Public Type Teleporter
  exist As Boolean
  pos As vector
  Width As Single
  Height As Single
  color As Long
  vel As vector
  path As String
  In As Boolean
  Out As Boolean
  local As Boolean
  Internet As Boolean
  driftHorizontal As Boolean
  driftVertical As Boolean
  highlight As Boolean
  teleportVeggies As Boolean
  teleportCorpses As Boolean
  RespectShapes As Boolean
  NumTeleported As Long  'Outbound
  NumTeleportedIn As Long ' Inbound
  center As vector
  teleportHeterotrophs As Boolean
  InboundPollCycles As Integer
  BotsPerPoll As Integer
  PollCountDown As Integer
  BackFlowLimit As Integer
  ServerAvailable As Integer
End Type

Public Const MAXTELEPORTERS = 10
Public numTeleporters As Integer
Public teleporterFocus As Integer
Public teleporterDefaultWidth As Integer

Public Teleporters(MAXTELEPORTERS) As Teleporter

Public Type InternetSim
  Name As String
  population As Integer
End Type

Public Const MAXINTERNETSPECIES = 500
Public Const MAXINTERNETSIMS = 100
Public InternetSpecies(MAXINTERNETSPECIES) As datispecie ' Used for graphing the number of species in the inter connected internet sim
Public numInternetSpecies As Integer
Public namesOfInternetBots(MAXINTERNETSPECIES) As String
Public numInternetSims As Integer
Public InternetSims(MAXINTERNETSIMS) As InternetSim

Public Function NewTeleporter(PortIn As Boolean, PortOut As Boolean, Height As Single, Internet As Boolean) As Integer
Dim i As Integer
Dim randomX, randomy, aspectRatio  As Single

  If numTeleporters + 1 > MAXTELEPORTERS Then
    NewTeleporter = -1
  Else
    numTeleporters = numTeleporters + 1
    NewTeleporter = numTeleporters
    Teleporters(numTeleporters).exist = True
        
    aspectRatio = CSng(SimOpts.FieldHeight / SimOpts.FieldWidth)
      
    randomX = Random(0, SimOpts.FieldWidth - (teleporterDefaultWidth * aspectRatio))
    randomy = Random(0, SimOpts.FieldHeight - teleporterDefaultWidth)
    
    Teleporters(numTeleporters).pos = VectorSet(randomX, randomy)
    Teleporters(numTeleporters).Width = Height * aspectRatio
    Teleporters(numTeleporters).Height = Height
    Teleporters(numTeleporters).vel = VectorSet(0, 0)
    Teleporters(numTeleporters).color = vbWhite
   ' Teleporters(numTeleporters).path = path
    Teleporters(numTeleporters).In = PortIn
    Teleporters(numTeleporters).Out = PortOut
    Teleporters(numTeleporters).Internet = Internet
    Teleporters(numTeleporters).driftHorizontal = True
    Teleporters(numTeleporters).driftVertical = True
    Teleporters(numTeleporters).NumTeleported = 0
    Teleporters(numTeleporters).NumTeleportedIn = 0
  End If
End Function

Public Function ResizeTeleporter(i As Integer, Height As Single) As Boolean
Dim aspectRatio As Single

  ResizeTeleporter = False

  If Not Teleporters(i).exist Then Exit Function
  aspectRatio = CSng(SimOpts.FieldHeight / SimOpts.FieldWidth)
  Teleporters(i).Width = Height * aspectRatio
  Teleporters(i).Height = Height
  
  ResizeTeleporter = True

End Function


Public Function ResizeInternetTeleporter(Height As Single) As Boolean
  Dim i As Integer
  
  ResizeInternetTeleporter = False
  If Not InternetMode Then Exit Function
  
   For i = 1 To numTeleporters
     If Teleporters(i).exist And Teleporters(i).Internet Then
       ResizeInternetTeleporter = ResizeTeleporter(i, Height)
       Exit Function
     End If
   Next i
  
End Function


Public Function DeleteAllTeleporters()
Dim i As Integer

  For i = 1 To numTeleporters
    Teleporters(i).exist = False
  Next i
  numTeleporters = 0
  MDIForm1.DeleteTeleporterMenu.Enabled = False
End Function

Public Function DeleteTeleporter(i As Integer)
 Dim X As Integer
 If numTeleporters <= 0 Then Exit Function
 For X = i + 1 To numTeleporters
   Teleporters(X - 1) = Teleporters(X)
 Next X
 Teleporters(numTeleporters).exist = False
 numTeleporters = numTeleporters - 1
 If teleporterFocus = i Then MDIForm1.DeleteTeleporterMenu.Enabled = False
  
End Function
Public Function CheckTeleporters(n As Integer)
Dim i As Integer
Dim Name As String
Dim randomV As vector

  For i = 1 To numTeleporters
    If Teleporters(i).Out Or Teleporters(i).local Or Teleporters(i).Internet Then
      If TeleportCollision(n, i) And rob(n).exist Then
        If Teleporters(i).Out Then
          If (rob(n).Veg And Not Teleporters(i).teleportVeggies) Or _
             (rob(n).Corpse And Not Teleporters(i).teleportCorpses) Or _
             ((Not rob(n).Veg) And (Not Teleporters(i).teleportHeterotrophs)) Then
            'Don't Teleport
          Else
            Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1
            Name = "\" + (Format(Date, "yymmdd")) + Format(Time, "hhmmss") + rob(n).FName + CStr(i) + CStr(Teleporters(i).NumTeleported) + ".dbo"
            SaveOrganism Teleporters(i).path + Name, n
            KillOrganism n
          End If
        ElseIf Teleporters(i).local Or (Teleporters(i).Internet And (Not Teleporters(i).ServerAvailable)) Then
          If (rob(n).Veg And Not Teleporters(i).teleportVeggies) Or _
             (rob(n).Corpse And Not Teleporters(i).teleportCorpses) Or _
             ((Not rob(n).Veg) And (Not Teleporters(i).teleportHeterotrophs)) Then
            'Don't Teleport
          Else
            If Teleporters(i).local Then Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1 ' Don't update the counter for Internet Mode teleporters
            randomV = VectorSet(SimOpts.FieldWidth * Rnd, SimOpts.FieldHeight * Rnd)
            If MDIForm1.visualize Then Form1.Line (rob(n).pos.X, rob(n).pos.Y)-(randomV.X, randomV.Y), vbWhite
            ReSpawn n, CLng(randomV.X), CLng(randomV.Y)
            LogForm.AddLog rob(n).FName + " teleported within sim."
          End If
        ElseIf Teleporters(i).Internet And Teleporters(i).ServerAvailable Then
            Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1
            Name = IntOpts.AttribuisciNome(n)
            'Name = rob(n).FName + CStr(i) + CStr(Teleporters(i).NumTeleported) + (Format(Date, "yymmdd")) + Format(Time, "hhmmss") + ".dbo"
            SaveOrganism MDIForm1.MainDir + "\Transfers\F1\out\" + Name, n
            KillOrganism n
            LogForm.AddLog rob(n).FName + " sent to internet."
                        
            'Only want to teleport out so many per cycle
            Teleporters(i).BackFlowLimit = Teleporters(i).BackFlowLimit - 1
            If Teleporters(i).BackFlowLimit <= 0 Then
              Teleporters(i).ServerAvailable = False
              MDIForm1.F1InternetButton.DownPicture = Form1.InternetModeBackPressure
              MDIForm1.F1InternetButton.Refresh
            End If
        End If
      End If
    End If
  Next i
End Function


Public Function TeleportCollision(n As Integer, t As Integer) As Boolean
Dim botrightedge As Single
Dim botleftedge As Single
Dim bottopedge As Single
Dim botbottomedge As Single

  TeleportCollision = False
 
  If VectorMagnitude(VectorSub(rob(n).pos, Teleporters(t).center)) < Teleporters(t).Width / 2 + rob(n).radius Then
    TeleportCollision = True
  End If
  
End Function

Public Function DrawTeleporters()
  Dim i As Integer
  Dim sm As Long
  Dim telewidth As Single
  Dim zoomRatio As Single
  Dim aspectRatio As Single
  Dim twipWidth As Single
  Dim scw As Long, sch As Long, scm As Integer
  Dim sct As Long, scl As Long
  Dim pictwidth As Single
  Dim pictmod As Single
  Dim hilightcolor As Long
  Dim visibleLeft As Long
  Dim visibleRight As Long
  Dim visibleTop As Long
  Dim visibleBottom As Long
  
  visibleLeft = Form1.ScaleLeft
  visibleRight = Form1.ScaleLeft + Form1.ScaleWidth
  visibleTop = Form1.ScaleTop
  visibleBottom = Form1.ScaleTop + Form1.ScaleHeight
   
  zoomRatio = Form1.ScaleWidth / SimOpts.FieldWidth
  aspectRatio = SimOpts.FieldHeight / SimOpts.FieldWidth
  
  Form1.FillStyle = 1
  
  For i = 1 To numTeleporters
    If SimOpts.TotRunCycle >= 0 Then
      
      If (Form1.visiblew / RobSize) < 1000 And Teleporters(i).pos.X > visibleLeft And _
         Teleporters(i).pos.X < visibleRight And Teleporters(i).pos.Y > visibleTop And _
         Teleporters(i).pos.Y < visibleBottom Then
        pictwidth = (Form1.Teleporter.Picture.Height) * zoomRatio * SimOpts.FieldWidth / (2 * Form1.Width)
        pictmod = (SimOpts.TotRunCycle Mod 16) * pictwidth * 1.134 + Form1.ScaleLeft
      
        Form1.PaintPicture Form1.TeleporterMask.Picture, _
        Teleporters(i).pos.X, _
        Teleporters(i).pos.Y, _
        Teleporters(i).Width, _
        Teleporters(i).Height, _
        pictmod, _
        Form1.ScaleTop, _
        pictwidth, , vbMergePaint
            
        Form1.PaintPicture Form1.Teleporter.Picture, _
        Teleporters(i).pos.X, _
        Teleporters(i).pos.Y, _
        Teleporters(i).Width, _
        Teleporters(i).Height, _
        pictmod, _
        Form1.ScaleTop, _
        pictwidth, , vbSrcAnd
      End If
          
      If Teleporters(i).highlight And Teleporters(i).pos.X > visibleLeft And _
         Teleporters(i).pos.X < visibleRight And Teleporters(i).pos.Y > visibleTop And _
         Teleporters(i).pos.Y < visibleBottom Then
        If Teleporters(i).In Then hilightcolor = vbGreen
        If Teleporters(i).Out Then hilightcolor = vbRed
        If Teleporters(i).local Then hilightcolor = vbYellow
        If Teleporters(i).Internet Then hilightcolor = vbBlue
        Form1.Circle (Teleporters(i).pos.X + (Teleporters(i).Width / 2), Teleporters(i).pos.Y + (Teleporters(i).Height / 3)), Teleporters(i).Width * 0.6, hilightcolor
      End If
      
      If i = teleporterFocus And Teleporters(i).pos.X > visibleLeft And _
         Teleporters(i).pos.X < visibleRight And Teleporters(i).pos.Y > visibleTop And _
         Teleporters(i).pos.Y < visibleBottom Then
        Form1.Circle (Teleporters(i).pos.X + (Teleporters(i).Width / 2), Teleporters(i).pos.Y + (Teleporters(i).Height / 3)), Teleporters(i).Width * 0.7, vbWhite
      End If
 
    End If
  Next i
  
  Form1.FillStyle = 0
 ' Form1.ScaleMode = sm     (SimOpts.TotRunCycle Mod 16) * (telewidth) * zoomRatio * SimOpts.FieldSize * aspectRatio * Teleporters(i).Height / Form1.Teleporter.Picture.Height + Form1.ScaleLeft,
End Function

Public Function HighLightAllTeleporters()
  Dim i As Integer
  For i = 1 To MAXTELEPORTERS
    Teleporters(i).highlight = True
  Next i
End Function

Public Function UnHighLightAllTeleporters()
  Dim i As Integer
  For i = 1 To MAXTELEPORTERS
    Teleporters(i).highlight = False
  Next i
End Function
Public Function DriftTeleporter(i As Integer)
  Dim vel As Single
  
  vel = SimOpts.MaxVelocity / 4#
  If Teleporters(i).driftHorizontal Then
    Teleporters(i).vel.X = Teleporters(i).vel.X + (Rnd - 0.5)
  End If
  If Teleporters(i).driftVertical Then
    Teleporters(i).vel.Y = Teleporters(i).vel.Y + (Rnd - 0.5)
  End If
  If VectorMagnitude(Teleporters(i).vel) > vel Then
    Teleporters(i).vel = VectorScalar(Teleporters(i).vel, vel / VectorMagnitude(Teleporters(i).vel))
  End If
End Function

Public Function MoveTeleporter(i As Integer)
  
  If Teleporters(i).driftHorizontal And Teleporters(i).driftVertical Then
    Teleporters(i).pos = VectorAdd(Teleporters(i).pos, Teleporters(i).vel)
  End If
  Teleporters(i).center = VectorSet(Teleporters(i).pos.X + (Teleporters(i).Width * 0.5), _
                                    Teleporters(i).pos.Y + (Teleporters(i).Height * 0.3))
  
  'Keep teleporters from drifting off into space.
  With Teleporters(i)
  If .pos.X < 0 Then
    If .pos.X + .Width < 0 Then
      .pos.X = 0
    End If
    If SimOpts.Dxsxconnected = True Then
      .pos.X = .pos.X + SimOpts.FieldWidth - .Width
    Else
      .vel.X = SimOpts.MaxVelocity * 0.1
    End If
  End If
  If .pos.Y < 0 Then
    If .pos.Y + .Height < 0 Then
      .pos.Y = 0
    End If
    If SimOpts.Updnconnected = True Then
      .pos.Y = .pos.Y + SimOpts.FieldHeight - .Height
    Else
      .vel.Y = SimOpts.MaxVelocity * 0.1
    End If
  End If
  If .pos.X + .Width > SimOpts.FieldWidth Then
    If .pos.X > SimOpts.FieldWidth Then
      .pos.X = SimOpts.FieldWidth - .Width
    End If
     If SimOpts.Dxsxconnected = True Then
      .pos.X = .pos.X - (SimOpts.FieldWidth - .Width)
    Else
      .vel.X = -SimOpts.MaxVelocity * 0.1
    End If
  End If
  If .pos.Y + .Height > SimOpts.FieldHeight Then
    If .pos.Y > SimOpts.FieldHeight Then
      .pos.Y = SimOpts.FieldHeight - .Height
    End If
    If SimOpts.Updnconnected = True Then
      .pos.Y = .pos.Y - (SimOpts.FieldHeight - .Height)
    Else
      .vel.Y = -SimOpts.MaxVelocity * 0.1
    End If
  End If
  End With
  
End Function


'Read in the downloaded population files and update the internet species structure
Public Function UpdateInternetPopulations()
Dim t As Integer
Dim sFile As String
Dim lElement As Long
Dim sAns() As String
ReDim sAns(0) As String

Dim fso As New FileSystemObject
Dim xferFolder As Folder
Dim popfiles As Files
Dim currentFile As File

  numInternetSpecies = 0
  
  Set xferFolder = fso.GetFolder(MDIForm1.MainDir + "\Transfers\F1\")
  Set popfiles = xferFolder.Files
  
  numInternetSims = 0
  
  For Each currentFile In popfiles
   
    ' Delete all remote pop files at midnight every night
    If Hour(DateTime.Now) = 0 And Minute(DateTime.Now) <= 5 Then
      If Right(currentFile.Name, 3) = "pop" Or Right(currentFile.Name, 3) = "del" Then
         IntOpts.DeleteRemotePopFile currentFile.Name ' Delete the remote file
      End If
    End If
    
    If CInt(Hour(currentFile.DateLastModified)) <> CInt(Hour(Time)) And (CInt(Hour(currentFile.DateLastModified) + 1)) <> CInt(Hour(Time)) _
   And (CInt(Hour(currentFile.DateLastModified))) <> CInt(Hour(Time) + 1) And CInt((Hour(currentFile.DateLastModified)) <> (CInt(Hour(Time)) + 23)) _
   And CInt((Hour(currentFile.DateLastModified) + 23) <> (CInt(Hour(Time)))) Then ' Sim hasn't run in at least 1 hour
      On Error GoTo bypass
        LogForm.AddLog "Deleted population file " + currentFile.Name
        currentFile.Delete
bypass:
  
   ElseIf Right(currentFile.Name, 3) = "pop" Or Right(currentFile.Name, 3) = "del" Then
      numInternetSims = numInternetSims + 1
      If numInternetSims > MAXINTERNETSIMS Then numInternetSims = MAXINTERNETSIMS
      LoadSimPopulationFile (MDIForm1.MainDir + "\Transfers\F1\" + currentFile.Name)
      InternetSims(numInternetSims).Name = Left(currentFile.Name, Len(currentFile.Name) - 4)
    End If
  Next
  

End Function
 

Public Function TeleportInBots()
Dim i As Integer
Dim n As Integer
Dim sFile As String
Dim lElement As Long
Dim sAns() As String
ReDim sAns(0) As String
Dim randomV As vector
Dim MaxBotsPerCyclePerTeleporter As Integer
Dim temp As Boolean

  'MaxBotsPerCyclePerTeleporter = 10

'Form1.SecTimer.Enabled = False
  For i = 1 To numTeleporters
    If Teleporters(i).In Then
      If Teleporters(i).PollCountDown <= 0 Then
        Teleporters(i).PollCountDown = Teleporters(i).InboundPollCycles
        MaxBotsPerCyclePerTeleporter = Teleporters(i).BotsPerPoll
        On Error GoTo abandonthiscycle
        sFile = dir(Teleporters(i).path + "\", vbNormal + vbHidden + vbReadOnly + vbSystem + vbArchive)
        While sFile <> "" And MaxBotsPerCyclePerTeleporter > 0
          sAns(0) = sFile
          lElement = IIf(sAns(0) = "", 0, UBound(sAns) + 1)
          ReDim Preserve sAns(lElement) As String
          sAns(lElement) = sFile
          If Right(sFile, 3) = "dbo" Then
            n = LoadOrganism(Teleporters(i).path + "\" + sAns(lElement), Teleporters(i).pos.X + Teleporters(i).Width / 2, Teleporters(i).pos.Y + Teleporters(i).Height / 3)
            'If n > 0 Then
            '  rob(n).BucketPos.x = -2
            '  rob(n).BucketPos.Y = -2
            '  UpdateBotBucket n
            'End If
            Teleporters(i).NumTeleportedIn = Teleporters(i).NumTeleportedIn + 1
            Kill (Teleporters(i).path + "\" + sAns(lElement))
            MaxBotsPerCyclePerTeleporter = MaxBotsPerCyclePerTeleporter - 1
            sFile = dir
          Else
            MsgBox ("Non dbo file " + sFile + "found in " + Teleporters(i).path + ".  Inbound Teleporter Deleted.")
            Teleporters(i).exist = False
            sFile = ""
          End If
        Wend
      Else
        Teleporters(i).PollCountDown = Teleporters(i).PollCountDown - 1
      End If
    End If
    If Teleporters(i).Internet Then
      
      If LogForm.Visible Then
        LogForm.Caption = "Internet Log  -  " + CStr(Teleporters(i).PollCountDown) + "      Out: " + CStr(Teleporters(i).NumTeleported) + _
        "     In: " + CStr(Teleporters(i).NumTeleportedIn) + "    Sims: " + CStr(numInternetSims)
      End If
      
      If Teleporters(i).PollCountDown <= 0 Then
        'Teleporters(i).PollCountDown = Teleporters(i).InboundPollCycles
        Teleporters(i).PollCountDown = 100 + CInt(100 * SimOpts.CycSec)
                
        MaxBotsPerCyclePerTeleporter = Teleporters(i).BotsPerPoll
        On Error GoTo abandonthiscycle
       ' If OpenConnection Then
      
        'Do inbound first so we don't suck back in the ones we send out this cycle
        If Not LoadRandomOrgs(MaxBotsPerCyclePerTeleporter, CLng(randomV.X), CLng(randomV.Y), i) Then Disconnect
        
        'Now drain the inbound directory into the sim
        sFile = dir(MDIForm1.MainDir + "\Transfers\F1\in\", vbNormal + vbHidden + vbReadOnly + vbSystem + vbArchive)
        While sFile <> "" And MaxBotsPerCyclePerTeleporter > 0
          sAns(0) = sFile
          lElement = IIf(sAns(0) = "", 0, UBound(sAns) + 1)
          ReDim Preserve sAns(lElement) As String
          sAns(lElement) = sFile
          If Right(sFile, 3) = "dbo" Then
            randomV = VectorSet(CSng(SimOpts.FieldWidth) * Rnd, CSng(SimOpts.FieldHeight) * Rnd)
            n = LoadOrganism(MDIForm1.MainDir + "\Transfers\F1\in\" + sAns(lElement), randomV.X, randomV.Y)
            If n > 0 Then
             ' rob(n).BucketPos.x = -2
             ' rob(n).BucketPos.Y = -2
             ' UpdateBotBucket n
              If MDIForm1.visualize Then Form1.Line (Teleporters(i).pos.X + Teleporters(i).Width / 2, Teleporters(i).pos.Y + Teleporters(i).Width / 2)-(randomV.X, randomV.Y), vbBlue
              Teleporters(i).NumTeleportedIn = Teleporters(i).NumTeleportedIn + 1
              LogForm.AddLog rob(n).FName + " teleported in from " + rob(n).LastOwner
              MaxBotsPerCyclePerTeleporter = MaxBotsPerCyclePerTeleporter - 1
            End If
            Kill (MDIForm1.MainDir + "\Transfers\F1\in\" + sAns(lElement))
            sFile = dir
          Else
           ' MsgBox ("Non dbo file " + sFile + "found in " + Teleporters(i).path + ".  Inbound Teleporter Deleted.")
            Kill (MDIForm1.MainDir + "\Transfers\F1\in\" + sAns(lElement))
           ' Teleporters(i).exist = False
            sFile = dir
          End If
        Wend
                
        'Now upload and download the population files
        SaveSimPopulation (MDIForm1.MainDir + "\Transfers\F1\" + IntOpts.IName + ".pop")
        If IntOpts.UploadFile(IntOpts.IName + ".pop", MDIForm1.MainDir + "\Transfers\F1\" + IntOpts.IName + ".pop", "/F1/pop") Then
          Disconnect
          'LogForm.AddLog "Populaton file uploaded sucessfully."
        Else
          LogForm.AddLog "Problem uploading population file."
          MDIForm1.F1InternetButton.DownPicture = Form1.InternetModePopFileProblem
          MDIForm1.F1InternetButton.Refresh
        End If
        If DownloadPopFiles() Then
          ' LogForm.AddLog "Populaton files downloaded sucessfully."
        Else
         ' LogForm.AddLog "Problem downloading population files."
          MDIForm1.F1InternetButton.DownPicture = Form1.InternetModePopFileProblem
          MDIForm1.F1InternetButton.Refresh
        End If
                       
        'UpdateInternetPopulations
                
        'Now Do outbound
        sFile = dir(MDIForm1.MainDir + "\Transfers\F1\out\", vbNormal + vbHidden + vbReadOnly + vbSystem + vbArchive)
        MaxBotsPerCyclePerTeleporter = Teleporters(i).BotsPerPoll ' reset the counter
        While sFile <> "" And MaxBotsPerCyclePerTeleporter > 0
          sAns(0) = sFile
          lElement = IIf(sAns(0) = "", 0, UBound(sAns) + 1)
          ReDim Preserve sAns(lElement) As String
          sAns(lElement) = sFile
          If Right(sFile, 3) = "dbo" Then
            MaxBotsPerCyclePerTeleporter = MaxBotsPerCyclePerTeleporter - 1
            If IntOpts.UploadFile(sAns(lElement), MDIForm1.MainDir + "\Transfers\F1\out\" + sAns(lElement), "/F1/bots") Then
              Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1 ' outbound counter
              sFile = dir(MDIForm1.MainDir + "\Transfers\F1\out\", vbNormal + vbHidden + vbReadOnly + vbSystem + vbArchive)
            Else
              MaxBotsPerCyclePerTeleporter = 1
            End If
          Else
            MsgBox ("Non dbo file " + sFile + "found in " + Teleporters(i).path + ".  Inbound Teleporter Deleted.")
            Teleporters(i).exist = False
            sFile = ""
          End If
          MaxBotsPerCyclePerTeleporter = MaxBotsPerCyclePerTeleporter - 1
        Wend
       ' End If
          IntOpts.Disconnect
        'End If
        Teleporters(i).BackFlowLimit = 9
      Else
        Teleporters(i).PollCountDown = Teleporters(i).PollCountDown - 1
      End If
    End If
    GoTo bypass
abandonthiscycle:
  '    MsgBox ("Error getting input directory on " + Teleporters(i).path + ".  Will try again next cycle.")
bypass:
  Next i
  
'Form1.SecTimer.Enabled = True
End Function

Public Function UpdateTeleporters()
Dim i As Integer
  For i = 1 To numTeleporters
    If SimOpts.TotRunCycle >= 0 Then
      DriftTeleporter i
      MoveTeleporter i
    End If
  Next i
  
  TeleportInBots
End Function

Public Function whichTeleporter(X As Single, Y As Single) As Integer
  Dim t As Integer
  whichTeleporter = 0
  For t = 1 To numTeleporters
    If X >= Teleporters(t).pos.X And X <= Teleporters(t).pos.X + Teleporters(t).Width And _
       Y >= Teleporters(t).pos.Y And Y <= Teleporters(t).pos.Y + Teleporters(t).Height Then
       whichTeleporter = t
       Exit Function
    End If
  Next t
End Function

