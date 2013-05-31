VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Welcome to Snapshot Search"
   ClientHeight    =   1440
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   4935
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1440
   ScaleWidth      =   4935
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Special Query Settings"
      Height          =   735
      Left            =   240
      TabIndex        =   3
      Top             =   600
      Width           =   4575
      Begin VB.CheckBox chk 
         Caption         =   "Do not limit absmin and absmax by name"
         Height          =   195
         Left            =   720
         TabIndex        =   4
         Top             =   360
         Width           =   3255
      End
   End
   Begin MSComDlg.CommonDialog myOpen 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton btnAbout 
      Caption         =   "&About"
      Height          =   375
      Left            =   3720
      TabIndex        =   2
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton btnHelp 
      Caption         =   "&Help"
      Height          =   375
      Left            =   2520
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton btnExtract 
      Caption         =   "&Extract DNA from Snapshot"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Type item
    robid As Double
    parentid As Double
    foundername As String
    generation As Double
    birthcycle As Double
    age As Double
    mutations As Double
    newmutations As Double
    dnalength As Double
    offspringnumber As Double
    kills As Double
    fitness As Double
    energy As Double
    chloroplasts As Double
    dna As String
End Type

Dim robs() As item

Dim absmin As item
Dim absmax As item
Dim cmin As item
Dim cmax As item

Private Sub btnAbout_Click()
MsgBox "Snapshot search was created by: Botsareus a.k.a. Paul Kononov", vbInformation, "About"
End Sub

Private Sub btnExtract_Click()
Dim myQuery As String

