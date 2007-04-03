VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form ObstacleForm 
   Caption         =   "Shapes"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6945
   LinkTopic       =   "Form2"
   ScaleHeight     =   6300
   ScaleWidth      =   6945
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame5 
      Caption         =   "Physicality"
      Height          =   2295
      Left            =   5160
      TabIndex        =   33
      Top             =   2400
      Width           =   1695
      Begin VB.CheckBox ShapesVisableCheck 
         Caption         =   "Bots can see shapes"
         Height          =   495
         Left            =   120
         TabIndex        =   36
         Top             =   360
         Width           =   1455
      End
      Begin VB.CheckBox ShapesAbsorbShotsCheck 
         Caption         =   "Shapes absorb shots"
         Height          =   495
         Left            =   120
         TabIndex        =   35
         Top             =   1440
         Width           =   1455
      End
      Begin VB.CheckBox ShapesSeeThroughCheck 
         Caption         =   "Bots can see through shapes"
         Height          =   495
         Left            =   120
         TabIndex        =   34
         Top             =   960
         Width           =   1455
      End
   End
   Begin VB.CheckBox HorizontalDriftCheck 
      Caption         =   "Allow Horizontal Drift"
      Height          =   255
      Left            =   600
      TabIndex        =   31
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Frame Maze 
      Caption         =   "Maze Properties"
      Height          =   2055
      Left            =   120
      TabIndex        =   22
      Top             =   4080
      Width           =   4935
      Begin MSComctlLib.Slider MazeWidthSlider 
         Height          =   555
         Left            =   1200
         TabIndex        =   23
         Top             =   480
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   979
         _Version        =   393216
         LargeChange     =   50
         Min             =   300
         Max             =   5000
         SelStart        =   300
         TickFrequency   =   100
         Value           =   300
      End
      Begin MSComctlLib.Slider WallThicknessSlider 
         Height          =   555
         Left            =   1200
         TabIndex        =   27
         Top             =   1320
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   979
         _Version        =   393216
         LargeChange     =   50
         Min             =   1
         Max             =   500
         SelStart        =   300
         TickFrequency   =   10
         Value           =   300
      End
      Begin VB.Label Label15 
         Caption         =   "Thick"
         Height          =   255
         Left            =   4200
         TabIndex        =   30
         Top             =   1080
         Width           =   495
      End
      Begin VB.Label Label14 
         Caption         =   "Thin"
         Height          =   255
         Left            =   1320
         TabIndex        =   29
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label Label13 
         Caption         =   "Wall Thickness"
         Height          =   495
         Left            =   360
         TabIndex        =   28
         Top             =   1320
         Width           =   735
      End
      Begin VB.Label Label12 
         Caption         =   "Corridor Width"
         Height          =   495
         Left            =   360
         TabIndex        =   26
         Top             =   480
         Width           =   735
      End
      Begin VB.Label Label11 
         Caption         =   "Wide"
         Height          =   255
         Left            =   4320
         TabIndex        =   25
         Top             =   240
         Width           =   375
      End
      Begin VB.Label Label10 
         Caption         =   "Narrow"
         Height          =   255
         Left            =   1320
         TabIndex        =   24
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Movement"
      Height          =   1575
      Left            =   120
      TabIndex        =   17
      Top             =   2400
      Width           =   4935
      Begin VB.CheckBox VerticalDriftCheck 
         Caption         =   "Allow Vertical Drift"
         Height          =   255
         Left            =   2760
         TabIndex        =   32
         Top             =   240
         Width           =   1815
      End
      Begin MSComctlLib.Slider DriftRateSlider 
         Height          =   555
         Left            =   1200
         TabIndex        =   18
         Top             =   840
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   979
         _Version        =   393216
         LargeChange     =   50
         Min             =   1
         Max             =   1000
         SelStart        =   1
         TickFrequency   =   20
         Value           =   1
      End
      Begin VB.Label Label9 
         Caption         =   "Fast"
         Height          =   255
         Left            =   4440
         TabIndex        =   21
         Top             =   600
         Width           =   375
      End
      Begin VB.Label Label8 
         Caption         =   "Slow"
         Height          =   255
         Left            =   1200
         TabIndex        =   20
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label7 
         Caption         =   "Velocity"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   840
         Width           =   855
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Appearance"
      Height          =   1095
      Left            =   5160
      TabIndex        =   6
      Top             =   1200
      Width           =   1695
      Begin VB.OptionButton OpaqueOption 
         Caption         =   "Opaque"
         Height          =   375
         Left            =   240
         TabIndex        =   8
         Top             =   600
         Width           =   1215
      End
      Begin VB.OptionButton TransparentOption 
         Caption         =   "Transparent"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Color"
      Height          =   1095
      Left            =   5160
      TabIndex        =   3
      Top             =   120
      Width           =   1695
      Begin VB.OptionButton BlackColorOption 
         Caption         =   "Black"
         Height          =   375
         Left            =   240
         TabIndex        =   5
         Top             =   600
         Width           =   1215
      End
      Begin VB.OptionButton RandomColorOption 
         Caption         =   "Random"
         Height          =   375
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.CommandButton MakeShape 
      Caption         =   "Add Shape"
      Height          =   375
      Left            =   5400
      TabIndex        =   2
      Top             =   5280
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Dimensions"
      Height          =   2175
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4935
      Begin MSComctlLib.Slider HeightSlider 
         Height          =   555
         Left            =   1200
         TabIndex        =   12
         Top             =   480
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   979
         _Version        =   393216
         LargeChange     =   50
         Min             =   1
         Max             =   1000
         SelStart        =   1
         TickFrequency   =   25
         Value           =   1
      End
      Begin MSComctlLib.Slider WidthSlider 
         Height          =   555
         Left            =   1200
         TabIndex        =   13
         Top             =   1440
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   979
         _Version        =   393216
         LargeChange     =   50
         Min             =   1
         Max             =   1000
         SelStart        =   1
         TickFrequency   =   25
         Value           =   1
      End
      Begin VB.Label Label6 
         Caption         =   "Fat"
         Height          =   255
         Left            =   4440
         TabIndex        =   16
         Top             =   1200
         Width           =   255
      End
      Begin VB.Label Label5 
         Caption         =   "Skinny"
         Height          =   255
         Left            =   1200
         TabIndex        =   15
         Top             =   1200
         Width           =   615
      End
      Begin VB.Label Label4 
         Caption         =   "Width"
         Height          =   255
         Left            =   360
         TabIndex        =   14
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "Tall"
         Height          =   255
         Left            =   4320
         TabIndex        =   11
         Top             =   240
         Width           =   375
      End
      Begin VB.Label Label2 
         Caption         =   "Short"
         Height          =   255
         Left            =   1200
         TabIndex        =   10
         Top             =   240
         Width           =   615
      End
      Begin VB.Label Label1 
         Caption         =   "Height"
         Height          =   255
         Left            =   360
         TabIndex        =   9
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.CommandButton OK 
      Caption         =   "OK"
      Height          =   375
      Left            =   5400
      TabIndex        =   0
      Top             =   5760
      Width           =   1215
   End
