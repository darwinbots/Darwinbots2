Attribute VB_Name = "Mutations"
Option Explicit
'
'                 M U T A T I O N
'

' root for mutation procedures
' one of the most delicates parts of the program, many many
' errors come from mangled dnas

'how mutations are working:
'calls from robots module to mutate
'then calls to checkintegrity

'useful:
'"cond"
'tipo = 4
'ind = 1

'"start"
'tipo = 4
'ind = 2
    
'"stop"
'tipo = 4
'ind = 3
    
'"end"
'tipo = 4
'ind = 4

Const MaxDnaCond As Integer = 5

Public Function CheckIntegrity(ByRef DNA() As block) As Boolean
'Checks the integrity of a DNA strand to see if the bot will crash the computer
'if it fails, it is killed usually
  
  CheckIntegrity = True
'  Dim k As Integer, f As Integer, j As Integer
'  k = 1
'  f = NextElement(DNA, k, 4, 4) 'check for an end statement
'
'  If f < 0 Then 'we don't have an end statement?  Let's just add one
'    ReDim Preserve DNA(UBound(DNA()) + 1)
'    DNA(UBound(DNA())).tipo = 4
'    DNA(UBound(DNA())).value = 4
'  End If
'
'  While f > 0 And f > k And CheckIntegrity
'    CheckIntegrity = False
'    k = NextElement(DNA, k, 4, 1) 'next cond statement
'
'    If k > 0 And DNA(NextType(DNA, k + 1, 4)).value = 2 Then 'make sure cond is followed by start
'      k = NextElement(DNA, k, 4, 2) 'find that start statement!
'      If k > 0 And DNA(NextType(DNA, k + 1, 4)).value = 3 Then 'make sure start is followed by a stop
'        k = NextElement(DNA, k, 4, 3)
'        j = DNA(NextType(DNA, k + 1, 4)).value
'        If j = 1 Or j = 4 Then CheckIntegrity = True 'we have a complete gene, and there's a cond comming up
'        If k < 0 Then CheckIntegrity = False 'what???  no end statement or cond in sight?
'      End If
'    End If
'    k = k + 1
'    If k > UBound(DNA()) Then CheckIntegrity = False
'  Wend
'
'  If NextElement(DNA, 1, 4, 4) > 0 Then CheckIntegrity = True
  'basically, exploding babies is bad, so the above line short circuits
  'this function.
End Function

Public Function PrevElement(ByRef DNA() As block, inizio As Integer, tipo As Integer, valore As Integer) As Integer
  Dim k As Integer
'  k = inizio
'  If inizio > 0 Then
'    While k > 0 And Not (DNA(k).tipo = tipo And DNA(k).value = valore)
'      k = k - 1
'    Wend
'    If Not (DNA(k).tipo = tipo And DNA(k).value = valore) Then k = -1
'  Else
'    k = -1
'  End If
'  PrevElement = k
'End Function
'
'Public Function NextType(ByRef DNA() As block, inizio As Integer, tipo As Integer) As Integer
'  Dim k As Integer
'  k = inizio
'  While Not (DNA(k).tipo = 4 And DNA(k).value = 4) And Not (DNA(k).tipo = tipo)
'    k = k + 1
'    If k > UBound(DNA()) Then
'      NextType = -1
'      Exit Function
'    End If
'  Wend
'  If Not (DNA(k).tipo = tipo) Then k = -1
'  NextType = k
End Function

Public Function MakeSpace(ByRef DNA() As block, beginning As Integer, length As Integer) As Boolean
  Dim DNALength As Integer, t As Integer
'  DNALength = DnaLen(DNA)
'  MakeSpace = True
'  ReDim Preserve DNA(DNALength + length + 1)
'  For t = DNALength + length To beginning + length Step -1
'    DNA(t) = DNA(t - length)
'  Next t
'  For t = beginning To beginning + length - 1
'    DNA(t).tipo = 0
'    DNA(t).value = 0
'  Next t
End Function

Public Sub Delete(ByRef DNA() As block, beginning As Integer, endend As Integer)
  ' head: it works perfectly
  Dim L As Integer, t As Integer, lungh
'  lungh = endend - beginning
'  L = DnaLen(DNA)
'  If L > 0 And lungh > 0 Then 'And fine < MaxDnaLen Then
'    For t = beginning To L - lungh - 1
'      DNA(t) = DNA(t + lungh + 1)
'    Next t
'    ReDim Preserve DNA(L - lungh)
'  End If
End Sub

Public Function Copy(ByRef DNA() As block, da As Integer, A As Integer, dove As Integer) As Boolean
  ' procedura verificata, funziona
  Dim k As Integer, L As Integer, t As Integer, dist As Integer
