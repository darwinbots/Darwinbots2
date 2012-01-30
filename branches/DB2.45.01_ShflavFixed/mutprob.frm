VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form mutprob 
   Caption         =   "Mutation control panel"
   ClientHeight    =   9030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9450
   Icon            =   "mutprob.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   9030
   ScaleWidth      =   9450
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text23 
      Enabled         =   0   'False
      Height          =   315
      Left            =   8160
      TabIndex        =   66
      Text            =   "5000"
      Top             =   7260
      Width           =   915
   End
   Begin VB.TextBox Text22 
      Height          =   315
      Left            =   6180
      TabIndex        =   64
      Text            =   "200"
      Top             =   6900
      Width           =   795
   End
   Begin VB.TextBox Text21 
      Enabled         =   0   'False
      Height          =   285
      Left            =   8220
      TabIndex        =   62
      Text            =   "5000"
      Top             =   6540
      Width           =   885
   End
   Begin VB.Frame Frame8 
      Caption         =   "Duplicate Existing Values"
      Height          =   2475
      Left            =   4800
      TabIndex        =   51
      Top             =   3180
      Width           =   4575
      Begin VB.TextBox Text20 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3360
         TabIndex        =   60
         Text            =   "5000"
         Top             =   360
         Width           =   855
      End
      Begin VB.Frame Frame9 
         Caption         =   "Finer Controls"
         Height          =   1515
         Left            =   120
         TabIndex        =   52
         Top             =   840
         Width           =   4275
         Begin VB.TextBox Text8 
            Height          =   285
            Left            =   3255
            TabIndex        =   55
            Text            =   "5000"
            Top             =   1035
            Width           =   885
         End
         Begin VB.TextBox Text6 
            Height          =   285
            Left            =   3255
            TabIndex        =   54
            Text            =   "5000"
            Top             =   675
            Width           =   885
         End
         Begin VB.TextBox Text11 
            Height          =   285
            Left            =   3255
            TabIndex        =   53
            Text            =   "5000"
            Top             =   300
            Width           =   885
         End
         Begin VB.Label Label8 
            Caption         =   "Duplicate a condition:            1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   58
            Tag             =   "10011"
            Top             =   1065
            Width           =   2985
         End
         Begin VB.Label Label6 
            Caption         =   "Duplicate entire gene:            1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   57
            Tag             =   "10006"
            Top             =   720
            Width           =   2985
         End
         Begin VB.Label Label11 
            Caption         =   "Duplicate instruction:              1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   56
            Tag             =   "10005"
            Top             =   360
            Width           =   2985
         End
      End
      Begin VB.Label Label16 
         Caption         =   "Duplicate Existing Values:         1 chance in"
         Height          =   255
         Left            =   180
         TabIndex        =   59
         Top             =   420
         Width           =   3135
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Insert New Values"
      Height          =   2475
      Left            =   60
      TabIndex        =   41
      Top             =   3180
      Width           =   4575
      Begin VB.TextBox Text19 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3390
         TabIndex        =   50
         Text            =   "5000"
         Top             =   360
         Width           =   885
      End
      Begin VB.Frame Frame7 
         Caption         =   "Finer Controls"
         Height          =   1515
         Left            =   120
         TabIndex        =   42
         Top             =   840
         Width           =   4275
         Begin VB.TextBox Text9 
            Height          =   285
            Left            =   3285
            TabIndex        =   45
            Text            =   "5000"
            Top             =   330
            Width           =   840
         End
         Begin VB.TextBox Text14 
            Height          =   285
            Left            =   3285
            TabIndex        =   44
            Text            =   "5000"
            Top             =   705
            Width           =   840
         End
         Begin VB.TextBox Text16 
            Height          =   285
            Left            =   3285
            TabIndex        =   43
            Text            =   "5000"
            Top             =   1080
            Width           =   825
         End
         Begin VB.Label Label9 
            Caption         =   "Insert a condition:                   1 chance in"
            Height          =   255
            Left            =   240
            TabIndex        =   48
            Tag             =   "10009"
            Top             =   375
            Width           =   3015
         End
         Begin VB.Label Label18 
            Caption         =   "Insert a new instruction:         1 chance in"
            Height          =   255
            Left            =   240
            TabIndex        =   47
            Top             =   750
            Width           =   3015
         End
         Begin VB.Label Label23 
            Caption         =   "Insert a new value                 1 chance in"
            Height          =   255
            Left            =   240
            TabIndex        =   46
            Top             =   1140
            Width           =   3015
         End
      End
      Begin VB.Label Label14 
         Caption         =   "Insert new valies:                     1 chance in"
         Height          =   255
         Left            =   240
         TabIndex        =   49
         Top             =   420
         Width           =   3075
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Delete Existing Values"
      Height          =   2835
      Left            =   4800
      TabIndex        =   28
      Top             =   180
      Width           =   4575
      Begin VB.TextBox Text18 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3420
         TabIndex        =   40
         Text            =   "5000"
         Top             =   420
         Width           =   855
      End
      Begin VB.Frame Frame5 
         Caption         =   "Finer Controls"
         Height          =   1815
         Left            =   180
         TabIndex        =   30
         Top             =   900
         Width           =   4215
         Begin VB.TextBox Text10 
            Height          =   285
            Left            =   3240
            TabIndex        =   33
            Text            =   "5000"
            Top             =   690
            Width           =   825
         End
         Begin VB.TextBox Text7 
            Height          =   285
            Left            =   3240
            TabIndex        =   32
            Text            =   "5000"
            Top             =   330
            Width           =   825
         End
         Begin VB.TextBox Text15 
            Height          =   285
            Left            =   3240
            TabIndex        =   31
            Text            =   "5000"
            Top             =   1050
            Width           =   825
         End
         Begin VB.Label Label10 
            Caption         =   "Delete a condition:                 1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   36
            Tag             =   "10010"
            Top             =   720
            Width           =   2985
         End
         Begin VB.Label Label7 
            Caption         =   "Delete an entire gene:            1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   35
            Tag             =   "10007"
            Top             =   360
            Width           =   3000
         End
         Begin VB.Label Label17 
            Caption         =   "Delete a data point:               1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   34
            Top             =   1080
            Width           =   3015
         End
      End
      Begin VB.Label Label13 
         Caption         =   "Delete existing values:             1 chance in"
         Height          =   255
         Index           =   1
         Left            =   300
         TabIndex        =   29
         Top             =   420
         Width           =   3015
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Change Existing Values"
      Height          =   2835
      Index           =   0
      Left            =   60
      TabIndex        =   16
      Top             =   180
      Width           =   4575
      Begin VB.TextBox Text17 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3360
         TabIndex        =   27
         Text            =   "5000"
         Top             =   360
         Width           =   915
      End
      Begin VB.Frame Frame3 
         Caption         =   "Finer Controls"
         Height          =   1875
         Left            =   120
         TabIndex        =   17
         Top             =   840
         Width           =   4275
         Begin VB.TextBox Text5 
            Height          =   285
            Left            =   3225
            TabIndex        =   21
            Text            =   "5000"
            Top             =   1050
            Width           =   885
         End
         Begin VB.TextBox Text2 
            Height          =   285
            Left            =   3225
            TabIndex        =   20
            Text            =   "5000"
            Top             =   1410
            Width           =   885
         End
         Begin VB.TextBox Text3 
            Height          =   285
            Left            =   3225
            TabIndex        =   19
            Text            =   "5000"
            Top             =   360
            Width           =   900
         End
         Begin VB.TextBox Text4 
            Height          =   285
            Left            =   3225
            TabIndex        =   18
            Text            =   "5000"
            Top             =   690
            Width           =   885
         End
         Begin VB.Label Label5 
            Caption         =   "Change a condition:               1 chance in"
            Height          =   255
            Left            =   195
            TabIndex        =   25
            Tag             =   "10008"
            Top             =   1065
            Width           =   2985
         End
         Begin VB.Label Label2 
            Caption         =   "Change variable with variable:1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   24
            Tag             =   "10012"
            Top             =   1425
            Width           =   3015
         End
         Begin VB.Label Label3 
            Caption         =   "Change a Value:                     1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   23
            Tag             =   "10003"
            Top             =   360
            Width           =   2985
            WordWrap        =   -1  'True
         End
         Begin VB.Label Label4 
            Caption         =   "Change an instruction:            1 chance in"
            Height          =   255
            Left            =   180
            TabIndex        =   22
            Tag             =   "10004"
            Top             =   705
            Width           =   2985
         End
      End
      Begin VB.Label Label13 
         Caption         =   "Change existing values:           1 chance in"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   26
         Top             =   420
         Width           =   3015
      End
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   8220
      TabIndex        =   15
      Text            =   "5000"
      Top             =   5715
      Width           =   885
   End
   Begin VB.Frame Frame1 
      Height          =   1335
      Left            =   360
      TabIndex        =   10
      Top             =   7620
      Width           =   8115
      Begin VB.CheckBox Check1 
         Caption         =   "Control Global Mutation Rates"
         Enabled         =   0   'False
         Height          =   195
         Left            =   660
         TabIndex        =   67
         Top             =   960
         Width           =   2655
      End
      Begin VB.TextBox Text13 
         Height          =   330
         Left            =   660
         TabIndex        =   38
         Text            =   "1"
         Top             =   450
         Width           =   630
      End
      Begin VB.CommandButton Multnow 
         Caption         =   "Multiply now"
         Height          =   495
         Left            =   2100
         TabIndex        =   37
         Top             =   255
         Width           =   1695
      End
      Begin VB.CommandButton disableall 
         Caption         =   "Set all to 1"
         Height          =   405
         Index           =   1
         Left            =   6120
         TabIndex        =   14
         Tag             =   "10100"
         Top             =   180
         Width           =   1695
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   6000
         TabIndex        =   13
         Tag             =   "2033"
         Top             =   900
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Ok"
         Height          =   375
         Left            =   4560
         TabIndex        =   12
         Top             =   900
         Width           =   1215
      End
      Begin VB.CommandButton disableall 
         Caption         =   "Toggle Mutations"
         Height          =   405
         Index           =   0
         Left            =   4320
         TabIndex        =   11
         Tag             =   "10100"
         Top             =   180
         Width           =   1695
      End
      Begin VB.Label Label15 
         Caption         =   "Mutations Enabled"
         Height          =   195
         Left            =   4380
         TabIndex        =   68
         Top             =   630
         Width           =   1635
      End
      Begin VB.Label MultLab 
         Caption         =   "Multiply frequencies by:"
         Height          =   240
         Left            =   180
         TabIndex        =   39
         Tag             =   "10110"
         Top             =   180
         Width           =   1695
      End
   End
   Begin MSComctlLib.Slider Slider3 
      Height          =   135
      Left            =   120
      TabIndex        =   5
      Top             =   6840
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   238
      _Version        =   393216
      Min             =   1
      Max             =   98
      SelStart        =   33
      Value           =   33
   End
   Begin MSComctlLib.Slider Slider2 
      Height          =   135
      Left            =   120
      TabIndex        =   4
      Top             =   6600
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   238
      _Version        =   393216
      Min             =   1
      Max             =   98
      SelStart        =   33
      Value           =   33
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   135
      Left            =   120
      TabIndex        =   3
      Top             =   6360
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   238
      _Version        =   393216
      Min             =   1
      Max             =   98
      SelStart        =   34
      Value           =   34
   End
   Begin VB.TextBox Text12 
      Height          =   285
      Left            =   3540
      TabIndex        =   0
      Text            =   "5000"
      Top             =   7185
      Width           =   885
   End
   Begin VB.Label Label1 
      Caption         =   "Chance per reproduction:              1 chance in"
      Height          =   285
      Index           =   3
      Left            =   4800
      TabIndex        =   65
      Tag             =   "10002"
      Top             =   7320
      Width           =   3375
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      Caption         =   "Genome Length: "
      Height          =   285
      Index           =   2
      Left            =   4800
      TabIndex        =   63
      Tag             =   "10002"
      Top             =   6960
      Width           =   1275
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      Caption         =   "Change per DNA unit:                   1 chance in"
      Height          =   285
      Index           =   1
      Left            =   4800
      TabIndex        =   61
      Tag             =   "10002"
      Top             =   6540
      Width           =   3315
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label22 
      Caption         =   "number"
      Height          =   255
      Left            =   2160
      TabIndex        =   9
      Top             =   6780
      Width           =   975
   End
   Begin VB.Label Label21 
      Caption         =   "*.number"
      Height          =   255
      Left            =   2160
      TabIndex        =   8
      Top             =   6540
      Width           =   855
   End
   Begin VB.Label Label20 
      Caption         =   "*.sysvar "
      Height          =   255
      Left            =   2160
      TabIndex        =   7
      Top             =   6300
      Width           =   855
   End
   Begin VB.Label Label19 
      Caption         =   "Prefered type of entry for inserted conditions and instructions"
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   5700
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Rate of change of mutation rates: 1 chance in"
      Height          =   285
      Index           =   0
      Left            =   4800
      TabIndex        =   2
      Tag             =   "10002"
      Top             =   5730
      Width           =   3315
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label12 
      Caption         =   "Introduce a new variable:             1 chance in"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Tag             =   "10013"
      Top             =   7200
      Width           =   3315
   End