myOpen.FileName = ""
myOpen.Filter = "Snapshot file(*.set)|*.snp|All files(*.*)|*.*"
myOpen.ShowOpen
If myOpen.FileName <> "" Then
    myQuery = LCase(InputBox("Enter the search query:"))
    Dim a As Integer

    On Error GoTo fine

    'upload
    
    ReDim robs(0)
    
    Dim robinfo As String
    Open myOpen.FileName For Input As #1
         robinfo = Input(LOF(1), #1)
    Close #1
    
    Dim splitrobinfo() As String
    Dim splitline() As String
    Dim splitvar() As String
    
    splitrobinfo = Split(robinfo, vbCrLf & vbCrLf & vbCrLf)
    
    Dim i As Integer
    ReDim robs(UBound(splitrobinfo) - 1)
    For i = 1 To UBound(splitrobinfo)

        splitline = Split(splitrobinfo(i), vbCrLf)
        
        splitvar = Split(splitline(0), ",")
        
        'store variables
        
        robs(i - 1).robid = val(splitvar(0))
        robs(i - 1).parentid = val(splitvar(1))
        robs(i - 1).foundername = LCase(splitvar(2))
        robs(i - 1).generation = val(splitvar(3))
        robs(i - 1).birthcycle = val(splitvar(4))
        robs(i - 1).age = val(splitvar(5))
        robs(i - 1).mutations = val(splitvar(6))
        robs(i - 1).newmutations = val(splitvar(7))
        robs(i - 1).dnalength = val(splitvar(8))
        robs(i - 1).offspringnumber = val(splitvar(9))
        robs(i - 1).kills = val(splitvar(10))
        robs(i - 1).fitness = val(splitvar(11))
        robs(i - 1).energy = val(splitvar(12))
        robs(i - 1).chloroplasts = val(splitvar(13))
        
        'store dna
        
        splitline(0) = ""
        
        Dim dna As String
        dna = Join(splitline, vbCrLf)
        robs(i - 1).dna = dna
    
    Next
    
    
    'calculate
    calc_abs
    calc_c
    
    Dim splitq() As String
    
    splitq = Split(myQuery, ",")
    
    Dim ii As Byte
    
    For ii = 0 To UBound(splitq)
    
        'we have to devide the query items by left of = and right of =
        Dim varside As String
        Dim dataside As String
        Dim splitdata() As String
        Dim tmpsplt() As String
        
        tmpsplt = Split(splitq(ii), "=")
        
        varside = tmpsplt(0) & Space(20)
        dataside = tmpsplt(1)
        
        'calculate name if and only if first query item
        If varside Like "name*" And ii = 0 Then
            
            'remove all robots that do not match name
            For i = 0 To UBound(robs)
                If Not (robs(i).foundername Like Mid(dataside, 2, Len(dataside) - 2)) Then
                    robs(i).foundername = ""
                End If
            Next
            
            If chk.value = 0 Then calc_abs 'do we need to limit by name?
            calc_c
            
        Else
        
            splitdata = Split(dataside, "to")
            
        End If
        
        Dim directly As Double
        Dim range1 As Double
        Dim range2 As Double
        
        If varside Like "robid*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.robid, cmax.robid, absmin.robid, absmax.robid)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).robid <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.robid, cmax.robid, absmin.robid, absmax.robid)
                range2 = qcomp(splitdata(1), cmin.robid, cmax.robid, absmin.robid, absmax.robid)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).robid >= range1 And robs(i).robid <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "parentid*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.parentid, cmax.parentid, absmin.parentid, absmax.parentid)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).parentid <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.parentid, cmax.parentid, absmin.parentid, absmax.parentid)
                range2 = qcomp(splitdata(1), cmin.parentid, cmax.parentid, absmin.parentid, absmax.parentid)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).parentid >= range1 And robs(i).parentid <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "generation *" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.generation, cmax.generation, absmin.generation, absmax.generation)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).generation <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.generation, cmax.generation, absmin.generation, absmax.generation)
                range2 = qcomp(splitdata(1), cmin.generation, cmax.generation, absmin.generation, absmax.generation)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).generation >= range1 And robs(i).generation <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
         
        If varside Like "birthcycle*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.birthcycle, cmax.birthcycle, absmin.birthcycle, absmax.birthcycle)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).birthcycle <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.birthcycle, cmax.birthcycle, absmin.birthcycle, absmax.birthcycle)
                range2 = qcomp(splitdata(1), cmin.birthcycle, cmax.birthcycle, absmin.birthcycle, absmax.birthcycle)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).birthcycle >= range1 And robs(i).birthcycle <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "age*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.age, cmax.age, absmin.age, absmax.age)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).age <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.age, cmax.age, absmin.age, absmax.age)
                range2 = qcomp(splitdata(1), cmin.age, cmax.age, absmin.age, absmax.age)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).age >= range1 And robs(i).age <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "mutations*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.mutations, cmax.mutations, absmin.mutations, absmax.mutations)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).mutations <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.mutations, cmax.mutations, absmin.mutations, absmax.mutations)
                range2 = qcomp(splitdata(1), cmin.mutations, cmax.mutations, absmin.mutations, absmax.mutations)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).mutations >= range1 And robs(i).mutations <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
         If varside Like "newmutations*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.newmutations, cmax.newmutations, absmin.newmutations, absmax.newmutations)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).newmutations <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.newmutations, cmax.newmutations, absmin.newmutations, absmax.newmutations)
                range2 = qcomp(splitdata(1), cmin.newmutations, cmax.newmutations, absmin.newmutations, absmax.newmutations)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).newmutations >= range1 And robs(i).newmutations <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
    
        If varside Like "dnalength*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.dnalength, cmax.dnalength, absmin.dnalength, absmax.dnalength)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).dnalength <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.dnalength, cmax.dnalength, absmin.dnalength, absmax.dnalength)
                range2 = qcomp(splitdata(1), cmin.dnalength, cmax.dnalength, absmin.dnalength, absmax.dnalength)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).dnalength >= range1 And robs(i).dnalength <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If

        If varside Like "offspringnumber*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.offspringnumber, cmax.offspringnumber, absmin.offspringnumber, absmax.offspringnumber)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).offspringnumber <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.offspringnumber, cmax.offspringnumber, absmin.offspringnumber, absmax.offspringnumber)
                range2 = qcomp(splitdata(1), cmin.offspringnumber, cmax.offspringnumber, absmin.offspringnumber, absmax.offspringnumber)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).offspringnumber >= range1 And robs(i).offspringnumber <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "kills*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.kills, cmax.kills, absmin.kills, absmax.kills)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).kills <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.kills, cmax.kills, absmin.kills, absmax.kills)
                range2 = qcomp(splitdata(1), cmin.kills, cmax.kills, absmin.kills, absmax.kills)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).kills >= range1 And robs(i).kills <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "fitness*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.fitness, cmax.fitness, absmin.fitness, absmax.fitness)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).fitness <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.fitness, cmax.fitness, absmin.fitness, absmax.fitness)
                range2 = qcomp(splitdata(1), cmin.fitness, cmax.fitness, absmin.fitness, absmax.fitness)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).fitness >= range1 And robs(i).fitness <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "energy*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.energy, cmax.energy, absmin.energy, absmax.energy)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).energy <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.energy, cmax.energy, absmin.energy, absmax.energy)
                range2 = qcomp(splitdata(1), cmin.energy, cmax.energy, absmin.energy, absmax.energy)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).energy >= range1 And robs(i).energy <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If
        
        If varside Like "chloroplasts*" Then
               
            'are we calculating directly or range?
            If UBound(splitdata) = 0 Then
                directly = qcomp(splitdata(0), cmin.chloroplasts, cmax.chloroplasts, absmin.chloroplasts, absmax.chloroplasts)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If robs(i).chloroplasts <> directly Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            Else
                'range
                range1 = qcomp(splitdata(0), cmin.chloroplasts, cmax.chloroplasts, absmin.chloroplasts, absmax.chloroplasts)
                range2 = qcomp(splitdata(1), cmin.chloroplasts, cmax.chloroplasts, absmin.chloroplasts, absmax.chloroplasts)
                For i = 0 To UBound(robs)
                    If robs(i).foundername <> "" Then
                        If Not (robs(i).chloroplasts >= range1 And robs(i).chloroplasts <= range2) Then
                            robs(i).foundername = ""
                        End If
                    End If
                Next
            End If
            
        calc_c
            
        End If

    Next
    
    
    'output
    
    frmDir.Show vbModal, Me
    
    For i = 0 To UBound(robs)
        
        'only select active robots
        If robs(i).foundername <> "" Then
            Open frmDir.Dir1.Path & "\" & robs(i).robid & "-" & robs(i).foundername For Output As #1
                Print #1, robs(i).dna
            Close #1
        End If
        
    Next
    