'  Copy = False
'  L = a - da
'  If MakeSpace(DNA, dove, L + 1) Then
'    dist = dove - da
'    For t = da To a
'      DNA(t + dist) = DNA(t)
'    Next t
'    Copy = True
'  End If
End Function

Public Sub DuplicateRandomGene(ByRef DNA() As block)
  Dim k As Integer, i As Integer, f As Integer
'  k = Random(1, CountGenes(DNA))
'  i = GenePos(DNA, k)
'  f = NextStop(DNA, i)
'  Copy DNA, i, f, f + 1
End Sub

Public Sub DeleteRandomGene(ByRef DNA() As block)
  Dim k As Integer, i As Integer, f As Integer
'  k = Random(1, CountGenes(DNA))
'  If k > 0 Then
'    i = GenePos(DNA, k)
'    f = NextStop(DNA, i)
'    Delete DNA, i, f
'  End If
End Sub
Public Sub DeleteSpecificGene(ByRef DNA() As block, k As Integer)
  Dim i As Integer, f As Integer
'  If k > 0 Then
'    i = GenePos(DNA, k)
'    f = NextStop(DNA, i)
'    Delete DNA, i, f
'  End If
End Sub

Public Function ChangeValue(ByRef DNA() As block, prob As Long, x As String) As Integer
  Dim t As Integer
  Dim A As Integer
  Dim b As Integer
  Dim k As Single
'  t = 1
'  ChangeValue = 0
'  While Not (DNA(t).tipo = 4 And DNA(t).value = 4)
'    If DNA(t).tipo = 0 And Not (DNA(t + 1).tipo = 2 And DNA(t + 1).value = 1) Then
'      If Random(1, prob) = 1 Then
'        ChangeValue = ChangeValue + 1
'        a = DNA(t).value
'        x = x + "Changed val at pos " + CStr(t)
'        x = x + " from " + varname(DNA(t).value)
'        b = Abs(a) / 10
'        If b < 1 Then b = 1
'        'k = a + PiuMeno * Gauss(1, a + PiuMeno * 10)
'        k = a + Mutchange(a)
'        If k < -32000 Then k = 32000
'        If k > 32000 Then k = 32000
'        DNA(t).value = Int(k)
'        x = x + " to " + varname(DNA(t).value)
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      End If
'    End If
'    t = t + 1
'    If t + 1 > UBound(DNA()) Then Exit Function
'  Wend
End Function
Public Function Mutchange(ByVal A As Long) 'sets the size of change of the mutation
  Dim low As Long
  Dim high As Long
  Dim range As Integer
'  low = a - (a / 3)
'  high = a + (a / 3)
'  If high - low > 32000 Or high - low < -32000 Then
'    range = 32000 * Sgn(high - low)
'  Else
'    range = (high - low) / 2
'  End If
'  If range < 10 Then range = 10
'  Mutchange = Gauss(range * -1, range)
End Function
Public Sub ImmediateToMem(ByRef DNA() As block, pos As Integer)
'  If DNA(pos).tipo = 0 Then
'    DNA(pos).tipo = 1
'    DNA(pos).value = Abs(DNA(pos).value Mod MaxMem)
'  End If
End Sub

Public Sub MemToImmediate(ByRef DNA() As block, pos)
'  If DNA(pos).tipo = 1 Then
'    DNA(pos).tipo = 0
'    DNA(pos).value = Random(-30000, 30000)
'  End If
End Sub

Public Sub InstrToInstr(ByRef DNA() As block, pos)
  Dim k As Integer
'  If DNA(pos).tipo = 2 Then
'    k = Random(1, 9)
'    While k = DNA(pos).value Or k = 2
'      k = Random(1, 9)
'    Wend
'    DNA(pos).value = k
'  End If
End Sub

Public Function DelRandomPos(ByRef DNA() As block, prob As Long, x As String) As Integer
  Dim k As Integer, f As Integer, j As Integer
'  DelRandomPos = 0
'  k = NextStart(DNA, 1)
'  While k > 0
'    f = NextStop(DNA, k)
'    j = k + 1
'    While j < f
'      If Random(1, prob) = 1 Then
'        x = x + "Deleted value " + CStr(DNA(j).value) + " at pos " + CStr(j)
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'        Delete DNA, j, j
'        f = NextStop(DNA, k)
'        DelRandomPos = DelRandomPos + 1
'        If f < 0 Then
'          MsgBox "dna corrotto in operazione delrandompos"
'          Exit Function
'        End If
'      End If
'      j = j + 1
'      If j > UBound(DNA()) Then Exit Function
'    Wend
'    k = NextStart(DNA, f)
'  Wend
End Function

Public Function DuplicateRandomInstr(DNA() As block, x As String, prob As Long) As Integer
  Dim t As Integer
  Dim lun As Integer, spa As Integer
  Dim fdna As Integer
  Dim xlun1 As String
  Dim x1 As String
  Dim x2 As String
  Dim x3 As String