End
Attribute VB_Name = "mutprob"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mutarray(20) As Long
Dim Slide1old As Integer
Dim Slide2old As Integer
Dim Slide3old As Integer
Public mut As Boolean
Public Mutations As Boolean

Private Sub Command1_Click()
  If Text1.text > 2000000000# Then Text1.text = 2000000000#
  If Text2.text > 2000000000# Then Text2.text = 2000000000#
  If Text3.text > 2000000000# Then Text3.text = 2000000000#
  If Text4.text > 2000000000# Then Text4.text = 2000000000#
  If Text5.text > 2000000000# Then Text5.text = 2000000000#
  If Text6.text > 2000000000# Then Text6.text = 2000000000#
  If Text7.text > 2000000000# Then Text7.text = 2000000000#
  If Text8.text > 2000000000# Then Text8.text = 2000000000#
  If Text9.text > 2000000000# Then Text9.text = 2000000000#
  If Text10.text > 2000000000# Then Text10.text = 2000000000#
  If Text11.text > 2000000000# Then Text11.text = 2000000000#
  If Text12.text > 2000000000# Then Text12.text = 2000000000#
  If Text14.text > 2000000000# Then Text14.text = 2000000000#
  If Text15.text > 2000000000# Then Text15.text = 2000000000#
  If Text16.text > 2000000000# Then Text16.text = 2000000000#
  
  If Text1.text < 0 Then Text1.text = 0
  If Text2.text < 0 Then Text2.text = 0
  If Text3.text < 0 Then Text3.text = 0
  If Text4.text < 0 Then Text4.text = 0
  If Text5.text < 0 Then Text5.text = 0
  If Text6.text < 0 Then Text6.text = 0
  If Text7.text < 0 Then Text7.text = 0
  If Text8.text < 0 Then Text8.text = 0
  If Text9.text < 0 Then Text9.text = 0
  If Text10.text < 0 Then Text10.text = 0
  If Text11.text < 0 Then Text11.text = 0
  If Text12.text < 0 Then Text12.text = 0
  If Text14.text < 0 Then Text14.text = 0
  If Text15.text < 0 Then Text15.text = 0
  If Text16.text < 0 Then Text16.text = 0
    
  mutarray(0) = val(Text1.text)
  mutarray(1) = val(Text2.text)
  mutarray(2) = val(Text3.text)
  mutarray(3) = val(Text4.text)
  mutarray(4) = val(Text5.text)
  mutarray(5) = val(Text6.text)
  mutarray(6) = val(Text7.text)
  mutarray(7) = val(Text8.text)
  mutarray(8) = val(Text9.text)
  mutarray(9) = val(Text10.text)
  mutarray(10) = val(Text11.text)
  mutarray(11) = val(Text12.text)
  mutarray(12) = val(Text14.text)
  mutarray(13) = val(Text15.text)
  mutarray(14) = val(Text16.text)
  
  Me.Hide
