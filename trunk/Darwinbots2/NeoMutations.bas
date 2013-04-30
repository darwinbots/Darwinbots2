Attribute VB_Name = "NeoMutations"
Option Explicit

Private Type MutationsType
  PointPerUnit As Long 'per kilocycle
  PointCycle As Long 'the cycle we are goin to point mutate during
  PointMean As Single 'average length of DNA to change
  PointStdDev As Single 'std dev of this length

  ReproduceTotalPerUnit As Long
  Reproduce As Long 'a 1 in X chance to mutate when we reproduce

  ReversalPerUnit As Long
  ReversalLengthMean As Single
  ReversalLengthStdDev As Single

  CopyErrorPerUnit As Long
  InsertionPerUnit As Long
  AmplificationPerUnit As Long
  MajorDeletionPerUnit As Long
  MinorDeletionPerUnit As Long
End Type

'1-(perbot+1)^(1/DNALength) = per unit
'1-(1-perunit)^DNALength = perbot

Public Const PointUP As Integer = 0 'expressed as 1 chance in X per kilocycle per bp
Public Const MinorDeletionUP As Integer = 1
Public Const ReversalUP As Integer = 2
Public Const InsertionUP As Integer = 3
Public Const AmplificationUP As Integer = 4
Public Const MajorDeletionUP As Integer = 5
Public Const CopyErrorUP As Integer = 6
Public Const DeltaUP As Integer = 7
Public Const TranslocationUP As Integer = 8

Private Function MutationType(thing As Integer) As String
  MutationType = ""
  Select Case thing
    Case 0
      MutationType = "Point Mutation"
    Case 1
      MutationType = "Minor Deletion"
    Case 2
      MutationType = "Reversal"
    Case 3
      MutationType = "Insertion"
    Case 4
      MutationType = "Amplification"
    Case 5
      MutationType = "Major Deletion"
    Case 6
      MutationType = "Copy Error"
    Case 7
      MutationType = "Delta Mutation"
  End Select
  
End Function


'NEVER allow anything after end, which must be = DNALen
'ALWAYS assume that DNA is sized right
'ALWAYS size DNA correctly when mutating

Private Function EraseUnit(ByRef unit As block)
  unit.tipo = -1
  unit.value = -1
End Function

Public Function MakeSpace(ByRef DNA() As block, ByVal beginning As Long, ByVal length As Long, Optional DNALength As Integer = -1) As Boolean
  'add length elements after beginning.  Beginning doesn't move places
  'returns true if the space was created,
  'false otherwise

  Dim t As Integer
  If DNALength < 0 Then DNALength = DnaLen(DNA)
  If length < 1 Or beginning < 0 Or beginning > DNALength - 1 Or (DNALength + length > 32000) Then
    MakeSpace = False
    GoTo getout
  End If
  
  MakeSpace = True

  ReDim Preserve DNA(DNALength + length)

  For t = DNALength To beginning + 1 Step -1
    DNA(t + length) = DNA(t)
    EraseUnit DNA(t)
  Next t
getout:
End Function

Public Sub Delete(ByRef DNA() As block, ByRef beginning As Long, ByRef elements As Long, Optional DNALength As Integer = -1)
  'delete elements starting at beginning
  Dim t As Integer
  If DNALength < 0 Then DNALength = DnaLen(DNA)
  If elements < 1 Or beginning < 1 Or beginning > DNALength - 1 Then GoTo getout
 ' If elements + beginning > DNALength - 1 Then elements = DNALength - 1 - beginning

  For t = beginning + elements To DNALength
    DNA(t - elements) = DNA(t)
  Next t

  DNALength = DnaLen(DNA)
  ReDim Preserve DNA(DNALength)
getout:
End Sub

Public Function NewSubSpecies(n As Integer) As Integer
Dim i As Integer

  i = SpeciesFromBot(n)  ' Get the index into the species array for this bot
  SimOpts.Specie(i).SubSpeciesCounter = SimOpts.Specie(i).SubSpeciesCounter + 1 ' increment the counter
  If SimOpts.Specie(i).SubSpeciesCounter > 32000 Then SimOpts.Specie(i).SubSpeciesCounter = -32000 'wrap the counter if necessary
  NewSubSpecies = SimOpts.Specie(i).SubSpeciesCounter