'  t = 1
'  DuplicateRandomInstr = 0
'  fdna = NextElement(DNA, 1, 4, 4)
'  For t = 1 To fdna
'    If DNA(t).tipo = 2 Then
'      If Random(1, prob) = 1 Then
'        spa = t - PrevElement(DNA, t, 4, 2) - 1
'        lun = 2
'        If spa < 2 Then lun = spa
'        If Copy(DNA, t - lun, t, t + 1) Then
'          If lun = 2 Then
'            If DNA(t - lun).tipo = 1 Then
'              xlun1 = varname(DNA(t - lun).value)
'            Else
'              xlun1 = Str$(DNA(t - lun).value)
'            End If
'          End If
'          If DNA(t - 1).tipo = 1 Then
'            x1 = varname(DNA(t - 1).value)
'          Else
'            x1 = Str$(DNA(t - 1).value)
'          End If
'          x2 = Instrname(DNA(t).value)
'          If DNA(t + 1).tipo = 1 Then
'            x3 = varname(DNA(t + 1).value)
'          Else
'            x3 = Str$(DNA(t + 1).value)
'          End If
'          x = x + "Duplicated instr " + xlun1 + " " + x1 + " " + x2 + " at pos "
'          x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          DuplicateRandomInstr = DuplicateRandomInstr + 1
'        End If
'      End If
'    End If
'  Next t
End Function

Public Function ChangeRandomInstr(ByRef DNA() As block, prob As Long, x As String) As Integer
  Dim i As Integer
'  i = NextType(DNA, 1, 2)
'  While i > 0
'    If Random(1, prob) = 1 Then
'      x = x + "Changed instr at pos " + CStr(i)
'      x = x + " from" + Instrname(DNA(i).value)
'      InstrToInstr DNA, i
'      x = x + " to" + Instrname(DNA(i).value)
'      x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      ChangeRandomInstr = ChangeRandomInstr + 1
'    End If
'    i = NextType(DNA, i + 1, 2)
'  Wend
End Function

Public Function InsertRandomInstr(ByRef DNA() As block, prob As Long, x As String) As Integer
  'places a random instruction in the action part of the gene.
  Dim fd As Integer, pos As Integer, endg As Integer
  Dim ppos As Integer
'  pos = 1
'  fd = NextElement(DNA, 1, 4, 4)
'  While pos < fd
'    If ppos = pos Then Exit Function
'    ppos = pos
'    pos = NextElement(DNA, pos, 4, 2) + 1 'position of the start element
'    endg = NextElement(DNA, pos, 4, 3)    'end of the gene
'    While pos <= endg
'      If Random(1, prob) = 1 Then
'        If MakeSpace(DNA, pos, 1) Then
'          DNA(pos).tipo = 2
'          DNA(pos).value = Random(1, 9)
'          x = x + "Inserted instr," + Instrname(DNA(pos).value) + ", at pos " + CStr(pos)
'          x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          InsertRandomInstr = InsertRandomInstr + 1
'        End If
'      End If
'      pos = pos + 1
'    Wend
'  Wend
End Function
Public Function DNAInsertRandomValue(ByRef DNA() As block, prob As Long, x As String) As Integer
  'places a random value (either number or label) into the action part of a gene
  Dim fd As Integer, pos As Integer, endg As Integer
  Dim ppos As Integer
  Dim r As Integer
'  pos = 1
'  fd = NextElement(DNA, 1, 4, 4)
'  While pos < fd
'    If ppos = pos Then Exit Function
'    ppos = pos
'    pos = NextElement(DNA, pos, 4, 2) + 1 'position of the start element
'    endg = NextElement(DNA, pos, 4, 3)    'end of the gene
'    While pos <= endg
'      If Random(1, prob) = 1 Then
'        If MakeSpace(DNA, pos, 1) Then
'          r = Random(0, 1)
'          If pos > UBound(DNA()) Then ReDim Preserve DNA(pos + 1)
'          DNA(pos).tipo = r
'          If r = 0 Then
'            DNA(pos).value = Gauss(-10000, 10000)
'            x = x + "Inserted value, " + Str$(DNA(pos).value) + " , at pos " + CStr(pos)
'            x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          Else
'            DNA(pos).value = Random(1, 1000)
'            x = x + "Inserted label, *" + Str$(DNA(pos).value) + " , at pos " + CStr(pos)
'            x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          End If
'          DNAInsertRandomValue = DNAInsertRandomValue + 1
'        End If
'      End If
'      pos = pos + 1
'    Wend
'  Wend
End Function
Public Function SplitRandomPos(ByRef DNA() As block, prob As Long, x As String) As Integer
  Dim k As Integer, f As Integer, j As Integer