End Sub

Private Sub Command2_Click()
  Me.Hide
End Sub

Private Sub disableall_Click(index As Integer)
  If index = 0 Then
    mutprob.mut = Not mutprob.mut
    DispMut
  Else
    Text1.text = 1
    Text2.text = 1
    Text3.text = 1
    Text4.text = 1
    Text5.text = 1
    Text6.text = 1
    Text7.text = 1
    Text8.text = 1
    Text9.text = 1
    Text10.text = 1
    Text11.text = 1
    Text12.text = 1
    Text14.text = 1
    Text15.text = 1
    Text16.text = 1
  End If
End Sub

Private Sub DispMut()
  Label15.Caption = "Mutations "
  If mutprob.mut = False Then
    Label15.Caption = Label15.Caption + "Disabled"
  Else
    Label15.Caption = Label15.Caption + "Enabled"
  End If
End Sub

Public Sub Disp()
  
End Sub

Sub uload(ByVal i As Integer, ByVal v As Long)
  mutarray(i) = v
End Sub

Function dload(i As Integer) As Long
  dload = mutarray(i)
End Function

Private Sub Form_Activate()
  Slide1old = Slider1.value
  Slide2old = Slider2.value
  Slide3old = Slider3.value
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  
  Text1.text = mutarray(0)
  Text2.text = mutarray(1)
  Text3.text = mutarray(2)
  Text4.text = mutarray(3)
  Text5.text = mutarray(4)
  Text6.text = (mutarray(5))
  Text7.text = (mutarray(6))
  Text8.text = (mutarray(7))
  Text9.text = (mutarray(8))
  Text10.text = (mutarray(9))
  Text11.text = (mutarray(10))
  Text12.text = (mutarray(11))
  Text14.text = (mutarray(12))
  Text15.text = (mutarray(13))
  Text16.text = (mutarray(14))
  
  If mut Then
    mut = False
    disableall_Click (0)
  End If
  DispMut