End If
Exit Sub
fine:
MsgBox "An error has accured." & vbCrLf & vbCrLf & "file: " & myOpen.FileName & vbCrLf & "query: " & myQuery & vbCrLf & vbCrLf & "Press CTRL+C to copy this message.", vbCritical
End Sub

Sub calc_abs()
absmin.robid = 10 ^ 10
absmin.parentid = 10 ^ 10
absmin.generation = 10 ^ 10
absmin.birthcycle = 10 ^ 10
absmin.age = 10 ^ 10
absmin.mutations = 10 ^ 10
absmin.newmutations = 10 ^ 10
absmin.dnalength = 10 ^ 10
absmin.offspringnumber = 10 ^ 10
absmin.kills = 10 ^ 10
absmin.fitness = 10 ^ 10
absmin.energy = 10 ^ 10
absmin.chloroplasts = 10 ^ 10
'
absmax.robid = 0
absmax.parentid = 0
absmax.generation = 0
absmax.birthcycle = 0
absmax.age = 0
absmax.mutations = 0
absmax.newmutations = 0
absmax.dnalength = 0
absmax.offspringnumber = 0
absmax.kills = 0
absmax.fitness = 0
absmax.energy = 0
absmax.chloroplasts = 0
'
Dim i As Integer
For i = 0 To UBound(robs)
 If robs(i).foundername <> "" Then
  'robid
  If robs(i).robid > absmax.robid Then absmax.robid = robs(i).robid
  If robs(i).robid < absmin.robid Then absmin.robid = robs(i).robid
  'parentid
  If robs(i).parentid > absmax.parentid Then absmax.parentid = robs(i).parentid
  If robs(i).parentid < absmin.parentid Then absmin.parentid = robs(i).parentid
  'generation
  If robs(i).generation > absmax.generation Then absmax.generation = robs(i).generation
  If robs(i).generation < absmin.generation Then absmin.generation = robs(i).generation
  'birthcycle
  If robs(i).birthcycle > absmax.birthcycle Then absmax.birthcycle = robs(i).birthcycle
  If robs(i).birthcycle < absmin.birthcycle Then absmin.birthcycle = robs(i).birthcycle
  'age
  If robs(i).age > absmax.age Then absmax.age = robs(i).age
  If robs(i).age < absmin.age Then absmin.age = robs(i).age
  'mutations
  If robs(i).mutations > absmax.mutations Then absmax.mutations = robs(i).mutations
  If robs(i).mutations < absmin.mutations Then absmin.mutations = robs(i).mutations
  'newmutations
  If robs(i).newmutations > absmax.newmutations Then absmax.newmutations = robs(i).newmutations
  If robs(i).newmutations < absmin.newmutations Then absmin.newmutations = robs(i).newmutations
  'dnalength
  If robs(i).dnalength > absmax.dnalength Then absmax.dnalength = robs(i).dnalength
  If robs(i).dnalength < absmin.dnalength Then absmin.dnalength = robs(i).dnalength
  'offspringnumber
  If robs(i).offspringnumber > absmax.offspringnumber Then absmax.offspringnumber = robs(i).offspringnumber
  If robs(i).offspringnumber < absmin.offspringnumber Then absmin.offspringnumber = robs(i).offspringnumber
  'kills
  If robs(i).kills > absmax.kills Then absmax.kills = robs(i).kills
  If robs(i).kills < absmin.kills Then absmin.kills = robs(i).kills
  'fitness
  If robs(i).fitness > absmax.fitness Then absmax.fitness = robs(i).fitness
  If robs(i).fitness < absmin.fitness Then absmin.fitness = robs(i).fitness
  'energy
  If robs(i).energy > absmax.energy Then absmax.energy = robs(i).energy
  If robs(i).energy < absmin.energy Then absmin.energy = robs(i).energy
  'chloroplasts
  If robs(i).chloroplasts > absmax.chloroplasts Then absmax.chloroplasts = robs(i).chloroplasts
  If robs(i).chloroplasts < absmin.chloroplasts Then absmin.chloroplasts = robs(i).chloroplasts
 End If
