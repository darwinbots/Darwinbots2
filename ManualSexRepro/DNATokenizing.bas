Attribute VB_Name = "DNATokenizing"
Option Explicit

'''''''''''''''''''''''''''''''''''''''''''''''
'Public stuff
'''''''''''''''''''''''''''''''''''''''''''''''

Public Type block
  tipo As Integer
  value As Integer
End Type

Public Type var
  Name As String
  value As Integer
End Type

Public Type Robot
  DNA() As block
  vars(1000) As var
  vnum As Integer           '| about private variables
  maxusedvars As Integer    '|
  usedvars(1000) As Integer '| used memory cells
End Type

Public rob(3) As Robot
Public sysvar(1000) As var    ' array of system variables
Const Maxmem = 1000


'''''''''''''''''''''''''''''''''''''''''''''''
'All the routines that tokenize and detokenize
'DNA go in here
'''''''''''''''''''''''''''''''''''''''''''''''

' parses dna code, tokenizing or detokenizing instructions in the block
' structure
' types:
' 0 = number
' 1 = *number
' 2 = basic command
' 3 = advanced command
' 4 = bitwise command
' 5 = conditions
' 6 = logic
' 7 = stores
' 8 = Empty
' 9 = flow
' 10= Master flow
'
' if the string it's passed is "", then it will
' detokenize the command sent to it via bp and store in into command
'
' if the string it's passed isn't empty, then it will
' tokenize the string into the bp block.  If the command isn't
' recognized then it inserts 0.0 (that is, the number 0)
'
' this is all done byref, so be sure to understand that your variables
' WILL change after going through this subfunction.  Be sure to save any
' data you don't want modified elsewhere
Public Sub Parse(ByRef Command As String, ByRef bp As block, Optional n As Integer = 0, Optional converttosysvar As Boolean = True)
  Dim detok As Boolean
  detok = IIf(Command = "", True, False)
  
  If detok Then
    Select Case bp.tipo
      Case 0 'number
        If converttosysvar = True Then
          Command = SysvarDetok(bp.value, n)
        Else
          Command = bp.value
        End If
      Case 1 '*.number
        Command = "*" + SysvarDetok(bp.value, n)
      Case 2 'basic commands
        Command = BasicCommandDetok(bp.value)
      Case 3 'advanced commands
        Command = AdvancedCommandDetok(bp.value)
      Case 4 'bit commands
        Command = BitwiseCommandDetok(bp.value)
      Case 5 'conditions
        Command = ConditionsDetok(bp.value)
      Case 6 'logic
        Command = LogicDetok(bp.value)
      Case 7 'stores
        Command = StoresDetok(bp.value)
      Case 8
        'nothing
      Case 9
        Command = FlowDetok(bp.value)
      Case 10
        Command = MasterFlowDetok(bp.value)
    End Select
  Else
    bp.value = 0
    
    'Botsareus 11/27/2013 Automatically lower case var
    If bp.value = 0 Then bp = BasicCommandTok(LCase(Command))
    If bp.value = 0 Then bp = AdvancedCommandTok(LCase(Command))
    If bp.value = 0 Then bp = BitwiseCommandTok(LCase(Command))
    If bp.value = 0 Then bp = ConditionsTok(LCase(Command))
    If bp.value = 0 Then bp = LogicTok(LCase(Command))
    If bp.value = 0 Then bp = StoresTok(LCase(Command))
    If bp.value = 0 Then bp = FlowTok(LCase(Command))
    If bp.value = 0 Then bp = MasterFlowTok(LCase(Command))
    If bp.value = 0 And Left(Command, 1) = "*" Then
      bp.tipo = 1
      bp.value = SysvarTok(Right(Command, Len(Command) - 1), n)
    ElseIf bp.value = 0 Then
      bp.tipo = 0
      bp.value = SysvarTok(Command, n)
    End If
  End If
End Sub

Public Function SysvarDetok(n As Integer, Optional robn As Integer = 0) As String
  Dim t As Integer
  
  SysvarDetok = n
  
  While sysvar(t + 1).value <> 0
    If sysvar(t + 1).value = Abs(n) Mod Maxmem Then
        SysvarDetok = "." + sysvar(t + 1).Name
    End If
    t = t + 1
  Wend
  
End Function

Public Function SysvarTok(a As String, Optional n As Integer = 0) As Integer
  Dim t As Integer
  
  If Left(a, 1) = "." Then
    a = Right(a, Len(a) - 1)
        
    For t = 1 To UBound(sysvar)
      If LCase(sysvar(t).Name) = LCase(a) Then SysvarTok = sysvar(t).value
    Next t
    
    If n > 0 Then
      For t = 0 To UBound(rob(n).vars)
        If rob(n).vars(t).Name = a Then SysvarTok = rob(n).vars(t).value
      Next t
    End If
  Else
    SysvarTok = Val(a)
  End If
End Function

