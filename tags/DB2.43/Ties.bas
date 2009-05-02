Attribute VB_Name = "Ties"
Option Explicit

' tie structure, used to represent robot ties
'booleans = integers in space taken up.
Public Type tie
  Port As Integer         ' the tie port, i.e. the value one must give to .tienum var to access the tie
  pnt As Integer          ' the robot the tie points to
  ptt As Integer             ' the back tie of the pointed robot
  ang As Single           ' current tie angle (relative to aim)
  bend As Single          ' angle bend value
  angreg As Boolean       ' the angle is fixed?
  ln As Long              ' tie len
  shrink As Long          ' tie shrink value
  stat As Boolean         ' apparently unused
  last As Integer         ' tie timing: <-1: cycles to angle fixing; >1: cycles to tie destruction
  mem As Integer          ' Reads nrg of tied robot
  back As Boolean         ' is it a back tie?
  nrgused As Boolean      ' for colouring the tie red in case of energy transfer
  infused As Boolean      ' for colouring white in case of information transfer
  sharing As Boolean       ' for coloring yellow in case of sharing
  
  'New:
  'Spring Force = -k*displacement - velocty * b
  'b and k are constants between 0 and 1
  
  Fx As Single 'for storing what forces have been applied to us.  Erase when Finished!
  Fy As Single
  
  NaturalLength As Single
  k As Single
  b As Single
  type As Byte
    '0 = damped spring, lower b and k values, birth ties here
    '1 = string (only applies force if longer than
      '"natural length", not if too short) b and k values high
    '2 = bone (very high b and k values).  (Or perhaps something better?)
    '3 = anti-rope - only applies force if shorter than
      '"natural length", not if too long) b and k values high
End Type

'This routine deals with information transfer only. Added in to fix a major bug
'in which older robots could transfer information to younger bots OK but
'young bots could not transfer information to older bots in time for the information
'to do any good
Public Sub tieportcom(t As Integer)
  Dim k As Integer
  Dim tn As Integer
  'Dim tp As Integer
  'tp = tieport1
  
  With rob(t)
    If Not (.mem(455) <> 0 And .Numties > 0 And .mem(tieloc) > 0) Then Exit Sub
    tn = .mem(tienum)
    k = 1
      If .mem(tieloc) > 0 And .mem(tieloc) < 1001 Then  '.tieloc value
        While .Ties(k).pnt > 0
          If .Ties(k).Port = tn Then
            rob(.Ties(k).pnt).mem(.mem(tieloc)) = .mem(tieval) 'stores a value in tied robot memory location (.tieloc) specified in .tieval
            If Not .Ties(k).back Then   'forward information transfer
              .Ties(k).infused = True   'draws tie white
            Else                        'backward information transfer
              rob(.Ties(k).pnt).Ties(.Ties(k).ptt).infused = True 'draws tie white
            End If
           ' .mem(tienum) = 0 ' EricL 4/24/2006 Commented out
            .mem(tieval) = 0
            .mem(tieloc) = 0
          End If
          k = k + 1
        Wend
      End If
      
  End With
