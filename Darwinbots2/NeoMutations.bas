Attribute VB_Name = "NeoMutations"
Option Explicit

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
Public Const P2UP As Integer = 9 'Botsareus 12/10/2013 new mutation rates
Public Const CE2UP As Integer = 10

Private overtime As Long 'Botsareus 6/11/2014 Causes the loop to stop at some point


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

Public Function MakeSpace(ByRef DNA() As block, ByVal beginning As Long, ByVal Length As Long, Optional DNALength As Integer = -1) As Boolean
  'add length elements after beginning.  Beginning doesn't move places
  'returns true if the space was created,
  'false otherwise

  Dim t As Integer
  If DNALength < 0 Then DNALength = DnaLen(DNA)
  If Length < 1 Or beginning < 0 Or beginning > DNALength - 1 Or (DNALength + Length > 32000) Then
    MakeSpace = False
    GoTo getout
  End If
  
  MakeSpace = True

  ReDim Preserve DNA(DNALength + Length)

  For t = DNALength To beginning + 1 Step -1
    DNA(t + Length) = DNA(t)
    EraseUnit DNA(t)
    overtime = overtime - 1
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
    On Error GoTo step2 'small error mod
    DNA(t - elements) = DNA(t)
  Next t

step2:
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

Public Sub Mutate(ByVal robn As Integer, Optional reproducing As Boolean = False) 'Botsareus 12/17/2013
  Dim Delta As Long

  With rob(robn)
    If Not .Mutables.Mutations Or SimOpts.DisableMutations Then GoTo getout
    Delta = CLng(.LastMut)
    
    
    ismutating = True 'Botsareus 2/2/2013 Tells the parseor to ignore debugint and debugbool while the robot is mutating
    If Not reproducing Then
    
      overtime = UBound(rob(robn).DNA) ^ (1 / 3) * 3000
    
      If .Mutables.mutarray(PointUP) > 0 Then PointMutation robn
      If .Mutables.mutarray(DeltaUP) > 0 And Not Delta2 Then DeltaMut robn
      If .Mutables.mutarray(P2UP) > 0 And sunbelt Then PointMutation2 robn
      
      'special case update epigenetic reset
      If CLng(.LastMut) - Delta > 0 And epireset Then .MutEpiReset = .MutEpiReset + (CLng(.LastMut) - Delta) ^ epiresetemp
      
      'Delta2 point mutation change
      If Delta2 And DeltaPM > 0 Then
       If .age Mod DeltaPM = 0 And .age > 0 Then
        Dim MratesMax As Long
        MratesMax = IIf(NormMut, CLng(.DnaLen) * CLng(valMaxNormMut), 2000000000)
        Dim t As Byte
        For t = 0 To 9 Step 9 'Point and Point2
        If .Mutables.mutarray(t) < 1 Then GoTo skip 'Botsareus 1/3/2014 if mutation off then skip it
         If Rnd < DeltaMainChance / 100 Then
          If DeltaMainExp <> 0 Then .Mutables.mutarray(t) = .Mutables.mutarray(t) * 10 ^ ((Rnd * 2 - 1) / DeltaMainExp)
          .Mutables.mutarray(t) = .Mutables.mutarray(t) + (Rnd * 2 - 1) * DeltaMainLn
          If .Mutables.mutarray(t) < 1 Then .Mutables.mutarray(t) = 1
          If .Mutables.mutarray(t) > MratesMax Then .Mutables.mutarray(t) = MratesMax
         End If
         If Rnd < DeltaDevChance / 100 Then
          If DeltaDevExp <> 0 Then .Mutables.StdDev(t) = .Mutables.StdDev(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
          .Mutables.StdDev(t) = .Mutables.StdDev(t) + (Rnd * 2 - 1) * DeltaDevLn
          If DeltaDevExp <> 0 Then .Mutables.Mean(t) = .Mutables.Mean(t) * 10 ^ ((Rnd * 2 - 1) / DeltaDevExp)
          .Mutables.Mean(t) = .Mutables.Mean(t) + (Rnd * 2 - 1) * DeltaDevLn
          'Max range is always 0 to 800
          If .Mutables.StdDev(t) < 0 Then .Mutables.StdDev(t) = 0
          If .Mutables.StdDev(t) > 200 Then .Mutables.StdDev(t) = 200
          If .Mutables.Mean(t) < 1 Then .Mutables.Mean(t) = 1
          If .Mutables.Mean(t) > 400 Then .Mutables.Mean(t) = 400
         End If
skip:
        Next
        .Mutables.PointWhatToChange = .Mutables.PointWhatToChange + (Rnd * 2 - 1) * DeltaWTC
        If .Mutables.PointWhatToChange < 0 Then .Mutables.PointWhatToChange = 0
        If .Mutables.PointWhatToChange > 100 Then .Mutables.PointWhatToChange = 100
        .Point2MutCycle = 0
        .PointMutCycle = 0
       End If
      End If
      
    Else
    
      overtime = UBound(rob(robn).DNA) ^ (1 / 3) * 3000
      If .Mutables.mutarray(CopyErrorUP) > 0 Then CopyError robn
      If overtime < 0 Then Exit Sub
      If .Mutables.mutarray(CE2UP) > 0 And sunbelt Then CopyError2 robn
      If overtime < 0 Then Exit Sub
      If .Mutables.mutarray(InsertionUP) > 0 Then Insertion robn
      If overtime < 0 Then Exit Sub
      If .Mutables.mutarray(ReversalUP) > 0 Then Reversal robn
      If overtime < 0 Then Exit Sub
      If .Mutables.mutarray(TranslocationUP) > 0 And sunbelt Then Translocation robn 'Botsareus Translocation and Amplification still bugy, but I want them.
      If .Mutables.mutarray(AmplificationUP) > 0 And sunbelt Then Amplification robn
      overtime = UBound(rob(robn).DNA) ^ (1 / 3) * 3000
      If .Mutables.mutarray(MajorDeletionUP) > 0 Then MajorDeletion robn
      overtime = UBound(rob(robn).DNA) ^ (1 / 3) * 3000
      If .Mutables.mutarray(MinorDeletionUP) > 0 Then MinorDeletion robn
    End If

    ismutating = False 'Botsareus 2/2/2013 Tells the parseor to ignore debugint and debugbool while the robot is mutating
        
    Delta = CLng(.LastMut) - Delta 'Botsareus 9/4/2012 Moved delta check before overflow reset to fix an error where robot info is not being updated
  
    'auto forking
    If SimOpts.EnableAutoSpeciation Then
        If CDbl(.Mutations) > CDbl(.DnaLen) * CDbl(SimOpts.SpeciationGeneticDistance / 100) Then
                Dim robname As String
                Dim splitname() As String
                'generate new specie name
                SimOpts.SpeciationForkInterval = SimOpts.SpeciationForkInterval + 1
                'remove old nick name
                splitname = Split(.FName, ")")
                'if it is a nick name only
                If Left(splitname(0), 1) = "(" And IsNumeric(Right(splitname(0), Len(splitname(0)) - 1)) Then
                    robname = splitname(1)
                Else
                    robname = .FName
                End If
                    robname = "(" & SimOpts.SpeciationForkInterval & ")" & .FName
                'do we have room for new specie?
                If SimOpts.SpeciesNum < 49 Then
                    .FName = robname
                    .Mutations = 0
                    AddSpecie robn, False
                Else
                    SimOpts.SpeciationForkInterval = SimOpts.SpeciationForkInterval - 1
                End If
        End If
    End If
  
    If .Mutations > 32000 Then .Mutations = 32000  'Botsareus 5/31/2012 Prevents mutations overflow
    If .LastMut > 32000 Then .LastMut = 32000
  
    If (Delta > 0) Then  'The bot has mutated.
    
       .GenMut = .GenMut - .LastMut
       If .GenMut < 0 Then .GenMut = 0
      
      mutatecolors robn, Delta
      .SubSpecies = NewSubSpecies(robn)
      .genenum = CountGenes(rob(robn).DNA())
      .DnaLen = DnaLen(rob(robn).DNA())
      .mem(DnaLenSys) = .DnaLen
      .mem(GenesSys) = .genenum
    End If
getout:
  End With
End Sub

Private Sub Amplification(robn As Integer) 'Botsareus 12/10/2013
On Error GoTo getout:
  '1. pick a spot (1 to .dnalen - 1)
  '2. Run a length, copied to a temporary location
  '3. Pick a new spot (1 to .dnalen - 1)
  '4. Insert copied DNA
    
  overtime = UBound(rob(robn).DNA) ^ (1 / 3) * 3000
  
  Dim t As Long
  Dim Length As Long
  With rob(robn)
  
  Dim tempDNA() As block
  Dim start As Long
  Dim second As Long
  Dim counter As Long
  t = 1
  Do
  t = t + 1
    overtime = overtime - 1
    If Rnd < 1 / (.Mutables.mutarray(AmplificationUP) / SimOpts.MutCurrMult) Then
      Length = Gauss(.Mutables.StdDev(AmplificationUP), .Mutables.Mean(AmplificationUP))
      Length = Length Mod UBound(.DNA)
      If Length < 1 Then Length = 1
      
      Length = Length - 1
      Length = Length \ 2
      If t - Length < 1 Then GoTo skip
      If t + Length > .DnaLen - 1 Then GoTo skip
      If UBound(rob(robn).DNA) + CLng(Length) > 32000 Then GoTo skip
      
      If Length > 0 Then
      
        ReDim tempDNA(Length * 2)
        
        second = 0
        For counter = t - Length To t + Length
          overtime = overtime - 1
          tempDNA(second) = .DNA(counter)
          second = second + 1
        Next counter
        'we now have the appropriate length of DNA in the temporary array.

        'open up a hole 'safe size
        If UBound(.DNA) > 5000 Then Exit Sub
        start = Random(1, UBound(.DNA) - 2)
        MakeSpace .DNA(), start, UBound(tempDNA) + 1

        For counter = start + 1 To start + UBound(tempDNA) + 1
         overtime = overtime - 1
         .DNA(counter) = tempDNA(counter - start - 1)
        Next counter
             
        'BOTSAREUSIFIED
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Amplification copied a series at" + Str(t) + Str(Length * 2 + 1) + "bps long to " + Str(start) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
          
           If overtime < 0 Then Exit Sub
       
      End If
    End If
skip:
  Loop Until t >= UBound(.DNA) - 1
  
        'add "end" to end of the DNA
        .DNA(UBound(.DNA)).tipo = 10
        .DNA(UBound(.DNA)).value = 1
  
  End With
getout:
End Sub


Private Sub Translocation(robn As Integer) 'Botsareus 12/10/2013
On Error GoTo getout:
  '1. pick a spot (1 to .dnalen - 1)
  '2. Run a length, copied to a temporary location
  '3.  Pick a new spot (1 to .dnalen - 1)
  '4. Insert copied DNA
  
  Dim t As Long
  Dim Length As Long
  With rob(robn)
  
  Dim tempDNA() As block
  Dim start As Long
  Dim second As Long
  Dim counter As Long
  
  For t = 1 To UBound(.DNA) - 1
    If Rnd < 1 / (.Mutables.mutarray(TranslocationUP) / SimOpts.MutCurrMult) Then

      Length = Gauss(.Mutables.StdDev(TranslocationUP), .Mutables.Mean(TranslocationUP))
      Length = Length Mod UBound(.DNA)
      If Length < 1 Then Length = 1
      
      Length = Length - 1
      Length = Length \ 2
      If t - Length < 1 Then GoTo skip
      If t + Length > UBound(.DNA) - 1 Then GoTo skip
      
      If Length > 0 Then
      
        ReDim tempDNA(Length * 2)
        
        second = 0
        For counter = t - Length To t + Length
          tempDNA(second) = .DNA(counter)
          second = second + 1
        Next counter
        'we now have the appropriate length of DNA in the temporary array.
        
        'delete fragment
        Delete .DNA, t - Length, Length * 2

        'open up a hole
        start = Random(1, UBound(.DNA) - 2)
        MakeSpace .DNA(), start, UBound(tempDNA)

        For counter = start + 1 To start + UBound(tempDNA) + 1
         .DNA(counter) = tempDNA(counter - start - 1)
        Next counter
             
        'BOTSAREUSIFIED
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Translocation moved a series at" + Str(t) + Str(Length * 2 + 1) + "bps long to " + Str(start) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
       
      End If
    End If
    
skip:
  Next t
  
        'add "end" to end of the DNA
        .DNA(UBound(.DNA)).tipo = 10
        .DNA(UBound(.DNA)).value = 1
  
  End With
getout:
End Sub

Private Sub CopyError2(robn As Integer) 'Just like Copyerror but effects only special chars
Dim DNASize As Integer
Dim e As Integer 'counter
Dim e2 As Integer 'update generator (our position)
Dim randomsysvar As Integer
Dim holddetail As String

With rob(robn)
    DNASize = DnaLen(.DNA) - 1 'get aprox length
    
    Dim datahit() As Boolean 'operation repeat prevention
    ReDim datahit(DNASize)
    For e = 0 To DNASize
        If Rnd < (1 / (.Mutables.mutarray(CE2UP) / SimOpts.MutCurrMult * 28 / 300)) Then    'chance
            Do
                e2 = Int(Rnd * (DNASize + 1))
            Loop Until datahit(e2) = False
            datahit(e2) = True
            Do
                randomsysvar = Int(Rnd * 1000)
            Loop Until sysvar(randomsysvar).Name <> ""
            .DNA(e2).tipo = 1
            If .DNA(e2 + 1).tipo = 7 Then .DNA(e2).tipo = 0 'if store , inc , or dec then type 0
            holddetail = "CopyError2 changed dna location " & e2 & " to sysvar " & IIf(.DNA(e2).tipo = 1, "*.", ".") & sysvar(randomsysvar).Name
            .DNA(e2).value = sysvar(randomsysvar).value 'transfears value, not adress
            
            'special cases
            If e2 < DNASize - 2 Then
                'for .shoot store
                If .DNA(e2 + 1).tipo = 0 And .DNA(e2 + 1).value = shoot _
                And .DNA(e2 + 2).tipo = 7 And .DNA(e2 + 2).value = 1 Then
                    .DNA(e2).value = -Int(Rnd * 9) - 1
                     If .DNA(e2).value = -9 Then .DNA(e2).value = sysvar(randomsysvar).value
                    .DNA(e2).tipo = 0
                    holddetail = "CopyError2 changed dna location " & e2 & " to " & .DNA(e2).value
                End If
                'for .focuseye store
                If .DNA(e2 + 1).tipo = 0 And .DNA(e2 + 1).value = FOCUSEYE _
                And .DNA(e2 + 2).tipo = 7 And .DNA(e2 + 2).value = 1 Then
                    .DNA(e2).value = Int(Rnd * 9) - 4
                    .DNA(e2).tipo = 0
                    holddetail = "CopyError2 changed dna location " & e2 & " to " & .DNA(e2).value
                End If
            End If

            .LastMutDetail = holddetail & " during cycle" & Str(SimOpts.TotRunCycle) & vbCrLf & .LastMutDetail
            .Mutations = .Mutations + 1
            .LastMut = .LastMut + 1
        End If
    Next
End With
End Sub

Private Sub PointMutation2(robn As Integer) 'Botsareus 12/10/2013
  'assume the bot has a positive (>0) mutarray value for this
  
  Dim randomsysvar As Integer
  Dim randompos As Integer 'update generator
  Dim DNASize As Integer
  Dim holddetail As String
   
  With rob(robn)
    If .age = 0 Or .Point2MutCycle < .age Then Point2MutWhen Rnd, robn
    
    'Do it again in case we get two point mutations in a single cycle
    While .age = .Point2MutCycle And .age > 0 And .DnaLen > 1 ' Avoid endless loop when .age = 0 and/or .DNALen = 1
        
        'sysvar mutation
            DNASize = DnaLen(.DNA) - 1 'get aprox length
            randompos = Int(Rnd * (DNASize + 1))
            
            Do
                randomsysvar = Int(Rnd * 1000)
            Loop Until sysvar(randomsysvar).Name <> ""
            
            
            If .DNA(randompos).tipo = 1 And Int(Rnd * 2) = 0 Then 'sometimes we need to introduce more stores
            
              .DNA(randompos).tipo = 7
              .DNA(randompos).value = 1
             
              holddetail = "PointMutation2 changed dna location " & randompos & " to store"
            
            Else
            
              .DNA(randompos).tipo = 1
              If .DNA(randompos + 1).tipo = 7 Then .DNA(randompos).tipo = 0 'if store , inc , or dec then type 0
            
              .DNA(randompos).value = sysvar(randomsysvar).value 'transfears value, not adress
            
              holddetail = "PointMutation2 changed dna location " & randompos & " to sysvar " & IIf(.DNA(randompos).tipo = 1, "*.", ".") & sysvar(randomsysvar).Name
            
            End If
            
            'special case for .shoot store
            If randompos < DNASize - 2 Then
                If .DNA(randompos + 1).tipo = 0 And .DNA(randompos + 1).value = shoot _
                And .DNA(randompos + 2).tipo = 7 And .DNA(randompos + 2).value = 1 Then
                    .DNA(randompos).value = -Int(Rnd * 9) - 1
                      If .DNA(randompos).value = -9 Then .DNA(randompos).value = sysvar(randomsysvar).value
                    .DNA(randompos).tipo = 0
                    holddetail = "PointMutation2 changed dna location " & randompos & " to " & .DNA(randompos).value
                End If
                'for .focuseye store
                If .DNA(randompos + 1).tipo = 0 And .DNA(randompos + 1).value = FOCUSEYE _
                And .DNA(randompos + 2).tipo = 7 And .DNA(randompos + 2).value = 1 Then
                    .DNA(randompos).value = Int(Rnd * 9) - 4
                    .DNA(randompos).tipo = 0
                    holddetail = "PointMutation2 changed dna location " & randompos & " to " & .DNA(randompos).value
                End If
            End If
            
            .Mutations = .Mutations + 1
            .LastMut = .LastMut + 1
            .LastMutDetail = holddetail & " during cycle" & Str(SimOpts.TotRunCycle) & vbCrLf & .LastMutDetail
      
        
      Point2MutWhen Rnd, robn
    Wend
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


Private Sub Point2MutWhen(randval As Single, robn As Integer)
  Dim result As Single
  
  Dim mutation_rate As Single
 
  'If randval = 0 Then randval = 0.0001
  With rob(robn)
    If .DnaLen = 1 Then GoTo getout ' avoid divide by 0 below
    
    mutation_rate = .Mutables.mutarray(P2UP) / SimOpts.MutCurrMult
    
    'keeps Point2 lengths the same as Point Botsareus 1/14/2014 Checking to make sure value is >= 1
    Dim calc_gauss As Double
    calc_gauss = Gauss(.Mutables.StdDev(PointUP), .Mutables.Mean(PointUP))
    If calc_gauss < 1 Then calc_gauss = 1
    
    mutation_rate = mutation_rate / calc_gauss
    
    'Here we test to make sure the probability of a point mutation isn't crazy high.
    'A value of 1 is the probability of mutating every base pair every 1000 cycles
    'Lets not let it get lower than 1 shall we?
    If mutation_rate < 1 And mutation_rate > 0 Then
      mutation_rate = 1
    End If
  
    'result = offset + Fix(Log(randval) / Log(1 - 1 / (1000 * .Mutables.mutarray(PointUP))))
    result = Log(1 - randval) / Log(1 - 1 / (1000 * mutation_rate))
    While result > 1800000000: result = result - 1800000000: Wend 'Botsareus 3/15/2013 overflow fix
    .Point2MutCycle = .age + result / (.DnaLen - 1)
getout:
  End With
End Sub


Private Sub PointMutWhereAndWhen(randval As Single, robn As Integer, Optional offset As Long = 0)
  Dim result As Single
  
  Dim mutation_rate As Single
  
  'If randval = 0 Then randval = 0.0001
  With rob(robn)
    If .DnaLen = 1 Then GoTo getout ' avoid divide by 0 below
    
    mutation_rate = .Mutables.mutarray(PointUP) / SimOpts.MutCurrMult
    
    'Here we test to make sure the probability of a point mutation isn't crazy high.
    'A value of 1 is the probability of mutating every base pair every 1000 cycles
    'Lets not let it get lower than 1 shall we?
    If mutation_rate < 1 And mutation_rate > 0 Then
      mutation_rate = 1
    End If
  
    'result = offset + Fix(Log(randval) / Log(1 - 1 / (1000 * .Mutables.mutarray(PointUP))))
    result = Log(1 - randval) / Log(1 - 1 / (1000 * mutation_rate))
    While result > 1800000000: result = result - 1800000000: Wend 'Botsareus 3/15/2013 overflow fix
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

  If Rnd > 1 - 1 / (100 * .Mutables.mutarray(DeltaUP) / SimOpts.MutCurrMult) Then
    If .Mutables.StdDev(DeltaUP) = 0 Then .Mutables.Mean(DeltaUP) = 50
    If .Mutables.Mean(DeltaUP) = 0 Then .Mutables.Mean(DeltaUP) = 25
    
    'temp = Random(0, 20)
    Do
      temp = Random(0, 10) 'Botsareus 12/14/2013 Added new mutations
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
  Dim Length As Long
  
  With rob(robn)
  
  For t = 1 To (.DnaLen - 1) 'note that DNA(.dnalen) = end, and we DON'T mutate that.
   
    If Rnd < 1 / (rob(robn).Mutables.mutarray(CopyErrorUP) / SimOpts.MutCurrMult) Then
      Length = Gauss(rob(robn).Mutables.StdDev(CopyErrorUP), _
        rob(robn).Mutables.Mean(CopyErrorUP)) 'length
      accum = accum + Length
      ChangeDNA robn, t, Length, rob(robn).Mutables.CopyErrorWhatToChange, _
        CopyErrorUP
    End If
  Next t
  
  End With
End Sub

'Private Sub ChangeDNA(ByRef DNA() As block, nth As Long, Optional length As Long = 1)
Private Sub ChangeDNA(robn As Integer, ByVal nth As Long, Optional ByVal Length As Long = 1, Optional ByVal PointWhatToChange As Integer = 50, Optional Mtype As Integer = PointUP)

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
     
  For t = nth To (nth + Length - 1) 'if length is 1, it's only one bp we're mutating, remember?
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
        overtime = overtime - 1: If overtime < 0 And Mtype <> InsertionUP Then Exit Sub
        
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
        
        Name = ""
        oldname = ""
        Parse Name, tempbp    ' Have to use a temp var because Parse() can change the arguments
        Parse oldname, bp
        
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        overtime = overtime - 1: If overtime < 0 And Mtype <> InsertionUP Then Exit Sub
        
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
       
       Name = ""
       oldname = ""
       Parse Name, tempbp ' Have to use a temp var because Parse() can change the arguments
       Parse oldname, bp
      .Mutations = .Mutations + 1
      .LastMut = .LastMut + 1
      overtime = overtime - 1: If overtime < 0 And Mtype <> InsertionUP Then Exit Sub
      
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
  Dim Length As Integer
  Dim accum As Long
  Dim t As Long
  
  With rob(robn)
  For t = 1 To (.DnaLen - 1)
    If Rnd < 1 / (.Mutables.mutarray(InsertionUP) / SimOpts.MutCurrMult) Then
      If overtime < 0 Then Exit Sub
      If .Mutables.Mean(InsertionUP) = 0 Then .Mutables.Mean(InsertionUP) = 1
      Do
        Length = Gauss(.Mutables.StdDev(InsertionUP), .Mutables.Mean(InsertionUP))
      Loop While Length <= 0
      
      If CLng(rob(robn).DnaLen) + CLng(Length) > 32000 Then Exit Sub
      
      
      MakeSpace .DNA(), t + accum, Length, .DnaLen
      rob(robn).DnaLen = rob(robn).DnaLen + Length
   '   accum = accum + length
   '   ChangeDNA robn, t + accum, length, 100, InsertionUP 'set a good value up
   '   ChangeDNA robn, t + accum, length, 0, InsertionUP 'change type
       ChangeDNA robn, t + 1, Length, 0, InsertionUP 'change the type first so that the mutated value is within the space of the new type
       ChangeDNA robn, t + 1, Length, 100, InsertionUP 'set a good value up
    End If
  Next t
  End With
End Sub

Private Sub Reversal(robn As Integer)
  'reverses a length of DNA
  Dim Length As Long
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
      If Rnd < 1 / (.Mutables.mutarray(ReversalUP) / SimOpts.MutCurrMult) Then
        If .Mutables.Mean(ReversalUP) < 2 Then .Mutables.Mean(ReversalUP) = 2
        
        Do
          Length = Gauss(.Mutables.StdDev(ReversalUP), .Mutables.Mean(ReversalUP))
        Loop While Length <= 0
        
        Length = Length \ 2 'be sure we go an even amount to either side
        
        If t - Length < 1 Then Length = t - 1
        If t + Length > .DnaLen - 1 Then Length = .DnaLen - 1 - t
        If Length > 0 Then
        
          second = 0
          For counter = t - Length To t - 1
            tempblock = .DNA(counter)
            .DNA(counter) = .DNA(t + Length - second)
            .DNA(t + Length - second) = tempblock
            second = second + 1
            overtime = overtime - 1 'No changedna? no problem
          Next counter
          
          .Mutations = .Mutations + 1
          .LastMut = .LastMut + 1
          
          .LastMutDetail = "Reversal of" + Str(Length * 2 + 1) + "bps centered at " + Str(t) + " during cycle" + _
            Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
         
        End If
      End If
    Next t
  End With
End Sub

Private Sub MinorDeletion(robn As Integer)
  Dim Length As Long, t As Long
  With rob(robn)
    If .Mutables.Mean(MinorDeletionUP) < 1 Then .Mutables.Mean(MinorDeletionUP) = 1
    For t = 1 To (.DnaLen - 1)
      If Rnd < 1 / (.Mutables.mutarray(MinorDeletionUP) / SimOpts.MutCurrMult) Then
        Do
          Length = Gauss(.Mutables.StdDev(MinorDeletionUP), .Mutables.Mean(MinorDeletionUP))
        Loop While Length <= 0
        
        If t + Length > .DnaLen - 1 Then Length = .DnaLen - 1 - t
        
        Delete .DNA, t, Length, .DnaLen
        
        .DnaLen = DnaLen(.DNA())
        
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Minor Deletion deleted a run of" + _
          Str(Length) + " bps at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
          
         overtime = overtime - 1: If overtime < 0 Then Exit Sub
        
      End If
    Next t
  End With
End Sub

Private Sub MajorDeletion(robn As Integer)
  Dim Length As Long, t As Long
  With rob(robn)
    If .Mutables.Mean(MajorDeletionUP) < 1 Then .Mutables.Mean(MajorDeletionUP) = 1
    For t = 1 To (.DnaLen - 1)
      If Rnd < 1 / (.Mutables.mutarray(MajorDeletionUP) / SimOpts.MutCurrMult) Then
        Do
          Length = Gauss(.Mutables.StdDev(MajorDeletionUP), .Mutables.Mean(MajorDeletionUP))
        Loop While Length <= 0
        
        If t + Length > .DnaLen - 1 Then Length = .DnaLen - 1 - t
        
        Delete .DNA, t, Length, .DnaLen
        
        .DnaLen = DnaLen(.DNA())
        
        .Mutations = .Mutations + 1
        .LastMut = .LastMut + 1
        .LastMutDetail = "Major Deletion deleted a run of" + _
          Str(Length) + " bps at position" + Str(t) + " during cycle" + _
          Str(SimOpts.TotRunCycle) + vbCrLf + .LastMutDetail
          
        overtime = overtime - 1: If overtime < 0 Then Exit Sub
        
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
    'Botsareus 3/14/2014 Disqualify
    If (SimOpts.F1 Or x_restartmode = 1) And Disqualify = 2 Then dreason rob(n).FName, rob(n).tag, "deleting a gene"
    If Not SimOpts.F1 And rob(n).dq = 1 And Disqualify = 2 Then rob(n).Dead = True 'safe kill robot
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

Public Sub SetDefaultMutationRates(ByRef changeme As mutationprobs, Optional skipNorm As Boolean = False)
'Botsareus 12/17/2013 Figure out dna length
Dim Length As Integer
Dim path As String
If NormMut And Not skipNorm Then
    If optionsform.CurrSpec = 50 Or optionsform.CurrSpec = -1 Then    'only if current spec is selected
        Length = rob(robfocus).DnaLen
    Else 'load dna length
        If MaxRobs = 0 Then ReDim rob(0)
        path = TmpOpts.Specie(optionsform.CurrSpec).path & "\" & TmpOpts.Specie(optionsform.CurrSpec).Name
        path = Replace(path, "&#", MDIForm1.MainDir)
        If dir(path) = "" Then path = MDIForm1.MainDir & "\Robots\" & TmpOpts.Specie(optionsform.CurrSpec).Name
        If LoadDNA(path, 0) Then
            Length = DnaLen(rob(0).DNA)
        End If
    End If
End If

  Dim a As Long
  With (changeme)
  
  For a = 0 To 20
    .mutarray(a) = IIf(NormMut And Not skipNorm, Length * CLng(valNormMut), 5000)
    .Mean(a) = 1
    .StdDev(a) = 0
  Next a
  If skipNorm Then .mutarray(P2UP) = 0 'Botsareus 2/21/2014 Might as well disable p2 mutations if loading from the net
  
  .Mean(PointUP) = 3
  .StdDev(PointUP) = 1
  
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
  
  .Mean(AmplificationUP) = 250
  .StdDev(AmplificationUP) = 75
  
  .Mean(TranslocationUP) = 250
  .StdDev(TranslocationUP) = 75
  End With
End Sub
