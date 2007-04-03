VERSION 5.00
Begin VB.Form grafico 
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   Caption         =   "Form2"
   ClientHeight    =   3225
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7770
   Icon            =   "grafico.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   3225
   ScaleWidth      =   7770
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton UpdateNow 
      Caption         =   "Update Now"
      Height          =   375
      Left            =   6240
      TabIndex        =   12
      TabStop         =   0   'False
      ToolTipText     =   "Updates graph now without waiting for next update interval"
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Label YLab 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   5520
      TabIndex        =   11
      Top             =   2400
      Width           =   1455
   End
   Begin VB.Label XLabel 
      BackStyle       =   0  'Transparent
      Caption         =   "Cycles"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   360
      TabIndex        =   10
      Top             =   3000
      Width           =   4695
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0080FF80&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   9
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   2205
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   9
      Left            =   5805
      TabIndex        =   9
      Top             =   2205
      Visible         =   0   'False
      Width           =   1635
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF8080&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   8
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   1965
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00C0C0FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   7
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   1725
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00808000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   6
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   1485
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00E0E0E0&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   5
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   1245
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF00FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   4
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   1005
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   3
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   765
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   2
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   525
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   1
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   285
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00008000&
      FillStyle       =   0  'Solid
      Height          =   135
      Index           =   0
      Left            =   5565
      Shape           =   3  'Circle
      Top             =   45
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   8
      Left            =   5805
      TabIndex        =   8
      Top             =   1965
      Visible         =   0   'False
      Width           =   1590
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   7
      Left            =   5805
      TabIndex        =   7
      Top             =   1725
      Visible         =   0   'False
      Width           =   1650
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   6
      Left            =   5805
      TabIndex        =   6
      Top             =   1485
      Visible         =   0   'False
      Width           =   1545
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   5
      Left            =   5805
      TabIndex        =   5
      Top             =   1245
      Visible         =   0   'False
      Width           =   1650
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   4
      Left            =   5805
      TabIndex        =   4
      Top             =   1005
      Visible         =   0   'False
      Width           =   1590
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   3
      Left            =   5805
      TabIndex        =   3
      Top             =   765
      Visible         =   0   'False
      Width           =   1650
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   2
      Left            =   5805
      TabIndex        =   2
      Top             =   525
      Visible         =   0   'False
      Width           =   1605
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   1
      Left            =   5805
      TabIndex        =   1
      Top             =   285
      Visible         =   0   'False
      Width           =   1650
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Index           =   0
      Left            =   5805
      TabIndex        =   0
      Top             =   45
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.Shape Riquadro 
      BackColor       =   &H00400000&
      BorderColor     =   &H80000006&
      Height          =   2835
      Left            =   30
      Top             =   30
      Width           =   5370
   End
End
Attribute VB_Name = "grafico"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const MaxData As Integer = 300
Dim data(1000, 9) As Single
Dim SerCol(10) As Long
Dim SerName(10) As String
Dim Pivot As Integer
Dim MaxSeries As Byte
Dim FTop As Long
Dim FLeft As Long
Dim FWidth As Long
Dim FHeight As Long

' EricL 4/7/2006
'Public Sub SetYLabel(a As String)
'  Dim b As String
'  b = ""
'  For t = 1 To Len(a)
'    b = b + Mid(a, t, 1) + vbCrLf
'  Next t
'  'YLabel.Caption = b
'  Me.Caption = a + " / Cycles graph"
'End Sub

Public Sub ResetGraph()
  Erase data
  Erase SerCol
  Erase SerName
  Pivot = 0
  MaxSeries = 0
  For t = 0 To 9
    Label1(t).Visible = False
    Shape3(t).Visible = False
  Next t
End Sub

Public Function AddSeries(n As String, c As Long)
  SerName(MaxSeries) = n
  Label1(MaxSeries).Caption = n
  Shape3(MaxSeries).FillColor = c
  Label1(MaxSeries).Visible = True
  Shape3(MaxSeries).Visible = True
  SerCol(MaxSeries) = Shape3(MaxSeries).FillColor
  MaxSeries = MaxSeries + 1
  AddSeries = MaxSeries - 1