End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub Mutate(robn As Integer, Optional reproducing As Boolean = False)
  Dim delta As Long
  Dim rates As Single 'Botsareus 4/9/2013 Robots that mutate faster retain more genetic
  rates = 15000

  With rob(robn)
    If Not .Mutables.Mutations Or SimOpts.DisableMutations Then GoTo getout
    delta = CLng(.LastMut)
    
    
    ismutating = True 'Botsareus 2/2/2013 Tells the parseor to ignore debugint and debugbool while the robot is mutating
    If Not reproducing Then
      If .Mutables.mutarray(PointUP) > 0 Then
        If rates > .Mutables.mutarray(PointUP) Then rates = .Mutables.mutarray(PointUP)
        PointMutation robn
      End If
      If .Mutables.mutarray(DeltaUP) > 0 Then DeltaMut robn
    Else
      If .Mutables.mutarray(CopyErrorUP) > 0 Then
        If rates > .Mutables.mutarray(CopyErrorUP) Then rates = .Mutables.mutarray(CopyErrorUP)
        CopyError robn
      End If
      If .Mutables.mutarray(InsertionUP) > 0 Then
        If rates > .Mutables.mutarray(InsertionUP) Then rates = .Mutables.mutarray(InsertionUP)
        Insertion robn
      End If
      If .Mutables.mutarray(ReversalUP) > 0 Then
        If rates > .Mutables.mutarray(ReversalUP) Then rates = .Mutables.mutarray(ReversalUP)
        Reversal robn
      End If
      'If .Mutables.mutarray(TranslocationUP) > 0 Then Translocation robn 'disabled for now for being buggy
      'If .Mutables.mutarray(AmplificationUP) > 0 Then Amplification robn
      If .Mutables.mutarray(MajorDeletionUP) > 0 Then
        If rates > .Mutables.mutarray(MajorDeletionUP) Then rates = .Mutables.mutarray(MajorDeletionUP)
        MajorDeletion robn
      End If
      If .Mutables.mutarray(MinorDeletionUP) > 0 Then
        If rates > .Mutables.mutarray(MinorDeletionUP) Then rates = .Mutables.mutarray(MinorDeletionUP)
        MinorDeletion robn
      End If
    End If
    ismutating = False 'Botsareus 2/2/2013 Tells the parseor to ignore debugint and debugbool while the robot is mutating
    

        
    delta = CLng(.LastMut) - delta 'Botsareus 9/4/2012 Moved delta check before overflow reset to fix an error where robot info is not being updated
    
    If .Mutations > 32000 Then .Mutations = 32000  'Botsareus 5/31/2012 Prevents mutations overflow
    If .LastMut > 32000 Then .LastMut = 32000
  
    If (delta > 0) Then  'The bot has mutated.
    
      If GDVisible Then
       rates = 5000 / rates
       .GenMut = .GenMut - .LastMut / rates
       If .GenMut < 0 Then .GenMut = 0
      End If
      
      mutatecolors robn, delta
      .SubSpecies = NewSubSpecies(robn)
      .genenum = CountGenes(rob(robn).DNA())
      .DnaLen = DnaLen(rob(robn).DNA())
      .mem(DnaLenSys) = .DnaLen
      .mem(GenesSys) = .genenum
    End If
getout:
  End With
End Sub


Private Sub PointMutation(robn As Integer)
  'assume the bot has a positive (>0) mutarray value for this
  
  Dim temp As Single
  Dim temp2 As Long
 
  With rob(robn)
    If .age = 0 Or .PointMutCycle < .age Then PointMutWhereAndWhen Rnd, robn, .PointMutBP
    
    'Do it again in case we get two point mutations in a single cycle
    While .age = .PointMutCycle And .age > 0 And .DnaLen > 1 ' Avoid endless loop when .age = 0 and/or .DNALen = 1
      temp = Gauss(.Mutables.StdDev(PointUP), .Mutables.Mean(PointUP))
      temp2 = Int(temp) Mod 32000        '<- Overflow was here when huge single is assigned to a Long
      ChangeDNA robn, .PointMutBP, temp2, .Mutables.PointWhatToChange
      PointMutWhereAndWhen Rnd, robn, .PointMutBP
    Wend
  End With