End
Attribute VB_Name = "ObstacleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Copyright (c) 2006 Eric Lockard
' eric@sulaadventures.com
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

Private Sub ShapesAbsorbShotsCheck_Click()
   SimOpts.shapesAbsorbShots = ShapesAbsorbShotsCheck.value
End Sub

Private Sub ShapesSeeThroughCheck_Click()
  SimOpts.shapesAreSeeThrough = ShapesSeeThroughCheck.value
  If SimOpts.shapesAreSeeThrough Then
   ShapesVisableCheck.Enabled = False
   SimOpts.shapesAreVisable = False
 Else
   ShapesVisableCheck.Enabled = True
   SimOpts.shapesAreVisable = ShapesVisableCheck.value
 End If
End Sub

Private Sub ShapesVisableCheck_Click()
 SimOpts.shapesAreVisable = ShapesVisableCheck.value
 If SimOpts.shapesAreVisable Then
   ShapesSeeThroughCheck.Enabled = False
   SimOpts.shapesAreSeeThrough = False
 Else
   ShapesSeeThroughCheck.Enabled = True
   SimOpts.shapesAreSeeThrough = ShapesSeeThroughCheck.value
 End If
End Sub

Private Sub VerticalDriftCheck_Click()
  SimOpts.allowVerticalShapeDrift = VerticalDriftCheck.value
  If Not SimOpts.allowVerticalShapeDrift Then Obstacles.StopAllVerticalObstacleMovement