End Function

Public Sub IncSeries(n As String)
  Dim k As Byte
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) <> n Then
    AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    k = MaxSeries - 1
  End If
  data(Pivot, k) = data(Pivot, k) + 1
End Sub

Public Sub SetValues(n As String, v As Single)
  Dim k As Byte
  Dim i As Integer
  
  i = 0
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) <> n Then
    If n = "Cost Multiplier" Then
       AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Population / Target" Then
       AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Total Bots" Then
       AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Upper Range" Then
       AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Lower Range" Then
       AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Zero Level" Then
      AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    ElseIf n = "Reinstatement Level" Then
      AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    Else
       While SimOpts.Specie(i).Name <> n And i < SimOpts.SpeciesNum
        i = i + 1
      Wend
      AddSeries n, SimOpts.Specie(i).color
    End If
    k = MaxSeries - 1
  End If
  data(Pivot, k) = v
End Sub

Public Sub SetValuesP(k As Integer, v As Single)
  data(Pivot, k) = v
End Sub

Public Function GetPosition(n As String) As Integer
  Dim k As Integer
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) <> n Then
    AddSeries n, RGB(Random(100, 255), Random(100, 255), Random(100, 255))
    k = MaxSeries - 1
  End If
  GetPosition = k
End Function

Public Sub setcolor(n As String, c As Long)
Dim k As Integer
  k = 0
  While k < MaxSeries And SerName(k) <> n
    k = k + 1
  Wend
  If SerName(k) = n Then
    Shape3(k).FillColor = c
    SerCol(k) = c
  End If
End Sub

Public Sub DelSeries(n As Integer)
  If n < MaxSeries - 1 Then
    For k = n To MaxSeries - 1
      For t = 0 To MaxData
        data(t, n) = data(t, n + 1)
      Next t
      Label1(n).Caption = Label1(n + 1).Caption
      Shape3(n).FillColor = Shape3(n + 1).FillColor
    Next k
  End If
  Label1(MaxSeries - 1).Visible = False
  Shape3(MaxSeries - 1).Visible = False
  MaxSeries = MaxSeries - 1
End Sub

Private Sub Form_Activate()
  For t = 0 To 9
    If SerName(t) <> "" Then
      Label1(t).Visible = True
      Shape3(t).Visible = True
      Label1(t).Caption = SerName(t)
      Shape3(t).FillColor = SerCol(t)
    End If
  Next t
  'If grafico.WindowState = 0 Then
  '  Me.Top = FTop
  '  Me.left = FLeft
  '  Me.Height = FHeight
  '  Me.width = FWidth
  'End If
End Sub

Private Sub Form_Load()
  For t = 0 To 9
    Label1(t).Visible = False
    Shape3(t).Visible = False
  Next t
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  If FHeight = 0 Then FHeight = 4000
  If FWidth = 0 Then FWidth = 5900
  Me.Top = FTop
  Me.Left = FLeft
  Me.Height = FHeight
  Me.Width = FWidth
  XLabel.Caption = Str(SimOpts.chartingInterval) + " cycles per data point"
End Sub

Private Sub Form_Resize()
  If Me.Height > 800 And Me.Width > 1800 Then
    Riquadro.Height = Me.Height - 800
    Riquadro.Width = Me.Width - 1800
    Riquadro.Top = 20
    For t = 0 To 9
      Shape3(t).Left = Riquadro.Left + Riquadro.Width + 50
      Label1(t).Left = Shape3(t).Left + Shape3(t).Width + 30
    Next t
    UpdateNow.Left = Riquadro.Left + Riquadro.Width + 250
    UpdateNow.Top = Me.Height - UpdateNow.Height - 550
    XLabel.Top = Me.Height - XLabel.Height - 550
    RedrawGraph
    FTop = Me.Top
    FLeft = Me.Left
    FHeight = Me.Height
    FWidth = Me.Width
  End If
End Sub

