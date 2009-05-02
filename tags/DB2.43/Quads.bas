Attribute VB_Name = "Buckets_Module"
Option Explicit
'Buckets is what we're calling the quad tree that isn't a tree
'The boxes are unsorted
'maybe we should sort them?
'either by x pos or by index value

'Buckets take less than 200 KB of Ram

Public Const BucketSize As Integer = RobSize * 6
Dim TanLookup(4) As Single

'below is max size divided into BucketSize by BucketSize boxes
Public Buckets(134, 100) As BucketType

Public Type BucketType
  arr() As Integer
  size As Integer 'highest array element with a bot
End Type

'also erases array elements to retrieve memory
Public Sub Init_Buckets()
  Dim a As Integer: Dim b As Integer

  For a = 0 To 134
    For b = 0 To 100
      ReDim Buckets(a, b).arr(0)
      Buckets(a, b).size = 0
    Next b
  Next a

  If TanLookup(0) = 0 Then
    TanLookup(0) = 0.0874886635
    TanLookup(1) = 0.2679491924
    TanLookup(2) = 0.4663096582
    TanLookup(3) = 0.7002075382
    TanLookup(4) = 1#
  End If
  
  For a = 1 To MaxRobs
    If rob(a).exist Then
      'UpdateBotBucket a
    End If
  Next a
End Sub

Public Sub UpdateBotBucket(n As Integer)
  'makes calls to Add_Bot and Delete_Bot
  'if we move out of our bucket
  'call this from outside the function
  
  Dim currbucket As Single, newbucket As vector, changed As Boolean
  With rob(n)
  
  newbucket = .BucketPos
  currbucket = Int(.pos.X / BucketSize)
  
  If .BucketPos.X <> currbucket Then
    'we've moved off the bucket, update bucket
    .BucketPos.X = currbucket
    newbucket.X = currbucket
    changed = True
  End If
  
  currbucket = Int(.pos.Y / BucketSize)
  
  If .BucketPos.Y <> currbucket Then
    .BucketPos.Y = currbucket
    newbucket.Y = currbucket
    changed = True
  End If
  
  If changed Then
    Delete_Bot n, .BucketPos
    Add_Bot n, newbucket
  End If
  
  If rob(n).exist = False Then Delete_Bot n, .BucketPos
  
  End With
End Sub

Public Sub Add_Bot(n As Integer, pos As vector)
  Dim a As Integer

  If pos.X < 0 Or pos.Y < 0 Or _
    pos.X * BucketSize > SimOpts.FieldWidth Or _
    pos.Y * BucketSize > SimOpts.FieldHeight Then
    Exit Sub
  End If
    
  With Buckets(pos.X, pos.Y)

    For a = 0 To .size
      If .arr(a) = -1 Then
        .arr(a) = n
        Exit Sub
      End If
    Next a

    'we have to add it to the end somewhere
    If UBound(.arr()) <= .size Then ReDim Preserve .arr(.size + 5) 'faster to redim 5 at a time
    .size = .size + 1
    .arr(.size) = n
  End With
End Sub

Public Sub Delete_Bot(n As Integer, pos As vector)
  Dim a As Integer, b As Integer
  
  If pos.X < 0 Or pos.Y < 0 Or _
    pos.X * BucketSize > SimOpts.FieldWidth Or _
    pos.Y * BucketSize > SimOpts.FieldHeight Then
    Exit Sub
  End If
  
  With Buckets(pos.X, pos.Y)

    For a = 0 To .size
      If .arr(a) = n Then 'we've found the bot
        .arr(a) = -1 'delete the bot
        If .size = a Then 'last bot in array, collapse array
          a = 0
          For b = 0 To .size
            If .arr(b) <> -1 Then a = b
          Next b
          .size = a 'a is now the last actual array element
          If .size = 0 Then ReDim .arr(0)
        End If
        Exit Sub
      End If
    Next a
  End With
End Sub

Public Sub BucketsProximity(n As Integer, Optional ByVal field As Integer = 12)
  'mirror of proximity function
  'remember to not call this if n is a veggy (ie: .view = false)
  Dim X As Long, Y As Long
  Dim BucketPos As vector

  BucketPos = rob(n).BucketPos
  For X = EyeStart To EyeEnd
    rob(n).mem(X) = 0
  Next X
  
  For X = rob(n).BucketPos.X - 2 To rob(n).BucketPos.X + 2
    BucketPos.X = X
    For Y = rob(n).BucketPos.Y - 2 To rob(n).BucketPos.Y + 2
      BucketPos.Y = Y
      CheckBot2Bucket n, BucketPos, field
    Next Y
  Next X
