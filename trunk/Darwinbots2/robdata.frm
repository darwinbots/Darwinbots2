VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form datirob 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Dati del robot"
   ClientHeight    =   7545
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   10110
   Icon            =   "robdata.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7545
   ScaleWidth      =   10110
   ShowInTaskbar   =   0   'False
   Tag             =   "15000"
   Begin VB.CommandButton ShrinkWin 
      Caption         =   "Close details"
      Height          =   240
      Left            =   3480
      TabIndex        =   28
      Tag             =   "15017"
      Top             =   7150
      Width           =   1770
   End
   Begin VB.Frame Frame2 
      Height          =   7515
      Left            =   3240
      TabIndex        =   24
      Top             =   0
      Width           =   6795
      Begin VB.CommandButton btnMark 
         Caption         =   "Mark a location"
         Height          =   240
         Left            =   2160
         TabIndex        =   59
         Top             =   7150
         Width           =   1770
      End
      Begin VB.CheckBox MemoryStateCheck 
         Caption         =   "Display memory post DNA execution but before cycle executes"
         Height          =   375
         Left            =   2160
         TabIndex        =   58
         Top             =   7080
         Width           =   5775
      End
      Begin RichTextLib.RichTextBox dnatext 
         Height          =   6705
         Left            =   0
         TabIndex        =   27
         Top             =   360
         Width           =   6555
         _ExtentX        =   11562
         _ExtentY        =   11827
         _Version        =   393217
         Enabled         =   -1  'True
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"robdata.frx":0E42
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Times New Roman"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label robtag 
         Height          =   255
         Left            =   40
         TabIndex        =   62
         ToolTipText     =   "Double click to edit"
         Top             =   120
         Width           =   6615
      End
   End
   Begin VB.Frame Frame1 
      Height          =   7515
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   3075
      Begin VB.CommandButton MemoryCommand 
         Caption         =   "Memory ->"
         Height          =   285
         Left            =   1605
         TabIndex        =   53
         Top             =   6360
         Width           =   1365
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Discendenti"
         Height          =   300
         Left            =   90
         TabIndex        =   46
         Tag             =   "15011"
         Top             =   6000
         Width           =   1410
      End
      Begin VB.CommandButton dnashow 
         Caption         =   "Dna ->"
         Height          =   285
         Left            =   1605
         TabIndex        =   45
         Top             =   6720
         Width           =   1365
      End
      Begin VB.CommandButton MutDetails 
         Caption         =   "Mutation details->"
         Height          =   285
         Left            =   1605
         TabIndex        =   44
         Tag             =   "15016"
         Top             =   7080
         Width           =   1365
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Show activations"
         Height          =   285
         Index           =   0
         Left            =   90
         TabIndex        =   43
         Top             =   6720
         Width           =   1425
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Open console"
         Height          =   285
         Left            =   90
         TabIndex        =   42
         Top             =   6360
         Width           =   1425
      End
      Begin VB.CommandButton Repro 
         Caption         =   "Reproduce"
         Height          =   285
         Index           =   1
         Left            =   90
         TabIndex        =   41
         Top             =   7080
         Width           =   1425
      End
      Begin VB.Line Line1 
         X1              =   240
         X2              =   2760
         Y1              =   5040
         Y2              =   5040
      End
      Begin VB.Label Label11 
         Caption         =   "Chloroplasts"
         Height          =   195
         Left            =   120
         TabIndex        =   61
         Top             =   4800
         Width           =   1215
      End
      Begin VB.Label ChlrLabel 
         Alignment       =   1  'Right Justify
         Caption         =   "VTimer"
         Height          =   195
         Left            =   2100
         TabIndex        =   60
         Top             =   4800
         Width           =   795
      End
      Begin VB.Label Label10 
         Caption         =   "Radius"
         Height          =   255
         Left            =   120
         TabIndex        =   57
         Top             =   2880
         Width           =   975
      End
      Begin VB.Label RadiusLabel 
         Alignment       =   1  'Right Justify
         Caption         =   "radius"
         Height          =   255
         Left            =   2100
         TabIndex        =   56
         Top             =   2880
         Width           =   795
      End
      Begin VB.Label Label9 
         Caption         =   "Velocity"
         Height          =   195
         Left            =   120
         TabIndex        =   55
         Top             =   3120
         Width           =   1215
      End
      Begin VB.Label VelocityLabel 
         Alignment       =   1  'Right Justify
         Caption         =   "velocity"
         Height          =   195
         Left            =   2100
         TabIndex        =   54
         Top             =   3120
         Width           =   795
      End
      Begin VB.Label VTimerLabel 
         Alignment       =   1  'Right Justify
         Caption         =   "VTimer"
         Height          =   195
         Left            =   2100
         TabIndex        =   52
         Top             =   4560
         Width           =   795
      End
      Begin VB.Label PoisonLabel 
         Alignment       =   1  'Right Justify
         Caption         =   "poison"
         Height          =   195
         Left            =   2100
         TabIndex        =   51
         Top             =   4320
         Width           =   795
      End
      Begin VB.Label Label7 
         Caption         =   "Poison"
         Height          =   195
         Left            =   120
         TabIndex        =   50
         Top             =   4320
         Width           =   1215
      End
      Begin VB.Label Label6 
         Caption         =   "Virus Timer"
         Height          =   195
         Left            =   120
         TabIndex        =   49
         Top             =   4560
         Width           =   1215
      End
      Begin VB.Label UniqueBotID 
         Alignment       =   1  'Right Justify
         Caption         =   "unique id"
         Height          =   225
         Left            =   2100
         TabIndex        =   48
         Top             =   960
         Width           =   795
      End
      Begin VB.Label UniqueIDLabel 
         Caption         =   "Unique ID"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   105
         TabIndex        =   47
         Tag             =   "15999"
         ToolTipText     =   "The unique ID of this bot.  No other bot will ever have this number in the sim."
         Top             =   960
         Width           =   1530
      End
      Begin VB.Label robslime 
         Alignment       =   1  'Right Justify
         Caption         =   "slime"
         Height          =   195
         Left            =   2100
         TabIndex        =   40
         Top             =   4080
         Width           =   795
      End
      Begin VB.Label Label5 
         Caption         =   "Slime"
         Height          =   195
         Left            =   120
         TabIndex        =   39
         Top             =   4080
         Width           =   1215
      End
      Begin VB.Label robshell 
         Alignment       =   1  'Right Justify
         Caption         =   "shell"
         Height          =   195
         Left            =   2100
         TabIndex        =   38
         Top             =   3840
         Width           =   795
      End
      Begin VB.Label Label4 
         Caption         =   "Shell"
         Height          =   195
         Left            =   120
         TabIndex        =   37
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label robvenom 
         Alignment       =   1  'Right Justify
         Caption         =   "venom"
         Height          =   195
         Left            =   2100
         TabIndex        =   36
         Top             =   3600
         Width           =   795
      End
      Begin VB.Label Label3 
         Caption         =   "Venom"
         Height          =   195
         Left            =   120
         TabIndex        =   35
         Top             =   3600
         Width           =   1215
      End
      Begin VB.Label robmass 
         Alignment       =   1  'Right Justify
         Caption         =   "mass"
         Height          =   255
         Left            =   2100
         TabIndex        =   34
         Top             =   2640
         Width           =   795
      End
      Begin VB.Label MassLabel 
         Caption         =   "Mass"
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Top             =   2640
         Width           =   975
      End
      Begin VB.Label robbody 
         Alignment       =   1  'Right Justify
         Caption         =   "body"
         Height          =   255
         Left            =   2100
         TabIndex        =   32
         Top             =   2400
         Width           =   795
      End
      Begin VB.Label BodyLabel 
         Caption         =   "Body"
         Height          =   255
         Left            =   105
         TabIndex        =   31
         Top             =   2400
         Width           =   735
      End
      Begin VB.Label wasteval 
         Alignment       =   1  'Right Justify
         Caption         =   "waste"
         Height          =   180
         Left            =   2100
         TabIndex        =   30
         Top             =   3360
         Width           =   795
      End
      Begin VB.Label Waste 
         Caption         =   "Waste"
         Height          =   195
         Left            =   120
         TabIndex        =   29
         Top             =   3360
         Width           =   1455
      End
      Begin VB.Label LastOwnLab 
         Caption         =   "lastownername"
         Height          =   225
         Left            =   1140
         TabIndex        =   26
         Top             =   480
         Width           =   1845
      End
      Begin VB.Label Label1 
         Caption         =   "Last Sim:"
         Height          =   195
         Left            =   105
         TabIndex        =   25
         Tag             =   "15015"
         Top             =   480
         Width           =   810
      End
      Begin VB.Label totlenlab 
         Alignment       =   1  'Right Justify
         Caption         =   "dnalen"
         Height          =   195
         Left            =   2100
         TabIndex        =   23
         Top             =   5520
         Width           =   795
      End
      Begin VB.Label totlen 
         Caption         =   "Lunghezza DNA"
         Height          =   240
         Left            =   120
         TabIndex        =   22
         Tag             =   "15012"
         Top             =   5520
         Width           =   1485
      End
      Begin VB.Label robgener 
         Alignment       =   1  'Right Justify
         Caption         =   "gener"
         Height          =   240
         Left            =   2100
         TabIndex        =   21
         Top             =   1680
         Width           =   795
      End
      Begin VB.Label generation 
         Caption         =   "Generation"
         Height          =   195
         Left            =   105
         TabIndex        =   20
         Tag             =   "15005"
         Top             =   1680
         Width           =   1065
      End
      Begin VB.Label robgene 
         Alignment       =   1  'Right Justify
         Caption         =   "gennum"
         Height          =   195
         Left            =   2100
         TabIndex        =   19
         Top             =   5760
         Width           =   795
      End
      Begin VB.Label robover 
         Alignment       =   1  'Right Justify
         Caption         =   "overallm"
         Height          =   195
         Left            =   2100
         TabIndex        =   18
         Top             =   5280
         Width           =   795
      End
      Begin VB.Label rgenes 
         Caption         =   "Numero di geni"
         Height          =   240
         Left            =   105
         TabIndex        =   17
         Tag             =   "15008"
         Top             =   5760
         Width           =   1485
      End
      Begin VB.Label roverall 
         Caption         =   "Mutazioni totali"
         Height          =   195
         Left            =   105
         TabIndex        =   16
         Tag             =   "15007"
         Top             =   5280
         Width           =   1590
      End
      Begin VB.Label robmutations 
         Alignment       =   1  'Right Justify
         Caption         =   "mut"
         Height          =   195
         Left            =   2100
         TabIndex        =   15
         Top             =   5040
         Width           =   795
      End
      Begin VB.Label rmutation 
         Caption         =   "Mutazioni nuove"
         Height          =   240
         Left            =   120
         TabIndex        =   14
         Tag             =   "15006"
         Top             =   5040
         Width           =   2010
      End
      Begin VB.Label rfname 
         Caption         =   "Species:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   765
      End
      Begin VB.Label robson 
         Alignment       =   1  'Right Justify
         Caption         =   "sonnum"
         Height          =   180
         Left            =   2100
         TabIndex        =   12
         Top             =   1920
         Width           =   795
      End
      Begin VB.Label rson 
         Caption         =   "Offspring"
         Height          =   195
         Left            =   105
         TabIndex        =   11
         Top             =   1920
         Width           =   1905
      End
      Begin VB.Label robage 
         Alignment       =   1  'Right Justify
         Caption         =   "age"
         Height          =   225
         Left            =   2100
         TabIndex        =   10
         Top             =   1440
         Width           =   795
      End
      Begin VB.Label robparent 
         Alignment       =   1  'Right Justify
         Caption         =   "parent id"
         Height          =   225
         Left            =   2100
         TabIndex        =   9
         Top             =   1200
         Width           =   795
      End
      Begin VB.Label robnrg 
         Alignment       =   1  'Right Justify
         Caption         =   "nrg"
         Height          =   225
         Left            =   2100
         TabIndex        =   8
         Top             =   2160
         Width           =   795
      End
      Begin VB.Label robnum 
         Alignment       =   1  'Right Justify
         Caption         =   "rob array id"
         Height          =   225
         Left            =   2100
         TabIndex        =   7
         Top             =   720
         Width           =   795
      End
      Begin VB.Label rage 
         Caption         =   "Age (cycles)"
         Height          =   240
         Left            =   105
         TabIndex        =   6
         Tag             =   "15009"
         Top             =   1440
         Width           =   1905
      End
      Begin VB.Label rparent 
         Caption         =   "Id del genitore"
         Height          =   195
         Left            =   105
         TabIndex        =   5
         Tag             =   "15003"
         Top             =   1200
         Width           =   1170
      End
      Begin VB.Label rnrg 
         Caption         =   "Energy"
         Height          =   240
         Left            =   105
         TabIndex        =   4
         Tag             =   "15004"
         Top             =   2160
         Width           =   645
      End
      Begin VB.Label Rnum 
         Caption         =   "Robot array ID"
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   1170
      End
      Begin VB.Label robfname 
         Caption         =   "fname"
         Height          =   225
         Left            =   1140
         TabIndex        =   2
         Top             =   240
         Width           =   1860
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Caption         =   "------"
         Height          =   240
         Left            =   2100
         TabIndex        =   1
         Top             =   6000
         Width           =   795
      End
   End
