VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00400000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   8445
   ClientLeft      =   30
   ClientTop       =   90
   ClientWidth     =   12045
   FillColor       =   &H00C00000&
   ForeColor       =   &H00511206&
   Icon            =   "main.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8445
   ScaleWidth      =   12045
   Begin VB.Timer SecTimer 
      Interval        =   1000
      Left            =   2040
      Top             =   120
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Timer Timer2 
      Interval        =   60001
      Left            =   1440
      Top             =   120
   End
   Begin VB.Label lblSaving 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   615
      Left            =   4440
      TabIndex        =   5
      Top             =   4680
      Visible         =   0   'False
      Width           =   4215
   End
   Begin VB.Label lblSafeMode 
      BackStyle       =   0  'Transparent
      Caption         =   "Safe Mode"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   615
      Left            =   600
      TabIndex        =   4
      Top             =   4680
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.Label GraphLab 
      BackStyle       =   0  'Transparent
      Caption         =   "Updating Graph: 0%"
      ForeColor       =   &H0000FFFF&
      Height          =   255
      Left            =   600
      TabIndex        =   3
      Top             =   4200
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.Label BoyLabl 
      BackStyle       =   0  'Transparent
      Caption         =   $"main.frx":08CA
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   600
      TabIndex        =   2
      Top             =   3480
      Visible         =   0   'False
      Width           =   9855
   End
   Begin VB.Image InternetModePopFileProblem 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":0959
      Top             =   5400
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image InternetModeBackPressure 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":0CCB
      Top             =   5040
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image InternetModeStart 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":103D
      Top             =   4680
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image InternetModeOff 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":13AF
      Top             =   4320
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image ServerGood 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":1721
      Top             =   3600
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image ServerBad 
      Height          =   255
      Left            =   5280
      Picture         =   "main.frx":1A93
      Top             =   3960
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label InternetMode 
      BackColor       =   &H80000007&
      BackStyle       =   0  'Transparent
      Caption         =   "Internet Mode"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   600
      TabIndex        =   1
      Top             =   2760
      Visible         =   0   'False
      Width           =   3225
   End
   Begin VB.Image TeleporterMask 
      Height          =   720
      Left            =   240
      Picture         =   "main.frx":1E05
      Top             =   7560
      Visible         =   0   'False
      Width           =   11520
   End
   Begin VB.Image Teleporter 
      Appearance      =   0  'Flat
      Height          =   720
      Left            =   240
      Picture         =   "main.frx":1CE47
      Stretch         =   -1  'True
      Top             =   6600
      Visible         =   0   'False
      Width           =   11520
   End
   Begin VB.Image EnvMap 
      Height          =   1005
      Left            =   3840
      Top             =   120
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000007&
      BackStyle       =   0  'Transparent
      Caption         =   "Output video interrotto... premi sul pulsante nella barra in alto per ripristinarlo."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1335
      Left            =   600
      TabIndex        =   0
      Tag             =   "30000"
      Top             =   1440
      Visible         =   0   'False
      Width           =   10665
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' DarwinBots - copyright 2003 Carlo Comis
' Revisions
' V2.11, V2.12, V2.13, V2.14, V2.15 pondmode, V2.2, V2.3, V2.31, V2.32, V2.33, V2.34 by PurpleYouko
' V2.35, 2.36.X, 2.37.X by PurpleYouko and Numsgil
' Post V2.42 modifications copyright (c) 2006 2007 Eric Lockard  eric@sulaadventures.com

' Post V2.45 modifications copyright (c) 2012, 2013 Paul Kononov a.k.a Botsareus
'
' All rights reserved.
'
'Redistribution and use in source and binary forms, with or without
'modification, are permitted provided that:
'
'(1) source code distributions retain the above copyright notice and this
'    paragraph in its entirety,
'(2) distributions including binary code include the above copyright notice and
'    this paragraph in its entirety in the documentation or other materials
'    provided with the distribution, and
'(3) Without the agreement of the author redistribution of this product is only allowed
'    in non commercial terms and non profit distributions.
'
'THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED
'WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
'MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


Option Explicit

'Botsareus 5/19/2012 removed old teleporter pics that are no longer in use
'Botsareus 5/19/2012 removed 'smilymode' pics that are no longer in use
'Botsareus 3/15/2013 got rid of screen save code (was broken)
'Botsareus 4/9/2013 New graph label to keep track of graph update progress

'Botsareus 5/25/2013 onrounded math for custom graphs
Private Type Stack
  val(100) As Double
  pos As Integer
End Type
Private QStack As Stack

Public camfix As Boolean 'Botsareus 2/23/2013 normalizes screen
Public pausefix As Boolean 'Botsareus 3/6/2013 Figure out if simulation must start paused
Public TotalOffspring As Long 'Botsareus 5/22/2013 For find best

Public WithEvents t As TrayIcon
Attribute t.VB_VarHelpID = -1
Public BackPic As String

Dim edat(10) As Single

Const PIOVER4 = PI / 4

' for graphs
Private Type Graph
  opened As Boolean
  graf As grafico
End Type

Dim MouseClickX As Long     ' mouse pos when clicked
Dim MouseClickY As Long
Dim MouseClicked As Boolean
Dim ZoomFlag As Boolean        ' EricL True while mouse button four is held down - for zooming
Dim DraggingBot As Boolean     ' EricL True while mouse is down dragging bot around

'Botsareus 11/29/2013 Allows for moving whole organism
Private Type tmppostyp
n As Integer
x As Single
y As Single
End Type
Private tmprob_c As Byte
Private tmppos(50) As tmppostyp


Public cyc As Integer          ' cycles/second
Dim minutescount As Integer
Public dispskin As Boolean  ' skin drawing enabled?
Public Active As Boolean    ' sim running?
Public visiblew As Single     ' field visible portion (for zoom)
Public visibleh As Long

Private robminutescount As Integer  ' minutes counter for next robot auto save
Private AutoRobNum As Integer       ' last autosaved rob index
Private AutoSimNum As Integer       ' last autosaved sim index
Public DNAMaxConds As Integer   ' max conditions per gene allowed by mutation
Dim Charts(NUMGRAPHS) As Graph        ' array of graph pointers

Private GridRef As Integer
Public PiccyMode As Boolean   'display that piccy or not?
Public Newpic As Boolean      'IIs it a new picture?
Public Flickermode As Boolean 'Speed up graphics at the cost of some flicker

Public MagX As Long
Public MagY As Long

Public twipWidth As Single
Public TwipHeight As Single
Public FortyEightOverTwipWidth As Single
Public FortyEightOverTwipHeight As Single
Public xDivisor As Single
Public yDivisor As Single

Public InTimer2 As Boolean

Private p_reclev As Integer 'Botsareus 8/3/2012 for generational distance



Private Sub BoyLabl_Click()
BoyLabl.Visible = False
End Sub

Private Sub Form_Load()
  Dim i As Integer
   
  strings Me
  Set Consoleform.evnt = New cevent
  
  LoadSysVars
 ' LoadLists
  If BackPic <> "" Then
    Form1.Picture = LoadPicture(BackPic)
  Else
    Form1.Picture = Nothing
  End If
  Form1.Top = 0
  Form1.Left = 0
  Form1.Width = MDIForm1.ScaleWidth
  Form1.Height = MDIForm1.ScaleHeight
  'SimOpts.FieldWidth = Form1.ScaleWidth
  'SimOpts.FieldHeight = Form1.ScaleHeight
  visiblew = SimOpts.FieldWidth
  visibleh = SimOpts.FieldHeight
  MDIForm1.visualize = True
  MaxMem = 1000
  maxfieldsize = SimOpts.FieldWidth * 2
  TotalRobots = 0
  robfocus = 0
  MDIForm1.DisableRobotsMenu
  'maxshots = 300
  maxshotarray = 50
  shotpointer = 1
  ReDim Shots(maxshotarray)
  'MaxAbsNum = 0
  dispskin = True
  'Form1.Active = True Botsareus 2/21/2013 moved to mdiform1
  
  FlashColor(1) = vbBlack         ' Hit with memory shot
  FlashColor(-1 + 10) = vbRed     ' Hit with Nrg feeding shot
  FlashColor(-2 + 10) = vbWhite   ' Hit with Nrg Shot
  FlashColor(-3 + 10) = vbBlue    ' Hit with venom shot
  FlashColor(-4 + 10) = vbGreen   ' Hit with waste shot
  FlashColor(-5 + 10) = vbYellow  ' Hit with poison Shot
  FlashColor(-6 + 10) = vbMagenta ' Hit with body feeding shot
  FlashColor(-7 + 10) = vbCyan    ' Hit with virus shot
  InitObstacles
    
 ' SimOpts.DayNight = False ' EricL March 15, 2006
 ' SimOpts.Daytime = True ' EricL March 15, 2006
 ' MDIForm1.daypic.Visible = True
 ' MDIForm1.nightpic.Visible = False
  MDIForm1.F1Piccy.Visible = False
  ContestMode = False
  'SimOpts.chartingInterval = 200 ' EricL 3/28/2006 -Botsareus 8/3/2012 Commented out as it was overriding the saved settings
  'SimOpts.MutCurrMult = 1 ' EricL 4/1/2006 Botsareus 8/3/2013 no longer nessisary
End Sub

'
'              D R A W I N G
'

' redraws screen
Public Sub Redraw()
  Dim count As Long
'  count = SimOpts.TotRunCycle / 10
  
'  If count = SimOpts.TotRunCycle / 10 Then                  'gridref = layer of grid to refresh
'    Cls
'    GridRef = GridRef + 1: If GridRef > 9 Then GridRef = 1
'    'envir.RefreshGrid GridRef
'  End If
  
  If PiccyMode Then
    If Newpic Then
      Me.AutoRedraw = True
      Form1.Picture = LoadPicture(BackPic)
      Newpic = False
    End If
  End If
  Cls
  
  If Flickermode Then Me.AutoRedraw = False
    
  If numObstacles > 0 Then Obstacles.DrawObstacles
  
  DrawArena
  DrawAllTies
  DrawAllRobs
  If numTeleporters > 0 Then Teleport.DrawTeleporters
  DrawShots
  Me.AutoRedraw = True
End Sub

' calculates the pixel/twip ratio, since some graphic methods
' need pixel values
Function GetTwipWidth() As Single
  Dim scw As Long, sch As Long, scm As Integer
  Dim sct As Long, scl As Long
  scm = Form1.ScaleMode
  scw = Form1.ScaleWidth
  sch = Form1.ScaleHeight
  sct = Form1.ScaleTop
  scl = Form1.ScaleLeft
  Form1.ScaleMode = vbPixels
  GetTwipWidth = Form1.ScaleWidth / scw
  Form1.ScaleMode = scm
  Form1.ScaleWidth = scw
  Form1.ScaleHeight = sch
  Form1.ScaleTop = sct
  Form1.ScaleLeft = scl
End Function


' calculates the pixel/twip ratio, since some graphic methods
' need pixel values
Function GetTwipHeight() As Single
  Dim scw As Long, sch As Long, scm As Integer
  Dim sct As Long, scl As Long
  scm = Form1.ScaleMode
  scw = Form1.ScaleWidth
  sch = Form1.ScaleHeight
  sct = Form1.ScaleTop
  scl = Form1.ScaleLeft
  Form1.ScaleMode = vbPixels
  GetTwipHeight = Form1.ScaleHeight / sch
  Form1.ScaleMode = scm
  Form1.ScaleWidth = scw
  Form1.ScaleHeight = sch
  Form1.ScaleTop = sct
  Form1.ScaleLeft = scl
End Function

Private Sub DrawArena()
    If MDIForm1.ZoomLock = 0 Then Exit Sub 'no need to draw boundaries if we aren't going to see them
    Line (0, 0)-(0, 0 + SimOpts.FieldHeight), vbWhite
    Line -(SimOpts.FieldWidth - 0, SimOpts.FieldHeight), vbWhite
    Line -(0 + SimOpts.FieldWidth, 0), vbWhite
    Line -(0, -0), vbWhite
End Sub

