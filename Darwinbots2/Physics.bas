Attribute VB_Name = "Physics"
'
'                 P H Y S I C S
'

'Important

Option Explicit

' experimental object: used to store a grid of environmental
' features
Public envgridpres As Boolean
Public nlink As Single         ' links physics constants
Public plink As Single
Public klink As Single
Public mlink As Single

Public Const smudgefactor As Single = 50 'just to keep the bots more likely to stay visible

Dim boylabldisp As Boolean

Public Function NetForces(n As Integer)
  Dim mag As Single
  Dim sign As Integer
  Dim staticV As vector
    
  'The physics engine breaks apart if bot masses are less than about .1
  

    If Abs(rob(n).vel.X) < 0.0000001 Then rob(n).vel.X = 0#  'Prevents underflow errors down the line
    If Abs(rob(n).vel.Y) < 0.0000001 Then rob(n).vel.Y = 0#  'Prevents underflow erros down the line
    PlanetEaters n
    FrictionForces n
    SphereDragForces n
    TieDragForces n
    BrownianForces n
    'BouyancyForces n  BouyancyForces are no longer needed since boy is proportional to y gravity
    GravityForces n
    VoluntaryForces n
 
End Function

Public Sub CalcMass(n As Integer)
  With rob(n)
  .mass = (.body / 1000) + (.shell / 200) + (.chloroplasts / 32000) ^ 3 * 31680  'Panda 8/14/2013 set value for mass
  'If .mass < 0.1 Then .mass = 0.1 'stops the Euler integration from wigging out too badly.
  If .mass < 1 Then .mass = 1 'stops the Euler integration from wigging out too badly.
  If .mass > 32000 Then .mass = 32000
  
  End With
End Sub

Public Sub AddedMass(n As Integer)
  'added mass is a simple enough concept.
  'To move an object through a liquid, you must also move
  'that liquid out of the way.
  
  Const fourthirdspi As Single = 4.18879
  
  Const AddedMassCoefficientForASphere As Single = 0.5
  
  With rob(n)
    If SimOpts.Density = 0 Then
      .AddedMass = 0
    Else
      .AddedMass = AddedMassCoefficientForASphere * SimOpts.Density * fourthirdspi * .radius * .radius * .radius
    End If
  End With
End Sub

Public Sub FrictionForces(n As Integer)
  Dim Impulse As Single
  Dim mag As Single
  Dim ZGrav As Single
  
  With rob(n)
  
  If SimOpts.Zgravity = 0 Then GoTo getout
  
  If SimOpts.EGridEnabled Then
    'ZGrav = EGrid(FindEGridX(.pos), FindEGridY(.pos)).Zgravity
  Else
    ZGrav = SimOpts.Zgravity
  End If
  If .vel.X = 0 And .vel.Y = 0 Then 'is there a vector way to do this?
    .ImpulseStatic = CSng(.mass * ZGrav * SimOpts.CoefficientStatic) ' * 1 cycle (timestep = 1)
  Else
    Impulse = CSng(.mass * ZGrav * SimOpts.CoefficientKinetic) ' * 1 cycle (timestep = 1)
    If Impulse > VectorMagnitude(.vel) Then Impulse = VectorMagnitude(.vel) ' EricL 5/3/2006 Added to insure friction only counteracts
    
    If Impulse < 0.0000001 Then Impulse = 0 ' Prevents the accumulation of very very low velocity in sims without density
      
    'EricL 5/7/2006 Changed to operate directly on velocity
    .vel = VectorSub(.vel, VectorScalar(VectorUnit(.vel), Impulse)) 'kinetic friction points in opposite direction of velocity
  End If
  
  'Here we calculate the reduction in angular momentum due to friction
  'I'm sure there there is a better calculation
  If Abs(rob(n).ma) > 0 Then
    If Impulse < 1# Then
      rob(n).ma = rob(n).ma * (1# - Impulse)
    Else
      rob(n).ma = 0
    End If
    If Abs(rob(n).ma) < 0.0000001 Then rob(n).ma = 0
  End If
getout:
  End With
End Sub

Public Sub BrownianForces(n As Integer)
  If SimOpts.PhysBrown = 0 Then GoTo getout
  Dim Impulse As Single
  Dim RandomAngle As Single
 
    If SimOpts.EGridEnabled Then
      'Impulse = EGrid(FindEGridX(rob(n).pos), FindEGridY(rob(n).pos)).PhysBrown * 0.5 * Rnd
    Else
      Impulse = SimOpts.PhysBrown * 0.5 * Rnd
    End If
    
    RandomAngle = Rnd * 2 * PI
    rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, VectorSet(Cos(RandomAngle) * Impulse, Sin(RandomAngle) * Impulse))
    rob(n).ma = rob(n).ma + (Impulse / 100) * (Rnd - 0.5) ' turning motion due to brownian motion

getout:
End Sub

