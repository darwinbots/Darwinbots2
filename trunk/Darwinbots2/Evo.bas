Attribute VB_Name = "Evo"
Option Explicit
' * * * * * * * * * * * * * * * * * * *
' All special evolution modes are here
' * * * * * * * * * * * * * * * * * * *

Private Sub exportdata()
'save main data
Open MDIForm1.MainDir & "\evolution\data.gset" For Output As #1
    Write #1, LFOR    'LFOR init
    Write #1, LFORdir   'dir True means decrease diff
    Write #1, LFORcorr   'corr
    '
    Write #1, hidePredCycl   'hidePredCycl
    '
    Write #1, curr_dna_size   'curr_dna_size
    Write #1, target_dna_size    'target_dna_size
    '
    Write #1, Init_hidePredCycl
    '
    Write #1, y_Stgwins
Close #1
'save restart mode
If x_restartmode = 5 Then x_restartmode = 4
Open App.path & "\restartmode.gset" For Output As #1
 Write #1, x_restartmode
 Write #1, x_filenumber
Close #1
'Restart
Open App.path & "\Safemode.gset" For Output As #1
 Write #1, False
Close #1
Open App.path & "\autosaved.gset" For Output As #1
 Write #1, False
Close #1
Call restarter
End Sub

Private Function n10(ByVal a As Single) As Integer 'range correction
Dim b As Integer
If a <= 1 Then b = 10 ^ (1 - (Log(a * 2) \ Log(10))) Else b = 1
n10 = b
End Function

Private Sub Increase_Difficulty()
If LFORdir Then
    LFORdir = False
    LFORcorr = LFORcorr / 2
End If
'Botsare us 7/01/2014 a little mod here, more sane floor on lfor
Dim tmpLFOR As Single
tmpLFOR = LFOR
LFOR = LFOR - LFORcorr / n10(LFOR)
If LFOR < 1 / n10(tmpLFOR) Then LFOR = 1 / n10(tmpLFOR)
If LFOR < 0.01 Then LFOR = 0.01
'
hidePredCycl = Init_hidePredCycl + 300 * rndy - 150
'
If hidePredCycl < 150 Then hidePredCycl = 150
If hidePredCycl > 15000 Then hidePredCycl = 15000
'In really rear cases start emping up difficulty using other means
If LFOR = 0.01 Then
    hidePredCycl = 150
    Init_hidePredCycl = 150
End If
End Sub

Private Sub Next_Stage()
Dim t As Integer

'Reset F1 test
y_Stgwins = 0

'Configure settings

LFORdir = Not LFORdir
LFORcorr = 5
Init_hidePredCycl = hidePredCycl

Dim gotdnalen As Integer

'lets grab a test robot to figure out dna length
For t = 1 To MaxRobs
        If rob(t).exist And rob(t).FName = "Test.txt" Then
            gotdnalen = DnaLen(rob(t).dna)
            Exit For
        End If
Next

Dim sizechangerate As Double
sizechangerate = (5000 - target_dna_size) / 4750
If sizechangerate < 0 Then sizechangerate = 0

If gotdnalen < target_dna_size Then
    curr_dna_size = gotdnalen + 5 'current dna size is 5 more then old size
    If (gotdnalen >= (target_dna_size - 15)) And (gotdnalen <= (target_dna_size + sizechangerate * 75)) Then target_dna_size = target_dna_size + (sizechangerate * 250) + 10
Else
    curr_dna_size = target_dna_size
    If (gotdnalen >= (target_dna_size - 15)) And (gotdnalen <= (target_dna_size + sizechangerate * 75)) Then target_dna_size = target_dna_size + (sizechangerate * 250) + 10
End If

'Configure robots

'next stage
x_filenumber = x_filenumber + 1

If y_eco_im > 0 Then
    Dim ecocount As Byte
    For ecocount = 1 To 15
        FileCopy MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.txt", MDIForm1.MainDir & "\evolution\stages\stagerob" & ecocount & "\stage" & x_filenumber & ".txt"
        FileCopy MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.mrate", MDIForm1.MainDir & "\evolution\stages\stagerob" & ecocount & "\stage" & x_filenumber & ".mrate"
    Next
Else
    FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".txt"
    FileCopy MDIForm1.MainDir & "\evolution\Test.mrate", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".mrate"
End If

'kill main dir robots
If y_eco_im > 0 Then
    For ecocount = 1 To 15
        RecursiveRmDir MDIForm1.MainDir & "\evolution\baserob" & ecocount
        RecursiveRmDir MDIForm1.MainDir & "\evolution\mutaterob" & ecocount
    Next
