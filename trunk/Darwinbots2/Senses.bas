Attribute VB_Name = "Senses"
'
'     S E N S E S
'

'This module is the most processor intensive.

Option Explicit

' Sets .sun to 1 if robot.aim is within 0.18 radians of 1.57 (Basically up)
' new version with less clutter.
Public Sub LandMark(ByVal iRobID As Integer)

rob(iRobID).mem(LandM) = 0
If rob(iRobID).aim > 1.39 And rob(iRobID).aim < 1.75 Then rob(iRobID).mem(LandM) = 1

End Sub

' touch: tells a robot whether it has been hit by another one
' and where: up, dn dx, sx
Public Sub touch(ByVal a As Long, ByVal X As Long, ByVal Y As Long)
  Dim xc As Single
  Dim yc As Single
  Dim dx As Single
  Dim dy As Single
  Dim tn As Single
  Dim ang As Single
  Dim aim As Single
  Dim dang As Single
  aim = 6.28 - rob(a).aim
  xc = rob(a).pos.X
  yc = rob(a).pos.Y
  dx = X - xc
  dy = Y - yc
  
  If dx <> 0 Then
    tn = dy / dx
    ang = Atn(tn)
    If dx < 0 Then ang = ang - 3.14
  Else
    ang = 1.57 * Sgn(dy)
  End If
  
  dang = ang - aim
  While dang < 0
    dang = dang + 6.28
  Wend
  While dang > 6.28
    dang = dang - 6.28
  Wend
  If dang > 5.49 Or dang < 0.78 Then rob(a).mem(hitup) = 1
  If dang > 2.36 And dang < 3.92 Then rob(a).mem(hitdn) = 1
  If dang > 0.78 And dang < 2.36 Then rob(a).mem(hitdx) = 1
  If dang > 3.92 And dang < 5.49 Then rob(a).mem(hitsx) = 1
  rob(a).mem(hit) = 1
End Sub

' taste: same as for touch, but for shots, and gives back
' also the flavour of the shot, that is, its shottype
' value
Public Sub taste(a As Integer, ByVal X As Single, ByVal Y As Single, value As Integer)
  Dim xc As Single
  Dim yc As Single
  Dim dx As Single
  Dim dy As Single
  Dim tn As Single
  Dim ang As Single
  Dim aim As Single
  Dim dang As Single
  aim = 6.28 - rob(a).aim
  xc = rob(a).pos.X
  yc = rob(a).pos.Y
  dx = X - xc
  dy = Y - yc
  If dx <> 0 Then
    tn = dy / dx
    ang = Atn(tn)
    If dx < 0 Then ang = ang - 3.14
  Else
    ang = 1.57 * Sgn(dy)
  End If
  dang = ang - aim
  While dang < 0
    dang = dang + 6.28
  Wend
  While dang > 6.28
    dang = dang - 6.28
  Wend
  If dang > 5.49 Or dang < 0.78 Then rob(a).mem(shup) = value
  If dang > 2.36 And dang < 3.92 Then rob(a).mem(shdn) = value
  If dang > 0.78 And dang < 2.36 Then rob(a).mem(shdx) = value
  If dang > 3.92 And dang < 5.49 Then rob(a).mem(shsx) = value
  rob(a).mem(209) = dang * 200  'sysvar = .shang just returns the angle of the shot without the flavor
  rob(a).mem(shflav) = value    'sysvar = .shflav returns the flavor without the angle
End Sub

' erases some senses
Public Sub EraseSenses(n As Integer)
  Dim l As Integer
  With rob(n)
    .mem(hitup) = 0
    .mem(hitdn) = 0
    .mem(hitdx) = 0
    .mem(hitsx) = 0
    .mem(hit) = 0
    .mem(shflav) = 0
    .mem(209) = 0 '.shang
    .mem(shup) = 0
    .mem(shdn) = 0
    .mem(shdx) = 0
    .mem(shsx) = 0
    .mem(214) = 0   'edge collision detection
    EraseLookOccurr (n)
    
   'EricL - *trefvars now persist across cycles
   ' For l = 1 To 10 ' resets *trefvars
   '   .mem(455 + l) = 0
   ' Next l
   ' For l = 0 To 10     'resets
   '     .mem(trefxpos + l) = 0
   ' Next l
   ' .mem(472) = 0
  End With
