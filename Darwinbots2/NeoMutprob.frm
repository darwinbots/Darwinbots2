VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form MutationsProbability 
   Caption         =   "Mutation Probabilities"
   ClientHeight    =   8490
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   9165
   Icon            =   "NeoMutprob.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   8490
   ScaleWidth      =   9165
   StartUpPosition =   3  'Windows Default
   Tag             =   "SetDefaultMutationRates TmpOtps.Specie(k).Mutables"
   Begin VB.CommandButton Command1 
      Caption         =   "Default Rates"
      Height          =   495
      Index           =   0
      Left            =   3600
      TabIndex        =   65
      Top             =   7920
      Width           =   1455
   End
   Begin VB.TextBox Probs 
      Enabled         =   0   'False
      Height          =   285
      Index           =   2
      Left            =   1320
      TabIndex        =   60
      Text            =   "Text1"
      Top             =   7020
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox Probs 
      Enabled         =   0   'False
      Height          =   285
      Index           =   1
      Left            =   1320
      TabIndex        =   59
      Text            =   "Text1"
      Top             =   6600
      Width           =   855
   End
   Begin VB.TextBox Text2 
      Height          =   855
      Left            =   3420
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   57
      Text            =   "NeoMutprob.frx":08CA
      Top             =   120
      Width           =   5595
   End
   Begin VB.Frame CustGauss 
      Caption         =   "Custom Gauss"
      Height          =   2775
      Index           =   1
      Left            =   6300
      TabIndex        =   39
      Top             =   1740
      Width           =   2715
      Begin VB.PictureBox Picture1 
         Height          =   1155
         Index           =   1
         Left            =   180
         Picture         =   "NeoMutprob.frx":08D0
         ScaleHeight     =   1095
         ScaleWidth      =   2235
         TabIndex        =   44
         Top             =   420
         Width           =   2295
      End
      Begin VB.TextBox Upper 
         Height          =   285
         Index           =   1
         Left            =   1740
         TabIndex        =   43
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.TextBox Lower 
         Height          =   285
         Index           =   1
         Left            =   300
         TabIndex        =   42
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.TextBox Mean 
         Height          =   285
         Index           =   1
         Left            =   1020
         TabIndex        =   41
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.TextBox StdDev 
         Height          =   285
         Index           =   1
         Left            =   1740
         TabIndex        =   40
         Text            =   "5.268"
         Top             =   2280
         Width           =   555
      End
      Begin VB.Label Label2 
         Caption         =   "Ints"
         Height          =   195
         Index           =   7
         Left            =   2340
         TabIndex        =   49
         Top             =   1980
         Visible         =   0   'False
         Width           =   315
      End
      Begin VB.Label Label1 
         Caption         =   "Upper"
         Height          =   255
         Index           =   6
         Left            =   1800
         TabIndex        =   48
         Top             =   1620
         Width           =   495
      End
      Begin VB.Label Label1 
         Caption         =   "Lower"
         Height          =   255
         Index           =   5
         Left            =   360
         TabIndex        =   47
         Top             =   1620
         Width           =   435
      End
      Begin VB.Label Label1 
         Caption         =   "Mean"
         Height          =   255
         Index           =   4
         Left            =   1080
         TabIndex        =   46
         Top             =   1620
         Width           =   435
      End
      Begin VB.Label Label4 
         Caption         =   "Standard Deviation: "
         Height          =   255
         Index           =   1
         Left            =   300
         TabIndex        =   45
         Top             =   2340
         Width           =   1515
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Okay"
      Height          =   495
      Index           =   1
      Left            =   1860
      TabIndex        =   36
      Top             =   7920
      Width           =   1455
   End
   Begin VB.CheckBox MutTypeEnabled 
      Caption         =   "Enabled"
      Height          =   435
      Left            =   3420
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   1140
      Width           =   2055
   End
   Begin VB.TextBox Probs 
      Alignment       =   1  'Right Justify
      Height          =   285
      Index           =   0
      Left            =   6630
      TabIndex        =   33
      Text            =   "1234567"
      Top             =   1180
      Width           =   755
   End
   Begin VB.CheckBox Global 
      Caption         =   "Apply Changes Globally"
      Height          =   195
      Left            =   180
      TabIndex        =   32
      Top             =   7560
      Visible         =   0   'False
      Width           =   1995
   End
   Begin VB.Frame CustGauss 
      Caption         =   "Custom Gauss"
      Height          =   2775
      Index           =   0
      Left            =   3420
      TabIndex        =   23
      Top             =   1740
      Width           =   2715
      Begin VB.TextBox StdDev 
         Height          =   285
         Index           =   0
         Left            =   1740
         TabIndex        =   38
         Text            =   "5.268"
         Top             =   2280
         Width           =   555
      End
      Begin VB.TextBox Mean 
         Height          =   285
         Index           =   0
         Left            =   1020
         TabIndex        =   28
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.TextBox Lower 
         Height          =   285
         Index           =   0
         Left            =   300
         TabIndex        =   27
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.TextBox Upper 
         Height          =   285
         Index           =   0
         Left            =   1740
         TabIndex        =   26
         Text            =   "32000"
         Top             =   1920
         Width           =   555
      End
      Begin VB.PictureBox Picture1 
         Height          =   1155
         Index           =   0
         Left            =   180
         Picture         =   "NeoMutprob.frx":167C
         ScaleHeight     =   1095
         ScaleWidth      =   2235
         TabIndex        =   24
         Top             =   420
         Width           =   2295
      End
      Begin VB.Label Label4 
         Caption         =   "Standard Deviation: "
         Height          =   255
         Index           =   0
         Left            =   300
         TabIndex        =   37
         Top             =   2340
         Width           =   1515
      End
      Begin VB.Label Label1 
         Caption         =   "Mean"
         Height          =   255
         Index           =   3
         Left            =   1080
         TabIndex        =   31
         Top             =   1620
         Width           =   435
      End
      Begin VB.Label Label1 
         Caption         =   "Lower"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   30
         Top             =   1620
         Width           =   435
      End
      Begin VB.Label Label1 
         Caption         =   "Upper"
         Height          =   255
         Index           =   2
         Left            =   1800
         TabIndex        =   29
         Top             =   1620
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "Ints"
         Height          =   195
         Index           =   6
         Left            =   2340
         TabIndex        =   25
         Top             =   1980
         Visible         =   0   'False
         Width           =   315
      End
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   495
      Left            =   5160
      TabIndex        =   8
      Top             =   5040
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   873
      _Version        =   393216
      Max             =   100
      TickFrequency   =   5
   End
   Begin VB.Frame Frame2 
      Caption         =   "Mutation Types"
      Height          =   5055
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   3135
      Begin VB.OptionButton TypeOption 
         Caption         =   "Copy Error 2"
         Height          =   495
         Index           =   10
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   4320
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Point 2"
         Height          =   495
         Index           =   9
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   3540
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Translocation"
         Height          =   495
         Index           =   8
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   3540
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Delta Mutation"
         Height          =   495
         Index           =   7
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   58
         Top             =   420
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Point"
         Height          =   495
         Index           =   0
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   56
         Top             =   420
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Minor Deletion"
         Height          =   495
         Index           =   1
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   55
         Top             =   1980
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Reversal"
         Height          =   495
         Index           =   2
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   54
         Top             =   1980
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Insertion"
         Height          =   495
         Index           =   3
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   53
         Top             =   1200
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Amplification"
         Height          =   495
         Index           =   4
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   52
         Top             =   2760
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Major Deletion"
         Height          =   495
         Index           =   5
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   51
         Top             =   2760
         Width           =   1215
      End
      Begin VB.OptionButton TypeOption 
         Caption         =   "Copy Error"
         Height          =   495
         Index           =   6
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   50
         Top             =   1200
         Width           =   1215
      End
   End
   Begin VB.Frame Sliders6 
      BorderStyle     =   0  'None
      Height          =   2715
      Left            =   7920
      TabIndex        =   0
      Top             =   5640
      Visible         =   0   'False
      Width           =   5415
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   1
         Left            =   1110
         TabIndex        =   2
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   2
         Left            =   1965
         TabIndex        =   3
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   3
         Left            =   2835
         TabIndex        =   4
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   4
         Left            =   3690
         TabIndex        =   5
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin MSComctlLib.Slider TypeProb 
         Height          =   2115
         Index           =   5
         Left            =   4560
         TabIndex        =   6
         Top             =   300
         Width           =   630
         _ExtentX        =   1111
         _ExtentY        =   3731
         _Version        =   393216
         Orientation     =   1
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   5
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   5
         Left            =   3816
         TabIndex        =   20
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   4
         Left            =   4680
         TabIndex        =   19
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   3
         Left            =   2952
         TabIndex        =   18
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   2
         Left            =   2088
         TabIndex        =   17
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   1
         Left            =   1224
         TabIndex        =   16
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label TypePerc 
         Caption         =   "100%"
         Height          =   195
         Index           =   0
         Left            =   360
         TabIndex        =   15
         Top             =   2400
         Width           =   435
      End
      Begin VB.Label Label2 
         Caption         =   "Flow"
         Height          =   195
         Index           =   5
         Left            =   4680
         TabIndex        =   14
         Top             =   60
         Width           =   435
      End
      Begin VB.Label Label2 
         Caption         =   "Comparison"
         Height          =   195
         Index           =   4
         Left            =   3600
         TabIndex        =   13
         Top             =   60
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Logic"
         Height          =   195
         Index           =   3
         Left            =   2940
         TabIndex        =   12
         Top             =   60
         Width           =   435
      End
      Begin VB.Label Label2 
         Caption         =   "Operator"
         Height          =   195
         Index           =   2
         Left            =   1920
         TabIndex        =   11
         Top             =   60
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "*Number"
         Height          =   195
         Index           =   1
         Left            =   1080
         TabIndex        =   10
         Top             =   60
         Width           =   675
      End
      Begin VB.Label Label2 
         Caption         =   "Number"
         Height          =   195
         Index           =   0
         Left            =   240
         TabIndex        =   9
         Top             =   60
         Width           =   615
      End
   End
   Begin VB.Label Label5 
      Caption         =   "Mutation Sumations:"
      Height          =   255
      Left            =   660
      TabIndex        =   63
      Top             =   6240
      Width           =   1995
   End
   Begin VB.Label Label3 
      Caption         =   "1 chance in  XXXXXXX.  per bot"
      Height          =   255
      Index           =   2
      Left            =   420
      TabIndex        =   62
      Top             =   7050
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "1 chance in  XXXXXXX.  per bp"
      Height          =   255
      Index           =   1
      Left            =   420
      TabIndex        =   61
      Top             =   6630
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "1 chance in  XXXXXXX per XXXXXXXX"
      Height          =   255
      Index           =   0
      Left            =   5700
      TabIndex        =   34
      Top             =   1215
      Width           =   3435
   End
   Begin VB.Label Slider1Text 
      Caption         =   "Change value"
      Height          =   495
      Index           =   1
      Left            =   7560
      TabIndex        =   22
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label Slider1Text 
      Caption         =   "Change type"
      Height          =   495
      Index           =   0
      Left            =   3720
      TabIndex        =   21
      Top             =   5040
      Width           =   1275
   End