End Sub

Private Sub CheckBot2Bucket(n As Integer, pos As vector, field As Integer)
  Dim a As Integer, robnumber As Integer
  
  If pos.X < 0 Or pos.Y < 0 Or _
    pos.X * BucketSize > SimOpts.FieldWidth Or _
    pos.Y * BucketSize > SimOpts.FieldHeight Then
    Exit Sub
  End If
  
  With Buckets(pos.X, pos.Y)
  
  For a = 0 To .size
    robnumber = .arr(a)
    If robnumber > -1 And robnumber <> n Then
      If rob(robnumber).exist Then
        CompareRobots3 n, robnumber, field
      End If
    End If
  Next a
  End With
End Sub

Public Function AnyShapeBlocksBot(n1 As Integer, N2 As Integer) As Boolean
Dim i As Integer
  
  AnyShapeBlocksBot = False
  
  For i = 1 To numObstacles
    If Obstacles.Obstacles(i).exist Then
      If ShapeBlocksBot(n1, N2, i) Then
        AnyShapeBlocksBot = True
        Exit Function
      End If
    End If
  Next i
  
End Function

Public Function ShapeBlocksBot(n1 As Integer, N2 As Integer, o As Integer) As Boolean
Dim D1(4) As vector
Dim P(4) As vector
Dim P0 As vector
Dim D0 As vector
Dim delta As vector
Dim i As Integer
Dim s As Single
Dim t As Single
Dim useS As Boolean
Dim useT As Boolean
Dim numerator As Single

  ShapeBlocksBot = False
  
  'Cheap weed out check
  If (Obstacles.Obstacles(o).pos.X > Max(rob(n1).pos.X, rob(N2).pos.X)) Or _
     (Obstacles.Obstacles(o).pos.X + Obstacles.Obstacles(o).Width < Min(rob(n1).pos.X, rob(N2).pos.X)) Or _
     (Obstacles.Obstacles(o).pos.Y > Max(rob(n1).pos.Y, rob(N2).pos.Y)) Or _
     (Obstacles.Obstacles(o).pos.Y + Obstacles.Obstacles(o).Height < Min(rob(n1).pos.Y, rob(N2).pos.Y)) Then Exit Function
  
  D1(1) = VectorSet(0, Obstacles.Obstacles(o).Width) ' top
  D1(2) = VectorSet(Obstacles.Obstacles(o).Height, 0) ' left side
  D1(3) = D1(1) ' bottom
  D1(4) = D1(2) ' right side
  
  P(1) = Obstacles.Obstacles(o).pos
  P(2) = P(1)
  P(3) = VectorAdd(P(1), D1(2))
  P(4) = VectorAdd(P(1), D1(1))
  
  P0 = rob(n1).pos
  D0 = VectorSub(rob(N2).pos, rob(n1).pos)
  For i = 1 To 4
    numerator = Cross(D0, D1(i))
    If numerator <> 0 Then
      delta = VectorSub(P(i), P0)
      s = Cross(delta, D1(i)) / numerator
      t = Cross(delta, D0) / numerator
    
      useT = False
      useS = False
  
      If t >= 0 And t <= 1 Then useT = True
      If s >= 0 And s <= 1 Then useS = True
      
      If useT Or useS Then
        ShapeBlocksBot = True
        Exit Function
      End If
   
    End If
  Next i
