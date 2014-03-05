VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmText 
   Caption         =   "Manual Sexual Reproduction Tool"
   ClientHeight    =   8310
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   6675
   Icon            =   "frmText.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8310
   ScaleWidth      =   6675
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog myOpen 
      Left            =   4200
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txt 
      Height          =   1215
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
   Begin VB.Menu mFile 
      Caption         =   "File"
      Begin VB.Menu mOpen 
         Caption         =   "&Open"
         Shortcut        =   ^O
      End
      Begin VB.Menu mCross 
         Caption         =   "Do a &Crossover"
         Enabled         =   0   'False
         Shortcut        =   {F2}
      End
      Begin VB.Menu xsp 
         Caption         =   "-"
      End
      Begin VB.Menu mExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mHelp 
      Caption         =   "&About"
   End
End
Attribute VB_Name = "frmText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim file1 As String
Dim file2 As String

Private Type block2
  tipo As Integer
  value As Integer
  match As Integer
End Type

Private Type block3
  nucli As Double
  match As Integer
End Type

Dim baddata As Boolean

Dim dna1() As block2
Dim dna2() As block2

Dim iinc As Integer

Private Sub Form_Load()
LoadSysVars
End Sub

Private Sub Form_Resize()
txt.Width = ScaleWidth
txt.Height = ScaleHeight
End Sub

Private Sub mCross_Click()
      Dim Outdna() As block
      ReDim Outdna(0)

      crossover dna1, dna2, Outdna
      
      rob(3).DNA = Outdna
      
      txt = DetokenizeDNA(3, False)
      mCross.Caption = "Do a different Crossover"
End Sub

Private Sub mExit_Click()
End
End Sub

Private Sub mHelp_Click()
MsgBox "Developed by: Botsareus" & vbCrLf & vbCrLf & "www.DarwinBots.com", vbInformation, "About Manual Sexrepro"
End Sub

Private Sub mOpen_Click()
Caption = "Manual Sexual Reproduction Tool"
file1 = ""
file2 = ""

With myOpen
    .FileName = ""
    .Filter = "Robot File (*.txt)|*.txt|All files(*.*)|*.*"
    .DialogTitle = "Select first robot"
    .ShowOpen
    If .FileName = "" Then Exit Sub
    file1 = .FileName
    .DialogTitle = "Select second robot"
    .ShowOpen
    If .FileName = "" Then Exit Sub
    file2 = .FileName
    baddata = False
    openrobots
    mCross.Enabled = Not baddata
    mCross.Caption = "Do a Crossover"
End With

End Sub

Sub openrobots()
Dim t As Integer
If LoadDNA(file1, 1) = False Or LoadDNA(file2, 2) = False Then baddata = True
mCross.Enabled = Not baddata
If Not baddata Then

      'mapped directly from rob(x).DNA

      ReDim dna1(UBound(rob(1).DNA))
      For t = 0 To UBound(dna1)
       dna1(t).tipo = rob(1).DNA(t).tipo
       dna1(t).value = rob(1).DNA(t).value
      Next
      
      ReDim dna2(UBound(rob(2).DNA))
      For t = 0 To UBound(dna2)
       dna2(t).tipo = rob(2).DNA(t).tipo
       dna2(t).value = rob(2).DNA(t).value
      Next
      
      'Map to nucli
      
        'step range calulated
        Dim stp As Byte
        stp = 1
        
        Dim ndna1() As block3
        Dim ndna2() As block3
        Dim length1 As Integer
        Dim length2 As Integer
        length1 = UBound(dna1)
        length2 = UBound(dna2)
        ReDim ndna1(length1)
        ReDim ndna2(length2)
        
        'map to nucli
      
            'if step is 1 then normal nucli
            For t = 0 To UBound(dna1)
             ndna1(t).nucli = (dna1(t).tipo * (2 ^ 16)) Or dna1(t).value
            Next
            For t = 0 To UBound(dna2)
             ndna2(t).nucli = (dna2(t).tipo * (2 ^ 16)) Or dna2(t).value
            Next
      
      'Find longest sequance
      iinc = 0
      FindLongestSequences ndna1, ndna2, 0, UBound(ndna1), 0, UBound(ndna2)
      
      'map back
      
           For t = 0 To UBound(dna1)
             dna1(t).match = ndna1(t).match
           Next
           
           For t = 0 To UBound(dna2)
             dna2(t).match = ndna2(t).match
           Next
      
      