Else
    Kill MDIForm1.MainDir & "\evolution\Base.txt"
    Kill MDIForm1.MainDir & "\evolution\Mutate.txt"
    If dir(MDIForm1.MainDir & "\evolution\Mutate.mrate") <> "" Then Kill MDIForm1.MainDir & "\evolution\Mutate.mrate"
End If

'copy robots
If y_eco_im > 0 Then
    For ecocount = 1 To 15
        MkDir MDIForm1.MainDir & "\evolution\baserob" & ecocount
        MkDir MDIForm1.MainDir & "\evolution\mutaterob" & ecocount
        FileCopy MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.txt", MDIForm1.MainDir & "\evolution\baserob" & ecocount & "\Base.txt"
        FileCopy MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.txt", MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.txt"
        FileCopy MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.mrate", MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.mrate"
    Next
Else
    FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\Base.txt"
    FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\Mutate.txt"
    FileCopy MDIForm1.MainDir & "\evolution\Test.mrate", MDIForm1.MainDir & "\evolution\Mutate.mrate"
End If

'kill test robot
If y_eco_im > 0 Then
    For ecocount = 1 To 15
        RecursiveRmDir MDIForm1.MainDir & "\evolution\testrob" & ecocount
    Next
Else
    Kill MDIForm1.MainDir & "\evolution\Test.txt"
    Kill MDIForm1.MainDir & "\evolution\Test.mrate"
End If
End Sub

Private Sub Decrease_Difficulty()
If Not LFORdir Then
    LFORdir = True
    LFORcorr = LFORcorr / 2
End If
LFOR = LFOR + LFORcorr / n10(LFOR)
If LFOR > 200 Then LFOR = 200 'expended to 200 for more flexability
'
hidePredCycl = Init_hidePredCycl + 300 * rndy - 150
'
If hidePredCycl < 150 Then hidePredCycl = 150
If hidePredCycl > 15000 Then hidePredCycl = 15000
'
'Botsareus 12/11/2015 renormalize the mutation rates
If y_eco_im = 0 Then renormalize_mutations
End Sub

Private Sub renormalize_mutations()

'norm holds normalized mutation rates

Dim norm As mutationprobs
Dim Length As Integer


If LoadDNA(MDIForm1.MainDir & "\evolution\Mutate.txt", 0) Then
    Length = DnaLen(rob(0).dna)
End If

  Dim a As Long
  With norm
  
  For a = 0 To 20
    .mutarray(a) = Length * CLng(valNormMut)
    .Mean(a) = 1
    .StdDev(a) = 0
  Next a
  
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

'load mutations
  
Dim filem As mutationprobs

filem = Load_mrates(MDIForm1.MainDir & "\evolution\Mutate.mrate")

'renormalize mutations

filem.CopyErrorWhatToChange = (filem.CopyErrorWhatToChange * 19 + norm.CopyErrorWhatToChange) / 20
filem.PointWhatToChange = (filem.PointWhatToChange * 19 + norm.PointWhatToChange) / 20

  For a = 0 To 20
    If filem.mutarray(a) > 0 Then filem.mutarray(a) = (filem.mutarray(a) * 19 + norm.mutarray(a)) / 20
    filem.Mean(a) = (filem.Mean(a) * 19 + norm.Mean(a)) / 20
    filem.StdDev(a) = (filem.StdDev(a) * 19 + norm.StdDev(a)) / 20
  Next a
  
'save mutations
  
Save_mrates filem, MDIForm1.MainDir & "\evolution\Mutate.mrate"

End Sub