Public Sub SphereDragForces(n As Integer) 'for bots
  Dim Impulse As Single
  Dim ImpulseVector  As vector
  Dim mag As Single
  
  'No Drag if no velocity or no density
  If (rob(n).vel.X = 0 And rob(n).vel.Y = 0) Or SimOpts.Density = 0 Then GoTo getout
   
  'Here we calculate the reduction in angular momentum due to fluid density
  'I'm sure there there is a better calculation
  If Abs(rob(n).ma) > 0 Then
    If SimOpts.Density < 0.000001 Then
      rob(n).ma = rob(n).ma * (1# - (SimOpts.Density * 1000000))
    Else
      rob(n).ma = 0
    End If
    If Abs(rob(n).ma) < 0.0000001 Then rob(n).ma = 0
  End If
  
  mag = VectorMagnitude(rob(n).vel)
  
  If mag < 0.0000001 Then GoTo getout ' Prevents accumulation of really small velocities.
  
 
    
  Impulse = CSng(0.5 * SphereCd(mag, rob(n).radius) * _
    SimOpts.Density * mag * mag * (PI * rob(n).radius ^ 2))
   
  If Impulse > mag Then Impulse = mag * 0.99 ' Prevents the resistance force from exceeding the velocity!
  ImpulseVector = VectorScalar(VectorUnit(rob(n).vel), Impulse)
  'rob(n).ImpulseRes = VectorAdd(rob(n).ImpulseRes, ImpulseVector)
  rob(n).vel = VectorSub(rob(n).vel, ImpulseVector)
getout:
End Sub

Public Sub TieDragForces(n As Integer) 'for ties
'calculate drag on the ties as if the ties are cylinders
'radius of the tie should be stored in tie array
Dim a As Long

'EricL 5/26/2006 Added for Perf
If rob(n).numties = 0 Then GoTo getout

For a = 0 To MAXTIES
  If rob(n).Ties(a).pnt > 0 Then
    'If rob(n).Ties(a).pnt > n Then TieDrag2 n, rob(n).Ties(a).pnt
    TieDrag n, rob(n).Ties(a).pnt
  End If
Next a

getout:
End Sub

Public Sub TieDrag3(n1 As Integer, N2 As Integer)
  Dim pos As vector
  Dim a As Single, b As Single, c As Single
  Dim TorqueScalar
  
  pos = VectorSub(rob(N2).pos, rob(n1).pos)
  
  a = Cross(rob(n1).vel, pos)
  b = Cross(rob(N2).vel, pos)
  c = (a + b) * 0.5 * 0.0001
  
  'pretend Cd is always 1
  pos = VectorUnit(pos)
  pos = VectorSet(-pos.Y, pos.X)
  rob(n1).ImpulseRes = VectorSub(rob(n1).ImpulseRes, VectorScalar(pos, Abs(c)))
  
End Sub

Public Sub TieDrag2(ByVal n1 As Long, ByVal N2 As Long)
  Dim pos As vector
  Dim a As Single, b As Single, c As Single
  Dim invlength As Single
  Dim ForceScalar As Single
  
  If rob(n1).mass = 0 Or rob(N2).mass = 0 Then GoTo getout
  
  'cooperative or independant\
  pos = VectorSub(rob(n1).pos, rob(N2).pos)
  invlength = VectorInvMagnitude(pos)
  
  'a and b are the two cross velocities
  a = Cross(rob(n1).vel, pos)
  b = Cross(rob(N2).vel, pos)
  
  c = (a + b) * 0.5 * invlength 'the average cross velocity
  'use c to find the Cd
  
  Dim asquare As Single
  Dim ab As Single
  Dim bsquare As Single
  Dim BigB As Single
  Dim BigA As Single
  Const TieRadius As Single = 30
  
  asquare = a * a
  ab = a * b
  bsquare = b * b
  BigB = rob(N2).mass / (rob(n1).mass + rob(N2).mass)
  BigA = SimOpts.Density * TieRadius * CylinderCd(c, TieRadius) * 0.083333333333 * Sgn(c)
  
  ForceScalar = BigA * invlength * (4 * BigB * _
    (asquare - 5 * ab + bsquare) + asquare + 2 * ab + 3 * bsquare)
  'divide the above be either B or 1-B (depending on which robot we're
  'applying forces to) and multiply by the orthogonal unit component to pos
  pos = VectorScalar(pos, invlength)
  pos = VectorSet(-pos.Y, pos.X)
  
  rob(n1).ImpulseRes = VectorAdd(rob(n1).ImpulseRes, _
    VectorScalar(pos, ForceScalar * 0.5 / BigB))
  'rob(N2).ForceRes = VectorAdd(rob(N2).ForceRes, _
  '  VectorScalar(pos, ForceScalar * 0.5 / (1 - BigB)))
getout:
End Sub

Public Sub TieDrag(n1 As Integer, N2 As Integer)
'Simple method:

'v1 = my velocity
'm1 = my mass
'p1 = my position
'v2 = other 's velocity
'm2 = other mass
'p2 = other position
'
'
'1.  Find unit vector for tie = u = (p2 - p1) / length(p2-p1)
'2.  a = v1 cross u  |  a and b are the cross velocities, that is, the velocity
'    b = vc cross u  |  perpindicular to the movement of the tie,
'                    |  which is the direction that causes drag
'    v(d) = a + (b-a)/length * d where d is distance from a
'3.  Force on either bots is: A/12*length^2(a^2+2ab+3b^2) in a direction perpindicular to u.
'A = density * radius * Cd
'4.  Find force of drag per unit length using c as the velocity <--- this is
'     the assumption that drag and velocity are linearly related.
'     For turbulent flows, using the average of two velocities is incorrect.
'     In the future, this should be solved.  This requires integrating the
'     Cd and drag force equations for length (with velocity depending linearly
'     on distance from either Mc or m1 of course) between 0 and distance from
'     m1 to Mc.
'5.  The torque (we just add it to resistive forces) applied to "me" =
'     Drag Force per length / 2, since it's the area of the triangle
'     formed by length and dragforces at Mc and m1, divided by the length
'     since we 're applying them all to m1.

  Dim u As vector, vc As vector, a As Single, b As Single, c As Single
  Dim Aconstant As Single
  Dim DragScalar As Single
  Dim Drag As vector
  Dim radius As Single
  Dim Length As Single
  
  '1.  Find unit vector
  u = VectorSub(rob(N2).pos, rob(n1).pos)
  Length = VectorMagnitude(u)
  u = VectorUnit(u)
  
  a = Cross(rob(n1).vel, u)
  b = Cross(rob(N2).vel, u)
  c = (a * a + 2 * a * b + 3 * b * b)
  '4.  Find drag using c:
  
  '1.7 is a good radius.  What?  Whhhaaatttt?  It is.
  'okay, it's because that's what 10 body, at 905 twips^3 each,
  'stretched into a cylinder with a length of 1000 twips would be
      
  If Length = 0 Then Length = 1    'EricL: 4/15/2006
  radius = Sqr(9050 / Length / PI) ' EricL Possible divide by zero bug here when a bot is moved using the mouse.
  Aconstant = radius * SimOpts.Density * 1
    
  DragScalar = Aconstant * Length * Length / 12 * c
  Drag = VectorScalar(VectorSet(-u.Y, u.X), DragScalar * 0.5)
  
  '5:  apply drag to bot
  'not working right :/
  'rob(n1).ForceRes = VectorAdd(rob(n1).ForceRes, Drag)
End Sub

Public Function SphereCd(ByVal velocitymagnitude As Single, ByVal radius As Single) As Single
  'computes the coeficient of drag for a spehre given the unit reynolds in simopts
  'totally ripped from an online drag calculator.  So sue me.
  
  With SimOpts
  
  Dim Reynolds As Single, y11 As Single, y12 As Single, y13 As Single, y1 As Single, y2 As Single, alpha As Single
  If .Viscosity = 0 Then GoTo getout
  
  If velocitymagnitude < 0.00001 Then velocitymagnitude = 0.00001 ' Overflow protection
  Reynolds = radius * 2 * velocitymagnitude * .Density / .Viscosity
  
  y11 = 24 / (3 * 10 ^ 5)
  y12 = 6 / (1 + Sqr(3 * 10 ^ 5))
  y13 = 0.4
  
  y1 = y11 + y12 + y13
  y2 = 0.09
  
  alpha = (y2 - y1) * 50000 ^ -2
  If Reynolds = 0 Then
    SphereCd = 0
  ElseIf Reynolds < 3 * 10 ^ 5 Then
    SphereCd = 24 / Reynolds + 6 / (1 + Sqr(Reynolds)) + 0.4
  ElseIf Reynolds < 3.5 * 10 ^ 5 Then
    SphereCd = alpha * (Reynolds - (3 * 10 ^ 5)) ^ 2 + y1
  ElseIf Reynolds < 6 * 10 ^ 5 Then
    SphereCd = 0.09
  ElseIf Reynolds < 4 * 10 ^ 6 Then
    SphereCd = (Reynolds / (6 * 10 ^ 5)) ^ 0.55 * y2
  Else
    SphereCd = 0.255
  End If
getout:
  End With
End Function

Public Function CylinderCd(ByVal velocitymagnitude As Single, ByVal radius As Single) As Single
  Dim sign As Single
  
  With SimOpts
  
  Const alpha As Single = -3.6444444444444E-11
  
  If velocitymagnitude < 0 Then
    sign = -1#
    velocitymagnitude = -velocitymagnitude
  Else
    sign = 1#
  End If
  
  If .Viscosity = 0 Then
    CylinderCd = 0
    GoTo getout
  End If
  
  Dim Reynolds As Single
  Reynolds = radius * 2 * velocitymagnitude * .Density / .Viscosity
  
  Select Case Reynolds
    Case 0
      CylinderCd = 0
    Case Is < 1
      CylinderCd = (8 * PI) / (Reynolds * (Log(8 / Reynolds) - 0.077216))
    Case Is < 100000#
      CylinderCd = 1 + 10 / Reynolds ^ (2 / 3)
    Case Is < 250000#
      CylinderCd = alpha * (Reynolds - 100000) ^ 2 + 1#
    Case Is < 600000#
      CylinderCd = 0.18
    Case Is < 4000000
      CylinderCd = 0.18 * (Reynolds / 600000) ^ 0.63
    Case Is >= 4000000
      CylinderCd = 0.6
  End Select
getout:
  End With
End Function
'
'Public Sub BouyancyForces(n As Integer) 'Botsareus 2/2/2013 BouyancyForces are no longer needed since boy is proportional to y gravity
'  Dim Impulse As Single
'
'  If SimOpts.Ygravity = 0 Then GoTo getout
'
'    If SimOpts.EGridEnabled Then
'      'Impulse = -SimOpts.Density * rob(n).radius ^ 3 * 4 / 3 * PI * EGrid(FindEGridX(rob(n).pos), FindEGridY(rob(n).pos)).Ygravity
'    Else
'      Impulse = -SimOpts.Density * rob(n).radius ^ 3 * 4 / 3 * PI * SimOpts.Ygravity
'    End If
'    rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, VectorSet(0, Impulse))
'
'getout:
'
'End Sub

Public Sub GravityForces(n As Integer) 'Botsareus 2/2/2013 added bouy as part of y-gravity formula
If (SimOpts.Ygravity = 0 Or Not SimOpts.Pondmode Or SimOpts.Updnconnected) Then
    If rob(n).Bouyancy > 0 Then
        If Not boylabldisp Then Form1.BoyLabl.Visible = True
        boylabldisp = True
    End If
    rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, VectorSet(0, SimOpts.Ygravity * rob(n).mass))
