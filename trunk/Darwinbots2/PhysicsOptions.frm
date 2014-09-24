VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form PhysicsOptions 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Advanced Physics Options"
   ClientHeight    =   5850
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9330
   Icon            =   "PhysicsOptions.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5850
   ScaleWidth      =   9330
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command 
      Caption         =   "Okay"
      Height          =   435
      Index           =   2
      Left            =   7320
      TabIndex        =   24
      Top             =   5280
      Width           =   1815
   End
   Begin VB.Frame Frame4 
      Caption         =   "Misc"
      Height          =   3375
      Left            =   4980
      TabIndex        =   11
      Top             =   120
      Width           =   4215
      Begin VB.Frame Frame6 
         Caption         =   "Planet Eaters"
         Height          =   1095
         Left            =   2340
         TabIndex        =   25
         Top             =   2220
         Width           =   1755
         Begin VB.CheckBox Toggles 
            Caption         =   "Planet Eaters"
            Height          =   315
            Index           =   1
            Left            =   180
            TabIndex        =   27
            Top             =   300
            Width           =   1275
         End
         Begin VB.TextBox PlanetEatersText 
            Height          =   285
            Left            =   420
            TabIndex        =   26
            Text            =   "100"
            Top             =   630
            Width           =   555
         End
         Begin VB.Label Label4 
            Caption         =   "G:  XXXXX E+3"
            Height          =   255
            Left            =   180
            TabIndex        =   28
            Top             =   660
            Width           =   1215
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Toggles"
         Height          =   1095
         Left            =   120
         TabIndex        =   21
         Top             =   2220
         Width           =   2175
         Begin VB.CheckBox Toggles 
            Caption         =   "Zero Momentum"
            Height          =   315
            Index           =   0
            Left            =   180
            TabIndex        =   22
            Top             =   480
            Width           =   1515
         End
      End
      Begin MSComctlLib.Slider MiscSlider 
         Height          =   615
         Index           =   0
         Left            =   1380
         TabIndex        =   13
         Top             =   240
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   10
      End
      Begin MSComctlLib.Slider MiscSlider 
         Height          =   615
         Index           =   1
         Left            =   1380
         TabIndex        =   16
         Top             =   900
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   10
      End
      Begin MSComctlLib.Slider MiscSlider 
         Height          =   615
         Index           =   2
         Left            =   1380
         TabIndex        =   19
         Top             =   1620
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   10
      End
      Begin VB.Label MiscText 
         Caption         =   "0"
         Height          =   315
         Index           =   2
         Left            =   3720
         TabIndex        =   20
         Top             =   1800
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Brownian Motion"
         Height          =   255
         Index           =   5
         Left            =   180
         TabIndex        =   18
         Top             =   1800
         Width           =   1215
      End
      Begin VB.Label MiscText 
         Caption         =   "0"
         Height          =   315
         Index           =   1
         Left            =   3720
         TabIndex        =   17
         Top             =   1080
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Y azis Gravity"
         Height          =   255
         Index           =   4
         Left            =   180
         TabIndex        =   15
         Top             =   1080
         Width           =   1155
      End
      Begin VB.Label MiscText 
         Caption         =   "0%"
         Height          =   315
         Index           =   0
         Left            =   3720
         TabIndex        =   14
         Top             =   420
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Bang Efficiency"
         Height          =   255
         Index           =   3
         Left            =   180
         TabIndex        =   12
         Top             =   420
         Width           =   1155
      End
   End
   Begin VB.CommandButton Command 
      Caption         =   "General Help"
      Height          =   435
      Index           =   3
      Left            =   3720
      TabIndex        =   10
      Top             =   5280
      Width           =   1815
   End
   Begin VB.Frame Frame3 
      Caption         =   "Friction"
      Height          =   2415
      Left            =   120
      TabIndex        =   9
      Top             =   2700
      Width           =   4695
      Begin MSComctlLib.Slider Friction 
         Height          =   615
         Index           =   0
         Left            =   1440
         TabIndex        =   29
         Top             =   240
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   100
         TickStyle       =   2
         TickFrequency   =   10
      End
      Begin MSComctlLib.Slider Friction 
         Height          =   615
         Index           =   2
         Left            =   1440
         TabIndex        =   30
         Top             =   990
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   150
         TickStyle       =   2
         TickFrequency   =   15
      End
      Begin MSComctlLib.Slider Friction 
         Height          =   615
         Index           =   1
         Left            =   1440
         TabIndex        =   35
         Top             =   1740
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   1085
         _Version        =   393216
         Max             =   150
         TickStyle       =   2
         TickFrequency   =   15
      End
      Begin VB.Label Label3 
         Caption         =   "Kinetic Coefficient"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   37
         Top             =   1920
         Width           =   1395
      End
      Begin VB.Label FrictionText 
         Caption         =   "0"
         Height          =   195
         Index           =   1
         Left            =   4080
         TabIndex        =   36
         Top             =   1920
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Z axis Gravity"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   34
         Top             =   420
         Width           =   1275
      End
      Begin VB.Label Label3 
         Caption         =   "Static Coefficient"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   33
         Top             =   1170
         Width           =   1275
      End
      Begin VB.Label FrictionText 
         Caption         =   "0"
         Height          =   195
         Index           =   0
         Left            =   4080
         TabIndex        =   32
         Top             =   360
         Width           =   435
      End
      Begin VB.Label FrictionText 
         Caption         =   "0"
         Height          =   195
         Index           =   2
         Left            =   4080
         TabIndex        =   31
         Top             =   1170
         Width           =   435
      End
   End
   Begin VB.CommandButton Command 
      Caption         =   "Help on Units"
      Height          =   435
      Index           =   0
      Left            =   120
      TabIndex        =   8
      Top             =   5280
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Height          =   1455
      Left            =   4980
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Text            =   "PhysicsOptions.frx":08CA
      Top             =   3660
      Width           =   4215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Fluid Dynamics"
      Height          =   2415
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4695
      Begin VB.CommandButton Command1 
         Caption         =   "?"
         Height          =   255
         Left            =   2760
         TabIndex        =   23
         Top             =   1680
         Width           =   255
      End
      Begin VB.TextBox FluidText 
         Enabled         =   0   'False
         Height          =   255
         Index           =   2
         Left            =   1560
         TabIndex        =   7
         Text            =   "10000"
         Top             =   1680
         Width           =   1215
      End
      Begin VB.TextBox FluidText 
         Height          =   315
         Index           =   1
         Left            =   1020
         TabIndex        =   4
         Text            =   "10"
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox FluidText 
         Height          =   315
         Index           =   0
         Left            =   1020
         TabIndex        =   3
         Text            =   "100"
         Top             =   420
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Reynold's Number for an average bot moving at 1 twip/cycle:"
         Height          =   435
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   1440
         Width           =   3195
      End
      Begin VB.Label Label1 
         Caption         =   "Density:    XXXXXXXXXE-7 Mass per cubic twip"
         Height          =   255
         Index           =   1
         Left            =   300
         TabIndex        =   2
         Top             =   900
         Width           =   4155
      End
      Begin VB.Label Label1 
         Caption         =   "Viscosity:  XXXXXXXXXE-5 Bangs per square twips"
         Height          =   255
         Index           =   0
         Left            =   300
         TabIndex        =   1
         Top             =   480
         Width           =   4095
      End
   End
