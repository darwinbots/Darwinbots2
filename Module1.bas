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
    rob(n).DnaLen = DnaLen(rob(n).DNA())  ' measures dna length
    RobScriptLoad = n       ' returns the index of the created rob
  Else
    rob(n).exist = False
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
    'UpdateBotBucket t
        
    col1 = Random(50, 255)
    col2 = Random(50, 255)
    col3 = Random(50, 255)
    rob(t).color = col1 * 65536 + col2 * 256 + col3
    rob(t).exist = True
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
  On Error Resume Next
  IsRobDNABounded = False
  IsRobDNABounded = (UBound(ArrayIn) >= LBound(ArrayIn))
End Function

Public Function DnaLen(DNA() As block) As Integer
  DnaLen = 1
  While Not (DNA(DnaLen).tipo = 10 And DNA(DnaLen).value = 1) And DnaLen <= 32000
    DnaLen = DnaLen + 1
  Wend
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
  While Not (rob(n).DNA(t).tipo = 10 And rob(n).DNA(t).value = 1)
    t = t + 1
    If UBound(rob(n).DNA()) < t Then Exit Sub
    If rob(n).DNA(t).tipo = 1 Then
      a = rob(n).DNA(t).value
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
  
  If IntStack.pos >= 21 Then 'next push will overfill
    For a = 0 To 19
      IntStack.val(a) = IntStack.val(a + 1)
    Next a
    IntStack.val(20) = 0
    IntStack.pos = 20
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

Public Function PopBoolStack() As Integer
  Condst.pos = Condst.pos - 1
      
  If Condst.pos = -1 Then
    Condst.pos = 0
    PopBoolStack = -5
    Exit Function 'returns a weird value if there's nothing on the stack
  End If
  
  PopBoolStack = Condst.val(Condst.pos)
End Function

Public Function CountGenes(ByRef DNA() As block) As Integer
  Dim counter As Long
    
  counter = 1
  
  While Not (DNA(counter).tipo = 10 And DNA(counter).value = 1) And counter <= 32000
    If DNA(counter).tipo = 9 And (DNA(counter).value = 2 Or DNA(counter).value = 3) Then
   ' If DNA(counter).tipo = 9 And (DNA(counter).value = 2) Then
      CountGenes = CountGenes + 1
    End If
    counter = counter + 1
  Wend
End Function

Public Function NextStop(ByRef DNA() As block, ByVal inizio As Long) As Integer
  NextStop = inizio
  While Not ((DNA(NextStop).tipo = 9 And (DNA(NextStop).value = 4)) Or DNA(NextStop).tipo = 10) And (NextStop <= 32000)
    '_ And (DNA(NextStop).value = 2 Or DNA(NextStop).value = 3 Or DNA(NextStop).value = 4))
    NextStop = NextStop + 1
  Wend
End Function

Public Function PrevStop(ByRef DNA() As block, ByVal inizio As Long) As Integer
  PrevStop = inizio
  While Not ((DNA(PrevStop).tipo = 9 And _
    DNA(PrevStop).value <> 4) Or DNA(PrevStop).tipo = 10)
    PrevStop = PrevStop - 1
    If PrevStop < 1 Then Exit Function
  Wend
End Function

'returns position of gene n
Public Function genepos(ByRef DNA() As block, ByVal n As Integer) As Integer
  Dim k As Integer
  Dim genenum As Integer
  genepos = 0
  k = 1
  
  If n = 0 Then
    genepos = 0
    Exit Function
  End If
  
  While k > 0 And genepos = 0 And k <= 32000
   ' If DNA(k).tipo = 9 And (DNA(k).value = 2 Or DNA(k).value = 3) Then
    If DNA(k).tipo = 9 And (DNA(k).value = 1) Then
      genenum = genenum + 1
      If genenum = n Then genepos = k
    End If
    k = k + 1
    If DNA(k).tipo = 10 And DNA(k).value = 1 Then k = -1
  Wend
End Function

' executes program of robot n with genes activation display on
Public Sub exechighlight(n As Integer)
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
