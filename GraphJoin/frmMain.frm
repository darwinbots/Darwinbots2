VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Graph Join"
   ClientHeight    =   6810
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   9660
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   454
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   644
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog myOpen 
      Left            =   8520
      Top             =   3360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.HScrollBar HScroll 
      Height          =   255
      LargeChange     =   100
      Left            =   0
      Max             =   100
      SmallChange     =   17
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   5280
      Width           =   1815
   End
   Begin VB.VScrollBar VScroll 
      Height          =   1695
      Left            =   7560
      SmallChange     =   17
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.PictureBox picMain 
      Height          =   5295
      Left            =   -120
      ScaleHeight     =   349
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   501
      TabIndex        =   0
      Top             =   0
      Width           =   7575
      Begin VB.Frame ffmSteps 
         Caption         =   "Step1: Formatting"
         Height          =   3375
         Left            =   240
         MousePointer    =   15  'Size All
         TabIndex        =   3
         Top             =   120
         Visible         =   0   'False
         Width           =   3015
         Begin VB.CommandButton btnNext 
            Caption         =   "NEXT STEP"
            Height          =   615
            Left            =   1800
            MousePointer    =   1  'Arrow
            TabIndex        =   22
            Top             =   1320
            Width           =   1095
         End
         Begin VB.TextBox txtHDP 
            Height          =   285
            Left            =   480
            MousePointer    =   3  'I-Beam
            TabIndex        =   20
            Text            =   "1"
            Top             =   2400
            Width           =   855
         End
         Begin VB.CommandButton btnHDPAdd 
            Caption         =   "+"
            Height          =   255
            Left            =   1320
            MousePointer    =   1  'Arrow
            TabIndex        =   19
            Top             =   2400
            Width           =   255
         End
         Begin VB.CommandButton btnHDPSub 
            Caption         =   "-"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   18
            Top             =   2400
            Width           =   255
         End
         Begin VB.CommandButton btnVDPSub 
            Caption         =   "-"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   16
            Top             =   1800
            Width           =   255
         End
         Begin VB.CommandButton btnVDPAdd 
            Caption         =   "+"
            Height          =   255
            Left            =   1320
            MousePointer    =   1  'Arrow
            TabIndex        =   15
            Top             =   1800
            Width           =   255
         End
         Begin VB.TextBox txtVDP 
            Height          =   285
            Left            =   480
            MousePointer    =   3  'I-Beam
            TabIndex        =   14
            Text            =   "2"
            Top             =   1800
            Width           =   855
         End
         Begin VB.CommandButton btnRecolor 
            Caption         =   "Change Color"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   13
            Top             =   2880
            Width           =   1335
         End
         Begin VB.TextBox txtPH 
            Height          =   285
            Left            =   480
            MousePointer    =   3  'I-Beam
            TabIndex        =   10
            Text            =   "200"
            Top             =   1200
            Width           =   855
         End
         Begin VB.CommandButton btnPHAdd 
            Caption         =   "+"
            Height          =   255
            Left            =   1320
            MousePointer    =   1  'Arrow
            TabIndex        =   9
            Top             =   1200
            Width           =   255
         End
         Begin VB.CommandButton btnPHSub 
            Caption         =   "-"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   8
            Top             =   1200
            Width           =   255
         End
         Begin VB.CommandButton btnPWSub 
            Caption         =   "-"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   7
            Top             =   600
            Width           =   255
         End
         Begin VB.CommandButton btnPWAdd 
            Caption         =   "+"
            Height          =   255
            Left            =   1320
            MousePointer    =   1  'Arrow
            TabIndex        =   5
            Top             =   600
            Width           =   255
         End
         Begin VB.TextBox txtPW 
            Height          =   285
            Left            =   480
            MousePointer    =   3  'I-Beam
            TabIndex        =   4
            Text            =   "500"
            Top             =   600
            Width           =   855
         End
         Begin VB.Label lblHDP 
            Caption         =   "# Horizontal labels:"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   21
            Top             =   2160
            Width           =   1815
         End
         Begin VB.Label lblVDP 
            Caption         =   "# Vertical labels:"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   17
            Top             =   1560
            Width           =   1815
         End
         Begin VB.Label lblHeight 
            Caption         =   "Height:"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   11
            Top             =   960
            Width           =   1815
         End
         Begin VB.Label lblPW 
            Caption         =   "Segmented Width:"
            Height          =   255
            Left            =   240
            MousePointer    =   1  'Arrow
            TabIndex        =   6
            Top             =   360
            Width           =   1815
         End
      End
      Begin VB.PictureBox picGraph 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         Height          =   1095
         Left            =   120
         MousePointer    =   2  'Cross
         ScaleHeight     =   69
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   69
         TabIndex        =   12
         Top             =   0
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.Image imgTmp 
         Height          =   375
         Left            =   2400
         Top             =   3960
         Visible         =   0   'False
         Width           =   975
      End
   End
   Begin VB.Menu File 
      Caption         =   "&File"
      Begin VB.Menu Open 
         Caption         =   "&Open"
         Shortcut        =   ^O
      End
   End
   Begin VB.Menu About 
      Caption         =   "&About"
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'api to figure out mouse position
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Type POINTAPI
        X As Long
        Y As Long