End Function
''New compare routine from Nums added for 2.42.3
'Public Sub CompareRobots2(n1 As Integer, N2 As Integer, field As Integer)
'      Dim ab As vector, ac As vector, ad As vector 'vector from n1 to n2
'      Dim invdist As Single, discheck As Single
'      Dim eyecellC As Integer, eyecellD As Integer
'      Dim a As Integer
'      Dim eyevalue As Single
'
'      ab = VectorSub(rob(N2).pos, rob(n1).pos)
'      invdist = VectorMagnitudeSquare(ab)
'      discheck = field * RobSize + rob(N2).radius
'      discheck = discheck * discheck
'
'      'check distance
'      If discheck < invdist Then Exit Sub
'
'      If Not shapesAreSeeThrough Then
'        If AnyShapeBlocksBot(n1, N2) Then Exit Sub
'      End If
'
'      invdist = VectorInvMagnitude(ab)
'
'      'ac and ad are to either end of the bots, while ab is to the center
'
'      ac = VectorScalar(ab, invdist)
'      'ac is now unit vector
'
'      ad = VectorSet(ac.Y, -ac.X)
'      ad = VectorScalar(ad, rob(N2).radius)
'      ad = VectorAdd(ab, ad)
'
'      ac = VectorSet(-ac.Y, ac.X)
'      ac = VectorScalar(ac, rob(N2).radius)
'      ac = VectorAdd(ab, ac)
'
'
'      eyecellD = EyeCells(n1, ad)
'      eyecellC = EyeCells(n1, ac)
'
'      If eyecellC = 0 And eyecellD = 0 Then Exit Sub
'
'      If eyecellC = 0 Then eyecellC = EyeStart + 9
'      If eyecellD = 0 Then eyecellD = EyeStart + 1
'
'    eyevalue = RobSize * 100 / (RobSize - rob(n1).radius - rob(N2).radius + 1 / invdist)
'    If eyevalue > 32000 Then eyevalue = 32000
'
'    For a = eyecellD To eyecellC
'        If rob(n1).mem(a) < eyevalue Then
'          If a = EyeStart + Abs(rob(n1).mem(FOCUSEYE) + 4) Mod 9 + 1 Then
'            rob(n1).lastopp = N2
'            rob(n1).mem(EYEF) = eyevalue
'          End If
'          rob(n1).mem(a) = eyevalue
'        End If
'      Next a
'    End Sub