End
Attribute VB_Name = "MutationsProbability"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 6/12/2012 form's icon change
'Botsareus 12/10/2013 moved the order mean and stddev is stored to prevent a bug, implemented new mutation algos.

Dim Mode As Byte

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer) 'Botsareus 12/11/2013
If Not optionsform.CurrSpec = 50 Then
    'generate mrates file for robot
    Dim outpath As String
    Dim path As String
    path = TmpOpts.Specie(optionsform.CurrSpec).path & "\" & TmpOpts.Specie(optionsform.CurrSpec).Name
    outpath = TmpOpts.Specie(optionsform.CurrSpec).path & "\" & extractexactname(TmpOpts.Specie(optionsform.CurrSpec).Name) & ".mrate"
    outpath = Replace(outpath, "&#", MDIForm1.MainDir)
    'Botsareus 12/28/2013 Search robots folder only if path not found
    If dir(path) = "" Then outpath = MDIForm1.MainDir & "\Robots\" & extractexactname(TmpOpts.Specie(optionsform.CurrSpec).Name) & ".mrate"
    Save_mrates TmpOpts.Specie(optionsform.CurrSpec).Mutables, outpath
End If
End Sub

Private Sub Form_Load()
  TypeOption(1).value = True * True
  TypeOption(2).value = True * True
  TypeOption(3).value = True * True
  TypeOption(4).value = True * True
  TypeOption(5).value = True * True
  TypeOption(6).value = True * True
  TypeOption(7).value = True * True
  TypeOption(8).value = True * True
  TypeOption(9).value = True * True
  TypeOption(10).value = True * True
  TypeOption(0).value = True * True
  'Botsareus 12/11/2013 Make new mutations optional
  TypeOption(4).Visible = sunbelt
  TypeOption(8).Visible = sunbelt
  TypeOption(9).Visible = sunbelt
  TypeOption(10).Visible = sunbelt
  
  'no real distinction between minor deletion and major deletion
  If Delta2 Then
    TypeOption(1).Caption = """Minor"" Deletion"
    TypeOption(5).Caption = """Major"" Deletion"
    TypeOption(7).Visible = False
  End If
  
  