Else
    If Form1.BoyLabl.Visible Then Form1.BoyLabl.Visible = False
    'bouy costs energy (calculated from voluntery movment)
    'importent PhysMoving is calculated into cost as it changes voluntary movement speeds as well
    If rob(n).Bouyancy > 0 Then
        With rob(n)
        .nrg = .nrg - (SimOpts.Ygravity / (SimOpts.PhysMoving) * ((.body / 1000) + (.shell / 200)) * SimOpts.Costs(MOVECOST) * SimOpts.Costs(COSTMULTIPLIER)) * rob(n).Bouyancy
        End With
    End If
    If (1 - rob(n).pos.Y / SimOpts.FieldHeight) > rob(n).Bouyancy Then
       rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, VectorSet(0, SimOpts.Ygravity * rob(n).mass))
    Else
       rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, VectorSet(0, -SimOpts.Ygravity * rob(n).mass))
    End If
End If
End Sub

Public Sub VoluntaryForces(n As Integer)
  'calculates new acceleration and energy values from robot's
  '.up/.dn/.sx/.dx vars
  Dim EnergyCost As Single
  Dim NewAccel As vector
  Dim dir As vector
  Dim mult As Single
  
  With rob(n)
    'corpses are dead, they don't move around of their own volition
    'If .Corpse Or .wall Or (Not .exist) Or ((.mem(dirup) = 0) And (.mem(dirdn) = 0) And (.mem(dirsx) = 0) And (.mem(dirdx) = 0)) Then goto getout
    If .Corpse Or .DisableMovementSysvars Or .DisableDNA Or (Not .exist) Or ((.mem(dirup) = 0) And (.mem(dirdn) = 0) And (.mem(dirsx) = 0) And (.mem(dirdx) = 0)) Then GoTo getout
    
    If .NewMove = False Then
        mult = .mass
    Else
        mult = 1
    End If
       
    'yes it's backwards, that's on purpose
    dir = VectorSet(CLng(.mem(dirup)) - CLng(.mem(dirdn)), CLng(.mem(dirsx)) - CLng(.mem(dirdx)))
    dir = VectorScalar(dir, mult)
    
    NewAccel = VectorSet(Dot(.aimvector, dir), Cross(.aimvector, dir))
    
    'EricL 4/2/2006 Clip the magnitude of the acceleration vector to avoid an overflow crash
    'Its possible to get some really high accelerations here when altzheimers sets in or if a mutation
    'or venom or something writes some really high values into certain mem locations like .up, .dn. etc.
    'This keeps things sane down the road.
    If VectorMagnitude(NewAccel) > SimOpts.MaxVelocity Then
      NewAccel = VectorScalar(NewAccel, SimOpts.MaxVelocity / VectorMagnitude(NewAccel))
    End If
        
    'NewAccel is the impulse vector formed by the robot's internal "engine".
    'Impulse is the integral of Force over time.
    
    .ImpulseInd = VectorAdd(.ImpulseInd, VectorScalar(NewAccel, SimOpts.PhysMoving))
    
    EnergyCost = VectorMagnitude(NewAccel) * SimOpts.Costs(MOVECOST) * SimOpts.Costs(COSTMULTIPLIER)
    
    'EricL 4/4/2006 Clip the energy loss due to voluntary forces.  The total energy loss per cycle could be
    'higher then this due to other nrg losses and this may be redundent with the magnitude clip above, but it
    'helps keep things sane down the road and avoid crashing problems when .nrg goes hugely negative.
    If EnergyCost > .nrg Then
      EnergyCost = .nrg
    End If
    
    If EnergyCost < -1000 Then
      EnergyCost = -1000
    End If
    
    .nrg = .nrg - EnergyCost
getout:
  End With
End Sub

Public Sub TieHooke(n As Integer, Optional timestep As Single = 0)
  'Handles Hooke forces of a tie.  That is, stretching and shrinking
  'Force = -kx - bv
  'from experiments, k and b should be less than .1 otherwise the forces
  'become too great for a euler modelling (that is, the forces become too large
  'for velocity = velocity + acceleration
  
  'can be made less complex (from O(n^2) to Olog(n) by calculating forces only
  'for robots less than current number and applying that force to both robots
    
  Dim Length As Single
  Dim displacement As Single
  Dim Impulse As Single
  Dim k As Integer
  Dim t As Integer
  Dim uv As vector
  Dim vy As vector
  Dim deformation As Single
     
  'EricL 5/26/2006 Perf Test
  If rob(n).numties = 0 Then GoTo getout
     
  deformation = 20 ' Tie can stretch or contract this much and no forces are applied.
  With rob(n)
  
  k = 1
  While k <= MAXTIES And .Ties(k).pnt <> 0
    uv = VectorSub(.pos, rob(.Ties(k).pnt).pos)
    Length = VectorMagnitude(uv)
          
    'delete tie if length > 1000
    'remember length is inverse squareroot
    If Length - .radius - rob(.Ties(k).pnt).radius > 1000 Then
      DeleteTie n, .Ties(k).pnt
      'k = k - 1 ' Have to do this since deltie slides all the ties down
    Else
      If .Ties(k).last > 1 Then .Ties(k).last = .Ties(k).last - 1 ' Countdown to deleting tie
      If .Ties(k).last < 0 Then .Ties(k).last = .Ties(k).last + 1 ' Countup to hardening tie
    
      'EricL 5/7/2006 Following section stiffens ties after 20 cycles
      If .Ties(k).last = 1 Then
         DeleteTie n, .Ties(k).pnt
        ' k = k - 1 ' Have to do this since deltie slides all the ties down
      Else   ' Stiffen the Tie, the bot is a multibot!
        If .Ties(k).last = -1 Then regang n, k
 
        If Length <> 0 Then
          uv = VectorScalar(uv, 1 / Length)
      
          'first -kx
          displacement = .Ties(k).NaturalLength - Length
            
          If Abs(displacement) > deformation Then
            displacement = Sgn(displacement) * (Abs(displacement) - deformation)
            Impulse = .Ties(k).k * displacement
            .ImpulseInd = VectorAdd(.ImpulseInd, VectorScalar(uv, Impulse))
           
            'next -bv
            vy = VectorSub(.vel, rob(.Ties(k).pnt).vel)
            Impulse = Dot(vy, uv) * -.Ties(k).b
           .ImpulseInd = VectorAdd(.ImpulseInd, VectorScalar(uv, Impulse))
          End If
        End If
      End If
    End If
    k = k + 1
  Wend