' draws rob perimeter
Private Sub DrawRobPer(n As Integer)
  Dim Sides As Integer
  Dim t As Single
  Dim Sdlen As Single
  Dim CentreX As Long
  Dim CentreY As Long
  Dim realX As Long
  Dim realY As Long
  Dim xc As Long
  Dim yc As Long
  Dim radius As Single
  Dim Percent As Single
  Dim botDirection As Integer
  Dim Diameter As Single
  Dim topX As Single
  Dim topY As Single
  
  
 
 ' Sides = rob(n).Shape
 ' If Sides > 0 Then Sdlen = 6.28 / Sides
  CentreX = rob(n).pos.x
  CentreY = rob(n).pos.y
  radius = rob(n).radius
   
  If rob(n).highlight Then Circle (CentreX, CentreY), radius * 1.2, vbYellow
  If n = robfocus Then Circle (CentreX, CentreY), radius * 1.2, vbWhite
 
' If rob(n).flash < 0 Then
'    FillColor = FlashColor(rob(n).flash + 10)
'    rob(n).flash = 0
'  ElseIf rob(n).flash > 0 Then
'    FillColor = vbBlack
'    rob(n).flash = 0
'  Else
    FillColor = BackColor
'  End If
  
      Circle (CentreX, CentreY), rob(n).radius, rob(n).color    'new line
      
    If MDIForm1.displayResourceGuagesToggle = True Then

      If rob(n).nrg > 0.5 Then
        If rob(n).nrg < 32000 Then
          Percent = rob(n).nrg / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.95, vbWhite, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).body > 0.5 Then
        If rob(n).body < 32000 Then
          Percent = rob(n).body / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.9, vbMagenta, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Waste > 0.5 Then
        If rob(n).Waste < 32000 Then
          Percent = rob(n).Waste / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.85, vbGreen, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).venom > 0.5 Then
        If rob(n).venom < 32000 Then
          Percent = rob(n).venom / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.8, vbBlue, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).shell > 0.5 Then
        If rob(n).shell < 32000 Then
          Percent = rob(n).shell / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.75, vbRed, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Slime > 0.5 Then
        If rob(n).Slime < 32000 Then
          Percent = rob(n).Slime / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.7, vbBlack, 0, (Percent * PI * 2#)
      End If
      
       If rob(n).poison > 0.5 Then
        If rob(n).poison < 32000 Then
          Percent = rob(n).poison / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.65, vbYellow, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Vtimer > 0 Then
        Percent = rob(n).Vtimer / 100
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.6, vbCyan, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).chloroplasts > 0 Then 'Panda 8/13/2013 Show how much chloroplasts a robot has
        Percent = rob(n).chloroplasts / 32000
        If Percent > 0.98 Then Percent = 0.98
        Circle (CentreX, CentreY), rob(n).radius * 0.55, vbGreen, 0, (Percent * PI * 2#)
      End If
      
      
    End If
  
End Sub

' draws rob perimeter if in distance
Private Sub DrawRobDistPer(n As Integer)
  Dim CentreX As Long, CentreY As Long
  
  Dim nrgPercent As Single
  Dim bodyPercent As Single
  
  CentreX = rob(n).pos.x
  CentreY = rob(n).pos.y
   
  If rob(n).highlight Then Circle (CentreX, CentreY), RobSize * 2, vbYellow 'new line
  If n = robfocus Then Circle (CentreX, CentreY), RobSize * 2, vbWhite
  
  Form1.FillColor = rob(n).color

 
 ' If Not rob(n).wall Then
    Circle (CentreX, CentreY), rob(n).radius, rob(n).color
 ' Else
 '   Line (rob(n).pos.X, rob(n).pos.Y)-Step(RobSize, RobSize), vbWhite, BF
 ' End If
End Sub

' draws rob aim
Private Sub DrawRobAim(n As Integer)
  Dim x As Long, y As Long
  Dim pos As vector
  Dim pos2 As vector
  Dim vol As vector
  Dim arrow1 As vector
  Dim arrow2 As vector
  Dim arrow3 As vector
  Dim temp As vector
  
  'If Not rob(n).wall And Not rob(n).Corpse Then
  If Not rob(n).Corpse Then
    With rob(n)
  
    'We have to remember that the upper left corner is (0,0)
    pos.x = .aimvector.x
    pos.y = -.aimvector.y
       
    pos2 = VectorAdd(.pos, VectorScalar(VectorUnit(pos), .radius))
    PSet (pos2.x, pos2.y), vbWhite
    
    If MDIForm1.displayMovementVectorsToggle Then
      'Draw the voluntary movement vectors
      If .lastup <> 0 Then
        If .lastup < -1000 Then .lastup = -1000
        If .lastup > 1000 Then .lastup = 1000
        'pos2 = VectorAdd(.pos, VectorScalar(pos, .radius)) 'done above
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastup)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
        
        arrow3 = VectorAdd(vol, VectorScalar(pos, 15)) ' point of the arrowhead
        temp = VectorSet(Cos(.aim - PI / 2), Sin(.aim - PI / 2))
        temp.y = -temp.y
        pos2 = VectorScalar(temp, 10)
        arrow1 = VectorAdd(vol, pos2) ' left side of arrowhead
        arrow2 = VectorSub(vol, pos2) ' right side of arrowhead
        Line (arrow1.x, arrow1.y)-(arrow3.x, arrow3.y), .color
        Line (arrow2.x, arrow2.y)-(arrow3.x, arrow3.y), .color
        Line (arrow1.x, arrow1.y)-(arrow2.x, arrow2.y), .color
      End If
      If .lastdown <> 0 Then
        If .lastdown < -1000 Then .lastdown = -1000
        If .lastdown > 1000 Then .lastdown = 1000
        pos2 = VectorSub(.pos, VectorScalar(pos, .radius))
        vol = VectorSub(pos2, VectorScalar(pos, CSng(.lastdown)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
        
        arrow3 = VectorAdd(vol, VectorScalar(pos, -15)) ' point of the arrowhead
        temp = VectorSet(Cos(.aim - PI / 2), Sin(.aim - PI / 2))
        temp.y = -temp.y
        pos2 = VectorScalar(temp, 10)
        arrow1 = VectorAdd(vol, pos2) ' left side of arrowhead
        arrow2 = VectorSub(vol, pos2) ' right side of arrowhead
        Line (arrow1.x, arrow1.y)-(arrow3.x, arrow3.y), .color
        Line (arrow2.x, arrow2.y)-(arrow3.x, arrow3.y), .color
        Line (arrow1.x, arrow1.y)-(arrow2.x, arrow2.y), .color
      End If
      If .lastleft <> 0 Then
        If .lastleft < -1000 Then .lastleft = -1000
        If .lastleft > 1000 Then .lastleft = 1000
        pos = VectorSet(Cos(.aim - PI / 2), Sin(.aim - PI / 2))
        pos.y = -pos.y
        pos2 = VectorAdd(.pos, VectorScalar(pos, .radius))
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastleft)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
        
        arrow3 = VectorAdd(vol, VectorScalar(pos, 15)) ' point of the arrowhead
        temp = .aimvector
        temp.y = -temp.y
        pos2 = VectorScalar(temp, 10)
        arrow1 = VectorAdd(vol, pos2) ' left side of arrowhead
        arrow2 = VectorSub(vol, pos2) ' right side of arrowhead
        Line (arrow1.x, arrow1.y)-(arrow3.x, arrow3.y), .color
        Line (arrow2.x, arrow2.y)-(arrow3.x, arrow3.y), .color
        Line (arrow1.x, arrow1.y)-(arrow2.x, arrow2.y), .color
      End If
      If .lastright <> 0 Then
        If .lastright < -1000 Then .lastright = -1000
        If .lastright > 1000 Then .lastright = 1000
        pos = VectorSet(Cos(.aim + PI / 2), Sin(.aim + PI / 2))
        pos.y = -pos.y
        pos2 = VectorAdd(.pos, VectorScalar(pos, .radius))
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastright)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
        
        arrow3 = VectorAdd(vol, VectorScalar(pos, 15)) ' point of the arrowhead
        temp = .aimvector
        temp.y = -temp.y
        pos2 = VectorScalar(temp, 10)
        arrow1 = VectorAdd(vol, pos2) ' left side of arrowhead
        arrow2 = VectorSub(vol, pos2) ' right side of arrowhead
        Line (arrow1.x, arrow1.y)-(arrow3.x, arrow3.y), .color
        Line (arrow2.x, arrow2.y)-(arrow3.x, arrow3.y), .color
        Line (arrow1.x, arrow1.y)-(arrow2.x, arrow2.y), .color
      End If
    End If
    End With
  End If
End Sub

' draws skin
Private Sub DrawRobSkin(n As Integer)
  Dim x1 As Integer
  Dim x2 As Integer
  Dim y1 As Integer
  Dim y2 As Integer
  
  If rob(n).Corpse Then Exit Sub
    If rob(n).oaim <> rob(n).aim Then
      Dim t As Integer
      With rob(n)
        .OSkin(0) = (Cos(.Skin(1) / 100 - .aim) * .Skin(0)) * .radius / 60
        .OSkin(1) = (Sin(.Skin(1) / 100 - .aim) * .Skin(0)) * .radius / 60
        PSet (.OSkin(0) + .pos.x, .OSkin(1) + .pos.y)
        For t = 2 To 6 Step 2
          .OSkin(t) = (Cos(.Skin(t + 1) / 100 - .aim) * .Skin(t)) * .radius / 60
          .OSkin(t + 1) = (Sin(.Skin(t + 1) / 100 - .aim) * .Skin(t)) * .radius / 60
          Line -(.OSkin(t) + .pos.x, .OSkin(t + 1) + .pos.y), .color
        Next t
        .oaim = .aim
      End With
    Else
      With rob(n)
        PSet (.OSkin(0) + .pos.x, .OSkin(1) + .pos.y)
        For t = 2 To 6 Step 2
          Line -(.OSkin(t) + .pos.x, .OSkin(t + 1) + .pos.y), .color
        Next t
      End With
    End If
End Sub

' draws ties
Private Sub DrawRobTies(t As Integer, w As Integer, ByVal s As Integer)
  Dim k As Byte
  Dim rp As Integer
  Dim drawsmall As Integer
  Dim CentreX As Single
  Dim CentreY As Single
  Dim CentreX1 As Single
  Dim CentreY1 As Single
  
  drawsmall = w / 4
  If drawsmall = 0 Then drawsmall = 1
  
  k = 1
  With rob(t)
  CentreX = .pos.x
  CentreY = .pos.y
  While .Ties(k).pnt > 0
    If Not .Ties(k).back Then
      rp = .Ties(k).pnt
      CentreX1 = rob(rp).pos.x
      CentreY1 = rob(rp).pos.y
      DrawWidth = drawsmall
      If .Ties(k).last > 0 Then
        If w > 2 Then
          DrawWidth = w
        Else
          DrawWidth = 2
        End If
        Line (CentreX, CentreY)-(CentreX1, CentreY1), .color
      End If
    End If
    k = k + 1
  Wend
  End With
End Sub

' draws ties if ties colouring used
Private Sub DrawRobTiesCol(t As Integer, w As Integer, ByVal s As Integer)
  Dim k As Byte
  Dim col As Long
  Dim rp As Integer
  Dim drawsmall As Integer
  Dim CentreX As Single
  Dim CentreY As Single
  Dim CentreX1 As Single
  Dim CentreY1 As Single
  
  drawsmall = w / 4
  If drawsmall = 0 Then drawsmall = 1
  k = 1
  With rob(t)
  CentreX = .pos.x
  CentreY = .pos.y
  While .Ties(k).pnt > 0
    If Not .Ties(k).back Then
      rp = .Ties(k).pnt
      CentreX1 = rob(rp).pos.x
      CentreY1 = rob(rp).pos.y
      DrawWidth = drawsmall
      col = .color
      If w < 2 Then w = 2
      If .Ties(k).last > 0 Then DrawWidth = w / 2 'size of birth ties
      If .Ties(k).infused Then
        col = vbWhite
        .Ties(k).infused = False
      End If
      If .Ties(k).nrgused Then
        col = vbRed
        .Ties(k).nrgused = False
      End If
      If .Ties(k).sharing Then
        col = vbYellow
        .Ties(k).sharing = False
      End If
      Line (CentreX, CentreY)-(CentreX1, CentreY1), col
      'Line (.x + s, .Y + s)-(rob(rp).x + s, rob(rp).Y + s), col
    End If
    k = k + 1
  Wend
  End With
End Sub