'  If (TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mutations = True) Then
'    EnableAllCheck.value = 1
'  End If
End Sub

Private Sub Command1_Click(Index As Integer)
  If Index = 1 Then
    Unload Me
  Else
    SetDefaultMutationRates TmpOpts.Specie(optionsform.CurrSpec).Mutables
    With TmpOpts.Specie(optionsform.CurrSpec).Mutables
    
    Dim Pnone As Single, Psome As Single
    
    Pnone = Anti_Prob(.mutarray(1)) * _
            Anti_Prob(.mutarray(2)) * _
            Anti_Prob(.mutarray(3)) * _
            Anti_Prob(.mutarray(5)) * _
            Anti_Prob(.mutarray(6)) * _
            Anti_Prob(.mutarray(7)) * _
            Anti_Prob(.mutarray(8)) * _
            Anti_Prob(.mutarray(9)) * _
            Anti_Prob(.mutarray(10))
    Psome = 1 - Pnone
          
          
    Probs(1).text = CStr(CLng(1 / Psome))
    End With
  End If
End Sub

'Private Sub EnableAllCheck_Click()
'  If (EnableAllCheck.value = 0) Then
'    EnableAllCheck.Caption = "All Disabled"
'  Else
'    EnableAllCheck.Caption = "All Enabled"
'  End If
'
'  TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mutations = (EnableAllCheck.value * True)
'End Sub