End Sub

Private Sub PointMutWhereAndWhen(randval As Single, robn As Integer, Optional offset As Long = 0)
  Dim result As Single
 
  'If randval = 0 Then randval = 0.0001
  With rob(robn)
    If .DnaLen = 1 Then GoTo getout ' avoid divide by 0 below
    
    'Here we test to make sure the probability of a point mutation isn't crazy high.
    'A value of 1 is the probability of mutating every base pair every 1000 cycles
    'Lets not let it get lower than 1 shall we?
    If .Mutables.mutarray(PointUP) < 1# And .Mutables.mutarray(PointUP) <> 0 Then
      .Mutables.mutarray(PointUP) = 1#
    End If
  
    'result = offset + Fix(Log(randval) / Log(1 - 1 / (1000 * .Mutables.mutarray(PointUP))))
    result = Log(1 - randval) / Log(1 - 1 / (1000 * .Mutables.mutarray(PointUP)))
    While result > 2000000000: result = result - 2000000000: Wend 'Botsareus 3/15/2013 overflow fix
    .PointMutBP = (result Mod (.DnaLen - 1)) + 1 'note that DNA(DNALen) = end.
    'We don't mutate end.  Also note that DNA does NOT start at 0th element
    .PointMutCycle = .age + result / (.DnaLen - 1)
getout:
  End With
End Sub

Private Sub DeltaMut(robn As Integer)
  Dim temp As Integer
  Dim newval As Single ' EricL Made newval Single instead of Long.
    
  With rob(robn)

  If Rnd > 1 - 1 / (100 * .Mutables.mutarray(DeltaUP)) Then
    If .Mutables.StdDev(DeltaUP) = 0 Then .Mutables.Mean(DeltaUP) = 50
    If .Mutables.Mean(DeltaUP) = 0 Then .Mutables.Mean(DeltaUP) = 25
    
    'temp = Random(0, 20)
    Do
      temp = Random(0, 7)
    Loop While .Mutables.mutarray(temp) <= 0
    
    Do
      newval = Gauss(.Mutables.Mean(DeltaUP), .Mutables.mutarray(temp))
    Loop While .Mutables.mutarray(temp) = newval Or newval <= 0
    
    .LastMutDetail = "Delta mutations changed " + MutationType(temp) + " from 1 in" + Str(.Mutables.mutarray(temp)) + _
      " to 1 in" + Str(newval) + vbCrLf + .LastMutDetail
    .Mutations = .Mutations + 1
    .LastMut = .LastMut + 1
    .Mutables.mutarray(temp) = newval
  End If
  
  End With
End Sub

Private Sub CopyError(robn As Integer)
  Dim t As Long
  Dim accum As Long
  Dim length As Long
  
  With rob(robn)
  
  For t = 1 To (.DnaLen - 1) 'note that DNA(.dnalen) = end, and we DON'T mutate that.
   
    If Rnd < 1 / rob(robn).Mutables.mutarray(CopyErrorUP) Then
      length = Gauss(rob(robn).Mutables.StdDev(CopyErrorUP), _
        rob(robn).Mutables.Mean(CopyErrorUP)) 'length
      accum = accum + length
      ChangeDNA robn, t, length, rob(robn).Mutables.CopyErrorWhatToChange, _
        CopyErrorUP
    End If
  Next t
  
  End With
End Sub