End Sub

Private Sub BlackColorOption_Click()
  SimOpts.makeAllShapesBlack = True
  ChangeAllObstacleColor vbBlack
  RandomColorOption.value = False
End Sub

Private Sub Cancel_Click()
  Me.Hide
End Sub

Private Sub DriftRateSlider_Change()
  SimOpts.shapeDriftRate = DriftRateSlider.value
  If leftCompactor > 0 Then Obstacles.Obstacles(leftCompactor).vel.x = (SimOpts.shapeDriftRate * 0.1) * Sgn(Obstacles.Obstacles(leftCompactor).vel.x)
  If rightCompactor > 0 Then Obstacles.Obstacles(rightCompactor).vel.x = (SimOpts.shapeDriftRate * 0.1) * Sgn(Obstacles.Obstacles(rightCompactor).vel.x)
End Sub

Public Sub InitShapesDialog()
  TransparentOption.value = SimOpts.makeAllShapesTransparent
  OpaqueOption.value = Not SimOpts.makeAllShapesTransparent
  RandomColorOption.value = Not SimOpts.makeAllShapesBlack
  BlackColorOption.value = SimOpts.makeAllShapesBlack
  WidthSlider.value = CInt(defaultWidth * 1000)
  HeightSlider.value = CInt(defaultHeight * 1000)
  DriftRateSlider.value = SimOpts.shapeDriftRate
  If SimOpts.allowHorizontalShapeDrift Then HorizontalDriftCheck.value = 1 Else HorizontalDriftCheck.value = 0
  If SimOpts.allowVerticalShapeDrift Then VerticalDriftCheck.value = 1 Else VerticalDriftCheck.value = 0
  MazeWidthSlider.value = mazeCorridorWidth
  WallThicknessSlider.value = mazeWallThickness
  If SimOpts.shapesAreSeeThrough Then ShapesSeeThroughCheck.value = 1 Else ShapesSeeThroughCheck.value = 0
  If SimOpts.shapesAbsorbShots Then ShapesAbsorbShotsCheck.value = 1 Else ShapesAbsorbShotsCheck.value = 0
  If SimOpts.shapesAreVisable Then ShapesVisableCheck.value = 1 Else ShapesVisableCheck.value = 0
End Sub

Private Sub HeightSlider_Change()
  defaultHeight = HeightSlider.value * 0.001
End Sub

Private Sub HorizontalDriftCheck_Click()
  SimOpts.allowHorizontalShapeDrift = HorizontalDriftCheck.value
  If Not SimOpts.allowHorizontalShapeDrift Then Obstacles.StopAllHorizontalObstacleMovement
End Sub

Private Sub MakeShape_Click()
Dim randomX As Single
Dim randomY As Single

randomX = Random(0, SimOpts.FieldWidth) - SimOpts.FieldWidth * (defaultWidth / 2)
randomY = Random(0, SimOpts.FieldHeight) - SimOpts.FieldHeight * (defaultHeight / 2)
NewObstacle randomX, randomY, SimOpts.FieldWidth * defaultWidth, SimOpts.FieldHeight * defaultHeight
End Sub

Private Sub MazeWidthSlider_Change()
  mazeCorridorWidth = MazeWidthSlider.value
End Sub

Private Sub OK_Click()
  Me.Hide
End Sub

Private Sub OpaqueOption_Click()
  SimOpts.makeAllShapesTransparent = False
  TransparentOption.value = False
End Sub

Private Sub RandomColorOption_Click()
  BlackColorOption.value = False
  ChangeAllObstacleColor -1
  SimOpts.makeAllShapesBlack = False
End Sub

Private Sub TransparentOption_Click()
  SimOpts.makeAllShapesTransparent = True
  OpaqueOption.value = False
End Sub

Private Sub WallThicknessSlider_Click()
  mazeWallThickness = WallThicknessSlider.value
End Sub

Private Sub WidthSlider_Change()
  defaultWidth = WidthSlider.value * 0.001
End Sub