'New compare routine from EricL
'Takes into consideration movable eyes
Public Sub CompareRobots3(n1 As Integer, N2 As Integer, field As Integer)
      Dim ab As vector, ac As vector, ad As vector 'vector from n1 to n2
      Dim invdist As Single, discheck As Single
      Dim a As Integer
      Dim eyevalue As Single
      Dim eyeaim As Single
      Dim eyeaimleft As Single
      Dim eyeaimright As Single
      Dim beta As Single
      Dim theta As Single
      Dim halfeyewidth As Single
      Dim botspanszero As Boolean
      Dim eyespanszero As Boolean
             
      ab = VectorSub(rob(N2).pos, rob(n1).pos)
      invdist = VectorMagnitudeSquare(ab)
      discheck = field * RobSize + rob(N2).radius
      discheck = discheck * discheck
      
      'check distance
      If discheck < invdist Then Exit Sub
      
      'If Shapes are see through, then there is no reason to check if a shape blocks a bot
      If Not SimOpts.shapesAreSeeThrough Then
        If AnyShapeBlocksBot(n1, N2) Then Exit Sub
      End If
      
      invdist = VectorInvMagnitude(ab)
        
      'ac and ad are to either end of the bots, while ab is to the center
      
      ac = VectorScalar(ab, invdist)
      'ac is now unit vector
      
      ad = VectorSet(ac.Y, -ac.X)
      ad = VectorScalar(ad, rob(N2).radius)
      ad = VectorAdd(ab, ad)
      
      ac = VectorSet(-ac.Y, ac.X)
      ac = VectorScalar(ac, rob(N2).radius)
      ac = VectorAdd(ab, ac)
      
      eyevalue = RobSize * 100 / (RobSize - rob(n1).radius - rob(N2).radius + 1 / invdist)
      If eyevalue > 32000 Then eyevalue = 32000
      
      'Coordinates are in the 4th quadrant, so make the y values negative so the math works
      ad.Y = -ad.Y
      ac.Y = -ac.Y
      
      ' theta is the angle to the left edge of the viewed bot
      ' beta is the andgle to the right edge of the viewed bot
      
      If ad.X = 0 Then ' Divide by zero protection
        If ad.Y > 0 Then
          theta = PI / 2 ' left edge of viewed bot is at 90 degrees
        Else
          theta = 3 * PI / 2 ' left edge of viewed bot is at 270 degrees
        End If
      Else
        If ad.X > 0 Then
          theta = Atn(ad.Y / ad.X)
        Else
          theta = Atn(ad.Y / ad.X) + PI
        End If
      End If
      
      If ac.X = 0 Then
        If ac.Y > 0 Then
          beta = PI / 2
        Else
          beta = 3 * PI / 2
        End If
      Else
        If ac.X > 0 Then
          beta = Atn(ac.Y / ac.X)
        Else
          beta = Atn(ac.Y / ac.X) + PI
        End If
      End If
      
      'lets be sure to just deal with postive angles
      If theta < 0 Then theta = theta + 2 * PI
      If beta < 0 Then beta = beta + 2 * PI
      
      If beta > theta Then
        botspanszero = True
      Else
        botspanszero = False
      End If
      
      'For each eye
      For a = 0 To 8
        'Check to see if the bot is viewable in this eye
        'First, figure out the direction in radians in which the eye is pointed relative to .aim
        'We have to mod the value and divide by 200 to get radians
        'then since the eyedir values are offsets from their defaults, eye 1 is off from .aim by 4 eye field widths,
        'three for eye2, and so on.
        eyeaim = (rob(n1).mem(EYE1DIR + a) Mod 1256) / 200 - ((PI / 18) * a) + (PI / 18) * 4 + rob(n1).aim
        
        'It's possible we wrapped 0 so check
        While eyeaim > 2 * PI: eyeaim = eyeaim - 2 * PI: Wend
        While eyeaim < 0: eyeaim = eyeaim + 2 * PI: Wend
        
        'These are the left and right sides of the field of view for the eye
        halfeyewidth = ((rob(n1).mem(EYE1WIDTH + a)) Mod 1256) / 400
        While halfeyewidth > PI - PI / 36: halfeyewidth = halfeyewidth - PI: Wend
        While halfeyewidth < -PI / 36: halfeyewidth = halfeyewidth + PI: Wend
        eyeaimleft = eyeaim + halfeyewidth + PI / 36
        eyeaimright = eyeaim - halfeyewidth - PI / 36
        
        'Check the case where the eye field of view spans 0
        If eyeaimright < 0 Then eyeaimright = 2 * PI + eyeaimright
        If eyeaimleft > 2 * PI Then eyeaimleft = eyeaimleft - 2 * PI
         If eyeaimleft < eyeaimright Then
           eyespanszero = True
         Else
           eyespanszero = False
         End If
            
               
          ' Bot is visiable if either left edge is in eye or right edge is in eye or whole bot spans eye
          'If leftside of bot is in eye or
          '   rightside of bot is in eye or
          '   bot spans eye
          If ((eyeaimleft) >= (theta)) And ((theta) >= (eyeaimright)) And Not eyespanszero Or _
             ((eyeaimleft) >= (theta)) And eyespanszero Or _
             ((eyeaimright) <= (theta)) And eyespanszero Or _
             ((eyeaimleft) >= (beta)) And ((beta) >= (eyeaimright)) And Not eyespanszero Or _
             ((eyeaimleft) >= (beta)) And eyespanszero Or _
             ((eyeaimright) <= (beta)) And eyespanszero Or _
             ((eyeaimleft) <= (theta)) And ((beta) <= (eyeaimright)) And Not eyespanszero And Not botspanszero Or _
             ((eyeaimleft) <= (theta)) And Not eyespanszero And botspanszero Or _
             ((eyeaimright) >= (beta)) And Not eyespanszero And botspanszero Or _
             ((eyeaimleft) <= (theta)) And (eyeaimright >= beta) And eyespanszero And botspanszero Then
            'The bot is viewable in this eye.
            'Check to see if it is closer than other bots we may have seen
            If rob(n1).mem(EyeStart + 1 + a) < eyevalue Then
              'It is closer than other bots we may have seen.
              'Check to see if this eye has the focus
              If a = Abs(rob(n1).mem(FOCUSEYE) + 4) Mod 9 Then
                'This eye does have the focus
                'Set the EYEF value and also lastopp so the lookoccur list will get populated later
                rob(n1).lastopp = N2
                rob(n1).mem(EYEF) = eyevalue
              End If
              'Set the distance for the eye
              rob(n1).mem(EyeStart + 1 + a) = eyevalue
            End If
          End If
      '  End If
      Next a
    End Sub