End Type


Dim ffmpos As POINTAPI

'scroll bar stuff
Dim xScrV As Long
Dim yScrV As Long
Dim isupdating As Boolean

'our data
Private Type robot
data(998) As Double
name As String
color As Long
End Type
Private Type segment
    robots() As robot
    title As String
End Type
Dim segments() As segment  'fix
Dim globalname As String

Dim step2 As Boolean 'It is time to make labels
Dim usednames() As String
Dim curname As String
Dim done As Boolean

Private Sub About_Click()
MsgBox "Graph Join was created by: Botsareus a.k.a. Paul Kononov", vbInformation, "About"
End Sub

Private Sub btnNext_Click()
picGraph.Font = "Arial"
picGraph.FontSize = 10
picGraph.FontBold = True
step2 = True
ffmSteps.Caption = "Step2: Labeling"
ffmSteps.Height = 20
imgTmp.Picture = picGraph.Image
MsgBox "Please insert labels directly onto the chart.", vbInformation
ReDim usednames(0)
incrob
End Sub

Private Sub incrob()
Dim a As Long
Dim aa As Long
Dim aaa As Integer
For a = 0 To UBound(segments)
    For aa = 0 To UBound(segments(a).robots)
        'see if name ex, if no use it
        Dim ex As Boolean
        ex = False
        For aaa = 0 To UBound(usednames)
            If usednames(aaa) = segments(a).robots(aa).name Then ex = True
        Next
        If Not ex Then
            ReDim Preserve usednames(UBound(usednames) + 1) As String
            usednames(UBound(usednames)) = segments(a).robots(aa).name
            picGraph.ForeColor = segments(a).robots(aa).color
            curname = segments(a).robots(aa).name
            Exit Sub
        End If
    Next
Next
done = True
End Sub

Private Sub Open_Click()
'full reset
step2 = False
done = False
ffmSteps.Caption = "Step1: Formatting"
ffmSteps.Height = 255
picGraph.Picture = Picture
picGraph.Font = "MS Sans Serif"
picGraph.FontSize = 8
picGraph.FontBold = False
'full reset complete

With myOpen
    .FileName = ""
    .Filter = "First graph save(*.gsave)|*.gsave|All files(*.*)|*.*"
    .ShowOpen
    'we need to figure out name of first element
    Dim strPath As String
    strPath = Left(.FileName, Len(.FileName) - Len(.FileTitle))
    Dim dotsplits() As String
    dotsplits = Split(.FileTitle, ".")
    Dim ext As String
    ext = dotsplits(UBound(dotsplits))
    dotsplits(UBound(dotsplits)) = ""
    Dim strBaseName As String
    strBaseName = Join(dotsplits, ".")
    strBaseName = Left(strBaseName, Len(strBaseName) - 1)
    Do
        strBaseName = Left(strBaseName, Len(strBaseName) - 1)
    Loop Until IsNumeric(Right(strBaseName, 1)) = False
    globalname = strBaseName
End With

'lets populate our segments
ReDim segments(0)
Dim i As Integer
Dim ii As Integer
Dim iii As Integer
Dim strinp As String
Dim strsplit() As String
Dim robosplit() As String
Dim roboinfosplit() As String
i = 1
Do
    Open strPath & strBaseName & i & "." & ext For Input As #1
         Line Input #1, strinp
        With segments(i - 1)
            'load title
            .title = strinp
            'load robot info
            Line Input #1, strinp
            robosplit = Split(strinp, ",")
            ReDim Preserve .robots(UBound(robosplit) - 1)
            For ii = 0 To UBound(robosplit) - 1
                roboinfosplit = Split(robosplit(ii), ":")
                .robots(ii).color = Val(roboinfosplit(0))
                .robots(ii).name = roboinfosplit(1)
            Next
            'load data
            For iii = 0 To 998
                Line Input #1, strinp
                robosplit = Split(strinp, vbTab)
                For ii = 0 To UBound(robosplit) - 1
                    .robots(ii).data(iii) = robosplit(ii)
                Next
            Next
        End With
    Close #1
    ReDim Preserve segments(i)
    i = i + 1