'Private Sub ChangeDNA(ByRef DNA() As block, nth As Long, Optional length As Long = 1)
Private Sub ChangeDNA(robn As Integer, ByVal nth As Long, Optional ByVal length As Long = 1, Optional ByVal PointWhatToChange As Integer = 50, Optional Mtype As Integer = PointUP)

  'we need to rework .lastmutdetail
  Dim Max As Long
  Dim temp As String
  Dim bp As block
  Dim tempbp As block
  Dim Name As String
  Dim oldname As String
  Dim t As Long
  Dim old As Long
  
  With rob(robn)
     
  For t = nth To (nth + length - 1) 'if length is 1, it's only one bp we're mutating, remember?
    If t >= .DnaLen Then GoTo getout 'don't mutate end either
    If .DNA(t).tipo = 10 Then GoTo getout 'mutations can't cross control barriers
    
    If Random(0, 99) < PointWhatToChange Then
      '''''''''''''''''''''''''''''''''''''''''
      'Mutate VALUE
      '''''''''''''''''''''''''''''''''''''''''
      If .DNA(t).value And Mtype = InsertionUP Then
        'Insertion mutations should get a good range for value.
        'Don't worry, this will get "mod"ed for non number commands.
        'This doesn't count as a mutation, since the whole:
        ' -- Add an element, set it's tipo and value to random stuff -- is a SINGLE mutation
        'we'll increment mutation counters and .lastmutdetail later.
        .DNA(t).value = Gauss(500, 0) 'generates values roughly between -1000 and 1000
      End If
      

      old = .DNA(t).value
      If .DNA(t).tipo = 0 Or .DNA(t).tipo = 1 Then '(number or *number)
        Do
         ' Dim a As Integer
          .DNA(t).value = Gauss(IIf(Abs(old) < 100, IIf(Sgn(old) = 0, Random(0, 1) * 2 - 1, Sgn(old)) * 10, old / 10), .DNA(t).value)
        Loop While .DNA(t).value = old

        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = MutationType(Mtype) + " changed " + TipoDetok(.DNA(t).tipo) + " from" + Str(old) + " to" + Str(.DNA(t).value) + " at position" + Str(t) + " during cycle" + Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
        
      Else
        'find max legit value
        'this should really be done a better way
        bp.tipo = .DNA(t).tipo
        Max = 0
        Do
          temp = ""
          Max = Max + 1
          bp.value = Max
          Parse temp, bp
        Loop While temp <> ""
        Max = Max - 1
        If Max <= 1 Then GoTo getout 'failsafe in case its an invalid type or there's no way to mutate it
        
        Do
          .DNA(t).value = Random(1, Max)
        Loop While .DNA(t).value = old

        bp.tipo = .DNA(t).tipo
        bp.value = old
        
        tempbp = .DNA(t)
        Parse Name, tempbp  ' Have to use a temp var because Parse() can change the arguments
        Parse oldname, bp
        
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = MutationType(Mtype) + " changed value of " + TipoDetok(.DNA(t).tipo) + " from " + _
          oldname + " to " + Name + " at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
      End If
    Else
      bp.tipo = .DNA(t).tipo
      bp.value = .DNA(t).value
      Do
        .DNA(t).tipo = Random(0, 20)
      Loop While .DNA(t).tipo = bp.tipo Or TipoDetok(.DNA(t).tipo) = ""
      Max = 0
      If .DNA(t).tipo >= 2 Then
        Do
          temp = ""
          Max = Max + 1
          .DNA(t).value = Max
          Parse temp, .DNA(t)
        Loop While temp <> ""
        Max = Max - 1
        If Max <= 1 Then GoTo getout 'failsafe in case its an invalid type or there's no way to mutate it
        .DNA(t).value = (bp.value Mod Max) 'put values in range
        If .DNA(t).value <= 0 Then
          .DNA(t).value = 1
        End If
      Else
        'we do nothing, it has to be in range
      End If
       tempbp = .DNA(t)
       Parse Name, tempbp ' Have to use a temp var because Parse() can change the arguments
       Parse oldname, bp
      .Mutations = .Mutations + 1
      .LastMut = .LastMut + 1
      
      .LastMutDetail = MutationType(Mtype) + " changed the " + TipoDetok(bp.tipo) + ": " + _
          oldname + " to the " + TipoDetok(.DNA(t).tipo) + ": " + Name + " at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
      
    End If
  Next t
getout:
  End With
End Sub