'Shape compare routine from EricL
'Checks to see if any shapes are visable to bot n
'Only gets called if shapes are visable
'Bug bug - needs to be improved to deal with wide eye fields of view where the closest point is not one of the eye edges.
Public Sub CompareShapes(n As Integer, field As Integer)
Dim D1(4) As vector
Dim P(4) As vector
Dim P0 As vector
Dim D0 As vector
Dim i As Integer
Dim a As Integer
Dim o As Integer
Dim s As Single
Dim t As Single
Dim eyevalue As Single
Dim eyeaim As Single
Dim eyeaimleft As Single
Dim eyeaimright As Single
Dim eyeaimleftvector As vector
Dim eyeaimrightvector As vector
Dim beta As Single
Dim theta As Single
Dim halfeyewidth As Single
Dim botspanszero As Boolean
Dim eyespanszero As Boolean
Dim botLocation As Integer
Dim nearestCorner As vector
Dim sightDist As Single
Dim distleft As Single
Dim distright As Single
Dim dist As Single
Dim lowestDist As Single

  sightDist = field * RobSize + rob(n).radius

  For o = 1 To numObstacles
  If Obstacles.Obstacles(o).exist Then
  
    'Cheap weed out check - check to see if shape is too far away to be seen
    If (Obstacles.Obstacles(o).pos.X > rob(n).pos.X + sightDist) Or _
       (Obstacles.Obstacles(o).pos.X + Obstacles.Obstacles(o).Width < rob(n).pos.X - sightDist) Or _
       (Obstacles.Obstacles(o).pos.Y > rob(n).pos.Y + sightDist) Or _
       (Obstacles.Obstacles(o).pos.Y + Obstacles.Obstacles(o).Height < rob(n).pos.Y - sightDist) Then
       'Do nothing.  Shape is too far away.  Move on to next shape.
    ElseIf (Obstacles.Obstacles(o).pos.X < rob(n).pos.X) And _
       (Obstacles.Obstacles(o).pos.X + Obstacles.Obstacles(o).Width > rob(n).pos.X) And _
       (Obstacles.Obstacles(o).pos.Y < rob(n).pos.Y) And _
       (Obstacles.Obstacles(o).pos.Y + Obstacles.Obstacles(o).Height > rob(n).pos.Y) Then
       'Bot is inside shape!
       For i = 0 To 8
         rob(n).mem(EyeStart + 1 + a) = 100
       Next i
       rob(n).lastopp = o
       rob(n).lastopptype = 1
       Exit Sub
    Else
      'Guess we have to actually do the hard work and check...
      
      'Here are the four sides of the shape
      D1(1) = VectorSet(Obstacles.Obstacles(o).Width, 0) ' top
      D1(2) = VectorSet(0, Obstacles.Obstacles(o).Height) ' left side
      D1(3) = D1(1) ' bottom
      D1(4) = D1(2) ' right side

      'Here are the four corners
      P(1) = Obstacles.Obstacles(o).pos ' NW corner
      P(2) = P(1): P(2).Y = P(1).Y + Obstacles.Obstacles(o).Height ' SW Corner
      P(3) = VectorAdd(P(1), D1(1)) ' NE Corner
      P(4) = VectorAdd(P(2), D1(1)) ' SE Corner
       
      'Here is the bot.
      P0 = rob(n).pos
            
      'Bots can be in one of eight possible locations relative to a shape.
      ' 1 North - Center is above top edge
      ' 2 East - Center is to right of right edge
      ' 3 South - Center is below bottom edge
      ' 4 West - Center is left of left edge
      ' 5 NE - Center is North of top and East of right edge
      ' 6 SE - Center is South of bottom and East of right edge
      ' 7 SW - Center is South of bottom and West of left edge
      ' 8 NW - Center is North or top and West of left edge
      ' We first need to figure out which the bot is in.
      
      If P0.X < P(1).X Then 'Must be NW, W or SW
        botLocation = 4 ' Set to West for default
        If P0.Y < P(1).Y Then
          botLocation = 8  ' Must be NW
          nearestCorner = P(1)
        ElseIf P0.Y > P(2).Y Then
          botLocation = 7  ' Must be SW
          nearestCorner = P(2)
        End If
      ElseIf P0.X > P(3).X Then ' Must be NE, E or SE
        botLocation = 2 ' Set to East for default
        If P0.Y < P(1).Y Then
          botLocation = 5  ' Must be NE
          nearestCorner = P(3)
        ElseIf P0.Y > P(2).Y Then
          botLocation = 6  ' Must be SE
          nearestCorner = P(4)
        End If
      ElseIf P0.Y < P(1).Y Then
        botLocation = 1 ' Must be North
      Else
        botLocation = 3 ' Must be South
      End If
      
      'If the bot is off one of the corners, we have to check two shape edges.
      'If it is off one of the sides, then we only have to check one.
      
      
      'For each eye
      For a = 0 To 8
        'Check to see if the side is viewable in this eye
        'First, figure out the direction in radians in which the eye is pointed relative to .aim
        'We have to mod the value and divide by 200 to get radians
        'then since the eyedir values are offsets from their defaults, eye 1 is off from .aim by 4 eye field widths,
        'three for eye2, and so on.
        eyeaim = (rob(n).mem(EYE1DIR + a) Mod 1256) / 200 - ((PI / 18) * a) + (PI / 18) * 4 + rob(n).aim
        
        'It's possible we wrapped 0 so check
        While eyeaim > 2 * PI: eyeaim = eyeaim - 2 * PI: Wend
        While eyeaim < 0: eyeaim = eyeaim + 2 * PI: Wend
        
        'These are the left and right sides of the field of view for the eye
        halfeyewidth = ((rob(n).mem(EYE1WIDTH + a)) Mod 1256) / 400
        While halfeyewidth > PI - PI / 36: halfeyewidth = halfeyewidth - PI: Wend
        While halfeyewidth < -PI / 36: halfeyewidth = halfeyewidth + PI: Wend
        eyeaimleft = eyeaim + halfeyewidth + PI / 36
        eyeaimright = eyeaim - halfeyewidth - PI / 36
        
        'Check the case where the eye field of view spans 0
        If eyeaimright < 0 Then eyeaimright = 2 * PI + eyeaimright
        If eyeaimleft > 2 * PI Then eyeaimleft = eyeaimleft - 2 * PI
        If eyeaimleft < eyeaimright Then
          eyespanszero = True
        Else
          eyespanszero = False
        End If
        
        'Now we have the two sides of the eye.  We need to figure out if and where they intersect the shape.
        
        'Change the angles to vectors and scale them by the sight distance
        eyeaimleftvector = VectorSet(Cos(eyeaimleft), Sin(eyeaimleft))
        eyeaimleftvector = VectorScalar(VectorUnit(eyeaimleftvector), sightDist)
        eyeaimrightvector = VectorSet(Cos(eyeaimright), Sin(eyeaimright))
        eyeaimrightvector = VectorScalar(VectorUnit(eyeaimrightvector), sightDist)
        
        eyeaimleftvector.Y = -eyeaimleftvector.Y
        eyeaimrightvector.Y = -eyeaimrightvector.Y
                
        distleft = 0
        distright = 0
        dist = 0
        lowestDist = 32000 ' set to something impossibly big
        
        If (botLocation = 1) Or (botLocation = 5) Or (botLocation = 8) Then
          ' North - Bot is above shape, might be able to see top of shape
            s = SegmentSegmentIntersect(P0, eyeaimleftvector, P(1), D1(1))   'Check intersection of left eye range and shape side
            If s > 0 Then distleft = s * VectorMagnitude(eyeaimleftvector)   'If the left eye range intersects then store the distance of the interesction
            t = SegmentSegmentIntersect(P0, eyeaimrightvector, P(1), D1(1))  'Check intersection of right eye range and shape side
            If t > 0 Then distright = t * VectorMagnitude(eyeaimrightvector) 'If the right eye range intersects, then store the distance of the intersection
            If distleft > 0 And distright > 0 Then                           'bot eye sides intersect.  Pick the closest one.
              dist = Min(distleft, distright)
            ElseIf distleft > 0 Then dist = distleft                         'Only left side intersects
            ElseIf distright > 0 Then dist = distright                       'Only right side intersects
            End If
            If (dist > 0) And (dist < lowestDist) Then lowestDist = dist
        End If
            
        If (botLocation = 2) Or (botLocation = 5) Or (botLocation = 6) Then
         ' East = Bot to right of shape, might be abel to see right side
            s = SegmentSegmentIntersect(P0, eyeaimleftvector, P(3), D1(4))   'Check intersection of left eye range and shape side
            If s > 0 Then distleft = s * VectorMagnitude(eyeaimleftvector)   'If the left eye range intersects then store the distance of the interesction
            t = SegmentSegmentIntersect(P0, eyeaimrightvector, P(3), D1(4))  'Check intersection of right eye range and shape side
            If t > 0 Then distright = t * VectorMagnitude(eyeaimrightvector) 'If the right eye range intersects, then store the distance of the intersection
            If distleft > 0 And distright > 0 Then                           'bot eye sides intersect.  Pick the closest one.
              dist = Min(distleft, distright)
            ElseIf distleft > 0 Then dist = distleft                         'Only left side intersects
            ElseIf distright > 0 Then dist = distright                       'Only right side intersects
            End If
            If (dist > 0) And (dist < lowestDist) Then lowestDist = dist
        End If
          
        If (botLocation = 3) Or (botLocation = 6) Or (botLocation = 7) Then
         ' South - Bot is below shape
            s = SegmentSegmentIntersect(P0, eyeaimleftvector, P(2), D1(3))   'Check intersection of left eye range and shape side
            If s > 0 Then distleft = s * VectorMagnitude(eyeaimleftvector)   'If the left eye range intersects then store the distance of the interesction
            t = SegmentSegmentIntersect(P0, eyeaimrightvector, P(2), D1(3))  'Check intersection of right eye range and shape side
            If t > 0 Then distright = t * VectorMagnitude(eyeaimrightvector) 'If the right eye range intersects, then store the distance of the intersection
            If distleft > 0 And distright > 0 Then                           'bot eye sides intersect.  Pick the closest one.
              dist = Min(distleft, distright)
            ElseIf distleft > 0 Then dist = distleft                         'Only left side intersects
            ElseIf distright > 0 Then dist = distright                       'Only right side intersects
            End If
            If (dist > 0) And (dist < lowestDist) Then lowestDist = dist
        End If
      
        If (botLocation = 4) Or (botLocation = 7) Or (botLocation = 8) Then
          ' West - Bot is to left of shape
            s = SegmentSegmentIntersect(P0, eyeaimleftvector, P(1), D1(2))   'Check intersection of left eye range and shape side
            If s > 0 Then distleft = s * VectorMagnitude(eyeaimleftvector)   'If the left eye range intersects then store the distance of the interesction
            t = SegmentSegmentIntersect(P0, eyeaimrightvector, P(1), D1(2))  'Check intersection of right eye range and shape side
            If t > 0 Then distright = t * VectorMagnitude(eyeaimrightvector) 'If the right eye range intersects, then store the distance of the intersection
            If distleft > 0 And distright > 0 Then                           'bot eye sides intersect.  Pick the closest one.
              dist = Min(distleft, distright)
            ElseIf distleft > 0 Then dist = distleft                         'Only left side intersects
            ElseIf distright > 0 Then dist = distright                       'Only right side intersects
            End If
            If (dist > 0) And (dist < lowestDist) Then lowestDist = dist
        End If
        
        'Need to check here for parts of the shape that may be in the eye and closer than either side of the eye width.
        'The majro case here is a corner with a wide eye field.
                
        If lowestDist < 32000 Then
          eyevalue = RobSize * 100 / (RobSize - rob(n).radius + lowestDist)
          If eyevalue > 32000 Then eyevalue = 32000
                     
          If rob(n).mem(EyeStart + 1 + a) < eyevalue Then
            'It is closer than other bots we may have seen.
            'Check to see if this eye has the focus
            If a = Abs(rob(n).mem(FOCUSEYE) + 4) Mod 9 Then
              'This eye does have the focus
              'Set the EYEF value and also lastopp so the lookoccur list will get populated later
              rob(n).lastopp = o
              rob(n).lastopptype = 1
              rob(n).mem(EYEF) = eyevalue
            End If
            'Set the distance for the eye
            rob(n).mem(EyeStart + 1 + a) = eyevalue
          End If
        End If
      Next a
     
    End If
  End If
  Next o