'      'some proper debug:
'      Dim k As String
'      Dim temp As String
'      Dim bp As block
'      Dim converttosysvar As Boolean
'
'      For t = 0 To UBound(ndna1)
'        k = k & ndna1(t).match & vbTab & ndna1(t).nucli & vbCrLf
'      Next
'
'      Clipboard.Clear
'      Clipboard.SetText k
'      MsgBox "---"
'
'      k = ""
'      For t = 0 To UBound(ndna2)
'        k = k & ndna2(t).match & vbTab & ndna2(t).nucli & vbCrLf
'      Next
'
'      Clipboard.Clear
'      Clipboard.SetText k
'      MsgBox "******"
'
'      k = ""
'      For t = 0 To UBound(dna1)
'
'        If t = UBound(dna1) Then converttosysvar = False Else converttosysvar = IIf(dna1(t + 1).tipo = 7, True, False)
'        bp.tipo = dna1(t).tipo
'        bp.value = dna1(t).value
'        temp = ""
'        Parse temp, bp, 1, converttosysvar
'
'      k = k & dna1(t).match & vbTab & temp & vbCrLf
'      Next
'
'      Clipboard.Clear
'      Clipboard.SetText k
'      MsgBox "---"
'      k = ""
'      For t = 0 To UBound(dna2)
'
'        If t = UBound(dna2) Then converttosysvar = False Else converttosysvar = IIf(dna2(t + 1).tipo = 7, True, False)
'        bp.tipo = dna2(t).tipo
'        bp.value = dna2(t).value
'        temp = ""
'        Parse temp, bp, 2, converttosysvar
'
'      k = k & dna2(t).match & vbTab & temp & vbCrLf
'
'      Next
'      Clipboard.Clear
'      Clipboard.SetText k
Caption = "Crossover ready"
End If
End Sub

' loads the dna and parses it
Public Function LoadDNA(path As String, n As Integer) As Boolean

  On Error GoTo fine:
  Dim a As String
  Dim b As String
  Dim pos As Long
  Dim DNApos As Long
  Dim hold As String
  Dim path2 As String
  
inizio:

  a = ""
  b = ""
  pos = 0
  DNApos = 0
  hold = ""
   
  ReDim rob(n).DNA(0)
  DNApos = 0
  If path = "" Then
    LoadDNA = False
    Exit Function
  End If
  Open path For Input As #1
  While Not EOF(1)
        Line Input #1, a
    
    ' eliminate comments at the end of a line
    ' but preserves comments-only lines
    pos = InStr(a, "'")
    If pos > 1 Then a = Left(a, pos - 1)
    If Right(a, 2) = vbCrLf Then a = Left(a, Len(a) - 2)
      
    'Ignore empty lines for purposes of computing hash
    If Len(a) <> 0 Then
      hold = hold + a + vbCrLf
    End If
    
    'Replace any tabs with spaces
    a = Replace(a, vbTab, " ")
    a = Trim(a)
       'Botsareus 5/24/2013 No more use and shp
       'Botsareus leading zero correction when using defs
       Dim useref As Boolean
    If (Left(a, 1) <> "'" And Left(a, 1) <> "/") And a <> "" Then
        If Left(a, 3) = "def" Then
'          If Left(a, 3) = "shp" Then  'inserts robot shape
'            rob(n).Shape = val(Right(a, 1))
'          End If
'          If Left(a, 3) = "def" Then  'inserts user defined labels as sysvars
            insertvar n, a
            useref = True