End Sub

Private Sub Multnow_click()
  Text1.text = Int((val(Text1.text) * val(Text13.text)))
  Text2.text = Int((val(Text2.text) * val(Text13.text)))
  Text3.text = Int(val(Text3.text) * val(Text13.text))
  Text4.text = Int(val(Text4.text) * val(Text13.text))
  Text5.text = Int(val(Text5.text) * val(Text13.text))
  Text6.text = Int(val(Text6.text) * val(Text13.text))
  Text7.text = Int(val(Text7.text) * val(Text13.text))
  Text8.text = Int(val(Text8.text) * val(Text13.text))
  Text9.text = Int(val(Text9.text) * val(Text13.text))
  Text10.text = Int(val(Text10.text) * val(Text13.text))
  Text11.text = Int(val(Text11.text) * val(Text13.text))
  Text12.text = Int(val(Text12.text) * val(Text13.text))
  Text14.text = Int(val(Text14.text) * val(Text13.text))
  Text15.text = Int(val(Text15.text) * val(Text13.text))
  Text16.text = Int(val(Text16.text) * val(Text13.text))
End Sub

Private Sub Slider1_click()
  Dim Change As Integer
  Dim newS2 As Integer
  Dim newS3 As Integer
  Dim missed As Integer
  If Slider1 = Slide1old Then Exit Sub
  Change = Slider1.value - Slide1old
  newS2 = Slide2old - Change / 2
  newS3 = Slide3old - Change / 2
  missed = Slider1.value + newS2 + newS3
  If missed <> 99 Then
    newS2 = newS2 + (99 - missed)
  End If
  Slider2.value = newS2
  Slider3.value = newS3
  Slide1old = Slider1.value
  Slide2old = Slider2.value
  Slide3old = Slider3.value
