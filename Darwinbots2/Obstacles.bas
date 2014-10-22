Attribute VB_Name = "Obstacles"
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

Public Type Obstacle
  exist As Boolean
  pos As vector
  Width As Single
  Height As Single
  color As Long
  vel As vector
End Type

Public Const MAXOBSTACLES = 1000
Public numObstacles As Integer
Public Obstacles(MAXOBSTACLES) As Obstacle
Public defaultWidth As Single
Public defaultHeight As Single
Public obstaclefocus As Integer
Public mousepos As vector
Public mazeCorridorWidth As Integer
Public mazeWallThickness As Integer
Public leftCompactor As Integer
Public rightCompactor As Integer

Public Function DrawHorizontalMaze()
  Dim i As Integer
  Dim j As Integer
  Dim numOfLines As Integer
  Dim Opening As Long
      
  numOfLines = CInt(SimOpts.FieldWidth / (mazeCorridorWidth + mazeWallThickness)) - 1
  For i = 1 To numOfLines
    Opening = Random(0, SimOpts.FieldHeight - mazeCorridorWidth)
    j = NewObstacle(CSng(CSng(i) * CSng(mazeCorridorWidth + mazeWallThickness)), -100, CSng(mazeWallThickness), CSng(Opening))
    If (Opening + mazeCorridorWidth) < SimOpts.FieldHeight + 100 Then
      NewObstacle CSng(CSng(i) * CSng(mazeCorridorWidth + mazeWallThickness)), Opening + CSng(mazeCorridorWidth), CSng(mazeWallThickness), SimOpts.FieldHeight + 100 - Opening - CSng(mazeCorridorWidth)
    End If
  Next i
End Function

Public Function DrawVerticalMaze()
  Dim i As Integer
  Dim j As Integer
  Dim numOfLines As Integer
  Dim Opening As Long
      
  numOfLines = CInt(SimOpts.FieldHeight / (mazeCorridorWidth + mazeWallThickness)) - 1
  For i = 1 To numOfLines
    Opening = Random(0, SimOpts.FieldWidth - mazeCorridorWidth)
    j = NewObstacle(-100, CSng(CSng(i) * CSng(mazeCorridorWidth + mazeWallThickness)), CSng(Opening), CSng(mazeWallThickness))
    If (Opening + mazeCorridorWidth) < SimOpts.FieldWidth + 100 Then
      j = NewObstacle(CSng(Opening + CSng(mazeCorridorWidth)), CSng(i) * CSng(mazeCorridorWidth + mazeWallThickness), SimOpts.FieldWidth + 100 - Opening - CSng(mazeCorridorWidth), CSng(mazeWallThickness))
    End If
  Next i
End Function