Private Sub Insertion(robn As Integer)
  Dim location As Integer
  Dim length As Integer
  Dim accum As Long
  Dim t As Long
  
  With rob(robn)
  For t = 1 To (.DnaLen - 1)
    If Rnd < 1 / .Mutables.mutarray(InsertionUP) Then
      If .Mutables.Mean(InsertionUP) = 0 Then .Mutables.Mean(InsertionUP) = 1
      Do
        length = Gauss(.Mutables.StdDev(InsertionUP), .Mutables.Mean(InsertionUP))
      Loop While length <= 0
      
      MakeSpace .DNA(), t + accum, length, .DnaLen
      rob(robn).DnaLen = rob(robn).DnaLen + length
   '   accum = accum + length
   '   ChangeDNA robn, t + accum, length, 100, InsertionUP 'set a good value up
   '   ChangeDNA robn, t + accum, length, 0, InsertionUP 'change type
       ChangeDNA robn, t + 1, length, 0, InsertionUP 'change the type first so that the mutated value is within the space of the new type
       ChangeDNA robn, t + 1, length, 100, InsertionUP 'set a good value up
    End If
  Next t
  End With
End Sub

Private Sub Reversal(robn As Integer)
  'reverses a length of DNA
  Dim length As Long
  Dim counter As Long
  Dim location As Long
  Dim low As Long
  Dim high As Long
  Dim templong As Long
  Dim tempblock As block
  Dim t As Long
  Dim second As Long
  
  With rob(robn)
    For t = 1 To (.DnaLen - 1)
      If Rnd < 1 / .Mutables.mutarray(ReversalUP) Then
        If .Mutables.Mean(ReversalUP) < 2 Then .Mutables.Mean(ReversalUP) = 2
        
        Do
          length = Gauss(.Mutables.StdDev(ReversalUP), .Mutables.Mean(ReversalUP))
        Loop While length <= 0
        
        length = length \ 2 'be sure we go an even amount to either side
        
        If t - length < 1 Then length = t - 1
        If t + length > .DnaLen - 1 Then length = .DnaLen - 1 - t
        If length > 0 Then
        
          second = 0
          For counter = t - length To t - 1
            tempblock = .DNA(counter)
            .DNA(counter) = .DNA(t + length - second)
            .DNA(t + length - second) = tempblock
            second = second + 1
          Next counter
          
          .Mutations = .Mutations + 1
          .LastMut = .LastMut + 1
          .LastMutDetail = "Reversal of" + Str(length * 2 + 1) + "bps centered at " + Str(t) + " during cycle" + _
            Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
         
        End If
      End If
    Next t
  End With
End Sub

Private Sub MinorDeletion(robn As Integer)
  Dim length As Long, t As Long
  With rob(robn)
    If .Mutables.Mean(MinorDeletionUP) < 1 Then .Mutables.Mean(MinorDeletionUP) = 1
    For t = 1 To (.DnaLen - 1)
      If Rnd < 1 / .Mutables.mutarray(MinorDeletionUP) Then
        Do
          length = Gauss(.Mutables.StdDev(MinorDeletionUP), .Mutables.Mean(MinorDeletionUP))
        Loop While length <= 0
        
        If t + length > .DnaLen - 1 Then length = .DnaLen - 1 - t
        
        Delete .DNA, t, length, .DnaLen
        
        .DnaLen = DnaLen(.DNA())
        
        .LastMutDetail = "Minor Deletion deleted a run of" + _
          Str(length) + " bps at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
        
      End If
    Next t
  End With
End Sub

Private Sub MajorDeletion(robn As Integer)
  Dim length As Long, t As Long
  With rob(robn)
    If .Mutables.Mean(MajorDeletionUP) < 1 Then .Mutables.Mean(MajorDeletionUP) = 1
    For t = 1 To (.DnaLen - 1)
      If Rnd < 1 / .Mutables.mutarray(MajorDeletionUP) Then
        Do
          length = Gauss(.Mutables.StdDev(MajorDeletionUP), .Mutables.Mean(MajorDeletionUP))
        Loop While length <= 0
        
        If t + length > .DnaLen - 1 Then length = .DnaLen - 1 - t
        
        Delete .DNA, t, length, .DnaLen
        
        .DnaLen = DnaLen(.DNA())
        
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Major Deletion deleted a run of" + _
          Str(length) + " bps at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
        
      End If
    Next t
  End With