'  k = NextStart(DNA, 1)
'  While k > 0
'    f = NextStop(DNA, k)
'    j = k + 1
'    While j < f
'      If Random(1, prob) = 1 Then
'        If MakeSpace(DNA, j, 3) Then
'          DNA(j).tipo = 4
'          DNA(j).value = 3
'          DNA(j + 1).tipo = 4
'          DNA(j + 1).value = 1
'          DNA(j + 2).tipo = 4
'          DNA(j + 2).value = 2
'          j = j + 2
'          x = x + "Random gene split at pos " + CStr(j)
'          x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          SplitRandomPos = SplitRandomPos + 1
'        End If
'      End If
'      j = j + 1
'    Wend
'    k = NextStart(DNA, f)
'  Wend
End Function

Public Function CopyAB(ByRef adna() As block, ByRef bdna() As block, da As Integer, A As Integer, dove As Integer)
'from a to b
  
  Dim k As Integer, L As Integer, t As Integer, dist As Integer
  'CopyAB = False
'  L = a - da
'  'If MakeSpace(bdna, dove, l + 1) Then
'    dist = dove - da
'    If a + dist > UBound(bdna) Then ReDim Preserve bdna(a + dist + 1)
'    For t = da To a
'      bdna(t + dist) = adna(t)
'    Next t
'    'CopyAB = True
'  'End If
End Function

Public Function GeneCopyAB(ByRef adna() As block, bdna() As block, gene As Integer, last As Integer)
  Dim inizio As Integer, fine As Integer, dove As Integer
'  inizio = GenePos(adna, gene)
'  fine = NextStop(adna, inizio)
'  dove = NextStop(bdna, GenePos(bdna, last - 1)) + 1
'  If dove < 1 Then dove = 1
'  CopyAB adna, bdna, inizio, fine, dove
End Function

Public Function CrossingOver(ByRef adna() As block, ByRef bdna() As block, ByRef CDna() As block)
  Dim aGenes As Integer, bGenes As Integer, cGenes As Integer
  Dim apiv As Integer, bpiv As Integer, cpiv As Integer, st As Boolean
  Dim pos As Integer
'  aGenes = CountGenes(adna)
'  bGenes = CountGenes(bdna)
'  apiv = 1
'  bpiv = 1
'  cpiv = 1
'  st = (Random(0, 1) = 1)
'  While apiv <= aGenes And bpiv <= bGenes
'    If st Then
'      GeneCopyAB adna, CDna, apiv, cpiv
'    Else
'      GeneCopyAB bdna, CDna, bpiv, cpiv
'    End If
'    apiv = apiv + 1
'    bpiv = bpiv + 1
'    cpiv = cpiv + 1
'    st = Not st
'  Wend
'  If Random(0, 1) = 1 Then
'    While apiv <= aGenes
'      GeneCopyAB adna, CDna, apiv, cpiv
'      apiv = apiv + 2
'      cpiv = cpiv + 1
'    Wend
'    While bpiv <= bGenes
'      GeneCopyAB bdna, CDna, bpiv, cpiv
'      bpiv = bpiv + 2
'      cpiv = cpiv + 1
'    Wend
'  End If
'  pos = NextStop(CDna, GenePos(CDna, cpiv - 1)) + 1
'  If UBound(CDna) >= pos Then
'    CDna(pos).tipo = 4
'    CDna(pos).value = 4
'  End If
End Function

Public Sub Mutate(n As Integer)
  Dim A As Integer
  Dim x As String
  Dim DNAfrom As String
  Dim DNAto As String
  
  If Not rob(n).Mutables.Mutations Then Exit Sub    'bypass routine if mutations disabled.
  
'  a = 0
'  DNAfrom = ""
'  DNAto = ""
'
'  newvars (n)
'
'  a = a + vartovar(n, x, DNAfrom, DNAto)
'  a = a + ChangeValue(rob(n).DNA, rob(n).mutarray(2) / SimOpts.MutCurrMult, x)
'  a = a + DelRandomPos(rob(n).DNA, rob(n).mutarray(13) / SimOpts.MutCurrMult, x)
'  a = a + ChangeRandomInstr(rob(n).DNA, rob(n).mutarray(3) / SimOpts.MutCurrMult, x)
'  a = a + condtocond(n, x)
'  a = a + duplicategene(n, x)
'  a = a + erasegene(n, x)
'  a = a + DNADuplicateCond(n, x)
'  a = a + DNAInsertCond(n, x, DNAto)
'  a = a + DNAEraseCond(n, x, DNAfrom)
'  a = a + DuplicateRandomInstr(rob(n).DNA, x, CLng(rob(n).mutarray(10) / SimOpts.MutCurrMult))
'  a = a + InsertRandomInstr(rob(n).DNA, CLng(rob(n).mutarray(12) / SimOpts.MutCurrMult), x)
'  a = a + DNAInsertRandomValue(rob(n).DNA, CLng(rob(n).mutarray(14) / SimOpts.MutCurrMult), x)
'
'  'appears to be broken.  genenum never > 0
'  If Random(1, rob(n).genenum) = 1 Then
'    a = a + SplitRandomPos(rob(n).DNA, (rob(n).mutarray(5)) / SimOpts.MutCurrMult, x)
'  End If
'  mutmutprob (n) 'mutate the mutations rates
'
'  rob(n).Mutations = rob(n).Mutations + a
'  rob(n).LastMutDetail = x + rob(n).LastMutDetail 'list newer mutations first
'  rob(n).LastMut = a
'
'  If OptionsForm.DNACheck Then
'    CompStr n, DNAfrom, DNAto
'  End If
'
'  If a > 0 Then
'    MutateSkin n
'    mutatecolors n, a
'    MutateShape n, a
'  End If
'  If GetInputState() <> 0 Then DoEvents
End Sub