End
Attribute VB_Name = "PhysicsOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 6/12/2012 form's icon change

Private Sub Command_Click(Index As Integer)
  Select Case Index
    Case 0 'help on units
      Text1.text = "Darwinbots uses the following units:" + vbCrLf + vbCrLf + _
        "Distance : Twip.  A small bot has a diameter of 120 twips." + vbCrLf + vbCrLf + _
        "Time : Cycle. The smallest measure of time possible is a single cycle" + vbCrLf + vbCrLf + _
        "Mass : Mass.  Yes, the unit is called a Mass.  A small bot has a mass of roughly 1 Mass." + vbCrLf + vbCrLf + _
        "Force :                            .  Mass twip per cycle per cycle.  A Bang of one cycle has a force of one Darwin." + vbCrLf + vbCrLf + _
        "Energy : NRG.  1 NRG is the basic unit block of what a bot reads back as " + _
        "*.nrg.  Each Bang costs 1 NRG under ideal settings." + vbCrLf + vbCrLf + _
        "Impulse : Bang.  A Bang is a measure of the change in momentum of " + _
          "an object over a given time period, as well as a measure of flow " + _
          "of energy.  A robot under ideal conditions doing 1 .up store is " + _
          "spending 1 NRG and producing 1 Bang."
    Case 1, 2
      Me.Hide
    Case 3 'general help
      Text1.text = "The medium in which the bots live has some remarkable " + _
        "properties that can become difficult to invision all at once.  " + _
        "Imagine their world is shaped like a piece of paper.  It's very " + _
        "long and very wide, but not very deep.  For friction, 'down' is " + _
        "considered to be in the direction of depth, that is, into your screen.  " + _
        "Since bots cannot move in this direction, Z axis Gravity only effects " + _
        "the force of friction.  Y axis gravity is imagining that 'down' for " + _
        "the bots and 'down' for you, the user, are the same.  " + vbCrLf + vbCrLf + _
        "For the purposes " + _
        "of friction, the bots are considered to be sliding along on a solid " + _
        "surface.  For purposes of drag (fluid dynamics) and bouyancy, it's " + _
        "supposed that the bots are living in an infinite body of liquid which " + _
        "can flow around them in all 3 dimensions." + vbCrLf + vbCrLf + _
        "If the above paragraphs just confused the heck out of you, don't worry.  " + _
        "That's why there's presets on the main options page.  If you still feel " + _
        "up to playing with the sliders, I feel confidant you'll soon understand " + _
        "the effects with a little practice."
  End Select