End Sub

Private Sub Amplification(robn As Integer)
  '1. pick a spot (1 to .dnalen - 1)
  '2. Run a length, copied to a temporary location
  '3.  Pick a new spot (1 to .dnalen - 1)
  '4. Insert copied DNA
  
  Dim t As Long
  Dim length As Long
  With rob(robn)
  Dim tempDNA() As block
  Dim start As Long
  Dim second As Long
  Dim counter As Long
  
  For t = 1 To .DnaLen - 1
    If Rnd < 1 / .Mutables.mutarray(AmplificationUP) Then
      length = Gauss(.Mutables.StdDev(AmplificationUP), .Mutables.Mean(AmplificationUP))
      If length < 1 Then length = 1
      
      length = length - 1
      length = length \ 2
      If t - length < 1 Then length = t - 1
      If t + length > .DnaLen - 1 Then length = .DnaLen - 1 - t
      
      If length > 0 Then
      
        ReDim tempDNA(length * 2 + 1)
      
        'add "end" to end of temporary DNA
        tempDNA(length * 2 + 1).tipo = 10
        tempDNA(length * 2 + 1).value = 1
        
        second = 0
        For counter = t - length To t + length
          tempDNA(second) = .DNA(counter)
          second = second + 1
        Next counter
        'we now have the appropriate length of DNA in the temporary array.
      
        'open up a hole
        start = Random(1, .DnaLen - 1)
        MakeSpace .DNA(), start, DnaLen(tempDNA), .DnaLen
           
        For counter = start + 1 To start + DnaLen(tempDNA)
          .DNA(counter) = tempDNA(counter - start - 1)
        Next counter
      
        'done!  weee!
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Amplification copied a series at" + Str(t) + Str(length * 2 + 1) + "bps long to " + Str(start) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
       
      End If
    End If
  Next t
  End With
End Sub

Private Sub Translocation(robn As Integer)
  'Bug testing has not been comprehensive for this function
  'This could be a potential source for bugs
  
  'If this function looks like mish mash, the best way to figure it out is to walk through
  'in debug mode.  Then it makes much more sense.  If you don't have a firm grasp of the debug
  'controls, I'd recommend spending the time to figure them out.  Well worth it.
  
  '1. Find a spot (spot = x) (range: 1 to dnalen - 1)
  '2. cut out from the rest of the DNA a segment length long centered at x
  '3. Close gap in DNA
  '4. Find new spot in DNA (spot = y) (range: 0, dnalen - 1)
  '5. Starting at y, add segment after it.
  
  Dim t As Long, counter As Long
  Dim length As Long
  Dim tempDNA() As block
  Dim second As Long
  Dim start As Long
  
  With rob(robn)
  
  If .Mutables.Mean(TranslocationUP) < 1 Then .Mutables.Mean(TranslocationUP) = 1
  For t = 1 To .DnaLen - 1
    If Rnd < 1 / .Mutables.mutarray(TranslocationUP) Then
      
      '1: Spot = t
      '2a: find length of segment
      length = Gauss(.Mutables.StdDev(TranslocationUP), .Mutables.Mean(TranslocationUP))
      If length < 1 Then length = 1
      
      If t + length > .DnaLen Then length = (.DnaLen) - t
      If t - length < 1 Then length = t - 1
      
      If length >= 1 Then
      '2b: centered at t, cut out segment of length
      ReDim tempDNA(length)
      
      'add "end" to end of temporary DNA
      tempDNA(length).tipo = 10
      tempDNA(length).value = 1
      
      second = 0
      length = length - 1
      start = t - (length - length Mod 2) \ 2
      If start < 1 Then start = 1
      
      For counter = start To t + (length - length Mod 2) \ 2 + length Mod 2
        If counter >= 1 And counter <= .DnaLen - 1 Then
          tempDNA(second) = .DNA(counter)
          .DNA(counter).tipo = 0
          .DNA(counter).value = 0
          second = second + 1
        Else
          length = length - 1
        End If
      Next counter
      'we now have the appropriate length of DNA in the temporary array.
      
      second = 0
      For counter = t + (length - length Mod 2) \ 2 + length Mod 2 + 1 To .DnaLen
        .DNA(start + second) = .DNA(counter)
        second = second + 1
        .DNA(counter).tipo = 0
        .DNA(counter).value = 0
      Next counter
      'we've closed the hole
      'the above works jsut fine
      
      'open a new hole at a random location
      second = 0
      start = Random(1, (.DnaLen - 1) - (length + 1))
      For counter = .DnaLen - (length + 1) To start + 1 Step -1
        .DNA(.DnaLen - second) = .DNA(counter)
        second = second + 1
        .DNA(counter).tipo = 0
        .DNA(counter).value = 0
      Next counter
      
      'Now recopy tempDNA to .DNA in new spot
      For counter = start + 1 To start + length + 1
        .DNA(counter) = tempDNA(counter - start - 1)
      Next counter
      
      'repeat
      .Mutations = .Mutations + 1
      .LastMut = .LastMut + 1
      .LastMutDetail = "Translocation moved a series " + Str(length + 1) + "long at position " + Str(t) + _
        " to position " + Str(start + 1) + " during cycle" + _
        Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
      
      
      End If
    End If
  Next t
  End With