' shots...
Public Sub DrawShots()
  DrawWidth = Int(50 / (ScaleWidth / RobSize) + 1)
  If DrawWidth > 2 Then DrawWidth = 2
  Dim t As Long
  FillStyle = 0
  For t = 1 To maxshotarray
    If Shots(t).flash And MDIForm1.displayShotImpactsToggle Then
       If Shots(t).shottype < 0 And Shots(t).shottype >= -7 Then
        FillColor = FlashColor(Shots(t).shottype + 10)
        Form1.Circle (Shots(t).opos.x, Shots(t).opos.y), 20, FlashColor(Shots(t).shottype + 10)
      Else
        FillColor = vbBlack
        Form1.Circle (Shots(t).opos.x, Shots(t).opos.y), 20, vbBlack
      End If
    ElseIf Shots(t).exist And Shots(t).stored = False Then
      PSet (Shots(t).pos.x, Shots(t).pos.y), Shots(t).color
    End If
  Next t
  FillColor = BackColor
End Sub

' main drawing procedure
Public Sub DrawAllRobs()
  Dim w As Integer
  Dim nd As node
  Dim t As Integer
  Dim s As Integer
  Dim noeyeskin As Boolean
  Dim PixelsPerTwip As Single
  Dim PixRobSize As Integer
  Dim PixBorderSize As Integer
  Dim offset As Single
  Dim halfeyewidth As Single
  Dim visibleLeft As Long
  Dim visibleRight As Long
  Dim visibleTop As Long
  Dim visibleBottom As Long
  Dim low As Single
  Dim highest As Single
  Dim hi As Single
  Dim Length As Single
  Dim a As Integer
  Dim r As Single
  
  visibleLeft = Form1.ScaleLeft
  visibleRight = Form1.ScaleLeft + Form1.ScaleWidth
  visibleTop = Form1.ScaleTop
  visibleBottom = Form1.ScaleTop + Form1.ScaleHeight
 
  
  
  twipWidth = GetTwipWidth
  TwipHeight = GetTwipHeight
  
  FortyEightOverTwipWidth = 48 / twipWidth
  FortyEightOverTwipHeight = 48 / TwipHeight
  
'  PixelsPerTwip = GetTwipWidth
'  PixRobSize = PixelsPerTwip * RobSize
'  PixBorderSize = PixRobSize / 10
'  If PixBorderSize < 1 Then PixBorderSize = 1
  noeyeskin = False
  w = Int(30 / (Form1.visiblew / RobSize) + 1)
  If (Form1.visiblew / RobSize) > 500 Then noeyeskin = True
  DrawMode = 13
  DrawStyle = 0
  DrawWidth = w
  
  If robfocus > 0 And MDIForm1.showVisionGridToggle Then
    
    Length = RobSize * 12
    highest = rob(robfocus).aim + PI / 4
         
    For a = 0 To 8
            
      halfeyewidth = ((rob(robfocus).mem(EYE1WIDTH + a)) Mod 1256) / 400 ' half the eyewidth, thus /400 not /200
      While halfeyewidth > PI - PI / 36: halfeyewidth = halfeyewidth - PI: Wend
      While halfeyewidth < -PI / 36: halfeyewidth = halfeyewidth + PI: Wend
      hi = highest - (PI / 18) * a + ((rob(robfocus).mem(EYE1DIR + a) Mod 1256) / 200) + halfeyewidth  ' Display where the eye is looking
      low = hi - PI / 18 - (2 * halfeyewidth)
      
      While hi > PI * 2: hi = hi - PI * 2: Wend
      While low > PI * 2: low = low - PI * 2: Wend
      While low < 0: low = low + PI * 2: Wend
      While hi < 0: hi = hi + PI * 2: Wend
      
      'a + 1 = eye
      If rob(robfocus).mem(EyeStart + a + 1) > 0 Then
        DrawMode = vbNotMergePen
        'length = (RobSize * 100) / rob(robfocus).mem(EyeStart + a + 1) - RobSize + rob(robfocus).radius + rob(robfocus).radius + 1
  
        Length = (1 / Sqr(rob(robfocus).mem(EyeStart + a + 1))) * (EyeSightDistance(AbsoluteEyeWidth(rob(robfocus).mem(EYE1WIDTH + a)), robfocus) + rob(robfocus).radius) + rob(robfocus).radius ' + rob(robfocus).radius
 '       length = Buckets_Module.eyeDistance(a + 1)
  '      Buckets_Module.eyeDistance(a + 1) = 0
        If Length < 0 Then Length = 0
      Else
        DrawMode = vbCopyPen
        Length = EyeSightDistance(AbsoluteEyeWidth(rob(robfocus).mem(EYE1WIDTH + a)), robfocus) + rob(robfocus).radius + rob(robfocus).radius
      End If
            
      Circle (rob(robfocus).pos.x, rob(robfocus).pos.y), Length, vbCyan, -low, -hi
      
      If (a = Abs(rob(robfocus).mem(FOCUSEYE) + 4) Mod 9) Then
        Circle (rob(robfocus).pos.x, rob(robfocus).pos.y), Length, vbRed, low, hi
      End If
       
    Next a
    
    'Line (rob(robfocus).pos.x, rob(robfocus).pos.y)- _
    '  (rob(robfocus).pos.x + Cos(-rob(robfocus).aim) * length, _
    '  rob(robfocus).pos.y + Sin(-rob(robfocus).aim) * length)
  End If

  
  DrawMode = vbCopyPen
  'DrawWidth = PixBorderSize
  DrawStyle = 0
  
  If noeyeskin Then
    For a = 1 To MaxRobs
      If rob(a).exist Then
        r = rob(a).radius
        If rob(a).pos.x + r > visibleLeft And rob(a).pos.x - r < visibleRight And _
           rob(a).pos.y + r > visibleTop And rob(a).pos.y - r < visibleBottom Then
           DrawRobDistPer a
        End If
      End If
    Next a
  Else
    FillColor = BackColor
    For a = 1 To MaxRobs
      If rob(a).exist Then
         r = rob(a).radius
         If rob(a).pos.x + r > visibleLeft And rob(a).pos.x - r < visibleRight And _
            rob(a).pos.y + r > visibleTop And rob(a).pos.y - r < visibleBottom Then
            DrawRobPer a
         End If
      End If
    Next a
  End If
  
  
  DrawStyle = 0
  If dispskin And Not noeyeskin Then
    For a = 1 To MaxRobs
      If rob(a).exist Then
        If rob(a).pos.x + r > visibleLeft And rob(a).pos.x - r < visibleRight And _
           rob(a).pos.y + r > visibleTop And rob(a).pos.y - r < visibleBottom Then
           DrawRobSkin a
        End If
      End If
    Next a
  End If
  
  DrawWidth = w * 2
  
  If Not noeyeskin Then
    For a = 1 To MaxRobs
     If rob(a).exist Then
       If rob(a).pos.x + r > visibleLeft And rob(a).pos.x - r < visibleRight And _
          rob(a).pos.y + r > visibleTop And rob(a).pos.y - r < visibleBottom Then
          DrawRobAim a
       End If
     End If
    Next a
  End If
  
End Sub

Public Sub DrawAllTies()
  Dim nd As node, t As Integer
  Dim PixelsPerTwip As Single
  Dim PixRobSize As Integer
  Dim visibleLeft As Long
  Dim visibleRight As Long
  Dim visibleTop As Long
  Dim visibleBottom As Long
  
  visibleLeft = Form1.ScaleLeft
  visibleRight = Form1.ScaleLeft + Form1.ScaleWidth
  visibleTop = Form1.ScaleTop
  visibleBottom = Form1.ScaleTop + Form1.ScaleHeight
  
  PixelsPerTwip = GetTwipWidth
  PixRobSize = PixelsPerTwip * RobSize
  
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If rob(t).pos.x > visibleLeft And rob(t).pos.x < visibleRight And _
         rob(t).pos.y > visibleTop And rob(t).pos.y < visibleBottom Then
         DrawRobTiesCol t, PixelsPerTwip * rob(t).radius * 2, rob(t).radius
      End If
    End If
  Next t
End Sub



'''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''
'
'   S Y S T E M
'
'''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''

' changes robot colour
Sub changerobcol()
  ColorForm.setcolor rob(robfocus).color
  rob(robfocus).color = ColorForm.color
End Sub



' counts minutes for autosaves
Private Sub Timer2_Timer()
If lblSaving.Visible Then Exit Sub
  InTimer2 = True
  If SimOpts.AutoSimTime > 0 Then
    minutescount = minutescount + 1
    If minutescount = SimOpts.AutoSimTime Then
      minutescount = 0
      AutoSimNum = AutoSimNum + 1
      If SimOpts.AutoSaveStripMutations Then
        MDIForm1.SaveWithoutMutations = True
      Else
        MDIForm1.SaveWithoutMutations = False
      End If
      SaveSimulation MDIForm1.MainDir + "/autosave/" + SimOpts.AutoSimPath + CStr(AutoSimNum) + ".sim"
      If SimOpts.AutoSaveDeleteOlderFiles Then
        If AutoSimNum > 10 Then
          Dim fso As New FileSystemObject
          Dim fileToDelete As file
          On Error GoTo bypass
          Set fileToDelete = fso.GetFile(MDIForm1.MainDir + "/autosave/" + SimOpts.AutoSimPath + CStr(AutoSimNum - 10) + ".sim")
          fileToDelete.Delete
bypass:
        End If
      End If
    End If
  End If
  If SimOpts.AutoRobTime > 0 Then
    robminutescount = robminutescount + 1
    If robminutescount = SimOpts.AutoRobTime Then
      robminutescount = 0
      AutoRobNum = AutoRobNum + 1
      SaveOrganism MDIForm1.MainDir + "/autosave/" + SimOpts.AutoRobPath + CStr(AutoRobNum) + ".dbo", fittest()
      If SimOpts.AutoSaveDeleteOldBotFiles Then
        If AutoRobNum > 10 Then
          Dim fso2 As New FileSystemObject
          Dim fileToDelete2 As file
          On Error GoTo bypass2
          Set fileToDelete2 = fso2.GetFile(MDIForm1.MainDir + "/autosave/" + SimOpts.AutoRobPath + CStr(AutoRobNum - 10) + ".dbo")
          fileToDelete2.Delete
bypass2:
        End If
      End If
    End If
  End If
   InTimer2 = False
End Sub

' initializes a simulation.
Sub StartSimul()
   'Botsareus 5/8/2013 save the safemode for 'start new'
   optionsform.savesett MDIForm1.MainDir + "\settings\lastran.set" 'Botsareus 5/3/2013 Save the lastran setting

  'lets reset the autosafe data
    Open App.path & "\autosaved.gset" For Output As #1
      Write #1, False
    Close #1

Form1.camfix = False 'Botsareus 2/23/2013 When simulation starts the screen is normailized

MDIForm1.visualize = True 'Botsareus 8/31/2012 reset vedio tuggle button
MDIForm1.menuupdate

'  If SimOpts.UserSeedToggle = True Then 'Botsareus 5/3/2013 Replaced by safemode
    Rnd -1
    Randomize SimOpts.UserSeedNumber / 100
