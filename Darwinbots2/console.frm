VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Consoleform 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   2550
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   4710
   Icon            =   "console.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   Begin RichTextLib.RichTextBox Text1 
      Height          =   2025
      Left            =   0
      TabIndex        =   10
      Top             =   240
      Width           =   4695
      _ExtentX        =   8281
      _ExtentY        =   3572
      _Version        =   393217
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"console.frx":058A
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   0
      TabIndex        =   1
      Top             =   2280
      Width           =   4695
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   0
      ScaleHeight     =   343.965
      ScaleMode       =   0  'User
      ScaleWidth      =   4695
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   -60
      Width           =   4695
      Begin VB.CommandButton ClearButton 
         Height          =   300
         Left            =   3885
         Picture         =   "console.frx":060E
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   45
         Width           =   375
      End
      Begin VB.CommandButton Command1 
         Height          =   300
         Left            =   4245
         Picture         =   "console.frx":0B98
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   45
         Width           =   375
      End
      Begin VB.CommandButton eyebut 
         Height          =   300
         Left            =   1575
         Picture         =   "console.frx":1122
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   45
         Width           =   375
      End
      Begin VB.CommandButton playbut 
         Height          =   300
         Left            =   0
         Picture         =   "console.frx":1698
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   45
         Width           =   375
      End
      Begin VB.CommandButton Command3 
         Height          =   300
         Left            =   1935
         Picture         =   "console.frx":1C22
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   30
         Width           =   375
      End
      Begin VB.CommandButton Command2 
         Height          =   300
         Left            =   2280
         Picture         =   "console.frx":21AC
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   45
         Width           =   375
      End
      Begin VB.CommandButton debug 
         Height          =   300
         Left            =   2650
         Picture         =   "console.frx":2722
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   44
         Width           =   375
      End
      Begin VB.CommandButton pausebut 
         Height          =   300
         Left            =   360
         Picture         =   "console.frx":2860
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   30
         Width           =   375
      End
      Begin VB.CommandButton cyclebut 
         Height          =   300
         Left            =   720
         Picture         =   "console.frx":299E
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   30
         Width           =   375
      End
   End
End
Attribute VB_Name = "Consoleform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Botsareus 5/8/2012 Added a 'debug' button to replace the RobDebug.frm that was never implemented
'Botsareus 5/30/2012 Set transperancy for all icons
Option Explicit

Private cnum As Integer
Private hist(100) As String
Private hpos As Integer
Private hcurr As Integer
Private words(100) As String
Public wcount As Integer
Dim lasttim As Single

Public WithEvents evnt As cevent
Attribute evnt.VB_VarHelpID = -1

Private Sub ClearButton_Click()
  Text1.text = ""
  Text1.SelStart = 0
End Sub

Private Sub Command1_Click()
  robfocus = cnum
  MDIForm1.EnableRobotsMenu
  textout "showdna"
  Text2.text = "showdna"
  Parse
  Consoleform.evnt.fire cnum, "showdna"
  hist(hcurr) = "showdna"
  hcurr = hcurr + 1
  If hcurr > 100 Then hcurr = 0
  hpos = hcurr
  Form1.Redraw
End Sub

Private Sub Command2_Click()
  words(1) = "printtouch"
  wcount = 1
  Consoleform.evnt.fire cnum, "printtouch"
End Sub

Private Sub Command3_Click()
  words(1) = "printtaste"
  wcount = 1
  Consoleform.evnt.fire cnum, "printtaste"
End Sub

Private Sub debug_Click() 'Botsareus 2/2/2013 The debug button
  words(1) = "debug"
  wcount = 1
  Consoleform.evnt.fire cnum, "debug"
End Sub

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub Form_Resize()
  If WindowState <> 1 Then
    Text1.Width = Width - 120
    Text1.Height = Height - Text2.Height - 620
    Text2.Top = Height - Text2.Height - 400
    Text2.Width = Text1.Width
    Picture1.Width = Text2.Width
  End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Consoleform.endconsole cnum
End Sub

Private Sub cyclebut_Click()
  words(1) = "cycle"
  words(2) = "1"
  wcount = 2
  Consoleform.evnt.fire cnum, "cycle"
End Sub

Private Sub eyebut_Click()
  words(1) = "printeye"
  wcount = 1
  Consoleform.evnt.fire cnum, "printeye"
End Sub

Private Sub pausebut_Click()
  words(1) = "pause"
  wcount = 1
  Consoleform.evnt.fire cnum, "pause"
End Sub

Private Sub playbut_Click()
  words(1) = "play"
  wcount = 1
  Consoleform.evnt.fire cnum, "play"