'          End If
'          If Left(a, 3) = "use" Then
'            interpretUSE n, a
'          End If
        Else
          pos = InStr(a, " ")
          While pos <> 0
            b = Left(a, pos - 1)
            a = Right(a, Len(a) - pos)
            
            While Left(a, 0) = " "
              a = Right(a, Len(a) - 1)
            Wend
            pos = InStr(a, " ")
            
            If b <> "" Then
              DNApos = DNApos + 1
              If DNApos > UBound(rob(n).DNA()) Then
                ReDim Preserve rob(n).DNA(DNApos + 5)
              End If
              Parse b, rob(n).DNA(DNApos), n
            End If
          Wend
          If a <> "" Then
            DNApos = DNApos + 1
            If DNApos > UBound(rob(n).DNA()) Then
              ReDim Preserve rob(n).DNA(DNApos + 5)
            End If
            Parse a, rob(n).DNA(DNApos), n
          End If
        End If
    End If
here:
  Wend
  Close 1
  LoadDNA = True
  DNApos = DNApos + 1
  If DNApos > UBound(rob(n).DNA()) Then
    ReDim Preserve rob(n).DNA(DNApos + 1)
  End If
  rob(n).DNA(DNApos).tipo = 10
  rob(n).DNA(DNApos).value = 1
  'ReDim Preserve rob(n).DNA(DnaLen(rob(n).DNA())) ' EricL commented out March 15, 2006
  ReDim Preserve rob(n).DNA(DNApos)  'EricL - Added March 15, 2006
  'Botsareus 6/5/2013 Bug fix to do with leading zero on def
  If useref Then
    If rob(n).DNA(0).tipo = 0 And rob(n).DNA(0).value = 0 And _
       Not rob(n).DNA(1).tipo = 9 _
    Then
        For DNApos = 0 To UBound(rob(n).DNA) - 1
            rob(n).DNA(DNApos) = rob(n).DNA(DNApos + 1)
        Next
        ReDim Preserve rob(n).DNA(UBound(rob(n).DNA) - 1)
    End If
  End If
  Exit Function
  
fine:
    Close 1
    MsgBox Err.Description + ".  Path: " + path
    LoadDNA = False
End Function

' inserts a new private variable in the private vars list
Public Sub insertvar(n As Integer, a As String)
  Dim b As String
  Dim c As String
  Dim pos As Integer
  a = Right(a, Len(a) - 4)
  pos = InStr(a, " ")
  c = Right(a, Len(a) - pos)
  b = Left(a, pos - 1)
  c = Right(a, Len(a) - pos)
  rob(n).vars(rob(n).vnum).Name = b
  rob(n).vars(rob(n).vnum).value = Val(c)
  rob(n).vnum = rob(n).vnum + 1
End Sub

'----------------------
'CROSSOVER
'----------------------



'si = start index, ei = end index, iinc = layer
Private Sub FindLongestSequences(ByRef rob1() As block3, ByRef rob2() As block3, si1 As Integer, ei1 As Integer, si2 As Integer, ei2 As Integer)
'Step1 What index range is smaller?
Dim searchlen As Integer
searchlen = ei1 - si1
If ei2 - si2 < searchlen Then searchlen = ei2 - si2
'Step2 Recrusivelly sweep from largest to shortest searchlen until match is found
Dim mylen As Integer
For mylen = (searchlen + 1) To 1 Step -1

    'Step2A The sweep itself
    Dim sweep1 As Integer
    Dim sweep2 As Integer
    
    For sweep1 = si1 To ei1 - (mylen - 1)
        For sweep2 = si2 To ei2 - (mylen - 1)
        
            'the match algo
            Dim lenloop As Integer
            Dim allmatch As Boolean 'are all values the same for this sweep?
            allmatch = True
            For lenloop = 0 To mylen - 1
                If rob1(lenloop + sweep1).nucli <> rob2(lenloop + sweep2).nucli Then
                    allmatch = False
                    Exit For
                End If
            Next
            If allmatch Then
            'match is found, goto step3
                iinc = iinc + 1
                For lenloop = 0 To mylen - 1
                    rob1(lenloop + sweep1).match = iinc
                    rob2(lenloop + sweep2).match = iinc
                Next
                GoTo step3
            End If
        Next
    Next
    