getout:
End With

End Sub

Public Sub PlanetEaters(n As Integer)
'this way is really, really slow, since we normalize the vector (yuck)
  Dim t As Integer
  Dim force As Single
  Dim PosDiff As vector
  Dim mag As Single
  
  If Not SimOpts.PlanetEaters Then GoTo getout
  If rob(n).mass = 0 Then GoTo getout:
    
  For t = n + 1 To MaxRobs
    If rob(t).mass = 0 Or Not rob(t).exist Then GoTo Nextiteration
    
    PosDiff = VectorSub(rob(t).pos, rob(n).pos)
    mag = VectorMagnitude(PosDiff)
    If mag = 0 Then GoTo Nextiteration
    
    force = (SimOpts.PlanetEatersG * rob(n).mass * rob(t).mass) / (mag * mag)
    PosDiff = VectorScalar(PosDiff, 1 / mag)
    'Now set PosDiff to the vector for force along that line
        
    PosDiff = VectorScalar(PosDiff, force)
    
    rob(n).ImpulseInd = VectorAdd(rob(n).ImpulseInd, PosDiff)
    rob(t).ImpulseInd = VectorSub(rob(t).ImpulseInd, PosDiff)
Nextiteration:
  Next t
getout:
End Sub

' calculates angle between (x1,y1) and (x2,y2)
Public Function angle(ByVal x1 As Single, ByVal y1 As Single, ByVal x2 As Single, ByVal y2 As Single) As Single
  Dim an As Single
  Dim dx As Single
  Dim dy As Single
  dx = x2 - x1
  dy = y1 - y2
  If dx = 0 Then
    'an = 0
    an = PI / 2
    If dy < 0 Then an = PI / 2 * 3
  Else
    an = Atn(dy / dx)
    If dx < 0 Then
      an = an + PI
    End If
  End If
  angle = an
End Function

' normalizes angle in 0,2pi
Public Function angnorm(ByVal an As Single) As Single
  While an < 0
    an = an + 2 * PI
  Wend
  While an > 2 * PI
    an = an - 2 * PI
  Wend
  angnorm = an
End Function

' calculates difference between two angles
Public Function AngDiff(a1 As Single, a2 As Single) As Single
  Dim r As Single
  r = a1 - a2
  If r > PI Then
    r = -(2 * PI - r)
  End If
  If r < -PI Then
    r = r + 2 * PI
  End If
  AngDiff = r
End Function

'' calculates torque generated by all ties on robots
Public Sub TieTorque(t As Integer)
  'Dim check As Single
  Dim anl As Single
  Dim dlo As Single
  Dim dx As Single
  Dim dy As Single
  Dim dist As Single
  Dim n As Integer
  Dim j As Integer
  Dim mt As Single, mm As Single, m As Single
  Dim nax As Single, nay As Single
  Dim TorqueVector As vector
  Dim angleslack As Single ' amount angle can vary without torque forces being applied
  Dim numOfTorqueTies As Integer
    
  angleslack = 5 * 2 * PI / 360 ' 5 degrees
 
  j = 1
  mt = 0
  numOfTorqueTies = 0
  With rob(t)
      If .numties > 0 Then        'condition added to prevent parsing robots without ties.
        If .Ties(1).pnt > 0 Then
          While .Ties(j).pnt > 0
            If .Ties(j).angreg Then 'if angle is fixed.
              n = .Ties(j).pnt
              anl = angle(.pos.X, .pos.Y, rob(n).pos.X, rob(n).pos.Y) 'angle of tie in euclidian space
              dlo = AngDiff(anl, .aim) 'difference of angle of tie and direction of robot
              mm = AngDiff(dlo, .Ties(j).ang + .Ties(j).bend) 'difference of actual angle and requested angle
             
              .Ties(j).bend = 0 'reset bend command .tieang
           '   .Ties(j).angreg = False ' reset angle request flag
              If Abs(mm) > angleslack Then
                numOfTorqueTies = numOfTorqueTies + 1
                mm = (Abs(mm) - angleslack) * Sgn(mm)
                m = mm * 0.1 ' Was .3
                dx = rob(n).pos.X - .pos.X
                dy = .pos.Y - rob(n).pos.Y
                dist = Sqr(dx ^ 2 + dy ^ 2)
                nax = -Sin(anl) * m * dist / 10
                nay = -Cos(anl) * m * dist / 10
                'experimental limits to acceleration
                If Abs(nax) > 100 Then nax = 100 * Sgn(nax)
                If Abs(nay) > 100 Then nay = 100 * Sgn(nax)
              
                'EricL 4/24/2006 This is the torque vector on robot t from it's movement of the tie
                TorqueVector = VectorSet(nax, nay)
              
                rob(n).ImpulseInd = VectorSub(rob(n).ImpulseInd, TorqueVector) 'EricL Subtact the torque for bot n.
                .ImpulseInd = VectorAdd(.ImpulseInd, TorqueVector) 'EricL Add the acceleration for bot t
                mt = mt + mm    'in other words mt = mm for 1 tie
                'If t = 10 Then
                '  mt = mt
                'End If
              End If
            End If
            j = j + 1
          Wend
          'If rob(t).absvel > 10 Then rob(30000).absvel = 1000000  'crash inducing line for debugging
          If mt <> 0 Then
            If Abs(mt) > 2 * PI Then
               .Ties(j).ang = dlo
          '    DeleteTie t, n ' break the tie if the torque is too much
            Else
              If Abs(mt) < PI / 4 Then
                .ma = mt   'This is used later and zeroed each cycle in SetAimFunc
              Else
                .ma = PI / 4 * Sgn(mt)
              End If
            End If
              
                        
            '.aim = angnorm(.aim + .ma)
            '.aimvector = VectorSet(Cos(.aim), Sin(.aim))
          End If
         End If
      End If
  End With
End Sub