Private Sub Lower_LostFocus(Index As Integer)
  Mean(Index).text = (val(Lower(Index).text) + val(Upper(Index).text)) / 2
  RevalueStdDev Index
End Sub

Private Sub Upper_LostFocus(Index As Integer)
  Mean(Index).text = (val(Lower(Index).text) + val(Upper(Index).text)) / 2
  RevalueStdDev Index
End Sub

Private Sub Mean_Change(Index As Integer)
  TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode) = val(Mean(Index).text)
  If val(Mean(Index).text) <> val(Lower(Index).text) / 2 + val(Upper(Index).text) / 2 Then
    Dim temp As Single
    temp = (-val(Lower(Index).text) + val(Upper(Index).text)) / 2
    Lower(Index).text = val(Mean(Index).text) - temp
    Upper(Index).text = val(Mean(Index).text) + temp
    
    Upper_LostFocus Index
    Lower_LostFocus Index
  End If
End Sub

Private Sub StdDev_Change(Index As Integer)
  'new upper and lower = mean +- 2 * stddev.text
  Lower(Index).text = val(Mean(Index).text) - val(StdDev(Index).text) * 2
  Upper(Index).text = val(Mean(Index).text) + val(StdDev(Index).text) * 2
  TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode) = val(StdDev(Index).text)
End Sub

Private Sub RevalueStdDev(Index As Integer)
  StdDev(Index).text = (val(Upper(Index).text) - val(Lower(Index).text)) / 4
End Sub

Private Sub Slider1_LostFocus()
  Select Case Mode
    Case 0 'point
      TmpOpts.Specie(optionsform.CurrSpec).Mutables.PointWhatToChange = Slider1.value
    Case CopyErrorUP
      TmpOpts.Specie(optionsform.CurrSpec).Mutables.CopyErrorWhatToChange = Slider1.value
  End Select