Loop Until Dir(strPath & strBaseName & i & "." & ext) = ""

ReDim Preserve segments(UBound(segments) - 1)

picGraph.Visible = True
ffmSteps.Visible = True
redraw
rescroll
End Sub

'edit settings:
Private Sub btnHDPSub_Click()
txtHDP = txtHDP / 2
End Sub

Private Sub btnVDPSub_Click()
txtVDP = txtVDP - 1
End Sub
Private Sub btnHDPAdd_Click()
txtHDP = txtHDP * 2
End Sub


Private Sub picGraph_Click()
If step2 Then
    imgTmp.Picture = picGraph.Image
    incrob
End If
End Sub

Private Sub picGraph_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If step2 Then
    picGraph.Picture = imgTmp.Picture
    picGraph.CurrentX = X
    picGraph.CurrentY = Y
    picGraph.Print curname
    If done Then
        Clipboard.Clear
        Clipboard.SetData imgTmp.Picture
        MsgBox "Chart is copied to clipboard.", vbInformation
        done = False
    End If
End If
End Sub

Private Sub txtHDP_Change()
txtHDP = Abs((Val(txtHDP)))
If txtHDP > 32768 Then txtHDP = 32768
If txtHDP < 1 / 1024 Then txtHDP = 1 / 1024
Dim x2 As Long
x2 = Log(txtHDP) / Log(2)
txtHDP = 2 ^ x2
redraw
End Sub

Private Sub txtVDP_Change()
txtVDP = Abs(Int(Val(txtVDP)))
If txtVDP < 1 Then txtVDP = 1
redraw
End Sub
Private Sub btnVDPAdd_Click()
txtVDP = txtVDP + 1
End Sub

Private Sub btnPWAdd_Click()
txtPW = (txtPW + 1) * 1.01
End Sub

Private Sub btnPWSub_Click()
txtPW = (txtPW - 1) / 1.01
End Sub

Private Sub btnRecolor_Click()
picGraph.BackColor = RGB(240 + 15 * Rnd, 240 + 15 * Rnd, 240 + 15 * Rnd)
redraw
End Sub



Private Sub ffmSteps_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
rescroll
End Sub

Private Sub txtPW_Change()
txtPW = Abs(Int(Val(txtPW)))
If txtPW < 3 Then txtPW = 3
redraw
rescroll
End Sub

Private Sub btnPHAdd_Click()
txtPH = (txtPH + 1) * 1.01
End Sub

Private Sub btnPHSub_Click()
txtPH = (txtPH - 1) / 1.01
End Sub

Private Sub txtPH_Change()
txtPH = Abs(Int(Val(txtPH)))
If txtPH < 100 Then txtPH = 100
redraw
rescroll
End Sub

Sub redraw()

'the main draw proc
picGraph.Width = 60 + txtPW * (UBound(segments) + 1)
picGraph.Height = txtPH

Dim maxy As Double

'lets figure our abs global maxy
Dim l As Long
Dim ll As Integer
Dim lll As Integer
For l = 0 To UBound(segments)
    For ll = 0 To UBound(segments(l).robots)
        For lll = 0 To 998
            If maxy < segments(l).robots(ll).data(lll) Then maxy = segments(l).robots(ll).data(lll)
        Next
    Next
Next


