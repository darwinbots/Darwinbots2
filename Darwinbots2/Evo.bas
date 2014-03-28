Attribute VB_Name = "Evo"
' * * * * * * * * * * * * * * * * * * *
' All special evolution modes live here
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
shell App.path & "\Restarter.exe " & App.path & "\" & App.EXEName
End Sub

Private Sub Increase_Difficulty()
If LFORdir Then
    LFORdir = False
    LFORcorr = LFORcorr / 2
End If
LFOR = LFOR - LFORcorr
If LFOR < 0.1 Then LFOR = 0.1
If LFOR > 50 Then LFOR = 50
'
hidePredCycl = Init_hidePredCycl + 300 * Rnd - 150
'
If hidePredCycl < 150 Then hidePredCycl = 150
If hidePredCycl > 15000 Then hidePredCycl = 15000
End Sub

Private Sub Next_Stage()
'Configure settings

LFORdir = Not LFORdir
LFORcorr = 1
Init_hidePredCycl = hidePredCycl

Dim gotdnalen As Integer

'lets grab a test robot to figure out dna length
For t = 1 To MaxRobs
        If rob(t).exist And rob(t).FName = "Test.txt" Then
            gotdnalen = DnaLen(rob(t).DNA)
            Exit For
        End If
Next

Dim sizechangerate As Double
sizechangerate = (5000 - target_dna_size) / 4800
If sizechangerate < 0 Then sizechangerate = 0

If gotdnalen < target_dna_size Then
    curr_dna_size = gotdnalen + 5 'current dna size is 5 more then old size
    If (gotdnalen >= (target_dna_size - 15)) And (gotdnalen <= (target_dna_size + sizechangerate * 50)) Then target_dna_size = target_dna_size + (sizechangerate * 200) + 10
Else
    curr_dna_size = target_dna_size
    If (gotdnalen >= (target_dna_size - 15)) And (gotdnalen <= (target_dna_size + sizechangerate * 50)) Then target_dna_size = target_dna_size + (sizechangerate * 200) + 10
End If

'Configure robots

'next stage
x_filenumber = x_filenumber + 1
FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".txt"
FileCopy MDIForm1.MainDir & "\evolution\Test.mrate", MDIForm1.MainDir & "\evolution\stages\stage" & x_filenumber & ".mrate"

'kill main dir robiots
Kill MDIForm1.MainDir & "\evolution\Base.txt"
Kill MDIForm1.MainDir & "\evolution\Mutate.txt"
If dir(MDIForm1.MainDir & "\evolution\Mutate.mrate") <> "" Then Kill MDIForm1.MainDir & "\evolution\Mutate.mrate"

'copy robots
FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\Base.txt"
FileCopy MDIForm1.MainDir & "\evolution\Test.txt", MDIForm1.MainDir & "\evolution\Mutate.txt"
FileCopy MDIForm1.MainDir & "\evolution\Test.mrate", MDIForm1.MainDir & "\evolution\Mutate.mrate"

'kill test robot
Kill MDIForm1.MainDir & "\evolution\Test.txt"
Kill MDIForm1.MainDir & "\evolution\Test.mrate"
End Sub

Private Sub Decrease_Difficulty()
If Not LFORdir Then
    LFORdir = True
    LFORcorr = LFORcorr / 2
End If
LFOR = LFOR + LFORcorr
If LFOR < 0.1 Then LFOR = 0.1
If LFOR > 50 Then LFOR = 50
'
hidePredCycl = Init_hidePredCycl + 300 * Rnd - 150
'
If hidePredCycl < 150 Then hidePredCycl = 150
If hidePredCycl > 15000 Then hidePredCycl = 15000
End Sub

Public Sub UpdateWonEvo(ByVal bestrob As Integer) 'passing best robot
If rob(bestrob).Mutations > 0 Then
    logevo "Evolving robot changed, testing robot."
    'F1 mode init
    salvarob bestrob, MDIForm1.MainDir & "\evolution\Test.txt", True
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
logevo "Evolving robot won the test, setting up next stage."
Next_Stage 'Robot won, go to next stage
x_restartmode = 4
exportdata
End Sub

Public Sub UpdateLostF1()
logevo "Evolving robot lost the test, increasing difficulty."
Kill MDIForm1.MainDir & "\evolution\Test.txt"
Kill MDIForm1.MainDir & "\evolution\Test.mrate"
x_restartmode = 4
Increase_Difficulty 'Robot lost, might as well have never mutated
exportdata
End Sub

Private Sub logevo(ByVal s As String)
 Open MDIForm1.MainDir & "\evolution\log.txt" For Append As #1
  Print #1, s & " " & Date$ & " " & Time$
 Close #1
End Sub