' selects some new var to insert in the usedvars list
Private Function newvars(n As Integer) As Integer
  Dim A As Integer, t As Integer
'  newvars = 0
'  If Random(1, Int(rob(n).mutarray(11) / SimOpts.MutCurrMult)) = 1 Then
'    newvars = newvars + 1
'    Dim uv(1000) As Boolean
'    For t = 1 To rob(n).maxusedvars
'      If rob(t).usedvars(t) > 0 Then uv(rob(t).usedvars(t)) = True
'    Next t
'    a = 1
'    While uv(a)
'      a = Random(1, rob(n).maxusedvars)
'      a = rob(n).usedvars(a) + Random(-10, 10)
'      If a < 1 Then a = 1
'    Wend
'    rob(n).maxusedvars = rob(n).maxusedvars + 1
'    rob(n).usedvars(rob(n).maxusedvars) = a
'  End If
End Function

' changes a variable (location) with another
Public Function vartovar(n As Integer, ByRef d As String, ByRef DNAfrom As String, ByRef DNAto As String) As Integer
'  Dim t As Integer
'  t = 1
'  vartovar = 0
'  While Not (rob(n).DNA(t).tipo = 4 And rob(n).DNA(t).value = 4)
'    If rob(n).DNA(t).tipo = 1 Or (rob(n).DNA(t + 1).tipo = 2 And rob(n).DNA(t + 1).value = 1) Then
'      If Random(1, Int(rob(n).mutarray(1) / SimOpts.MutCurrMult)) = 1 Then
'        vartovar = vartovar + 1
'        d = d + "Changed var from " + varname(CStr(rob(n).DNA(t).value))
'        DNAfrom = DNAfrom + " " + varname(CStr(rob(n).DNA(t).value))
'        rob(n).DNA(t).value = rob(n).usedvars(Random(1, rob(n).maxusedvars))
'        d = d + " to " + varname(CStr(rob(n).DNA(t).value))
'        DNAto = DNAto + " " + varname(CStr(rob(n).DNA(t).value))
'        d = d + " at pos " + CStr(t)
'        d = d + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      End If
'    End If
'    t = t + 1
'    If UBound(rob(n).DNA) < t + 1 Then Exit Function
'  Wend
End Function

' changes a condition with another
Public Function condtocond(n As Integer, x As String) As Integer
  Dim t As Integer
  t = 1
'  condtocond = 0
'  While Not (rob(n).DNA(t).tipo = 4 And rob(n).DNA(t).value = 4)
'    If rob(n).DNA(t).tipo = 3 Then
'      If Random(1, Int(rob(n).mutarray(4) / SimOpts.MutCurrMult)) = 1 Then
'        condtocond = condtocond + 1
'        x = x + "Changed cond at pos " + CStr(t)
'        x = x + " from " + Condname(CStr(rob(n).DNA(t).value))
'        rob(n).DNA(t).value = Random(1, 6)
'        x = x + " to " + Condname(CStr(rob(n).DNA(t).value))
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      End If
'    End If
'    t = t + 1
'    If t > UBound(rob(n).DNA()) Then Exit Function
'  Wend
End Function

' mutates the mutation probability
Public Function mutmutprob(ByVal n As Long) As Integer
  Dim A As Integer
  Dim p As Integer
  Dim d As Integer
  Dim t As Byte, b As Integer, k As Long
'  mutmutprob = 0
'  For t = 0 To 14
'    If Random(1, rob(n).mutarray(0)) = 1 And rob(n).mutarray(t) <> 0 Then
'      a = rob(n).mutarray(t)
'      b = Abs(a / 10)
'      If b < 1 Then b = 1
'      'k = rob(n).mutarray(t) + PiuMeno * Gauss(1, b + PiuMeno * 10)
'      k = a + Mutchange(rob(n).mutarray(t))
'      If k < 1 Then k = 1
'      If k > 32000 Then k = 32000
'      rob(n).mutarray(t) = k
'    End If
'  Next t
End Function