End Sub

Private Sub Slider2_click()
  Dim Change As Integer
  Dim newS1 As Integer
  Dim newS2 As Integer
  Dim newS3 As Integer
  Dim missed As Integer
  If Slider2 = Slide2old Then Exit Sub
  Change = Slider2.value - Slide2old
  newS2 = Slide1old - Change / 2
  newS3 = Slide3old - Change / 2
  missed = Slider2.value + newS1 + newS3
  If missed <> 99 Then
    newS1 = newS1 + (99 - missed)
  End If
  Slider1.value = newS1
  Slider3.value = newS3
  Slide1old = Slider1.value
  Slide2old = Slider2.value
  Slide3old = Slider3.value
End Sub

Private Sub Slider3_click()
Dim Change As Integer
  Dim newS2 As Integer
  Dim newS1 As Integer
  Dim missed As Integer
  If Slider3 = Slide3old Then Exit Sub
  Change = Slider3.value - Slide3old
  newS2 = Slide2old - Change / 2
  newS1 = Slide1old - Change / 2
  missed = Slider3.value + newS2 + newS1
  If missed <> 99 Then
    newS2 = newS2 + (99 - missed)
  End If
  Slider2.value = newS2
  Slider1.value = newS1
  Slide1old = Slider1.value
  Slide2old = Slider2.value
  Slide3old = Slider3.value