End
Attribute VB_Name = "datirob"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Senses As Boolean
Public enlarged As Boolean
Public showingMemory As Boolean
Public ShowMemoryEarlyCycle As Boolean

Public Sub ShowDna()
  dnashow_Click 'Botsareus 1/25/2013 Show dna using the button
End Sub

Private Sub btnMark_Click() 'Botsareus 2/25/2013 Makes the program easy to debug
Visible = False
Dim poz As Double
    poz = val(InputBox("""[<POSITION MARKER]"" will be displayed next to dna location. Specify position:"))
    poz = Abs(poz)
    If poz > 32000 Then poz = 32000
Visible = True
dnatext.text = DetokenizeDNA(robfocus, False, CInt(poz))
End Sub

Private Sub Command3_Click()
  Consoleform.openconsole
End Sub

Private Sub Command4_Click()
  parentele.mostra
End Sub

Private Sub Command5_Click()
  Consoleform.openconsole
End Sub

Private Sub Command1_Click()
  Label2.Caption = Str(Form1.discendenti(robfocus, 0))
End Sub

Private Sub Command2_Click(Index As Integer)
  ActivForm.Show
End Sub

Private Sub dnashow_Click()
  showingMemory = False
  MemoryStateCheck.Visible = False
  Me.Width = 12645
  dnatext.Width = 9050
  Frame2.Width = 4695 + 8055
  enlarged = True
  If rob(robfocus).exist Then
    dnatext.text = DetokenizeDNA(robfocus, False) ', CInt(poz))
  Else
    dnatext.text = "This Robot is dead.  No DNA available."
  End If
  btnMark.Visible = True 'Botsareus 3/15/2013 Makes dna easyer to debug
End Sub

Private Sub dnatext_Change()
robtag.Caption = Left(rob(robfocus).tag, 45) 'Botsareus 1/28/2014 New short description feature
End Sub

Private Sub MemoryCommand_Click()
 showingMemory = True
 MemoryStateCheck.Visible = True
  Me.Width = 12645
  dnatext.Width = 9050
  Frame2.Width = 4695 + 8055
  enlarged = True
  If rob(robfocus).exist Then
    dnatext.text = GetRobMemoryString(robfocus)
  Else
    dnatext.text = "This Robot is dead.  No DNA available."
  End If
  btnMark.Visible = False 'Botsareus 3/15/2013 Makes dna easyer to debug
End Sub
Public Function GetRobMemoryString(n As Integer) As String
Dim i As Integer
Dim j As Integer

  If Not rob(n).exist Then
    GetRobMemoryString = "This robot is dead"
    Exit Function
  End If
  For j = 1 To 100
    GetRobMemoryString = GetRobMemoryString + Str$((j - 1) * 10 + 1) + ":"
    For i = ((j - 1) * 10) + 1 To (j * 10)
      GetRobMemoryString = GetRobMemoryString + vbTab + Str$(rob(n).mem(i)) 'space(6 - Len(Str$(rob(n).mem(i))))
    Next i
     GetRobMemoryString = GetRobMemoryString + vbCrLf
  Next j
  
End Function


Private Sub MemoryStateCheck_Click()
  ShowMemoryEarlyCycle = MemoryStateCheck.value
End Sub

Private Sub MutDetails_Click()
  showingMemory = False
  MemoryStateCheck.Visible = False
  Me.Width = 12645
  dnatext.Width = 9050
  Frame2.Width = 4695 + 8055
  enlarged = True
  dnatext.text = GiveMutationDetails(robfocus)
  btnMark.Visible = False 'Botsareus 3/15/2013 Makes dna easyer to debug
End Sub

Private Function GiveMutationDetails(robfocus) As String
  GiveMutationDetails = rob(robfocus).LastMutDetail
  If GiveMutationDetails = "" Then GiveMutationDetails = "No mutations"
End Function

Private Sub robtag_DblClick() 'Botsareus 1/28/2014 Enter short description for robot
    SetWindowPos hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE 'Botsareus 12/12/2012 Info form is always on top
    rob(robfocus).tag = InputBox("Enter short description for robot. Can not be more then 45 characters long.", , Left(rob(robfocus).tag, 45))
    rob(robfocus).tag = Left(replacechars(rob(robfocus).tag), 45)
    robtag.Caption = rob(robfocus).tag
    SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE 'Botsareus 12/12/2012 Info form is always on top
End Sub

Private Sub ShrinkWin_Click()
  Me.Width = 3255
  MutDetails.Caption = "Mutation details->"
  enlarged = False
  showingMemory = False
End Sub

Public Sub RefreshDna()
  If enlarged Then
    dnatext.text = DetokenizeDNA(robfocus, False)
  End If
End Sub

Sub Form_Load()
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE 'Botsareus 12/12/2012 Info form is always on top
  strings Me
  rage.Caption = "Age (cycles)" 'EricL 4/13/2006 Override resource file because I don't have a resource editor handy :)
  Me.Width = 3255
  enlarged = False
  ShowMemoryEarlyCycle = False
  MemoryStateCheck.value = 0
End Sub

Sub infoupdate(n As Integer, nrg As Single, par As Long, mut As Long, age As Long, _
                son As Integer, pmut As Single, FName As String, gn As Integer, mo As Long, _
                gennum As Integer, DnaLen As Integer, lastown As String, Waste As Single, body As Single, _
                mass As Single, venom As Single, shell As Single, Slime As Single, ChlrVal As Single) 'Botsareus 8/25/2013 Mod to display chloroplast info.
  robnum.Caption = Str$(n)
  UniqueBotID.Caption = Str$(rob(n).AbsNum)
  robnrg.Caption = Str$(Round(nrg, 2))
  robbody.Caption = Str$(Round(body, 2)) 'EricL 4/14/2006 Removed Int()  Need to see the decimal value
  robmass.Caption = Str$(Round(mass, 2))
  robvenom.Caption = Str$(Round(venom, 2))
  robshell.Caption = Str$(Round(rob(n).shell, 2))
  robslime.Caption = Str$(Round(rob(n).Slime, 2))
  PoisonLabel.Caption = Str$(Round(rob(n).poison, 2))
  VTimerLabel.Caption = Str$(rob(n).Vtimer)
  robparent.Caption = Str$(par)
  robmutations.Caption = Str$(mo)
  robage.Caption = Str$(age) ' EricL 4/13/2006 Now reads actual age
  robson.Caption = Str$(son)
  robfname.Caption = FName
  robgene.Caption = Str$(gn)
  robover.Caption = Str$(mut)
  robgener.Caption = rob(n).generation
  totlenlab.Caption = Str$(DnaLen)
  ChlrLabel.Caption = Str$(ChlrVal)
  wasteval.Caption = Str$(Round(Waste, 2))
  VelocityLabel.Caption = Str$(Round(VectorMagnitude(rob(n).vel), 2))
  RadiusLabel.Caption = Str$(Round(rob(n).radius, 2))
  If lastown <> "" Then
    LastOwnLab.Caption = lastown
  Else
    LastOwnLab.Caption = "Self"
  End If
  
  If enlarged And showingMemory Then dnatext.text = GetRobMemoryString(n)
End Sub

Sub Form_Unload(Cancel As Integer)
  If Cancel = 0 Then
    Cancel = -1
    datirob.Visible = False
  End If
  If Cancel = 1 Then
    Cancel = 0
  End If
End Sub

Private Sub repro_Click(Index As Integer)
  Reproduce -1, 50
  Form1.Redraw
End Sub

Private Sub toparent_Click()
  Form1.parentfocus
End Sub

