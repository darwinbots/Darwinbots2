Attribute VB_Name = "Teleport"
' Copyright (c) 2006 Eric Lockard
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
  driftHorizontal As Boolean
  driftVertical As Boolean
  highlight As Boolean
  teleportVeggies As Boolean
  teleportCorpses As Boolean
  RespectShapes As Boolean
  NumTeleported As Long
  center As vector
  teleportHeterotrophs As Boolean
  InboundPollCycles As Integer
  BotsPerPoll As Integer
  PollCountDown As Integer
End Type

Public Const MAXTELEPORTERS = 10
Public numTeleporters As Integer
Public teleporterFocus As Integer

Public Teleporters(MAXTELEPORTERS) As Teleporter

Public Function NewTeleporter(path As String, PortIn As Boolean, PortOut As Boolean, Position As vector, Width As Single, Height As Single) As Integer
Dim i As Integer

  If numTeleporters + 1 > MAXTELEPORTERS Then
    NewTeleporter = -1
  Else
    numTeleporters = numTeleporters + 1
    NewTeleporter = numTeleporters
    Teleporters(numTeleporters).exist = True
    Teleporters(numTeleporters).pos = Position
    Teleporters(numTeleporters).Width = Width
    Teleporters(numTeleporters).Height = Height
    Teleporters(numTeleporters).vel = VectorSet(0, 0)
    Teleporters(numTeleporters).color = vbWhite
    Teleporters(numTeleporters).path = path
    Teleporters(numTeleporters).In = PortIn
    Teleporters(numTeleporters).Out = PortOut
    Teleporters(numTeleporters).driftHorizontal = True
    Teleporters(numTeleporters).driftVertical = True
    Teleporters(numTeleporters).NumTeleported = 0
  End If
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
    If Teleporters(i).Out Or Teleporters(i).local Then
      If TeleportCollision(n, i) And rob(n).exist Then
        If Teleporters(i).Out Then
          If (rob(n).Veg And Not Teleporters(i).teleportVeggies) Or _
             (rob(n).Corpse And Not Teleporters(i).teleportCorpses) Or _
             ((Not rob(n).Veg) And (Not Teleporters(i).teleportHeterotrophs)) Then
            'Don't Teleport
          Else
            Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1
            Name = "\" + rob(n).FName + CStr(i) + CStr(Teleporters(i).NumTeleported) + (Format(Date, "yymmdd")) + Format(Time, "hhmmss") + ".dbo"
            SaveOrganism Teleporters(i).path + Name, n
            KillOrganism n
          End If
        ElseIf Teleporters(i).local Then
          If (rob(n).Veg And Not Teleporters(i).teleportVeggies) Or _
             (rob(n).Corpse And Not Teleporters(i).teleportCorpses) Or _
             ((Not rob(n).Veg) And (Not Teleporters(i).teleportHeterotrophs)) Then
            'Don't Teleport
          Else
            Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1
            randomV = VectorSet(SimOpts.FieldWidth * Rnd, SimOpts.FieldHeight * Rnd)
            If MDIForm1.visualize Then Form1.Line (rob(n).pos.X, rob(n).pos.Y)-(randomV.X, randomV.Y), vbWhite
            ReSpawn n, CLng(randomV.X), CLng(randomV.Y)
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
  
  'botrightedge = rob(n).pos.x + rob(n).radius
  'botleftedge = rob(n).pos.x - rob(n).radius
  'bottopedge = rob(n).pos.y - rob(n).radius
  'botbottomedge = rob(n).pos.y + rob(n).radius

  'If (botrightedge > Teleporters(t).pos.x) And _
  '   (botleftedge < Teleporters(t).pos.x + Teleporters(t).Width) And _
  '   (botbottomedge > Teleporters(t).pos.y) And _
  '   (bottopedge < Teleporters(t).pos.y + Teleporters(t).Height) Then
  '  TeleportCollision = True
  'End If
      

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
 
   
  zoomRatio = Form1.ScaleWidth / SimOpts.FieldWidth
  aspectRatio = SimOpts.FieldHeight / SimOpts.FieldWidth
  
  Form1.FillStyle = 1
  
  For i = 1 To numTeleporters
    If SimOpts.TotRunCycle >= 0 Then
             
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
    
      
      If Teleporters(i).highlight Then
        If Teleporters(i).In Then hilightcolor = vbGreen
        If Teleporters(i).Out Then hilightcolor = vbRed
        If Teleporters(i).local Then hilightcolor = vbYellow
        Form1.Circle (Teleporters(i).pos.X + (Teleporters(i).Width / 2), Teleporters(i).pos.Y + (Teleporters(i).Height / 3)), Teleporters(i).Width * 0.6, hilightcolor
      End If
      
      If i = teleporterFocus Then
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

Public Function TeleportInBots()
Dim i As Integer
Dim sFile As String
Dim lElement As Long
Dim sAns() As String
ReDim sAns(0) As String
Dim MaxBotsPerCyclePerTeleporter As Integer

  'MaxBotsPerCyclePerTeleporter = 10

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
            LoadOrganism Teleporters(i).path + "\" + sAns(lElement), Teleporters(i).pos.X + Teleporters(i).Width / 2, Teleporters(i).pos.Y + Teleporters(i).Height / 3
            Teleporters(i).NumTeleported = Teleporters(i).NumTeleported + 1
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
      GoTo bypass
abandonthiscycle:
  '    MsgBox ("Error getting input directory on " + Teleporters(i).path + ".  Will try again next cycle.")
bypass:
    End If
  Next i
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