Public Function DrawCheckerboardMaze()
  Dim i As Integer
  Dim j As Integer
  Dim k As Integer
  Dim x As Single
  Dim y As Single
  Dim numBlocksAcross As Single
  Dim numBlocksDown As Single
  Dim acrossGap As Single
  Dim downGap As Single
  Dim blockWidth As Single
    
  blockWidth = Min(5000, SimOpts.FieldWidth / 10)
        
  numBlocksAcross = Int(SimOpts.FieldWidth / (blockWidth + mazeCorridorWidth))
  acrossGap = (numBlocksAcross * (blockWidth + mazeCorridorWidth) + mazeCorridorWidth - SimOpts.FieldWidth) / 2
  numBlocksDown = Int(SimOpts.FieldHeight / (blockWidth + mazeCorridorWidth))
  downGap = (numBlocksDown * (blockWidth + mazeCorridorWidth) + mazeCorridorWidth - SimOpts.FieldHeight) / 2
       
  For i = 0 To numBlocksAcross - 1
    For j = 0 To numBlocksDown - 1
      x = CSng(i * blockWidth) + CSng(i + 1#) * CSng(mazeCorridorWidth) - acrossGap
      y = CSng(j * blockWidth) + CSng(j + 1#) * CSng(mazeCorridorWidth) - downGap
      k = NewObstacle(x, y, blockWidth, blockWidth)
    Next j
  Next i
 'allowHorizontalShapeDrift = True
 ' allowVerticalShapeDrift = True
 ' obstacleDriftRate = 20
  
End Function

Public Function DrawPolarIceMaze()
  Dim i As Integer
  Dim k As Integer
  Dim blockWidth As Single
  Dim blockHeight As Single
    
  blockWidth = SimOpts.FieldWidth / 2
  blockHeight = SimOpts.FieldHeight / 2
          
  For i = 0 To 8
     k = NewObstacle(blockWidth / 2, blockHeight / 2, blockWidth, blockHeight)
  Next i
  
  SimOpts.allowHorizontalShapeDrift = True
  SimOpts.allowVerticalShapeDrift = True
  SimOpts.shapeDriftRate = 20
  
End Function

Public Function InitTrashCompactorMaze()
  Dim i As Integer
  Dim k As Integer
  Dim blockWidth As Single
  Dim blockHeight As Single
    
  blockWidth = 1000
  blockHeight = SimOpts.FieldHeight * 1.2
          
  leftCompactor = NewObstacle(-blockWidth + 1, SimOpts.FieldHeight * -0.1, blockWidth, blockHeight)
  rightCompactor = NewObstacle(SimOpts.FieldWidth - 1, SimOpts.FieldHeight * -0.1, blockWidth, blockHeight)
  'SimOpts.shapeDriftRate = 100
  Obstacles(leftCompactor).vel.x = SimOpts.shapeDriftRate * 0.1
  Obstacles(rightCompactor).vel.x = -SimOpts.shapeDriftRate * 0.1
  
End Function

Public Function TrashCompactorMove()
  If Obstacles(leftCompactor).pos.x > Obstacles(rightCompactor).pos.x + 400 Then
    Obstacles(leftCompactor).vel.x = -Obstacles(leftCompactor).vel.x
    Obstacles(rightCompactor).vel.x = -Obstacles(rightCompactor).vel.x
  End If
  If Obstacles(leftCompactor).pos.x <= -Obstacles(leftCompactor).Width Then
    Obstacles(leftCompactor).vel.x = SimOpts.shapeDriftRate * 0.1
    Obstacles(rightCompactor).vel.x = -SimOpts.shapeDriftRate * 0.1
  End If
End Function


Public Function DrawSpiral()
Dim numOfHorzLines As Integer
Dim numOfVertLines As Integer
Dim numOfLines As Integer
Dim i As Integer
Dim j As Integer

  numOfHorzLines = CInt(SimOpts.FieldHeight / (mazeCorridorWidth + mazeWallThickness)) - 1
  numOfVertLines = CInt(SimOpts.FieldWidth / (mazeCorridorWidth + mazeWallThickness)) - 1
  numOfLines = Min(numOfHorzLines, numOfVertLines)
  If (numOfLines Mod 2) <> 0 Then
    numOfLines = numOfLines - 1
  End If
  For i = 1 To (numOfLines / 2)
    j = NewObstacle(CSng(CSng(i - 1) * CSng(mazeCorridorWidth)), CSng(CSng(i) * CSng(mazeCorridorWidth)), _
                    CSng(SimOpts.FieldWidth - (CSng(mazeCorridorWidth) * (2 * (i - 1) + 1))), CSng(mazeWallThickness))
    j = NewObstacle(CSng(CSng(i) * CSng(mazeCorridorWidth)), CSng(SimOpts.FieldHeight - CSng(CSng(mazeCorridorWidth) * CSng(i))), _
                    CSng(SimOpts.FieldWidth - CSng(mazeCorridorWidth * 2# * CSng(i) - CSng(mazeWallThickness))), CSng(mazeWallThickness))
    j = NewObstacle(CSng(SimOpts.FieldWidth - (CSng(mazeCorridorWidth) * CSng(i))), CSng(CSng(i) * CSng(mazeCorridorWidth)), _
                    CSng(mazeWallThickness), CSng(SimOpts.FieldHeight - (CSng(CSng(mazeCorridorWidth) * CSng(2 * i)))))
    j = NewObstacle(CSng(CSng(i) * CSng(mazeCorridorWidth)), CSng(CSng(i + 1#) * CSng(mazeCorridorWidth)), _
                    CSng(mazeWallThickness), CSng(SimOpts.FieldHeight - CSng(mazeCorridorWidth * CSng(2 * i + 1))))
  Next i
End Function

Public Function NewObstacle(x As Single, y As Single, Width As Single, Height As Single) As Integer
Dim i As Integer
  
  If numObstacles + 1 > MAXOBSTACLES Then
    NewObstacle = -1
  Else
    numObstacles = numObstacles + 1
    NewObstacle = numObstacles
    Obstacles(numObstacles).exist = True
    Obstacles(numObstacles).pos.x = x
    Obstacles(numObstacles).pos.y = y
    Obstacles(numObstacles).Width = Width
    Obstacles(numObstacles).Height = Height
    Obstacles(numObstacles).vel.x = 0
    Obstacles(numObstacles).vel.y = 0
    If SimOpts.makeAllShapesBlack Then
      Obstacles(numObstacles).color = vbBlack
    Else
      Obstacles(numObstacles).color = Rnd(255) * 65536 + Rnd(255) * 255 + Rnd(255) ' Random Color
    End If
   End If
 
 End Function


Public Function DrawObstacles()
Dim i As Integer
   
Form1.FillStyle = 1

  For i = 1 To numObstacles
    If Obstacles(i).exist Then
      If SimOpts.makeAllShapesTransparent Then
        Form1.Line (Obstacles(i).pos.x, Obstacles(i).pos.y)-(Obstacles(i).pos.x + Obstacles(i).Width, Obstacles(i).pos.y + Obstacles(i).Height), Obstacles(i).color, B
      Else
        Form1.Line (Obstacles(i).pos.x, Obstacles(i).pos.y)-(Obstacles(i).pos.x + Obstacles(i).Width, Obstacles(i).pos.y + Obstacles(i).Height), Obstacles(i).color, BF
      End If
      If i = obstaclefocus Then
        Form1.Line (Obstacles(i).pos.x - 2, Obstacles(i).pos.y - 2)-(Obstacles(i).pos.x + Obstacles(i).Width + 2, Obstacles(i).pos.y + Obstacles(i).Height + 2), vbWhite, B
      End If
    End If
  Next i
  
  Form1.FillStyle = 0
End Function

Public Function AddRandomObstacles(n As Integer) As Integer
Dim i As Integer
Dim randomX As Single
Dim randomy As Single
Dim RandomWidth As Single
Dim RandomHeight As Single

  If n < 1 Then
    AddRandomObstacles = -1
    Exit Function
  End If
  
  i = 0
  While i <> -1 And n > 0
    randomX = Rnd * SimOpts.FieldWidth
    randomy = Rnd * SimOpts.FieldHeight
      
    RandomWidth = Rnd * SimOpts.FieldWidth * defaultWidth
    RandomHeight = Rnd * SimOpts.FieldHeight * defaultHeight
    
    'Shift everything up and left by half the max dimensions then trim to more evenly distribute obstacles across the field
    randomX = randomX - SimOpts.FieldWidth * (defaultWidth / 2)
    randomy = randomy - SimOpts.FieldHeight * (defaultHeight / 2)
    
    If randomX < 0 Then randomX = 0
    If randomy < 0 Then randomy = 0
    
    If randomX + RandomWidth > SimOpts.FieldWidth Then RandomWidth = SimOpts.FieldWidth - randomX
    If randomy + RandomHeight > SimOpts.FieldHeight Then RandomHeight = SimOpts.FieldHeight - randomy
    i = NewObstacle(randomX, randomy, RandomWidth, RandomHeight)
    n = n - 1
  Wend
  
  If i = -1 Or n <> 0 Then
    AddRandomObstacles = -1
  Else
    AddRandomObstacles = 0
  End If
  
End Function
Public Function InitObstacles()
Dim i As Integer

  For i = 1 To MAXOBSTACLES
    Obstacles(i).exist = False
  Next i
  numObstacles = 0
End Function
Public Function DeleteAllObstacles()
Dim i As Integer

  For i = 1 To numObstacles
    Obstacles(i).exist = False
  Next i
  numObstacles = 0
End Function

Public Function DeleteObstacle(i As Integer)
  Dim j As Integer
  
  If i < 1 Or i > numObstacles Or numObstacles = 0 Then Exit Function
  For j = i To numObstacles
    Obstacles(j) = Obstacles(j + 1)
  Next j
  Obstacles(numObstacles).exist = False
  numObstacles = numObstacles - 1
  
End Function

Public Function ChangeAllObstacleColor(color As Long)
Dim i As Integer
  
  For i = 1 To numObstacles
    If color < 0 Then
      Obstacles(i).color = Rnd(255) * 65536 + Rnd(255) * 255 + Rnd(255) ' Random Color
    Else
      Obstacles(i).color = color
    End If
  Next i
End Function

Public Function DeleteTenRandomObstacles()
Dim pos As Integer
Dim i As Integer
  
  If numObstacles > 0 Then
    For i = 1 To 10
      DeleteObstacle (Random(1, numObstacles))
    Next i
  End If
 
End Function
 
Public Function MoveObstacles()
  Dim i As Integer
  
    If SimOpts.allowHorizontalShapeDrift Or SimOpts.allowVerticalShapeDrift Then DriftObstacles
    If leftCompactor > 0 Or rightCompactor > 0 Then TrashCompactorMove
    
    For i = 1 To numObstacles
      If Obstacles(i).exist Then
        Obstacles(i).pos = VectorAdd(Obstacles(i).pos, Obstacles(i).vel)
        'Keep obstalces from drifting off into space.
        If Obstacles(i).pos.x < -Obstacles(i).Width Then
          Obstacles(i).pos.x = -Obstacles(i).Width
          Obstacles(i).vel.x = SimOpts.shapeDriftRate * 0.01
        End If
        If Obstacles(i).pos.y < -Obstacles(i).Height Then
          Obstacles(i).pos.y = -Obstacles(i).Height
          Obstacles(i).vel.y = SimOpts.shapeDriftRate * 0.01
        End If
        If Obstacles(i).pos.x > SimOpts.FieldWidth Then
          Obstacles(i).pos.x = SimOpts.FieldWidth
          Obstacles(i).vel.x = -SimOpts.shapeDriftRate * 0.01
        End If
        If Obstacles(i).pos.y > SimOpts.FieldHeight Then
          Obstacles(i).pos.y = SimOpts.FieldHeight
          Obstacles(i).vel.y = -SimOpts.shapeDriftRate * 0.01
        End If
      End If
      Next i
End Function

Public Function DriftObstacles()
Dim i As Integer

  For i = 1 To numObstacles
    If Obstacles(i).exist And (i <> leftCompactor And i <> rightCompactor) Then
      If SimOpts.allowHorizontalShapeDrift Then
        Obstacles(i).vel.x = Obstacles(i).vel.x + Random(-SimOpts.shapeDriftRate, SimOpts.shapeDriftRate) * Rnd * 0.01
      End If
      If SimOpts.allowVerticalShapeDrift Then
        Obstacles(i).vel.y = Obstacles(i).vel.y + Random(-SimOpts.shapeDriftRate, SimOpts.shapeDriftRate) * Rnd * 0.01
      End If
      If VectorMagnitude(Obstacles(i).vel) > SimOpts.MaxVelocity Then
        Obstacles(i).vel = VectorScalar(Obstacles(i).vel, VectorMagnitude(Obstacles(i).vel) / SimOpts.MaxVelocity)
      End If
    End If
  Next i
End Function
Public Function StopAllVerticalObstacleMovement()
  Dim i As Integer
 
  For i = 1 To numObstacles
    If Obstacles(i).exist Then
      Obstacles(i).vel.y = 0
    End If
  Next i
End Function

Public Function StopAllHorizontalObstacleMovement()
  Dim i As Integer
 
  For i = 1 To numObstacles
    If Obstacles(i).exist Then
      Obstacles(i).vel.x = 0
    End If
  Next i
End Function


Public Function ObstacleCollision(n As Integer, o As Integer) As Boolean
Dim botrightedge As Single
Dim botleftedge As Single
Dim bottopedge As Single
Dim botbottomedge As Single

  ObstacleCollision = False
  
  botrightedge = rob(n).pos.x + rob(n).radius
  botleftedge = rob(n).pos.x - rob(n).radius
  bottopedge = rob(n).pos.y - rob(n).radius
  botbottomedge = rob(n).pos.y + rob(n).radius

  If (botrightedge > Obstacles(o).pos.x) And _
     (botleftedge < Obstacles(o).pos.x + Obstacles(o).Width) And _
     (botbottomedge > Obstacles(o).pos.y) And _
     (bottopedge < Obstacles(o).pos.y + Obstacles(o).Height) Then
    ObstacleCollision = True
  End If
End Function

Public Function DoShotObstacleCollisions(ByVal n As Long)
Dim i As Integer
  
  With Shots(n)
  For i = 1 To numObstacles
    If Obstacles(i).exist Then
      If .pos.x >= Obstacles(i).pos.x And _
         .pos.x <= Obstacles(i).pos.x + Obstacles(i).Width And _
         .pos.y >= Obstacles(i).pos.y And _
         .pos.y <= Obstacles(i).pos.y + Obstacles(i).Height Then
           If SimOpts.shapesAbsorbShots Then .exist = False
           If .opos.x < Obstacles(i).pos.x Or .opos.x > (Obstacles(i).pos.x + Obstacles(i).Width) Then
             .velocity.x = -.velocity.x
           End If
           If .opos.y < Obstacles(i).pos.y Or .opos.y > (Obstacles(i).pos.y + Obstacles(i).Height) Then
             .velocity.y = -.velocity.y
           End If
      End If
    End If
  Next i
  End With
End Function

Public Function DoObstacleCollisions(n As Integer)
Dim i As Integer
Dim distleft As Single
Dim distright As Single
Dim distup As Single
Dim distdown As Single
Dim numofcollisions As Integer
Dim LastPush As Integer
Dim k As Single
Dim b As Single

numofcollisions = 0
LastPush = 0

k = 0.5
b = 0.5

With rob(n)
  For i = 1 To numObstacles
    If Obstacles(i).exist Then
      If ObstacleCollision(n, i) Then
        numofcollisions = numofcollisions + 1
        If numofcollisions >= 3 Then
         ' Prevents getting trapped
          .pos.x = .pos.x + 200 * Sgn((SimOpts.TotRunCycle Mod 40) - 20)
          .pos.y = .pos.y + 200 * Sgn((SimOpts.TotRunCycle Mod 50) - 25)
          GoTo getout
        End If
        'Push the bot out the closest edge
        distup = (rob(n).pos.y + rob(n).radius) - Obstacles(i).pos.y '- (rob(n).vel.y / 2)
        distdown = Obstacles(i).pos.y + Obstacles(i).Height - (rob(n).pos.y - rob(n).radius) '- (rob(n).vel.y / 2)
        distleft = (rob(n).pos.x + rob(n).radius) - Obstacles(i).pos.x '- (rob(n).vel.x / 2)
        distright = Obstacles(i).pos.x + Obstacles(i).Width - (rob(n).pos.x - rob(n).radius) '- (rob(n).vel.x / 2)
               
        If (Min(distleft, distright) < Min(distup, distdown) And _
           (LastPush <> 1 And LastPush <> 2)) Or _
           (LastPush = 3 Or LastPush = 4) Then
          'Push out left or right
          If ((distleft <= distright) Or _
             (Obstacles(i).pos.x + Obstacles(i).Width) >= SimOpts.FieldWidth) And _
             (Obstacles(i).pos.x > 0) Then
          
            If rob(n).pos.x - rob(n).radius < Obstacles(i).pos.x Then
              .pos.x = Obstacles(i).pos.x - rob(n).radius
              .ImpulseRes.x = .ImpulseRes.x + .vel.x * b
               touch n, .pos.x + .radius, .pos.y ' Update hit senses, right side
            Else
              .ImpulseRes.x = .ImpulseRes.x + distleft * k
            '  If .Fixed Then .pos = VectorSub(.pos, .ImpulseRes) ' force .fixed guys to move without changing their fixedness
              .pos.x = Obstacles(i).pos.x - rob(n).radius
            End If
            LastPush = 1
          Else
            If rob(n).pos.x + rob(n).radius > Obstacles(i).pos.x + Obstacles(i).Width Then
              .pos.x = Obstacles(i).pos.x + Obstacles(i).Width + rob(n).radius
              .ImpulseRes.x = .ImpulseRes.x + .vel.x * b
              touch n, .pos.x - .radius, .pos.y ' Update hit senses, left side
            Else
              .ImpulseRes.x = .ImpulseRes.x - distright * k
           '   If .Fixed Then .pos = VectorSub(.pos, .ImpulseRes) ' force .fixed guys to move without changing their fixedness
              .pos.x = Obstacles(i).pos.x + Obstacles(i).Width + rob(n).radius
            End If
            LastPush = 2
          End If
        Else
          'Push out up or down
          If ((distup <= distdown) Or _
             (Obstacles(i).pos.y + Obstacles(i).Height) >= SimOpts.FieldHeight) And _
             (Obstacles(i).pos.y > 0) Then
            If rob(n).pos.y - rob(n).radius < Obstacles(i).pos.y Then
              .pos.y = Obstacles(i).pos.y - rob(n).radius
              .ImpulseRes.y = .ImpulseRes.y + .vel.y * b
              touch n, .pos.x, .pos.y + .radius  ' Update hit senses, bottom
            Else
              .ImpulseRes.y = .ImpulseRes.y + distup * k
          '    If .Fixed Then .pos = VectorSub(.pos, .ImpulseRes) ' force .fixed guys to move without changing their fixedness
             .pos.y = Obstacles(i).pos.y - rob(n).radius
            End If
            LastPush = 3
          Else
            If rob(n).pos.y + rob(n).radius > Obstacles(i).pos.y + Obstacles(i).Height Then
              .pos.y = Obstacles(i).pos.y + Obstacles(i).Height + rob(n).radius
              .ImpulseRes.y = .ImpulseRes.y + .vel.y * b
              touch n, .pos.x, .pos.y - .radius  ' Update hit senses, bottom
            Else
              .ImpulseRes.y = .ImpulseRes.y - distdown * k
            '  If .Fixed Then .pos = VectorSub(.pos, .ImpulseRes) ' force .fixed guys to move without changing their fixedness
              .pos.y = Obstacles(i).pos.y + Obstacles(i).Height + rob(n).radius
            End If
            
           LastPush = 4
          End If
        End If
        
        'Botsareus 12/3/2013 If robot sees nothing and touch a shape update reftype
        If LastPush > 0 And .mem(EYEF) = 0 Then
            .mem(REFTYPE) = 1
        End If
        
        
       
       ' If VectorMagnitude(.ImpulseRes) > VectorMagnitude(.vel) Then
       '   .ImpulseRes = VectorScalar(.ImpulseRes, (VectorMagnitude(.vel) / VectorMagnitude(.ImpulseRes)) * 0.99)
       ' End If
      End If
    End If
  Next i
  
 ' If numofcollisions > 2 Then
    'Give up and just get them out of there
 '   .pos.x = Rnd * SimOpts.FieldWidth
 '   .pos.y = Rnd * SimOpts.FieldHeight
 ' End If
    'ImpulseRes.y = .ImpulseRes.y - SimOpts.MaxVelocity * (Rnd(1) * -2 + 1) * Rnd(1)
'    .ImpulseRes.x = .ImpulseRes.x - SimOpts.MaxVelocity * (Rnd(1) * -2 + 1) * Rnd(1)
'  End If
getout:

  End With
End Function

Public Function whichobstacle(x As Single, y As Single) As Integer
  Dim t As Integer
  whichobstacle = 0
  For t = numObstacles To 1 Step -1
    If Obstacles(t).exist Then
      If x >= Obstacles(t).pos.x And x <= Obstacles(t).pos.x + Obstacles(t).Width And _
         y >= Obstacles(t).pos.y And y <= Obstacles(t).pos.y + Obstacles(t).Height Then
         whichobstacle = t
         Exit Function
      End If
    End If
  Next t
End Function