End Sub

Private Sub Command1_Click()
  Text1.text = "Reynolds number is a unitless representation of the ratio of " + _
    "turbulent forces to laminar forces.  Low Reynolds numbers mean a Laminar " + _
    "flow, while high numbers mean a turbulent flow.  The program will only " + _
    "use this number if flow type is dynamic.  Otherwise it's for your " + _
    "information only.  A reynolds number of less than 3E+5 is characteristic " + _
    "of Laminar flows."
End Sub

Private Sub FluidText_GotFocus(Index As Integer)
  Select Case Index
    Case 0 'viscosity
      Text1.text = "Viscosity currently only effects bots under laminar " + _
        "flow types.  Resistive force under laminar flow = " + _
        "6 * pi * viscosity * velocity * radius of bot (normal bot has a radius of " + _
        "60).  Experimentation has yielded that the " + _
        "approximate magnitude of an appropriate viscosity is between 1E-5 and " + _
        "1E-3 (or between 1 and 100 in the text box, since it's multiplied by E-5)."
        
    Case 1 'density
      Text1.text = "Density controls Added Mass, and Terbulent Flow.  " + _
        "A small bot has a density of about 1E-6" + _
        ".  The higher the density, the stronger added mass, " + _
        "and terbulent drag are.  Terbulent drag is pi/4 * radius of bot ^ 2 " + _
        "(remember that an average bot radius is 60) * velocity ^2 * density."
  End Select
End Sub

Private Sub FluidText_Change(Index As Integer)
  Dim UnitReynolds As Single
  Dim temp As Single
  
  Select Case Index
    Case 0
      TmpOpts.Viscosity = val(FluidText(Index).text) * 10 ^ -5
    Case 1
      TmpOpts.Density = val(FluidText(Index).text) * 10 ^ -7
  End Select
  'update Reynolds number
  If TmpOpts.Viscosity = 0 Then
    temp = 10 ^ -7 'to prevent divide by zero
  Else
    temp = TmpOpts.Viscosity
  End If
  UnitReynolds = (TmpOpts.Density * 2 * RobSize / 2 * 1) / temp
  If UnitReynolds >= 10000 Then
    FluidText(2).text = Format(UnitReynolds, "Scientific")
  Else
    FluidText(2).text = UnitReynolds
  End If
End Sub

Private Sub FluidText_LostFocus(Index As Integer)
  FluidText_Change (Index)
  
  FluidText(0).text = TmpOpts.Viscosity * 10 ^ 5
  FluidText(1).text = TmpOpts.Density * 10 ^ 7
End Sub

Private Sub Friction_Change(Index As Integer)
  Select Case Index
    Case 0
      TmpOpts.Zgravity = Friction(Index).value / 10
      FrictionText(Index).Caption = TmpOpts.Zgravity
    Case 1
      TmpOpts.CoefficientKinetic = Friction(Index).value / 100
      FrictionText(Index).Caption = TmpOpts.CoefficientKinetic
    Case 2
      TmpOpts.CoefficientStatic = Friction(Index).value / 100
      FrictionText(Index).Caption = TmpOpts.CoefficientStatic
  End Select
End Sub

Private Sub Friction_Scroll(Index As Integer)
  Friction_Change (Index)
End Sub

Private Sub Friction_GotFocus(Index As Integer)
  Select Case Index
    Case 0 'Z axis gravity
      Text1.text = "Z axis gravity only effects the force of gravity.  " + _
        "The larger Z axis gravity, the stronger the effect of friction will be."
    Case 1 'kinetic
      Text1.text = "Coefficient of Kinetic Friction.  Generally lower than " + _
        "coefficient of static friction.  This multiplied by weight caused by " + _
        "Z axis gravity from a moving object gives a resistive force to motion " + _
        "that's independant of velocity."
    Case 2 'static
      Text1.text = "Coefficient of Static Friction.  Generally higher than " + _
        "coefficient of kinetic friction.  This multiplied by weight caused by " + _
        "Z axis gravity give a resistive force that " + _
        "must be overcome for motion to be achieved."
  End Select
End Sub

Private Sub MiscSlider_Scroll(Index As Integer)
  MiscSlider_Change (Index)
End Sub