End Sub

' mutates robot colour in robot n a times
Private Sub mutatecolors(n As Integer, a As Long)
  Dim color As Long
  Dim r As Long, g As Long, b As Long
  Dim counter As Long
  
  color = rob(n).color
  
  b = color \ (65536)
  g = color \ 256 - b * 256
  r = color - b * 65536 - g * 256
  
  For counter = 1 To a
    Select Case (Random(1, 3))
      Case 1
        b = b + (Random(0, 1) * 2 - 1) * 20
      Case 2
        g = g + (Random(0, 1) * 2 - 1) * 20
      Case 3
        r = r + (Random(0, 1) * 2 - 1) * 20
    End Select
    
    If r > 255 Then r = 255
    If r < 0 Then r = 0
    
    If g > 255 Then g = 255
    If g < 0 Then g = 0
    
    If b > 255 Then b = 255
    If b < 0 Then b = 0
  Next counter
  
  rob(n).color = b * 65536 + g * 256 + r
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Function delgene(n As Integer, g As Integer) As Boolean
  Dim k As Integer, t As Integer
  k = rob(n).genenum
  If g > 0 And g <= k Then
    DeleteSpecificGene rob(n).DNA, g
    delgene = True
    rob(n).DnaLen = DnaLen(rob(n).DNA)
    rob(n).genenum = CountGenes(rob(n).DNA)
    rob(n).mem(DnaLenSys) = rob(n).DnaLen
    rob(n).mem(GenesSys) = rob(n).genenum
    makeoccurrlist n
  End If
End Function

Public Sub DeleteSpecificGene(ByRef DNA() As block, k As Integer)
  Dim i As Long, f As Long
  
  i = genepos(DNA, k)
  If i < 0 Then GoTo getout
  f = GeneEnd(DNA, i)
  Delete DNA, i, f - i + 1 ' EricL Added +1
getout:
End Sub

Public Sub SetDefaultMutationRates(ByRef changeme As mutationprobs)
  Dim a As Long
  With (changeme)
  
  For a = 0 To 20
    .mutarray(a) = 5000
    .Mean(a) = 1
    .StdDev(a) = 0
  Next a
  
  .Mean(PointUP) = 1
  .StdDev(PointUP) = 0
  
  .Mean(DeltaUP) = 500
  .StdDev(DeltaUP) = 150
  
  .Mean(MinorDeletionUP) = 1
  .StdDev(MinorDeletionUP) = 0
  
  .Mean(InsertionUP) = 1
  .StdDev(InsertionUP) = 0
  
  .Mean(CopyErrorUP) = 1
  .StdDev(CopyErrorUP) = 0
  
  .Mean(MajorDeletionUP) = 3
  .StdDev(MajorDeletionUP) = 1
  
  .Mean(ReversalUP) = 3
  .StdDev(ReversalUP) = 1
  
  .CopyErrorWhatToChange = 80
  .PointWhatToChange = 80
  End With
End Sub