' mutates robot colour
Private Sub mutatecolors(n As Integer, A As Integer)
  Dim col As Long
  Dim r As Long, g As Long, b As Long
'  While a > 0
'    col = rob(n).color
'    b = Int(col / 65536)
'    col = col - (b * 65536)
'    g = Int(col / 256)
'    r = col - (g * 256)
'    Do
'      b = b + PiuMeno() * 20
'      r = r + PiuMeno() * 20
'      g = g + PiuMeno() * 20
'      If r > 255 Then r = 255
'      If r < 0 Then r = 0
'      If g > 255 Then g = 255
'      If g < 0 Then g = 0
'      If b > 255 Then b = 255
'      If b < 0 Then b = 0
'    Loop Until r + g + b > 150
'    a = a - 1
'    rob(n).color = b * 65536 + g * 256 + r
'  Wend
End Sub

Private Sub MutateShape(n As Integer, A As Integer)
  Dim Shape As Integer
  Dim Change As Integer
  Dim Chance As Single
'  Shape = rob(n).Shape
'  Chance = Rnd * 100
'  While a > 0
'   If Chance < 0.1 Then
'      Change = Int(Rnd * 3) - 1
'      Shape = Shape + Change
'      If Shape < 2 Then Shape = 2
'      If Shape > 10 Then Shape = 10
'      rob(n).Shape = Shape
'    End If
'    a = a - 1
'  Wend
End Sub

' mutates rob skin
Public Sub MutateSkin(n As Integer)
  Dim A As Integer
  Dim b As Integer
'  a = Random(0, 3)
'  b = Random(0, 1)
'  If b = 0 Then
'    rob(n).Skin(a * 2) = rob(n).Skin(a * 2) - RobSize / 10
'  Else
'    rob(n).Skin(a * 2) = rob(n).Skin(a * 2) + RobSize / 10
'  End If
'  If Abs(rob(n).Skin(a * 2)) > half Then
'    rob(n).Skin(a * 2) = rob(n).Skin(a * 2) - (Abs(rob(n).Skin(a * 2)) - half) * Sgn(rob(n).Skin(a * 2))
'  End If
'  b = Random(0, 1)
'  If b = 0 Then
'    rob(n).Skin(a * 2 + 1) = rob(n).Skin(a * 2 + 1) - 63
'  Else
'    rob(n).Skin(a * 2 + 1) = rob(n).Skin(a * 2 + 1) + 63
'  End If
End Sub

' duplicates a whole gene
Public Function duplicategene(n As Integer, x As String) As Integer
  Dim k As Integer, t As Integer
'  k = CountGenes(rob(n).DNA)
'  If k > 0 Then
'    For t = 1 To k
'      If Random(1, Int(rob(n).mutarray(5) / SimOpts.MutCurrMult)) = 1 Then
'        DuplicateRandomGene rob(n).DNA
'        x = x + "Duplicated random gene"
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      End If
'    Next t
'  End If
End Function

' deletes a whole gene
Public Function erasegene(n As Integer, x As String) As Integer
  Dim k As Integer, t As Integer
  Dim g As Integer
'  k = CountGenes(rob(n).DNA)
'  g = Random(1, k)
'  If k > 0 Then
'    If Random(1, Int(rob(n).mutarray(6) / SimOpts.MutCurrMult)) = 1 Then
'      DeleteSpecificGene rob(n).DNA, g
'      x = x + "Gene " + CStr(g) + " randomly deleted"
'      x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'      erasegene = erasegene + 1
'    End If
'  End If
End Function

' copies sections of the dna, from "inizio" to "fine" in "dove"
Public Sub DNACopy(n As Integer, inizio As Integer, fine As Integer, dove As Integer)
  Dim t As Integer
'  With rob(n)
'    For t = inizio To fine
'      .DNA(dove + t - inizio) = .DNA(t)
'    Next t
'  End With
End Sub

' duplicates a condition
Public Function DNADuplicateCond(n As Integer, x As String) As Integer
  Dim t As Integer
  Dim A As Integer
  Dim b As Integer
  Dim conds As Integer
  t = 1
'  With rob(n)
'    DNADuplicateCond = 0
'    While Not (.DNA(t).tipo = 4 And .DNA(t).value = 4)
'      If .DNA(t).tipo = 4 And .DNA(t).value = 1 Then
'        conds = DNACondsInGene(n, t)
'      End If
'      If .DNA(t).tipo = 3 And conds < MaxDnaCond Then
'        If Random(1, Int(.mutarray(7) / SimOpts.MutCurrMult)) = 1 Then
'          If DNAMakeSpace(n, t + 1, 3) Then
'            DNACopy n, t - 2, t, t + 1
'            DNADuplicateCond = DNADuplicateCond + 1
'            x = x + "Condition "
'            x = x + varname(CStr(.DNA(t + 1).value))
'
'            x = x + " " + Str$(rob(n).DNA(t + 2).value)
'
'            x = x + " " + Condname(rob(n).DNA(t + 3).value) + ", duplicated at pos " + CStr(t)
'            x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'            conds = conds + 1
'          End If
'        End If
'      End If
'      t = t + 1
'      If t > UBound(.DNA()) Then Exit Function
'    Wend
'    End With
End Function