Private Function BasicCommandDetok(n As Integer) As String
  BasicCommandDetok = ""
  Select Case n
    Case 1
      BasicCommandDetok = "add"
    Case 2
      BasicCommandDetok = "sub"
    Case 3
      BasicCommandDetok = "mult"
    Case 4
      BasicCommandDetok = "div"
    Case 5
      BasicCommandDetok = "rnd"
    Case 6
      BasicCommandDetok = "*"
    Case 7
      BasicCommandDetok = "mod"
    Case 8
      BasicCommandDetok = "sgn"
    Case 9
      BasicCommandDetok = "abs"
    Case 10
      BasicCommandDetok = "dup"
    Case 11
      BasicCommandDetok = "drop"
    Case 12
      BasicCommandDetok = "clear"
    Case 13
      BasicCommandDetok = "swap"
    Case 14
      BasicCommandDetok = "over"
  End Select
End Function

Private Function BasicCommandTok(s As String) As block
  BasicCommandTok.value = 0
  BasicCommandTok.tipo = 2
  Select Case s
    Case "add"
      BasicCommandTok.value = 1
    Case "sub"
      BasicCommandTok.value = 2
    Case "mult"
      BasicCommandTok.value = 3
    Case "div"
      BasicCommandTok.value = 4
    Case "rnd"
      BasicCommandTok.value = 5
    Case "*"
      BasicCommandTok.value = 6
    Case "mod"
      BasicCommandTok.value = 7
    Case "sgn"
      BasicCommandTok.value = 8
    Case "abs"
      BasicCommandTok.value = 9
    Case "dup"
      BasicCommandTok.value = 10
    Case "dupint"
      BasicCommandTok.value = 10
    Case "drop"
      BasicCommandTok.value = 11
    Case "dropint"
      BasicCommandTok.value = 11
    Case "clear"
      BasicCommandTok.value = 12
    Case "clearint"
      BasicCommandTok.value = 12
    Case "swap"
      BasicCommandTok.value = 13
    Case "swapint"
      BasicCommandTok.value = 13
    Case "over"
      BasicCommandTok.value = 14
    Case "overint"
      BasicCommandTok.value = 14
  End Select
End Function

Private Function AdvancedCommandDetok(n As Integer) As String
  AdvancedCommandDetok = ""
  Select Case n
    Case 1
      AdvancedCommandDetok = "angle"
    Case 2
      AdvancedCommandDetok = "dist"
    Case 3
      AdvancedCommandDetok = "ceil"
    Case 4
      AdvancedCommandDetok = "floor"
    Case 5
      AdvancedCommandDetok = "sqr"
    Case 6
      AdvancedCommandDetok = "pow"
    Case 7
      AdvancedCommandDetok = "pyth"
    Case 8
      AdvancedCommandDetok = "anglecmp"
    Case 9
      AdvancedCommandDetok = "root"
    Case 10
      AdvancedCommandDetok = "logx"
    Case 11
      AdvancedCommandDetok = "sin"
    Case 12
      AdvancedCommandDetok = "cos"
    Case 13
      AdvancedCommandDetok = "debugint" 'Botsareus 1/31/2013 the new debugint command
    Case 14
      AdvancedCommandDetok = "debugbool" 'Botsareus 1/31/2013 the new debugbool command
  End Select
End Function

Private Function AdvancedCommandTok(s As String) As block
  AdvancedCommandTok.value = 0
  AdvancedCommandTok.tipo = 3
  Select Case s
    Case "angle"
      AdvancedCommandTok.value = 1
    Case "dist"
      AdvancedCommandTok.value = 2
    Case "ceil"
      AdvancedCommandTok.value = 3
    Case "floor"
      AdvancedCommandTok.value = 4
    Case "sqr"
      AdvancedCommandTok.value = 5
    Case "pow"
      AdvancedCommandTok.value = 6
    Case "pyth"
      AdvancedCommandTok.value = 7
    Case "anglecmp"
      AdvancedCommandTok.value = 8
    Case "root"
      AdvancedCommandTok.value = 9
    Case "logx"
      AdvancedCommandTok.value = 10
    Case "sin"
      AdvancedCommandTok.value = 11
    Case "cos"
      AdvancedCommandTok.value = 12
    Case "debugint" 'Botsareus 1/31/2013 the new debugint command
      AdvancedCommandTok.value = 13
    Case "debugbool" 'Botsareus 1/31/2013 the new debugbool command
      AdvancedCommandTok.value = 14
  End Select
End Function

Private Function BitwiseCommandDetok(n As Integer) As String
  BitwiseCommandDetok = ""
  Select Case n
    Case 1
      BitwiseCommandDetok = "~" 'bitwise compliment
    Case 2
      BitwiseCommandDetok = "&" 'bitwise AND
    Case 3
      BitwiseCommandDetok = "|" 'bitwise OR
    Case 4
      BitwiseCommandDetok = "^" 'bitwise XOR
    Case 5
      BitwiseCommandDetok = "++"
    Case 6
      BitwiseCommandDetok = "--"
    Case 7
      BitwiseCommandDetok = "-"
    Case 8
      BitwiseCommandDetok = "<<" 'bit shift left
    Case 9
      BitwiseCommandDetok = ">>" 'bit shift right
  End Select
End Function

Private Function BitwiseCommandTok(s As String) As block
  BitwiseCommandTok.value = 0
  BitwiseCommandTok.tipo = 4
  Select Case s
    Case "~"
      BitwiseCommandTok.value = 1
    Case "&"
      BitwiseCommandTok.value = 2
    Case "|"
      BitwiseCommandTok.value = 3
    Case "^"
      BitwiseCommandTok.value = 4
    Case "++"
      BitwiseCommandTok.value = 5
    Case "--"
      BitwiseCommandTok.value = 6
    Case "-"
      BitwiseCommandTok.value = 7
    Case "<<"
      BitwiseCommandTok.value = 8
    Case ">>"
      BitwiseCommandTok.value = 9
  End Select