'  Else
'    Randomize Timer
'  End If

    'Botsareus 5/5/2013 Update the system that the sim is running
  
    Open App.path & "\Safemode.gset" For Output As #1
      Write #1, True
    Close #1
  
    'Botsareus 4/27/2013 Create Simulation's skin
    Dim tmphsl As H_S_L
    tmphsl.h = Int(Rnd * 240)
    tmphsl.s = Int(Rnd * 60) + 180
    tmphsl.l = 222 + Int(Rnd * 2) * 6
    Dim tmprgb As R_G_B
    tmprgb = hsltorgb(tmphsl)
    chartcolor = RGB(tmprgb.r, tmprgb.g, tmprgb.b)
    tmphsl.l = tmphsl.l - 195
    tmprgb = hsltorgb(tmphsl)
    backgcolor = RGB(tmprgb.r, tmprgb.g, tmprgb.b)
    'Botsareus 6/8/2013 Overwrite skin as nessisary
    If UseOldColor Then
        chartcolor = vbWhite
        backgcolor = &H400000
    End If
  
  SimOpts.SimGUID = CLng(Rnd)
  Over = False
  
  'LoadSysVars
  LoadLists
  
  If BackPic <> "" Then
    Form1.Picture = LoadPicture(BackPic)
  Else
    Form1.Picture = Nothing
  End If
  
  Form1.Show
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
  Form1.visiblew = SimOpts.FieldWidth
  Form1.visibleh = SimOpts.FieldHeight
  xDivisor = 1
  yDivisor = 1
  
  If SimOpts.FieldWidth > 32000 Then xDivisor = SimOpts.FieldWidth / 32000
  If SimOpts.FieldHeight > 32000 Then yDivisor = SimOpts.FieldHeight / 32000
  
  
  MDIForm1.DontDecayNrgShots.Checked = SimOpts.NoShotDecay
  MDIForm1.DontDecayWstShots.Checked = SimOpts.NoWShotDecay
  
  MDIForm1.DisableTies.Checked = SimOpts.DisableTies
  MDIForm1.DisableArep.Checked = SimOpts.DisableTypArepro
  
  
  
  'SimOpts.MutCurrMult = 1 'EricL 4/1/2006 Commented out as it was overriding saved values
  'SimOpts.TotRunCycle = -1 'EricL 4/7/2006 Now initialized in Options Dialog Start New button Click
  SimOpts.TotBorn = 0
  grafico.ResetGraph
  'Active = True
  MaxMem = 1000
  maxfieldsize = SimOpts.FieldWidth * 2
  robfocus = 0
  MDIForm1.DisableRobotsMenu
  nlink = RobSize
  klink = 0.01
  plink = 0.1
  mlink = RobSize * 1.5
  
  'EricL - This is used in Shot collision as a fast way to weed out bots that could not possibily have collided with a shot
  'this cycle.  It is the maximum possible distance a bot center can be from a shot and still have had the shot impact.
  'This is the case where the bot and shot are traveling at maximum velocity in opposite directions and the shot just
  'grazes the edge of the bot.  If the shot was just about to hit the bot at the end of the last cycle, then it's distance at
  'the end of this cycle will be the hypotinose (sp?) of a right triangle C where side A is the miximum possible bot radius, and
  'side B is the sum of the maximum bot velocity and the maximum shot velocity, the latter of which can be robsize/3 + the bot
  'max velocity since bot velocity is added to shot velocity.
  MaxBotShotSeperation = Sqr((FindRadius(32000) ^ 2) + ((SimOpts.MaxVelocity * 2 + RobSize / 3) ^ 2))
  
  Dim t As Integer
  
  ReDim rob(500)
  
  For t = 1 To 500
    rob(t).exist = False
    rob(t).virusshot = 0
  Next t
  MaxRobs = 0
  Init_Buckets
  ReDim Shots(50)
  maxshotarray = 50
  shotpointer = 1
  
  For t = 1 To maxshotarray
    Shots(t).exist = False
    Shots(t).flash = False
    Shots(t).stored = False
  Next t
  
  For t = 1 To MAXOBSTACLES
    Obstacles.Obstacles(t).exist = False
  Next t
  numObstacles = 0
  
 ' SimOpts.shapeDriftRate = 5
 ' SimOpts.makeAllShapesBlack = False
 ' SimOpts.makeAllShapesTransparent = False
  defaultWidth = 0.2
  defaultHeight = 0.2
  
  'Egrid Stuff
  'InitEGrid
       
  MaxRobs = 0
 ' maxshots = 0
 ' MaxAbsNum = 0
  loadrobs
  If Form1.Active Then Timer2.Enabled = True
  If Form1.Active Then SecTimer.Enabled = True
  SimOpts.TotRunTime = 0
  setfeed
  If MDIForm1.visualize Then DrawAllRobs
  MDIForm1.enablesim
  If SimOpts.DBEnable Then
    CreateArchive SimOpts.DBName
    OpenDB SimOpts.DBName
  End If
  
  If ContestMode Then
     FindSpecies
     F1count = 0
  End If

  If SimOpts.MaxEnergy > 5000 Then
    If MsgBox("Your nrg allotment is set to" + Str(SimOpts.MaxEnergy) + ".  A correct value " + _
              "is in the neighborhood of about 10 or so.  Do you want to change your energy allotment " + _
              "to 10?", vbYesNo, "Energy allotment suspicously high.") = vbYes Then
        SimOpts.MaxEnergy = 10
    End If
  End If
 ' MDIForm1.ZoomOut
 
  strSimStart = Replace(Replace(Now, ":", "-"), "/", "-")
  
  'Botsareus 1/5/2014 The Obstacle Regeneration code
  
  Dim o As Integer
  Dim oo As Integer
For o = 1 To UBound(xObstacle)
If xObstacle(o).exist Then
With xObstacle(o)
    oo = NewObstacle(.pos.x * SimOpts.FieldWidth, .pos.y * SimOpts.FieldHeight, .Width * SimOpts.FieldWidth, .Height * SimOpts.FieldHeight)
    Obstacles.Obstacles(oo).color = xObstacle(o).color
    Obstacles.Obstacles(oo).vel = xObstacle(o).vel
End With
End If
Next
  
  'sim running

  main
  
End Sub

' same, but for a loaded sim
Sub startloaded()
 Dim t As Integer
 
  If tmpseed <> 0 Then
   SimOpts.UserSeedNumber = tmpseed
   TmpOpts.UserSeedNumber = tmpseed
   'Botsareus 5/8/2013 save the safemode for 'load sim'
   optionsform.savesett MDIForm1.MainDir + "\settings\lastran.set" 'Botsareus 5/3/2013 Save the lastran setting
  End If
  
    'lets reset the autosafe data
    Open App.path & "\autosaved.gset" For Output As #1
      Write #1, False
    Close #1
  
    
  'If SimOpts.UserSeedToggle = True Then 'Botsareus 5/3/2013 Replaced by safemode
    Rnd -1
    Randomize SimOpts.UserSeedNumber / 100
  'Else
  '  Randomize Timer
  'End If
  
    'Botsareus 5/5/2013 Update the system that the sim is running
  
    Open App.path & "\Safemode.gset" For Output As #1
      Write #1, True
    Close #1
  
    'Botsareus 4/27/2013 Create Simulation's skin
    Dim tmphsl As H_S_L
    tmphsl.h = Int(Rnd * 240)
    tmphsl.s = Int(Rnd * 60) + 180
    tmphsl.l = 222 + Int(Rnd * 2) * 6
    Dim tmprgb As R_G_B
    tmprgb = hsltorgb(tmphsl)
    chartcolor = RGB(tmprgb.r, tmprgb.g, tmprgb.b)
    tmphsl.l = tmphsl.l - 195
    tmprgb = hsltorgb(tmphsl)
    backgcolor = RGB(tmprgb.r, tmprgb.g, tmprgb.b)
    'Botsareus 6/8/2013 Overwrite skin as nessisary
    If UseOldColor Then
        chartcolor = vbWhite
        backgcolor = &H400000
    End If
  
  Init_Buckets
  
  If BackPic <> "" Then 'Botsareus 3/15/2013 No more screensaver code (was broken)
    Form1.Picture = LoadPicture(BackPic)
  Else
    Form1.Picture = Nothing
  End If
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
  Form1.visiblew = SimOpts.FieldWidth
  Form1.visibleh = SimOpts.FieldHeight
  
  xDivisor = 1
  yDivisor = 1
  If SimOpts.FieldWidth > 32000 Then xDivisor = SimOpts.FieldWidth / 32000
  If SimOpts.FieldHeight > 32000 Then yDivisor = SimOpts.FieldHeight / 32000
  
  MDIForm1.visualize = True
  Active = True
  MaxMem = 1000
  maxfieldsize = SimOpts.FieldWidth * 2
  robfocus = 0
  MDIForm1.DisableRobotsMenu
  'SimOpts.MutCurrMult = 1
  nlink = RobSize
  klink = 0.01
  plink = 0.1
  mlink = RobSize * 1.5
  
  'EricL - This is used in Shot collision as a fast way to weed out bots that could not possibily have collided with a shot
  'this cycle.  It is the maximum possible distance a bot center can be from a shot and still have had the shot impact.
  'This is the case where a bot with 32000 body and a shot are traveling at maximum velocity in opposite directions and the shot just
  'grazes the edge of the bot.  If the shot was just about to hit the bot at the end of the last cycle, then it's distance at
  'the end of this cycle will be the hypotinoose (sp?) of a right triangle ABC where side A is the maximum possible bot radius, and
  'side B is the sum of the maximum bot velocity and the maximum shot velocity, the latter of which can be robsize/3 + the bot
  'max velocity since bot velocity is added to shot velocity.
  MaxBotShotSeperation = Sqr((FindRadius(32000) ^ 2) + ((SimOpts.MaxVelocity * 2 + RobSize / 3) ^ 2))
  
  'maxshotarray = 50
  'ReDim Shots(maxshotarray)
  shotpointer = 1
  
  'For t = 1 To maxshotarray
  '  Shots(t).exist = False
  '  Shots(t).flash = False
  '  Shots(t).stored = False
  'Next t
  
  
  'For t = 1 To MaxRobs
  '  rob(t).virusshot = 0
  'Next t
  'For t = 1 To MAXOBSTACLES
  '  Obstacles.Obstacles(t).exist = False
  'Next t
  
'  SimOpts.shapeDriftRate = 5
'  SimOpts.makeAllShapesBlack = False
'  SimOpts.makeAllShapesTransparent = False
  defaultWidth = 0.2
  defaultHeight = 0.2
    
  MDIForm1.DontDecayNrgShots.Checked = SimOpts.NoShotDecay
  MDIForm1.DontDecayWstShots.Checked = SimOpts.NoWShotDecay
  
  MDIForm1.DisableTies.Checked = SimOpts.DisableTies
  MDIForm1.DisableArep.Checked = SimOpts.DisableTypArepro
    
  Timer2.Enabled = True
  SecTimer.Enabled = True
  setfeed
  If MDIForm1.visualize Then DrawAllRobs
  MDIForm1.enablesim
  Me.Visible = True
  
  NoDeaths = True
  
  'Egrid Stuff
  'InitEGrid
  
  'Vegs.cooldown = 0
  Vegs.cooldown = -SimOpts.RepopCooldown
  totnvegsDisplayed = -1 ' Just set this to -1 for the first cycle so the cost low water mark doesn't trigger.
  totvegs = -1 ' Set to -1 to avoid veggy reproduction on first cycle
  totnvegs = SimOpts.Costs(DYNAMICCOSTTARGET) ' Just set this high for the first cycle so the cost low water mark doesn't trigger.
'  MDIForm1.ZoomOut

  main
End Sub