'Public Sub AddVal(n As String, x As Single, s As Integer)
'  Dim k As Byte
'  k = 0
'  While k < MaxSeries And SerName(k) <> n
'    k = k + 1
'  Wend
'  If SerName(k) <> n Then
'    AddSeries n, RGB(Random(0, 255), Random(0, 255), Random(0, 255))
'    s = MaxSeries - 1
'  End If
'  data(Pivot, s) = x
'End Sub

Public Sub NewPoints()
  Dim t As Byte
  Pivot = Pivot + 1
  For t = 0 To 9
    data(Pivot, t) = 0
  Next t
  If Pivot > MaxData Then Pivot = 0
  RedrawGraph
  FTop = Me.Top
  FLeft = Me.Left
  FHeight = Me.Height
  FWidth = Me.Width
End Sub

Public Sub RedrawGraph()
  Static maxy As Single
  Dim k As Integer
  Dim t As Integer
  Dim maxv As Single
  Dim xunit As Long, yunit As Long
  maxv = -1000
  Dim an As Integer
  Dim inc As Single, xo As Single, yo As Single
  Dim lp(10, 1) As Single
  
  On Error GoTo bypass 'EricL in case chart window gets closed just at the right moment...
  If maxy < 1 Then maxy = 1
  xunit = (Riquadro.Width - 200) / (MaxData + 1)
  yunit = (Riquadro.Height - 200) / maxy ' EricL - Multithread divide by zero bug here...
  xo = Riquadro.Left
  yo = Riquadro.Top + Riquadro.Height - 50
  Me.Cls
  DrawAxes maxy
  k = Pivot + 1
  If k > MaxData Then k = 0
  For t = 0 To MaxSeries - 1
    Me.PSet (xo + xunit * 1, yo - yunit * data(k, t)), col
    lp(t, 0) = xo
    lp(t, 1) = yo - yunit * data(k, t)
  Next t
  an = 2
  While k <> Pivot
    For t = 0 To MaxSeries - 1
      Me.Line (lp(t, 0), lp(t, 1))-(xo + xunit * an, yo - yunit * data(k, t)), SerCol(t)
      lp(t, 0) = xo + xunit * an
      lp(t, 1) = yo - yunit * data(k, t)
      If data(k, t) > maxv Then maxv = data(k, t)
      Label1(t).ToolTipText = Str(data(k, t)) ' EricL 4/6/2006 - Updates the tooltip to display that last value
    Next t
    an = an + 1
    k = k + 1
    If k > MaxData Then k = 0
  Wend
  maxy = maxv
  XLabel.Caption = Str(SimOpts.chartingInterval) + " cycles per data point. " + Str(k) + " data points."

bypass:
End Sub

Private Sub DrawAxes(Max As Single)
  Dim d As Single
  Dim o As Long
  Dim xo As Long
  Dim yo As Long
  xo = Riquadro.Left
  yo = Riquadro.Top + Riquadro.Height
  yunit = Riquadro.Height / Max
  Line (xo, yo - yunit * Max / 2)-(Riquadro.Left + Riquadro.Width, yo - yunit * Max / 2), vbBlack
  YLab(0).Caption = CStr(Max / 2)
  YLab(0).Left = xo
  YLab(0).Top = (yo - yunit * Max / 2)
End Sub


Private Sub UpdateNow_Click()
  Dim chartNumber As Integer

  chartNumber = 0

'EricL Figuring out which graph I am this way is a total hack, but it works
  Select Case Me.Caption
    Case "Populations"
      chartNumber = 1
    Case "Mutations (Species Average)"
      chartNumber = 2
    Case "Average Age (hundreds of cycles)"
      chartNumber = 3
    Case "Offspring (Species Average)"
      chartNumber = 4
    Case "Energy (Species Average)"
      chartNumber = 5
    Case "DNA length (Species Average)"
      chartNumber = 6
    Case "DNA Cond statements (Species Average)"
      chartNumber = 7
    Case "Mutations/DNA len (Species Average)"
      chartNumber = 8
    Case "Total Energy/Species (x1000)"
      chartNumber = 9
    Case "Simulation Stats"
      chartNumber = 10
  End Select
  
  Form1.FeedGraph (chartNumber)
End Sub