End Function

Private Function ConditionsDetok(n As Integer) As String
  ConditionsDetok = ""
  Select Case n
    Case 1
      ConditionsDetok = "<"
    Case 2
      ConditionsDetok = ">"
    Case 3
      ConditionsDetok = "="
    Case 4
      ConditionsDetok = "!="
    Case 5
      ConditionsDetok = "%="
    Case 6
      ConditionsDetok = "!%="
    Case 7
      ConditionsDetok = "~="
    Case 8
      ConditionsDetok = "!~="
    Case 9
      ConditionsDetok = ">="
    Case 10
      ConditionsDetok = "<="
  End Select
End Function

Private Function ConditionsTok(s As String) As block
  ConditionsTok.value = 0
  ConditionsTok.tipo = 5
  Select Case s
    Case "<"
      ConditionsTok.value = 1
    Case ">"
      ConditionsTok.value = 2
    Case "="
      ConditionsTok.value = 3
    Case "!="
      ConditionsTok.value = 4
    Case "%="
      ConditionsTok.value = 5
    Case "!%="
      ConditionsTok.value = 6
    Case "~="
      ConditionsTok.value = 7
    Case "!~="
      ConditionsTok.value = 8
    Case ">="
      ConditionsTok.value = 9
    Case "<="
      ConditionsTok.value = 10
  End Select
End Function

Private Function LogicDetok(n As Integer) As String
  LogicDetok = ""
  Select Case n
    Case 1
      LogicDetok = "and"
    Case 2
      LogicDetok = "or"
    Case 3
      LogicDetok = "xor"
    Case 4
      LogicDetok = "not"
    Case 5
      LogicDetok = "true"
    Case 6
      LogicDetok = "false"
    Case 7
      LogicDetok = "dropbool"
    Case 8
      LogicDetok = "clearbool"
    Case 9
      LogicDetok = "dupbool"
    Case 10
      LogicDetok = "swapbool"
    Case 11
      LogicDetok = "overbool"
  End Select
End Function

Private Function LogicTok(s As String) As block
  LogicTok.value = 0
  LogicTok.tipo = 6
  Select Case s
    Case "and"
      LogicTok.value = 1
    Case "or"
      LogicTok.value = 2
    Case "xor"
      LogicTok.value = 3
    Case "not"
      LogicTok.value = 4
    Case "true"
      LogicTok.value = 5
    Case "false"
      LogicTok.value = 6
    Case "dropbool"
      LogicTok.value = 7
    Case "clearbool"
      LogicTok.value = 8
    Case "dupbool"
      LogicTok.value = 9
    Case "swapbool"
      LogicTok.value = 10
    Case "overbool"
      LogicTok.value = 11
  End Select
End Function

Private Function StoresDetok(n As Integer) As String
  StoresDetok = ""
  Select Case n
    Case 1
      StoresDetok = "store"
    Case 2
      StoresDetok = "inc"
    Case 3
      StoresDetok = "dec"
    Case 4 'Botsareus 9/7/2013 New dna commands
      StoresDetok = "addstore"
    Case 5
      StoresDetok = "substore"
    Case 6
      StoresDetok = "multstore"
    Case 7
      StoresDetok = "divstore"
    Case 8
      StoresDetok = "ceilstore"
    Case 9
      StoresDetok = "floorstore"
    Case 10
      StoresDetok = "rndstore"
    Case 11
      StoresDetok = "sgnstore"
    Case 12
      StoresDetok = "absstore"
    Case 13
      StoresDetok = "sqrstore"
    Case 14
      StoresDetok = "negstore"
  End Select
End Function

Private Function StoresTok(s As String) As block
  StoresTok.value = 0
  StoresTok.tipo = 7
  Select Case s
    Case "store"
      StoresTok.value = 1
    Case "inc"
      StoresTok.value = 2
    Case "dec"
      StoresTok.value = 3
    Case "addstore" 'Botsareus 9/7/2013 New dna commands
      StoresTok.value = 4
    Case "substore"
      StoresTok.value = 5
    Case "multstore"
      StoresTok.value = 6
    Case "divstore"
      StoresTok.value = 7
    Case "ceilstore"
      StoresTok.value = 8
    Case "floorstore"
      StoresTok.value = 9
    Case "rndstore"
      StoresTok.value = 10
    Case "sgnstore"
      StoresTok.value = 11
    Case "absstore"
      StoresTok.value = 12
    Case "sqrstore"
      StoresTok.value = 13
    Case "negstore"
      StoresTok.value = 14
  End Select
End Function

Private Function FlowDetok(n As Integer) As String
  FlowDetok = ""
  Select Case n
    Case 1
      FlowDetok = "cond"
    Case 2
      FlowDetok = "start"
    Case 3
      FlowDetok = "else"
    Case 4
      FlowDetok = "stop"
 '   Case 5
 '     FlowDetok = "cross"
  End Select
End Function