End Sub

Private Sub Text2_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 And Text2.text <> "" Then
    textout Text2.text
    Parse
    Consoleform.evnt.fire cnum, Text2.text
    hist(hcurr) = Text2.text
    hcurr = hcurr + 1
    If hcurr > 100 Then hcurr = 0
    hpos = hcurr
    Text2.text = ""
  End If
  If KeyCode = 38 Then
    hpos = hpos - 1
    If hpos = -1 Then hpos = 100
    Text2.text = hist(hpos)
  End If
  If KeyCode = 40 Then
    hpos = hpos + 1
    If hpos = 101 Then hpos = 0
    Text2.text = hist(hpos)
  End If
End Sub

Private Sub Parse()
  Dim a As String
  Dim c As Integer
  c = 0
  a = Text2.text
  While InStr(1, a, " ") > 0
    c = c + 1
    words(c) = Left(a, InStr(1, a, " ") - 1)
    a = Right(a, Len(a) - 1 - Len(words(c)))
  Wend
  words(c + 1) = a
  wcount = c + 1
End Sub

Public Function text(ind As Integer) As String
  text = ""
  If ind >= 0 And ind <= wcount Then text = words(ind)
End Function

Public Sub newconsole(ind As Integer, title As String, welc As String)
  hpos = 0
  hcurr = 0
  cnum = ind
  settitle title
  Text1.text = welc
  Show
End Sub

Public Sub settitle(title As String)
  Caption = title
End Sub

Public Sub textout(txt As String)
  Text1.text = Text1.text + Chr(13) + Chr(10) + txt
  If Len(Text1.text) > 2500 Then
    Text1.text = Mid(Text1.text, InStr(Text1.text, Chr(13)) + 2)
  End If
  Text1.SelStart = Len(Text1.text)
End Sub

'
'    C O N S O L E
'

' opens a robot's console
Public Sub openconsole()
  If rob(robfocus).console Is Nothing Then
    Set rob(robfocus).console = New Consoleform
    rob(robfocus).console.newconsole robfocus, "Robot " + Str$(rob(robfocus).AbsNum) + " console", "Robot " + Str$(rob(robfocus).AbsNum) + " - " + rob(robfocus).FName + " console"
    rob(robfocus).console.textout "Type 'help' for commands"
    Active = False
  End If
End Sub

' closes the console
Public Sub endconsole(c As Integer)
  Set rob(c).console = Nothing
End Sub

' parses console commands
Private Sub evnt_textentered(ind As Integer, text As String)
 
  If rob(ind).console Is Nothing Then Exit Sub ' EricL 3/19/2006 Prevents crash when bot has died
  
  text = rob(ind).console.text(1)
  Select Case text
    Case "debug"
        Dim t As Integer
        For t = 1 To MaxRobs
            If Not (rob(t).console Is Nothing) Then rob(t).console.textout "***ROBOT DEBUG***"
        Next
        DisplayDebug = True
        cycle 1
        DisplayDebug = False
    Case "printeye"
      rob(ind).console.textout printeye(ind)
    Case "printtouch"
      rob(ind).console.textout printtouch(ind)
    Case "printtaste"
      rob(ind).console.textout printtaste(ind)
    Case "cycle"
      DisplayActivations = True
      cycle val(rob(ind).console.text(2))
      DisplayActivations = False
    Case "energy"
      rob(ind).nrg = val(rob(ind).console.text(2))
    Case "play"
      DisplayActivations = True
      Form1.Active = True
    Case "pause"
      DisplayActivations = False
      Form1.Active = False
    Case "set"
      If Abs(val(rob(ind).console.text(3))) < 32001 Then
        rob(ind).mem(SysvarTok(rob(ind).console.text(2), ind)) = val(rob(ind).console.text(3))
        printmem ind, rob(ind).console.text(2)
      Else
        rob(ind).console.textout "Value out of range.  Memory values must be between -32000 and 32000."
      End If
    Case "printmem"
      printmem ind, rob(ind).console.text(2)
    Case "?"
      printmem ind, rob(ind).console.text(2)
    Case "execrob"
      ExecRobs
    Case "showdna"
      datirob.Visible = True
      datirob.RefreshDna
      datirob.ZOrder
      datirob.infoupdate ind, rob(ind).nrg, rob(ind).parent, rob(ind).Mutations, rob(ind).age, rob(ind).SonNumber, 1, rob(ind).FName, rob(ind).genenum, rob(ind).LastMut, rob(ind).generation, rob(ind).DnaLen, rob(ind).LastOwner, rob(ind).Waste, rob(ind).body, rob(ind).mass, rob(ind).venom, rob(ind).shell, rob(ind).Slime, rob(ind).chloroplasts
      datirob.ShowDna
    Case "help"
      rob(ind).console.textout ""
      rob(ind).console.textout "This console works as an input/output interface for a single robot."
      rob(ind).console.textout "It could be used for robot debugging and manipulation."
      rob(ind).console.textout "One of the most useful features of the r.c. is that it shows"
      rob(ind).console.textout "which parts of the dna are executed in each cycle. Just press the single"
      rob(ind).console.textout "cycle button to try. To watch the entire dna, just click the button at"
      rob(ind).console.textout "the extreme right in the console."
      rob(ind).console.textout ""
      rob(ind).console.textout "Other commands are:"
      rob(ind).console.textout "printeye : prints the eye cells status"
      rob(ind).console.textout "printtouch : prints the touch cells status"
      rob(ind).console.textout "printtaste : prints the taste (hit) cells status"
      rob(ind).console.textout "printmem (or ?) (.var|n): prints value of .var or location n"
      rob(ind).console.textout "set (.var|n) value : stores value in variable .var or location n"
      rob(ind).console.textout "energy e : sets the robot's energy at e"
      rob(ind).console.textout "cycle n : executes n cycles"
      rob(ind).console.textout "execrob : executes all robots without doing a cycle"
      rob(ind).console.textout "showdna : brings up the robot details window showing the robot's dna"
      rob(ind).console.textout "debug : fires one cycle with debugger enabled"
  End Select