End Sub
' this procedure takes care of parsing and addressing
' ties commands: bend, shrink, communications
Public Sub Update_Ties(t As Integer)
  Dim tp As Integer
  Dim tn As Integer
  Dim k As Integer
  Dim l As Single
  Dim ptag As Single
  Dim length As Integer
 ' tn = 1
  With rob(t)
    tp = tieport1
    tn = .mem(tp + 5)   '.tienum value
    'this routine addresses all ties. not just ones that match .tienum
    k = 1
    .vbody = .body
    While .Ties(k).pnt > 0  'while there is a tie that points to another robot. Can't share with a wall (I hope)
      'If .Multibot And Not rob(.Ties(k).pnt).wall Then
      If .Multibot Then
        If .mem(830) > 0 Then
          sharenrg t, k
          .Ties(k).sharing = True   'yellow ties
        End If
        If .mem(831) > 0 Then
          sharewaste t, k
          .Ties(k).sharing = True   'yellow ties
        End If
        If .mem(832) > 0 Then
          shareshell t, k
          .Ties(k).sharing = True   'yellow ties
        End If
        If .mem(833) > 0 Then
          shareslime t, k
          .Ties(k).sharing = True   'yellow ties
        End If
        
        .vbody = .vbody + rob(.Ties(k).pnt).body
      End If
      k = k + 1
    Wend
    .mem(tp + 4) = .Ties(k - 1).Port 'value stored in .tiepres. the tienum of the highest k number tie. Might be useful.
    .mem(830) = 0
    .mem(831) = 0
    .mem(832) = 0
    .mem(833) = 0
    .Numties = k - 1
    .mem(tp + 16) = .Numties   'places a value in the memory cell .numties for number of ties attached to a robot
    If .Numties = 0 Then .Multibot = False: .mem(470) = 0: Exit Sub
    
    If .mem(tp + 17) <> 0 Then
      k = 1
      While .Ties(k).pnt > 0     'deletes a tie specified in .deltie
        If .Ties(k).Port = .mem(tp + 17) Then
          deltie t, .Ties(k).pnt
        End If
      k = k + 1
      Wend
      .mem(tp + 17) = 0 'resets .deltie command
    End If
    If .mem(480) <> 32000 Then
      .Ties(1).ang = .mem(480) / 200
    End If
    If .mem(481) <> 32000 Then
      .Ties(2).ang = .mem(481) / 200
    End If
    If .mem(482) <> 32000 Then
      .Ties(3).ang = .mem(482) / 200
    End If
    If .mem(483) <> 32000 Then
      .Ties(4).ang = .mem(483) / 200
    End If
    If .mem(484) > RobSize And .mem(484) > RobSize Then 'set tie 1 length
      .Ties(1).ln = .mem(484)
      rob(.Ties(1).pnt).Ties(srctie((.Ties(1).pnt), t)).ln = .mem(484)
    End If
    If .mem(485) > RobSize And .mem(485) > RobSize Then 'set tie 2 length
      .Ties(2).ln = .mem(485)
      rob(.Ties(2).pnt).Ties(srctie((.Ties(2).pnt), t)).ln = .mem(485)
    End If
    If .mem(486) > RobSize And .mem(486) > RobSize Then 'set tie 3 length
      .Ties(3).ln = .mem(485)
      rob(.Ties(3).pnt).Ties(srctie((.Ties(3).pnt), t)).ln = .mem(486)
    End If
    If .mem(487) > RobSize And .mem(487) > RobSize Then 'set tie 4 length
      .Ties(4).ln = .mem(487)
      rob(.Ties(4).pnt).Ties(srctie((.Ties(4).pnt), t)).ln = .mem(487)
    End If
    If tn Then  'routines only carried out if .tienum has a value
      k = 1
      While .Ties(k).pnt > 0
        If .Multibot And .Ties(k).type = 3 Then ' Has to be a multibot and tie has to have hardened
         
          'FixAng
          If .mem(468) <> 32000 And .Ties(k).Port = tn Then   'fixes tie angle
            If .mem(468) > 628 Then .mem(468) = -627
            If .mem(468) < -628 Then .mem(468) = 627
            .Ties(k).ang = .mem(468) / 200
            .Ties(k).angreg = True 'EricL 4/24/2006
          End If
          
          'TieLen Section
          If .mem(fixlen) <> 0 And .Ties(k).Port = tn Then 'fixes tie length
            length = Abs(.mem(fixlen)) + .radius + rob(.Ties(k).pnt).radius ' include the radius of the tied bots in the length
            .Ties(k).NaturalLength = length 'for first robot
            rob(.Ties(k).pnt).Ties(srctie((.Ties(k).pnt), t)).NaturalLength = length 'for second robot. What a messed up formula
          End If
    
          'EricL 5/7/2006 Added Stifftie section.  This never made it into the 2.4 code
          If .mem(stifftie) <> 0 And .Ties(k).Port = tn Then
            If .mem(stifftie) > 40 Then .mem(stifftie) = 40
            If .mem(stifftie) < 1 Then .mem(stifftie) = 1
            .Ties(k).b = 0.0025 * .mem(stifftie) ' May need to tweak the multiplier here vares from 0.0025 to .1
            rob(.Ties(k).pnt).Ties(srctie((.Ties(k).pnt), t)).b = 0.0025 * .mem(stifftie) ' May need to tweak the multiplier here
            .Ties(k).k = 0.00125 * .mem(stifftie) 'May need to tweak the multiplier here:  varies from 0.00125 to 0.05
            rob(.Ties(k).pnt).Ties(srctie((.Ties(k).pnt), t)).k = 0.00125 * .mem(stifftie) ' May need to tweak the multiplier here: varies from 0.00125 to 0.05
          End If
        End If
               
        k = k + 1
      Wend
      .mem(fixang) = 32000
      .mem(fixlen) = 0
      .mem(stifftie) = 0
      k = 1
          
      If .mem(tp) Then  '.fixang value
        k = 1
        While .Ties(k).pnt > 0
          If .Ties(k).Port = tn Then bend t, k, .mem(tp) 'bend a tie
          k = k + 1
        Wend
      End If
      If .mem(tp + 1) Then  '.tielen value
        k = 1
        While .Ties(k).pnt > 0
          If .Ties(k).Port = tn Then shrink t, k, .mem(tp + 1) 'set tie length to value specified in mem location 451 (tp+1)
          k = k + 1
        Wend
      End If
      If .mem(tp + 2) < 0 And .mem(tp + 2) > -1001 Then  '.tieloc value
        If .mem(tp + 2) = -1 And .mem(tp + 3) <> 0 Then   'tieloc = -1 and .tieval not zero
          k = 1
          l = .mem(tp + 3) ' l is amount of energy to exchange, positive to give nrg away, negative to take it
          
          'If we are giving nrg away, make sure it's not more than we have and also that we have some to give away
          If l > 0 Then
            If (.nrg < 0) Then
              l = 0
            Else
              If l > .nrg Then l = .nrg
            End If
          End If
          If .body < 0 Then l = 0 ' If your body has gone negative, you can't take or give nrg.
          If .nrg < 0 Then l = 0 ' If you nrg has gone negative, you can't take or give nrg.
          If .age = 0 Then l = 0
          If l > 1000 Then l = 1000
          If l < -3000 Then l = -3000
          
          While .Ties(k).pnt > 0     'tie actually points at something
            'If .Ties(k).Port = tn And Not rob(.Ties(k).pnt).wall Then    'try to stop robots killing walls with ties
            If .Ties(k).Port = tn Then
              If l > 0 Then
                rob(.Ties(k).pnt).nrg = rob(.Ties(k).pnt).nrg + l * 0.7 'tied robot receives energy
                rob(.Ties(k).pnt).body = rob(.Ties(k).pnt).body + l * 0.029 'tied robot stores some fat
                rob(.Ties(k).pnt).Waste = rob(.Ties(k).pnt).Waste + l * 0.01 'tied robot receives waste
                If rob(.Ties(k).pnt).body > 32000 Then rob(.Ties(k).pnt).body = 32000
                rob(.Ties(k).pnt).radius = FindRadius(rob(.Ties(k).pnt).body)
                .nrg = .nrg - l   'tying robot gives up energy
              End If
              If l < 0 Then
                If Abs(l) > .body / 10# Then l = Abs(.body) / -10#    'fixes maximum energy drain proportional to body
                If Abs(l) > rob(.Ties(k).pnt).nrg Then
                  If rob(.Ties(k).pnt).nrg > 0 Then
                    l = (rob(.Ties(k).pnt).nrg) * -1 'limits energy taken from tied robot
                  Else
                    l = 0
                  End If
                End If
                ptag = Abs(l / 4)
                If rob(.Ties(k).pnt).poison > ptag Then 'target robot has poison
                  If rob(.Ties(k).pnt).FName <> .FName Then 'can't poison your brother
                    .Poisoned = True
                    .Poisoncount = .Poisoncount + ptag
                    If .Poisoncount > 32000 Then .Poisoncount = 32000
                    l = 0
                    rob(.Ties(k).pnt).poison = rob(.Ties(k).pnt).poison - ptag
                    rob(.Ties(k).pnt).mem(827) = rob(.Ties(k).pnt).poison
                    If rob(.Ties(k).pnt).mem(834) > 0 Then
                      .Ploc = ((rob(.Ties(k).pnt).mem(834) - 1) Mod 1000) + 1  'sets .Ploc to targets .mem(ploc) EricL - 3/29/2006 Added Mod to fix overflow
                    Else
                      .Ploc = Random(1, 1000)
                    End If
                  End If
                End If
                rob(.Ties(k).pnt).nrg = rob(.Ties(k).pnt).nrg + l 'tied robot loses energy.
                'If rob(.Ties(k).pnt).nrg = 0 Then rob(.Ties(k).pnt).nrg = -100 'ensures that robots with nrg = 0 actually die
                If rob(.Ties(k).pnt).nrg < 0 And rob(.Ties(k).pnt).Dead = False Then
                  rob(.Ties(k).pnt).Dead = True
                  .Kills = .Kills + 1
                  If .Kills > 32000 Then .Kills = 32000
                  .mem(220) = .Kills
                End If
                .nrg = .nrg - l * 0.7 'tying robot receives energy
                .body = .body - l * 0.029 'tying robot stores some fat
                If .body > 32000 Then .body = 32000
                .radius = FindRadius(.body)
                .Waste = .Waste + Abs(l / 100#) 'tying robot adds waste
              End If
              If Not .Ties(k).back Then   'forward ties
                .Ties(k).nrgused = True   'red ties
              Else                        'backward ties
                rob(.Ties(k).pnt).Ties(.Ties(k).ptt).nrgused = True 'red ties
              End If
            End If
            k = k + 1
          Wend
        End If
        If .mem(tp + 2) = -3 And .mem(tp + 3) <> 0 Then  'inject or steal venom
          If .mem(tp + 3) > 100 Then .mem(tp + 3) = 100
          If .mem(tp + 3) > .venom Then .mem(tp + 3) = .venom
          If .mem(tp + 3) < -100 Then .mem(tp + 3) = -100
          k = 1
          While .Ties(k).pnt > 0
            If .Ties(k).Port = tn Then
              'If .mem(tp + 3) < rob(.Ties(k).pnt).Venom Then .mem(tp + 3) = rob(.Ties(k).pnt).Venom
              If .mem(tp + 3) > 0 Then
                rob(.Ties(k).pnt).Paracount = rob(.Ties(k).pnt).Paracount + .mem(tp + 3) 'paralysis counter set
                rob(.Ties(k).pnt).Paralyzed = True         'robot paralyzed
                If .mem(835) > 0 Then
                  If .mem(835) > 999 Then .mem(835) = 999
                  rob(.Ties(k).pnt).Vloc = .mem(835)
                Else
                  rob(.Ties(k).pnt).Vloc = Random(1, 1000)
                End If
                rob(.Ties(k).pnt).Vval = .mem(836)
                .venom = .venom - .mem(tp + 3)
                .mem(825) = .venom
              Else
                If rob(.Ties(k).pnt).venom > Abs(.mem(tp + 3)) Then
                  rob(.Ties(k).pnt).venom = rob(.Ties(k).pnt).venom + .mem(tp + 3)
                  .venom = .venom - .mem(tp + 3)  'robot steals venom from tied target
                Else
                  .venom = .venom + rob(.Ties(k).pnt).venom
                  rob(.Ties(k).pnt).venom = 0
                End If
                .mem(825) = .venom
              End If
              If Not .Ties(k).back Then   'forward ties
                .Ties(k).nrgused = True   'red ties
              Else                        'backward ties
                rob(.Ties(k).pnt).Ties(.Ties(k).ptt).nrgused = True 'red ties
              End If
            End If
            k = k + 1
          Wend
        End If
        If .mem(tp + 2) = -4 And .mem(tp + 3) <> 0 Then 'trade waste via ties
          If .mem(tp + 3) > 1000 Then .mem(tp + 3) = 1000
          If .mem(tp + 3) > .Waste Then .mem(tp + 3) = .Waste
          If .mem(tp + 3) < -1000 Then .mem(tp + 3) = -1000
          k = 1
          While .Ties(k).pnt > 0
            If .Ties(k).Port = tn Then
              'If .mem(tp + 3) < rob(.Ties(k).pnt).Waste Then .mem(tp + 3) = rob(.Ties(k).pnt).Waste
              If .mem(tp + 3) > 0 Then
                rob(.Ties(k).pnt).Waste = rob(.Ties(k).pnt).Waste + .mem(tp + 3)
                .Waste = .Waste - .mem(tp + 3)
                .Pwaste = .Pwaste + (.mem(tp + 3) / 1000)
              Else
                If rob(.Ties(k).pnt).Waste > Abs(.mem(tp + 3)) Then
                  rob(.Ties(k).pnt).Waste = rob(.Ties(k).pnt).Waste + .mem(tp + 3)
                  .Waste = .Waste - .mem(tp + 3)  'robot steals waste from tied target
                  rob(.Ties(k).pnt).Pwaste = rob(.Ties(k).pnt).Pwaste - .mem(tp + 3) / 10
                Else
                  .Waste = .Waste + rob(.Ties(k).pnt).Waste
                  rob(.Ties(k).pnt).Pwaste = rob(.Ties(k).pnt).Pwaste + rob(.Ties(k).pnt).Waste / 10
                  rob(.Ties(k).pnt).Waste = 0
                End If
                rob(.Ties(k).pnt).Pwaste = rob(.Ties(k).pnt).Pwaste - .mem(tp + 3)
              End If
              If Not .Ties(k).back Then   'forward ties
                .Ties(k).nrgused = True   'red ties
              Else                        'backward ties
                rob(.Ties(k).pnt).Ties(.Ties(k).ptt).nrgused = True 'red ties
              End If
            End If
            k = k + 1
          Wend
        End If
        
        If .mem(tp + 2) = -6 And .mem(tp + 3) <> 0 Then   'tieloc = -6 and .tieval not zero
          k = 1
          l = .mem(tp + 3)
          
           'If we are giving body away, make sure it's not more than we have and also that we have some to give away
          If l > 0 Then
            If (.body < 0) Then
              l = 0
            Else
              If l > .body Then l = .body
            End If
          End If
          
          If .body < 0 Then l = 0 ' If your body has gone negative, you can't take or give body.
          If .nrg < 0 Then l = 0 ' If you nrg has gone negative, you can't take or give body
          If .age = 0 Then l = 0
          If l > 100 Then l = 100
          If l < -300 Then l = -300
          
          While .Ties(k).pnt > 0     'tie actually points at something
            'If .Ties(k).Port = tn And Not rob(.Ties(k).pnt).wall Then    'try to stop robots killing walls with ties
            If .Ties(k).Port = tn Then
              If l > 0 Then
                rob(.Ties(k).pnt).nrg = rob(.Ties(k).pnt).nrg + l * 1#   'tied robot receives 10% energy
                rob(.Ties(k).pnt).body = rob(.Ties(k).pnt).body + l * 0.89 'tied robot stores 89% fat
                rob(.Ties(k).pnt).Waste = rob(.Ties(k).pnt).Waste + l * 0.001 'tied robot receives 1 % waste
                If rob(.Ties(k).pnt).body > 32000 Then rob(.Ties(k).pnt).body = 32000
                If rob(.Ties(k).pnt).nrg > 32000 Then rob(.Ties(k).pnt).nrg = 32000
                rob(.Ties(k).pnt).radius = FindRadius(rob(.Ties(k).pnt).body)
                .body = .body - l   'tying robot gives up body
              End If
              If l < 0 Then
                If Abs(l) > .body / 10# Then
                  If .body > 0 Then l = Abs(.body) / -10#    'fixes maximum energy drain proportional to body
                Else
                  l = 0
                End If
                
                If Abs(l) > rob(.Ties(k).pnt).body Then
                  If rob(.Ties(k).pnt).body > 0 Then
                    l = (rob(.Ties(k).pnt).body) * -1 'limits body taken from tied robot
                  Else
                    l = 0 ' Bot has no body to give.
                  End If
                End If
                ptag = Abs(l / 4)
                If rob(.Ties(k).pnt).poison > ptag Then 'target robot has poison
                  If rob(.Ties(k).pnt).FName <> .FName Then 'can't poison your brother
                    .Poisoned = True
                    .Poisoncount = .Poisoncount + ptag
                    If .Poisoncount > 32000 Then .Poisoncount = 32000
                    l = 0
                    rob(.Ties(k).pnt).poison = rob(.Ties(k).pnt).poison - ptag
                    rob(.Ties(k).pnt).mem(827) = rob(.Ties(k).pnt).poison
                    If rob(.Ties(k).pnt).mem(834) > 0 Then
                      .Ploc = ((rob(.Ties(k).pnt).mem(834) - 1) Mod 1000) + 1  'sets .Ploc to targets .mem(ploc) EricL - 3/29/2006 Added Mod to fix overflow
                    Else
                      .Ploc = Random(1, 1000)
                    End If
                  End If
                End If
                rob(.Ties(k).pnt).body = rob(.Ties(k).pnt).body + l 'tied robot loses energy.
                'If rob(.Ties(k).pnt).nrg = 0 Then rob(.Ties(k).pnt).nrg = -100 'ensures that robots with nrg = 0 actually die
                'If rob(.Ties(k).pnt).nrg < 0 And rob(.Ties(k).pnt).Dead = False Then
                '  rob(.Ties(k).pnt).Dead = True
                '  .Kills = .Kills + 1
                '  If .Kills > 32000 Then .Kills = 32000
                '  .mem(220) = .Kills
                'End If
                .nrg = .nrg - l * 1#  'tying robot receives energy
                .body = .body - l * 0.89 'tying robot stores some fat
                .Waste = .Waste - l * 0.001
                If .body > 32000 Then .body = 32000
                If .nrg > 32000 Then .nrg = 32000
                .radius = FindRadius(.body)
              End If
              
              If Not .Ties(k).back Then   'forward ties
                .Ties(k).nrgused = True   'red ties
              Else                        'backward ties
                rob(.Ties(k).pnt).Ties(.Ties(k).ptt).nrgused = True 'red ties
              End If
            End If
            k = k + 1
          Wend
        End If
        
        .mem(tp + 2) = 0
        .mem(tp + 3) = 0
      End If
    End If
    .mem(tp + 5) = 0 ' .tienum should be reset every cycle
  End With
End Sub
Public Sub readtie(t As Integer)
'reads all of the tref variables from a given tie number
  Dim k As Integer
  Dim tn As Integer
  Dim counter
 
  With rob(t)
    If .Numties = 0 Then
      ' Zero out the trefvars as all ties have gone.  Perf -> Could set a flag to not do this everytime
      For counter = 456 To 465
         .mem(counter) = 0
      Next counter
      .mem(472) = 0   'Trefbody
      .mem(475) = 0   'tmemval
     ' .mem(476) = 0   'tmemloc EricL 4/20/2006 Commented out.  Should persist even when tie goes away or no tienum is specified
      .mem(478) = 0   'treffixed
      For counter = 0 To 10 'For trefvelX functions. New from Numsgil
        .mem(trefxpos + counter) = 0
      Next counter
      Exit Sub
    Else
      ' If there is a value in .readtie then get the trefvars from that tie else read the trefvars from the last tie created
      If .mem(471) <> 0 Then
        tn = .mem(471) ' .readtie
      Else
        tn = .mem(454) ' .tiepres
      End If
      k = 1
      While .Ties(k).pnt > 0
        If .Ties(k).Port = tn Then
          ReadTRefVars t, k
          Exit Sub
        End If
        k = k + 1
      Wend
    End If
  End With
End Sub

'EricL 4/20/2006  This was the heart of readtie.  Seperated it out so Trefvars can be loaded when tie is formed.
'Reads the Tie Refvars for tie k into the mem of bot t
Public Sub ReadTRefVars(t As Integer, k As Integer)
  Dim l As Integer ' just a loop counter
  With rob(t)
    If rob(.Ties(k).pnt).nrg < 32000 And rob(.Ties(k).pnt).nrg > -32000 Then
      .mem(464) = CInt(rob(.Ties(k).pnt).nrg) 'copies tied robot's energy into memory cell *trefnrg
    End If
    If rob(.Ties(k).pnt).age < 32000 Then
      .mem(465) = rob(.Ties(k).pnt).age + 1 'copies age of tied robot into *refvar
    Else
      .mem(465) = 32000
    End If
    If rob(.Ties(k).pnt).body < 32000 And rob(.Ties(k).pnt).body > -32000 Then
      .mem(trefbody) = CInt(rob(.Ties(k).pnt).body)  'copies tied robot's body value
    Else
      .mem(trefbody) = 32000
    End If
    For l = 1 To 8    'copies all ref vars from tied robot
      .mem(455 + l) = rob(.Ties(k).pnt).occurr(l)
    Next l
    If .mem(476) > 0 And .mem(476) <= 1000 Then   'tmemval and tmemloc couple used to read a specific memory value from tied robot.
      .mem(475) = rob(.Ties(k).pnt).mem(.mem(476))
      If .mem(479) > EyeStart And .mem(479) < EyeEnd Then
        rob(.Ties(k).pnt).View = True
      End If
    End If
    If rob(.Ties(k).pnt).Fixed Then
      .mem(478) = 1
    Else
      .mem(478) = 0
    End If
    .mem(479) = CInt(rob(.Ties(k).pnt).aim)
    .mem(trefxpos) = rob(.Ties(k).pnt).mem(219)
    .mem(trefypos) = rob(.Ties(k).pnt).mem(217)
    .mem(trefvelyourup) = rob(.Ties(k).pnt).mem(velup)
    .mem(trefvelyourdn) = rob(.Ties(k).pnt).mem(veldn)
    .mem(trefvelyoursx) = rob(.Ties(k).pnt).mem(velsx)
    .mem(trefvelyourdx) = rob(.Ties(k).pnt).mem(veldx)
                
    .mem(trefvelmyup) = rob(.Ties(k).pnt).vel.x * Cos(.aim) + Sin(.aim) * rob(.Ties(k).pnt).vel.y * -1 - .mem(velup) 'gives velocity from mybots frame of reference
    .mem(trefvelmydn) = .mem(trefvelmyup) * -1
    .mem(trefvelmydx) = rob(.Ties(k).pnt).vel.y * Cos(.aim) + Sin(.aim) * rob(.Ties(k).pnt).vel.x - .mem(veldx)
    .mem(trefvelmysx) = .mem(trefvelmydx) * -1
    .mem(trefvelscalar) = rob(.Ties(k).pnt).mem(velscalar)
  '  .mem(trefbody) = rob(.Ties(k).pnt).body
    .mem(trefshell) = rob(.Ties(k).pnt).shell
  End With
End Sub

' deletes all ties of a robot a
Public Sub delallties(a As Integer)
  Dim i As Integer
  i = 1
  While rob(a).Ties(1).pnt > 0 And i <= 10
    deltie a, rob(a).Ties(1).pnt
    i = i + 1
  Wend
End Sub

' deletes a tie between robots a and b
Public Sub deltie(ByVal a As Integer, ByVal b As Integer)
  Dim k As Integer
  Dim j As Integer
  Dim t As Integer
  k = 1
  j = 1
  
  While rob(a).Ties(k).pnt <> b And k < 10
    k = k + 1
  Wend
  
  While rob(b).Ties(j).pnt <> a And j < 10
    j = j + 1
  Wend
  
  For t = k To 9
    rob(a).Ties(t) = rob(a).Ties(t + 1)
  Next t
  
  rob(a).Ties(10).pnt = 0
  
  For t = j To 9
    rob(b).Ties(t) = rob(b).Ties(t + 1)
  Next t
  
  rob(b).Ties(10).pnt = 0
End Sub

'
' T I E S
'

' creates a tie between rob a and b,of len c, lasting last cycles
' (or waiting -last cycles before consolidating)
' tie is addressed with index mem (putting mem in .tienum)
Public Function maketie(ByVal a As Integer, ByVal b As Integer, c As Long, last As Integer, mem As Integer) As Boolean
'returns true on success
'Ties and slime need to be reworked at some point
  Dim k As Integer
  Dim j As Integer
  Dim OK As Boolean
  Dim Max As Integer
  Dim deflect As Integer
  Dim length As Long
  Dim deletedtie As Boolean
  
  maketie = False
  
  If rob(a).exist = False Or rob(b).exist = False Then Exit Function
  
  'If rob(b).Corpse = True Or rob(a).Corpse = True Then Exit Function
  deflect = Random(2, 92) 'random number which allows for the effect of slime on the target robot. If slime is greater then no tie is formed
  Max = 10
  OK = True
  k = 1
  j = 1
  
  length = VectorMagnitude(VectorSub(rob(a).pos, rob(b).pos))
    
  If length <= c * 1.5 Then 'And deflect > rob(b).slime Then
    If deflect < rob(b).Slime Then OK = False  'should stop ties forming when slime is high
    
    If OK = True Then deltie a, b
    
    While rob(a).Ties(k).pnt > 0 And k <= Max And OK
      k = k + 1
    Wend
    While rob(b).Ties(j).pnt > 0 And j <= Max And OK
      j = j + 1
    Wend
    
    If k < Max And j < Max And OK Then
      rob(a).Ties(k).pnt = b
      rob(a).Ties(k).ptt = j
      rob(a).Ties(k).NaturalLength = length
      rob(a).Ties(k).stat = False
      rob(a).Ties(k).last = last
      rob(a).Ties(k).Port = mem
      rob(a).Ties(k).back = False
      rob(a).Numties = rob(a).Numties + 1
      rob(a).mem(466) = rob(a).mem(466) + 1 'EricL 3/22/2006 Increment numties in the bot's memory
      rob(a).mem(tiepres) = mem
      ReadTRefVars a, k ' EricL 4./20/2006  Load up the trefvars for the bot that created the tie.
      
      'EricL 5/7/2006 All ties are springs when first created
      rob(a).Ties(k).b = 0.01
      rob(a).Ties(k).k = 0.005
      rob(a).Ties(k).type = 0
          
      rob(b).Ties(j).pnt = a
      rob(b).Ties(j).ptt = k
      rob(b).Ties(j).NaturalLength = length
      rob(b).Ties(j).stat = False
      rob(b).Ties(j).last = last
      rob(b).Ties(j).Port = mem
      rob(b).Ties(j).back = True
      rob(b).Numties = rob(b).Numties + 1
      rob(b).mem(466) = rob(b).mem(466) + 1 'EricL 3/22/2006 Increment numties in the bot's memory
      rob(a).mem(tiepres) = mem
      
      'EricL 5/7/2006 All ties are springs when first created
      rob(b).Ties(j).b = 0.01
      rob(b).Ties(j).k = 0.005
      rob(b).Ties(k).type = 0
    End If
  End If
  
  If rob(b).Slime > 0 Then rob(b).Slime = rob(b).Slime - 20
  If rob(b).Slime < 0 Then rob(b).Slime = 0 'cost to slime layer when attacked
  rob(a).nrg = rob(a).nrg - (SimOpts.Costs(TIECOST) * SimOpts.Costs(COSTMULTIPLIER)) / (rob(a).Numties + 1) 'Tie cost to form tie
'  EnergyLostPerCycle = EnergyLostPerCycle - SimOpts.Costs(TIECOST) / (rob(a).Numties + 1)
End Function

' searches a tie in rob t pointing to rob p
' returns tie number (j) of the tie pointing to the specified robot
Public Function srctie(t As Integer, P As Integer) As Integer
  Dim j As Integer
  j = 1
  srctie = 0
  With rob(t)
  While .Ties(j).pnt > 0 And srctie = 0
    If .Ties(j).pnt = P And .Ties(j).last < 1 Then
      srctie = j
    End If
    j = j + 1
  Wend
  End With
End Function

'fixes tie angle and length at whatever it currently is
Public Sub regang(t As Integer, j As Integer)
  Dim n As Integer
  Dim angl As Single
  Dim dist As Single
  With rob(t)
      .Multibot = True: .mem(multi) = 1
      .Ties(j).b = 0.1 ' was 0.1
      .Ties(j).k = 0.05 ' was 0.05
      .Ties(j).type = 3
      n = .Ties(j).pnt
      angl = angle(.pos.x, .pos.y, rob(n).pos.x, rob(n).pos.y)
    '  angl = angnorm(angl)
      dist = Sqr((.pos.x - rob(n).pos.x) ^ 2 + (.pos.y - rob(n).pos.y) ^ 2)
      If .Ties(j).back = False Then
        .Ties(j).ang = AngDiff(angnorm(angl), angnorm(rob(t).aim)) ' only fix the angle of the bot that created the tie
        .Ties(j).angreg = True
      End If
      .Ties(j).NaturalLength = dist
      'If .Ties(j).NaturalLength < 200 Then .Ties(j).NaturalLength = 200
   '   If .mem(468) <> 32000 Then 'And .mem(468) <> 0 Then          'replaces .ang calculated value with .fixang value
   '     If .mem(468) > 628 Then .mem(468) = 628
   '     If .mem(468) < -628 Then .mem(468) = -628
   '     .Ties(j).ang = .mem(468) / 200 'should it be 100 or 200?
   '   End If
   '   If .mem(469) <> 0 Then            'replaces .ln with .fixlen value
   '    .Ties(j).NaturalLength = .mem(469)
   '   End If
    '  .Ties(j).angreg = True
      '.mem(10) = .Ties(j).ang       'temporary test locations
      '.mem(11) = .Ties(j).ln
  End With
End Sub

' bends a tie
Public Sub bend(t As Integer, lnk As Integer, ang As Integer)
  Dim an As Single
  If Abs(ang) > 100 Then ang = 100 * Sgn(ang)
  an = ang / 100
  With rob(t).Ties(lnk)
    .bend = an
    rob(.pnt).Ties(.ptt).bend = -an
  End With
  ang = 0
End Sub

' shrinks a tie
Public Sub shrink(t As Integer, lnk As Integer, ln As Integer)
  If Abs(ln) > 100 Then ln = 1000 * Sgn(ln) ' EricL 5/7/2006 Changed from 100 to 1000
  With rob(t).Ties(lnk)
    .shrink = ln
    rob(.pnt).Ties(.ptt).shrink = ln
  End With
  ln = 0
End Sub