' loads robot DNA at the beginning of a simulation
Private Sub loadrobs()
  Dim k As Integer
  Dim a As Integer
  Dim i As Integer
  Dim cc As Integer, t As Integer
  k = 0
  For cc = 1 To SimOpts.SpeciesNum
    For t = 1 To SimOpts.Specie(k).qty
      a = RobScriptLoad(respath(SimOpts.Specie(k).path) + "\" + SimOpts.Specie(k).Name)
      If a < 0 Then
        t = SimOpts.Specie(k).qty
        SimOpts.Specie(k).Native = False
        GoTo bypassThisSpecies
      Else
        SimOpts.Specie(k).Native = True
      End If
      rob(a).Veg = SimOpts.Specie(k).Veg
      rob(a).Fixed = SimOpts.Specie(k).Fixed
      If rob(a).Fixed Then rob(a).mem(216) = 1
      rob(a).pos.x = Random(SimOpts.Specie(k).Poslf * CSng(SimOpts.FieldWidth - 60#), SimOpts.Specie(k).Posrg * CSng(SimOpts.FieldWidth - 60#))
      rob(a).pos.y = Random(SimOpts.Specie(k).Postp * CSng(SimOpts.FieldHeight - 60#), SimOpts.Specie(k).Posdn * CSng(SimOpts.FieldHeight - 60#))
      
      rob(a).nrg = SimOpts.Specie(k).Stnrg
      rob(a).body = 1000

      rob(a).radius = FindRadius(rob(a).body)
      rob(a).mem(468) = 32000
      rob(a).mem(SetAim) = rob(a).aim * 200
      If rob(a).Veg Then rob(a).chloroplasts = StartChlr 'Botsareus 2/12/2014 Start a robot with chloroplasts
      rob(a).Dead = False
      If rob(a).Shape = 0 Then
        rob(a).Shape = Random(3, 5)
      End If
            
      rob(a).Mutables = SimOpts.Specie(k).Mutables
      
      For i = 0 To 7 'Botsareus 5/20/2012 fix for skin engine
        rob(a).Skin(i) = SimOpts.Specie(k).Skin(i)
      Next i
      
      rob(a).color = SimOpts.Specie(k).color
      rob(a).mem(timersys) = Random(-32000, 32000)
      rob(a).CantSee = SimOpts.Specie(k).CantSee
      rob(a).DisableDNA = SimOpts.Specie(k).DisableDNA
      rob(a).DisableMovementSysvars = SimOpts.Specie(k).DisableMovementSysvars
      rob(a).CantReproduce = SimOpts.Specie(k).CantReproduce
      rob(a).VirusImmune = SimOpts.Specie(k).VirusImmune
      rob(a).virusshot = 0
      rob(a).Vtimer = 0
      rob(a).genenum = CountGenes(rob(a).DNA)
      
      rob(a).DnaLen = DnaLen(rob(a).DNA())
      rob(a).GenMut = rob(a).DnaLen / GeneticSensitivity 'Botsareus 4/9/2013 automatically apply genetic to inserted robots
      
      rob(a).mem(DnaLenSys) = rob(a).DnaLen
      rob(a).mem(GenesSys) = rob(a).genenum
    Next t
bypassThisSpecies:
    k = k + 1
  Next cc
End Sub

' calls main form status bar update
Public Sub cyccaption(ByVal num As Single)
  MDIForm1.infos num, TotalRobotsDisplayed, totnvegsDisplayed, TotalChlr, SimOpts.TotBorn, SimOpts.TotRunCycle, SimOpts.TotRunTime  'Botsareus 8/25/2013 Mod to send TotalChlr
End Sub

' calculates the total number of robots
Private Function totrobs() As Integer
  totrobs = 0
  Dim t As Integer
  For t = 1 To MaxRobs
    If rob(t).exist Then
      totrobs = totrobs + 1
    End If
  Next t
End Function

' transfers focus to the parent robot
Sub parentfocus()
  Dim t As Integer
  For t = 1 To MaxRobs
    If rob(robfocus).parent = rob(t).AbsNum And rob(t).exist = True Then robfocus = t
  Next t
End Sub

' which rob has been clicked?
Private Function whichrob(x As Single, y As Single) As Integer
  Dim dist As Double, pist As Double
  Dim t As Integer
  whichrob = 0
  dist = 10000
  Dim nd As node
  For t = 1 To MaxRobs
    If rob(t).exist Then
      pist = Abs(rob(t).pos.x - x) ^ 2 + Abs(rob(t).pos.y - y) ^ 2
      If Abs(rob(t).pos.x - x) < rob(t).radius And Abs(rob(t).pos.y - y) < rob(t).radius And pist < dist And rob(t).exist Then
        whichrob = t
        dist = pist
      End If
    End If
  Next t
End Function

' stuff for clicking, dragging, etc
' move+click: drags robot if one selected, else drags screen
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim st As Long
  Dim sl As Long
  Dim vsv As Long
  Dim hsv As Long
  Dim t As Byte
  Dim vel As vector
  
  visibleh = Int(Form1.ScaleHeight)
  If Button = 0 Then
    MouseClickX = x
    MouseClickY = y
  End If
  
  If Button = 1 And Not MDIForm1.insrob And obstaclefocus = 0 And teleporterFocus = 0 Then
    If MouseClicked Then
      st = ScaleTop + MouseClickY - y
      sl = ScaleLeft + MouseClickX - x
      If st < 0 And MDIForm1.ZoomLock.value = 0 Then
        st = 0
        MouseClickY = y
      End If
      If sl < 0 And MDIForm1.ZoomLock.value = 0 Then
        sl = 0
        MouseClickX = x
      End If
      If st > SimOpts.FieldHeight - visibleh And MDIForm1.ZoomLock.value = 0 Then
        st = SimOpts.FieldHeight - visibleh
      End If
      If sl > SimOpts.FieldWidth - visiblew And MDIForm1.ZoomLock.value = 0 Then
        sl = SimOpts.FieldWidth - visiblew
      End If
      Form1.ScaleTop = st
      Form1.ScaleLeft = sl
      Form1.Refresh
      Redraw
      Form1.Refresh
    End If
  End If
  
  If Button = 1 And robfocus > 0 And DraggingBot Then
    vel = VectorSub(rob(robfocus).pos, VectorSet(x, y))
    rob(robfocus).pos = VectorSet(x, y)
    rob(robfocus).vel = VectorSet(0, 0)
    Dim a As Byte
    For a = 1 To tmprob_c
        rob(tmppos(a).n).pos = VectorSet(x - tmppos(a).x, y - tmppos(a).y)
        rob(tmppos(a).n).vel = VectorSet(0, 0)
    Next
    If Not Active Then Redraw
  End If
  
  If Button = 1 And obstaclefocus > 0 Then
  ' Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.x), y - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.y))
   Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (Obstacles.Obstacles(obstaclefocus).Width / 2), y - (Obstacles.Obstacles(obstaclefocus).Height / 2))
    If Not Active Then Redraw
  End If
  
  If Button = 1 And teleporterFocus > 0 Then
  ' Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.x), y - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.y))
   Teleport.Teleporters(teleporterFocus).pos = VectorSet(x - (Teleport.Teleporters(teleporterFocus).Width / 2), y - (Teleport.Teleporters(teleporterFocus).Height / 2))
    If Not Active Then Redraw
  End If
  
 ' If GetInputState() <> 0 Then DoEvents
End Sub

' it seems that there's no simple way to know the mouse status
' outside of a Form event. So I've used the event to switch
' on and off some global vars
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If lblSafeMode.Visible Then Exit Sub 'Botsareus 5/13/2013 Safemode restrictions
  
  MouseClicked = False
  MousePointer = 0
  ZoomFlag = False ' EricL - stop zooming in!
  DraggingBot = False
End Sub

Private Sub Form_Resize()
  If Form1.WindowState = 2 Then
    SimOpts.FieldWidth = Form1.ScaleWidth
    SimOpts.FieldHeight = Form1.ScaleHeight
    maxfieldsize = SimOpts.FieldWidth * 2
  End If
End Sub

' double clicking on a rob pops up the info window
' elsewhere closes it
Private Sub Form_DblClick()
'elcrasho = 50 'Botsareudnotdone debug only

  Dim n As Integer
  Dim m As Integer
  n = whichrob(CSng(MouseClickX), CSng(MouseClickY))
  If n = 0 Then
    m = whichTeleporter(CSng(MouseClickX), CSng(MouseClickY))
  End If
  If n > 0 Then
    robfocus = n
    MDIForm1.EnableRobotsMenu
    If Not rob(n).highlight Then deletemark
    datirob.Visible = True
    datirob.RefreshDna
    datirob.ZOrder
    datirob.infoupdate n, rob(n).nrg, rob(n).parent, rob(n).Mutations, rob(n).age, rob(n).SonNumber, 1, rob(n).FName, rob(n).genenum, rob(n).LastMut, rob(n).generation, rob(n).DnaLen, rob(n).LastOwner, rob(n).Waste, rob(n).body, rob(n).mass, rob(n).venom, rob(n).shell, rob(n).Slime, rob(n).chloroplasts
  ElseIf m > 0 Then
    TeleportForm.teleporterFormMode = 1
    TeleportForm.Show
  Else
    datirob.Form_Unload 0
    robfocus = 0
    MDIForm1.DisableRobotsMenu
    If ActivForm.Visible Then ActivForm.NoFocus
  End If
End Sub

' clicking outside robots closes info window
' mind the walls tool
Private Sub Form_Click()
If lblSafeMode.Visible Then Exit Sub 'Botsareus 5/13/2013 Safemode restrictions

  Dim n As Integer
  Dim m As Integer
   
  'LogForm.Visible = False
  n = whichrob(CSng(MouseClickX), CSng(MouseClickY))
   
  'Click on teleporter unless its the internet mode teleporter.
  If n = 0 Then
    m = whichTeleporter(CSng(MouseClickX), CSng(MouseClickY))
    If m <> 0 And Teleporters(m).Internet = False Then
      teleporterFocus = m
      'MDIForm1.DeleteTeleporter.Enabled = True
    End If
  End If
  
  If n = 0 And m = 0 Then
    m = whichobstacle(CSng(MouseClickX), CSng(MouseClickY))
    If m <> 0 Then
      obstaclefocus = m
      MDIForm1.DeleteShape.Enabled = True
    End If
  End If
  
  If n = 0 And m = 0 Then
    'datirob.Form_Unload 0 Botsareus 12/12/2012 Info form does not auto hide
    robfocus = 0
    MDIForm1.DisableRobotsMenu
    If ActivForm.Visible Then ActivForm.NoFocus
  End If
End Sub


'Botsareus 11/29/2013 You can now move whole organism
Private Sub gen_tmp_pos_lst()
Dim a As Integer
Dim rst As Boolean
rst = True
tmprob_c = 0
    For a = 1 To MaxRobs
      If rob(a).exist And rob(a).highlight Then
        If a = robfocus Then rst = False
        tmprob_c = tmprob_c + 1
        If tmprob_c < 51 Then
            tmppos(tmprob_c).n = a
            tmppos(tmprob_c).x = rob(robfocus).pos.x - rob(a).pos.x
            tmppos(tmprob_c).y = rob(robfocus).pos.y - rob(a).pos.y
        Else
            tmprob_c = 50
        End If
      End If
    Next a
If rst Then tmprob_c = 0
End Sub

' clicking (well, half-clicking) on a robot selects it
' clicking outside can add a robot if we're in robot insertion
' mode.
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If lblSafeMode.Visible Then Exit Sub 'Botsareus 5/13/2013 Safemode restrictions

  Dim n As Integer
  Dim k As Integer
  Dim m As Integer
  
  'EricL - Zooms in on the position of the mouse when the scroll button is held.
  If Button = 4 Then
    ZoomFlag = True
    While ZoomFlag = True
      If Form1.visiblew > 100 And Form1.visibleh > 100 Then
        Form1.visiblew = Form1.visiblew / 1.05
        Form1.visibleh = Form1.visibleh / 1.05
        Form1.ScaleHeight = Form1.visibleh
        Form1.ScaleWidth = Form1.visiblew
        Form1.ScaleTop = y - Form1.ScaleHeight / 2
        Form1.ScaleLeft = x - Form1.ScaleWidth / 2
      End If
        Form1.Redraw
        DoEvents
     Wend
  End If
    
  n = whichrob(x, y)
  
  If n = 0 Then
    DraggingBot = False
    If Not Form1.SecTimer.Enabled Then datirob.Visible = False 'Botsareus 1/5/2013 Small fix to do with wrong data displayed in robot info, auto hide the window
  Else
    DraggingBot = True
    gen_tmp_pos_lst
  End If
  
  If n = 0 Then
    teleporterFocus = whichTeleporter(x, y)
    If teleporterFocus <> 0 Then
      'MDIForm1.DeleteTeleporter.Enabled = True
      mousepos = VectorSet(x, y)
    Else
     ' MDIForm1.DeleteTeleporter.Enabled = False
    End If
  End If
  
  If n = 0 And teleporterFocus = 0 Then
    obstaclefocus = whichobstacle(x, y)
    If obstaclefocus <> 0 Then
      MDIForm1.DeleteShape.Enabled = True
      mousepos = VectorSet(x, y)
    Else
      MDIForm1.DeleteShape.Enabled = False
    End If
  End If
  
  If Button = 2 Then
    robfocus = n
    If n > 0 Then
      MDIForm1.PopupMenu MDIForm1.popup
      MDIForm1.EnableRobotsMenu
    End If
  End If
  
  If n > 0 Then
    robfocus = n
    MDIForm1.EnableRobotsMenu
    If Not rob(n).highlight Then deletemark
  End If
  
  If n = 0 And Button = 1 And MDIForm1.insrob Then
    k = 0
    While SimOpts.Specie(k).Name <> "" And SimOpts.Specie(k).Name <> MDIForm1.Combo1.text
      k = k + 1
    Wend
    
    If SimOpts.Specie(k).path = "Invalid Path" Then
      MsgBox ("The path for this robot is invalid.")
    'ElseIf Not SimOpts.Specie(k).Native Then
    '   MsgBox ("Sorry, but you can't insert a species which did not originate in this simulation.")
    Else
      aggiungirob k, x, y
    End If
  End If
  
  If Button = 1 And Not MDIForm1.insrob And n = 0 Then
    MouseClicked = True
  End If
  
  Redraw
 
End Sub

' deletes the yellow highlight mark around robots
Private Sub deletemark()
  Dim t As Integer
  For t = 1 To MaxRobs
    rob(t).highlight = False
  Next t
End Sub

Public Sub MouseWheelZoom()
  MsgBox "MouseWheel!"
End Sub


Sub Form_Unload(Cancel As Integer)
  Dim t As Byte
    
  If SimOpts.TotRunTime <> 0 Then
    Debug.Print SimOpts.TotRunCycle, SimOpts.TotRunTime, SimOpts.TotRunCycle / SimOpts.TotRunTime
  End If
End Sub

' seconds timer, used to periodically check _cycles_ counters
' expecially for internet transfers
' tricky!
Private Sub SecTimer_Timer()

  If Enabled = False Then Exit Sub '9/7/2013 Do not count the timer if form is disabled

  Static TenSecondsAgo(10) As Long
  'Static SumOfLastTenSeconds As Long
'  Static SecondLastCycle As Long
  Static LastDownload As Long
  Static LastMut As Long
  Static MutPhase As Integer
  Static LastShuffle As Long
  Dim TitLog As String
  Dim t As Integer
  Dim i As Integer
  
  SimOpts.TotRunTime = SimOpts.TotRunTime + 1

  ' reset counters if simulation restarted
  If SimOpts.TotRunTime = 1 Then
    For i = 0 To 9
      TenSecondsAgo(i) = SimOpts.TotRunCycle
    Next i
    ' reset the counter for horiz/vertical shuffle
    LastShuffle = 0
  End If
  
  ' same as above, but checking totruncycle<lastcycle instead
  If SimOpts.TotRunCycle < TenSecondsAgo((SimOpts.TotRunTime + 9) Mod 10) Then
    For i = 0 To 9
      TenSecondsAgo(i) = SimOpts.TotRunCycle
    Next i
    LastShuffle = 0
  End If
  
  ' if we've had 5000 cycles in a second, probably we've
  ' loaded a saved sim. So we need to reset some counters
  If SimOpts.TotRunCycle - TenSecondsAgo((SimOpts.TotRunTime + 9) Mod 10) > 5000 Then
    For i = 0 To 9
      TenSecondsAgo(i) = SimOpts.TotRunCycle
    Next i
    ' facciamo avvenire uno shuffle fra 50000 cicli
    LastShuffle = SimOpts.TotRunCycle - 50000
  End If
  
  ' update status bar in MDI formMod
  
  TenSecondsAgo(SimOpts.TotRunTime Mod 10) = SimOpts.TotRunCycle
  SimOpts.CycSec = CSng(CSng(CSng(SimOpts.TotRunCycle) - CSng(TenSecondsAgo((SimOpts.TotRunTime + 1) Mod 10))) * 0.1)
  
  'Botsareus 6/5/2013 pipe code work in progress
  '12/28/2013 Disabled for possible causing overflows
'  If InternetMode.Visible = True Then
'    Dim Request() As Byte
'    Dim Response() As Byte
'    Request = "{ ""Population"":""" & CStr(TotalRobotsDisplayed) & """, ""CyclesPerSecond"":""" & CStr(SimOpts.CycSec) & ","" ""Size"":""" & CStr(SimOpts.FieldHeight * SimOpts.FieldWidth) & """, ""MutationRate"":""" & CStr(SimOpts.MutCurrMult) & """ }"
'    ReDim Response(0)
'    PipeRPC1.PipeCall Request, Response
'  End If
  
  cyccaption SimOpts.CycSec

  '(provides the mutation rates oscillation Botsareus 8/3/2013 moved to UpdateSim)
    
  'Botsareus 7/13/2012 calls update function for main icon menu
  MDIForm1.menuupdate
End Sub

'Botsareus 7/6/2013 Hide or show graphs
Sub hide_graphs()
Dim i As Byte
For i = 1 To NUMGRAPHS
  If Not (Charts(i).graf Is Nothing) Then
   If Charts(i).graf.Visible Then
   SetWindowPos Charts(i).graf.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
   End If
  End If
Next i
End Sub
Sub show_graphs()
Dim i As Byte
For i = 1 To NUMGRAPHS
  If Not (Charts(i).graf Is Nothing) Then
   If Charts(i).graf.Visible Then
    SetWindowPos Charts(i).graf.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
   End If
  End If
Next i
End Sub

Function calc_graphs() As String
Dim lg As String
Dim i As Byte
For i = 1 To NUMGRAPHS
  If Not (Charts(i).graf Is Nothing) Then
   If Charts(i).graf.Visible Then
    lg = lg & vbCrLf & Charts(i).graf.Caption
   End If
  End If
Next i
calc_graphs = lg
End Function


' main procedure. Oh yes!
Private Sub main()
  Dim clocks As Long
  Dim i As Integer
  Dim b As Integer
  
  'clocks = GetTickCount
  Do
    If Active Then
      
      If MDIForm1.ignoreerror = True Then
        On Error Resume Next
      Else
        'On Error GoTo SaveError  'EricL - Uncomment this line in compiled version! error.sim
      End If
      
      Form1.SecTimer.Enabled = True
           
      UpdateSim
      MDIForm1.Follow ' 11/29/2013 zoom follow selected robot
      
      If StartAnotherRound Then Exit Sub
      
      ' redraws all:
      If MDIForm1.visualize Then
        Form1.Label1.Visible = False
        If Not MDIForm1.oneonten Then
          Redraw
        Else
          If SimOpts.TotRunCycle Mod 10 = 0 Then Redraw
        End If
      End If
      
    
      If datirob.Visible And Not datirob.ShowMemoryEarlyCycle Then
        With rob(robfocus)
          datirob.infoupdate robfocus, .nrg, .parent, .Mutations, .age, .SonNumber, 1, .FName, .genenum, .LastMut, .generation, .DnaLen, .LastOwner, .Waste, .body, .mass, .venom, .shell, .Slime, .chloroplasts
        End With
      End If
            
      ' feeds graphs with data:
      If SimOpts.TotRunCycle Mod SimOpts.chartingInterval = 0 Then
        For i = 1 To NUMGRAPHS
          If Not (Charts(i).graf Is Nothing) Then
           If Charts(i).graf.Visible Then  'Botsareus 2/23/2013 Do not update chart if invisable
            FeedGraph i
           End If
          End If
        Next i
      End If
    End If
    DoEvents
    If MDIForm1.limitgraphics = True Then
      clocks = GetTickCount
      If (GetTickCount - clocks) < 67 Then
        While (GetTickCount - clocks < 67)
            
        Wend
      End If
    End If
    
    If Not camfix Then
        MDIForm1.fixcam 'Botsareus 2/23/2013 normalizes screen
        camfix = True
        Form1.Active = Not pausefix 'Botsareus 3/6/2013 allowes starting a simulation paused
        Form1.SecTimer.Enabled = Not pausefix
    End If
  Loop
  Exit Sub
  
SaveError:
  MsgBox "Error. " + Err.Description + ".  Saving sim in saves directory as error.sim"
  
tryagain:
  On Error GoTo missingdir
  SaveSimulation MDIForm1.MainDir + "\saves\error.sim"
missingdir:
 If Err.Number = 76 Then
    b = MsgBox("Cannot find the Saves Directory to save error.sim.  " + vbCrLf + _
            "Would you like me to create one?   " + vbCrLf + vbCrLf + _
            "If this is a new install, choose OK.", vbOKCancel + vbQuestion)
    If b = vbOK Then
       MkDir (MDIForm1.MainDir + "\saves")
       GoTo tryagain
    Else
      MsgBox ("Exiting without saving error.sim.")
    End If
  End If
  
  Erase rob
  Erase Shots
  End
End Sub

'
' M A N A G E M E N T   A N D   R E P R O D U C T I O N
'

'should remove highlight on a robot whenever the simulation is restarted after a pause
Public Sub unfocus()
  Dim t As Integer
  For t = 1 To MaxRobs
    rob(t).highlight = False
  Next t
End Sub


'
'   S E R V I C E S
'

' initializes a new graph
Public Sub NewGraph(n As Integer, YLab As String)
  If (Charts(n).graf Is Nothing) Then
    Dim k As New grafico
    Set Charts(n).graf = k
    Charts(n).graf.ResetGraph
    Charts(n).graf.Left = graphleft(n)
    Charts(n).graf.Top = graphtop(n)

  '  Charts(n).graf.SetYLabel YLab ' EricL - Don't need this line - dup of line below
  Else
    'Botsareus 1/5/2013 reposition graph
    Charts(n).graf.Top = 0
    Charts(n).graf.Left = 0
  End If
  
   Charts(n).graf.chk_GDsave.value = IIf(graphsave(n), 1, 0)
  'Charts(n).graf.SetYLabel YLab ' EricL 4/7/2006 Commented out - just no longer need to call SetYLabel
  
  'EricL 4/7/2006 Just set the caption directly now without adding "/ Cycles..." to teh end of the caption
  Charts(n).graf.Caption = YLab
  
  Charts(n).graf.Show
  
  'EricL - 3/27/2006 Get the first data point and show the graph key right from the start
  FeedGraph n
  
End Sub


Public Sub CloseGraph(n As Integer)
  If Not (Charts(n).graf Is Nothing) Then
     Unload Charts(n).graf
  End If
End Sub

' resets all graphs
Public Sub ResetGraphs(i As Integer)
  Dim k As Integer
  
  If i > 0 Then
    If Not (Charts(i).graf Is Nothing) Then
      Charts(i).graf.ResetGraph
    End If
  Else
    For k = 1 To NUMGRAPHS
      If Not (Charts(k).graf Is Nothing) Then
        Charts(k).graf.ResetGraph
          
      End If
    Next k
  End If
End Sub

' feeds graphs with new data
Public Sub FeedGraph(GraphNumber As Integer)
  Dim nomi(MAXSPECIES) As String
  Dim dati(MAXSPECIES, NUMGRAPHS) As Single
  Dim t As Integer, k As Integer, P As Integer, i As Integer
  Dim startingChart As Integer, endingChart As Integer
  
  ' This should never be the case.
  If GraphNumber < 0 Or GraphNumber > NUMGRAPHS Then Exit Sub
  
  CalcStats nomi, dati, GraphNumber
  
  If GraphNumber = 0 Then
    ' Update all the graphs
    startingChart = 1
    endingChart = NUMGRAPHS
  Else
    ' Only update one graph
    startingChart = GraphNumber
    endingChart = GraphNumber
  End If
    
  t = Flex.last(nomi)
   
  For k = startingChart To endingChart
    If k = 10 Then t = 1
    For P = 1 To t
      If Not (Charts(k).graf Is Nothing) Then
        If k = 10 Then
          Charts(k).graf.SetValues "Cost Multiplier", dati(1, k)
          Charts(k).graf.SetValues "Population / Target", dati(2, k)
          Charts(k).graf.SetValues "Upper Range", dati(3, k)
          Charts(k).graf.SetValues "Lower Range", dati(4, k)
          Charts(k).graf.SetValues "Zero Level", dati(5, k)
          Charts(k).graf.SetValues "Reinstatement Level", dati(6, k)
        Else
          Charts(k).graf.SetValues nomi(P), dati(P, k)
        End If
      End If
    Next P
  Next k
  For k = startingChart To endingChart
    If Not (Charts(k).graf Is Nothing) Then
      Charts(k).graf.NewPoints
    End If
  Next k
End Sub


'Botsareus 5/25/2013 onrounded math for custom graphs
'our stack manipulations
Private Sub PushQStack(ByVal value As Double)
  Dim a As Integer
  
  If QStack.pos >= 101 Then 'next push will overfill
    For a = 0 To 99
      QStack.val(a) = QStack.val(a + 1)
    Next a
    QStack.val(100) = 0
    QStack.pos = 100
  End If
  
  QStack.val(QStack.pos) = value
  QStack.pos = QStack.pos + 1
End Sub

Private Function PopQStack() As Double
  QStack.pos = QStack.pos - 1
      
  If QStack.pos = -1 Then
    QStack.pos = 0
    QStack.val(0) = 0
  End If
  
  PopQStack = QStack.val(QStack.pos)
End Function

Private Sub ClearQStack()
  QStack.pos = 0
  QStack.val(0) = 0
End Sub
Private Sub Qadd()
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopQStack
  a = PopQStack
  
  If a > 2000000000 Then a = a Mod 2000000000
  If b > 2000000000 Then b = b Mod 2000000000
  
  c = a + b
  
  If Abs(c) > 2000000000 Then c = c - Sgn(c) * 2000000000
  PushQStack c
End Sub

Private Sub QSub() 'Botsareus 5/20/2012 new code to stop overflow
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopQStack
  a = PopQStack
  
  
  If a > 2000000000 Then a = a Mod 2000000000
  If b > 2000000000 Then b = b Mod 2000000000
  
  c = a - b
  
  If Abs(c) > 2000000000 Then c = c - Sgn(c) * 2000000000
  PushQStack c
End Sub

Private Sub Qmult()
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopQStack
  a = PopQStack
  c = CDbl(a) * CDbl(b)
  If Abs(c) > 2000000000 Then c = Sgn(c) * 2000000000
  PushQStack CDbl(c)
End Sub

Private Sub Qdiv()
  Dim a As Double
  Dim b As Double
  b = PopQStack
  a = PopQStack
  If b <> 0 Then
    PushQStack a / b
  Else
    PushQStack 0
  End If
End Sub
Private Sub Qpow()
    Dim a As Double
    Dim b As Double
    Dim c As Double
    b = PopQStack
    a = PopQStack
    
    If Abs(b) > 10 Then b = 10 * Sgn(b)
    
    If a = 0 Then
      c = 0
    Else
      c = a ^ b
    End If
    If Abs(c) > 2000000000 Then c = Sgn(c) * 2000000000
    PushQStack c
End Sub
' calculates data for the different graph types
Private Sub CalcStats(ByRef nomi, ByRef dati, graphNum As Integer) 'Botsareus 8/3/2012 use names for graph id mod
  Dim P As Integer, t As Integer, i As Integer, x As Integer
  Dim n As node
  Dim population As Integer
  Dim ListOSubSpecies(500, 10000) As Integer
  Dim speciesListIndex(500) As Integer
  Dim SubSpeciesNumber As Long
  Dim l, ll As Long
  Dim sim As Long
  
  
 ' Dim numbots As Integer
 
  For t = 0 To SimOpts.SpeciesNum
    speciesListIndex(t) = 0
  Next t

  population = TotalRobotsDisplayed
  
  'EricL - Modified in 2.42.5 to handle each graph separatly for perf reasons
 ' numbots = 0
  Select Case graphNum
  Case 0, CUSTOM_1_GRAPH, CUSTOM_2_GRAPH, CUSTOM_3_GRAPH     ' Do all the graphs
  
'    t = Flex.last(nomi)
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, MUTATIONS_GRAPH) = dati(P, MUTATIONS_GRAPH) + .LastMut + .Mutations
        dati(P, AVGAGE_GRAPH) = dati(P, AVGAGE_GRAPH) + (.age / 100) ' EricL 4/7/2006 Graph age in 100's of cycles
        dati(P, OFFSPRING_GRAPH) = dati(P, OFFSPRING_GRAPH) + .SonNumber
        dati(P, ENERGY_GRAPH) = dati(P, ENERGY_GRAPH) + .nrg
        dati(P, DNALENGTH_GRAPH) = dati(P, DNALENGTH_GRAPH) + .DnaLen
        dati(P, DNACOND_GRAPH) = dati(P, DNACOND_GRAPH) + .condnum
        dati(P, MUT_DNALENGTH_GRAPH) = dati(P, MUT_DNALENGTH_GRAPH) + (.LastMut + .Mutations) / .DnaLen * 1000
        dati(P, ENERGY_SPECIES_GRAPH) = Round(dati(P, ENERGY_SPECIES_GRAPH) + (.nrg + .body * 10) * 0.001, 2)
        
        
        'Look through the subspecies we have seen so far and see if this bot has the same as any of them
        i = 0
        While i < speciesListIndex(P) And .SubSpecies <> ListOSubSpecies(P, i)
          i = i + 1
        Wend
                                
        If i = speciesListIndex(P) Then ' New sub species
           ListOSubSpecies(P, i) = .SubSpecies
           speciesListIndex(P) = speciesListIndex(P) + 1
           dati(P, SPECIESDIVERSITY_GRAPH) = dati(P, SPECIESDIVERSITY_GRAPH) + 1
        End If
        If Not .Corpse Then
          If .SubSpecies < 0 Then
            SubSpeciesNumber = 32000 + CLng(Abs(.SubSpecies))
          Else
            SubSpeciesNumber = .SubSpecies
          End If
          
          'Botsareus 8/3/2012 Generational Distance Graph
           ll = FindGenerationalDistance(t)
           If ll > dati(P, GENERATION_DIST_GRAPH) Then dati(P, GENERATION_DIST_GRAPH) = ll
                    
        End If
      End If
      End With
    Next t
    
    t = Flex.last(nomi)
    If dati(P, POPULATION_GRAPH) <> 0 Then
    For P = 1 To t
      dati(P, MUTATIONS_GRAPH) = Round(dati(P, MUTATIONS_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, AVGAGE_GRAPH) = Round(dati(P, AVGAGE_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, OFFSPRING_GRAPH) = Round(dati(P, OFFSPRING_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, ENERGY_GRAPH) = Round(dati(P, ENERGY_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, DNALENGTH_GRAPH) = Round(dati(P, DNALENGTH_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, DNACOND_GRAPH) = Round(dati(P, DNACOND_GRAPH) / dati(P, POPULATION_GRAPH), 1)
      dati(P, MUT_DNALENGTH_GRAPH) = Round(dati(P, MUT_DNALENGTH_GRAPH) / dati(P, POPULATION_GRAPH), 1)
  '    dati(P, ENERGY_SPECIES_GRAPH) = dati(P, ENERGY_SPECIES_GRAPH) / dati(P, POPULATION_GRAPH)
    Next P
    End If
    dati(1, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(COSTMULTIPLIER)
    
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(2, DYNAMICCOSTS_GRAPH) = population
    Else
      dati(2, DYNAMICCOSTS_GRAPH) = population / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
    
    dati(3, DYNAMICCOSTS_GRAPH) = 1 + (SimOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) * 0.01)
    dati(4, DYNAMICCOSTS_GRAPH) = 1 - (SimOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) * 0.01)
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(5, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(BOTNOCOSTLEVEL)
      dati(6, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL)
    Else
      dati(5, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(BOTNOCOSTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
      dati(6, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
    
    'Botsareus 5/25/2013 Logic for custom graph
    Dim myquery As String
    Select Case graphNum
        Case CUSTOM_1_GRAPH
            myquery = strGraphQuery1
        Case CUSTOM_2_GRAPH
            myquery = strGraphQuery2
        Case CUSTOM_3_GRAPH
            myquery = strGraphQuery3
    End Select
    
    'Botsareus 5/25/2013 Very simple genetic distance is calculated when necessary
    If myquery Like "*verysimpgenetic*" Then
    
        t = Flex.last(nomi)
        For P = 1 To t
          dati(P, GENETIC_DIST_GRAPH) = 0
        Next P
        
        For t = 1 To MaxRobs
          With rob(t)
          If .exist And Not .Corpse Then
    
            P = Flex.Position(rob(t).FName, nomi)
    
            If .GenMut > 0 Then 'If there is not enough mutations for a graph check, skip it
    
                l = .OldGD
                If l > dati(P, GENETIC_DIST_GRAPH) Then dati(P, GENETIC_DIST_GRAPH) = l
    
            Else
    
                .GenMut = .DnaLen / GeneticSensitivity 'we have enough mutations, reset counter
    
                Dim copyl As Single
                copyl = 0
    
                For x = t + 1 To MaxRobs 'search trough all robots and figure out genetic distance for the once that have enough mutations
                If rob(x).exist And Not rob(x).Corpse And rob(x).FName = .FName And rob(x).GenMut = 0 Then  ' Must exist, have enugh mutations, and be of same species
                    l = DoGeneticDistanceSimple(t, x) * 1000
                    If l > copyl Then copyl = l 'here we store the max genetic distance for a given robot
                End If
    
                If x = UBound(rob) Then Exit For
                Next x
    
                If copyl > dati(P, GENETIC_DIST_GRAPH) Then dati(P, GENETIC_DIST_GRAPH) = copyl 'now we write this max distance
                .OldGD = copyl 'since this robot will not checked for a while, we need to store it's genetic distance to be used later
    
            End If
    
    
          End If
          End With
    
        If t = UBound(rob) Then Exit For
        Next t
    End If
    
    If graphNum > 0 Then
      For P = 1 To t
        'calculate query
        ClearQStack
        'query logic
        Dim splt() As String
        splt = Split(myquery, " ")
        Dim q As Integer
        For q = 0 To UBound(splt)
        'make sure data is lower case
        splt(q) = LCase(splt(q))
        'loop trough each element and compute it as nessisary
            If splt(q) = CStr(val(splt(q))) Then
                'push ze number
                PushQStack (val(splt(q)))
            Else
                Select Case splt(q)
                Case "pop"
                    PushQStack dati(P, POPULATION_GRAPH)
                Case "avgmut"
                    PushQStack dati(P, MUTATIONS_GRAPH)
                Case "avgage"
                    PushQStack dati(P, AVGAGE_GRAPH)
                Case "avgsons"
                    PushQStack dati(P, OFFSPRING_GRAPH)
                Case "avgnrg"
                    PushQStack dati(P, ENERGY_GRAPH)
                Case "avglen"
                    PushQStack dati(P, DNALENGTH_GRAPH)
                Case "avgcond"
                    PushQStack dati(P, DNACOND_GRAPH)
                Case "simnrg"
                    PushQStack dati(P, ENERGY_SPECIES_GRAPH)
                Case "specidiv"
                    PushQStack dati(P, SPECIESDIVERSITY_GRAPH)
                Case "maxgd"
                    PushQStack dati(P, GENERATION_DIST_GRAPH)
                Case "verysimpgenetic"
                    PushQStack dati(P, GENETIC_DIST_GRAPH)
                Case "add"
                     Qadd
                Case "sub"
                    QSub
                Case "mult"
                    Qmult
                Case "div"
                    Qdiv
                Case "pow"
                    Qpow
                End Select
            End If
        Next
        'end query logic
        
        'make sure graph is greater then zero
        Dim holdqstack As Double
        holdqstack = PopQStack
        If holdqstack < 0 Then holdqstack = 0
        
        dati(P, graphNum) = holdqstack
      Next
    End If
    
getout2:
    
  Case POPULATION_GRAPH
    For t = 1 To MaxRobs
      With rob(t)
     ' If Not .wall And .exist Then
      If .exist Then
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
      End If
      End With
    Next t
       
  Case MUTATIONS_GRAPH
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
  '    numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, MUTATIONS_GRAPH) = dati(P, MUTATIONS_GRAPH) + .LastMut + .Mutations
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, MUTATIONS_GRAPH) = Round(dati(P, MUTATIONS_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P
    
    
  Case AVGAGE_GRAPH
   For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
  '      numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, AVGAGE_GRAPH) = dati(P, AVGAGE_GRAPH) + (.age / 100) ' EricL 4/7/2006 Graph age in 100's of cycles
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, AVGAGE_GRAPH) = Round(dati(P, AVGAGE_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

  Case OFFSPRING_GRAPH
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, OFFSPRING_GRAPH) = dati(P, OFFSPRING_GRAPH) + .SonNumber
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, OFFSPRING_GRAPH) = Round(dati(P, OFFSPRING_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

   
  Case ENERGY_GRAPH
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, ENERGY_GRAPH) = dati(P, ENERGY_GRAPH) + .nrg
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, ENERGY_GRAPH) = Round(dati(P, ENERGY_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

   
  Case DNALENGTH_GRAPH
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, DNALENGTH_GRAPH) = dati(P, DNALENGTH_GRAPH) + .DnaLen
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, DNALENGTH_GRAPH) = Round(dati(P, DNALENGTH_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

   
  Case DNACOND_GRAPH
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
      '  numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, DNACOND_GRAPH) = dati(P, DNACOND_GRAPH) + .condnum
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, DNACOND_GRAPH) = Round(dati(P, DNACOND_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

   
  Case MUT_DNALENGTH_GRAPH
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, MUT_DNALENGTH_GRAPH) = dati(P, MUT_DNALENGTH_GRAPH) + (.LastMut + .Mutations) / .DnaLen * 1000
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, MUT_DNALENGTH_GRAPH) = Round(dati(P, MUT_DNALENGTH_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P

   
  Case ENERGY_SPECIES_GRAPH
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, ENERGY_SPECIES_GRAPH) = dati(P, ENERGY_SPECIES_GRAPH) + (.nrg + .body * 10) * 0.001
      End If
      End With
    Next t
    
  Case DYNAMICCOSTS_GRAPH
    dati(1, DYNAMICCOSTS_GRAPH) = Round(SimOpts.Costs(COSTMULTIPLIER), 4)
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(2, DYNAMICCOSTS_GRAPH) = population
    Else
      dati(2, DYNAMICCOSTS_GRAPH) = population / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
        
    dati(3, DYNAMICCOSTS_GRAPH) = 1 + (SimOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) * 0.01)
    dati(4, DYNAMICCOSTS_GRAPH) = 1 - (SimOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) * 0.01)
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(5, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(BOTNOCOSTLEVEL)
      dati(6, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL)
    Else
      dati(5, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(BOTNOCOSTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
      dati(6, DYNAMICCOSTS_GRAPH) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
    
  Case SPECIESDIVERSITY_GRAPH
    For t = 1 To MaxRobs
      With rob(t)
      If .exist Then
        P = Flex.Position(rob(t).FName, nomi)
        
        'Look through the subspecies we have seen so far and see if this bot has the same as any of them
        i = 0
        While i < speciesListIndex(P) And .SubSpecies <> ListOSubSpecies(P, i)
          i = i + 1
        Wend
                                
        If i = speciesListIndex(P) Then ' New sub species
           ListOSubSpecies(P, i) = .SubSpecies
           speciesListIndex(P) = speciesListIndex(P) + 1
           dati(P, SPECIESDIVERSITY_GRAPH) = dati(P, SPECIESDIVERSITY_GRAPH) + 1
        End If
        
      End If
      End With
    Next t
    
  Case AVGCHLR_GRAPH 'Botsareus 8/31/2013 The new chloroplast graph
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, POPULATION_GRAPH) = dati(P, POPULATION_GRAPH) + 1
        dati(P, AVGCHLR_GRAPH) = dati(P, AVGCHLR_GRAPH) + .chloroplasts
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, POPULATION_GRAPH) <> 0 Then dati(P, AVGCHLR_GRAPH) = Round(dati(P, AVGCHLR_GRAPH) / dati(P, POPULATION_GRAPH), 1)
    Next P
    
getout3:
    
   Case GENETIC_DIST_GRAPH
    'Botsareus 4/9/2013 Genetic Distance Graph uses the new GenMut and OldGD variables
    

    t = Flex.last(nomi)
    For P = 1 To t
      dati(P, GENETIC_DIST_GRAPH) = 0
    Next P

    'show the graph update label and set value to zero
    GraphLab.Caption = "Updating Graph: 0%"
    GraphLab.Visible = True

    For t = 1 To MaxRobs
      With rob(t)
      If .exist And Not .Corpse Then

        P = Flex.Position(rob(t).FName, nomi)

        If .GenMut > 0 Then 'If there is not enough mutations for a graph check, skip it

            l = .OldGD
            If l > dati(P, GENETIC_DIST_GRAPH) Then dati(P, GENETIC_DIST_GRAPH) = l

        Else

            .GenMut = .DnaLen / GeneticSensitivity 'we have enough mutations, reset counter

            'Dim copyl As Single
            copyl = 0

            For x = t + 1 To MaxRobs 'search trough all robots and figure out genetic distance for the once that have enough mutations
            If rob(x).exist And Not rob(x).Corpse And rob(x).FName = .FName And rob(x).GenMut = 0 Then  ' Must exist, have enugh mutations, and be of same species
                l = DoGeneticDistance(t, x) * 1000
                If l > copyl Then copyl = l 'here we store the max genetic distance for a given robot

                'update the graph label
                GraphLab.Caption = "Updating Graph: " & Int(t / MaxRobs * 100) & "." & Int(x / MaxRobs * 99) & "%"
                DoEvents
            End If

            If x = UBound(rob) Then Exit For
            Next x

            If copyl > dati(P, GENETIC_DIST_GRAPH) Then dati(P, GENETIC_DIST_GRAPH) = copyl 'now we write this max distance
            .OldGD = copyl 'since this robot will not checked for a while, we need to store it's genetic distance to be used later
            DoEvents

        End If


      End If
      End With

    If t = UBound(rob) Then Exit For
    Next t

    'hide the graph update label
    GraphLab.Visible = False
   
   Case GENERATION_DIST_GRAPH
    t = Flex.last(nomi)
    
    For P = 1 To t
      dati(P, GENERATION_DIST_GRAPH) = 0
    Next P
    
    For t = 1 To MaxRobs
      With rob(t)
      If .exist And Not .Corpse Then
        P = Flex.Position(rob(t).FName, nomi)
           'Botsareus 8/3/2012 Generational Distance Graph
           ll = FindGenerationalDistance(t)
           If ll > dati(P, GENERATION_DIST_GRAPH) Then dati(P, GENERATION_DIST_GRAPH) = ll
      End If
      End With
    Next t
    
    Case GENETIC_SIMPLE_GRAPH
    
    'show the graph update label and set value to zero
    GraphLab.Caption = "Updating Graph: 0%"
    GraphLab.Visible = True
    
    t = Flex.last(nomi)
    For P = 1 To t
      dati(P, GENETIC_SIMPLE_GRAPH) = 0
    Next P

    For t = 1 To MaxRobs
      With rob(t)
      If .exist And Not .Corpse Then
        P = Flex.Position(rob(t).FName, nomi)
            For x = t + 1 To MaxRobs
            If rob(x).exist And Not rob(x).Corpse And rob(x).FName = .FName Then  ' Must exist, and be of same species
                l = DoGeneticDistanceSimple(t, x) * 1000
                If l > dati(P, GENETIC_SIMPLE_GRAPH) Then dati(P, GENETIC_SIMPLE_GRAPH) = l 'here we store the max generational distance for a given robot
            End If
            Next x
        GraphLab.Caption = "Updating Graph: " & Int(t / MaxRobs * 100) & "%"
        DoEvents
      End If
      End With
    Next t
    
    'hide the graph update label
    GraphLab.Visible = False
  End Select
End Sub

Private Function FindGenerationalDistance(ByVal id As Integer) 'Botsareus 8/3/2012 code to find generational distance
p_reclev = 0
score id, 1, 500, 4
FindGenerationalDistance = p_reclev
End Function

' recursively calculates the number of alive descendants of a rob
Public Function discendenti(t As Integer, disce As Integer) As Integer
  Dim k As Integer
  Dim n As Integer
  Dim rid As Long
  rid = rob(t).AbsNum
  If disce < 1000 Then
    For n = 1 To MaxRobs
      If rob(n).exist Then
        If rob(n).parent = rid Then
          discendenti = discendenti + 1
          disce = disce + 1
          discendenti = discendenti + discendenti(n, disce)
        End If
      End If
    Next n
  End If
End Function

' sets the energy token for vegs feeding
Private Sub setfeed()
  'Dim t As Integer
  'For t = 1 To MaxRobs
  '  If rob(t).Veg = True Then rob(t).Feed = 8
  'Next t
End Sub

' selects a robot to kill for population control
Public Sub popcontrol()
  Dim a As Integer
  Dim totrob As Integer
  totrob = TotalRobots
  While totrob > SimOpts.MaxPopulation
    If SimOpts.PopLimMethod = 1 Then a = randrob
    If SimOpts.PopLimMethod = 2 Then a = eldest
    KillRobot a
    totrob = totrob - 1
  Wend
End Sub

' returns a random robot (for population control)
Private Function randrob() As Integer
  Dim a As Integer
  a = Random(1, MaxRobs)
  While rob(a).exist = False
    a = Random(1, MaxRobs)
  Wend
End Function

' returns the eldest robot (for pop control)
Private Function eldest() As Integer
  Dim t As Integer
  Dim mxa As Integer
  Dim mxr As Integer
  mxa = 0
  For t = 1 To MaxRobs
    If rob(t).exist And rob(t).age > mxa Then
      mxa = rob(t).age
      mxr = t
    End If
  Next t
  eldest = mxr
End Function

' returns the fittest robot (selected through the score function)
' altered from the bot with the most generations
' to the bot with the most invested energy in itself and children
Function fittest() As Integer
'Botsareus 5/22/2013 Lets figure out what we are searching for
Dim sPopulation As Double
Dim sEnergy As Double
sEnergy = (IIf(intFindBestV2 > 100, 100, intFindBestV2)) / 100
sPopulation = (IIf(intFindBestV2 < 100, 100, 200 - intFindBestV2)) / 100

  Dim t As Integer
  Dim s As Double
  Dim Mx As Double
  Mx = 0
  For t = 1 To MaxRobs
    If rob(t).exist And Not rob(t).Veg Then
      TotalOffspring = 1
      s = score(t, 1, 10, 0) + rob(t).nrg + rob(t).body * 10 'Botsareus 5/22/2013 Advanced fit test
      s = (TotalOffspring ^ sPopulation) * (s ^ sEnergy)
      If s >= Mx Then
        Mx = s
        fittest = t
      End If
    End If
  Next t
End Function

' does various things: with
' tipo=0 returns the number of descendants for maxrec generations
' tipo=1 highlights the descendants
' tipo=2 searches up the tree for eldest ancestor, then down again
' tipo=3 draws the lines showing kinship relations
Function score(ByVal r As Integer, ByVal reclev As Integer, maxrec As Integer, tipo As Integer) As Double
  Dim al As Integer
  Dim dx As Single
  Dim dy As Single
  Dim cr As Long
  Dim ct As Long
  Dim t As Integer
  If tipo = 2 Then plines (r)
  score = 0
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If rob(t).parent = rob(r).AbsNum Then
        If reclev < maxrec Then score = score + score(t, reclev + 1, maxrec, tipo)
        If tipo = 0 Then score = score + InvestedEnergy(t) 'Botsareus 8/3/2012 generational distance code
        If tipo = 4 And reclev > p_reclev Then p_reclev = reclev
        If tipo = 1 Then rob(t).highlight = True
        If tipo = 3 Then
          dx = (rob(r).pos.x - rob(t).pos.x) / 2
          dy = (rob(r).pos.y - rob(t).pos.y) / 2
          cr = RGB(128, 128, 128)
          ct = vbWhite
          If rob(r).AbsNum > rob(t).AbsNum Then
            cr = vbWhite
            ct = RGB(128, 128, 128)
          End If
          Line (rob(t).pos.x, rob(t).pos.y)-Step(dx, dy), ct
          Line -(rob(r).pos.x, rob(r).pos.y), cr
        End If
      End If
    End If
  Next t
  If tipo = 1 Then
    Form1.Cls
    DrawAllRobs
  End If
End Function
Function InvestedEnergy(t As Integer) As Double 'Botsareus 5/22/2013 Calculate both population and energy
  InvestedEnergy = rob(t).nrg + rob(t).body * 10 'botschange fittest
  TotalOffspring = TotalOffspring + 1 'botschange fittest
End Function

' goes up the tree searching for eldest ancestor
Private Sub plines(ByVal t As Integer)
  Dim P As Integer
  P = parent(t)
  While P > 0
    t = P
    P = parent(t)
  Wend
  If P = 0 Then P = t
  t = score(P, 1, 1000, 3)
End Sub

' returns the robot's parent
Function parent(r As Integer) As Integer
  Dim t As Integer
  parent = 0
  For t = 1 To MaxRobs
    If rob(t).AbsNum = rob(r).parent And rob(t).exist Then parent = t
  Next t
End Function

'
'   MISC STUFF
'

''''''''''''''''''''''''''''''''''''''''''
Public Sub t_MouseDown(ByVal Button As Integer)
  If MDIForm1.stealthmode And Button = 1 Then
    MDIForm1.Show
    t.Remove
    MDIForm1.stealthmode = False
    ElseIf MDIForm1.stealthmode And Button = 2 Then
    Call MDIForm1.PopupMenu(MDIForm1.TrayIconPopup)
  End If
End Sub