End Sub

Private Sub Text13_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then
    Multnow_click
  End If
End Sub

Private Function LAND(ByVal a As Single, ByVal b As Single) As Single
  LAND = a * b
End Function

Private Function LOR(ByVal a As Single, ByVal b As Single) As Single
  LOR = a + b - LAND(a, b)
End Function

Private Function ProbPerUnit(Delete As Single, Insert As Single, Change As Single, Duplicate As Single) As Single
  ProbPerUnit = LOR(LOR(Delete, Insert), LOR(Change, Duplicate))
End Function

Private Function ProbPerBot(PerUnit As Single, GenomeLength As Single) As Single
  Dim i As Long
  Dim NotPerUnit As Long
  
  NotPerUnit = 1 - PerUnit
    
  ProbPerBot = 0
   
  For i = 1 To GenomeLength
    ProbPerBot = LOR(PerUnit, ProbPerBot)
  Next i
  
End Function

Private Sub Text21_Change()
  Text22_Change
End Sub

Private Sub Text22_Change()
  On Error Resume Next
  Text23.text = val(1 / ProbPerBot(1 / val(Text21.text), val(Text22.text)))
End Sub

Private Sub Text17_Change()
  On Error Resume Next
  Text21.text = 1 / LOR(LOR(1 / Text17.text, 1 / Text18.text), LOR(1 / Text19.text, 1 / Text20.text))
  Text21.text = Int(val(Text21.text))
End Sub

Private Sub Text18_Change()
  On Error Resume Next
  Text21.text = 1 / LOR(LOR(1 / Text17.text, 1 / Text18.text), LOR(1 / Text19.text, 1 / Text20.text))
  Text21.text = Int(val(Text21.text))
End Sub