'' calculates acceleration due to the medium action on the links
'' (used for swimming)
'Public Sub Swimming()
'  Dim vxle As Long
'  Dim vyle As Long
'  Dim nd As node
'  Dim t As Integer, p As Integer
'  Dim j As Byte
'  Dim anle As Single, anve As Single, ancm As Single
'  Dim vea As Long, lle As Long
'  Dim cnorm As Single
'  Dim Fx As Long, Fy As Long
'  Set nd = rlist.firstnode
'  While Not (nd Is rlist.last)
'    t = nd.robn
'    With rob(t)
'      If .Corpse = False And .Numties > 0 Then  'new conditions to prevent parsing corpses and robots without ties.
'        j = 1
'        While .Ties(j).pnt > 0
'          p = .Ties(j).pnt
'          vxle = (.vx + rob(p).vx) / 2  'average x velocity
'          vyle = (.vy + rob(p).vy) / 2  'average y velocity
'          anle = angle(.x, .y, rob(p).x, rob(p).y)  'Angle between robots
'          anve = angle(0, 0, vxle, vyle)            'Angle of vector velocity
'          ancm = anve - anle                        'Combined angle
'          vea = Sqr(vxle ^ 2 + vyle ^ 2)            'velocity along vector
'          lle = Sqr((.x - rob(p).x) ^ 2 + (.y - rob(p).y) ^ 2)  'distance between robots
'          cnorm = Sin(ancm) * vea * lle * SimOpts.PhysSwim  'Swim force
'          'cnorm = Average Cross velocity * distance between bots * PhysSwim
'          Fx = cnorm * Sin(anle) / 800
'          Fy = cnorm * Cos(anle) / 800
'          .ax = .ax + Fx
'          .ay = .ay + Fy
'          rob(p).ax = rob(p).ax + Fx
'          rob(p).ay = rob(p).ay + Fy
'          j = j + 1
'        Wend
'      End If
'    End With
'    Set nd = nd.pn
'  Wend
'End Sub

Public Sub bordercolls(t As Integer, Optional whichside As Integer = 0, Optional whichbottom As Integer = 0)
  'treat the borders as spongy ground
  'that makes you bounce off.
  
  'bottom = -1 for top, 1 for ground
  'side = -1 for left, 1 for right
  
  'Const k As Single = 0.1
  'Const b As Single = 0.04
 
  Const k As Single = 0.4
  Const b As Single = 0.05
  
  Dim dif As vector
  Dim dist As vector
  Dim smudge As Single
  
  With rob(t)
    If (.pos.X > .radius) And (.pos.X < SimOpts.FieldWidth - .radius) And (.pos.Y > .radius) And (.pos.Y < SimOpts.FieldHeight - .radius) Then GoTo getout
  
    .mem(214) = 0
    
    smudge = .radius + smudgefactor
  
    dif = VectorMin(VectorMax(.pos, VectorSet(smudge, smudge)), VectorSet(SimOpts.FieldWidth - smudge, SimOpts.FieldHeight - smudge))
    dist = VectorSub(dif, .pos)
  
    If dist.X <> 0 Then
      If SimOpts.Dxsxconnected = True Then
        If dist.X < 0 Then
          ReSpawn t, smudge, .pos.Y
        Else
          ReSpawn t, SimOpts.FieldWidth - smudge, .pos.Y
        End If
      Else
        .mem(214) = 1
        'F-> = -k dist-> + v-> * b
      
       ' .ImpulseRes.x = .ImpulseRes.x + dist.x * -k
         If .pos.X - .radius < 0 Then .pos.X = .radius
         If .pos.X + .radius > SimOpts.FieldWidth Then .pos.X = CSng(SimOpts.FieldWidth) - .radius
        .ImpulseRes.X = .ImpulseRes.X + .vel.X * b
      End If
    End If
  
    If dist.Y <> 0 Then
      If SimOpts.Updnconnected Then
        If dist.Y < 0 Then
          ReSpawn t, .pos.X, smudge
        Else
          ReSpawn t, .pos.X, SimOpts.FieldHeight - smudge
        End If
      Else
        rob(t).mem(214) = 1
      'F-> = -k dist-> + v-> * b
      
   '   dif = VectorMin(VectorMax(.pos, VectorSet(smudge, smudge)), VectorSet(SimOpts.FieldWidth - smudge, SimOpts.FieldHeight - smudge))
    '  dist = VectorSub(dif, .pos)
      
     ' .ImpulseRes.y = .ImpulseRes.y + dist.y * -k
        If .pos.Y - .radius < 0 Then .pos.Y = .radius
        If .pos.Y + .radius > SimOpts.FieldHeight Then .pos.Y = CSng(SimOpts.FieldHeight) - .radius
        .ImpulseRes.Y = .ImpulseRes.Y + .vel.Y * b
      End If
    End If
getout:
  End With
End Sub

Public Sub Colls2(n As Integer)
  Dim k As Integer
  Dim distvector As vector
  Dim dist As Single
   
  For k = n + 1 To MaxRobs
    While Not rob(k).exist
      k = k + 1
      If k > MaxRobs Then GoTo getout
    Wend

    distvector = VectorSub(rob(n).pos, rob(k).pos)
      
    'for an interesting effect, try > instead
    dist = rob(n).radius + rob(k).radius
    If VectorMagnitudeSquare(distvector) < (dist * dist) Then
      Repel3 n, k
    End If
  Next k
getout:

End Sub