Private Function FlowTok(s As String) As block
  FlowTok.value = 0
  FlowTok.tipo = 9
  Select Case s
    Case "cond"
      FlowTok.value = 1
    Case "start"
      FlowTok.value = 2
    Case "else"
      FlowTok.value = 3
    Case "stop"
      FlowTok.value = 4
 '   Case "cross"
  '    FlowTok.value = 5
  End Select
End Function

Private Function MasterFlowDetok(n As Integer) As String
  MasterFlowDetok = ""
  Select Case n
    Case 1
      MasterFlowDetok = "end"
  End Select
End Function

Private Function MasterFlowTok(s As String) As block
  MasterFlowTok.tipo = 10
  Select Case s
    Case "end"
      MasterFlowTok.value = 1
  End Select
End Function
' calculates the hash function, i.e. simply a string of length f
' which is unlikely to be generated by a different input s
Public Function Hash(s As String, f As Integer) As String

  Dim buf(100) As Long
  Dim k As Integer
  Dim s2 As String
  Hash = ""
  s = Trim(s)
  
  While Right(s, 2) = vbCrLf
    s = Left(s, Len(s) - 2)
  Wend
   
  For k = 0 To f
    buf(k) = 0
  Next k
  For k = 1 To Len(s)
    buf(k Mod f) = buf(k Mod f) + Asc(Mid(s, k, 1))
    buf(k Mod f) = buf(k Mod f) + buf((k - 1) Mod f)
    buf(k Mod f) = buf(k Mod f) Mod 100
  Next k
  For k = 0 To f - 1
    Hash = Hash + Chr(buf(k) Mod 93 + 33)

  Next k
End Function