Public Sub UpdateWonEvo(ByVal bestrob As Integer) 'passing best robot
If rob(bestrob).Mutations > 0 And (totnvegsDisplayed >= 15 Or y_eco_im = 0) Then
    logevo "Evolving robot changed, testing robot."
    'F1 mode init
    If y_eco_im = 0 Then
        salvarob bestrob, MDIForm1.MainDir & "\evolution\Test.txt"
    Else

        'The Eco Calc
        
        'Step1 disable simulation execution
        DisplayActivations = False
        Form1.Active = False
        Form1.SecTimer.Enabled = False
        
        'Step2 calculate cumelative genetic distance
        Form1.GraphLab.Visible = True
      
          Dim maxgdi() As Single
          ReDim maxgdi(MaxRobs)
          
          Dim t As Integer
          Dim t2 As Integer
          
          For t = 1 To MaxRobs
           If rob(t).exist And Not rob(t).Veg And Not rob(t).FName = "Corpse" And Not (rob(t).FName = "Base.txt" And hidepred) Then
                    'calculate cumelative genetic distance
                    For t2 = 1 To MaxRobs
                     If t <> t2 Then
                      If rob(t2).exist And Not rob(t2).Corpse And rob(t2).FName = rob(t).FName Then  ' Must exist, and be of same species
                        maxgdi(t) = maxgdi(t) + DoGeneticDistance(t, t2)
                      End If
                     End If
                    Next t2
                    Form1.GraphLab.Caption = "Calculating eco result: " & Int(t / MaxRobs * 100) & "%"
                    DoEvents
           End If
          Next
          
          Form1.GraphLab.Visible = False
        
         'step3 calculate robots
          
          Dim ecocount As Byte
          
        For ecocount = 1 To 15
          
            Dim sPopulation As Double
            Dim sEnergy As Double
            sEnergy = (IIf(intFindBestV2 > 100, 100, intFindBestV2)) / 100
            sPopulation = (IIf(intFindBestV2 < 100, 100, 200 - intFindBestV2)) / 100
            
              Dim s As Double
              Dim Mx As Double
              Dim fit As Integer
              
              Mx = 0
              fit = 0
              For t = 1 To MaxRobs
                If rob(t).exist And Not rob(t).Veg And Not rob(t).FName = "Corpse" And Not (rob(t).FName = "Base.txt" And hidepred) Then
                  
                    Form1.TotalOffspring = 1
                    s = Form1.score(t, 1, 10, 0) + rob(t).nrg + rob(t).body * 10  'Botsareus 5/22/2013 Advanced fit test
                    s = (Form1.TotalOffspring ^ sPopulation) * (s ^ sEnergy)
                    s = s * maxgdi(t)
                    If s >= Mx Then
                      Mx = s
                      fit = t
                    End If
                  
                End If
              Next t
              
              'save and kill the robot
              If dir(MDIForm1.MainDir & "\evolution\testrob" & ecocount, vbDirectory) = "" Then MkDir MDIForm1.MainDir & "\evolution\testrob" & ecocount
              salvarob fit, MDIForm1.MainDir & "\evolution\testrob" & ecocount & "\Test.txt"
              rob(fit).exist = False
              
        Next
      
    End If
    x_restartmode = 6
Else
    logevo "Evolving robot never changed, increasing difficulty."
    'Robot never mutated so we need to tighten up the difficulty
    Increase_Difficulty
End If
exportdata
End Sub

Public Sub UpdateLostEvo()
logevo "Evolving robot lost, decreasing difficulty."
Decrease_Difficulty 'Robot simply lost, se we need to loosen up the difficulty
exportdata
End Sub

Public Sub UpdateWonF1()

'figure out next opponent
Dim currenttest As Integer
y_Stgwins = y_Stgwins + 1
currenttest = x_filenumber - y_Stgwins * (x_filenumber ^ (1 / 3))
If currenttest < 0 Or x_filenumber = 0 Or y_eco_im > 0 Then 'check for x_filenumber is zero here to prevent endless loop
    logevo "Evolving robot won all tests, setting up stage " & (x_filenumber + 1)
    Next_Stage 'Robot won, go to next stage
    x_restartmode = 4
Else
    'copy a robot for current test
    logevo "Robot is currently under test against stage " & currenttest
    FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & currenttest & ".txt", MDIForm1.MainDir & "\evolution\Base.txt"
End If
exportdata
End Sub

Public Sub UpdateLostF1()
logevo "Evolving robot lost the test, increasing difficulty."

If y_eco_im > 0 Then
        Dim ecocount As Byte
        For ecocount = 1 To 15
            RecursiveRmDir MDIForm1.MainDir & "\evolution\testrob" & ecocount
        Next
Else
    Kill MDIForm1.MainDir & "\evolution\Test.txt"
    Kill MDIForm1.MainDir & "\evolution\Test.mrate"
    'reset base robot
    FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".txt", MDIForm1.MainDir & "\evolution\Base.txt"
    y_Stgwins = 0
    '
End If
x_restartmode = 4
Increase_Difficulty 'Robot lost, might as well have never mutated
exportdata
End Sub

Public Sub logevo(ByVal s As String, Optional Index As Integer = -1)
 Open MDIForm1.MainDir & "\evolution\log" & IIf(Index > -1, Index, "") & ".txt" For Append As #1
  Print #1, s & " " & Date$ & " " & Time$
 Close #1