'' calculates collisions between the robot pointed by node n
'' (of the robots' sorted linked list) and other robots
'' and generates accelerations
'Public Sub colls(n As node)
'  Dim nd As node
'  Dim t As Integer
'  Dim a As Integer
'  Dim dist As Long
'  Dim tvx As Long, tvy As Long
'  Dim slowdown As Single
'  Dim angl As Single
'  Dim aPer As Single
'  Dim tPer As Single
'  Dim aM As Single
'  Dim tM As Single
'  Dim totM As Single
'  Dim colldist As Long
'  Dim colldistsquared As Long
'  Dim deltax As Long
'  Dim deltay As Long
'  Dim deltaxsquare As Long
'  Dim deltaysquare As Long
'  Dim maxdist As Integer
'  Dim otherrobot As Integer
'  Dim xpos As Long
'
'  slowdown = 0.8
'
'  On Error Resume Next
'
'  t = n.robn
'  xpos = n.xpos
'
'  maxdist = FindRadius(32000) * 2
'
'  Set nd = rlist.firstprox(n, maxdist)
'  otherrobot = rob(nd.robn).order
'
'  If Roborder(otherrobot) = -1 Then Exit Sub
'
'  While rob(Roborder(otherrobot)).pos.x < xpos + maxdist
'    a = Roborder(otherrobot)
'    If t <> a Then
'      colldist = rob(t).radius + rob(a).radius
'      colldistsquared = colldist * colldist 'so we don't need the sqr
'
'      deltax = rob(t).pos.x - rob(a).pos.x
'      If Abs(deltax) > colldist Then GoTo bypass1
'      deltay = rob(t).pos.y - rob(a).pos.y
'      If Abs(deltay) > colldist Then GoTo bypass1
'
'      deltaxsquare = deltax * deltax
'      deltaysquare = deltay * deltay
'      If deltaxsquare + deltaysquare > colldistsquared Then GoTo bypass1
'
'        Repel2 a, t
'        touch t, rob(a).pos.x, rob(a).pos.y
'        touch a, rob(t).pos.x, rob(t).pos.y
'        GoTo bypass
'      'End If
'bypass1:
'
'    'PLEASE don't delete this
'    'this was Numsgil's attempt at physics
'    'there might still be some useful bits here and there
'
'    'deltax = deltax + rob(t).vx - rob(a).vx
'    'If deltax > colldist Then GoTo bypass
'    '
'    'deltay = deltay + rob(t).vy - rob(a).vy
'    'If deltay > colldist Then GoTo bypass
'    '
'    'deltaxsquare = deltax * deltax
'    'deltaysquare = deltay * deltay
'    '
'    'If deltaxsquare + deltaysquare <= colldistsquared Then
'    '
'    '  dist = Sqr(deltaxsquare + deltaysquare)
'    '  If dist = 0 Then GoTo bypass
'    '
'    '  Dim deltaxsingle As Single
'    '  Dim deltaysingle As Single
'    '
'    '  deltaxsingle = deltax
'    '  deltaysingle = deltay
'    '
'    '  deltaxsingle = deltaxsingle / dist
'    '  deltaysingle = deltaysingle / dist
'    '
'    '  Dim tabx As Single
'    '  Dim taby As Single
'    '
'    '  tabx = -deltaysingle
'    '  taby = deltaxsingle
'    '
'    '  Dim vait As Single
'    '  vait = rob(a).vx * tabx + rob(a).vy * taby
'
'    '  Dim vain As Single
'    '  vain = rob(a).vx * deltaxsingle + rob(a).vy * deltaysingle
'
'    '  Dim vbit As Single
'    '  vbit = rob(t).vx * tabx + rob(t).vy * taby
'
'    '  Dim vbin As Single
'    '  vbin = rob(t).vx * deltaxsingle + rob(t).vy * deltaysingle
'
'    '  Dim ma As Single
'    '  ma = rob(a).mass
'    '  If rob(a).Fixed Then ma = 1000000
'
'    '  Dim mb As Single
'    '  mb = rob(t).mass
'    '  If rob(t).Fixed Then mb = 1000000
'
'    '  Dim vafn As Single
'    '  vafn = (mb * vbin * (cof_E + 1) + vain * (ma - cof_E * mb)) / (ma + mb)
'
'    '  Dim vbfn As Single
'    '  vbfn = (ma * vain * (cof_E + 1) - vbin * (ma - cof_E * mb)) / (ma + mb)
'
'    '  Dim vaft As Single
'    '  vaft = vait
'
'    '  Dim vbft As Single
'    '  vbft = vbit
'
'    '  Dim xfa As Single
'    '  xfa = vafn * deltaxsingle + vaft * tabx
'
'    '  Dim yfa As Single
'    '  yfa = vafn * deltaysingle + vaft * taby
'
'    '  Dim xfb As Single
'    '  xfb = vbfn * deltaxsingle + vbft * tabx
'
'    '  Dim yfb As Single
'    '  yfb = vbfn * deltaysingle + vbft * taby
'
'    '  If Sqr(xfa ^ 2 + yfa ^ 2) > 60 Then
'    '    'normalize * maxspeed
'    '  End If
'
'    '  If Sqr(xfb ^ 2 + yfb ^ 2) > 60 Then
'    '    'normalize * maxspeed
'    '  End If
'
'    '  rob(a).vx = xfa
'    '  rob(a).vy = yfa
'
'    '  rob(t).vx = xfb
'    '  rob(t).vy = yfb
'   'End If
'bypass:
'    End If
'    'Set nd = rlist.nextorder(nd)
'    otherrobot = otherrobot + 1
'    If Roborder(otherrobot) = -1 Then
'      Exit Sub
'    End If
'  Wend
'End Sub

'only a minor bug, sometimes (rarely) bots get 'stuck' together, forming an
'infinite energy matrix!  woah!
'EricL - This routine works, but collision detection is pretty lame
Public Sub Repel2(rob1 As Integer, rob2 As Integer)
  Dim uv As vector
  Dim vy As vector
  Dim Length As Single
  Dim force As Single
  Dim ForceVector As vector
  
  Const k As Single = 0.1
  Const b As Single = 0.1
  
  uv = VectorSub(rob(rob1).pos, rob(rob2).pos)
  Length = VectorInvMagnitude(uv)
                
  If Length <> -1# Then 'vectorinvmagnitude = inverse magnitude.  Returns -1# if divide by zero
    uv = VectorScalar(uv, Length)
    
    'length is now displacement
    Length = rob(rob1).radius + rob(rob2).radius - 1 / Length
        
    'Restitutive Force
    force = k * Length
    ForceVector = VectorScalar(uv, force)
    rob(rob1).ImpulseInd = VectorAdd(rob(rob1).ImpulseInd, ForceVector)
    rob(rob2).ImpulseInd = VectorSub(rob(rob2).ImpulseInd, ForceVector)
      
    'next -bv
    vy = VectorSub(rob(rob2).vel, rob(rob1).vel)
    force = Dot(vy, uv) * b
    ForceVector = VectorScalar(uv, force)
    rob(rob1).ImpulseInd = VectorAdd(rob(rob1).ImpulseInd, ForceVector)
    rob(rob2).ImpulseInd = VectorSub(rob(rob2).ImpulseInd, ForceVector)
  End If
End Sub

'EricL - My attempt to back port 2.5 physics to address collision detection
'with a bunch of extra tweaks figurred out via trial and error.
Public Sub Repel3(rob1 As Integer, rob2 As Integer) 'Botsareusnotdone collision code to add to ties
  Dim normal As vector
  Dim vy As vector
  Dim Length As Single
  Dim force As Single
  Dim V1 As vector
  Dim V1f As vector
  Dim V1d As vector
  Dim V2 As vector
  Dim V2f As vector
  Dim V2d As vector
  Dim M1 As Single
  Dim M2 As Single
  Dim currdist As Single
  Dim unit As vector
  Dim vel1 As vector
  Dim vel2 As vector
  Dim projection As Single
  Dim e As Single
  Dim fixedSep As Single ' the distance each fixed bots need to be separated
  Dim fixedSepVector As vector
  Dim i As Single ' moment of interia
  Dim relVel As Single
  
  e = SimOpts.CoefficientElasticity ' Set in the UI or loaded/defaulted in the sim load routines
  
  normal = VectorSub(rob(rob2).pos, rob(rob1).pos) ' Vector pointing from bot 1 to bot 2
  currdist = VectorMagnitude(normal) ' The current distance between the bots
  
  'If both bots are fixed or not moving and they overlap, move their positions directly.  Fixed bots can overlap when shapes sweep them together
  'or when they teleport or materialize on top of each other.  We move them directly apart as they are assumed to have no velocity
  'by scaling the normal vector by the amount they need to be separated.  Each bot is moved half of the needed distance without taking into consideration
  'mass or size.
  If rob(rob1).Fixed And rob(rob2).Fixed Or _
    (VectorMagnitude(rob(rob1).vel) < 0.0001 And VectorMagnitude(rob(rob2).vel) < 0.0001) Then
    fixedSep = ((rob(rob1).radius + rob(rob2).radius) - currdist) / 2#
    fixedSepVector = VectorScalar(VectorUnit(normal), fixedSep)
    rob(rob1).pos = VectorSub(rob(rob1).pos, fixedSepVector)
    rob(rob2).pos = VectorAdd(rob(rob2).pos, fixedSepVector)
  End If
  
                  
  If VectorInvMagnitude(normal) <> -1# Then 'vectorinvmagnitude = inverse magnitude.  Returns -1# if divide by zero
    M1 = rob(rob1).mass
    M2 = rob(rob2).mass
    
    'If a bot is fixed, all the collision energy should be translated to the non-fixed bot so for
    'the purposes of calculating the force applied to the non-fixed bot, treat the fixed one as if it is very massive
    If rob(rob1).Fixed Then M1 = 32000
    If rob(rob2).Fixed Then M2 = 32000
    
    unit = VectorUnit(normal) ' Create a unit vector pointing from bot 1 to bot 2
    vel1 = rob(rob1).vel
    vel2 = rob(rob2).vel
    
    'Project the bot's direction vector onto the unit vector and scale by velocity
    'These represent vectors we subtract from the bot's velocity to push the bot in a direction
    'appropriate to the collision.  This would be all we needed if the bots all massed the same.
    'It's possible the bots are already moving away from each other having "collided" last cycle.  If so,
    'we don't want to reverse them again and we don't want to add too much more further acceleration
    projection = Dot(vel1, unit) * 0.99 ' Try damping things down a little
    
      
    If projection <= 0 Then ' bots are already moving away from one another
       projection = 0.000001
    End If
    V1 = VectorScalar(unit, projection)
    
    projection = Dot(vel2, unit) * 0.99 ' try damping things down a little
          
    If projection >= 0 Then ' bots are already moving away from one another
       projection = -0.000001
    End If
    V2 = VectorScalar(unit, projection)
    
    'Now we need to factor in the mass of the bots.  These vectors represent the resistance to movement due
    'to the bot's mass
    V1f = VectorScalar(VectorAdd(VectorScalar(V2, (e + 1#) * M2), VectorScalar(V1, (M1 - e * M2))), 1 / (M1 + M2))
    V2f = VectorScalar(VectorAdd(VectorScalar(V1, (e + 1#) * M1), VectorScalar(V2, (M2 - e * M1))), 1 / (M1 + M2))
    
   ' V1 = VectorAdd(V1, V1f)
   ' V2 = VectorAdd(V2, V2f)
     
    'Now we have to add in the angular momentum due to the collision
    'Note that we should really do the collision force and the angular momentum force together since
    'some of the collision rebound goes into rotation, but this will do for now.
    
    'First we have to calculate the relative angular velocities of the bot surfaces where they touch
    'Note that this is relative to bot 1
    'relVel = rob(rob1).radius * rob(rob1).ma - rob(rob2).radius * rob(rob2).ma
    
    'The angular velocity from the collision is
    
    '  I = (2 / 5) * rob(rob1).radius * rob(rob1).radius * M1
    'rob(rob1).ma = rob(rob1).ma + VectorMagnitude(V1)
    'rob(rob2).ma = rob(rob2).ma + Dot(V2, unit) / rob(rob2).radius
    
    'No reason to try to try to accelerate fixed bots
    If Not rob(rob1).Fixed Then
      rob(rob1).vel = VectorAdd(VectorSub(rob(rob1).vel, V1), V1f)
    End If

    If Not rob(rob2).Fixed Then
      rob(rob2).vel = VectorAdd(VectorSub(rob(rob2).vel, V2), V2f)
    End If
      
    
    'Update the touch senses
    touch rob1, rob(rob2).pos.X, rob(rob2).pos.Y
    touch rob2, rob(rob1).pos.X, rob(rob1).pos.Y
    
    'Update the refvars to reflect touching bots.
    lookoccurr rob1, rob2
    lookoccurr rob2, rob1

  End If
End Sub

'' gives to too near robots an accelaration towards
'' opposite directions, inversely prop. to their distance
'Private Sub repel(k As Integer, t As Integer)
'  Dim d As Single
'  Dim dx As Integer
'  Dim dy As Integer
'  Dim dxlk As Single
'  Dim dylk As Single
'  Dim dxlt As Single
'  Dim dylt As Single
'  Dim kconst As Single
'  Dim llink As Single
'  Dim accel As Long  'new acceleration to apply
'  Dim difKE As Long
'
'  Dim maxcel As Single
'  Dim angl1 As Single
'  Dim angl2 As Single
'  Dim colldist As Integer
'  Dim totx As Single 'total x velocity
'  Dim toty As Single 'total y velocity
'  Dim totv As Single 'total absolute velocity
'  Dim totaccel As Single
'  Dim decell As Single
'  Dim kmovx As Single
'  Dim kmovy As Single
'  Dim tmovx As Single
'  Dim tmovy As Single
'  Dim kKE As Single
'  Dim tKE As Single
'  Dim kxm As Single   'robot k x momentum
'  Dim kym As Single   'robot k y momentum
'  Dim txm As Single   'robot t x momentum
'  Dim tym As Single   'robot t y momentum
'  Dim xmean As Single  'Mean of both x momentums
'  Dim ymean As Single  'Mean of both y momentums
'
'  Dim totKE As Single
'  Dim kPer As Single    'percentage of acceleration to give to robot k based on mass
'  Dim tPer As Single    'same for robot t
'  Dim moveaway As Single  'The amount to directly move a robot away from a collision
'
'  'If xmoveaway(k, t) Then GoTo bypass2
'  'If ymoveaway(k, t) Then GoTo bypass2
'
'  dx = (rob(t).pos.x - rob(k).pos.x)
'  dy = (rob(t).pos.y - rob(k).pos.y)
'  colldist = rob(k).Radius + rob(t).Radius 'amount of overlap based on size of robot
'  d = Sqr(dx ^ 2 + dy ^ 2) + 0.01   'inter-robot distance
'
'  decell = 1
'  maxcel = 40
'  'GoTo bypass2
'  kKE = rob(k).mass * rob(k).vel.x + rob(k).mass * rob(k).vel.y
'  tKE = rob(t).mass * rob(t).vel.x + rob(t).mass * rob(t).vel.y
'  kxm = rob(k).mass * rob(k).vel.x     'rob(k) x momentum signed
'  kym = rob(k).mass * rob(k).vel.y     'rob(k) y momentum signed
'  txm = rob(t).mass * rob(t).vel.x     'rob(t) x momentum signed
'  tym = rob(t).mass * rob(t).vel.y     'rob(t) y momentum signed
'  xmean = (Abs(kxm) + Abs(txm)) / 2 'absolute mean of x momentums. Both counted as positive
'  ymean = (Abs(kym) + Abs(tym)) / 2 'absolute mean of y momentums. Both counted as positive
'  If rob(k).mass = 0 Then rob(k).mass = 0.001
'  rob(k).vel.x = rob(k).vel.x + (xmean / rob(k).mass) * kxColdir(k, t) * decell
'  rob(t).vel.x = rob(t).vel.x + (xmean / rob(t).mass) * txColdir(k, t) * decell
'  rob(k).vel.y = rob(k).vel.y + (ymean / rob(k).mass) * kyColdir(k, t) * decell
'  rob(t).vel.y = rob(t).vel.y + (ymean / rob(t).mass) * tyColdir(k, t) * decell
'
'bypass2:
'  'totKE = tKE + kKE   'calculates total momentum of both robots
'  'difKE = kKE - tKE   'difference in momentum
'
'  'tPer = rob(k).mass / (rob(k).mass + rob(t).mass)  'percentage of total momentum in bot k
'  'kPer = rob(t).mass / (rob(k).mass + rob(t).mass)  'percentage of total momentum in bot t
'
'
'
'  'If rob(k).vx = 0 Then rob(k).vx = 0.00001
'  'If rob(t).vx = 0 Then rob(t).vx = 0.00001
'  'mvanglt = Atn(rob(k).vy / rob(k).vx)
'  'mvangla = Atn(rob(t).vy / rob(t).vx)
'  'angledifference = angnorm(AngDiff(mvanglt, angl))
'  'exitangle = angnorm(angl - angledifference)
'  'newvx = (rob(k).vx + rob(t).vx) * (rob(t).mass / (rob(k).mass + rob(t).mass))
'  'newvy = (rob(k).vy + rob(t).vy) * (rob(t).mass / (rob(k).mass + rob(t).mass))
'  'newvx = newvx * 0.95
'  'newvy = newvy * 0.95
'  'llink = 1000
'
'  'totx = Abs(rob(k).vx) + Abs(rob(t).vx)
'  'totx = rob(k).vx + rob(t).vx
'  'toty = Abs(rob(k).vy) + Abs(rob(t).vy)
'  'toty = rob(k).vy + rob(t).vy
'  'totv = totx + toty
'
'
'  angl1 = angle(rob(k).pos.x, rob(k).pos.y, rob(t).pos.x, rob(t).pos.y) 'angle from rob k to rob t
'  angl2 = angle(rob(t).pos.x, rob(t).pos.y, rob(k).pos.x, rob(k).pos.y) 'angle from rob t to rob k
'  'colldist = colldist * 1.2
'
'  'dxlk = absx(angl1, totKE, 0, 0, 0) * tPer
'  'dylk = absy(angl1, totKE, 0, 0, 0) * tPer
'  'dxlt = absx(angl2, totKE, 0, 0, 0) * kPer
'  'dylt = absy(angl2, totKE, 0, 0, 0) * kPer
'  'totaccel = Abs(dxl) + Abs(dyl)
'
'
'  'kconst = 0.01
'  'dxl = (dx - (llink * dx) / d)
'  'dyl = (dy - (llink * dy) / d)
'  moveaway = (colldist - d) / 2 'move away based on half of overlap
'  If d < colldist Then
'    kmovx = absx(angl1, moveaway, 0, 0, 0)
'    kmovy = absy(angl1, moveaway, 0, 0, 0)
'    tmovx = absx(angl2, moveaway, 0, 0, 0)
'    tmovy = absy(angl2, moveaway, 0, 0, 0)
'    If Not rob(t).Fixed Then
'      rob(t).pos.x = rob(t).pos.x - tmovx
'      rob(t).pos.y = rob(t).pos.y - tmovy
'    End If
'    If Not rob(k).Fixed Then
'      rob(k).pos.x = rob(k).pos.x - kmovx
'      rob(k).pos.y = rob(k).pos.y - kmovy
'    End If
'  Else
'    kmovx = 0
'    kmovy = 0
'    tmovx = 0
'    tmovy = 0
'  End If
'bypass3:
'End Sub
'
'Private Function kxColdir(k As Integer, t As Integer)
'  If rob(k).pos.x < rob(t).pos.x Then
'    kxColdir = -1
'  Else
'    kxColdir = 1
'  End If
'End Function
'
'Private Function kyColdir(k As Integer, t As Integer)
'If rob(k).pos.y < rob(t).pos.y Then
'    kyColdir = -1
'  Else
'    kyColdir = 1
'  End If
'End Function
'
'Private Function txColdir(k As Integer, t As Integer)
'If rob(t).pos.x < rob(k).pos.x Then
'    txColdir = -1
'  Else
'    txColdir = 1
'  End If
'End Function
'
'Private Function tyColdir(k As Integer, t As Integer)
'If rob(t).pos.y < rob(k).pos.y Then
'    tyColdir = -1
'  Else
'    tyColdir = 1
'  End If
'End Function
'
'Private Function xmoveaway(k As Integer, t As Integer) As Boolean
'  If Sgn(rob(k).vel.x) = Sgn(rob(t).vel.x) Then 'both moving the same way
'    If rob(k).pos.x < rob(t).pos.x Then           'rob(k) is to the left
'      If Sgn(rob(k).vel.x) = 1 Then          'rob(k) moving to the right
'        If rob(k).vel.x < rob(t).vel.x Then     'rob(k) moving slower than rob(t)
'          xmoveaway = True                'moving away
'        Else
'          xmoveaway = False               'not moving away
'        End If
'      Else                                'rob(k) moving to the left
'        If rob(k).vel.x > rob(t).vel.x Then     'rob(k) moving faster than rob(t)
'          xmoveaway = True                'moving away
'        Else
'          xmoveaway = False               'not moving away
'        End If
'      End If
'    Else                                  'rob(k) is NOT to the left (right or level)
'      If Sgn(rob(k).vel.x) = 1 Then          'rob(k) moving to the right
'        If rob(k).vel.x > rob(t).vel.x Then     'rob(k) moving faster than rob(t)
'          xmoveaway = True                'moving away
'        Else
'          xmoveaway = False               'not moving away
'        End If
'      Else                                'rob(k) moving to the left
'        If rob(k).vel.x < rob(t).vel.x Then     'rob(k) moving faster than rob(t)
'          xmoveaway = True                'moving away
'        Else
'          xmoveaway = False               'not moving away
'        End If
'      End If
'    End If
'  Else                                    'robots moving opposite directions
'    If rob(k).pos.x < rob(t).pos.x Then           'rob(k) is to the left
'      If Sgn(rob(k).vel.x) = 1 Then          'rob(k) moving to the right
'        xmoveaway = False
'      Else                                'rob(k) moving to the left
'        xmoveaway = True
'      End If
'    Else                                  'rob(k) is to the right or level
'      If Sgn(rob(k).vel.x) = 1 Then          'rob(k) moving to the right
'        xmoveaway = True                  'must be moving away
'      Else                                'rob(k) moving to the left
'        xmoveaway = False                 'must be moving towards
'      End If
'    End If
'  End If
'End Function
'
'Private Function ymoveaway(k As Integer, t As Integer) As Boolean
'If Sgn(rob(k).vy) = Sgn(rob(t).vy) Then   'both moving the same way
'    If rob(k).y < rob(t).y Then           'rob(k) is to the top
'      If Sgn(rob(k).vy) = 1 Then          'rob(k) moving to the bottom
'        If rob(k).vy < rob(t).vy Then     'rob(k) moving slower than rob(t)
'          ymoveaway = True                'moving away
'        Else
'          ymoveaway = False               'not moving away
'        End If
'      Else                                'rob(k) moving to the left
'        If rob(k).vy > rob(t).vy Then     'rob(k) moving faster than rob(t)
'          ymoveaway = True                'moving away
'        Else
'          ymoveaway = False               'not moving away
'        End If
'      End If
'    Else                                  'rob(k) is NOT to the left (right or level)
'      If Sgn(rob(k).vy) = 1 Then          'rob(k) moving to the bottom
'        If rob(k).vy > rob(t).vy Then     'rob(k) moving faster than rob(t)
'          ymoveaway = True                'moving away
'        Else
'          ymoveaway = False               'not moving away
'        End If
'      Else                                'rob(k) moving to the top
'        If rob(k).vy < rob(t).vy Then     'rob(k) moving faster than rob(t)
'          ymoveaway = True                'moving away
'        Else
'          ymoveaway = False               'not moving away
'        End If
'      End If
'    End If
'  Else                                    'robots moving opposite directions
'    If rob(k).y < rob(t).y Then           'rob(k) is to the top
'      If Sgn(rob(k).vy) = 1 Then          'rob(k) moving to the bottom
'        ymoveaway = False
'      Else                                'rob(k) moving to the top
'        ymoveaway = True
'      End If
'    Else                                  'rob(k) is to the right or level
'      If Sgn(rob(k).vy) = 1 Then          'rob(k) moving to the bottom
'        ymoveaway = True                  'must be moving away
'      Else                                'rob(k) moving to the top
'        ymoveaway = False                 'must be moving towards
'      End If
'    End If
'  End If
'End Function