Next
End Sub

Sub calc_c()
cmin.robid = 10 ^ 10
cmin.parentid = 10 ^ 10
cmin.generation = 10 ^ 10
cmin.birthcycle = 10 ^ 10
cmin.age = 10 ^ 10
cmin.mutations = 10 ^ 10
cmin.newmutations = 10 ^ 10
cmin.dnalength = 10 ^ 10
cmin.offspringnumber = 10 ^ 10
cmin.kills = 10 ^ 10
cmin.fitness = 10 ^ 10
cmin.energy = 10 ^ 10
cmin.chloroplasts = 10 ^ 10
'
cmax.robid = 0
cmax.parentid = 0
cmax.generation = 0
cmax.birthcycle = 0
cmax.age = 0
cmax.mutations = 0
cmax.newmutations = 0
cmax.dnalength = 0
cmax.offspringnumber = 0
cmax.kills = 0
cmax.fitness = 0
cmax.energy = 0
cmax.chloroplasts = 0
'
Dim i As Integer
For i = 0 To UBound(robs)
 If robs(i).foundername <> "" Then
  'robid
  If robs(i).robid > cmax.robid Then cmax.robid = robs(i).robid
  If robs(i).robid < cmin.robid Then cmin.robid = robs(i).robid
  'parentid
  If robs(i).parentid > cmax.parentid Then cmax.parentid = robs(i).parentid
  If robs(i).parentid < cmin.parentid Then cmin.parentid = robs(i).parentid
  'generation
  If robs(i).generation > cmax.generation Then cmax.generation = robs(i).generation
  If robs(i).generation < cmin.generation Then cmin.generation = robs(i).generation
  'birthcycle
  If robs(i).birthcycle > cmax.birthcycle Then cmax.birthcycle = robs(i).birthcycle
  If robs(i).birthcycle < cmin.birthcycle Then cmin.birthcycle = robs(i).birthcycle
  'age
  If robs(i).age > cmax.age Then cmax.age = robs(i).age
  If robs(i).age < cmin.age Then cmin.age = robs(i).age
  'mutations
  If robs(i).mutations > cmax.mutations Then cmax.mutations = robs(i).mutations
  If robs(i).mutations < cmin.mutations Then cmin.mutations = robs(i).mutations
  'newmutations
  If robs(i).newmutations > cmax.newmutations Then cmax.newmutations = robs(i).newmutations
  If robs(i).newmutations < cmin.newmutations Then cmin.newmutations = robs(i).newmutations
  'dnalength
  If robs(i).dnalength > cmax.dnalength Then cmax.dnalength = robs(i).dnalength
  If robs(i).dnalength < cmin.dnalength Then cmin.dnalength = robs(i).dnalength
  'offspringnumber
  If robs(i).offspringnumber > cmax.offspringnumber Then cmax.offspringnumber = robs(i).offspringnumber
  If robs(i).offspringnumber < cmin.offspringnumber Then cmin.offspringnumber = robs(i).offspringnumber
  'kills
  If robs(i).kills > cmax.kills Then cmax.kills = robs(i).kills
  If robs(i).kills < cmin.kills Then cmin.kills = robs(i).kills
  'fitness
  If robs(i).fitness > cmax.fitness Then cmax.fitness = robs(i).fitness
  If robs(i).fitness < cmin.fitness Then cmin.fitness = robs(i).fitness
  'energy
  If robs(i).energy > cmax.energy Then cmax.energy = robs(i).energy
  If robs(i).energy < cmin.energy Then cmin.energy = robs(i).energy
  'chloroplasts
  If robs(i).chloroplasts > cmax.chloroplasts Then cmax.chloroplasts = robs(i).chloroplasts
  If robs(i).chloroplasts < cmin.chloroplasts Then cmin.chloroplasts = robs(i).chloroplasts
 End If
Next
End Sub

Private Sub btnHelp_Click()
frmHelp.Show
End Sub