End Sub

Public Function BasicProximity(n As Integer, Optional force As Boolean = False) As Integer 'returns .lastopp
  Dim counter As Integer
  Dim u As vector
  Dim dotty As Long, crossy As Long
  Dim X As Integer
  
  'until I get some better data structures, this will ahve to do
  
  rob(n).lastopp = 0
  rob(n).lastopptype = 0 ' set the default type of object seen to a bot.
  rob(n).mem(EYEF) = 0
  For X = EyeStart + 1 To EyeEnd - 1
    rob(n).mem(X) = 0
  Next X
  
  'We have to populate eyes for every bot, even for those without .eye sysvars
  'since they could evolve indirect addressing of the eye sysvars.
  For counter = 1 To MaxRobs
    If n <> counter And rob(counter).exist Then
       CompareRobots3 n, counter
    End If
  Next counter
  
  If SimOpts.shapesAreVisable And rob(n).exist Then CompareShapes n, 12
      
  BasicProximity = rob(n).lastopp ' return the index of the last viewed object
End Function

'Returns the index into the Specie array to which a given bot conforms
Public Function SpeciesFromBot(n As Integer) As Integer
Dim i As Integer

i = 0
While SimOpts.Specie(i).Name <> rob(n).FName And i < SimOpts.SpeciesNum
   i = i + 1
Wend
SpeciesFromBot = i
End Function