End Sub

'Returns the percent along vector P0 + sDO where it interects vector P1 + tD1.
'Returns 0 if there is no interestion
Public Function SegmentSegmentIntersect(P0 As vector, D0 As vector, P1 As vector, D1 As vector) As Single
Dim dotPerp As Single
Dim delta As vector
Dim s As Single
Dim t As Single

  SegmentSegmentIntersect = 0
  dotPerp = D0.X * D1.Y - D1.X * D0.Y ' Test for intersection
        
  If dotPerp <> 0 Then
    delta = VectorSub(P1, P0)
    s = Dot(delta, VectorSet(D1.Y, -D1.X)) / dotPerp
    t = Dot(delta, VectorSet(D0.Y, -D0.X)) / dotPerp
    If s >= 0 And s <= 1 And t >= 0 And t <= 1 Then SegmentSegmentIntersect = s
  End If
        
End Function


'Public Sub CompareRobots(n1 As Integer, N2 As Integer, field As Integer)
' Dim ab As vector, ac As vector, ad As vector 'vector from n1 to n2
' Dim invdist As Single, discheck As Single
' Dim eyecellC As Integer, eyecellD As Integer
' Dim a As Integer
'
' ab = VectorSub(rob(N2).pos, rob(n1).pos)
' invdist = VectorMagnitudeSquare(ab)
' discheck = field * RobSize + rob(N2).radius
' discheck = discheck * discheck
'
' 'check distance
' If discheck < invdist Then Exit Sub
' invdist = VectorInvMagnitude(ab)
' 'ac and ad are to either end of the bots, while ab is to the center
'
' ac = VectorScalar(ab, invdist)
' 'ac is now unit vector
'
' ad = VectorSet(ac.Y, -ac.X)
' ad = VectorScalar(ad, rob(N2).radius)
' ad = VectorAdd(ab, ad)
'
' ac = VectorSet(-ac.Y, ac.X)
' ac = VectorScalar(ac, rob(N2).radius)
' ac = VectorAdd(ab, ac)
'
' eyecellD = EyeCells(n1, ad)
' eyecellC = EyeCells(n1, ac)
'
' If eyecellC = 0 And eyecellD = 0 Then Exit Sub
'
' If eyecellC = 0 Then eyecellC = EyeStart + 9
' If eyecellD = 0 Then eyecellD = EyeStart + 1
'
' For a = eyecellD To eyecellC
'   If rob(n1).mem(a) < (RobSize * 100 * invdist) Then
'     Dim eyevalue As Long
'     If a = EyeStart + 5 Then
'       rob(n1).lastopp = N2
'     End If
'     eyevalue = (RobSize * 100 * invdist)
'     If eyevalue > 32000 Then eyevalue = 32000
'     rob(n1).mem(a) = eyevalue
'   End If
' Next a
'End Sub