' loads the sysvars.txt file
Public Sub LoadSysVars()
    
  sysvar(1).Name = "up"
  sysvar(1).value = 1
  sysvar(2).Name = "dn"
  sysvar(2).value = 2
  sysvar(3).Name = "sx"
  sysvar(3).value = 3
  sysvar(4).Name = "dx"
  sysvar(4).value = 4
  sysvar(5).Name = "aimdx"
  sysvar(5).value = 5
  sysvar(6).Name = "aimright"
  sysvar(6).value = 5
  sysvar(7).Name = "aimsx"
  sysvar(7).value = 6
  sysvar(8).Name = "aimleft"
  sysvar(8).value = 6
  sysvar(9).Name = "shoot"
  sysvar(9).value = 7
  sysvar(10).Name = "shootval"
  sysvar(10).value = 8
  sysvar(11).Name = "robage"
  sysvar(11).value = 9
  sysvar(12).Name = "mass"
  sysvar(12).value = 10
  sysvar(13).Name = "maxvel"
  sysvar(13).value = 11
  sysvar(14).Name = "timer"
  sysvar(14).value = 12
  sysvar(15).Name = "aim"
  sysvar(15).value = 18
  sysvar(16).Name = "setaim"
  sysvar(16).value = 19
  sysvar(17).Name = "bodgain"
  sysvar(17).value = 194
  sysvar(18).Name = "bodloss"
  sysvar(18).value = 195
  sysvar(19).Name = "velscalar"
  sysvar(19).value = 196
  sysvar(20).Name = "velsx"
  sysvar(20).value = 197
  sysvar(21).Name = "veldx"
  sysvar(21).value = 198
  sysvar(22).Name = "veldn"
  sysvar(22).value = 199
  sysvar(23).Name = "velup"
  sysvar(23).value = 200
  sysvar(24).Name = "vel"
  sysvar(24).value = 200
  sysvar(25).Name = "hit"
  sysvar(25).value = 201
  sysvar(26).Name = "shflav"
  sysvar(26).value = 202
  sysvar(27).Name = "pain"
  sysvar(27).value = 203
  sysvar(28).Name = "pleas"
  sysvar(28).value = 204
  sysvar(29).Name = "hitup"
  sysvar(29).value = 205
  sysvar(30).Name = "hitdn"
  sysvar(30).value = 206
  sysvar(31).Name = "hitdx"
  sysvar(31).value = 207
  sysvar(32).Name = "hitsx"
  sysvar(32).value = 208
  sysvar(33).Name = "shang"
  sysvar(33).value = 209
  sysvar(34).Name = "shup"
  sysvar(34).value = 210
  sysvar(35).Name = "shdn"
  sysvar(35).value = 211
  sysvar(36).Name = "shdx"
  sysvar(36).value = 212
  sysvar(37).Name = "shsx"
  sysvar(37).value = 213
  sysvar(38).Name = "edge"
  sysvar(38).value = 214
  sysvar(39).Name = "fixed"
  sysvar(39).value = 215
  sysvar(40).Name = "fixpos"
  sysvar(40).value = 216
  sysvar(41).Name = "depth"
  sysvar(41).value = 217
  sysvar(42).Name = "ypos"
  sysvar(42).value = 217
  sysvar(43).Name = "daytime"
  sysvar(43).value = 218
  sysvar(44).Name = "xpos"
  sysvar(44).value = 219
  sysvar(45).Name = "kills"
  sysvar(45).value = 220
  sysvar(46).Name = "hitang"
  sysvar(46).value = 221
  sysvar(47).Name = "repro"
  sysvar(47).value = 300
  sysvar(48).Name = "mrepro"
  sysvar(48).value = 301
  sysvar(49).Name = "sexrepro"
  sysvar(49).value = 302
  sysvar(50).Name = "nrg"
  sysvar(50).value = 310
  sysvar(51).Name = "body"
  sysvar(51).value = 311
  sysvar(52).Name = "fdbody"
  sysvar(52).value = 312
  sysvar(53).Name = "strbody"
  sysvar(53).value = 313
  sysvar(54).Name = "setboy"
  sysvar(54).value = 314
  sysvar(55).Name = "rdboy"
  sysvar(55).value = 315
  sysvar(56).Name = "tie"
  sysvar(56).value = 330
  sysvar(57).Name = "stifftie"
  sysvar(57).value = 331
  sysvar(58).Name = "mkvirus"
  sysvar(58).value = 335
  sysvar(59).Name = "dnalen"
  sysvar(59).value = 336
  sysvar(60).Name = "vtimer"
  sysvar(60).value = 337
  sysvar(61).Name = "vshoot"
  sysvar(61).value = 338
  sysvar(62).Name = "genes"
  sysvar(62).value = 339
  sysvar(63).Name = "delgene"
  sysvar(63).value = 340
  sysvar(64).Name = "thisgene"
  sysvar(64).value = 341
  sysvar(65).Name = "sun"
  sysvar(65).value = 400
  sysvar(66).Name = "trefbody"
  sysvar(66).value = 437
  sysvar(67).Name = "trefxpos"
  sysvar(67).value = 438
  sysvar(68).Name = "trefypos"
  sysvar(68).value = 439
  sysvar(69).Name = "trefvelmysx"
  sysvar(69).value = 440
  sysvar(70).Name = "trefvelmydx"
  sysvar(70).value = 441
  sysvar(71).Name = "trefvelmydn"
  sysvar(71).value = 442
  sysvar(72).Name = "trefvelmyup"
  sysvar(72).value = 443
  sysvar(73).Name = "trefvelscalar"
  sysvar(73).value = 444
  sysvar(74).Name = "trefvelyoursx"
  sysvar(74).value = 445
  sysvar(75).Name = "trefvelyourdx"
  sysvar(75).value = 446
  sysvar(76).Name = "trefvelyourdn"
  sysvar(76).value = 447
  sysvar(77).Name = "trefvelyourup"
  sysvar(77).value = 448
  sysvar(78).Name = "trefshell"
  sysvar(78).value = 449
  sysvar(79).Name = "tieang"
  sysvar(79).value = 450
  sysvar(80).Name = "tielen"
  sysvar(80).value = 451
  sysvar(81).Name = "tieloc"
  sysvar(81).value = 452
  sysvar(82).Name = "tieval"
  sysvar(82).value = 453
  sysvar(83).Name = "tiepres"
  sysvar(83).value = 454
  sysvar(84).Name = "tienum"
  sysvar(84).value = 455
  sysvar(85).Name = "trefup"
  sysvar(85).value = 456
  sysvar(86).Name = "trefdn"
  sysvar(86).value = 457
  sysvar(87).Name = "trefsx"
  sysvar(87).value = 458
  sysvar(88).Name = "trefdx"
  sysvar(88).value = 459
  sysvar(89).Name = "trefaimdx"
  sysvar(89).value = 460
  sysvar(90).Name = "trefaimsx"
  sysvar(90).value = 461
  sysvar(91).Name = "trefshoot"
  sysvar(91).value = 462
  sysvar(92).Name = "trefeye"
  sysvar(92).value = 463
  sysvar(93).Name = "trefnrg"
  sysvar(93).value = 464
  sysvar(94).Name = "trefage"
  sysvar(94).value = 465
  sysvar(95).Name = "numties"
  sysvar(95).value = 466
  sysvar(96).Name = "deltie"
  sysvar(96).value = 467
  sysvar(97).Name = "fixang"
  sysvar(97).value = 468
  sysvar(98).Name = "fixlen"
  sysvar(98).value = 469
  sysvar(99).Name = "multi"
  sysvar(99).value = 470
  sysvar(100).Name = "readtie"
  sysvar(100).value = 471
  sysvar(101).Name = "fertilized"
  sysvar(101).value = 303
  sysvar(102).Name = "memval"
  sysvar(102).value = 473
  sysvar(103).Name = "memloc"
  sysvar(103).value = 474
  sysvar(104).Name = "tmemval"
  sysvar(104).value = 475
  sysvar(105).Name = "tmemloc"
  sysvar(105).value = 476
  sysvar(106).Name = "reffixed"
  sysvar(106).value = 477
  sysvar(107).Name = "treffixed"
  sysvar(107).value = 478
  sysvar(108).Name = "trefaim"
  sysvar(108).value = 479
  sysvar(109).Name = "tieang1"
  sysvar(109).value = 480
  sysvar(110).Name = "tieang2"
  sysvar(110).value = 481
  sysvar(111).Name = "tieang3"
  sysvar(111).value = 482
  sysvar(112).Name = "tieang4"
  sysvar(112).value = 483
  sysvar(113).Name = "tielen1"
  sysvar(113).value = 484
  sysvar(114).Name = "tielen2"
  sysvar(114).value = 485
  sysvar(115).Name = "tielen3"
  sysvar(115).value = 486
  sysvar(116).Name = "tielen4"
  sysvar(116).value = 487
  sysvar(117).Name = "eye1"
  sysvar(117).value = 501
  sysvar(118).Name = "eye2"
  sysvar(118).value = 502
  sysvar(119).Name = "eye3"
  sysvar(119).value = 503
  sysvar(120).Name = "eye4"
  sysvar(120).value = 504
  sysvar(121).Name = "eye5"
  sysvar(121).value = 505
  sysvar(122).Name = "eye6"
  sysvar(122).value = 506
  sysvar(123).Name = "eye7"
  sysvar(123).value = 507
  sysvar(124).Name = "eye8"
  sysvar(124).value = 508
  sysvar(125).Name = "eye9"
  sysvar(125).value = 509
  sysvar(126).Name = "refmulti"
  sysvar(126).value = 686
  sysvar(127).Name = "refshell"
  sysvar(127).value = 687
  sysvar(128).Name = "refbody"
  sysvar(128).value = 688
  sysvar(129).Name = "refxpos"
  sysvar(129).value = 689
  sysvar(130).Name = "refypos"
  sysvar(130).value = 690
  sysvar(131).Name = "refvelscalar"
  sysvar(131).value = 695
  sysvar(132).Name = "refvelsx"
  sysvar(132).value = 696
  sysvar(133).Name = "refveldx"
  sysvar(133).value = 697
  sysvar(134).Name = "refveldn"
  sysvar(134).value = 698
  sysvar(135).Name = "refvel"
  sysvar(135).value = 699
  sysvar(136).Name = "refvelup"
  sysvar(136).value = 699
  sysvar(137).Name = "refup"
  sysvar(137).value = 701
  sysvar(138).Name = "refdn"
  sysvar(138).value = 702
  sysvar(139).Name = "refsx"
  sysvar(139).value = 703
  sysvar(140).Name = "refdx"
  sysvar(140).value = 704
  sysvar(141).Name = "refaimdx"
  sysvar(141).value = 705
  sysvar(142).Name = "refaimsx"
  sysvar(142).value = 706
  sysvar(143).Name = "refshoot"
  sysvar(143).value = 707
  sysvar(144).Name = "refeye"
  sysvar(144).value = 708
  sysvar(145).Name = "refnrg"
  sysvar(145).value = 709
  sysvar(146).Name = "refage"
  sysvar(146).value = 710
  sysvar(147).Name = "refaim"
  sysvar(147).value = 711
  sysvar(148).Name = "reftie"
  sysvar(148).value = 712
  sysvar(149).Name = "refpoison"
  sysvar(149).value = 713
  sysvar(150).Name = "refvenom"
  sysvar(150).value = 714
  sysvar(151).Name = "refkills"
  sysvar(151).value = 715
  sysvar(152).Name = "myup"
  sysvar(152).value = 721
  sysvar(153).Name = "mydn"
  sysvar(153).value = 722
  sysvar(154).Name = "mysx"
  sysvar(154).value = 723
  sysvar(155).Name = "mydx"
  sysvar(155).value = 724
  sysvar(156).Name = "myaimdx"
  sysvar(156).value = 725
  sysvar(157).Name = "myaimsx"
  sysvar(157).value = 726
  sysvar(158).Name = "myshoot"
  sysvar(158).value = 727
  sysvar(159).Name = "myeye"
  sysvar(159).value = 728
  sysvar(160).Name = "myties"
  sysvar(160).value = 729
  sysvar(161).Name = "mypoison"
  sysvar(161).value = 730
  sysvar(162).Name = "myvenom"
  sysvar(162).value = 731
  sysvar(163).Name = "out1"
  sysvar(163).value = 800
  sysvar(164).Name = "out2"
  sysvar(164).value = 801
  sysvar(165).Name = "out3"
  sysvar(165).value = 802
  sysvar(166).Name = "out4"
  sysvar(166).value = 803
  sysvar(167).Name = "out5"
  sysvar(167).value = 804
  sysvar(167).Name = "out6"
  sysvar(167).value = 805
  sysvar(167).Name = "out7"
  sysvar(167).value = 806
  sysvar(167).Name = "out8"
  sysvar(167).value = 807
  sysvar(167).Name = "out9"
  sysvar(167).value = 808
  sysvar(167).Name = "out10"
  sysvar(167).value = 809
  sysvar(168).Name = "in1"
  sysvar(168).value = 810
  sysvar(169).Name = "in2"
  sysvar(169).value = 811
  sysvar(170).Name = "in3"
  sysvar(170).value = 812
  sysvar(171).Name = "in4"
  sysvar(171).value = 813
  sysvar(172).Name = "in5"
  sysvar(172).value = 814
  sysvar(172).Name = "in6"
  sysvar(172).value = 815
  sysvar(172).Name = "in7"
  sysvar(172).value = 816
  sysvar(172).Name = "in8"
  sysvar(172).value = 817
  sysvar(172).Name = "in9"
  sysvar(172).value = 818
  sysvar(172).Name = "in10"
  sysvar(172).value = 819
  sysvar(173).Name = "mkslime"
  sysvar(173).value = 820
  sysvar(174).Name = "slime"
  sysvar(174).value = 821
  sysvar(175).Name = "mkshell"
  sysvar(175).value = 822
  sysvar(176).Name = "shell"
  sysvar(176).value = 823
  sysvar(177).Name = "strvenom"
  sysvar(177).value = 824
  sysvar(178).Name = "venom"
  sysvar(178).value = 825
  sysvar(179).Name = "strpoison"
  sysvar(179).value = 826
  sysvar(180).Name = "mkpoison"
  sysvar(180).value = 826
  sysvar(181).Name = "poison"
  sysvar(181).value = 827
  sysvar(182).Name = "waste"
  sysvar(182).value = 828
  sysvar(183).Name = "pwaste"
  sysvar(183).value = 829
  sysvar(184).Name = "sharenrg"
  sysvar(184).value = 830
  sysvar(185).Name = "sharewaste"
  sysvar(185).value = 831
  sysvar(186).Name = "shareshell"
  sysvar(186).value = 832
  sysvar(187).Name = "shareslime"
  sysvar(187).value = 833
  sysvar(188).Name = "ploc"
  sysvar(188).value = 834
  sysvar(189).Name = "vloc"
  sysvar(189).value = 835
  sysvar(190).Name = "venval"
  sysvar(190).value = 836
  sysvar(191).Name = "paralyzed"
  sysvar(191).value = 837
  sysvar(192).Name = "poisoned"
  sysvar(192).value = 838
  sysvar(193).Name = "backshot"
  sysvar(193).value = 900
  sysvar(194).Name = "aimshoot"
  sysvar(194).value = 901
  sysvar(195).Name = "eyef"
  sysvar(195).value = 510
  sysvar(196).Name = "focuseye"
  sysvar(196).value = 511
  sysvar(197).Name = "eye1dir"
  sysvar(197).value = 521
  sysvar(198).Name = "eye2dir"
  sysvar(198).value = 522
  sysvar(199).Name = "eye3dir"
  sysvar(199).value = 523
  sysvar(200).Name = "eye4dir"
  sysvar(200).value = 524
  sysvar(201).Name = "eye5dir"
  sysvar(201).value = 525
  sysvar(202).Name = "eye6dir"
  sysvar(202).value = 526
  sysvar(203).Name = "eye7dir"
  sysvar(203).value = 527
  sysvar(204).Name = "eye8dir"
  sysvar(204).value = 528
  sysvar(205).Name = "eye9dir"
  sysvar(205).value = 529
  sysvar(206).Name = "eye1width"
  sysvar(206).value = 531
  sysvar(207).Name = "eye2width"
  sysvar(207).value = 532
  sysvar(208).Name = "eye3width"
  sysvar(208).value = 533
  sysvar(209).Name = "eye4width"
  sysvar(209).value = 534
  sysvar(210).Name = "eye5width"
  sysvar(210).value = 535
  sysvar(211).Name = "eye6width"
  sysvar(211).value = 536
  sysvar(212).Name = "eye7width"
  sysvar(212).value = 537
  sysvar(213).Name = "eye8width"
  sysvar(213).value = 538
  sysvar(214).Name = "eye9width"
  sysvar(214).value = 539
  sysvar(215).Name = "reftype"
  sysvar(215).value = 685
  sysvar(216).Name = "totalbots"
  sysvar(216).value = 401
  sysvar(217).Name = "totalmyspecies"
  sysvar(217).value = 402
  sysvar(218).Name = "out6"
  sysvar(218).value = 805
  sysvar(219).Name = "out7"
  sysvar(219).value = 806
  sysvar(220).Name = "out8"
  sysvar(220).value = 807
  sysvar(221).Name = "out9"
  sysvar(221).value = 808
  sysvar(222).Name = "out10"
  sysvar(222).value = 809
  sysvar(223).Name = "in6"
  sysvar(223).value = 815
  sysvar(224).Name = "in7"
  sysvar(224).value = 816
  sysvar(225).Name = "in8"
  sysvar(225).value = 817
  sysvar(226).Name = "in9"
  sysvar(226).value = 818
  sysvar(227).Name = "in10"
  sysvar(227).value = 819
  sysvar(228).Name = "tout1"
  sysvar(228).value = 410
  sysvar(229).Name = "tout2"
  sysvar(229).value = 411
  sysvar(230).Name = "tout3"
  sysvar(230).value = 412
  sysvar(231).Name = "tout4"
  sysvar(231).value = 413
  sysvar(232).Name = "tout5"
  sysvar(232).value = 414
  sysvar(233).Name = "tout6"
  sysvar(233).value = 415
  sysvar(234).Name = "tout7"
  sysvar(234).value = 416
  sysvar(235).Name = "tout8"
  sysvar(235).value = 417
  sysvar(236).Name = "tout9"
  sysvar(236).value = 418
  sysvar(237).Name = "tout10"
  sysvar(237).value = 419
  sysvar(238).Name = "tin1"
  sysvar(238).value = 420
  sysvar(239).Name = "tin2"
  sysvar(239).value = 421
  sysvar(240).Name = "tin3"
  sysvar(240).value = 422
  sysvar(241).Name = "tin4"
  sysvar(241).value = 423
  sysvar(242).Name = "tin5"
  sysvar(242).value = 424
  sysvar(243).Name = "tin6"
  sysvar(243).value = 425
  sysvar(244).Name = "tin7"
  sysvar(244).value = 426
  sysvar(245).Name = "tin8"
  sysvar(245).value = 427
  sysvar(246).Name = "tin9"
  sysvar(246).value = 428
  sysvar(247).Name = "tin10"
  sysvar(247).value = 429
  sysvar(248).Name = "pval"
  sysvar(248).value = 839
  'Botsareus 8/14/2013 New chloroplast code
  sysvar(249).Name = "chlr"
  sysvar(249).value = 920
  sysvar(250).Name = "mkchlr"
  sysvar(250).value = 921
  sysvar(251).Name = "rmchlr"
  sysvar(251).value = 922
  sysvar(252).Name = "light"
  sysvar(252).value = 923
  sysvar(253).Name = "sharechlr"
  sysvar(253).value = 924