Caption = "Calculating... (" & CInt(100 - (ei1 - si1 + ei2 - si2) / (UBound(rob1) + UBound(rob2)) * 100) & "." & CInt(100 - mylen / (searchlen + 1) * 100) & "%)"
DoEvents
Next
Exit Sub
step3:
'find lefthand subsequance
If sweep1 > si1 And sweep2 > si2 Then FindLongestSequences rob1, rob2, si1, sweep1 - 1, si2, sweep2 - 1
'find righthand subsequance
If sweep1 + (mylen - 1) < ei1 And sweep2 + (mylen - 1) < ei2 Then FindLongestSequences rob1, rob2, sweep1 + mylen, ei1, sweep2 + mylen, ei2
End Sub


Private Function scanfromn(ByRef rob() As block2, ByVal n As Integer, ByRef layer As Integer)
Dim a As Integer
For a = n To UBound(rob)
    If rob(a).match <> layer Then
        scanfromn = a
        layer = rob(a).match
        Exit Function
    End If
Next
scanfromn = UBound(rob) + 1
End Function


Private Sub crossover(ByRef rob1() As block2, ByRef rob2() As block2, ByRef Outdna() As block)
Dim i As Integer 'layer
Dim n1 As Integer 'start pos
Dim n2 As Integer
Dim nn As Integer
Dim res1 As Integer 'result1
Dim res2 As Integer
Dim resn As Integer
Dim upperbound As Integer
Dim a As Integer 'looper

Dim nfirst As Boolean 'is it not the first loop

Do

'diff search

n1 = res1 + resn - nn
n2 = res2 + resn - nn

'presets
i = 0
If nfirst Then
    upperbound = UBound(Outdna)
Else
    nfirst = True
    upperbound = -1
End If

res1 = scanfromn(rob1, n1, 0)
res2 = scanfromn(rob2, n2, i)


'subloop
If res1 - n1 > 0 And res2 - n2 > 0 Then 'run both sides
    If Int(Rnd * 2) = 0 Then 'which side?
        ReDim Preserve Outdna(upperbound + res1 - n1)
        For a = n1 To res1 - 1
            Outdna(upperbound + 1 + a - n1).tipo = rob1(a).tipo
            Outdna(upperbound + 1 + a - n1).value = rob1(a).value
        Next
    Else
        ReDim Preserve Outdna(upperbound + res2 - n2)
        For a = n2 To res2 - 1
            Outdna(upperbound + 1 + a - n2).tipo = rob2(a).tipo
            Outdna(upperbound + 1 + a - n2).value = rob2(a).value
        Next
    End If
ElseIf res1 - n1 > 0 Then 'run one side
    If Int(Rnd * 2) = 0 Then
        ReDim Preserve Outdna(upperbound + res1 - n1)
        For a = n1 To res1 - 1
            Outdna(upperbound + 1 + a - n1).tipo = rob1(a).tipo
            Outdna(upperbound + 1 + a - n1).value = rob1(a).value
        Next
    End If
ElseIf res2 - n2 > 0 Then 'run other side
    If Int(Rnd * 2) = 0 Then
        ReDim Preserve Outdna(upperbound + res2 - n2)
        For a = n2 To res2 - 1
            Outdna(upperbound + 1 + a - n2).tipo = rob2(a).tipo
            Outdna(upperbound + 1 + a - n2).value = rob2(a).value
        Next
    End If
End If


'same search

If i = 0 Then Exit Sub
upperbound = UBound(Outdna)
nn = res1
resn = scanfromn(rob1(), nn, i)

ReDim Preserve Outdna(upperbound + resn - nn)

For a = nn To resn - 1
    Outdna(upperbound + 1 + a - nn).tipo = rob1(a).tipo
    Outdna(upperbound + 1 + a - nn).value = rob1(a).value
Next

Loop

End Sub