End Sub

' console printmem command
Private Sub printmem(ind As Integer, w As String)
  Dim v As Integer
  v = val(w)
  If v = 0 Then
    v = SysvarTok(w, ind)
  End If
  If v > 0 And v < 1000 Then
    rob(ind).console.textout Str$(v) + "->" + Str$(rob(ind).mem(v))
  End If
End Sub

' printeye command
Private Function printeye(ind As Integer) As String
  Dim t As Byte
  printeye = "EyeN: "
  For t = 1 To 9
    printeye = printeye + Str$(rob(ind).mem(EyeStart + t))
  Next t
  printeye = printeye + " .eyef:" + Str$(rob(ind).mem(EYEF)) + " .focuseye:" + Str$(rob(ind).mem(FOCUSEYE))
  printeye = printeye + Chr(13) + Chr(10) + "EyeNDir: "
  For t = 0 To 8
    printeye = printeye + Str$(rob(ind).mem(EYE1DIR + t))
  Next t
  printeye = printeye + Chr(13) + Chr(10) + "EyeNWidth: "
  For t = 0 To 8
    printeye = printeye + Str$(rob(ind).mem(EYE1WIDTH + t))
  Next t
End Function


' printtouch...
Private Function printtouch(ind As Integer) As String
  Dim a As String
  a = "Up:" + Str$(rob(ind).mem(hitup))
  a = a + " Dn:" + Str$(rob(ind).mem(hitdn))
  a = a + " Sx:" + Str$(rob(ind).mem(hitsx))
  a = a + " Dx:" + Str$(rob(ind).mem(hitdx))
  printtouch = a
End Function

' print taste (shots flavour)
Private Function printtaste(ind As Integer) As String
  Dim a As String
  a = "Up:" + Str$(rob(ind).mem(shup))
  a = a + " Dn:" + Str$(rob(ind).mem(shdn))
  a = a + " Sx:" + Str$(rob(ind).mem(shsx))
  a = a + " Dx:" + Str$(rob(ind).mem(shdx))
  printtaste = a
End Function

' forward num cycles
Public Sub cycle(num As Integer)
  Dim q As Integer, k As Integer
  For k = 1 To num
      Form1.cyc = Form1.cyc + 1
      
      UpdateSim
      Form1.Redraw
      
      If datirob.Visible And Not datirob.ShowMemoryEarlyCycle Then
        With rob(robfocus)
        datirob.infoupdate robfocus, .nrg, .parent, .Mutations, .age, .SonNumber, 1, .FName, .genenum, .LastMut, .generation, .DnaLen, .LastOwner, .Waste, .body, .mass, .venom, .shell, .Slime, .chloroplasts
        End With
      End If
      
      If lasttim > Int(Timer) Then lasttim = Int(Timer)
      If lasttim < Int(Timer) Then
        Form1.cyccaption Form1.cyc
        lasttim = Int(Timer)
        Form1.cyc = 0
      End If
      
      Select Case SimOpts.PopLimMethod
        Case 1, 2
          If TotalRobots > SimOpts.MaxPopulation Then Form1.popcontrol
      End Select
    DoEvents
  Next k
End Sub