End Sub

Public Function DetokenizeDNA(n As Integer, forHash As Boolean, Optional Position As Integer) As String
'On Error GoTo ex

  Dim temp As String, t As Long
  Dim tempint As Integer
  Dim converttosysvar As Boolean
  Dim gene As Integer
  Dim lastgene As Integer
  Dim ingene As Boolean
  Dim GeneEnd As Boolean
  Dim coding As Boolean
  
  ingene = False
  coding = False
  t = 2
  gene = 0
  lastgene = 0
  While Not (rob(n).DNA(t).tipo = 10 And rob(n).DNA(t).value = 1)
    
    temp = ""
   'Gene breaks
    With rob(n)
      ' If a Start or Else
      If .DNA(t).tipo = 9 And (.DNA(t).value = 2 Or .DNA(t).value = 3) Then
        If coding And Not ingene Then ' if terminating a coding region and not following a cond
           DetokenizeDNA = DetokenizeDNA + vbCrLf + "''''''''''''''''''''''''  " + "Gene: " + Str(gene) + " Ends at position " + Str(t - 1) + "  '''''''''''''''''''''''"
        End If
        If Not ingene Then ' that is not the first to follow a cond
           gene = gene + 1
        Else
          ingene = False
        End If
        coding = True
      End If
      ' If a Cond
      If .DNA(t).tipo = 9 And (.DNA(t).value = 1) Then
        If coding Then ' indicate gene ended before cond base pair
          DetokenizeDNA = DetokenizeDNA + vbCrLf + "''''''''''''''''''''''''  " + "Gene: " + Str(gene) + " Ends at position " + Str(t - 1) + "  '''''''''''''''''''''''" + vbCrLf
        End If
        ingene = True
        gene = gene + 1
        coding = True
      End If
      ' If a stop
      If .DNA(t).tipo = 9 And .DNA(t).value = 4 Then
        If coding Then GeneEnd = True
        ingene = False
        coding = False
      End If
    End With
       
    If gene <> lastgene And Not forHash Then 'Botsareus 5/28/2013 Small bug fix: '0' no longer on top of dna
      If gene > 1 Then
        temp = temp + vbCrLf
        temp = temp + "''''''''''''''''''''''''  "
        temp = temp + "Gene: " + Str(gene)
        temp = temp + " Begins at position " + Str(t)
        temp = temp + "  '''''''''''''''''''''''"
        temp = temp + vbCrLf
      Else
        temp = temp + vbCrLf
      End If
      DetokenizeDNA = DetokenizeDNA + temp
      temp = ""
      lastgene = gene
    End If
       
    converttosysvar = IIf(rob(n).DNA(t + 1).tipo = 7, True, False)
    Parse temp, rob(n).DNA(t), n, converttosysvar
    If temp = "" Then temp = "VOID" 'alert user that there is an invalid DNA entry.
      'This is probably a BUG!
    
    tempint = rob(n).DNA(t).tipo
    
    'formatting
    If tempint = 5 Or tempint = 6 Or tempint = 7 Or tempint = 9 Then temp = temp + vbCrLf
    
    DetokenizeDNA = DetokenizeDNA + " " + temp
        
    If GeneEnd Then ' Indicate gene ended via a stop.  Needs to come after base pair
      DetokenizeDNA = DetokenizeDNA + "''''''''''''''''''''''''  " + "Gene: " + Str(gene) + " Ends at position " + Str(t) + "  '''''''''''''''''''''''" + vbCrLf
      GeneEnd = False
    End If
    
    If Position > 0 And t = Position Then DetokenizeDNA = DetokenizeDNA & " '[<POSITION MARKER]" & Chr(13) & Chr(10) 'Botsareus 2/25/2013 Makes the program easy to debug
    t = t + 1
  Wend
   If Not (rob(n).DNA(t - 1).tipo = 9 And rob(n).DNA(t - 1).value = 4) And coding Then ' End of DNA without a stop.
    DetokenizeDNA = DetokenizeDNA + "''''''''''''''''''''''''  " + "Gene: " + Str(gene) + " Ends at position " + Str(t - 1) + "  '''''''''''''''''''''''" + vbCrLf
  End If
ex:
End Function

Public Function TipoDetok(ByVal tipo As Long) As String
  Select Case tipo
    Case 0
      TipoDetok = "number"
    Case 1
      TipoDetok = "*number"
    Case 2
      TipoDetok = "basic command"
    Case 3
      TipoDetok = "advanced command"
    Case 4
      TipoDetok = "bit command"
    Case 5
      TipoDetok = "condition"
    Case 6
      TipoDetok = "logic operator"
    Case 7
      TipoDetok = "store command"
    Case 9
      TipoDetok = "flow command"
  End Select
End Function