End Sub
' * * * * * * * * * * * * * * * * * * *
' Zerobot - Botsareus 4/14/2014
' * * * * * * * * * * * * * * * * * * *
Private Sub ZBreadyforTest(ByVal bestrob As Integer)
salvarob bestrob, MDIForm1.MainDir & "\evolution\Test.txt"
'the robot did evolve, so lets update
x_filenumber = x_filenumber + 1
FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".txt"
FileCopy MDIForm1.MainDir & "\evolution\Test.mrate", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".mrate"

        Dim ecocount As Integer
        Dim lowestindex As Integer
        Dim dbn As Integer
        
        'what is our lowest index?
        lowestindex = x_filenumber - 7
        If lowestindex < 0 Then lowestindex = 0
             
        logevo "Progress."
        For ecocount = 1 To 8
            'calculate index and copy robots
            dbn = lowestindex + (ecocount - 1) Mod (x_filenumber + 1)
            FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbn & ".txt", MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.txt"
            If dir(MDIForm1.MainDir & "\evolution\stages\stage" & dbn & ".mrate") <> "" Then FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbn & ".mrate", MDIForm1.MainDir & "\evolution\mutaterob" & ecocount & "\Mutate.mrate"
            FileCopy MDIForm1.MainDir & "\evolution\stages\stage" & dbn & ".txt", MDIForm1.MainDir & "\evolution\baserob" & ecocount & "\Base.txt"
        Next
        
x_restartmode = 9
SimOpts.TotRunCycle = 8001 'make sure we skip the message
'restart now
Open App.path & "\restartmode.gset" For Output As #1
 Write #1, x_restartmode
 Write #1, x_filenumber
Close #1
'Restart
    DisplayActivations = False
    Form1.Active = False
    Form1.SecTimer.Enabled = False
    Open App.path & "\Safemode.gset" For Output As #1
     Write #1, False
    Close #1
    Open App.path & "\autosaved.gset" For Output As #1
     Write #1, False
    Close #1
Call restarter
End Sub
Public Sub ZBpassedtest()
MsgBox "Zerobot evolution complete.", vbInformation, "Zerobot evo"
    DisplayActivations = False
    Form1.Active = False
    Form1.SecTimer.Enabled = False
End Sub
Public Sub ZBfailedtest()
logevo "Zerobot failed the test, evolving further."
Kill MDIForm1.MainDir & "\evolution\Test.txt"
Kill MDIForm1.MainDir & "\evolution\Test.mrate"
x_restartmode = 7
'restart now
Open App.path & "\restartmode.gset" For Output As #1
 Write #1, x_restartmode
 Write #1, x_filenumber
Close #1
'Restart
    DisplayActivations = False
    Form1.Active = False
    Form1.SecTimer.Enabled = False
    Open App.path & "\Safemode.gset" For Output As #1
     Write #1, False
    Close #1
    Open App.path & "\autosaved.gset" For Output As #1
     Write #1, False
    Close #1
Call restarter
End Sub
Public Sub calculateZB(ByVal robid As Long, ByVal Mx As Double, ByVal bestrob As Integer)
If rob(bestrob).LastMut > 0 Then
Static oldid As Long
Static oldMx As Double

  Dim MratesMax As Long 'used to correct out of range mutations
  MratesMax = IIf(NormMut, CLng(rob(bestrob).DnaLen) * CLng(valMaxNormMut), 2000000000)

Dim goodtest As Boolean 'no duplicate message

If oldid <> robid And oldid <> 0 Then
        logevo "'GoodTest' reason: oldid(" & oldid & ") comp. id(" & robid & ")", x_filenumber
        With rob(bestrob) 'robot is doing well, why not?
                .Mutables.mutarray(PointUP) = .Mutables.mutarray(PointUP) * 1.15
                If .Mutables.mutarray(PointUP) > MratesMax Then .Mutables.mutarray(PointUP) = MratesMax
                .Mutables.mutarray(P2UP) = .Mutables.mutarray(P2UP) * 1.15
                If .Mutables.mutarray(P2UP) > MratesMax Then .Mutables.mutarray(P2UP) = MratesMax
        End With
        goodtest = True
End If


If oldid = robid And Mx > oldMx Then
    With rob(bestrob) 'robot is doing well, why not?
            .Mutables.mutarray(PointUP) = .Mutables.mutarray(PointUP) * 1.75
            If .Mutables.mutarray(PointUP) > MratesMax Then .Mutables.mutarray(PointUP) = MratesMax
            .Mutables.mutarray(P2UP) = .Mutables.mutarray(P2UP) * 1.75
            If .Mutables.mutarray(P2UP) > MratesMax Then .Mutables.mutarray(P2UP) = MratesMax
    End With
    ZBreadyforTest bestrob
Else
    If Not goodtest Then logevo "'Reset' reason: oldid(" & oldid & ") comp. id(" & robid & ") Mx(" & Mx & ") comp. oldMx(" & oldMx & ")", x_filenumber
End If

oldMx = Mx
oldid = robid
Else 'if robot did not mutate
    logevo "'Reset' reason: No mutations", x_filenumber
End If
End Sub
