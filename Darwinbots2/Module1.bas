Attribute VB_Name = "DNAManipulations"
Option Explicit

'All functions that manipulate DNA without actually mutating it should go here.
'That is, anything that searches DNA, etc.

' loads a dna file, inserting the robot in the simulation
Public Function RobScriptLoad(path As String) As Integer
  Dim n As Integer
  n = posto
  preparerob n, path        ' prepares structure
  If LoadDNA(path, n) Then   ' loads and parses dna
    insertsysvars n         ' count system vars among used vars
    ScanUsedVars n          ' count other used locations
    makeoccurrlist n        ' creates the ref* array
    rob(n).DnaLen = DnaLen(rob(n).dna())  ' measures dna length
    rob(n).genenum = CountGenes(rob(n).dna())
    rob(n).mem(DnaLenSys) = rob(n).DnaLen
    rob(n).mem(GenesSys) = rob(n).genenum
    RobScriptLoad = n       ' returns the index of the created rob
  Else
    rob(n).exist = False
    UpdateBotBucket n
    RobScriptLoad = -1
  End If
End Function

' prepares with some values the struct of a new rob
Private Sub preparerob(t As Integer, path As String)
    Dim col1 As Long, col2 As Long, col3 As Long
    Dim k As Integer
    rob(t).pos.x = Random(50, Form1.ScaleWidth)
    rob(t).pos.y = Random(50, Form1.ScaleHeight)
    rob(t).aim = Random(0, 628) / 100
    rob(t).aimvector = VectorSet(Cos(rob(t).aim), Sin(rob(t).aim))
    rob(t).exist = True
    rob(t).BucketPos.x = -2
    rob(t).BucketPos.y = -2
    UpdateBotBucket t
        
    col1 = Random(50, 255)
    col2 = Random(50, 255)
    col3 = Random(50, 255)
    rob(t).color = col1 * 65536 + col2 * 256 + col3
    
    rob(t).vnum = 1
    'rob(t).st.pos = 1
    rob(t).nrg = 20000
    rob(t).Veg = False
    k = 1
    While InStr(k, path, "\") > 0
      k = k + 1
    Wend
    rob(t).FName = Right$(path, Len(path) - k + 1)
End Sub

Public Function IsRobDNABounded(ByRef ArrayIn() As block) As Boolean
  On Error GoTo done
  IsRobDNABounded = False
  IsRobDNABounded = (UBound(ArrayIn) >= LBound(ArrayIn))
done:
End Function

Public Function DnaLen(dna() As block) As Integer
  DnaLen = 1
  While Not (dna(DnaLen).tipo = 10 And dna(DnaLen).value = 1) And DnaLen <= 32000 And DnaLen < UBound(dna) 'Botsareus 6/16/2012 Added upper bounds check
    DnaLen = DnaLen + 1
  Wend
  
  'If DnaLen = 32000 Then 'Botsareus 5/29/2012 removed pointless code
    'DnaLen = 32000
  'End If
End Function

' compiles a list of used locations
' (used to introduce gradually new locations
' with mutation, but abandoned)
Public Sub ScanUsedVars(n As Integer)
Dim t As Integer
Dim k As Integer
Dim a As Integer
Dim used As Boolean
used = False
  While Not (rob(n).dna(t).tipo = 10 And rob(n).dna(t).value = 1)
    t = t + 1
    If UBound(rob(n).dna()) < t Then GoTo getout
    If rob(n).dna(t).tipo = 1 Then
      a = rob(n).dna(t).value
      For k = 1 To rob(n).maxusedvars
        If rob(n).usedvars(k) = a Then used = True
      Next k
      If Not used Then
        rob(n).maxusedvars = rob(n).maxusedvars + 1
        If UBound(rob(n).usedvars()) >= rob(n).maxusedvars Then rob(n).usedvars(rob(n).maxusedvars) = a
      End If
      used = False
    End If
  Wend
getout:
End Sub

' inserts sysvars among used vars
Public Sub insertsysvars(n As Integer)
  Dim t As Integer
  t = 1
  While sysvar(t).Name <> ""
    rob(n).usedvars(t) = sysvar(t).value
    t = t + 1
  Wend
  rob(n).maxusedvars = t - 1
End Sub

' inserts a new private variable in the private vars list
Public Sub insertvar(n As Integer, a As String)
  Dim b As String
  Dim c As String
  Dim pos As Integer
  a = Right(a, Len(a) - 4)
  pos = InStr(a, " ")
  b = Left(a, pos - 1)
  c = Right(a, Len(a) - pos)
  rob(n).vars(rob(n).vnum).Name = b
  rob(n).vars(rob(n).vnum).value = val(c)
  rob(n).vnum = rob(n).vnum + 1
End Sub

Public Sub interpretUSE(n As Integer, a As String)
  Dim b As String
  Dim pos As Integer
  a = Right(a, Len(a) - 4)
    
  If (a = "NewMove") Then
    rob(n).NewMove = True
  End If
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''handle the stacks ''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''

'intstack.pos points to the Least Upper Bound element of the stack

Public Sub PushIntStack(ByVal value As Long)
  Dim a As Integer
  
  If IntStack.pos >= 101 Then 'next push will overfill
    For a = 0 To 99
      IntStack.val(a) = IntStack.val(a + 1)
    Next a
    IntStack.val(100) = 0
    IntStack.pos = 100
  End If
  
  IntStack.val(IntStack.pos) = value
  IntStack.pos = IntStack.pos + 1
End Sub

Public Function PopIntStack() As Long
  IntStack.pos = IntStack.pos - 1
      
  If IntStack.pos = -1 Then
    IntStack.pos = 0
    IntStack.val(0) = 0
  End If
  
  PopIntStack = IntStack.val(IntStack.pos)
End Function

Public Sub ClearIntStack()
  IntStack.pos = 0
  IntStack.val(0) = 0
End Sub

Public Sub DupIntStack()
  Dim a As Long
  
  If IntStack.pos = 0 Then
    Exit Sub
  Else
    a = PopIntStack
    PushIntStack a
    PushIntStack a
  End If
End Sub


Public Sub SwapIntStack()
  Dim a As Long
  Dim b As Long
  
  If IntStack.pos <= 1 Then ' 1 or 0 values on the stack
    Exit Sub
  Else
    a = PopIntStack
    b = PopIntStack
    PushIntStack a
    PushIntStack b
  End If
End Sub
Public Sub OverIntStack()
  'a b -> a b a
  
  Dim a As Long
  Dim b As Long
  
  If IntStack.pos = 0 Then Exit Sub
  If IntStack.pos = 1 Then ' 1 value on the stack
    PushIntStack 0
    Exit Sub
  Else
    b = PopIntStack
    a = PopIntStack
    PushIntStack a
    PushIntStack b
    PushIntStack a
  End If
End Sub

Public Sub PushBoolStack(ByVal value As Boolean) 'change to a linked list so there is no stack limit or wasted memory soemtime in the future
  Dim a As Integer
  
  If Condst.pos >= 101 Then 'next push will overfill
    For a = 0 To 99
      Condst.val(a) = Condst.val(a + 1)
    Next a
    Condst.val(100) = 0
    Condst.pos = 100
  End If
  
  Condst.val(Condst.pos) = value
  Condst.pos = Condst.pos + 1
End Sub

Public Sub ClearBoolStack()
  Condst.pos = 0
  Condst.val(0) = 0
End Sub

Public Sub DupBoolStack()
  Dim a As Boolean
  
  If Condst.pos = 0 Then
    Exit Sub
  Else
    a = PopBoolStack
    PushBoolStack a
    PushBoolStack a
  End If
End Sub

Public Sub SwapBoolStack()
  Dim a As Boolean
  Dim b As Boolean
  
  If Condst.pos <= 1 Then
    Exit Sub  'Do nothing
  Else ' 2 or more things on stack
    a = PopBoolStack
    b = PopBoolStack
    PushBoolStack a
    PushBoolStack b
  End If
End Sub
Public Sub OverBoolStack()
'a b -> a b a
  Dim a As Boolean
  Dim b As Boolean
  
  If Condst.pos = 0 Then Exit Sub  'Do nothing.  Nothing on stack.
  If Condst.pos = 1 Then           'Only 1 thing on stack.
    PushBoolStack True
    Exit Sub
  Else
    b = PopBoolStack
    a = PopBoolStack
    PushBoolStack a
    PushBoolStack b
    PushBoolStack a
  End If
End Sub

Public Function PopBoolStack() As Integer
  Condst.pos = Condst.pos - 1
      
  If Condst.pos = -1 Then
    Condst.pos = 0
    PopBoolStack = -5
    Exit Function 'returns a weird value if there's nothing on the stack
  End If
  
  PopBoolStack = Condst.val(Condst.pos)
End Function

Public Function CountGenes(ByRef dna() As block) As Integer
  Dim counter As Long
  Dim k As Integer
  Dim genenum As Integer
  Dim ingene As Boolean
  
  ingene = False
   
  counter = 1
  
   While counter <= 32000 And counter <= UBound(dna) 'Botsareus 5/29/2012 Added upper bounds check
   If dna(counter).tipo = 10 And dna(counter).value = 1 Then GoTo getout
    ' If a Start or Else
    If dna(counter).tipo = 9 And (dna(counter).value = 2 Or dna(counter).value = 3) Then
      If Not ingene Then 'that does not follow a Cond
        CountGenes = CountGenes + 1
      End If
      ingene = False ' that follows a cond
    End If
    ' If a Cond
    If dna(counter).tipo = 9 And (dna(counter).value = 1) Then
      ingene = True
      CountGenes = CountGenes + 1
    End If
    ' If a stop
    If dna(counter).tipo = 9 And dna(counter).value = 4 Then ingene = False
    counter = counter + 1
  Wend
getout:
End Function

Public Function NextStop(ByRef dna() As block, ByVal inizio As Long) As Integer
  NextStop = inizio
  While Not ((dna(NextStop).tipo = 9 And (dna(NextStop).value = 4)) Or dna(NextStop).tipo = 10) And (NextStop <= 32000)
    '_ And (DNA(NextStop).value = 2 Or DNA(NextStop).value = 3 Or DNA(NextStop).value = 4))
    NextStop = NextStop + 1
  Wend
End Function

'Returns the position of the last base pair of the gene beginnign at position
Public Function GeneEnd(ByRef dna() As block, ByVal position As Integer) As Integer
  Dim condgene As Boolean
  condgene = False
    
  GeneEnd = position
  If dna(GeneEnd).tipo = 9 And dna(GeneEnd).value = 1 Then condgene = True
  
  While GeneEnd + 1 <= 32000
    If (dna(GeneEnd + 1).tipo = 10) Then GoTo getout ' end of genome
    If (dna(GeneEnd + 1).tipo = 9 And ((dna(GeneEnd + 1).value = 1) Or dna(GeneEnd + 1).value = 4)) Then  ' cond or stop
      If (dna(GeneEnd + 1).value = 4) Then GeneEnd = GeneEnd + 1 ' Include the stop as part of the gene
      GoTo getout
    End If
    If (dna(GeneEnd + 1).tipo = 9 And ((dna(GeneEnd + 1).value = 2) Or dna(GeneEnd + 1).value = 3)) And Not condgene Then GoTo getout ' start or else
    If (dna(GeneEnd + 1).tipo = 9 And ((dna(GeneEnd + 1).value = 2) Or dna(GeneEnd + 1).value = 3)) And condgene Then condgene = False ' start or else
    GeneEnd = GeneEnd + 1
    If (GeneEnd + 1) > UBound(dna) Then GoTo getout 'Botsareus 5/29/2012 Added upper bounds check
  Wend
getout:
End Function

Public Function PrevStop(ByRef dna() As block, ByVal inizio As Long) As Integer
  PrevStop = inizio
  While Not ((dna(PrevStop).tipo = 9 And _
    dna(PrevStop).value <> 4) Or dna(PrevStop).tipo = 10)
    PrevStop = PrevStop - 1
    If PrevStop < 1 Then GoTo getout
  Wend
getout:
End Function

'returns position of gene n
Public Function genepos(ByRef dna() As block, ByVal n As Integer) As Integer
  Dim k As Integer
  Dim genenum As Integer
  Dim ingene As Boolean
  
  ingene = False
  genepos = 0
  k = 1
  
  If n = 0 Then
    genepos = 0
    GoTo getout
  End If
  
  While k > 0 And genepos = 0 And k <= 32000
    'A start or else
    If dna(k).tipo = 9 And (dna(k).value = 2 Or dna(k).value = 3) Then
      If Not ingene Then ' Does not follow a cond.  Make it a new gene
        genenum = genenum + 1
        If genenum = n Then
          genepos = k
          GoTo getout
        End If
      Else
        ingene = False ' First Start or Else following a cond
      End If
    End If
 
    ' If a Cond
    If dna(k).tipo = 9 And (dna(k).value = 1) Then
      ingene = True
      genenum = genenum + 1
      If genenum = n Then
        genepos = k
        GoTo getout
      End If
    End If
    ' If a stop
    If dna(k).tipo = 9 And dna(k).value = 4 Then ingene = False
    
    k = k + 1
    If dna(k).tipo = 10 And dna(k).value = 1 Then k = -1
  Wend
getout:
End Function

' executes program of robot n with genes activation display on
Public Sub exechighlight(ByVal n As Integer)
  'Dim ga() As Boolean
  'Dim k As Integer
  'ReDim ga(rob(n).genenum)
  'k = 1
  ' scans the list of genes entry points
  ' verifying conditions and jumping to body execution
  'While rob(n).condlist(k) > 0
  '  currgene = k
  '  If COND(n, rob(n).condlist(k) + 1) Then
  '    ga(k) = True
  '    'corpo (n)
  '  Else
  '    ga(k) = False
  '  End If
  '  k = k + 1
  'Wend
  ActivForm.DrawGrid rob(n).ga ' EricL March 15, 2006 - This line uncommented
End Sub

'executes program of robot n with console opened
'Public Sub eseguidebug(n As Integer)
'  Dim ga() As Boolean
'  Dim k As Integer
'  ReDim ga(rob(n).genenum)
'  k = 1
'  ' scans the list of genes entry points
'  ' verifying conditions and jumping to body execution
'  ' jay - add a gene name to this to replace CStr(k)
'  While rob(n).condlist(k) > 0
'    currgene = k
'    If COND(n, rob(n).condlist(k) + 1) Then
'      rob(n).console.textout CStr(k) & " executed"
'      ga(k) = True
'      corpo (n)
'    Else
'      rob(n).console.textout CStr(k) & " -"
'      ga(k) = False
'    End If
'    k = k + 1
'  Wend
'  If ActivForm.Visible Then ActivForm.DrawGrid ga
'End Sub

' plain execution of robot n
'Public Sub eseguirob2(n As Integer)
'
'Dim k As Integer
'  k = 1
'  ' scans the list of genes entry points
'  ' verifying conditions and jumping to body execution
'  'While rob(n).condlist(k) > 0
'    'currgene = k
'    'If COND(n, rob(n).condlist(k) + 1) Then corpo (n)
'  '  k = k + 1
'  'Wend
'End Sub