' inserts a new condition
Public Function DNAInsertCond(n As Integer, x As String, DNAto As String) As Integer
  Dim t As Integer, k As Integer, inizio As Integer
  Dim A As Integer
  Dim b As Integer
  Dim genestart As Integer
  Dim r As Long
  Dim tx(3) As String
  Dim c(3) As Long
'  c(1) = mutprob.Slider1.value
'  c(2) = mutprob.Slider2.value
'  c(3) = mutprob.Slider3.value
'  t = 1
'  DNAInsertCond = 0
'  With rob(n)
'  While Not (.DNA(t).tipo = 4 And .DNA(t).value = 4)
'    If rob(n).DNA(t).tipo = 4 And rob(n).DNA(t).value = 1 Then
'      If Random(1, Int(rob(n).mutarray(8) / SimOpts.MutCurrMult)) = 1 And DNACondsInGene(n, t) < MaxDnaCond Then
'        DNAInsertCond = DNAInsertCond + 1
'        x = x + "Condition inserted at pos " + CStr(t + 1) + " through " + CStr(t + 3)
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'        k = t
'        inizio = t + 1
'        If DNAMakeSpace(n, t + 1, 3) Then
'          r = Random(1, 99)             'randomize position 1 of the condition
'          If t + 3 > UBound(.DNA()) Then
'            Exit Function 'this shouldn't happen, but if it does, we have to deal with it.
'          End If
'          If r <= c(1) Then                 'use a sysvar
'            .DNA(t + 1).tipo = 1
'            .DNA(t + 1).value = rob(n).usedvars(Random(1, rob(n).maxusedvars))
'            tx(1) = varname(CStr(.DNA(t + 1).value))
'            tx(1) = "*." + Right(tx(1), Len(tx(1)) - 1)
'          ElseIf r <= c(1) + c(2) Then           'use an address label
'            .DNA(t + 1).tipo = 1
'            .DNA(t + 1).value = Random(1, 999)
'            tx(1) = Str$(.DNA(t + 1).value)
'            tx(1) = "*" + Right(tx(1), Len(tx(1)) - 1)
'          Else                          'use a number
'            If Random(1, 10) < 9 Then   'small scale number
'              .DNA(t + 1).tipo = 0
'              .DNA(t + 1).value = Random(-100, 100)
'            Else                        'larger number for other stuff
'              .DNA(t + 1).tipo = 0
'              .DNA(t + 1).value = Random(-10000, 10000)
'            End If
'            tx(1) = Str$(.DNA(t + 1).value)
'            tx(1) = Right(tx(1), Len(tx(1)) - 1)
'          End If
'
'          r = Random(1, 99)             'randomize the second section of the condition
'          If r <= c(3) Then                 'use a regular number
'            .DNA(t + 2).tipo = 0
'            .DNA(t + 2).value = Random(-1000, 1000)
'            tx(2) = Str$(.DNA(t + 2).value)
'            tx(2) = Right(tx(2), Len(tx(2)) - 1)
'          ElseIf r <= c(3) + c(1) Then           'use a sysvar
'            .DNA(t + 2).tipo = 1
'            .DNA(t + 2).value = rob(n).usedvars(Random(1, rob(n).maxusedvars))
'            tx(2) = varname(CStr(.DNA(t + 2).value))
'            tx(2) = "*." + Right(tx(2), Len(tx(2)) - 1)
'          Else                          'use a label
'            .DNA(t + 2).tipo = 1
'            .DNA(t + 2).value = Random(1, 999)
'            tx(2) = Str$(.DNA(t + 2).value)
'            tx(2) = "*" + Right(tx(2), Len(tx(2)) - 1)
'          End If
'
'
'          .DNA(t + 3).tipo = 3
'          .DNA(t + 3).value = Random(1, 10)
'          tx(3) = Condname(rob(n).DNA(t + 3).value)
'          tx(3) = Right(tx(3), Len(tx(3)) - 1)
'
'          x = x + "new condition = " + tx(1) + " " + tx(2) + " " + tx(3) + vbCrLf
'
'          DNAto = DNAto + " " + tx(1)
'        End If
'      End If
'    End If
'    t = t + 1
'    If t > UBound(.DNA()) Then Exit Function
'  Wend
'  End With
End Function