' writes some senses: view, .ref* vars, absvel
' pain, pleas, nrg
Public Sub WriteSenses(n As Integer)
  Dim t As Integer
  Dim i As Integer
  Dim temp As Single
  
  LandMark n
  With rob(n)
   
    .mem(TotalBots) = TotalRobots
    .mem(TOTALMYSPECIES) = SimOpts.Specie(SpeciesFromBot(n)).population
    
    If Not .CantSee And Not .Corpse Then
      If BucketsProximity(n) > 0 Then
      'If BasicProximity(n) > 0 Then
        'There is somethign visable in the focus eye
        If .lastopptype = 0 Then lookoccurr n, .lastopp ' It's a bot.  Populate the refvar sysvars
        If .lastopptype = 1 Then lookoccurrShape n, .lastopp
      End If
    End If
      

    'If Abs(.vel.x) > 1000 Then .vel.x = 1000 * Sgn(.vel.x) '2 new lines added to stop weird crashes
    'If Abs(.vel.y) > 1000 Then .vel.y = 1000 * Sgn(.vel.y)

    If .nrg > 32000 Then .nrg = 32000
    If .onrg < 0 Then .onrg = 0
    If .obody < 0 Then .obody = 0
    If .nrg < 0 Then .nrg = 0

    .mem(pain) = CInt(.onrg - .nrg)
    .mem(pleas) = CInt(.nrg - .onrg)
    .mem(bodloss) = CInt(.obody - .body)
    .mem(bodgain) = CInt(.body - .obody)
    
    .onrg = .nrg
    .obody = .body
    .mem(Energy) = CInt(.nrg)
    If .age = 0 And .mem(body) = 0 Then .mem(body) = .body 'to stop an odd bug in birth.  Don't ask
    If .Fixed Then .mem(215) = 1 Else .mem(215) = 0
    'If .pos.Y <= 32000 And .pos.Y >= 0 Then .mem(217) = .pos.Y
    temp = Int((.pos.Y / Form1.yDivisor) / 32000#)
    temp = (.pos.Y / Form1.yDivisor) - (temp * 32000#)
    .mem(217) = CInt(temp Mod 32000)
    'If .pos.X <= 32000 And .pos.X >= 0 Then .mem(219) = .pos.X
    temp = Int((.pos.X / Form1.xDivisor) / 32000#)
    temp = (.pos.X / Form1.xDivisor) - (temp * 32000#)
    .mem(219) = CInt(temp Mod 32000)
    If SimOpts.Daytime Then
      .mem(218) = 1
    Else
      .mem(218) = 0
    End If
  End With
End Sub

' copies the occurr array of a viewed robot
' in the ref* vars of the viewing one
Public Sub lookoccurr(ByVal n As Integer, ByVal o As Integer)
  If rob(n).Corpse Then GoTo getout
  Dim t As Byte
  Dim X As Single
  Dim Y As Single
  
  rob(n).mem(REFTYPE) = 0
  
  For t = 1 To 8
    rob(n).mem(occurrstart + t) = rob(o).occurr(t)
  Next t
  
  If rob(o).nrg < 0 Then
     rob(n).mem(occurrstart + 9) = 0
  ElseIf rob(o).nrg < 32001 Then
    rob(n).mem(occurrstart + 9) = rob(o).nrg
  Else
    rob(n).mem(occurrstart + 9) = 32000
  End If
  'EricL 4/13/2006 Added If Then now that age can exceed 32000
  If rob(o).age < 32001 Then
    rob(n).mem(occurrstart + 10) = rob(o).age '.refage
  Else
    rob(n).mem(occurrstart + 10) = 32000
  End If
  
  rob(n).mem(in1) = rob(o).mem(out1)
  rob(n).mem(in2) = rob(o).mem(out2)
  rob(n).mem(in3) = rob(o).mem(out3)
  rob(n).mem(in4) = rob(o).mem(out4)
  rob(n).mem(in5) = rob(o).mem(out5)
  rob(n).mem(in6) = rob(o).mem(out6)
  rob(n).mem(in7) = rob(o).mem(out7)
  rob(n).mem(in8) = rob(o).mem(out8)
  rob(n).mem(in9) = rob(o).mem(out9)
  rob(n).mem(in10) = rob(o).mem(out10)
  
  rob(n).mem(711) = rob(o).mem(18)      'refaim
  rob(n).mem(712) = rob(o).occurr(9)    'reftie
  rob(n).mem(refshell) = rob(o).shell
  rob(n).mem(refbody) = rob(o).body
  rob(n).mem(refypos) = rob(o).mem(217)
  rob(n).mem(refxpos) = rob(o).mem(219)
  'give reference variables from the bots frame of reference
  X = (rob(o).vel.X * Cos(rob(n).aim) + rob(o).vel.Y * Sin(rob(n).aim) * -1) - rob(n).mem(velup)
  Y = (rob(o).vel.Y * Cos(rob(n).aim) + rob(o).vel.X * Sin(rob(n).aim)) - rob(n).mem(veldx)
  If X > 32000 Then X = 32000
  If X < -32000 Then X = -32000
  If Y > 32000 Then Y = 32000
  If Y < -32000 Then Y = -32000
  
  rob(n).mem(refvelup) = X
  rob(n).mem(refveldn) = rob(n).mem(refvelup) * -1
  rob(n).mem(refveldx) = Y
  rob(n).mem(refvelsx) = rob(n).mem(refvelsx) * -1
  Dim temp As Single
  temp = Sqr(CLng(rob(n).mem(refvelup) ^ 2) + CLng(rob(n).mem(refveldx) ^ 2))  ' how fast is this robot moving compared to me?
  If temp > 32000 Then temp = 32000
  
  rob(n).mem(refvelscalar) = temp
  rob(n).mem(713) = rob(o).mem(827)     'refpoison. current value of poison. not poison commands
  rob(n).mem(714) = rob(o).mem(825)     'refvenom (as with poison)
  rob(n).mem(715) = rob(o).Kills        'refkills
   If rob(o).Multibot = True Then
    rob(n).mem(refmulti) = 1
  Else
    rob(n).mem(refmulti) = 0
  End If
  If rob(n).mem(474) > 0 And rob(n).mem(474) <= 1000 Then 'readmem and memloc couple used to read a specified memory location of the target robot
    rob(n).mem(473) = rob(o).mem(rob(n).mem(474))
    If rob(n).mem(474) > EyeStart And rob(n).mem(474) < EyeEnd Then
        rob(o).View = True
    End If
  End If
  If rob(o).Fixed Then                  'reffixed. Tells if a viewed robot is fixed by .fixpos.
    rob(n).mem(477) = 1
  Else
    rob(n).mem(477) = 0
  End If
 ' rob(n).mem(825) = Int(rob(o).venom)
  'rob(n).mem(827) = Int(rob(o).poison)
getout:
End Sub

' Erases the occurr array
Public Sub EraseLookOccurr(ByVal n As Integer)
  
  If rob(n).Corpse Then GoTo getout
  
  Dim t As Byte
  
  rob(n).mem(REFTYPE) = 0
  
  For t = 1 To 10
    rob(n).mem(occurrstart + t) = 0
  Next t
  
  rob(n).mem(in1) = 0
  rob(n).mem(in2) = 0
  rob(n).mem(in3) = 0
  rob(n).mem(in4) = 0
  rob(n).mem(in5) = 0
  rob(n).mem(711) = 0      'refaim
  rob(n).mem(712) = 0    'reftie
  rob(n).mem(refshell) = 0
  rob(n).mem(refbody) = 0
  rob(n).mem(refypos) = 0
  rob(n).mem(refxpos) = 0
  rob(n).mem(refvelup) = 0
  rob(n).mem(refveldn) = 0
  rob(n).mem(refveldx) = 0
  rob(n).mem(refvelsx) = 0
  rob(n).mem(refvelscalar) = 0
  rob(n).mem(713) = 0        'refpoison. current value of poison. not poison commands
  rob(n).mem(714) = 0        'refvenom (as with poison)
  rob(n).mem(715) = 0        'refkills
  rob(n).mem(refmulti) = 0
  rob(n).mem(473) = 0
  rob(n).mem(477) = 0
getout:
End Sub

' sets up the refvars for a viewed shape
' in the ref* vars of the viewing one
Public Sub lookoccurrShape(ByVal n As Integer, ByVal o As Integer)
  ' bot n has shape o in it's focus eye
  
  If rob(n).Corpse Then GoTo getout
  Dim t As Byte
  
  rob(n).mem(REFTYPE) = 1
  
  For t = 1 To 8
    rob(n).mem(occurrstart + t) = 0
  Next t
  
  rob(n).mem(occurrstart + 9) = 0 ' refnrg
   
  rob(n).mem(occurrstart + 10) = 0 'refage
   
  rob(n).mem(in1) = 0
  rob(n).mem(in2) = 0
  rob(n).mem(in3) = 0
  rob(n).mem(in4) = 0
  rob(n).mem(in5) = 0
  rob(n).mem(711) = 0  'refaim
  rob(n).mem(712) = 0  'reftie
  rob(n).mem(refshell) = 0
  rob(n).mem(refbody) = 0
  
  rob(n).mem(refxpos) = CInt((rob(n).lastopppos.X / Form1.xDivisor) Mod 32000)
  rob(n).mem(refypos) = CInt((rob(n).lastopppos.Y / Form1.yDivisor) Mod 32000)
    
  'give reference variables from the bots frame of reference
  rob(n).mem(refvelup) = (Obstacles.Obstacles(o).vel.X * Cos(rob(n).aim) + Obstacles.Obstacles(o).vel.Y * Sin(rob(n).aim) * -1) - rob(n).mem(velup)
  rob(n).mem(refveldn) = rob(n).mem(refvelup) * -1
  rob(n).mem(refveldx) = (Obstacles.Obstacles(o).vel.Y * Cos(rob(n).aim) + Obstacles.Obstacles(o).vel.X * Sin(rob(n).aim)) - rob(n).mem(veldx)
  rob(n).mem(refvelsx) = rob(n).mem(refvelsx) * -1
  
  Dim temp As Single
  temp = Sqr(CLng(rob(n).mem(refvelup) ^ 2) + CLng(rob(n).mem(refveldx) ^ 2))  ' how fast is this shape moving compared to me?
  If temp > 32000 Then temp = 32000
  
  rob(n).mem(refvelscalar) = temp
  rob(n).mem(713) = 0     'refpoison. current value of poison. not poison commands
  rob(n).mem(714) = 0     'refvenom (as with poison)
  rob(n).mem(715) = 0       'refkills
  rob(n).mem(refmulti) = 0
  
 'readmem and memloc couple used to read a specified memory location of the target robot
  rob(n).mem(473) = 0
  
  If Obstacles.Obstacles(o).vel.X = 0 And Obstacles.Obstacles(o).vel.Y = 0 Then                  'reffixed. Tells if a viewed robot is fixed by .fixpos.
    rob(n).mem(477) = 1
  Else
    rob(n).mem(477) = 0
  End If
  
'  rob(n).mem(825) = 0 ' venom
'  rob(n).mem(827) = 0 ' poison
getout:
End Sub

' creates the array which is copied to the ref* variables
' of any opponent looking at us
Public Sub makeoccurrlist(n As Integer)
  Dim t As Long
  Dim k As Integer
  With rob(n)
  
    
    For t = 1 To 12
      .occurr(t) = 0
    Next t
    t = 1
    k = 1
    While Not (.DNA(t).tipo = 10 And .DNA(t).value = 1) And t <= 32000
      
      If .DNA(t).tipo = 0 Then 'number
        If .DNA(t).value < 8 And .DNA(t).value > 0 Then 'if we are dealing with one of the first 8 sysvars
          If .DNA(t + 1).tipo = 7 Then 'DNA is going to store to this value, so it's probably a sysvar
            .occurr(.DNA(t).value) = .occurr(.DNA(t).value) + 1 'then the occur listing for this fxn is incremented
          End If
        End If
      End If
      
      If .DNA(t).tipo = 1 Then '*number
        If .DNA(t).value > 500 And .DNA(t).value < 510 Then 'the bot is referencing an eye
          .occurr(8) = .occurr(8) + 1 'eyes
        End If
      
        If .DNA(t).value = 330 Then 'the bot is referencing .tie
          .occurr(9) = .occurr(9) + 1 'ties
        End If
      
        If .DNA(t).value = 826 Or .DNA(t).value = 827 Then 'referencing either .strpoison or .poison
          .occurr(10) = .occurr(10) + 1   'poison controls
        End If
      
        If .DNA(t).value = 824 Or .DNA(t).value = 825 Then 'refencing either .strvenom or .venom
          .occurr(10) = .occurr(11) + 1   'venom controls
        End If
      End If
      
      t = t + 1
    Wend
exitwhile:
    
    'this is for when two bots have identical eye values in the league
    If n = 11 Then Record_11eyes .occurr(8)
    If n >= 16 And n <= 20 And LeagueMode Then League_Eyefudge n, t
    
    'creates the "ownvars" our own readbacks as versions of the refvars seen by others
    For t = 1 To 8
      .mem(720 + t) = .occurr(t)
    Next t
    .mem(728) = .occurr(8)
    .mem(729) = .occurr(9)
    .mem(730) = .occurr(10)
    .mem(731) = .occurr(11)
  End With
End Sub

'Private Sub Checkleft(field As Long, n As Integer, realfield As Long)
'  Dim counter As Integer
'  Dim robnumber As Integer
'  Dim dx As Long
'  Dim dy As Long
'  Dim dissquared As Long
'  Dim x As Long
'  Dim y As Long
'  Dim dis As Long
'
'  With rob(n)
'  x = rob(n).pos.x
'  y = rob(n).pos.y
'  End With
'
'  dissquared = realfield * realfield
'
'  'check out all the robots to the left
'  counter = rob(n).order - 1
'
'  If counter <> -1 Then
'    robnumber = Roborder(counter)
'    If robnumber <> -1 Then
'      dx = x - rob(robnumber).pos.x
'    Else
'      dx = field + 1
'    End If
'  Else
'    Exit Sub
'  End If
'
'  If dx < 0 Then dx = -dx
'
'  While dx < field
'    dy = y - rob(robnumber).pos.y
'    If dy < 0 Then dy = -dy
'    If dy < realfield Then
'      dis = dy * dy + dx * dx
'      If dis < dissquared Then target n, robnumber, dis
'    End If
'
'    counter = counter - 1
'    If counter = -1 Then Exit Sub
'    robnumber = Roborder(counter)
'
'    dx = x - rob(robnumber).pos.x
'    If dx < 0 Then dx = -dx
'  Wend
'End Sub
'
'Private Sub Checkright(field As Long, n As Integer, realfield As Long)
'  Dim counter As Integer
'  Dim robnumber As Integer
'  Dim dx As Long
'  Dim dy As Long
'  Dim dissquared As Long
'
'  Dim x As Long
'  Dim y As Long
'  Dim dis As Long
'
'  With rob(n)
'  x = rob(n).pos.x
'  y = rob(n).pos.y
'  End With
'
'  dissquared = realfield * realfield
'  'check out all the robots to the right
'
'  counter = rob(n).order + 1
'  robnumber = Roborder(counter)
'  If robnumber <> -1 Then
'    dx = rob(robnumber).pos.x - x
'  Else
'    dx = field + 1
'  End If
'
'  If dx < 0 Then dx = -dx
'
'  While dx < field
'    dy = rob(robnumber).pos.y - y
'    If dy < 0 Then dy = -dy
'
'    If dy < realfield Then
'      dis = dy * dy + dx * dx
'      If dis < dissquared Then target n, robnumber, dis
'    End If
'
'    counter = counter + 1
'    robnumber = Roborder(counter)
'    If robnumber = -1 Then
'      dx = field + 1
'    Else
'      dx = rob(robnumber).pos.x - x
'    End If
'    If dx < 0 Then dx = -dx
'  Wend
'End Sub
'
'Private Sub CheckBoth(field As Long, n As Integer, realfield As Long)
'  Dim counter As Integer
'  Dim robnumber As Integer
'  Dim dx As Long
'  Dim dy As Long
'  Dim dissquared As Long
'
'  Dim x As Long
'  Dim y As Long
'  Dim dis As Long
'
'  With rob(n)
'  x = rob(n).pos.x
'  y = rob(n).pos.y
'  End With
'
'  dissquared = realfield * realfield
'  'check out all the robots to the right
'
'  counter = 0 ' rob(n).order + 1
'  robnumber = Roborder(counter)
'  If robnumber <> -1 Then
'    dx = rob(robnumber).pos.x - x
'    If dx < 0 Then dx = -dx
'  Else
'    dx = field + 1
'  End If
'
'  While robnumber <> -1
'  'While dx < field
'    dy = rob(robnumber).pos.y - y
'    If dy < 0 Then dy = -dy
'
'    If dy < realfield Then
'      dis = dy * dy + dx * dx
'      If dis < dissquared Then target n, robnumber, dis
'    End If
'
'    counter = counter + 1
'    robnumber = Roborder(counter)
'    If robnumber = -1 Then
'      dx = field + 1
'    Else
'      dx = x - rob(robnumber).pos.x
'      If dx < 0 Then dx = -dx
'    End If
'  Wend
'End Sub
'
'
'' start of the viewing process
'' takes robots far at most "field" from nd (a pointer to a
'' robot in the linked list) and passes them
'' to the viewing procedure
'Public Sub proximity(ByRef nd As node, field As Long) 'byref for speed
''current largest field size is 12 * Robsize, which is = 1440
'  Dim n As Integer
'  Dim x As Long
'  Dim y As Long
'  Dim t As Integer
'  Dim dis As Long
'  Dim counter As Integer
'  Dim robnumber As Integer
'  Dim leftfield As Long
'  Dim rightfield As Long
'  Dim anglestuff As Single
'  Dim tempcos As Single
'  Dim tempsin As Single
'
'  Dim dx As Long
'  Dim dy As Long
'  Dim aim As Single
'
'  n = nd.robn
'
'  With rob(n)
'    For t = EyeStart To EyeEnd
'      .mem(t) = 0
'    Next t
'    x = .pos.x
'    y = .pos.y
'    aim = .aim
'  End With
'
'  If aim >= 5.498 Or aim <= 0.785 Then
'    Checkright field, n, field
'    Exit Sub
'  End If
'
'  If aim >= 2.356 And aim <= 3.927 Then
'    Checkleft field, n, field
'    Exit Sub
'  End If
'
'  'check both,
'  'but only for dx is within (leftfield, rightfield)
'
'  'figure out what x distances we need to test
'  tempcos = rob(n).aimvector.x
'  tempsin = rob(n).aimvector.y
'
'  If field = 1440 Then
'    rightfield = 1018
'  Else
'    rightfield = field * 0.707107
'  End If
'  anglestuff = tempcos - tempsin
'  leftfield = rightfield * anglestuff
'  anglestuff = tempcos + tempsin
'  rightfield = rightfield * anglestuff
'
'  If aim > 0.785398 And aim < 2.356195 Then
'    Checkleft -leftfield, n, field
'    Checkright rightfield, n, field
'    Exit Sub
'  End If
'
'  If aim > 3.926991 And aim < 5.497787 Then
'    Checkleft -rightfield, n, field
'    Checkright leftfield, n, field
'    Exit Sub
'  End If
'End Sub
'
'' calculates projection of robot t in n's eye
'' then calls cells to actually
'' write it in the eye cells
'Public Sub target(n As Integer, t As Integer, dis As Long)
'  Dim dx As Long
'  Dim dy As Long
'  Dim an As Single
'  Dim m As Integer
'  Dim dan As Long
'  Dim aim As Single
'  Dim answer As Long
'  m = -20
'  dan = 0
'  aim = rob(n).aim
'
'  If rob(t).Exist And dis > 1 Then
'    dx = rob(t).pos.x - rob(n).pos.x
'    dy = -(rob(t).pos.y - rob(n).pos.y)
'    If dx = 0 Then
'      an = PI / 2 * Sgn(dy)
'    Else
'      an = Atn(dy / dx)
'    End If
'
'    If dx < 0 Then
'      an = an + PI
'    Else
'      If an < 0 Then an = 2 * PI + an
'    End If
'
'    If (an > (3 * PI) / 4 And aim < PI / 2) Then
'      an = -(2 * PI - an)
'    End If
'
'    If (aim > (3 * PI) / 4 And an < PI / 2) Then
'      aim = -(2 * PI - aim)
'    End If
'
'    'finds square root
'    answer = 320 + dis / 1280
'    answer = 0.5 * (answer + dis / answer)
'    dis = 0.5 * (answer + dis / answer)
'
'    If Abs(an - aim) < (0.5 + RobSize / dis) Then
'      m = (aim - an) * 5 'originally *10.
'      'changing to 5 gives a wider field of vision
'      '45 degrees each way instead of 26 degrees
'      cells n, t, m, 1 / dis
'    End If
'  End If
'End Sub

'' writes down projections (taking care of not deleting
'' nearer objects)
'Public Function cells(nr As Integer, opp As Integer, n As Integer, invdist As Single) As Integer
''n is offset from eye5
''dis = distance, used for eye value to actually write.
''nr is the robot to write to
''opp is used to tell bot nr which bot is in it's eye5
'
'  Dim jj As Integer
'  Dim EyeValue As Integer
'  Dim t As Integer
'  Dim L As Integer
'
'  cells = -1
'  'L = 300 / dis
'  L = 300# * invdist
'  If n <= -20 Then Exit Function
'
'  If L > 5 Then L = 5
'  EyeValue = (RobSize * invdist) * 100
'  For t = -L To L
'    If Abs(n + t) < 5 Then
'      jj = n + t + EyeStart + 5
'      If rob(nr).mem(jj) < EyeValue Then
'        rob(nr).mem(jj) = EyeValue
'        If jj = EyeStart + 5 Then rob(nr).lastopp = opp
'      End If
'    End If
'  Next t
'End Function
