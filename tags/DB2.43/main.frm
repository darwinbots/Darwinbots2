VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H00511206&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   8520
   ClientLeft      =   30
   ClientTop       =   90
   ClientWidth     =   11880
   FillColor       =   &H00511206&
   Icon            =   "main.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8520
   ScaleWidth      =   11880
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   1000
      Left            =   2640
      ScaleHeight     =   945
      ScaleWidth      =   945
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   1000
   End
   Begin VB.Timer SecTimer 
      Interval        =   1000
      Left            =   2040
      Top             =   120
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   720
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      Protocol        =   2
      RemoteHost      =   "sulaadventures.com"
      RemotePort      =   21
      URL             =   "ftp://db:DB@sulaadventures.com/db"
      Document        =   "/db"
      UserName        =   "db"
      Password        =   "DB"
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
   Begin VB.Image TeleporterMask 
      Height          =   720
      Left            =   240
      Picture         =   "main.frx":08CA
      Top             =   2040
      Visible         =   0   'False
      Width           =   11520
   End
   Begin VB.Image Teleporter 
      Appearance      =   0  'Flat
      Height          =   720
      Left            =   120
      Picture         =   "main.frx":1B90C
      Stretch         =   -1  'True
      Top             =   1200
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
   Begin VB.Image Grata 
      Height          =   3180
      Left            =   3360
      Picture         =   "main.frx":3694E
      Top             =   4320
      Visible         =   0   'False
      Width           =   3180
   End
   Begin VB.Image Arrows 
      Height          =   3180
      Left            =   480
      Picture         =   "main.frx":57840
      Top             =   3840
      Visible         =   0   'False
      Width           =   3180
   End
   Begin VB.Image Vortice 
      Height          =   3180
      Left            =   6960
      Picture         =   "main.frx":78732
      Top             =   3840
      Visible         =   0   'False
      Width           =   3180
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
      Left            =   480
      TabIndex        =   0
      Tag             =   "30000"
      Top             =   2640
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
' Post V2.42 modifications copyright (c) 2006 Eric Lockard  eric@sulaadventures.com
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

Public WithEvents t As TrayIcon
Attribute t.VB_VarHelpID = -1
Public BackPic As String

Dim edat(10) As Single

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


Public cyc As Integer          ' cycles/second
Dim minutescount As Integer
Public dispskin As Boolean  ' skin drawing enabled?
Public Smileys As Boolean   ' silly routine to make smily faces
Public Active As Boolean    ' sim running?
Public visiblew As Single     ' field visible portion (for zoom)
Public visibleh As Long

Private robminutescount As Integer  ' minutes counter for next robot auto save
Private AutoRobNum As Integer       ' last autosaved rob index
Private AutoSimNum As Integer       ' last autosaved sim index
Public DNAMaxConds As Integer   ' max conditions per gene allowed by mutation
Dim Charts(11) As Graph        ' array of graph pointers

Public MutCyc As Long     ' for oscillating mutation rates
Private GridRef As Integer
Public PiccyMode As Boolean   'display that piccy or not?
Public Newpic As Boolean      'IIs it a new picture?
Public Flickermode As Boolean 'Speed up graphics at the cost of some flicker

Public MagX As Long
Public MagY As Long





Private Sub Form_Load()
  Dim i As Integer
  
   
  strings Me
  Set Consoleform.evnt = New cevent
  
  LoadSysVars
  LoadLists
  If BackPic <> "" Then
    Form1.Picture = LoadPicture(BackPic)
  Else
    Form1.Picture = Nothing
  End If
  MDIForm1.Caption = "DarwinBots 2.43"
  Form1.Top = 0
  Form1.Left = 0
  Form1.Width = MDIForm1.ScaleWidth
  Form1.Height = MDIForm1.ScaleHeight
  SimOpts.FieldWidth = Form1.ScaleWidth
  SimOpts.FieldHeight = Form1.ScaleHeight
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
  Form1.Active = True
  
  FlashColor(1) = vbBlack         ' Hit with memory shot
  FlashColor(-1 + 10) = vbRed     ' Hit with NRg feeding shot
  FlashColor(-2 + 10) = vbWhite   ' Hit with Nrg Shot
  FlashColor(-3 + 10) = vbBlue    ' Hit with venom shot
  FlashColor(-4 + 10) = vbGreen   ' Hit with waste shot
  FlashColor(-5 + 10) = vbYellow  ' Hit with poison Shot
  FlashColor(-6 + 10) = vbMagenta ' Hit with body feeding shot
  FlashColor(-7 + 10) = vbCyan    ' Hit with virus shot
  InitObstacles
    
  IntOpts.RUpload = RobSize * 4
  IntOpts.XUpload = 0
  IntOpts.YUpload = Me.ScaleHeight / 2 - IntOpts.RUpload / 2
  IntOpts.XSpawn = Me.ScaleWidth - IntOpts.RUpload
  IntOpts.YSpawn = IntOpts.YUpload
  IntOpts.WaitForUpload = 1000 ' EricL was 10000
  IntOpts.LastUploadCycle = 1
 ' SimOpts.DayNight = False ' EricL March 15, 2006
 ' SimOpts.Daytime = True ' EricL March 15, 2006
  MDIForm1.daypic.Visible = True
  MDIForm1.nightpic.Visible = False
  MDIForm1.F1Piccy.Visible = False
  ContestMode = False
  SimOpts.chartingInterval = 200 ' EricL 3/28/2006
  SimOpts.MutCurrMult = 1 ' EricL 4/1/2006
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
  
  If MagLens.Visible Then MagLens.Cls  ' Clear the magnifying lens
  
  If Flickermode Then Me.AutoRedraw = False
    
  If numObstacles > 0 Then Obstacles.DrawObstacles
  
  If MagLens.Visible Then
     MagX = (MagLens.Left / Form1.Width) * Form1.visiblew + Form1.ScaleLeft
     MagY = (MagLens.Top / Form1.Height) * Form1.visibleh + Form1.ScaleTop
  End If
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