' erases a condition
Public Function DNAEraseCond(n As Integer, x As String, DNAfrom As String) As Integer
'  Dim t As Integer
'  Dim a As Integer
'  Dim b As Integer
'  t = 1
'  DNAEraseCond = 0
'  While Not DNAend(n, t)
'    If rob(n).DNA(t).tipo = 3 Then
'      If Random(1, Int(rob(n).mutarray(9) / SimOpts.MutCurrMult)) = 1 Then
'        DNAEraseCond = DNAEraseCond + 1
'        x = x + "Condition "
'        If rob(n).DNA(t - 2).tipo = 1 Then
'          x = x + varname(CStr(rob(n).DNA(t - 2).value))
'        End If
'        If rob(n).DNA(t - 1).tipo = 1 Then
'          x = x + " *" + varname(CStr(rob(n).DNA(t - 1).value))
'        ElseIf rob(n).DNA(t - 1).tipo = 0 Then
'          x = x + " " + varname(CStr(rob(n).DNA(t - 1).value))
'        End If
'        x = x + " " + Condname(rob(n).DNA(t).value) + " erased at pos " + CStr(t - 2) + " through "
'        x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'
'        DNAfrom = DNAfrom + " " + varname(CStr(rob(n).DNA(t - 2).value))
'        DNAErase n, t - 2, 3
'      End If
'    End If
'    t = t + 1
'    If t > UBound(rob(n).DNA()) Then Exit Function
'  Wend
End Function

' duplicates instruction
Public Function DNADuplicateInstr(n As Integer, x As String) As Integer
  Dim t As Integer
  Dim A As Integer
  Dim b As Integer
'  t = 1
'  DNADuplicateInstr = 0
'  While Not DNAend(n, t)
'    If rob(n).DNA(t).tipo = 2 Then
'      If Random(1, Int(rob(n).mutarray(10) / SimOpts.MutCurrMult)) = 1 Then
'        If rob(n).DNA(t).value < 6 Then
'          If DNAMakeSpace(n, t - 2, 3) Then
'            DNADuplicateInstr = DNADuplicateInstr + 1
'            x = x + "Duplicated instruction at pos " + CStr(t)
'            x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          End If
'        Else
'          If DNAMakeSpace(n, t - 1, 2) Then
'            DNADuplicateInstr = DNADuplicateInstr + 1
'            x = x + "Duplicated instruction at pos " + CStr(t)
'            x = x + " during cycle " + Str(SimOpts.TotRunCycle) + vbCrLf
'          End If
'        End If
'      End If
'    End If
'    t = t + 1
'  Wend
End Function

' counts conditions in a specified gene
' (used to maintain low the number of conditions, actually 3)
Public Function DNACondsInGene(n As Integer, ByVal st As Integer) As Integer
  Dim cn As Integer
'  cn = 0
'  With rob(n)
'    If .DNA(st).tipo = 4 And .DNA(st).value = 1 Then
'      While Not (.DNA(st).tipo = 4 And .DNA(st).value = 2)
'        If .DNA(st).tipo = 3 Then cn = cn + 1
'        st = st + 1
'        If st > UBound(.DNA()) Then GoTo endwhile:
'      Wend
'endwhile:
'    End If
'  End With
'  DNACondsInGene = cn
End Function

'' test whether we are at the end of the dna
'Private Function DNAend(n As Integer, t As Integer) As Boolean
'  DNAend = False
'  With rob(n)
'    If t > UBound(.DNA()) Then Exit Function
'    If .DNA(t).tipo = 4 And .DNA(t).value = 4 Then DNAend = True
'  End With
'End Function

' deletes part of the dna, sp positions beginning from st
Public Sub DNAErase(n As Integer, st As Integer, sp As Integer)
  Dim t As Integer
  Dim fine As Integer
'  fine = 0
'  With rob(n)
'    While Not DNAend(n, fine)
'      fine = fine + 1
'    Wend
'    For t = st To fine - sp
'      .DNA(t) = .DNA(t + sp)
'    Next t
'  End With
End Sub

' makes some space in the dna, sp cells beginning from st
Public Function DNAMakeSpace(n As Integer, st As Integer, sp As Integer) As Boolean
  Dim j As Integer, fine As Integer
'  With rob(n)
'    While Not (.DNA(j).tipo = 4 And .DNA(j).value = 4)
'      j = j + 1
'      If j > UBound(.DNA()) Then
'        ReDim Preserve .DNA(j)
'        .DNA(j).tipo = 4
'        .DNA(j).value = 4
'      End If
'    Wend
'    fine = j
'    ReDim Preserve .DNA(fine + sp + 1)
'    'maxdnalen
'    For j = fine To st Step -1
'      .DNA(j + sp) = .DNA(j)
'    Next j
'    DNAMakeSpace = True
'    'Else
'    '  DNAMakeSpace = False
'    'End If
'  End With
End Function