Dim yran As Byte
Dim toty As Byte
toty = txtVDP
With picGraph
.Cls
    Dim X As Double
    Dim Y As Double
    'draw data
    For l = 0 To UBound(segments)
        For ll = 0 To UBound(segments(l).robots)
            For lll = 0 To 998
                X = 60 + lll / 998 * txtPW + l * txtPW
                Y = (txtPH - 34) - segments(l).robots(ll).data(lll) / maxy * (txtPH - 40)
                If lll = 0 Then picGraph.Line (X, Y)-(X, Y), segments(l).robots(ll).color
                picGraph.Line -(X, Y), segments(l).robots(ll).color
            Next
        Next
    Next
    picGraph.ForeColor = vbBlack
    
    'draw y-axis
    For yran = 0 To toty
        .CurrentX = 0
        .CurrentY = yran / toty * (.Height - 40)
        picGraph.Print Round((toty - yran) / toty * maxy, 2)
        picGraph.Line (50, .CurrentY - 6)-(.Width, .CurrentY - 6)
    Next
    'draw primary x-axis
    picGraph.Line (60, 0)-(60, .Height - 20)
    .CurrentX = .CurrentX - 6
    picGraph.Print 0
    Dim xran As Long
    Dim xran2 As Long
    Dim oldtitle As String
    Dim newtitle As String
    For xran = 0 To UBound(segments)
        If txtHDP >= 1 Then
            If xran Mod txtHDP = 0 Then
                picGraph.Line (60 + (xran + 1) * txtPW, 0)-(60 + (xran + 1) * txtPW, .Height - 20)
                .CurrentX = .CurrentX - 6
                picGraph.Print (xran + 1) * 1000
            End If
        Else
            For xran2 = 1 To 1 / txtHDP
                picGraph.Line (60 + xran2 * txtHDP * txtPW + xran * txtPW, 0)-(60 + xran2 * txtHDP * txtPW + xran * txtPW, .Height - 20)
               .CurrentX = .CurrentX - 6
                picGraph.Print xran2 * txtHDP * 1000 + xran * 1000
            Next
        End If
        
        'print a title
        .CurrentX = 65 + xran * txtPW
        .CurrentY = 10
        newtitle = segments(xran).title
        If newtitle = "normal" Then newtitle = globalname
        If oldtitle <> newtitle Then
            picGraph.Print newtitle
            oldtitle = newtitle
        End If
        
    Next
End With
End Sub
Private Sub ffmSteps_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim offset As POINTAPI
offset.X = Width / 15 - ScaleWidth
offset.Y = Height / 15 - ScaleHeight
'we need to move the frame as nessisary
If Button = 1 Then
    Dim lpPoint As POINTAPI
    GetCursorPos lpPoint
    ffmSteps.Left = lpPoint.X - Left / 15 - offset.X - ffmpos.X
    ffmSteps.Top = lpPoint.Y - Top / 15 - offset.Y - ffmpos.Y
Else
    ffmpos.X = X / 15
    ffmpos.Y = Y / 15
End If
End Sub

Private Sub Form_Load()
Randomize
'we need to resize all controls when thr form loads
Form_Resize
End Sub

Private Sub Form_Resize()
If WindowState <> vbMinimized Then
VScroll.Left = ScaleWidth - 17
VScroll.Height = ScaleHeight - 17
HScroll.Top = ScaleHeight - 17
HScroll.Width = ScaleWidth - 17
picMain.Width = ScaleWidth - 17 / 2
picMain.Height = ScaleHeight - 17
rescroll
End If
End Sub

'we need to update the scroll bars
Private Sub rescroll()
'x
Dim xmax As Long
xmax = picMain.Width
If (ffmSteps.Left + ffmSteps.Width) > xmax Then xmax = ffmSteps.Left + ffmSteps.Width
If (picGraph.Left + picGraph.Width) > xmax Then xmax = (picGraph.Left + picGraph.Width)
Dim xmin As Long
If ffmSteps.Left < xmin Then xmin = ffmSteps.Left
If picGraph.Left < xmin Then xmin = picGraph.Left
'
If ((xmax - xmin) - picMain.Width) > 0 Then
    HScroll.Max = (xmax - xmin) - picMain.Width
    isupdating = True
    HScroll.Value = -xmin
    xScrV = -xmin
    isupdating = False
Else
    HScroll.Max = 0
End If
HScroll.LargeChange = picGraph.Width
'y
Dim ymax As Long
ymax = picMain.Height
If (ffmSteps.Top + ffmSteps.Height) > ymax Then ymax = ffmSteps.Top + ffmSteps.Height
If (picGraph.Top + picGraph.Height) > ymax Then ymax = (picGraph.Top + picGraph.Height)
Dim ymin As Long
If ffmSteps.Top < ymin Then ymin = ffmSteps.Top
If picGraph.Top < ymin Then ymin = picGraph.Top
'
If ((ymax - ymin) - picMain.Height) > 0 Then
    VScroll.Max = (ymax - ymin) - picMain.Height
    isupdating = True
    VScroll.Value = -ymin
    yScrV = -ymin
    isupdating = False
Else
    VScroll.Max = 0
End If

HScroll.LargeChange = picGraph.Width
VScroll.LargeChange = picGraph.Height
End Sub


Private Sub HScroll_Change()
If Not isupdating Then
ffmSteps.Left = ffmSteps.Left - (HScroll.Value - xScrV)
picGraph.Left = picGraph.Left - (HScroll.Value - xScrV)
rescroll
End If
End Sub

Private Sub VScroll_Change()
If Not isupdating Then
ffmSteps.Top = ffmSteps.Top - (VScroll.Value - yScrV)
picGraph.Top = picGraph.Top - (VScroll.Value - yScrV)
rescroll
End If
End Sub
