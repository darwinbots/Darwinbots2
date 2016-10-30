Attribute VB_Name = "Database"
Option Explicit

'
' D A T A B A S E   R E C O R D I N G
'

'for snapshots
Dim SnapName As String

Private Sub SnapBrowse() 'creates a file to store the snapshot into
  Form1.CommonDialog1.InitDir = MDIForm1.MainDir + "/database"
  Form1.CommonDialog1.DialogTitle = "Select a name for your snapshot file."
  Form1.CommonDialog1.Filter = "Snapshot Database (*.snp)|*.snp"
  Form1.CommonDialog1.ShowSave
  SnapName = Form1.CommonDialog1.FileName
End Sub

Public Sub Snapshot()
  'records a snapshot of all living robots in a snapshot database
  Dim v As String
  Dim d As String
  Dim rn As Integer
  Dim m As Boolean
  
  On Error GoTo fine
  Form1.CommonDialog1.FileName = ""
  SnapBrowse
  If Form1.CommonDialog1.FileName = "" Then Exit Sub
  m = MsgBox("Do you want to generate mutation history file as well?", vbYesNo + vbInformation) = vbYes
  Open SnapName For Output As 3
  If m Then Open extractexactname(SnapName) & "_Mutations.txt" For Output As 5
  Print #3, "Rob id,Parent id,Founder name,Generation,Birth cycle,Age,Mutations,New mutations,Dna length,Offspring number,kills,Fitness,Energy,Chloroplasts" & vbCrLf;
  If m Then Print #5, "Rob id,Mutation History"
  v = ","
  Form1.GraphLab.Visible = True
  For rn = 1 To MaxRobs
    If rob(rn).exist And rob(rn).DnaLen > 1 Then 'Botsareus 6/16/2016 Bugfix
      With rob(rn)
      
        If m Then
            Print #5, vbCrLf & CStr(.AbsNum); v;
            Print #5, vbCrLf & .LastMutDetail
        End If
        
        Print #3, vbCrLf & vbCrLf & CStr(.AbsNum); v; CStr(.parent); v; .FName; v; CStr(.generation); v; CStr(.BirthCycle); v; CStr(.age); v; CStr(.Mutations); v;
        Print #3, CStr(.LastMut); v; CStr(.DnaLen); v; CStr(.SonNumber); v; CStr(.Kills); v;
        'lets figureout fitness
        Dim sPopulation As Double
        Dim sEnergy As Double
        Dim s As Double
        sEnergy = (IIf(intFindBestV2 > 100, 100, intFindBestV2)) / 100
        sPopulation = (IIf(intFindBestV2 < 100, 100, 200 - intFindBestV2)) / 100
        Form1.TotalOffspring = 1
        s = Form1.score(rn, 1, 10, 0) + rob(rn).nrg + rob(rn).body * 10 'Botsareus 5/22/2013 Advanced fit test
        If s < 0 Then s = 0 'Botsareus 9/23/2016 Bug fix
        s = (Form1.TotalOffspring ^ sPopulation) * (s ^ sEnergy)
        Print #3, CStr(s); v; CStr(rob(rn).nrg + rob(rn).body * 10); v; .chloroplasts & vbCrLf;
        d = ""
        savingtofile = True
        d = DetokenizeDNA(rn) & vbCrLf
        If Mid(d, Len(d) - 3, 2) = vbCrLf Then d = Left(d, Len(d) - 2) 'Borsareus 7/22/2014 a bug fix
        savingtofile = False
        Print #3, d;
      End With
    End If
    Form1.GraphLab.Caption = "Calculating a snapshot: " & Int(rn / MaxRobs * 100) & "%"
    DoEvents
  Next rn
  Form1.GraphLab.Visible = False
  Close #3
  If m Then Close #5
  MsgBox ("Saved snapshot successfully.")
  GoTo getout

fine:
  Close #3
  If m Then Close #5
  If Err.Number = 70 Then
    MsgBox ("That file is already open in another program")
  Else
    d = "File error " + Str$(Err.Number) + Err.Description
    MsgBox (d)
  End If
getout:
End Sub

' adds a record to snapshot of the dead
Public Sub AddRecord(ByVal rn As Integer)
Dim path1 As String
Dim path2 As String
Dim v As String
Dim d As String
v = ","
path1 = MDIForm1.MainDir & "\Autosave\DeadRobots.snp"
path2 = MDIForm1.MainDir & "\Autosave\DeadRobots_Mutations.txt"
On Error GoTo getout
    If dir(path1) = "" Then 'write first line if no data
        Open path1 For Output As #177
            Print #177, "Rob id,Parent id,Founder name,Generation,Birth cycle,Age,Mutations,New mutations,Dna length,Offspring number,kills,Fitness,Energy,Chloroplasts"
        Close #177
    End If
    If dir(path2) = "" Then 'write first line if no data
        Open path2 For Output As #178
            Print #178, "Rob id,Mutation History"
        Close #178
    End If
    'write the record
    Open path1 For Append As #177
    Open path2 For Append As #178
    
    With rob(rn)
    
        If .DnaLen = 1 Then GoTo getout 'Botsareus 6/16/2016 Bugfix
    
        Print #178, vbCrLf & CStr(.AbsNum); v;
        Print #178, vbCrLf & .LastMutDetail
        
        Print #177, vbCrLf & vbCrLf & CStr(.AbsNum); v; CStr(.parent); v; .FName; v; CStr(.generation); v; CStr(.BirthCycle); v; CStr(.age); v; CStr(.Mutations); v;
        Print #177, CStr(.LastMut); v; CStr(.DnaLen); v; CStr(.SonNumber); v; CStr(.Kills); v;
        'lets figureout fitness
        Dim sPopulation As Double
        Dim sEnergy As Double
        Dim s As Double
        sEnergy = (IIf(intFindBestV2 > 100, 100, intFindBestV2)) / 100
        sPopulation = (IIf(intFindBestV2 < 100, 100, 200 - intFindBestV2)) / 100
        Form1.TotalOffspring = 1
        s = Form1.score(rn, 1, 10, 0) + rob(rn).nrg + rob(rn).body * 10 'Botsareus 5/22/2013 Advanced fit test
        If s < 0 Then s = 0 'Botsareus 9/23/2016 Bug fix
        s = (Form1.TotalOffspring ^ sPopulation) * (s ^ sEnergy)
        Print #177, CStr(s); v; CStr(rob(rn).nrg + rob(rn).body * 10); v; .chloroplasts & vbCrLf;
        d = ""
        savingtofile = True
        d = DetokenizeDNA(rn) & vbCrLf
        If Mid(d, Len(d) - 3, 2) = vbCrLf Then d = Left(d, Len(d) - 2) 'Borsareus 7/22/2014 a bug fix
        savingtofile = False
        Print #177, d;
        
      End With
      
getout:

    Close #177
    Close #178
End Sub