Private Sub DrawArena()
    If MDIForm1.ZoomLock = 0 Then Exit Sub 'no need to draw boundaries if we aren't going to see them
    Line (0, 0)-(0, 0 + SimOpts.FieldHeight), vbWhite
    Line -(SimOpts.FieldWidth - 0, SimOpts.FieldHeight), vbWhite
    Line -(0 + SimOpts.FieldWidth, 0), vbWhite
    Line -(0, -0), vbWhite
End Sub

' draws rob perimeter - circle or square, if wall
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
  
  
  Sides = rob(n).Shape
  If Sides > 0 Then Sdlen = 6.28 / Sides
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
  
  If Not Smileys Then
       
  '  If Not rob(n).wall Then
      Circle (CentreX, CentreY), rob(n).radius, rob(n).color 'new line
      
      'Update the magnifying lens
      If MagLens.Visible Then
        If CentreX > MagX And CentreX < MagX + MagLens.ScaleWidth And _
         CentreY > MagY And CentreY < MagY + MagLens.ScaleHeight Then
           MagLens.Circle (CentreX - MagX, CentreY - MagY), rob(n).radius, rob(n).color
        End If
      End If
      
 '   Else
 '     Line (CentreX, CentreY)-Step(RobSize, RobSize), vbWhite, BF
 '   End If
    
    If MDIForm1.displayResourceGuagesToggle = True Then

      If rob(n).nrg > 0 Then
        If rob(n).nrg < 32000 Then
          Percent = rob(n).nrg / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.95, vbWhite, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).body > 0 Then
        If rob(n).body < 32000 Then
          Percent = rob(n).body / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.9, vbMagenta, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Waste > 0 Then
        If rob(n).Waste < 32000 Then
          Percent = rob(n).Waste / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.85, vbGreen, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).venom > 0 Then
        If rob(n).venom < 32000 Then
          Percent = rob(n).venom / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.8, vbBlue, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).shell > 0 Then
        If rob(n).shell < 32000 Then
          Percent = rob(n).shell / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.75, vbRed, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Slime > 0 Then
        If rob(n).Slime < 32000 Then
          Percent = rob(n).Slime / 32000
        Else
          Percent = 1
        End If
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.7, vbYellow, 0, (Percent * PI * 2#)
      End If
      
      If rob(n).Vtimer > 0 Then
        Percent = rob(n).Vtimer / 100
        If Percent > 0.99 Then Percent = 0.99 ' Do this because the cirlce won't draw if it goes all the way around for some reason...
        Circle (CentreX, CentreY), rob(n).radius * 0.65, vbCyan, 0, (Percent * PI * 2#)
      End If
      
    End If
  Else
    For t = 0 To 6.28 Step Sdlen
      Line (CentreX + Cos(rob(n).aim + t) * radius, CentreY - Sin(rob(n).aim + t) * radius)-(CentreX + Cos(rob(n).aim + t + Sdlen) * radius, CentreY - Sin(rob(n).aim + t + Sdlen) * radius), rob(n).color
    Next t
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
  
  'If Not rob(n).wall And Not rob(n).Corpse Then
  If Not rob(n).Corpse Then
    With rob(n)
  
    'We have to remember that the upper left corner is (0,0)
    pos.x = .aimvector.x
    pos.y = -.aimvector.y
       
    pos2 = VectorAdd(.pos, VectorScalar(pos, .radius))
    PSet (pos2.x, pos2.y), vbWhite
    
    'Update the magnifying lens
    If MagLens.Visible Then
      If pos2.x > MagX And pos2.x < MagX + MagLens.ScaleWidth And _
         pos2.y > MagY And pos2.y < MagY + MagLens.ScaleHeight Then
         MagLens.PSet (pos2.x - MagX, pos2.y - MagY), vbWhite
      End If
    End If
    
    If MDIForm1.displayMovementVectorsToggle Then
      'Draw the voluntary movement vectors
      If .lastup <> 0 Then
        If .lastup < -1000 Then .lastup = -1000
        If .lastup > 1000 Then .lastup = 1000
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastup)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
      End If
      If .lastdown <> 0 Then
        If .lastdown < -1000 Then .lastdown = -1000
        If .lastdown > 1000 Then .lastdown = 1000
        pos2 = VectorSub(.pos, VectorScalar(pos, .radius))
        vol = VectorSub(pos2, VectorScalar(pos, CSng(.lastdown)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
      End If
      If .lastleft <> 0 Then
        If .lastleft < -1000 Then .lastleft = -1000
        If .lastleft > 1000 Then .lastleft = 1000
        pos = VectorSet(Cos(.aim - PI / 2), Sin(.aim - PI / 2))
        pos.y = -pos.y
        pos2 = VectorAdd(.pos, VectorScalar(pos, .radius))
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastleft)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
      End If
      If .lastright <> 0 Then
        If .lastright < -1000 Then .lastright = -1000
        If .lastright > 1000 Then .lastright = 1000
        pos = VectorSet(Cos(.aim + PI / 2), Sin(.aim + PI / 2))
        pos.y = -pos.y
        pos2 = VectorAdd(.pos, VectorScalar(pos, .radius))
        vol = VectorAdd(pos2, VectorScalar(pos, CSng(.lastleft)))
        Line (pos2.x, pos2.y)-(vol.x, vol.y), .color
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
  
  'If Smileys Then
  '  With rob(n)
  '    'Circle (rob(n).x + Half, rob(n).Y + Half), Half + rob(n).body / factor, rob(n).color 'new line
  '    Circle (rob(n).x + (Half - 20), rob(n).Y + (Half - 20)), 20, rob(n).color
  '    Circle (rob(n).x + (Half + 20), rob(n).Y + (Half - 20)), 20, rob(n).color
  '    x1 = rob(n).x + Half - 30
  '    y1 = rob(n).Y + Half + 20
  '    x2 = rob(n).x + Half
  '    y2 = rob(n).Y + Half + 45
  '    Line (x1, y1)-(x2, y2), rob(n).color
  '    x1 = x2
  '    y1 = y2
  '    x2 = rob(n).x + Half + 30
  '    y2 = rob(n).Y + Half + 20
  '    Line (x1, y1)-(x2, y2), rob(n).color
      
      'Line (rob(n).x + (Half - 25), rob(n).Y + (Half + 20))-(rob(n).x + (Half - 10), rob(n).Y + (Half + 25))
  '  End With
  If Not Smileys Then
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
       'Update the magnifying lens
      If MagLens.Visible Then
        If Shots(t).pos.x > MagX And Shots(t).pos.x < MagX + MagLens.ScaleWidth And _
           Shots(t).pos.y > MagY And Shots(t).pos.y < MagY + MagLens.ScaleHeight Then
           MagLens.PSet (Shots(t).pos.x - MagX, Shots(t).pos.y - MagY), vbWhite
        End If
      End If
    End If
  Next t
  FillColor = BackColor
End Sub

' internet gates...
Private Sub DrawInternetBoxes()
  FillStyle = 1
  If IntOpts.LastUploadCycle = 0 Then
    PaintPicture Vortice.Picture, IntOpts.XUpload, IntOpts.YUpload, IntOpts.RUpload, IntOpts.RUpload
  Else
    PaintPicture Grata.Picture, IntOpts.XUpload, IntOpts.YUpload, IntOpts.RUpload, IntOpts.RUpload
  End If
  PaintPicture Arrows.Picture, IntOpts.XSpawn, IntOpts.YSpawn, IntOpts.RUpload, IntOpts.RUpload
  FillStyle = 0
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
  
'  PixelsPerTwip = GetTwipWidth
'  PixRobSize = PixelsPerTwip * RobSize
'  PixBorderSize = PixRobSize / 10
'  If PixBorderSize < 1 Then PixBorderSize = 1
  noeyeskin = False
  w = Int(30 / (Form1.visiblew / RobSize) + 1)
'  If (Form1.visiblew / RobSize) > 200 Then noeyeskin = True
  DrawMode = 13
  DrawStyle = 0
  DrawWidth = w
  If IntOpts.Active Then DrawInternetBoxes
  
  If robfocus > 0 And MDIForm1.showVisionGridToggle Then
    Dim low As Single
    Dim highest As Single
    Dim hi As Single
    Dim length As Single
    Dim a As Integer
  
    length = RobSize * 12
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
        length = (RobSize * 100) / rob(robfocus).mem(EyeStart + a + 1) - RobSize + rob(robfocus).radius + rob(robfocus).radius + 1
        If length < 0 Then length = 0
      Else
        DrawMode = vbCopyPen
        length = RobSize * 12
      End If
       
      
      Circle (rob(robfocus).pos.x, rob(robfocus).pos.y), length, vbCyan, -low, -hi
      
      If (a = Abs(rob(robfocus).mem(FOCUSEYE) + 4) Mod 9) Then
        Circle (rob(robfocus).pos.x, rob(robfocus).pos.y), length, vbRed, low, hi
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
      If rob(a).exist Then DrawRobDistPer a
    Next a
    
  Else
    FillColor = BackColor
    
    For a = 1 To MaxRobs
      If rob(a).exist Then DrawRobPer a
    Next a
  End If
  
  DrawStyle = 0
  If dispskin And Not noeyeskin Then
    For a = 1 To MaxRobs
      If rob(a).exist Then DrawRobSkin a
    Next a
  End If
  
  DrawWidth = w * 2
  
  If Not noeyeskin Then
    For a = 1 To MaxRobs
      If rob(a).exist Then DrawRobAim a
    Next a
  End If
End Sub

Public Sub DrawAllTies()
  Dim nd As node, t As Integer
  
  Dim PixelsPerTwip As Single
  Dim PixRobSize As Integer
  
  PixelsPerTwip = GetTwipWidth
  PixRobSize = PixelsPerTwip * RobSize
  
  For t = 1 To MaxRobs
    If rob(t).exist Then DrawRobTiesCol t, PixelsPerTwip * rob(t).radius * 2, rob(t).radius
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
          Dim fileToDelete As File
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
          Dim fileToDelete2 As File
          On Error GoTo bypass2
          Set fileToDelete2 = fso2.GetFile(MDIForm1.MainDir + "/autosave/" + SimOpts.AutoRobPath + CStr(AutoRobNum - 10) + ".dbo")
          fileToDelete2.Delete
bypass2:
        End If
      End If
    End If
  End If
End Sub

' initializes a simulation.
Sub StartSimul()
  Rnd -1 'sets up the randomizer to be seeded
  If SimOpts.UserSeedToggle = True Then
    Randomize SimOpts.UserSeedNumber
  Else
    Randomize Timer
  End If
  
  Over = False
  Init_Buckets
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
  MDIForm1.DontDecayNrgShots.Checked = SimOpts.NoShotDecay
  
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
  For t = 1 To MaxRobs
    rob(t).exist = False
    rob(t).virusshot = 0
  Next t
  
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
  
 ' SimOpts.shapeDriftRate = 5
 ' SimOpts.makeAllShapesBlack = False
 ' SimOpts.makeAllShapesTransparent = False
  defaultWidth = 0.2
  defaultHeight = 0.2
    
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
  
  IntOpts.RUpload = RobSize * 4
  IntOpts.XUpload = 0
  IntOpts.YUpload = 0
  IntOpts.XSpawn = Me.ScaleWidth - IntOpts.XUpload - IntOpts.RUpload
  IntOpts.YSpawn = Me.ScaleHeight - IntOpts.YUpload - IntOpts.RUpload
  IntOpts.ErrorNumber = 0
  
  If ContestMode Then
     FindSpecies
     F1count = 0
  End If
  
  If LeagueMode Then
    LeagueForm.Show
    SimOpts.TotRunCycle = -1
  End If
  
  If SimOpts.MaxEnergy > 5000 Then
    If MsgBox("Your nrg allotment is set to" + Str(SimOpts.MaxEnergy) + ".  A correct value " + _
              "is in the neighborhood of about 10 or so.  Do you want to change your energy allotment " + _
              "to 10?", vbYesNo, "Energy allotment suspicously high.") = vbYes Then
        SimOpts.MaxEnergy = 10
    End If
  End If
 ' MDIForm1.ZoomOut
  main
End Sub

' same, but for a loaded sim
Sub startloaded()
 Dim t As Integer
 
  Rnd -1
  If SimOpts.UserSeedToggle = True Then
    Randomize SimOpts.UserSeedNumber
  Else
    Randomize Timer
  End If
  
  Init_Buckets
  
  If BackPic <> "" And BackPic <> "ScreenSaver" Then
    Form1.Picture = LoadPicture(BackPic)
  Else
    Form1.Picture = Nothing
  End If
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
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
    
  Timer2.Enabled = True
  SecTimer.Enabled = True
  setfeed
  If MDIForm1.visualize Then DrawAllRobs
  MDIForm1.enablesim
  Me.Visible = True
  IntOpts.RUpload = RobSize * 4
  IntOpts.XUpload = 0
  IntOpts.YUpload = 0
  IntOpts.XSpawn = SimOpts.FieldWidth - IntOpts.RUpload
  IntOpts.YSpawn = SimOpts.FieldHeight - IntOpts.RUpload
  IntOpts.WaitForUpload = 10000
  IntOpts.LastUploadCycle = 1
  NoDeaths = True
  
  Vegs.cooldown = 0
  totnvegsDisplayed = SimOpts.Costs(DYNAMICCOSTTARGET) ' Just set this high for the first cycle so the cost low water mark doesn't trigger.
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
      rob(a).Veg = SimOpts.Specie(k).Veg
      rob(a).Fixed = SimOpts.Specie(k).Fixed
      If rob(a).Fixed Then rob(a).mem(216) = 1
      rob(a).pos.x = Random(SimOpts.Specie(k).Poslf * (SimOpts.FieldWidth - 60), SimOpts.Specie(k).Posrg * (SimOpts.FieldWidth - 60))
      rob(a).pos.y = Random(SimOpts.Specie(k).Postp * (SimOpts.FieldHeight - 60), SimOpts.Specie(k).Posdn * (SimOpts.FieldHeight - 60))
      'UpdateBotBucket a
      rob(a).nrg = SimOpts.Specie(k).Stnrg
      rob(a).body = 1000
      rob(a).radius = FindRadius(rob(a).body)
      rob(a).mem(468) = 32000
      rob(a).mem(SetAim) = rob(a).aim * 200
      rob(a).mem(480) = 32000
      rob(a).mem(481) = 32000
      rob(a).mem(482) = 32000
      rob(a).mem(483) = 32000
      rob(a).Dead = False
      If rob(a).Shape = 0 Then
        rob(a).Shape = Random(3, 5)
      End If
            
      rob(a).Mutables = SimOpts.Specie(k).Mutables
      
      For i = 1 To 13
        rob(a).Skin(i) = SimOpts.Specie(k).Skin(i)
      Next i
      
      rob(a).color = SimOpts.Specie(k).color
      'UpdateBotBucket a
      'robocount = robocount + 1
      rob(a).mem(timersys) = Random(-32000, 32000)
      
      rob(a).CantSee = SimOpts.Specie(k).CantSee
      rob(a).DisableDNA = SimOpts.Specie(k).DisableDNA
      rob(a).DisableMovementSysvars = SimOpts.Specie(k).DisableMovementSysvars
      rob(a).CantReproduce = SimOpts.Specie(k).CantReproduce
      rob(a).virusshot = 0
      rob(a).Vtimer = 0
    Next t
    k = k + 1
  Next cc
End Sub

' calls main form status bar update
Public Sub cyccaption(ByVal num As Single)
  MDIForm1.infos num, TotalRobotsDisplayed, totnvegsDisplayed, totvegsDisplayed, SimOpts.TotBorn, SimOpts.TotRunCycle, SimOpts.TotRunTime
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
Private Sub Form_MouseMove(button As Integer, Shift As Integer, x As Single, y As Single)
  Dim st As Long
  Dim sl As Long
  Dim vsv As Long
  Dim hsv As Long
  Dim t As Byte
  Dim vel As vector
  
 
  
  visibleh = Int(Form1.ScaleHeight)
  If button = 0 Then
    MouseClickX = x
    MouseClickY = y
  End If
  
  If button = 1 And Not MDIForm1.insrob And obstaclefocus = 0 And teleporterFocus = 0 Then
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
  
  If button = 1 And robfocus > 0 And DraggingBot Then
    vel = VectorSub(rob(robfocus).pos, VectorSet(x, y))
    rob(robfocus).pos = VectorSet(x, y)
    rob(robfocus).vel = VectorSet(0, 0)
    If Not Active Then Redraw
  End If
  
  If button = 1 And obstaclefocus > 0 Then
  ' Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.x), y - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.y))
   Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (Obstacles.Obstacles(obstaclefocus).Width / 2), y - (Obstacles.Obstacles(obstaclefocus).Height / 2))
    If Not Active Then Redraw
  End If
  
  If button = 1 And teleporterFocus > 0 Then
  ' Obstacles.Obstacles(obstaclefocus).pos = VectorSet(x - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.x), y - (mousepos.x - Obstacles.Obstacles(obstaclefocus).pos.y))
   Teleport.Teleporters(teleporterFocus).pos = VectorSet(x - (Teleport.Teleporters(teleporterFocus).Width / 2), y - (Teleport.Teleporters(teleporterFocus).Height / 2))
    If Not Active Then Redraw
  End If
  
  If GetInputState() <> 0 Then DoEvents
End Sub

' it seems that there's no simple way to know the mouse status
' outside of a Form event. So I've used the event to switch
' on and off some global vars
Private Sub Form_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
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
' there's also the case we're drawing a wall path
Private Sub Form_DblClick()
  Dim n As Integer
  Dim m As Integer
  n = whichrob(CSng(MouseClickX), CSng(MouseClickY))
  If n = 0 Then m = whichTeleporter(CSng(MouseClickX), CSng(MouseClickY))
  If n > 0 And MuriForm.stat = 0 Then
    robfocus = n
    MDIForm1.EnableRobotsMenu
    If Not rob(n).highlight Then deletemark
    datirob.Visible = True
    datirob.RefreshDna
    datirob.ZOrder
    rob(n).genenum = CountGenes(rob(n).DNA)
    datirob.infoupdate n, rob(n).nrg, rob(n).parent, rob(n).Mutations, rob(n).age, rob(n).SonNumber, 1, rob(n).FName, rob(n).genenum, rob(n).LastMut, rob(n).generation, rob(n).DnaLen, rob(n).LastOwner, rob(n).Waste, rob(n).body, rob(n).mass, rob(n).venom, rob(n).shell, rob(n).Slime
  ElseIf m > 0 Then
    TeleportForm.teleporterFormMode = 1
    TeleportForm.Show
  Else
    datirob.Form_Unload 0
    robfocus = 0
    MDIForm1.DisableRobotsMenu
    If ActivForm.Visible Then ActivForm.NoFocus
    If MuriForm.stat = 1 Then MuriForm.storepoints CSng(MouseClickX), CSng(MouseClickY)
  End If
End Sub

' clicking outside robots closes info window
' mind the walls tool
Private Sub Form_Click()
  Dim n As Integer
  Dim m As Integer
  
  If Form1.BackPic = "ScreenSaver" Then
    Form1.BackPic = ""
    Form1.Picture = Nothing
    Form1.PiccyMode = False
    SetWindowPos MDIForm1.hwnd, HWND_TOPMOST, 0, 0, 1000, 1000, 0
    MDIForm1.WindowState = 2
  End If
  
  LogForm.Visible = False
  n = whichrob(CSng(MouseClickX), CSng(MouseClickY))
   
  If n = 0 Then
    m = whichTeleporter(CSng(MouseClickX), CSng(MouseClickY))
    If m <> 0 Then
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
  
  If n = 0 And m = 0 And MuriForm.stat = 0 Then
    datirob.Form_Unload 0
    robfocus = 0
    MDIForm1.DisableRobotsMenu
    If ActivForm.Visible Then ActivForm.NoFocus
    If MuriForm.stat = 1 Then MuriForm.storepoints CSng(MouseClickX), CSng(MouseClickY)
  End If
End Sub

' clicking (well, half-clicking) on a robot selects it
' clicking outside can add a robot if we're in robot insertion
' mode.
Private Sub Form_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  Dim n As Integer
  Dim k As Integer
  Dim m As Integer
  
  'EricL - Zooms in on the position of the mouse when the scroll button is held.
  If button = 4 Then
    ZoomFlag = True
    While ZoomFlag = True
      Form1.visiblew = Form1.visiblew / 1.02
      Form1.visibleh = Form1.visibleh / 1.02
      Form1.ScaleHeight = Form1.visibleh
      Form1.ScaleWidth = Form1.visiblew
      Form1.ScaleTop = y - Form1.ScaleHeight / 2
      Form1.ScaleLeft = x - Form1.ScaleWidth / 2
      Form1.Redraw
      DoEvents
    Wend
  End If
    
  n = whichrob(x, y)
  
  If n = 0 Then
    DraggingBot = False
  Else
    DraggingBot = True
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
  
  If button = 2 Then
    robfocus = n
    If n > 0 Then
      MDIForm1.PopupMenu MDIForm1.popup
      MDIForm1.EnableRobotsMenu
    End If
  End If
  
  If n > 0 And MuriForm.stat = 0 Then
    robfocus = n
    MDIForm1.EnableRobotsMenu
    If Not rob(n).highlight Then deletemark
  ElseIf MuriForm.stat = 1 Then
    MuriForm.storepoints CSng(x), CSng(y)
  End If
  
  If n = 0 And button = 1 And MDIForm1.insrob Then
    k = 0
    While SimOpts.Specie(k).Name <> "" And SimOpts.Specie(k).Name <> MDIForm1.Combo1.text
      k = k + 1
    Wend
    
    If SimOpts.Specie(k).path = "Invalid Path" Then
      MsgBox ("The path for this robot is invalid.")
    Else
      aggiungirob k, x, y
    End If
  End If
  
  If button = 1 And Not MDIForm1.insrob And n = 0 Then
    MouseClicked = True
  End If
  
  If Not MuriForm.stat = 1 Then
    Redraw
  End If
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
    ' let's have immediately the first download
    LastDownload = -(IntOpts.Cycles + 1)
    ' reset the counter for horiz/vertical shuffle
    LastShuffle = 0
    ' let's start conting for the next upload
    IntOpts.LastUploadCycle = 1
  End If
  
  ' same as above, but checking totruncycle<lastcycle instead
  If SimOpts.TotRunCycle < TenSecondsAgo((SimOpts.TotRunTime + 9) Mod 10) Then
    For i = 0 To 9
      TenSecondsAgo(i) = SimOpts.TotRunCycle
    Next i
    ' facciamo avvenire subito il primo download
    LastDownload = -(IntOpts.Cycles + 1)
    LastShuffle = 0
    IntOpts.LastUploadCycle = 0
  End If
  
  ' if we've had 5000 cycles in a second, probably we've
  ' loaded a saved sim. So we need to reset some counters
  If SimOpts.TotRunCycle - TenSecondsAgo((SimOpts.TotRunTime + 9) Mod 10) > 5000 Then
    For i = 0 To 9
      TenSecondsAgo(i) = SimOpts.TotRunCycle
    Next i
    ' facciamo avvenire subito il primo download
    LastDownload = -(IntOpts.Cycles + 1)
    ' facciamo avvenire uno shuffle fra 50000 cicli
    LastShuffle = SimOpts.TotRunCycle - 50000
    ' facciamo avvenire l'upload quando gli spetta
    IntOpts.LastUploadCycle = SimOpts.TotRunCycle
  End If
  
  ' switch on the internet upload if at least WaitForUpload cycles
  ' have passed from last upload. LastUploadCycle=0 is used as a flag
  ' to indicate upload enabled
  If SimOpts.TotRunCycle - IntOpts.LastUploadCycle > IntOpts.WaitForUpload Then
    IntOpts.LastUploadCycle = 0
  End If
  
  ' update status bar in MDI formMod
  
  TenSecondsAgo(SimOpts.TotRunTime Mod 10) = SimOpts.TotRunCycle
  SimOpts.CycSec = CSng(CSng(CSng(SimOpts.TotRunCycle) - CSng(TenSecondsAgo((SimOpts.TotRunTime + 1) Mod 10))) * 0.1)
     
  cyccaption SimOpts.CycSec
  
  ' show cycles to next u/l d/l in title of internet log win (bugged!)
  If LogForm.Visible Then
    TitLog = "Log window  ---  "
    TitLog = TitLog + "Cycles to: next d/l: " + CStr(IntOpts.Cycles - SimOpts.TotRunCycle + LastDownload)
    TitLog = TitLog + "  next u/l: " + CStr(50000 - SimOpts.TotRunCycle + LastDownload)
    LogForm.Caption = TitLog
  End If
  
' ' when all robots are dead, stop everything or, if possible,
' ' download one frome internet
' ' Modified to allow for auto restart of Simulations
' ' EricL 4/15/2006 Commented out casue we were going in here at sim start...
' ' If totnvegs = 0 Then
' '  If Not IntOpts.Active Then
'      'Form1.Active = False
'      'MsgBox (MBrobotsdead)
'      'SecTimer.Enabled = False
'   Else
'     If LoadRandomOrg(CSng(IntOpts.XSpawn + IntOpts.RUpload / 4), CSng(IntOpts.YSpawn + IntOpts.RUpload / 4)) Then
'       LastDownload = SimOpts.TotRunCycle
'     Else
'       LastDownload = SimOpts.TotRunCycle - IntOpts.Cycles + 5000
'     End If
'   End If
' End If

  ' download organism from server every IntOpts.Cycles
  If IntOpts.Active And (SimOpts.TotRunCycle - LastDownload) > IntOpts.Cycles Then
    LoadRandomOrg CSng(IntOpts.XSpawn + IntOpts.RUpload / 4), CSng(IntOpts.YSpawn + IntOpts.RUpload / 4)
    LastDownload = SimOpts.TotRunCycle
  End If
  
  ' provides the mutation rates oscillation
  If SimOpts.MutOscill Then
    If MutPhase = 0 And MutCyc > SimOpts.MutCycMax Then
      MutCyc = 0
      MutPhase = 1
      SimOpts.MutCurrMult = 1 / 16
    End If
    If MutPhase = 1 And MutCyc > SimOpts.MutCycMin Then
      MutCyc = 0
      MutPhase = 0
      SimOpts.MutCurrMult = 16
    End If
  End If
End Sub


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
        On Error GoTo SaveError  'EricL - Uncomment this line in compiled version! error.sim
      End If
      
      Form1.SecTimer.Enabled = True
           
      UpdateSim
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
          datirob.infoupdate robfocus, .nrg, .parent, .Mutations, .age, .SonNumber, 1, .FName, .genenum, .LastMut, .generation, .DnaLen, .LastOwner, .Waste, .body, .mass, .venom, .shell, .Slime
        End With
      End If
      
      ' feeds graphs with data:
      If SimOpts.TotRunCycle Mod SimOpts.chartingInterval = 0 Then
        For i = 1 To 10
          If Not (Charts(i).graf Is Nothing) Then
            FeedGraph (i)
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
  Loop
  Exit Sub
  
SaveError:
  MsgBox "Error. " + Err.Description + ".  Saving sim in saves directory as error.sim"
  
TryAgain:
  On Error GoTo missingdir
  SaveSimulation MDIForm1.MainDir + "\saves\error.sim"
missingdir:
 If Err.Number = 76 Then
    b = MsgBox("Cannot find the Saves Directory to save error.sim.  " + vbCrLf + _
            "Would you like me to create one?   " + vbCrLf + vbCrLf + _
            "If this is a new install, choose OK.", vbOKCancel + vbQuestion)
    If b = vbOK Then
       MkDir (MDIForm1.MainDir + "\saves")
       GoTo TryAgain
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
  For t = 1 To UBound(rob())
    rob(t).highlight = False
  Next t
End Sub

'
'   W A L L S
'

' creates a single wall block in pos x,y
Sub CreaMuro(x As Long, y As Long)
  Dim n As Integer, t As Integer
  n = posto
  rob(n).FName = "Wall"
  rob(n).exist = True
  rob(n).wall = True
  rob(n).Fixed = True
  rob(n).pos.x = x
  rob(n).pos.y = y
  'UpdateBotBucket n
  rob(n).nrg = 1
  rob(n).color = vbWhite
  rob(n).condnum = 0
  Erase rob(n).mem
  ReDim rob(n).DNA(10)
  For t = 1 To 10
    rob(n).DNA(t).tipo = 4
    rob(n).DNA(t).value = 4
  Next t
  For t = 0 To 10
    rob(n).occurr(t) = 0
  Next t
  For t = 0 To 12
    rob(n).Skin(t) = 0
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
  '  Charts(n).graf.SetYLabel YLab ' EricL - Don't need this line - dup of line below
  End If
  
  'Charts(n).graf.SetYLabel YLab ' EricL 4/7/2006 Commented out - just no longer need to call SetYLabel
  
  'EricL 4/7/2006 Just set the caption directly now without adding "/ Cycles..." to teh end of the caption
  Charts(n).graf.Caption = YLab
  
  Charts(n).graf.Show
  
  'EricL - 3/27/2006 Get the first data point and show the graph key right from the start
  FeedGraph n
  
End Sub

' resets all graphs
Public Sub ResetGraphs()
  Dim k As Integer
  For k = 1 To 10
    If Not (Charts(k).graf Is Nothing) Then
      Charts(k).graf.ResetGraph
    End If
  Next k
End Sub

' feeds graphs with new data
Public Sub FeedGraph(graphNumber As Integer)
  Dim nomi(30) As String
  Dim dati(30, 10) As Single
  Dim t As Integer, k As Integer, P As Integer
  Dim startingChart As Integer, endingChart As Integer
  
  ' This should never be the case.
  If graphNumber < 0 Or graphNumber > 10 Then Exit Sub
  
  CalcStats nomi, dati, graphNumber
  
  If graphNumber = 0 Then
    ' Update all the graphs
    startingChart = 1
    endingChart = 10
  Else
    ' Only update one graph
    startingChart = graphNumber
    endingChart = graphNumber
  End If
    
  t = Flex.last(nomi)
  
  For k = startingChart To endingChart
    If k = 10 Then t = 1
    For P = 1 To t
      If Not (Charts(k).graf Is Nothing) Then
        If k <> 10 Then
          Charts(k).graf.SetValues nomi(P), dati(P, k)
        Else
          Charts(k).graf.SetValues "Cost Multiplier", dati(1, k)
          Charts(k).graf.SetValues "Population / Target", dati(2, k)
          Charts(k).graf.SetValues "Upper Range", dati(3, k)
          Charts(k).graf.SetValues "Lower Range", dati(4, k)
          Charts(k).graf.SetValues "Zero Level", dati(5, k)
          Charts(k).graf.SetValues "Reinstatement Level", dati(6, k)
        End If
      End If
    Next P
  Next k
  For k = startingChart To endingChart
    If Not (Charts(k).graf Is Nothing) Then
      Charts(k).graf.NewPoints
      If Charts(k).graf.Visible Then
        Charts(k).graf.RedrawGraph
      End If
    End If
  Next k
End Sub

' calculates data for the different graph types
Private Sub CalcStats(ByRef nomi, ByRef dati, graphNum As Integer)
  Dim P As Integer, t As Integer
  Dim n As node
  Dim Population As Integer
 ' Dim numbots As Integer
 
  If SimOpts.Costs(DYNAMICCOSTINCLUDEPLANTS) = 0 Then
    Population = totnvegsDisplayed
  Else
    Population = totnvegsDisplayed + totvegsDisplayed
  End If
    
  'EricL - Modified in 2.42.5 to handle each graph separatly for perf reasons
 ' numbots = 0
  Select Case graphNum
  Case 0 ' Do all the graphs
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 2) = dati(P, 2) + .LastMut + .Mutations
        dati(P, 3) = dati(P, 3) + (.age / 100) ' EricL 4/7/2006 Graph age in 100's of cycles
        dati(P, 4) = dati(P, 4) + .SonNumber
        dati(P, 5) = dati(P, 5) + .nrg
        dati(P, 6) = dati(P, 6) + .DnaLen
        dati(P, 7) = dati(P, 7) + .condnum
        dati(P, 8) = dati(P, 8) + (.LastMut + .Mutations) / .DnaLen
        dati(P, 9) = dati(P, 9) + (.nrg + .body * 10) * 0.001
      End If
      End With
    Next t
    t = Flex.last(nomi)
    If dati(P, 1) <> 0 Then
    For P = 1 To t
      dati(P, 2) = dati(P, 2) / dati(P, 1)
      dati(P, 3) = dati(P, 3) / dati(P, 1)
      dati(P, 4) = dati(P, 4) / dati(P, 1)
      dati(P, 5) = dati(P, 5) / dati(P, 1)
      dati(P, 6) = dati(P, 6) / dati(P, 1)
      dati(P, 7) = dati(P, 7) / dati(P, 1)
      dati(P, 8) = dati(P, 8) / dati(P, 1)
  '    dati(P, 9) = dati(P, 9) / dati(P, 1)
    Next P
    End If
    dati(1, 10) = SimOpts.Costs(COSTMULTIPLIER)
    
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(2, 10) = Population
    Else
      dati(2, 10) = Population / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
    
    dati(3, 10) = 1 + (SimOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) * 0.01)
    dati(4, 10) = 1 - (SimOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) * 0.01)
     If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(5, 10) = SimOpts.Costs(BOTNOCOSTLEVEL)
      dati(6, 10) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL)
    Else
      dati(5, 10) = SimOpts.Costs(BOTNOCOSTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
      dati(6, 10) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
      
    
  Case 1
    For t = 1 To MaxRobs
      With rob(t)
     ' If Not .wall And .exist Then
      If .exist Then
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
      End If
      End With
    Next t
       
  Case 2
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
  '    numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 2) = dati(P, 2) + .LastMut + .Mutations
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 2) = dati(P, 2) / dati(P, 1)
    Next P
    
    
  Case 3
   For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
  '      numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 3) = dati(P, 3) + (.age / 100) ' EricL 4/7/2006 Graph age in 100's of cycles
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 3) = dati(P, 3) / dati(P, 1)
    Next P

  Case 4
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 4) = dati(P, 4) + .SonNumber
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 4) = dati(P, 4) / dati(P, 1)
    Next P

   
  Case 5
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 5) = dati(P, 5) + .nrg
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 5) = dati(P, 5) / dati(P, 1)
    Next P

   
  Case 6
    For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 6) = dati(P, 6) + .DnaLen
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 6) = dati(P, 6) / dati(P, 1)
    Next P

   
  Case 7
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
      '  numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 7) = dati(P, 7) + .condnum
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 7) = dati(P, 7) / dati(P, 1)
    Next P

   
  Case 8
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 1) = dati(P, 1) + 1
        dati(P, 8) = dati(P, 8) + (.LastMut + .Mutations) / .DnaLen
      End If
      End With
    Next t
    t = Flex.last(nomi)
    For P = 1 To t
      If dati(P, 1) <> 0 Then dati(P, 8) = dati(P, 8) / dati(P, 1)
    Next P

   
  Case 9
  For t = 1 To MaxRobs
      With rob(t)
      'If Not .wall And .exist Then
      If .exist Then
       ' numbots = numbots + 1
        P = Flex.Position(rob(t).FName, nomi)
        dati(P, 9) = dati(P, 9) + (.nrg + .body * 10) * 0.001
      End If
      End With
    Next t
    
  Case 10
    dati(1, 10) = SimOpts.Costs(COSTMULTIPLIER)
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(2, 10) = Population
    Else
      dati(2, 10) = Population / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
        
    dati(3, 10) = 1 + (SimOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) * 0.01)
    dati(4, 10) = 1 - (SimOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) * 0.01)
    If SimOpts.Costs(DYNAMICCOSTTARGET) = 0 Then ' Divide by zero protection
      dati(5, 10) = SimOpts.Costs(BOTNOCOSTLEVEL)
      dati(6, 10) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL)
    Else
      dati(5, 10) = SimOpts.Costs(BOTNOCOSTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
      dati(6, 10) = SimOpts.Costs(COSTXREINSTATEMENTLEVEL) / SimOpts.Costs(DYNAMICCOSTTARGET)
    End If
  End Select
End Sub

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
  Dim t As Integer
  Dim s As Double
  Dim Mx As Double
  Mx = 0
  For t = 1 To MaxRobs
    If rob(t).exist And Not rob(t).Veg Then
      s = score(t, 1, 2, 0)
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
        score = score + InvestedEnergy(t)
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
Function InvestedEnergy(t As Integer) As Double
'returns the amount of invested energy this bot has
'later will change to incorporate advanced energy types
  'InvestedEnergy = rob(t).nrg + rob(t).body * 10
  InvestedEnergy = 1
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
Public Sub t_MouseDown(ByVal button As Integer)
  If MDIForm1.stealthmode Then
    MDIForm1.Show
    t.Remove
    MDIForm1.stealthmode = False
  End If
End Sub