Private Sub MiscSlider_Change(Index As Integer)
  Select Case Index
    Case 0 'bang efficiency
      TmpOpts.PhysMoving = MiscSlider(Index).value / 100
      MiscText(Index).Caption = CStr(MiscSlider(Index).value) + "%"
    Case 1 'Y axis gravity
       TmpOpts.Ygravity = MiscSlider(Index).value / 10
       MiscText(Index).Caption = TmpOpts.Ygravity
    Case 2
      TmpOpts.PhysBrown = MiscSlider(Index).value / 10
      MiscText(Index).Caption = TmpOpts.PhysBrown
  End Select
End Sub

Private Sub MiscSlider_GotFocus(Index As Integer)
  Select Case Index
    Case 0 'bang efficiency
      Text1.text = "Bang efficiency measures how efficient the " + _
        ".up, .dn, .dx, and .sx commands are.  100% is the ideal " + _
        "case, meaning that there is 100% conversion of energy " + _
        "spent to work done." + vbCrLf + vbCrLf + "This is " + _
        "technically impossible because " + _
        "of the second law of thermodynamics.  A range of 60%-80% " + _
        "corresponds to biological systems, while 10-30% corresponds " + _
        "to most artifical systems such as machines."
    Case 1 'Y axis Gravity
      Text1.text = "Measured in twips per cycle per cycle.  " + _
        "Points downwards, as if your computer is the side of a fishbowl.  " + _
        "Used in bouyancy and weight calculations."
    Case 2 'Brownian Motion
      Text1.text = "Random perturbations in the medium.  " + _
        "High Brownian motion is representative of very tiny organisms," + _
        "such as viruses and bacteria.  The effect is to give " + _
        "the bot up to the set amount of Darwins in a random " + _
        "direction each cycle."
  End Select
End Sub

Private Sub PlanetEatersText_Change()
  TmpOpts.PlanetEatersG = val(PlanetEatersText.text) * 10 ^ 3
End Sub

Private Sub Toggles_Click(Index As Integer)
  Select Case Index
  Case 0
    Text1.text = "Zero momentum simply prevents a bot from keeping any " + _
    "velocity from cycle to cycle.  Effects are similar to Laminar flow, " + _
    "but there are subtle differences."
    TmpOpts.ZeroMomentum = Toggles(Index).value * True
  Case 1
    Text1.text = "Planet Eaters gives all bots an attractive force towards " + _
      "all other bots.  The force is equal to G * m1 * m2 / distance between " + _
      "bots ^ 2.  A value of 14.4E+3 gives 1 Darwin attractive force to touching " + _
      "bots.  A G of 864E+3 gives a force of 60 Darwins to touching bots, and a " + _
      "force of 1.7 to bots 5 bot lengths away from each other."
    TmpOpts.PlanetEaters = Toggles(Index).value * True
    PlanetEatersText.Enabled = TmpOpts.PlanetEaters
  End Select
End Sub

Private Sub Form_Activate()
  'Update all displays
  With TmpOpts
    
    'toggles
    If .ZeroMomentum Then Toggles(0).value = 1
    If .PlanetEaters Then Toggles(1).value = 1
    PlanetEatersText.text = .PlanetEatersG / 10 ^ 3
    
    MiscSlider(0).value = .PhysMoving * 100
    MiscSlider(1).value = .Ygravity * 10
    MiscSlider(2).value = .PhysBrown * 10 'EricL 3/21/2006 Changed from 100 to 10 to fix bug where slider set to 10x to high
    
    Friction(0).value = .Zgravity * 10
    Friction(1).value = .CoefficientKinetic * 100
    Friction(2).value = .CoefficientStatic * 100
    
    FluidText(0).text = .Viscosity * 10 ^ 5
    FluidText(1).text = .Density * 10 ^ 7
    
    If Int(SimOpts.Ygravity * 10) <> (SimOpts.Ygravity * 10) Then MiscText(1).Caption = "?"
    
  End With
End Sub

'Botsareus 9/13/2014 Warnings for Shvarz

Private Function YgravityWarning(oldval, newval) As Boolean
If Not cstdiff(newval + 50, oldval + 50, 15) Then
    YgravityWarning = True
Else
    YgravityWarning = MsgBox("Making drastic changes to vertical gravity may change the robots behavior and may break your simulation. Are you sure?", vbExclamation + vbYesNo, "Darwinbots Settings") = vbYes
End If
End Function

Private Function BrownWarning(oldval, newval) As Boolean
If Not cstdiff(newval + 50, oldval + 50, 33) Or newval < oldval Then
    BrownWarning = True
Else
    BrownWarning = MsgBox("Making drastic changes to Brownian motion will add alot of chaotic motion and break your simulation. Are you sure?", vbExclamation + vbYesNo, "Darwinbots Settings") = vbYes
End If
End Function