'Returns the eye cell in which the point represented by the vestor ab taken from bot n's center is visable to bot n
'Private Function EyeCells(n As Integer, ab As vector) As Integer
'  Dim aimvector As vector
'  Dim tantheta As Single
'  Dim sign As Integer
'  Dim a As Integer
'
'  'because we're in the third quadrant (all computer screens work like that)
'  'we have to do the opposite of y
'  'believe me, this caused some wierd bugs until I figured it out
'  aimvector.X = rob(n).aimvector.X
'  aimvector.Y = -rob(n).aimvector.Y
'
'  'tantheta = Tan(rob(n1).aim - Atn(ab.Y / ab.X))
'  tantheta = Dot(ab, aimvector): If tantheta <= 0 Then Exit Function
'  tantheta = Cross(ab, aimvector) / tantheta
'
'  If tantheta > 0# Then
'    sign = 1
'  Else
'    sign = -1
'    tantheta = -tantheta
'  End If
'
'  If tantheta > 1# Then
'    Exit Function   'not visible
'  End If
'
'  'n2 visible to n1
'  For a = 0 To 4
'    If tantheta < TanLookup(a) Then 'we've found the right spot
'      EyeCells = EyeStart + 5 - sign * a
'      Exit Function
'    End If
'  Next a
'End Function


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Public Function BucketShotColl(n As Integer) As Integer
'  'doesn't check if the shot moved from bucket to bucket, which might cause problems
'  'we'll fix that later sometime
'
'  Dim ab As vector, ac As vector, bc As vector, bucket As vector
'  Dim MagAB As Single, a As Integer, robnumber As Integer
'  Dim PX As Single, PY As Single
'  Dim dist As Single
'
'  With Shots(n)
'  ab = VectorSub(.pos, .opos)
'  MagAB = VectorMagnitudeSquare(ab)
'
'  bucket = VectorSet(Int(.x / BucketSize), Int(.y / BucketSize))
'
'  If bucket.x < 0 Or bucket.y < 0 Or _
'    bucket.x * BucketSize > SimOpts.FieldWidth Or _
'    bucket.y * BucketSize > SimOpts.FieldHeight Then
'    Exit Function
'  End If
'
'  For a = 0 To Buckets(bucket.x, bucket.y).size
'    If Buckets(bucket.x, bucket.y).arr(a) > 0 Then
'      robnumber = Buckets(bucket.x, bucket.y).arr(a)
'      PX = rob(robnumber).pos.x
'      PY = rob(robnumber).pos.y
'
'      ac = VectorSet(PX - .ox, PY - .oy)
'      bc = VectorSet(PX - .x, PY - .y)
'
'      If Dot(ab, ac) > 0 Then
'        'if AB dot AC > 0 then nearest point is point B
'        dist = VectorMagnitudeSquare(bc)
'      ElseIf Dot(ab, bc) > 0 Then
'        'if AB dot BC > 0 then nearest point is point A
'        dist = VectorMagnitudeSquare(ac)
'      ElseIf MagAB > 0 Then
'        '(AB cross AC)  / ||AB|| = distance
'        'square both sides
'        dist = Cross(ab, ac) ^ 2 / MagAB
'      Else
'        dist = VectorMagnitudeSquare(ac)
'      End If
'
'      If dist <= rob(robnumber).radius * rob(robnumber).radius Then
'        If Shots(n).parent <> robnumber And rob(robnumber).Wall = False Then
'          BucketShotColl = robnumber
'          Exit Function
'        End If
'      End If
'
'    End If
'  Next a
'  End With
'End Function