End Sub

Private Sub MutTypeEnabled_Click()
  Dim sign As Integer
  
  sign = Sgn(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
  If MutTypeEnabled.value <> (sign + 1) / 2 Then
    sign = -sign
    TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode) = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode)) * sign
  End If
  
  MutTypeEnabled.Caption = IIf(sign = 1, "Enabled", "Disabled")
  
End Sub

Private Sub Probs_Change(Index As Integer)
  If Index = 0 Then
    
    If TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode) = 0 Then
        TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode) = 1
    End If
    
    TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode) = val(Probs(Index)) * _
      Sgn(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
      
    'update summations...
    
    With TmpOpts.Specie(optionsform.CurrSpec).Mutables
    
    Dim Pnone As Single, Psome As Single
    
    Pnone = Anti_Prob(.mutarray(1)) * _
            Anti_Prob(.mutarray(2)) * _
            Anti_Prob(.mutarray(3)) * _
            Anti_Prob(.mutarray(5)) * _
            Anti_Prob(.mutarray(6)) * _
            Anti_Prob(.mutarray(7)) * _
            Anti_Prob(.mutarray(8)) * _
            Anti_Prob(.mutarray(9)) * _
            Anti_Prob(.mutarray(10))
    Psome = 1 - Pnone
          
    If Psome = 0 Then
      Probs(1).text = "Inf"
    Else
      Probs(1).text = CStr(CLng(1 / Psome))
    End If
    End With
  End If
End Sub

Private Function Anti_Prob(ByVal a As Single) As Single
  If a <= 0 Then
    Anti_Prob = 1
  Else
    Anti_Prob = 1 - 1 / a
  End If
End Function

Private Sub TypeOption_Click(Index As Integer)
  Dim value As Long
  Dim sign As Integer
  
   
  Mode = Index
  value = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  sign = Sgn(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  Probs(0).text = value
  MutTypeEnabled.value = (sign + 1) / 2
  MutTypeEnabled.Caption = IIf(sign = 1, "Enabled", "Disabled")
  
  Select Case Index
    Case 0 'point mutation
      SetupPoint
    Case 1 'minor deletion
      SetupMinorDeletion
    Case 2 'reversal
      SetupReversal
    Case 3 'insertion
      SetupInsertion
    Case 4 'amplification
      SetupAmplify
    Case 5 'major deletion
      SetupMajorDeletion
    Case 6 'copy error
      SetupCopyError
    Case 7 'change in mutation rates
      SetupDelta
    Case 8 'movement of a segment
      SetupIntraCT
    Case 9
      SetupP2
    Case 10
      SetupCE2
  End Select
End Sub

Private Sub SetupPoint()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = True
  Slider1Text(0).Visible = True
  Slider1Text(1).Visible = True
  Sliders6.Visible = False
  
  Text2.text = "A small scale mutation that causes a small series of commands " + _
    "to change.  It may occur at any time in a " + _
    "bots life.  Represents environmental mutations such as UV light or " + _
    "an error in DNA maintenance.  Length should be kept relatively small " + _
    "to mirror real life (~1 bp).  Unlike other mutations, point mutation " + _
    "chances are given as 1 in X per bp per kilocycles, so they occur quite " + _
    "independantly of reproduction rate.  To find the liklihood " + _
    "of at least one mutation over any length of time: 1/(1 - (1-1/X)^(how many cycles)) " + _
    "= Y, as in 1 chance in Y per that many cycles.  Finding the probable number " + _
    "of mutations in that range is more difficult.  (Lookup Negative Binomial Distribution)."
    
  'now set appropriate values for the distributions
  Slider1Text(0).Caption = "Change Type"
  Slider1Text(1).Caption = "Change Value"
  Slider1.value = TmpOpts.Specie(optionsform.CurrSpec).Mutables.PointWhatToChange
  
  CustGauss(0).Caption = "Length"
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(PointUP)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(PointUP)
  
  Label3(0).Caption = "1 chance in  XXXXXXX 000 per bp per cycle"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
End Sub

Private Sub SetupP2()
  CustGauss(0).Visible = False
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Sliders6.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False

  Text2.text = "Note: The length of this mutation is always 1, but the rate is multiplied by the Gaussen Length of Point Mutation." + vbCrLf + _
  "Similar to point mutations, but always changes to an existing sysvar, *sysvar, or special values if followed by .shoot store or .focuseye store." + _
  "The algorithm is also designed to introduce more stores." + _
  " Should allow for evolving a zero-bot the same as a random-bot."
    
  Label3(0).Caption = "1 chance in  XXXXXXX 000 per bp per cycle"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
End Sub

Private Sub SetupCE2()
  CustGauss(0).Visible = False
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Sliders6.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False

  Text2.text = "Similar to copy error, but always changes to an existing sysvar, *sysvar, or special values if followed by .shoot store or .focuseye store."
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
End Sub

Private Sub SetupCopyError()
  CustGauss(0).Visible = True
  CustGauss(0).Caption = "Length"
  CustGauss(1).Visible = False
  Slider1.Visible = True
  Slider1Text(0).Visible = True
  Slider1Text(1).Visible = True
  Sliders6.Visible = False
  
  Slider1Text(0).Caption = "Change Type"
  Slider1Text(1).Caption = "Change Value"
  Slider1.value = TmpOpts.Specie(optionsform.CurrSpec).Mutables.CopyErrorWhatToChange
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Text2.text = "Similar to point mutations, but these occur during DNA replication " + _
    "for reproduction or viruses.  A small series (usually 1 bp) is changed in either parent " + _
    "or child."
    
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
  CustGauss(0).Caption = "Length"
End Sub

Private Sub SetupAmplify()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Text2.text = "A series of bp are replicated and inserted in another place in the " + _
    "genome."
  
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
  CustGauss(0).Caption = "Length"
End Sub

Private Sub SetupMajorDeletion()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
  Text2.text = "A relatively long series of bp are deleted from the genome.  " + _
    "This can be quite disasterous, so set probabilities wisely."
  
  CustGauss(0).Caption = "Length"
End Sub

Private Sub SetupMinorDeletion()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  Text2.text = "A small series of bp are deleted from the genome."
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
  
  CustGauss(0).Caption = "Length"
End Sub

Private Sub SetupInsertion()
  CustGauss(0).Visible = True
  CustGauss(0).Caption = "Length"
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  'Sliders6.Visible = True
  Sliders6.Visible = False
  
  Text2.text = "A run of random bp are inserted into the genome.  " + _
    "The size of this run should be fairly small."
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  CustGauss(0).Caption = "Length"
  
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  Probs(0).text = Abs(TmpOpts.Specie(optionsform.CurrSpec).Mutables.mutarray(Mode))
End Sub

Private Sub SetupReversal()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  CustGauss(0).Caption = "Length of Reversal"
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
  
  Text2.text = "A series of bp are reversed in the genome.  " + _
    "For example, '2 3 > or' becomes 'or > 3 2'.  Length of " + _
    "reversal should be >= 2."
    
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
End Sub

Private Sub SetupDelta()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  CustGauss(0).Caption = "Standard Deviation"
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Text2.text = "The mutation rates of a bot are allowed to change " + _
    "slowly over time.  This change in mutation rates can include " + _
    "Delta Mutations as well.  Theoretically, it may be possible for " + _
    "a bot to figure out its own optimal mutation rate."
    
  Label3(0).Caption = "1 chance in  XXXXXXX 00 per cycle"
End Sub

Private Sub SetupIntraCT()
  CustGauss(0).Visible = True
  CustGauss(1).Visible = False
  Slider1.Visible = False
  Slider1Text(0).Visible = False
  Slider1Text(1).Visible = False
  Sliders6.Visible = False
  
  Text2.text = "Tranlocation moves a segment of DNA from one location " + _
    "to another in the genome."
    
  CustGauss(0).Caption = "Length"
  
  StdDev(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.StdDev(Mode)
  Mean(0).text = TmpOpts.Specie(optionsform.CurrSpec).Mutables.Mean(Mode)
  
  Label3(0).Caption = "1 chance in  XXXXXXX per bp per copy"
End Sub