Private Sub Text19_Change()
  On Error Resume Next
  Text21.text = 1 / LOR(LOR(1 / Text17.text, 1 / Text18.text), LOR(1 / Text19.text, 1 / Text20.text))
  Text21.text = Int(val(Text21.text))
End Sub

Private Sub Text20_Change()
  On Error Resume Next
  Text21.text = 1 / LOR(LOR(1 / Text17.text, 1 / Text18.text), LOR(1 / Text19.text, 1 / Text20.text))
  Text21.text = Int(val(Text21.text))
End Sub

Private Sub Text2_Change()
  On Error Resume Next
  Text17.text = 1 / LOR(LOR(1 / Text2.text, 1 / Text3.text), LOR(1 / Text4.text, 1 / Text5.text))
  Text17.text = Int(val(Text17.text))
End Sub

Private Sub Text3_Change()
  On Error Resume Next
  Text17.text = 1 / LOR(LOR(1 / Text2.text, 1 / Text3.text), LOR(1 / Text4.text, 1 / Text5.text))
  Text17.text = Int(val(Text17.text))
End Sub

Private Sub Text4_Change()
  On Error Resume Next
  Text17.text = 1 / LOR(LOR(1 / Text2.text, 1 / Text3.text), LOR(1 / Text4.text, 1 / Text5.text))
  Text17.text = Int(val(Text17.text))
End Sub

Private Sub Text5_Change()
  On Error Resume Next
  Text17.text = 1 / LOR(LOR(1 / Text2.text, 1 / Text3.text), LOR(1 / Text4.text, 1 / Text5.text))
  Text17.text = Int(val(Text17.text))
End Sub

Private Sub Text7_Change() '10, 15
  On Error Resume Next
  Text18.text = 1 / LOR(LOR(1 / Text7.text, 1 / Text10.text), 1 / Text15.text)
  Text18.text = Int(val(Text18.text))
End Sub

Private Sub Text10_Change() '10, 15
  On Error Resume Next
  Text18.text = 1 / LOR(LOR(1 / Text7.text, 1 / Text10.text), 1 / Text15.text)
  Text18.text = Int(val(Text18.text))
End Sub

Private Sub Text15_Change() '10, 15
  On Error Resume Next
  Text18.text = 1 / LOR(LOR(1 / Text7.text, 1 / Text10.text), 1 / Text15.text)
  Text18.text = Int(val(Text18.text))
End Sub

Private Sub Text9_Change() '10, 15
  On Error Resume Next
  Text19.text = 1 / LOR(LOR(1 / Text9.text, 1 / Text14.text), 1 / Text16.text)
  Text19.text = Int(val(Text19.text))
End Sub

Private Sub Text14_Change() '10, 15
  On Error Resume Next
  Text19.text = 1 / LOR(LOR(1 / Text9.text, 1 / Text14.text), 1 / Text16.text)
  Text19.text = Int(val(Text19.text))
End Sub

Private Sub Text16_Change() '10, 15
  On Error Resume Next
  Text19.text = 1 / LOR(LOR(1 / Text9.text, 1 / Text14.text), 1 / Text16.text)
  Text19.text = Int(val(Text19.text))
End Sub

Private Sub Text11_Change() '10, 15
  On Error Resume Next
  Text20.text = 1 / LOR(LOR(1 / Text11.text, 1 / Text6.text), 1 / Text8.text)
  Text20.text = Int(val(Text20.text))
End Sub

Private Sub Text6_Change() '10, 15
  On Error Resume Next
  Text20.text = 1 / LOR(LOR(1 / Text11.text, 1 / Text6.text), 1 / Text8.text)
  Text20.text = Int(val(Text20.text))
End Sub

Private Sub Text8_Change() '10, 15
  On Error Resume Next
  Text20.text = 1 / LOR(LOR(1 / Text11.text, 1 / Text6.text), 1 / Text8.text)
  Text20.text = Int(val(Text20.text))
End Sub


