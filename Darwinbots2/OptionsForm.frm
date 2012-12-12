VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form optionsform 
   AutoRedraw      =   -1  'True
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Simulation Settings"
   ClientHeight    =   6765
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   10710
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6765
   ScaleWidth      =   10710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame5 
      Height          =   645
      Left            =   240
      TabIndex        =   0
      Top             =   5760
      Width           =   9660
      Begin VB.CommandButton PauseButton 
         Caption         =   "Pause"
         Height          =   330
         Left            =   6240
         TabIndex        =   6
         Top             =   225
         Width           =   1095
      End
      Begin VB.CommandButton Cancel 
         Cancel          =   -1  'True
         Caption         =   "Cancel"
         Height          =   330
         Left            =   4560
         TabIndex        =   5
         Top             =   225
         Width           =   960
      End
      Begin VB.CommandButton OKButton 
         Caption         =   "Change"
         Height          =   330
         Left            =   8520
         TabIndex        =   4
         Top             =   225
         Width           =   975
      End
      Begin VB.CommandButton StartNew 
         Caption         =   "Start new"
         Height          =   330
         Left            =   7440
         TabIndex        =   3
         Top             =   225
         Width           =   960
      End
      Begin VB.CommandButton SaveSettings 
         Caption         =   "Save settings"
         Height          =   330
         Left            =   1560
         TabIndex        =   2
         Top             =   225
         Width           =   1305
      End
      Begin VB.CommandButton LoadSettings 
         Caption         =   "Load settings"
         Height          =   330
         Left            =   210
         TabIndex        =   1
         Top             =   225
         Width           =   1305
      End
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6690
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   10500
      _ExtentX        =   18521
      _ExtentY        =   11800
      _Version        =   393216
      Style           =   1
      Tabs            =   7
      TabsPerRow      =   10
      TabHeight       =   520
      ShowFocusRect   =   0   'False
      BackColor       =   12632256
      TabCaption(0)   =   "Species"
      TabPicture(0)   =   "OptionsForm.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "SpeciesLabel"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label36"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Frame1"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "CommentBox"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "RenameButton"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "DelSpec"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "AddSpec"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "SpecList"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "DuplicaButt"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "NativeSpeciesButton"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).ControlCount=   10
      TabCaption(1)   =   "General"
      TabPicture(1)   =   "OptionsForm.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "GenPropFrame"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Physics and Costs"
      TabPicture(2)   =   "OptionsForm.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame21"
      Tab(2).Control(1)=   "Frame20"
      Tab(2).ControlCount=   2
      TabCaption(3)   =   "Mutations"
      TabPicture(3)   =   "OptionsForm.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "Frame15"
      Tab(3).Control(1)=   "Frame13"
      Tab(3).Control(2)=   "Frame14"
      Tab(3).Control(3)=   "DisableMutationsCheck"
      Tab(3).ControlCount=   4
      TabCaption(4)   =   "Restart and League"
      TabPicture(4)   =   "OptionsForm.frx":0070
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "Frame8"
      Tab(4).Control(1)=   "Restart"
      Tab(4).Control(2)=   "Frame7"
      Tab(4).ControlCount=   3
      TabCaption(5)   =   "Internet"
      TabPicture(5)   =   "OptionsForm.frx":008C
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "Simulazione"
      Tab(5).Control(1)=   "Label41"
      Tab(5).ControlCount=   2
      TabCaption(6)   =   "Recording"
      TabPicture(6)   =   "OptionsForm.frx":00A8
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "Frame4"
      Tab(6).Control(1)=   "Frame10"
      Tab(6).ControlCount=   2
      Begin VB.CommandButton NativeSpeciesButton 
         Caption         =   "Show Non-Native Species"
         Height          =   375
         Left            =   1440
         TabIndex        =   253
         Tag             =   "0"
         ToolTipText     =   "Add a new robot type to the simulation"
         Top             =   3240
         Width           =   2295
      End
      Begin VB.CheckBox DisableMutationsCheck 
         Caption         =   "Disable All Mutations"
         Height          =   375
         Left            =   -73680
         TabIndex        =   252
         Top             =   600
         Width           =   6375
      End
      Begin VB.Frame Frame20 
         Caption         =   "Physics"
         Height          =   5235
         Left            =   -74820
         TabIndex        =   212
         Top             =   420
         Width           =   4635
         Begin VB.CommandButton ToPhysics 
            Caption         =   "Custom Physics"
            Height          =   375
            Left            =   1800
            TabIndex        =   220
            Top             =   1680
            Width           =   1950
         End
         Begin VB.ComboBox EfficiencyCombo 
            Height          =   315
            ItemData        =   "OptionsForm.frx":00C4
            Left            =   2880
            List            =   "OptionsForm.frx":00D1
            TabIndex        =   219
            Text            =   "Set Efficiency"
            Top             =   2400
            Width           =   1395
         End
         Begin VB.Frame Frame26 
            Caption         =   "The Big Blue Screen Acts Like A "
            Height          =   1935
            Left            =   120
            TabIndex        =   216
            Top             =   300
            Width           =   4395
            Begin VB.OptionButton FluidSolidRadio 
               Caption         =   "Custom"
               Height          =   195
               Index           =   2
               Left            =   360
               TabIndex        =   230
               Top             =   1440
               Width           =   3015
            End
            Begin VB.OptionButton FluidSolidRadio 
               Caption         =   "Solid"
               Height          =   195
               Index           =   1
               Left            =   360
               TabIndex        =   229
               Top             =   960
               Width           =   975
            End
            Begin VB.OptionButton FluidSolidRadio 
               Caption         =   "Fluid"
               Height          =   195
               Index           =   0
               Left            =   360
               TabIndex        =   228
               Top             =   480
               Width           =   975
            End
            Begin VB.ComboBox DragCombo 
               Enabled         =   0   'False
               Height          =   315
               ItemData        =   "OptionsForm.frx":00F4
               Left            =   1680
               List            =   "OptionsForm.frx":0104
               TabIndex        =   218
               Text            =   "Set Drag"
               Top             =   360
               Width           =   1995
            End
            Begin VB.ComboBox FrictionCombo 
               Enabled         =   0   'False
               Height          =   315
               ItemData        =   "OptionsForm.frx":0142
               Left            =   1680
               List            =   "OptionsForm.frx":0152
               TabIndex        =   217
               Text            =   "Set Friction"
               Top             =   840
               Width           =   1995
            End
         End
         Begin VB.ComboBox BrownianCombo 
            Height          =   315
            ItemData        =   "OptionsForm.frx":0185
            Left            =   2880
            List            =   "OptionsForm.frx":018F
            TabIndex        =   215
            Text            =   "Set Brownian"
            Top             =   2760
            Width           =   1395
         End
         Begin VB.ComboBox GravityCombo 
            Height          =   315
            ItemData        =   "OptionsForm.frx":01A5
            Left            =   2880
            List            =   "OptionsForm.frx":01B2
            TabIndex        =   214
            Text            =   "Set Gravity"
            Top             =   3120
            Width           =   1395
         End
         Begin MSComctlLib.Slider MaxVelSlider 
            Height          =   495
            Left            =   240
            TabIndex        =   213
            ToolTipText     =   "Maximum bot velocity"
            Top             =   3840
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   873
            _Version        =   393216
            LargeChange     =   36
            SmallChange     =   5
            Max             =   180
            TickStyle       =   1
            TickFrequency   =   10
         End
         Begin MSComctlLib.Slider Elasticity 
            Height          =   495
            Left            =   240
            TabIndex        =   234
            ToolTipText     =   "Controls how elastic bots act during collisions."
            Top             =   4680
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   873
            _Version        =   393216
            LargeChange     =   1
            Min             =   -10
            TickStyle       =   1
         End
         Begin VB.Label Label38 
            Caption         =   "Fast"
            Height          =   255
            Left            =   4080
            TabIndex        =   240
            Top             =   3600
            Width           =   375
         End
         Begin VB.Label Label37 
            Caption         =   "Slow"
            Height          =   255
            Left            =   240
            TabIndex        =   239
            Top             =   3600
            Width           =   615
         End
         Begin VB.Label Label33 
            Caption         =   "Marbles"
            Height          =   255
            Left            =   3840
            TabIndex        =   238
            Top             =   4440
            Width           =   615
         End
         Begin VB.Label Label18 
            Caption         =   "Ghosts"
            Height          =   255
            Left            =   240
            TabIndex        =   236
            Top             =   4440
            Width           =   615
         End
         Begin VB.Label Label11 
            Caption         =   "Collision Elasticity"
            Height          =   255
            Left            =   1440
            TabIndex        =   235
            Top             =   4440
            Width           =   1335
         End
         Begin VB.Label Label7 
            Caption         =   "Movement Efficiency"
            Height          =   255
            Index           =   1
            Left            =   480
            TabIndex        =   224
            Top             =   2400
            Width           =   1875
         End
         Begin VB.Label Label7 
            Caption         =   "Brownian Movement"
            Height          =   255
            Index           =   2
            Left            =   480
            TabIndex        =   223
            Top             =   2760
            Width           =   1875
         End
         Begin VB.Label Label7 
            Caption         =   "Vertical Gravity"
            Height          =   255
            Index           =   3
            Left            =   480
            TabIndex        =   222
            Top             =   3120
            Width           =   1875
         End
         Begin VB.Label Label12 
            Caption         =   "Max Velocity"
            Height          =   255
            Left            =   1920
            TabIndex        =   221
            Top             =   3600
            Width           =   975
         End
      End
      Begin VB.Frame GenPropFrame 
         Caption         =   "General Properties"
         Height          =   5295
         Left            =   -74880
         TabIndex        =   134
         Tag             =   "2020"
         Top             =   360
         Width           =   9885
         Begin VB.Frame Frame22 
            Caption         =   "Wrap Around"
            Height          =   1275
            Left            =   120
            TabIndex        =   207
            Top             =   2160
            Width           =   2055
            Begin VB.CheckBox ToroidCheck 
               Alignment       =   1  'Right Justify
               Caption         =   "Torroidal"
               Height          =   255
               Left            =   120
               TabIndex        =   210
               Tag             =   "2302"
               Top             =   240
               Width           =   1605
            End
            Begin VB.CheckBox TopDownCheck 
               Alignment       =   1  'Right Justify
               Caption         =   "Top / Down Wrap"
               Height          =   255
               Left            =   120
               TabIndex        =   209
               Top             =   540
               Width           =   1605
            End
            Begin VB.CheckBox RightLeftCheck 
               Alignment       =   1  'Right Justify
               Caption         =   "Left / Right Wrap"
               Height          =   255
               Left            =   120
               TabIndex        =   208
               Top             =   840
               Width           =   1605
            End
         End
         Begin VB.Frame Frame23 
            Caption         =   "Misc. Controls"
            Height          =   975
            Left            =   120
            TabIndex        =   206
            Top             =   4200
            Width           =   2055
            Begin VB.CheckBox FixBotRadius 
               Alignment       =   1  'Right Justify
               Caption         =   "Fix bot radii"
               Height          =   255
               Left            =   120
               TabIndex        =   244
               ToolTipText     =   "Shots will live forever unitl they impact a bot."
               Top             =   360
               Width           =   1695
            End
         End
         Begin VB.Frame Frame24 
            Caption         =   "Field Controls"
            Height          =   795
            Left            =   120
            TabIndex        =   199
            Top             =   240
            Width           =   4035
            Begin MSComctlLib.Slider FieldSizeSlide 
               Height          =   210
               Left            =   60
               TabIndex        =   200
               Top             =   480
               Width           =   2415
               _ExtentX        =   4260
               _ExtentY        =   370
               _Version        =   393216
               LargeChange     =   1
               Min             =   1
               Max             =   25
               SelStart        =   1
               Value           =   1
            End
            Begin VB.Label Label28 
               Caption         =   "Width:"
               Height          =   240
               Index           =   0
               Left            =   2640
               TabIndex        =   205
               Tag             =   "0"
               Top             =   240
               Width           =   495
            End
            Begin VB.Label Label32 
               Caption         =   "Height:"
               Height          =   240
               Left            =   2640
               TabIndex        =   204
               Tag             =   "0"
               Top             =   480
               Width           =   525
            End
            Begin VB.Label FWidthLab 
               Caption         =   "XXXX"
               Height          =   195
               Left            =   3270
               TabIndex        =   203
               Top             =   240
               Width           =   690
            End
            Begin VB.Label FHeightLab 
               Caption         =   "XXXX"
               Height          =   240
               Left            =   3270
               TabIndex        =   202
               Top             =   480
               Width           =   690
            End
            Begin VB.Label FieldSizeLab 
               Caption         =   "Size"
               Height          =   255
               Left            =   1080
               TabIndex        =   201
               Tag             =   "0"
               Top             =   240
               Width           =   615
            End
         End
         Begin VB.Frame Frame25 
            Caption         =   "Waste"
            Height          =   615
            Left            =   120
            TabIndex        =   195
            Top             =   3480
            Width           =   2055
            Begin VB.TextBox CustomWaste 
               Height          =   285
               Left            =   1020
               TabIndex        =   197
               Text            =   "400"
               Top             =   240
               Width           =   555
            End
            Begin ComCtl2.UpDown WasteThresholdUpDown 
               Height          =   285
               Left            =   1680
               TabIndex        =   196
               Top             =   240
               Width           =   255
               _ExtentX        =   450
               _ExtentY        =   503
               _Version        =   327681
               BuddyControl    =   "CustomWaste"
               BuddyDispid     =   196648
               OrigLeft        =   780
               OrigTop         =   480
               OrigRight       =   1020
               OrigBottom      =   795
               Increment       =   50
               Max             =   30000
               SyncBuddy       =   -1  'True
               BuddyProperty   =   65547
               Enabled         =   -1  'True
            End
            Begin VB.Label Label21 
               Caption         =   "Threshold"
               Height          =   195
               Left            =   180
               TabIndex        =   198
               Top             =   300
               Width           =   735
            End
         End
         Begin VB.Frame Frame27 
            Caption         =   "Random Numbers"
            Height          =   975
            Left            =   120
            TabIndex        =   191
            Top             =   1200
            Width           =   2055
            Begin VB.TextBox UserSeedText 
               Height          =   285
               Left            =   1140
               TabIndex        =   193
               Text            =   "1234"
               Top             =   540
               Width           =   675
            End
            Begin VB.CheckBox UserSeed 
               Alignment       =   1  'Right Justify
               Caption         =   "Enable User Seed"
               Height          =   315
               Left            =   120
               TabIndex        =   192
               ToolTipText     =   $"OptionsForm.frx":01C9
               Top             =   240
               Width           =   1695
            End
            Begin VB.Label Label58 
               Caption         =   "Seed Value"
               Height          =   195
               Left            =   165
               TabIndex        =   194
               Top             =   600
               Width           =   915
            End
         End
         Begin VB.Frame VeggyControls 
            Caption         =   "Veggy Controls"
            Height          =   4995
            Left            =   4200
            TabIndex        =   153
            Tag             =   "2200"
            Top             =   180
            Width           =   5610
            Begin VB.Frame Frame16 
               Caption         =   "Pond Mode"
               Height          =   1515
               Left            =   60
               TabIndex        =   179
               Top             =   240
               Width           =   3375
               Begin VB.Frame Frame17 
                  Caption         =   "Light"
                  Height          =   1275
                  Left            =   2100
                  TabIndex        =   183
                  Top             =   180
                  Width           =   1215
                  Begin VB.TextBox EnergyScalingFactor 
                     Height          =   285
                     Left            =   540
                     TabIndex        =   185
                     Text            =   "40"
                     ToolTipText     =   "Scale the brightness of the graph to the left.  Value sets the energy gain per cycle above which the brightness is set to maximum."
                     Top             =   900
                     Width           =   375
                  End
                  Begin ComCtl2.UpDown EnergyScalingFactorUpDown 
                     Height          =   285
                     Left            =   900
                     TabIndex        =   184
                     Top             =   900
                     Width           =   255
                     _ExtentX        =   450
                     _ExtentY        =   503
                     _Version        =   327681
                     Value           =   1
                     BuddyControl    =   "EnergyScalingFactor"
                     BuddyDispid     =   196657
                     OrigLeft        =   796
                     OrigTop         =   840
                     OrigRight       =   1036
                     OrigBottom      =   1125
                     Increment       =   2
                     Max             =   1000
                     Min             =   1
                     SyncBuddy       =   -1  'True
                     BuddyProperty   =   65547
                     Enabled         =   -1  'True
                  End
                  Begin VB.Label Label23 
                     Caption         =   "Energy Scaling Factor"
                     Height          =   615
                     Left            =   540
                     TabIndex        =   186
                     Top             =   240
                     Width           =   555
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     Index           =   15
                     X1              =   90
                     X2              =   510
                     Y1              =   250
                     Y2              =   250
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   14
                     X1              =   120
                     X2              =   480
                     Y1              =   1140
                     Y2              =   1140
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   13
                     X1              =   120
                     X2              =   480
                     Y1              =   1080
                     Y2              =   1080
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   12
                     X1              =   120
                     X2              =   480
                     Y1              =   1020
                     Y2              =   1020
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   11
                     X1              =   120
                     X2              =   480
                     Y1              =   960
                     Y2              =   960
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   10
                     X1              =   120
                     X2              =   480
                     Y1              =   900
                     Y2              =   900
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   9
                     X1              =   120
                     X2              =   480
                     Y1              =   840
                     Y2              =   840
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   8
                     X1              =   120
                     X2              =   480
                     Y1              =   780
                     Y2              =   780
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   7
                     X1              =   120
                     X2              =   480
                     Y1              =   720
                     Y2              =   720
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   6
                     X1              =   120
                     X2              =   480
                     Y1              =   660
                     Y2              =   660
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   5
                     X1              =   120
                     X2              =   480
                     Y1              =   600
                     Y2              =   600
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   4
                     X1              =   120
                     X2              =   480
                     Y1              =   540
                     Y2              =   540
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   3
                     X1              =   120
                     X2              =   480
                     Y1              =   480
                     Y2              =   480
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   2
                     X1              =   120
                     X2              =   480
                     Y1              =   420
                     Y2              =   420
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   1
                     X1              =   120
                     X2              =   480
                     Y1              =   360
                     Y2              =   360
                  End
                  Begin VB.Line LightStrata 
                     BorderStyle     =   6  'Inside Solid
                     BorderWidth     =   4
                     Index           =   0
                     X1              =   120
                     X2              =   480
                     Y1              =   300
                     Y2              =   300
                  End
                  Begin VB.Shape Shape4 
                     BackColor       =   &H00FFFF00&
                     BackStyle       =   1  'Opaque
                     BorderColor     =   &H00FFFF00&
                     Height          =   915
                     Left            =   90
                     Top             =   255
                     Width           =   425
                  End
               End
               Begin VB.TextBox Gradient 
                  Height          =   285
                  Left            =   1350
                  TabIndex        =   182
                  Text            =   "1"
                  ToolTipText     =   "Set the gradient for light transmission through the water. A value of zero means no light reduction at any depth."
                  Top             =   1140
                  Width           =   420
               End
               Begin VB.TextBox LightText 
                  Height          =   285
                  Left            =   1350
                  TabIndex        =   181
                  Text            =   "100"
                  ToolTipText     =   "Set the light intensity to feed your veggies"
                  Top             =   720
                  Width           =   420
               End
               Begin VB.CheckBox Pondcheck 
                  Alignment       =   1  'Right Justify
                  Caption         =   "Pondmode"
                  Height          =   255
                  Left            =   60
                  TabIndex        =   180
                  ToolTipText     =   $"OptionsForm.frx":02C6
                  Top             =   300
                  Width           =   1980
               End
               Begin ComCtl2.UpDown GradientUpDn 
                  Height          =   285
                  Left            =   1800
                  TabIndex        =   187
                  ToolTipText     =   "Set the gradient for light transmission through the water. A value of zero means no light reduction at any depth."
                  Top             =   1140
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  Value           =   1
                  BuddyControl    =   "Gradient"
                  BuddyDispid     =   196661
                  OrigLeft        =   1800
                  OrigTop         =   1140
                  OrigRight       =   2055
                  OrigBottom      =   1425
                  Increment       =   2
                  Max             =   1000
                  Min             =   1
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin ComCtl2.UpDown LightUpDn 
                  Height          =   285
                  Left            =   1800
                  TabIndex        =   188
                  ToolTipText     =   "Set the light intensity to feed your veggies"
                  Top             =   720
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  BuddyControl    =   "LightText"
                  BuddyDispid     =   196662
                  OrigLeft        =   5040
                  OrigTop         =   1560
                  OrigRight       =   5280
                  OrigBottom      =   1845
                  Increment       =   2
                  Max             =   1000
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin VB.Label LightLabel 
                  Caption         =   "Light intensity"
                  Height          =   240
                  Left            =   90
                  TabIndex        =   190
                  ToolTipText     =   "Set the light intensity to feed your veggies"
                  Top             =   780
                  Width           =   975
               End
               Begin VB.Label GradientLabel 
                  Caption         =   "Sediment Level"
                  Height          =   240
                  Left            =   90
                  TabIndex        =   189
                  ToolTipText     =   "Set the gradient for light transmission through the water. A value of zero means no light reduction at any depth."
                  Top             =   1200
                  Width           =   1155
               End
            End
            Begin VB.Frame Frame31 
               Caption         =   "Veg Body/NRG Distribution"
               Height          =   915
               Left            =   1920
               TabIndex        =   175
               Top             =   4020
               Width           =   3630
               Begin MSComctlLib.Slider BodyNrgDist 
                  Height          =   570
                  Left            =   480
                  TabIndex        =   176
                  TabStop         =   0   'False
                  ToolTipText     =   "When a veg gets NRG, what percentage should go into body points?"
                  Top             =   240
                  Width           =   2355
                  _ExtentX        =   4154
                  _ExtentY        =   1005
                  _Version        =   393216
                  LargeChange     =   10
                  Max             =   100
                  TickStyle       =   2
                  TickFrequency   =   10
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "Body"
                  Height          =   195
                  Index           =   18
                  Left            =   2880
                  TabIndex        =   178
                  Top             =   420
                  Width           =   375
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "NRG"
                  Height          =   195
                  Index           =   17
                  Left            =   120
                  TabIndex        =   177
                  Top             =   420
                  Width           =   375
               End
            End
            Begin VB.Frame Frame29 
               Caption         =   "Population Control"
               Height          =   2175
               Left            =   60
               TabIndex        =   161
               Top             =   1800
               Width           =   3375
               Begin VB.TextBox RepopCooldownText 
                  Height          =   285
                  Left            =   120
                  TabIndex        =   166
                  Text            =   "1"
                  ToolTipText     =   "The minimum number of cycles that must elapse between repopulation events."
                  Top             =   1380
                  Width           =   480
               End
               Begin VB.TextBox RepopAmountText 
                  Height          =   285
                  Left            =   120
                  TabIndex        =   165
                  Text            =   "10"
                  ToolTipText     =   "How many veggies to drop in the sim per repopulation events."
                  Top             =   1020
                  Width           =   480
               End
               Begin VB.CheckBox KillDistVegsCheck 
                  Caption         =   "Kill Distant Veggies"
                  Height          =   285
                  Left            =   120
                  TabIndex        =   164
                  Tag             =   "2204"
                  ToolTipText     =   "In larger sims, veggies often bbegin growing far away from bots.  Checking this option will eliminate veggys that are too far."
                  Top             =   1800
                  Visible         =   0   'False
                  Width           =   1680
               End
               Begin VB.TextBox MinVegText 
                  Height          =   285
                  Left            =   120
                  TabIndex        =   163
                  Text            =   "10"
                  ToolTipText     =   $"OptionsForm.frx":035A
                  Top             =   660
                  Width           =   495
               End
               Begin VB.TextBox MaxPopText 
                  Height          =   285
                  Left            =   120
                  TabIndex        =   162
                  Text            =   "1000"
                  Top             =   300
                  Width           =   480
               End
               Begin ComCtl2.UpDown RepopAmountUpDown 
                  Height          =   285
                  Index           =   0
                  Left            =   600
                  TabIndex        =   167
                  Top             =   1020
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  BuddyControl    =   "RepopAmountText"
                  BuddyDispid     =   196670
                  OrigLeft        =   660
                  OrigTop         =   1020
                  OrigRight       =   900
                  OrigBottom      =   1305
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin ComCtl2.UpDown MaxPopUpDn 
                  Height          =   285
                  Left            =   600
                  TabIndex        =   168
                  Top             =   300
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  Value           =   1
                  BuddyControl    =   "MaxPopText"
                  BuddyDispid     =   196673
                  OrigLeft        =   660
                  OrigTop         =   300
                  OrigRight       =   900
                  OrigBottom      =   585
                  Increment       =   25
                  Max             =   5000
                  Min             =   1
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin ComCtl2.UpDown MinVegUpDn 
                  Height          =   285
                  Left            =   600
                  TabIndex        =   169
                  Top             =   660
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  Value           =   100
                  BuddyControl    =   "MinVegText"
                  BuddyDispid     =   196672
                  OrigLeft        =   2730
                  OrigTop         =   2295
                  OrigRight       =   2970
                  OrigBottom      =   2580
                  Increment       =   10
                  Max             =   950
                  Min             =   20
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin ComCtl2.UpDown RepopCooldownUpDown 
                  Height          =   285
                  Index           =   1
                  Left            =   600
                  TabIndex        =   170
                  Top             =   1380
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  BuddyControl    =   "RepopCooldownText"
                  BuddyDispid     =   196669
                  OrigLeft        =   660
                  OrigTop         =   1380
                  OrigRight       =   900
                  OrigBottom      =   1665
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   65547
                  Enabled         =   -1  'True
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "Maximum number of Veggies"
                  Height          =   195
                  Index           =   0
                  Left            =   960
                  TabIndex        =   174
                  Top             =   330
                  Width           =   2175
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "Repopulation Threshold"
                  Height          =   195
                  Index           =   1
                  Left            =   960
                  TabIndex        =   173
                  Top             =   690
                  Width           =   2055
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "Veggies per repopulation event"
                  Height          =   195
                  Index           =   2
                  Left            =   960
                  TabIndex        =   172
                  Top             =   1080
                  Width           =   2235
               End
               Begin VB.Label LabelZZ 
                  Caption         =   "Repopulation cooldown period"
                  Height          =   195
                  Index           =   3
                  Left            =   960
                  TabIndex        =   171
                  Top             =   1440
                  Width           =   2235
               End
            End
            Begin VB.Frame Frame30 
               Caption         =   "Veggy Energy"
               Height          =   3735
               Left            =   3480
               TabIndex        =   154
               Top             =   240
               Width           =   2070
               Begin VB.CommandButton Energy 
                  Caption         =   "Energy Management"
                  Height          =   330
                  Left            =   120
                  TabIndex        =   241
                  Top             =   2040
                  Width           =   1695
               End
               Begin VB.TextBox MaxNRGText 
                  Height          =   285
                  Left            =   180
                  TabIndex        =   159
                  Text            =   "40"
                  ToolTipText     =   "Amount of energy to give each veggy each cycle.  Is overrided by Pond Mode settings if that's on."
                  Top             =   300
                  Width           =   735
               End
               Begin VB.OptionButton VEGNrgType 
                  Caption         =   "Veggy per cycle"
                  Height          =   195
                  Index           =   0
                  Left            =   120
                  TabIndex        =   158
                  Top             =   720
                  Width           =   1515
               End
               Begin VB.OptionButton VEGNrgType 
                  Caption         =   "Kilobody point"
                  Height          =   375
                  Index           =   1
                  Left            =   120
                  TabIndex        =   157
                  ToolTipText     =   "Every 1000 body points will give the veggy an amount of energy equal to above."
                  Top             =   960
                  Width           =   1515
               End
               Begin VB.OptionButton VEGNrgType 
                  Caption         =   "Quadratically based on body"
                  Height          =   435
                  Index           =   2
                  Left            =   120
                  TabIndex        =   156
                  ToolTipText     =   "Favors larger veggies.  32000 body gives roughly 60 times as much as 1000 body."
                  Top             =   1320
                  Width           =   1515
               End
               Begin VB.TextBox VegNRGTypeText 
                  Height          =   915
                  Left            =   60
                  MultiLine       =   -1  'True
                  TabIndex        =   155
                  Text            =   "OptionsForm.frx":03EA
                  Top             =   2760
                  Width           =   1695
               End
               Begin VB.Label VegNRG 
                  Caption         =   "NRG"
                  Height          =   195
                  Left            =   960
                  TabIndex        =   160
                  Top             =   360
                  Width           =   690
               End
            End
         End
         Begin VB.Frame Frame18 
            Caption         =   "Corpse Mode"
            Height          =   2955
            Left            =   2280
            TabIndex        =   140
            Top             =   1200
            Width           =   1815
            Begin VB.CheckBox CorpseCheck 
               Alignment       =   1  'Right Justify
               Caption         =   "Enable"
               Height          =   255
               Left            =   360
               TabIndex        =   152
               ToolTipText     =   "Enable corpse mode.  Corpses are dead robots who still have carcasses that can be eaten by other robots."
               Top             =   240
               Width           =   1185
            End
            Begin VB.Frame Frame3 
               Caption         =   "Decay Rate"
               Height          =   1005
               Left            =   240
               TabIndex        =   145
               Top             =   1920
               Width           =   1455
               Begin VB.TextBox FrequencyText 
                  Height          =   285
                  Left            =   600
                  TabIndex        =   147
                  Text            =   "1"
                  ToolTipText     =   "How many cycles per shot?"
                  Top             =   600
                  Width           =   435
               End
               Begin VB.TextBox DecayText 
                  Height          =   285
                  Left            =   600
                  TabIndex        =   146
                  Text            =   "2"
                  ToolTipText     =   "How large is the decay shot?"
                  Top             =   240
                  Width           =   435
               End
               Begin ComCtl2.UpDown DecayUpDn 
                  Height          =   285
                  Index           =   0
                  Left            =   1080
                  TabIndex        =   148
                  ToolTipText     =   "Set how fast you want your corpses to decay away."
                  Top             =   240
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  BuddyControl    =   "DecayText"
                  BuddyDispid     =   196684
                  OrigLeft        =   5040
                  OrigTop         =   2280
                  OrigRight       =   5280
                  OrigBottom      =   2565
                  Max             =   100
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   0
                  Enabled         =   -1  'True
               End
               Begin ComCtl2.UpDown DecayUpDn 
                  Height          =   285
                  Index           =   1
                  Left            =   1080
                  TabIndex        =   149
                  ToolTipText     =   "Set how fast you want your corpses to decay away."
                  Top             =   600
                  Width           =   255
                  _ExtentX        =   450
                  _ExtentY        =   503
                  _Version        =   327681
                  BuddyControl    =   "FrequencyText"
                  BuddyDispid     =   196683
                  OrigLeft        =   5040
                  OrigTop         =   2280
                  OrigRight       =   5280
                  OrigBottom      =   2565
                  Max             =   100
                  SyncBuddy       =   -1  'True
                  BuddyProperty   =   0
                  Enabled         =   -1  'True
               End
               Begin VB.Label FrequencyLabel1 
                  Caption         =   "Period"
                  Height          =   255
                  Left            =   90
                  TabIndex        =   151
                  Top             =   660
                  Width           =   810
               End
               Begin VB.Label Label59 
                  Caption         =   "Size"
                  Height          =   255
                  Left            =   90
                  TabIndex        =   150
                  Top             =   300
                  Width           =   630
               End
            End
            Begin VB.Frame Frame9 
               Caption         =   "Decay Type"
               Height          =   1215
               Left            =   240
               TabIndex        =   141
               Top             =   600
               Width           =   1455
               Begin VB.OptionButton DecayOption 
                  Caption         =   "None"
                  Height          =   255
                  Index           =   0
                  Left            =   120
                  TabIndex        =   144
                  Top             =   240
                  Width           =   1095
               End
               Begin VB.OptionButton DecayOption 
                  Caption         =   "Waste"
                  Height          =   255
                  Index           =   1
                  Left            =   120
                  TabIndex        =   143
                  Top             =   540
                  Width           =   1095
               End
               Begin VB.OptionButton DecayOption 
                  Caption         =   "NRG"
                  Height          =   255
                  Index           =   2
                  Left            =   120
                  TabIndex        =   142
                  Top             =   840
                  Width           =   1095
               End
            End
         End
         Begin VB.Frame Frame2 
            Caption         =   "Graphing"
            Height          =   975
            Left            =   2280
            TabIndex        =   135
            Top             =   4200
            Width           =   1815
            Begin VB.TextBox ChartInterval 
               Height          =   285
               Left            =   720
               TabIndex        =   136
               Text            =   "200"
               ToolTipText     =   "Set the length of day and night in game cycles. The value entered here represents one full cycle of both."
               Top             =   480
               Width           =   615
            End
            Begin ComCtl2.UpDown ChartingUpDown5 
               Height          =   255
               Left            =   4320
               TabIndex        =   137
               ToolTipText     =   "Set the length of day and night in game cycles. The value entered here represents one full cycle of both."
               Top             =   3240
               Width           =   255
               _ExtentX        =   450
               _ExtentY        =   450
               _Version        =   327681
               Value           =   200
               OrigLeft        =   4320
               OrigTop         =   3240
               OrigRight       =   4560
               OrigBottom      =   3495
               Increment       =   10
               Max             =   10000
               Min             =   10
               Enabled         =   -1  'True
            End
            Begin ComCtl2.UpDown UpDown4 
               Height          =   285
               Left            =   1440
               TabIndex        =   138
               ToolTipText     =   "Set the length of day and night in game cycles. The value entered here represents one full cycle of both."
               Top             =   480
               Width           =   255
               _ExtentX        =   450
               _ExtentY        =   503
               _Version        =   327681
               Value           =   100
               BuddyControl    =   "ChartInterval"
               BuddyDispid     =   196690
               OrigLeft        =   4320
               OrigTop         =   3240
               OrigRight       =   4560
               OrigBottom      =   3495
               Increment       =   10
               Max             =   10000
               Min             =   10
               SyncBuddy       =   -1  'True
               BuddyProperty   =   0
               Enabled         =   -1  'True
            End
            Begin VB.Label Label17 
               Caption         =   "Update Interval"
               Height          =   375
               Left            =   120
               TabIndex        =   139
               Top             =   360
               Width           =   855
            End
         End
         Begin VB.Label Label27 
            Caption         =   "Energy per veggie per cycle"
            Height          =   210
            Left            =   1260
            TabIndex        =   211
            Tag             =   "2201"
            Top             =   360
            Visible         =   0   'False
            Width           =   2055
         End
      End
      Begin VB.CommandButton DuplicaButt 
         Caption         =   "Duplicate"
         Height          =   375
         Left            =   1440
         TabIndex        =   132
         Tag             =   "0"
         ToolTipText     =   "Add a new robot type to the simulation"
         Top             =   3720
         Width           =   1095
      End
      Begin VB.ListBox SpecList 
         Height          =   2400
         ItemData        =   "OptionsForm.frx":0413
         Left            =   240
         List            =   "OptionsForm.frx":0415
         TabIndex        =   131
         Top             =   720
         Width           =   3465
      End
      Begin VB.CommandButton AddSpec 
         Caption         =   "Add"
         Height          =   375
         Left            =   240
         TabIndex        =   130
         Tag             =   "0"
         ToolTipText     =   "Add a new robot type to the simulation"
         Top             =   3240
         Width           =   1095
      End
      Begin VB.CommandButton DelSpec 
         Caption         =   "Delete"
         Height          =   375
         Left            =   240
         TabIndex        =   129
         Tag             =   "0"
         Top             =   3720
         Width           =   1095
      End
      Begin VB.CommandButton RenameButton 
         Caption         =   "Rename"
         Height          =   375
         Left            =   2640
         TabIndex        =   128
         Tag             =   "0"
         Top             =   3720
         Width           =   1095
      End
      Begin VB.Frame Frame14 
         Caption         =   "Oscillation Frequency"
         Height          =   2115
         Left            =   -69720
         TabIndex        =   93
         Top             =   1320
         Width           =   4335
         Begin VB.TextBox CyclesHi 
            Height          =   330
            Left            =   2850
            TabIndex        =   96
            Text            =   "10000"
            Top             =   1005
            Width           =   765
         End
         Begin VB.TextBox CyclesLo 
            Height          =   330
            Left            =   2850
            TabIndex        =   95
            Text            =   "100000"
            Top             =   1500
            Width           =   795
         End
         Begin VB.CheckBox MutOscill 
            Alignment       =   1  'Right Justify
            Caption         =   "Rendi la frequenza di mutazione oscilante fra 16x e 1/16x, alternativamente."
            Height          =   645
            Left            =   120
            TabIndex        =   94
            Tag             =   "5101"
            Top             =   300
            Width           =   3780
         End
         Begin ComCtl2.UpDown CycLoUpDn 
            Height          =   330
            Left            =   3720
            TabIndex        =   97
            Top             =   1005
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   582
            _Version        =   327681
            Value           =   100000
            BuddyControl    =   "CyclesHi"
            BuddyDispid     =   196699
            OrigLeft        =   3570
            OrigTop         =   3465
            OrigRight       =   3810
            OrigBottom      =   3795
            Increment       =   5000
            Max             =   500000
            Min             =   5000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown CycHiUpDn 
            Height          =   330
            Left            =   3720
            TabIndex        =   98
            Top             =   1500
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   582
            _Version        =   327681
            Value           =   10000
            BuddyControl    =   "CyclesLo"
            BuddyDispid     =   196700
            OrigLeft        =   3570
            OrigTop         =   2940
            OrigRight       =   3810
            OrigBottom      =   3270
            Increment       =   5000
            Max             =   500000
            Min             =   5000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin VB.Label Label3 
            Alignment       =   1  'Right Justify
            Caption         =   "Cicli a 16x"
            Height          =   225
            Left            =   1440
            TabIndex        =   100
            Tag             =   "5102"
            Top             =   1065
            Width           =   1245
         End
         Begin VB.Label Label9 
            Alignment       =   1  'Right Justify
            Caption         =   "Cycles at 1/16x"
            Height          =   195
            Left            =   1335
            TabIndex        =   99
            Tag             =   "5103"
            Top             =   1560
            Width           =   1320
         End
      End
      Begin VB.Frame Frame13 
         Caption         =   "Current Multiplier"
         Height          =   2115
         Left            =   -74700
         TabIndex        =   86
         Top             =   1320
         Width           =   4755
         Begin MSComctlLib.Slider MutSlide 
            Height          =   225
            Left            =   360
            TabIndex        =   87
            Top             =   420
            Width           =   4215
            _ExtentX        =   7435
            _ExtentY        =   397
            _Version        =   393216
            LargeChange     =   1
            Min             =   -5
            Max             =   5
         End
         Begin VB.Label Label31 
            BorderStyle     =   1  'Fixed Single
            Caption         =   $"OptionsForm.frx":0417
            Height          =   975
            Left            =   300
            TabIndex        =   92
            Tag             =   "5005"
            Top             =   1020
            Width           =   4350
         End
         Begin VB.Label Label30 
            Caption         =   "1"
            Height          =   255
            Left            =   2400
            TabIndex        =   91
            Top             =   720
            Width           =   255
         End
         Begin VB.Label MutLab 
            Caption         =   "1 X"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   2280
            TabIndex        =   90
            Top             =   150
            Width           =   975
         End
         Begin VB.Label Label15 
            Caption         =   "alta"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   4305
            TabIndex        =   89
            Tag             =   "5004"
            Top             =   720
            Width           =   375
         End
         Begin VB.Label Label14 
            Caption         =   "bassa"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   225
            TabIndex        =   88
            Tag             =   "5003"
            Top             =   720
            Width           =   495
         End
      End
      Begin VB.Frame Frame15 
         Caption         =   "Scripts"
         Height          =   2235
         Left            =   -74700
         TabIndex        =   76
         Top             =   3480
         Width           =   9315
         Begin VB.ListBox Scripts 
            Height          =   840
            ItemData        =   "OptionsForm.frx":04D2
            Left            =   180
            List            =   "OptionsForm.frx":04D4
            TabIndex        =   83
            Top             =   1320
            Width           =   9015
         End
         Begin VB.ComboBox Condition 
            Height          =   315
            Left            =   180
            TabIndex        =   82
            Text            =   "Condition"
            Top             =   900
            Width           =   2175
         End
         Begin VB.ComboBox Item 
            Height          =   315
            Left            =   2460
            TabIndex        =   81
            Text            =   "Item"
            Top             =   900
            Width           =   1455
         End
         Begin VB.ComboBox Action 
            Height          =   315
            ItemData        =   "OptionsForm.frx":04D6
            Left            =   4020
            List            =   "OptionsForm.frx":04D8
            TabIndex        =   80
            Text            =   "Action"
            Top             =   900
            Width           =   1575
         End
         Begin VB.CommandButton AddScript 
            Caption         =   "Add Script"
            Height          =   375
            Left            =   5700
            TabIndex        =   79
            Top             =   900
            Width           =   1635
         End
         Begin VB.CommandButton DelScript 
            Caption         =   "Delete Selected Script"
            Height          =   375
            Left            =   7440
            TabIndex        =   78
            Top             =   900
            Width           =   1755
         End
         Begin VB.CheckBox DNACheck 
            Caption         =   "DNA Scripts Enabled"
            Height          =   375
            Left            =   7200
            TabIndex        =   77
            Top             =   300
            Width           =   1815
         End
         Begin VB.Label Label34 
            Caption         =   "Select a condition,and item and an action, then click on ""Add Script"" to add the script to the list."
            Height          =   255
            Left            =   180
            TabIndex        =   85
            Top             =   240
            Width           =   7200
         End
         Begin VB.Label Label35 
            Caption         =   "Select a script from the list and click on ""Delete Selected Script"" to remove it from the list"
            Height          =   255
            Left            =   180
            TabIndex        =   84
            Top             =   540
            Width           =   7200
         End
      End
      Begin VB.Frame Frame10 
         Caption         =   "Database"
         Height          =   1995
         Left            =   -74760
         TabIndex        =   53
         Top             =   3720
         Width           =   4395
         Begin VB.CheckBox DBExcludeVegs 
            Caption         =   "Exclude vegs from recording"
            Height          =   420
            Left            =   180
            TabIndex        =   58
            Tag             =   "30005"
            Top             =   1380
            Width           =   2535
         End
         Begin VB.CommandButton DBBrowse 
            Caption         =   "Browse..."
            Height          =   330
            Left            =   3000
            TabIndex        =   57
            Tag             =   "30004"
            Top             =   1440
            Width           =   1275
         End
         Begin VB.TextBox DBName 
            Height          =   330
            Left            =   1965
            TabIndex        =   56
            Top             =   960
            Width           =   2325
         End
         Begin VB.CheckBox DBEnable 
            Caption         =   "Enable database recording"
            Height          =   225
            Left            =   180
            TabIndex        =   55
            Tag             =   "30002"
            Top             =   480
            Width           =   2235
         End
         Begin VB.CommandButton StopDBRec 
            Caption         =   "Stop Database Recording"
            Enabled         =   0   'False
            Height          =   495
            Left            =   2520
            TabIndex        =   54
            Tag             =   "30001"
            Top             =   300
            Width           =   1755
         End
         Begin VB.Label Label50 
            Caption         =   "Database Name"
            Height          =   315
            Left            =   180
            TabIndex        =   59
            Top             =   1020
            Width           =   1575
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "Contest Conditions"
         Height          =   2355
         Left            =   -74700
         TabIndex        =   37
         Top             =   600
         Width           =   4935
         Begin VB.CheckBox F1Check 
            Alignment       =   1  'Right Justify
            Caption         =   "Use F1 Contest Conditions"
            Height          =   255
            Left            =   330
            TabIndex        =   43
            ToolTipText     =   "Sets screen size, costs and conditions for F1 match"
            Top             =   360
            Width           =   3345
         End
         Begin VB.TextBox ContestsText 
            Height          =   285
            Left            =   3000
            TabIndex        =   42
            Text            =   "5"
            Top             =   720
            Width           =   480
         End
         Begin VB.TextBox MaxRoundsToDrawText 
            Height          =   285
            Left            =   3000
            TabIndex        =   41
            Text            =   "0"
            ToolTipText     =   "How many cycles between condition checking"
            Top             =   1140
            Width           =   465
         End
         Begin VB.TextBox MaxCyclesText 
            Enabled         =   0   'False
            Height          =   285
            Left            =   3000
            TabIndex        =   40
            Top             =   1560
            Width           =   735
         End
         Begin VB.TextBox MaxhoursTxt 
            Enabled         =   0   'False
            Height          =   285
            Index           =   0
            Left            =   3000
            TabIndex        =   39
            Top             =   1980
            Visible         =   0   'False
            Width           =   315
         End
         Begin VB.TextBox MaxhoursTxt 
            Enabled         =   0   'False
            Height          =   285
            Index           =   1
            Left            =   3600
            TabIndex        =   38
            Top             =   1980
            Visible         =   0   'False
            Width           =   315
         End
         Begin ComCtl2.UpDown FrequencyCheckUpDn 
            Height          =   285
            Left            =   3480
            TabIndex        =   44
            Top             =   1140
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   100
            BuddyControl    =   "MaxRoundsToDrawText"
            BuddyDispid     =   196730
            OrigLeft        =   3480
            OrigTop         =   1140
            OrigRight       =   3735
            OrigBottom      =   1425
            Increment       =   10
            Max             =   10000
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown ContestsUpDn 
            Height          =   285
            Left            =   3480
            TabIndex        =   45
            Top             =   720
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   5
            BuddyControl    =   "ContestsText"
            BuddyDispid     =   196729
            OrigLeft        =   3240
            OrigTop         =   960
            OrigRight       =   3480
            OrigBottom      =   1245
            Max             =   100
            Min             =   1
            Enabled         =   -1  'True
         End
         Begin VB.Label ContestNumText 
            Caption         =   "Number of rounds in a Contest"
            Height          =   255
            Left            =   360
            TabIndex        =   52
            ToolTipText     =   "How many rounds of combat?"
            Top             =   780
            Width           =   2175
         End
         Begin VB.Label MaxRoundsToDrawLabel 
            Caption         =   "Defender wins if contest exceeds"
            Height          =   255
            Left            =   360
            TabIndex        =   51
            ToolTipText     =   "How many cycles between sampling"
            Top             =   1200
            Width           =   3015
         End
         Begin VB.Label Label29 
            Caption         =   "Max cycles in a round"
            Enabled         =   0   'False
            Height          =   195
            Left            =   360
            TabIndex        =   50
            Top             =   1620
            Width           =   2490
         End
         Begin VB.Label Label49 
            Caption         =   "Max time in a round"
            Height          =   255
            Left            =   360
            TabIndex        =   49
            Top             =   2040
            Visible         =   0   'False
            Width           =   1650
         End
         Begin VB.Label Label51 
            Caption         =   "h"
            Height          =   195
            Left            =   3360
            TabIndex        =   48
            Top             =   2040
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Label Label52 
            Caption         =   "m"
            Height          =   195
            Left            =   3960
            TabIndex        =   47
            Top             =   2040
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Label Label53 
            Caption         =   "rounds"
            Height          =   255
            Left            =   3840
            TabIndex        =   46
            Top             =   1200
            Width           =   495
         End
      End
      Begin VB.Frame Restart 
         Caption         =   "General Restart Conditions"
         Height          =   2355
         Left            =   -69660
         TabIndex        =   35
         Top             =   600
         Width           =   4455
         Begin VB.CheckBox RestartSimCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Restart Sim when all Robots are Dead"
            Height          =   255
            Left            =   240
            TabIndex        =   36
            ToolTipText     =   "Just what it says"
            Top             =   360
            Width           =   3135
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "Challenge League Conditions"
         Height          =   2355
         Left            =   -74700
         TabIndex        =   21
         Top             =   3060
         Width           =   9495
         Begin VB.CheckBox LeagueCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Run League on Start"
            Height          =   255
            Left            =   300
            TabIndex        =   32
            Top             =   360
            Width           =   3220
         End
         Begin VB.TextBox LeaguenameControl 
            Alignment       =   1  'Right Justify
            Height          =   315
            Left            =   2100
            TabIndex        =   31
            Top             =   720
            Width           =   1395
         End
         Begin VB.OptionButton LeagueF1Option 
            Caption         =   "F1"
            Height          =   375
            Left            =   300
            Style           =   1  'Graphical
            TabIndex        =   30
            ToolTipText     =   "All comers - no rules."
            Top             =   1440
            Width           =   375
         End
         Begin VB.OptionButton LeagueF2Option 
            Caption         =   "F2"
            Height          =   375
            Left            =   840
            Style           =   1  'Graphical
            TabIndex        =   29
            ToolTipText     =   "Tie feeding illegal."
            Top             =   1440
            Width           =   375
         End
         Begin VB.OptionButton LeageSBOption 
            Caption         =   "SB"
            Height          =   375
            Left            =   1380
            Style           =   1  'Graphical
            TabIndex        =   28
            ToolTipText     =   "6 genes and under league."
            Top             =   1440
            Width           =   375
         End
         Begin VB.OptionButton LeagueMBOption 
            Caption         =   "MB"
            Height          =   375
            Left            =   1920
            Style           =   1  'Graphical
            TabIndex        =   27
            ToolTipText     =   "Can't have a singlebot form that feeds."
            Top             =   1440
            Width           =   375
         End
         Begin VB.CheckBox RerunCheck 
            Caption         =   "Rerun League"
            Height          =   255
            Left            =   300
            TabIndex        =   26
            Top             =   1980
            Width           =   1455
         End
         Begin VB.OptionButton Leaguetype 
            Caption         =   "Challenge"
            Height          =   255
            Index           =   0
            Left            =   3960
            TabIndex        =   25
            Top             =   360
            Width           =   1515
         End
         Begin VB.OptionButton Leaguetype 
            Caption         =   "Ladder"
            Enabled         =   0   'False
            Height          =   255
            Index           =   1
            Left            =   3960
            TabIndex        =   24
            Top             =   780
            Width           =   1515
         End
         Begin VB.OptionButton Leaguetype 
            Caption         =   "Last Man Standing"
            Enabled         =   0   'False
            Height          =   255
            Index           =   2
            Left            =   3960
            TabIndex        =   23
            Top             =   1200
            Width           =   1635
         End
         Begin VB.OptionButton Leaguetype 
            Caption         =   "Free-For-All Elimination"
            Enabled         =   0   'False
            Height          =   255
            Index           =   3
            Left            =   3960
            TabIndex        =   22
            Top             =   1620
            Width           =   1995
         End
         Begin VB.Label Label56 
            Alignment       =   2  'Center
            Caption         =   "Common Leagues:"
            Height          =   255
            Left            =   1080
            TabIndex        =   34
            Top             =   1140
            Width           =   1755
         End
         Begin VB.Label Label48 
            Caption         =   "League Name"
            Height          =   315
            Left            =   300
            TabIndex        =   33
            Top             =   780
            Width           =   1575
         End
      End
      Begin VB.Frame Simulazione 
         Caption         =   "Internet Mode Settings"
         Height          =   4995
         Left            =   -74760
         TabIndex        =   20
         Tag             =   "31100"
         Top             =   480
         Width           =   3885
         Begin VB.TextBox IntName 
            Height          =   285
            Left            =   240
            TabIndex        =   259
            Top             =   2400
            Width           =   3015
         End
         Begin VB.TextBox outboundPathText 
            Height          =   285
            Left            =   240
            TabIndex        =   257
            Top             =   1560
            Width           =   3135
         End
         Begin VB.TextBox inboundPathText 
            Height          =   285
            Left            =   240
            TabIndex        =   254
            Top             =   720
            Width           =   3135
         End
         Begin VB.Label Label40 
            Caption         =   "User Name"
            Height          =   255
            Left            =   240
            TabIndex        =   258
            Top             =   2040
            Width           =   1095
         End
         Begin VB.Label Label39 
            Caption         =   "Outbound Path"
            Height          =   255
            Left            =   240
            TabIndex        =   256
            Top             =   1200
            Width           =   1215
         End
         Begin VB.Label Label1 
            Caption         =   "Inbound Path"
            Height          =   255
            Left            =   240
            TabIndex        =   255
            Top             =   360
            Width           =   1455
         End
      End
      Begin VB.Frame Frame21 
         Caption         =   "Costs and Returned Shots"
         Height          =   5235
         Left            =   -70080
         TabIndex        =   8
         Top             =   420
         Width           =   4815
         Begin ComCtl2.UpDown PropUpDn 
            Height          =   285
            Left            =   3960
            TabIndex        =   16
            Top             =   3000
            Visible         =   0   'False
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            BuddyControl    =   "Prop"
            BuddyDispid     =   196764
            OrigLeft        =   4260
            OrigTop         =   2760
            OrigRight       =   4500
            OrigBottom      =   3090
            Increment       =   2
            Max             =   10000
            Enabled         =   -1  'True
         End
         Begin VB.OptionButton ExchangeProp 
            Caption         =   "Proportional"
            Height          =   225
            Left            =   2160
            TabIndex        =   14
            Top             =   3000
            Width           =   1185
         End
         Begin VB.OptionButton ExchangeFix 
            Caption         =   "Fixed Nrg"
            Height          =   225
            Left            =   2160
            TabIndex        =   13
            Top             =   2520
            Width           =   1125
         End
         Begin VB.TextBox Fixed 
            Height          =   285
            Left            =   3480
            TabIndex        =   12
            Text            =   "0"
            Top             =   2520
            Width           =   510
         End
         Begin VB.TextBox Prop 
            Height          =   285
            Left            =   3480
            TabIndex        =   11
            Text            =   "0"
            Top             =   3000
            Width           =   510
         End
         Begin ComCtl2.UpDown FixUpDn 
            Height          =   285
            Left            =   3960
            TabIndex        =   15
            Top             =   2520
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            BuddyControl    =   "Fixed"
            BuddyDispid     =   196763
            OrigLeft        =   4245
            OrigTop         =   2340
            OrigRight       =   4485
            OrigBottom      =   2670
            Increment       =   10
            Max             =   10000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin VB.Frame Frame28 
            Caption         =   "Costs"
            Height          =   1935
            Left            =   120
            TabIndex        =   9
            Top             =   300
            Width           =   4575
            Begin VB.OptionButton CostRadio 
               Caption         =   "Custom"
               Height          =   495
               Index           =   2
               Left            =   600
               TabIndex        =   233
               Top             =   1200
               Width           =   1215
            End
            Begin VB.OptionButton CostRadio 
               Caption         =   "F1 Default"
               Height          =   495
               Index           =   1
               Left            =   600
               TabIndex        =   232
               Top             =   720
               Width           =   1215
            End
            Begin VB.OptionButton CostRadio 
               Caption         =   "No Costs"
               Height          =   495
               Index           =   0
               Left            =   600
               TabIndex        =   231
               Top             =   240
               Width           =   1215
            End
            Begin VB.CommandButton ToCosts 
               Caption         =   "Custom Simulation Costs"
               Height          =   375
               Left            =   2040
               TabIndex        =   10
               Top             =   1320
               Width           =   1875
            End
         End
         Begin VB.Label Label8 
            BorderStyle     =   1  'Fixed Single
            Caption         =   $"OptionsForm.frx":04DA
            Height          =   945
            Left            =   225
            TabIndex        =   19
            Tag             =   "6009"
            Top             =   3840
            Width           =   4335
         End
         Begin VB.Label Label16 
            Caption         =   "Shot Energy Exchange Method"
            Height          =   495
            Left            =   225
            TabIndex        =   18
            Top             =   2640
            Width           =   1905
         End
         Begin VB.Label Label10 
            Caption         =   "%"
            Height          =   195
            Left            =   4320
            TabIndex        =   17
            Top             =   3050
            Width           =   135
         End
      End
      Begin RichTextLib.RichTextBox CommentBox 
         Height          =   975
         Left            =   240
         TabIndex        =   133
         Top             =   4680
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   1720
         _Version        =   393217
         Enabled         =   -1  'True
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"OptionsForm.frx":059F
      End
      Begin VB.Frame Frame1 
         Caption         =   "Species Properties"
         Height          =   5085
         Left            =   3840
         TabIndex        =   101
         Tag             =   "2010"
         Top             =   600
         Width           =   6075
         Begin VB.CheckBox MutEnabledCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Disable Mutations"
            Height          =   330
            Left            =   3360
            TabIndex        =   251
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   4080
            Width           =   2430
         End
         Begin VB.CheckBox VirusImmuneCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Virus Immune"
            Height          =   330
            Left            =   3360
            TabIndex        =   250
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   3840
            Width           =   2430
         End
         Begin VB.CheckBox DisableReproductionCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Disable Reproduction"
            Height          =   330
            Left            =   3360
            TabIndex        =   249
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   3600
            Width           =   2430
         End
         Begin VB.CheckBox DisableMovementSysvarsCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Disable Voluntary Movement"
            Height          =   330
            Left            =   3360
            TabIndex        =   248
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   3360
            Width           =   2430
         End
         Begin VB.CheckBox DisableDNACheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Disable DNA Execution"
            Height          =   330
            Left            =   3360
            TabIndex        =   247
            ToolTipText     =   "Speeds up the simulation by turning off DNA execution for this species"
            Top             =   3120
            Width           =   2430
         End
         Begin VB.CheckBox DisableVisionCheck 
            Alignment       =   1  'Right Justify
            Caption         =   "Disable Vision"
            Height          =   330
            Left            =   3360
            TabIndex        =   246
            ToolTipText     =   "Speeds up the simulation by turning off vision for this species"
            Top             =   2880
            Width           =   2430
         End
         Begin VB.CommandButton InNrg 
            Caption         =   "30000"
            Height          =   255
            Index           =   3
            Left            =   5280
            TabIndex        =   121
            Top             =   1800
            Width           =   615
         End
         Begin VB.CommandButton InNrg 
            Caption         =   "5000"
            Height          =   255
            Index           =   2
            Left            =   4680
            TabIndex        =   120
            Top             =   1800
            Width           =   615
         End
         Begin VB.CommandButton InNrg 
            Caption         =   "3000"
            Height          =   255
            Index           =   0
            Left            =   4080
            TabIndex        =   119
            Top             =   1800
            Width           =   615
         End
         Begin VB.CommandButton IndNum 
            Caption         =   "30"
            Height          =   255
            Index           =   3
            Left            =   5400
            TabIndex        =   118
            Top             =   840
            Width           =   495
         End
         Begin VB.CommandButton IndNum 
            Caption         =   "15"
            Height          =   255
            Index           =   2
            Left            =   4920
            TabIndex        =   117
            Top             =   840
            Width           =   495
         End
         Begin VB.CommandButton IndNum 
            Caption         =   "5"
            Height          =   255
            Index           =   0
            Left            =   4440
            TabIndex        =   116
            Top             =   840
            Width           =   495
         End
         Begin VB.CheckBox BlockSpec 
            Alignment       =   1  'Right Justify
            Caption         =   "Fixed in place"
            Height          =   330
            Left            =   3360
            TabIndex        =   115
            Top             =   2640
            Width           =   2430
         End
         Begin VB.CheckBox SpecVeg 
            Alignment       =   1  'Right Justify
            Caption         =   "Vegetable (autotrof)"
            Height          =   210
            Left            =   3360
            TabIndex        =   112
            ToolTipText     =   "Feed automatically this type (only for vegetables)"
            Top             =   2280
            Width           =   2430
         End
         Begin VB.TextBox SpecQty 
            Alignment       =   1  'Right Justify
            Height          =   285
            Left            =   5040
            TabIndex        =   111
            Text            =   "0"
            Top             =   480
            Width           =   585
         End
         Begin VB.ComboBox SpecCol 
            Height          =   315
            ItemData        =   "OptionsForm.frx":0621
            Left            =   1350
            List            =   "OptionsForm.frx":0643
            Style           =   2  'Dropdown List
            TabIndex        =   110
            ToolTipText     =   "Initial colour"
            Top             =   1770
            Width           =   1380
         End
         Begin VB.TextBox SpecNrg 
            Alignment       =   1  'Right Justify
            Height          =   285
            IMEMode         =   3  'DISABLE
            Left            =   5040
            TabIndex        =   109
            Text            =   "0"
            Top             =   1440
            Width           =   585
         End
         Begin VB.CommandButton MutRatesBut 
            Caption         =   "Mutation Rates"
            Height          =   360
            Left            =   3720
            TabIndex        =   108
            Tag             =   "2016"
            ToolTipText     =   "Sets the initial mutation rates for this type"
            Top             =   4560
            Width           =   1575
         End
         Begin VB.CommandButton IndNum 
            Caption         =   "0"
            Height          =   255
            Index           =   4
            Left            =   3960
            TabIndex        =   107
            Top             =   840
            Width           =   495
         End
         Begin VB.CommandButton PosReset 
            Caption         =   "Reset"
            Height          =   375
            Left            =   1680
            TabIndex        =   106
            Top             =   2280
            Width           =   1095
         End
         Begin ComCtl2.UpDown UpDown1 
            Height          =   285
            Left            =   5640
            TabIndex        =   122
            ToolTipText     =   "Set the initial number of copies for this robot type"
            Top             =   480
            Width           =   240
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            BuddyControl    =   "SpecQty"
            BuddyDispid     =   196782
            OrigLeft        =   2310
            OrigTop         =   525
            OrigRight       =   2550
            OrigBottom      =   810
            Max             =   200
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown UpDown3 
            Height          =   285
            Left            =   5640
            TabIndex        =   123
            ToolTipText     =   "Initial energy assigned to this type"
            Top             =   1440
            Width           =   240
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   1000
            BuddyControl    =   "SpecNrg"
            BuddyDispid     =   196784
            OrigLeft        =   1560
            OrigTop         =   240
            OrigRight       =   1800
            OrigBottom      =   615
            Increment       =   500
            Max             =   32000
            Min             =   10
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin VB.Frame Frame6 
            Caption         =   "Skin"
            Height          =   1200
            Left            =   195
            TabIndex        =   113
            Tag             =   "2121"
            Top             =   390
            Width           =   2565
            Begin VB.CommandButton SkinChange 
               Caption         =   "Change"
               Height          =   330
               Left            =   285
               TabIndex        =   114
               Tag             =   "2120"
               Top             =   450
               Width           =   855
            End
            Begin VB.Shape Cerchio 
               BorderColor     =   &H8000000C&
               BorderWidth     =   4
               FillColor       =   &H008080FF&
               Height          =   645
               Left            =   1515
               Shape           =   3  'Circle
               Top             =   315
               Width           =   645
            End
            Begin VB.Shape Shape3 
               FillColor       =   &H00FFFFFF&
               FillStyle       =   0  'Solid
               Height          =   165
               Left            =   2115
               Shape           =   3  'Circle
               Top             =   555
               Width           =   150
            End
            Begin VB.Line Line9 
               BorderColor     =   &H00000000&
               BorderWidth     =   2
               X1              =   1635
               X2              =   2055
               Y1              =   690
               Y2              =   690
            End
            Begin VB.Line Line8 
               BorderColor     =   &H00000000&
               BorderWidth     =   2
               X1              =   1605
               X2              =   2100
               Y1              =   600
               Y2              =   600
            End
            Begin VB.Line Line7 
               BorderColor     =   &H00000000&
               BorderWidth     =   2
               X1              =   1620
               X2              =   2070
               Y1              =   510
               Y2              =   510
            End
            Begin VB.Shape Shape2 
               FillColor       =   &H00511206&
               FillStyle       =   0  'Solid
               Height          =   885
               Left            =   1410
               Top             =   210
               Width           =   900
            End
         End
         Begin VB.PictureBox IPB 
            Height          =   1695
            Left            =   120
            ScaleHeight     =   1635
            ScaleWidth      =   2715
            TabIndex        =   102
            Top             =   2760
            Width           =   2775
            Begin VB.PictureBox Initial_Position 
               BackColor       =   &H00FF0000&
               FillColor       =   &H000000FF&
               FillStyle       =   0  'Solid
               Height          =   1455
               Left            =   120
               ScaleHeight     =   1395
               ScaleWidth      =   2475
               TabIndex        =   105
               Top             =   120
               Width           =   2535
            End
            Begin VB.PictureBox RobPlacLine 
               Appearance      =   0  'Flat
               BackColor       =   &H00FFFFFF&
               BorderStyle     =   0  'None
               DrawStyle       =   5  'Transparent
               ForeColor       =   &H80000008&
               Height          =   135
               Index           =   0
               Left            =   600
               ScaleHeight     =   135
               ScaleWidth      =   1215
               TabIndex        =   104
               Top             =   960
               Visible         =   0   'False
               Width           =   1215
            End
            Begin VB.PictureBox picHandle 
               Appearance      =   0  'Flat
               BackColor       =   &H8000000D&
               BorderStyle     =   0  'None
               CausesValidation=   0   'False
               ForeColor       =   &H80000008&
               Height          =   255
               Index           =   0
               Left            =   1200
               ScaleHeight     =   255
               ScaleWidth      =   255
               TabIndex        =   103
               Top             =   960
               Visible         =   0   'False
               Width           =   255
            End
         End
         Begin VB.Line Line4 
            BorderColor     =   &H8000000C&
            X1              =   3120
            X2              =   3120
            Y1              =   180
            Y2              =   4485
         End
         Begin VB.Label Label2 
            Caption         =   "Individui"
            Height          =   255
            Left            =   3360
            TabIndex        =   127
            Tag             =   "2011"
            Top             =   480
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Posizione iniziale"
            Height          =   255
            Left            =   165
            TabIndex        =   126
            Tag             =   "2014"
            Top             =   2400
            Width           =   1575
         End
         Begin VB.Label Label5 
            Caption         =   "Colore"
            Height          =   225
            Left            =   360
            TabIndex        =   125
            Tag             =   "2015"
            Top             =   1830
            Width           =   750
         End
         Begin VB.Label Label6 
            Caption         =   "Energia iniziale"
            Height          =   255
            Left            =   3360
            TabIndex        =   124
            Tag             =   "2012"
            Top             =   1440
            Width           =   1455
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Autosave"
         Height          =   3105
         Left            =   -74820
         TabIndex        =   60
         Top             =   480
         Width           =   9525
         Begin VB.CheckBox DeleteOldBotFilesCheck 
            Caption         =   "Keep only the last 10 bots    (Avoid filling up your hard drive)"
            Height          =   255
            Left            =   1200
            TabIndex        =   245
            Top             =   2760
            Width           =   5535
         End
         Begin VB.CheckBox DeleteOldFiles 
            Caption         =   "Keep only the last 10 saves    (Avoid filling up your hard drive!)"
            Height          =   255
            Left            =   1200
            TabIndex        =   243
            Top             =   1160
            Width           =   5535
         End
         Begin VB.CheckBox StripMutationsCheck 
            Caption         =   "Reduce file size by saving without Mutation Details"
            Height          =   255
            Left            =   1200
            TabIndex        =   242
            Top             =   1440
            Width           =   5535
         End
         Begin VB.TextBox AutoRobTxt 
            Alignment       =   1  'Right Justify
            Height          =   285
            Left            =   2400
            TabIndex        =   64
            Text            =   "0"
            Top             =   2040
            Width           =   660
         End
         Begin VB.TextBox AutoRobPath 
            Alignment       =   2  'Center
            Height          =   285
            Left            =   1200
            TabIndex        =   63
            Text            =   "BestRob"
            Top             =   2400
            Width           =   3015
         End
         Begin VB.TextBox AutoSimPath 
            Alignment       =   2  'Center
            Height          =   285
            Left            =   1200
            TabIndex        =   62
            Text            =   "AutoSavedSim"
            Top             =   660
            Width           =   3015
         End
         Begin VB.TextBox AutoSimTxt 
            Alignment       =   1  'Right Justify
            Height          =   285
            Left            =   2400
            TabIndex        =   61
            Text            =   "0"
            Top             =   240
            Width           =   645
         End
         Begin MSComDlg.CommonDialog CommonDialog1 
            Left            =   8280
            Top             =   2160
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
         End
         Begin ComCtl2.UpDown AutoSimUpDn 
            Height          =   285
            Left            =   3120
            TabIndex        =   65
            Top             =   240
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            BuddyControl    =   "AutoSimTxt"
            BuddyDispid     =   196811
            OrigLeft        =   3360
            OrigTop         =   360
            OrigRight       =   3600
            OrigBottom      =   645
            Max             =   12000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown AutoRobUpDn 
            Height          =   285
            Left            =   3120
            TabIndex        =   66
            Top             =   2040
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            BuddyControl    =   "AutoRobTxt"
            BuddyDispid     =   196808
            OrigLeft        =   3120
            OrigTop         =   240
            OrigRight       =   3375
            OrigBottom      =   525
            Max             =   12000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   65547
            Enabled         =   -1  'True
         End
         Begin VB.Label Label44 
            Caption         =   "Specify name only, without path/extension"
            Height          =   375
            Left            =   4320
            TabIndex        =   75
            Tag             =   "3008"
            Top             =   600
            Width           =   2415
         End
         Begin VB.Label Label43 
            Caption         =   "Specify name only, without path/extension"
            Height          =   375
            Left            =   4320
            TabIndex        =   74
            Tag             =   "3008"
            Top             =   2280
            Width           =   2655
         End
         Begin VB.Line Line2 
            BorderColor     =   &H8000000C&
            X1              =   210
            X2              =   6825
            Y1              =   1845
            Y2              =   1845
         End
         Begin VB.Line Line1 
            BorderColor     =   &H80000009&
            X1              =   210
            X2              =   6825
            Y1              =   1800
            Y2              =   1800
         End
         Begin VB.Label Label20 
            Caption         =   "Salva il miglior robot ogni"
            Height          =   255
            Left            =   240
            TabIndex        =   73
            Tag             =   "3006"
            Top             =   2100
            Width           =   2205
         End
         Begin VB.Label Label22 
            Caption         =   "File name"
            Height          =   255
            Left            =   240
            TabIndex        =   72
            Tag             =   "3004"
            Top             =   2430
            Width           =   855
         End
         Begin VB.Label Label24 
            Caption         =   "minuti"
            Height          =   255
            Left            =   3600
            TabIndex        =   71
            Tag             =   "3003"
            Top             =   300
            Width           =   615
         End
         Begin VB.Label Label25 
            Caption         =   "Salva l'intera simulazione ogni"
            Height          =   255
            Left            =   240
            TabIndex        =   70
            Tag             =   "3002"
            Top             =   300
            Width           =   2205
         End
         Begin VB.Label Label54 
            Caption         =   "minutes"
            Height          =   195
            Left            =   3600
            TabIndex        =   69
            Top             =   2100
            Width           =   810
         End
         Begin VB.Label Label55 
            Caption         =   "File name"
            Height          =   255
            Left            =   240
            TabIndex        =   68
            Top             =   690
            Width           =   855
         End
         Begin VB.Label Label26 
            BorderStyle     =   1  'Fixed Single
            Caption         =   $"OptionsForm.frx":068D
            Height          =   1470
            Left            =   7080
            TabIndex        =   67
            Tag             =   "3007"
            Top             =   300
            Width           =   2250
         End
      End
      Begin VB.Label Label41 
         Caption         =   $"OptionsForm.frx":072E
         Height          =   2655
         Left            =   -70560
         TabIndex        =   260
         Top             =   600
         Width           =   5775
      End
      Begin VB.Label Label36 
         Caption         =   "Commenti sulla specie:"
         Height          =   255
         Left            =   240
         TabIndex        =   226
         Tag             =   "2100"
         Top             =   4440
         Width           =   2055
      End
      Begin VB.Label SpeciesLabel 
         Caption         =   "Native Species:"
         Height          =   255
         Left            =   240
         TabIndex        =   225
         Tag             =   "0"
         Top             =   480
         Width           =   3375
      End
   End
   Begin VB.Label Label19 
      Caption         =   "Soft"
      Height          =   255
      Left            =   0
      TabIndex        =   237
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label13 
      Caption         =   "Label13"
      Height          =   495
      Left            =   4440
      TabIndex        =   227
      Top             =   3000
      Width           =   1215
   End
End
Attribute VB_Name = "optionsform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Botsareus 5/8/2012 Selected the first tab to be the default when window first opens (vb generated code above may have changed)

' boring stuff. this is the sim options module, so
' there's much graphical interface (and a big mess).
' simulation options are saved in a structure
' called SimOptions. When the options window is opened
' the current settings SimOpts are copied to TmpOpts
' which is modified. On exit, if ok has been clicked
' TmpOpts is copied to SimOpts again
' SimOpts struct is defined in SimOptModule

Option Explicit

Dim follow1 As Boolean
Dim follow2 As Boolean
Dim follow3 As Boolean
Dim follow4 As Boolean

Dim SpeciesToggle As Boolean

Dim lastsettings As String
Dim contrmethod As Integer
Public CurrSpec As Integer

Public col1 As Long
Public Canc As Boolean

Public IPBWidth As Long
Public IPBHeight As Long

Dim multx As Long
Dim multy As Long

'Windows declarations
Private Declare Function SetCapture Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ClipCursor Lib "user32" (lpRect As Any) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetStockObject Lib "gdi32" (ByVal nIndex As Long) As Long
Private Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function SetROP2 Lib "gdi32" (ByVal hdc As Long, ByVal nDrawMode As Long) As Long
Private Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long

Private Type POINTAPI
    X As Long
    Y As Long
End Type

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Const NULL_BRUSH = 5
Private Const PS_SOLID = 0
Private Const R2_NOT = 6

Enum ControlState
    StateNothing = 0
    StateDragging
    StateSizing
End Enum

Private m_CurrCtl As Control
Private m_DragState As ControlState
Private m_DragHandle As Integer
Private m_DragRect As New CRect
Private m_DragPoint As POINTAPI
Private speclistchecked As Boolean




Private Sub AutoRobTxt_Change()
  If val(AutoRobTxt.text) > 10000 Then AutoRobTxt.text = "10000"
  If val(AutoRobTxt.text) < 0 Then AutoRobTxt.text = "0"
End Sub

Private Sub AutoSimTxt_Change()
If val(AutoSimTxt.text) > 10000 Then AutoSimTxt.text = "10000"
If val(AutoSimTxt.text) < 0 Then AutoSimTxt.text = "0"

End Sub

Private Sub DisableDNACheck_Click()
If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).DisableDNA = False
    If DisableDNACheck.value = 1 Then TmpOpts.Specie(CurrSpec).DisableDNA = True
  End If
End Sub

Private Sub DisableMovementSysvarsCheck_Click()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).DisableMovementSysvars = False
    If DisableMovementSysvarsCheck.value = 1 Then TmpOpts.Specie(CurrSpec).DisableMovementSysvars = True
  End If
End Sub

Private Sub DisableMutationsCheck_Click()
  TmpOpts.DisableMutations = DisableMutationsCheck.value * True
End Sub

Private Sub DisableReproductionCheck_Click()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).CantReproduce = False
    If DisableReproductionCheck.value = 1 Then TmpOpts.Specie(CurrSpec).CantReproduce = True
  End If
End Sub

Private Sub DisableVisionCheck_Click()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).CantSee = False
    If DisableVisionCheck.value = 1 Then TmpOpts.Specie(CurrSpec).CantSee = True
  End If
End Sub

Private Sub DeleteOldBotFilesCheck_Click()
   TmpOpts.AutoSaveDeleteOldBotFiles = DeleteOldBotFilesCheck.value * True
End Sub

Private Sub DeleteOldFiles_Click()
  TmpOpts.AutoSaveDeleteOlderFiles = DeleteOldFiles.value * True
End Sub

Private Sub Elasticity_Change()
  TmpOpts.CoefficientElasticity = Elasticity.value / 10
  Elasticity.text = Elasticity.value / 10
 ' Elasticity.Refresh
End Sub

Private Sub Energy_Click()
  EnergyForm.Show vbModal
  Unload EnergyForm
End Sub

Private Sub FixBotRadius_Click()
  TmpOpts.FixedBotRadii = FixBotRadius.value * True
End Sub

Private Sub Leaguename_Change()

End Sub

Private Sub MaxCyclesText_Change()
 If val(MaxCyclesText.text) >= 0 Then
    F1Mode.MaxCycles = val(MaxCyclesText.text)
  End If
End Sub

Private Sub MaxRoundsToDrawText_Change()
  If val(MaxRoundsToDrawText.text) >= 0 Then
    F1Mode.MaxRoundsToDraw = val(MaxRoundsToDrawText.text)
  End If
End Sub

Private Sub MutEnabledCheck_Click()
 If CurrSpec > -1 Then
    If MutEnabledCheck.value = 1 Then
      TmpOpts.Specie(CurrSpec).Mutables.Mutations = False
      MutRatesBut.Enabled = False
    Else
      TmpOpts.Specie(CurrSpec).Mutables.Mutations = True
      MutRatesBut.Enabled = True
    End If
  End If
End Sub

Public Sub PopulateSpeciesList()
Dim i As Integer

 SortSpecies
 If SpeciesToggle Then
    SpeciesLabel = "Native and Non-Native Species:"
    NativeSpeciesButton.Caption = "Show Native Species Only"
    SpecList.CLEAR
    For i = 0 To TmpOpts.SpeciesNum - 1
      SpecList.additem (TmpOpts.Specie(i).Name)
    Next i
  Else
    SpeciesLabel = "Native Species:"
    NativeSpeciesButton.Caption = "Show Non-Native Species"
    SpecList.CLEAR
    For i = 0 To TmpOpts.SpeciesNum - 1
       If TmpOpts.Specie(i).Native Then SpecList.additem (TmpOpts.Specie(i).Name)
    Next i
  End If
 
  SpecList.Refresh
End Sub


Private Sub NativeSpeciesButton_Click()
  Dim i As Integer
  SpeciesToggle = Not SpeciesToggle
  PopulateSpeciesList
 
End Sub

Private Sub RenameButton_Click()
Dim ind As Integer
 
  ind = optionsform.SpecList.ListIndex
  If ind >= 0 Then
    'RenameForm.Show vbModal
  Else
    MsgBox ("No Species Selected.")
  End If
  
  PopulateSpeciesList
End Sub

Private Sub StripMutationsCheck_Click()
  TmpOpts.AutoSaveStripMutations = StripMutationsCheck.value * True
End Sub

Private Sub ToCosts_Click()
  CostsForm.Show vbModal
  Unload CostsForm
End Sub


Private Sub CostRadio_Click(Index As Integer)
Dim k As Integer
Select Case Index
  Case 0: 'No Costs
    ToCosts.Enabled = False
    For k = 0 To 70
      TmpOpts.Costs(k) = 0
    Next k
  Case 1: 'F1 Costs
    ToCosts.Enabled = False
    For k = 0 To 70
      TmpOpts.Costs(k) = 0
    Next k
    TmpOpts.Costs(5) = 0.004
    TmpOpts.Costs(7) = 0.04
    TmpOpts.Costs(20) = 0.05
    TmpOpts.Costs(22) = 2
    TmpOpts.Costs(23) = 2
    TmpOpts.Costs(26) = 0.01
    TmpOpts.Costs(27) = 0.01
    TmpOpts.Costs(28) = 0.1
    TmpOpts.Costs(29) = 0.1
    TmpOpts.Costs(BODYUPKEEP) = 0.00001
    TmpOpts.Costs(AGECOST) = 0.01
    TmpOpts.Costs(COSTMULTIPLIER) = 1
  Case 2: 'Custom
    ToCosts.Enabled = True
  End Select
  TmpOpts.CostRadioSetting = Index
End Sub

Private Sub FluidSolidRadio_Click(Index As Integer)
  Select Case Index
  Case 0: 'Fluid
    FrictionCombo.text = FrictionCombo.list(3)
    FrictionCombo_Click
    FrictionCombo.Enabled = False
    DragCombo.Enabled = True
    ToPhysics.Enabled = False
    DragCombo_Click
 Case 1: 'Solid
    DragCombo.text = DragCombo.list(3)
    DragCombo_Click
    FrictionCombo.Enabled = True
    DragCombo.Enabled = False
    ToPhysics.Enabled = False
    FrictionCombo_Click
  Case 2: 'Custom
    FrictionCombo.Enabled = False
    DragCombo.Enabled = False
    ToPhysics.Enabled = True
  End Select
  TmpOpts.FluidSolidCustom = Index
End Sub

Private Sub MaxVelSlider_Change()
  TmpOpts.MaxVelocity = MaxVelSlider.value
End Sub


Private Sub PauseButton_Click()
  Form1.Active = Not Form1.Active
  PauseButton.Caption = IIf(Form1.Active, "Unpaused", "Paused")
End Sub


''''''''''''''''''''''''''''''''

'Species Tab

''''''''''''''''''''''''''''''''

Private Sub SpecList_Click()
  Dim k As Integer
  Dim cmaxx As Long
  Dim cminx As Long
  Dim cmaxy As Long
  Dim cminy As Long
  Dim w As Long
  Dim h As Long
  
  w = IPB.Width
  h = IPB.Height
  
  enprop
  DragEnd
  k = SpecList.ListIndex
  CurrSpec = k
  ShowSkin k
  speclistchecked = True
  SpecCol.ListIndex = TmpOpts.Specie(k).Colind 'EricL 3/21/2006 - Set the Color Drop Down to match the selected species
  speclistchecked = False
  Frame1.Caption = WSproperties + TmpOpts.Specie(k).Name
  SpecQty.text = Str$(TmpOpts.Specie(k).qty)
  SpecNrg.text = Str$(TmpOpts.Specie(k).Stnrg)
  Cerchio.FillColor = TmpOpts.Specie(k).color
  Cerchio.BorderColor = TmpOpts.Specie(k).color
  Line7.BorderColor = TmpOpts.Specie(k).color
  Line8.BorderColor = TmpOpts.Specie(k).color
  Line9.BorderColor = TmpOpts.Specie(k).color
  If TmpOpts.Specie(k).Veg Then
    SpecVeg.value = 1
  Else
    SpecVeg.value = 0
  End If
  
  If TmpOpts.Specie(k).CantSee Then
    DisableVisionCheck.value = 1
  Else
    DisableVisionCheck.value = 0
  End If
  
  If TmpOpts.Specie(k).DisableDNA Then
    DisableDNACheck.value = 1
  Else
    DisableDNACheck.value = 0
  End If
  
  If TmpOpts.Specie(k).CantReproduce Then
    DisableReproductionCheck.value = 1
  Else
    DisableReproductionCheck.value = 0
  End If
    
  If TmpOpts.Specie(k).DisableMovementSysvars Then
    DisableMovementSysvarsCheck.value = 1
  Else
    DisableMovementSysvarsCheck.value = 0
  End If
  
 If TmpOpts.Specie(k).VirusImmune Then
    VirusImmuneCheck.value = 1
  Else
    VirusImmuneCheck.value = 0
  End If
  
  If TmpOpts.Specie(k).Mutables.Mutations Then
    MutEnabledCheck.value = 0
  Else
    MutEnabledCheck.value = 1
  End If
  
  If TmpOpts.Specie(k).Fixed Then
    BlockSpec.value = 1
  Else
    BlockSpec.value = 0
  End If
  
  
  CommentBox.text = TmpOpts.Specie(k).Comment
  
  If TmpOpts.Specie(k).Poslf < 0 Then TmpOpts.Specie(k).Poslf = 0
  If TmpOpts.Specie(k).Postp < 0 Then TmpOpts.Specie(k).Postp = 0
  
  If TmpOpts.Specie(k).Poslf > 1 Then TmpOpts.Specie(k).Poslf = 0
  If TmpOpts.Specie(k).Postp > 1 Then TmpOpts.Specie(k).Postp = 0
  
  If TmpOpts.Specie(k).Posrg > 1 Then TmpOpts.Specie(k).Posrg = 1
  If TmpOpts.Specie(k).Posdn > 1 Then TmpOpts.Specie(k).Posdn = 1
  
  If TmpOpts.Specie(k).Posrg < 0 Then TmpOpts.Specie(k).Posrg = 1
  If TmpOpts.Specie(k).Posdn < 0 Then TmpOpts.Specie(k).Posdn = 1
  
  Initial_Position.Left = TmpOpts.Specie(k).Poslf * w
  Initial_Position.Top = TmpOpts.Specie(k).Postp * h
  
  Initial_Position.Width = (TmpOpts.Specie(k).Posrg * w) - Initial_Position.Left
  Initial_Position.Height = (TmpOpts.Specie(k).Posdn * h) - Initial_Position.Top
  Initial_Position.Visible = True
  
  Frame1.Refresh
End Sub

Private Sub AddSpec_Click()
  On Error GoTo fine
  CommonDialog1.FileName = ""
  CommonDialog1.Filter = "Dna or organism file(*.txt;*.org)|*.txt;*.org"
  CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
  CommonDialog1.DialogTitle = WSchoosedna
  CommonDialog1.ShowOpen
  additem CommonDialog1.FileName
 ' TmpOpts.SpeciesNum = TmpOpts.SpeciesNum + 1
  PopulateSpeciesList
fine:
End Sub

Private Sub DuplicaButt_Click()
  On Error GoTo fine
  Dim ind As Integer
  ind = SpecList.ListIndex
  If ind >= 0 And TmpOpts.Specie(ind).Native Then
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "Dna file(*.txt)|*.txt"
    CommonDialog1.InitDir = MDIForm1.MainDir + "\robots"
    CommonDialog1.DialogTitle = WSchoosedna
    CommonDialog1.ShowOpen
    additem CommonDialog1.FileName
   ' TmpOpts.SpeciesNum = TmpOpts.SpeciesNum + 1
    duplitem ind, TmpOpts.SpeciesNum - 1
  Else
    MsgBox ("Sorry, but you can only duplicate bots that originated in this simulation.")
  End If
  PopulateSpeciesList
fine:
End Sub

Private Sub DelSpec_Click()
  Dim ind As Integer, k As Long, t As Long, l As Long
  ind = SpecList.ListIndex
  If ind >= 0 Then
    SpecList.RemoveItem ind
    k = ind
    'l = SpecList.ListCount + 1
    For t = ind To SpecList.ListCount 'Listcount now has one fewer than it did before!!!
      TmpOpts.Specie(t) = TmpOpts.Specie(t + 1)
    Next t
    TmpOpts.SpeciesNum = TmpOpts.SpeciesNum - 1
    disprop
  'Else
   ' MsgBox ("Sorry, but you can only delete bots that originated in this simulation.")
    'Check to make sure our current slected index is still valid
    If ind >= SpecList.ListCount Then
      ind = ind - 1
    End If
    If SpecList.ListCount > 0 Then
      SpecList.ListIndex = ind
    End If
  End If
End Sub

Private Sub ClearSpec_Click()
  SpecList.CLEAR
  clearall
  TmpOpts.SpeciesNum = 0
  disprop
End Sub

Private Sub clearall()
  Dim k As Integer
  k = 0
'  SpecList.CLEAR
  While TmpOpts.Specie(k).Name <> ""
    TmpOpts.Specie(k).Name = ""
    k = k + 1
  Wend
End Sub

Sub additem(path As String)
  Dim k As Integer, t As Long
  SpecList.additem extractname(path)
  'k = SpecList.ListCount - 1
  
  k = TmpOpts.SpeciesNum
  TmpOpts.SpeciesNum = TmpOpts.SpeciesNum + 1
  
  TmpOpts.Specie(k).Colind = 8 'Botsareus 5/8/2012 Changed color CamboBox default value to Random
  TmpOpts.Specie(k).Posrg = 1
  TmpOpts.Specie(k).Posdn = 1
  TmpOpts.Specie(k).Poslf = 0
  TmpOpts.Specie(k).Postp = 0
  TmpOpts.Specie(k).Name = extractname(path)
  TmpOpts.Specie(k).path = extractpath(path)
  ExtractComment path, k
  TmpOpts.Specie(k).path = relpath(TmpOpts.Specie(k).path)
  TmpOpts.Specie(k).Veg = False
  TmpOpts.Specie(k).CantSee = False
  TmpOpts.Specie(k).DisableMovementSysvars = False
  TmpOpts.Specie(k).DisableDNA = False
  TmpOpts.Specie(k).CantReproduce = False
  TmpOpts.Specie(k).VirusImmune = False
    
  TmpOpts.Specie(k).color = (65536 * Rnd(255)) + (256 * Rnd(255)) + Rnd(255)
  
  SetDefaultMutationRates TmpOpts.Specie(k).Mutables
  
  TmpOpts.Specie(k).Mutables.Mutations = True
  TmpOpts.Specie(k).qty = 5
  TmpOpts.Specie(k).Stnrg = 3000
  TmpOpts.Specie(k).Native = True
  
  AssignSkin k
  ShowSkin k
  

End Sub

Sub duplitem(b As Integer, a As Integer)
  Dim t As Integer
  
  TmpOpts.Specie(a).Posrg = TmpOpts.Specie(b).Posrg
  TmpOpts.Specie(a).Posdn = TmpOpts.Specie(b).Posdn
  TmpOpts.Specie(a).Poslf = TmpOpts.Specie(b).Poslf
  TmpOpts.Specie(a).Postp = TmpOpts.Specie(b).Postp
  TmpOpts.Specie(a).Veg = TmpOpts.Specie(b).Veg
  TmpOpts.Specie(a).Stnrg = TmpOpts.Specie(b).Stnrg
  TmpOpts.Specie(a).qty = TmpOpts.Specie(b).qty
  TmpOpts.Specie(a).Fixed = TmpOpts.Specie(b).Fixed
  TmpOpts.Specie(a).Colind = TmpOpts.Specie(b).Colind
  TmpOpts.Specie(a).CantSee = TmpOpts.Specie(b).CantSee
  TmpOpts.Specie(a).DisableMovementSysvars = TmpOpts.Specie(b).DisableMovementSysvars
  TmpOpts.Specie(a).DisableDNA = TmpOpts.Specie(b).DisableDNA
  TmpOpts.Specie(a).CantReproduce = TmpOpts.Specie(b).CantReproduce
  TmpOpts.Specie(a).VirusImmune = TmpOpts.Specie(b).VirusImmune
  TmpOpts.Specie(a).Mutables = TmpOpts.Specie(b).Mutables
  TmpOpts.Specie(a).Native = TmpOpts.Specie(b).Native
End Sub

Private Sub ExtractComment(path As String, k As Integer)
  On Error GoTo fine
  Dim commend As Boolean
  Dim a As String
  path = stringops.respath(path)
  TmpOpts.Specie(k).Comment = ""
  Open path For Input As 1
    While Not EOF(1) And Not commend
      Line Input #1, a
      'Debug.Print a
      If Left(a, 1) = "'" Or Left(a, 1) = "/" Then
        TmpOpts.Specie(k).Comment = TmpOpts.Specie(k).Comment + Mid(a, 2) + vbCrLf
      Else
        commend = True
      End If
    Wend
  Close 1
  Exit Sub
fine:
  TmpOpts.Specie(k).Comment = "ATTENTION!  NOT A VALID BOT FILE."
End Sub

Private Sub SkinChange_Click()
  If SpecList.ListIndex >= 0 Then
    AssignSkin SpecList.ListIndex
    ShowSkin SpecList.ListIndex
  End If
End Sub

Private Sub ShowSkin(k As Integer)
  Dim t As Integer
  Dim X As Long
  Dim Y As Long
  X = Cerchio.Left + Cerchio.Width / 2
  Y = Cerchio.Top + Cerchio.Height / 2
  multx = Cerchio.Width / 120
  multy = Cerchio.Height / 120
  Me.AutoRedraw = True
  Line7.x1 = TmpOpts.Specie(k).Skin(0) * multx * Cos(TmpOpts.Specie(k).Skin(1) / 100) + X
  Line7.y1 = TmpOpts.Specie(k).Skin(0) * multy * Sin(TmpOpts.Specie(k).Skin(1) / 100) + Y
  Line7.x2 = TmpOpts.Specie(k).Skin(2) * multx * Cos(TmpOpts.Specie(k).Skin(3) / 100) + X
  Line7.y2 = TmpOpts.Specie(k).Skin(2) * multy * Sin(TmpOpts.Specie(k).Skin(3) / 100) + Y
  Line8.x1 = Line7.x2
  Line8.y1 = Line7.y2
  Line8.x2 = TmpOpts.Specie(k).Skin(4) * multx * Cos(TmpOpts.Specie(k).Skin(5) / 100) + X
  Line8.y2 = TmpOpts.Specie(k).Skin(4) * multy * Sin(TmpOpts.Specie(k).Skin(5) / 100) + Y
  Line9.x1 = Line8.x2
  Line9.y1 = Line8.y2
  Line9.x2 = TmpOpts.Specie(k).Skin(6) * multx * Cos(TmpOpts.Specie(k).Skin(7) / 100) + X
  Line9.y2 = TmpOpts.Specie(k).Skin(6) * multy * Sin(TmpOpts.Specie(k).Skin(7) / 100) + Y
End Sub

Private Sub ShowSkinO(k As Integer)
  Dim t As Integer
  Dim X As Long
  Dim Y As Long
  X = Shape2.Left
  Y = Shape2.Top
  multx = Shape2.Width / 120
  multy = Shape2.Height / 120
  Me.AutoRedraw = True
  Shape3.Left = X + TmpOpts.Specie(k).Skin(t) * multx
  Shape3.Top = Y + TmpOpts.Specie(k).Skin(t + 1) * multy
  Shape3.Width = TmpOpts.Specie(k).Skin(t + 2) * multx
  Shape3.Height = TmpOpts.Specie(k).Skin(t + 3) * multy
  'Shape4.Left = x + specie(k).Skin(t + 4) * multx
  'Shape4.Top = Y + specie(k).Skin(t + 5) * multy
  'Shape4.Width = specie(k).Skin(t + 6) * multx
  'Shape4.Height = specie(k).Skin(t + 7) * multy
End Sub

Private Sub AssignSkinO(k As Integer)
  Dim i As Integer
  For i = 0 To 8 Step 4
    TmpOpts.Specie(k).Skin(i) = Random(0, 120)
    TmpOpts.Specie(k).Skin(i + 2) = Random(0, 120 - TmpOpts.Specie(k).Skin(i))
    TmpOpts.Specie(k).Skin(i + 1) = Random(0, 120)
    TmpOpts.Specie(k).Skin(i + 3) = Random(0, 120 - TmpOpts.Specie(k).Skin(i + 1))
  Next i
End Sub

Private Sub AssignSkin(k As Integer)
  Dim i As Integer
  If k > -1 Then
    For i = 0 To 7 Step 2
      TmpOpts.Specie(k).Skin(i) = Random(0, half)
      TmpOpts.Specie(k).Skin(i + 1) = Random(0, 628)
    Next i
  End If
End Sub

Private Sub MutRatesBut_Click()
  'EricL 4/9/2006 Catches crash when no species is selected
  If optionsform.CurrSpec < 0 Then
   MsgBox ("Please select a species.")
  Else
    MutationsProbability.Show vbModal
  End If
End Sub

Public Sub SwapSpecies(a As Integer, b As Integer)
Dim c As datispecie

  c = TmpOpts.Specie(a)
  TmpOpts.Specie(a) = TmpOpts.Specie(b)
  TmpOpts.Specie(b) = c

End Sub

Public Sub SortSpecies()
Dim i As Integer
Dim j As Integer

  For i = 0 To TmpOpts.SpeciesNum - 2
    For j = i + 1 To TmpOpts.SpeciesNum - 1
      If UCase(TmpOpts.Specie(i).Name) > UCase(TmpOpts.Specie(j).Name) Then
        SwapSpecies i, j
      End If
    Next j
  Next i

End Sub


Public Sub datatolist() 'datatolist
  Dim i As Integer
  SpecList.CLEAR
  
  SortSpecies
  
  For i = 0 To TmpOpts.SpeciesNum - 1
    If TmpOpts.Specie(i).Native Then SpecList.additem (TmpOpts.Specie(i).Name)
    ExtractComment TmpOpts.Specie(i).path + "\" + TmpOpts.Specie(i).Name, i
  Next i
   
End Sub

Private Sub enprop()
  Frame1.Enabled = True
End Sub

Private Sub disprop()
  Frame1.Enabled = False
End Sub

Private Sub IndNum_Click(Index As Integer)
  Dim qty As Integer
  Select Case Index
    Case 0
      qty = 5
    Case 1
      qty = 10
    Case 2
      qty = 15
    Case 3
      qty = 30
    Case 4
      qty = 0
  End Select
  SpecQty.text = qty
End Sub

Private Sub SpecQty_Change()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).qty = val(SpecQty.text)
  End If
End Sub

Private Sub InNrg_Click(Index As Integer)
  Dim qty As Integer
  Select Case Index
    Case 0
      qty = 3000
    Case 1
      qty = 4000
    Case 2
      qty = 5000
    Case 3
      qty = 30000
  End Select
  SpecNrg.text = qty
End Sub

Private Sub SpecNrg_Change()
  If CurrSpec >= 0 Then TmpOpts.Specie(CurrSpec).Stnrg = val(SpecNrg.text) Mod 32000
End Sub

Private Sub SpecVeg_Click()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).Veg = False
    If SpecVeg.value = 1 Then TmpOpts.Specie(CurrSpec).Veg = True
  End If
End Sub

Private Sub BlockSpec_Click()
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).Fixed = False
    If BlockSpec.value = 1 Then TmpOpts.Specie(CurrSpec).Fixed = True
  End If
End Sub

Private Sub SpecCol_click()
  Dim c As String
  Dim r As Single
  Dim g As Single
  Dim b As Single
  Dim k As Integer
  Dim col As Long
  
  c = SpecCol.text
  k = CurrSpec
  If speclistchecked Then GoTo bypass
  Select Case c
    Case "Red"
      r = 200
      g = 60
      b = 60
    Case "Blue"
      r = 60
      g = 60
      b = 200
    Case "Green"
      r = 60
      g = 200
      b = 60
    Case "Yellow"
      r = 220
      g = 220
      b = 60
    Case "Pink"
      r = 210
      g = 160
      b = 210
    Case "Brown"
      r = 140
      g = 110
      b = 70
    Case "Purple"
      r = 150
      g = 56
      b = 180
    Case "Orange"
      r = 220
      g = 150 ' EricL
      b = 60
    Case "Cyan"
      r = 58
      g = 207
      b = 228
    Case "Random"
      r = Rnd(255)
      g = Rnd(255)
      b = Rnd(255)
    Case "Custom"
      col = TmpOpts.Specie(k).color
      MakeColor col
      If ColorForm.SelectColor Then
        TmpOpts.Specie(k).color = ColorForm.color
      Else
        TmpOpts.Specie(k).color = ColorForm.OldColor
      End If
      TmpOpts.Specie(k).Colind = SpecCol.ListIndex
      GoTo bypass
  End Select
  TmpOpts.Specie(k).color = (65536 * b) + (256 * g) + r
  TmpOpts.Specie(k).Colind = SpecCol.ListIndex
bypass:
  Cerchio.FillColor = TmpOpts.Specie(k).color
  Cerchio.BorderColor = TmpOpts.Specie(k).color
  Line7.BorderColor = TmpOpts.Specie(k).color
  Line8.BorderColor = TmpOpts.Specie(k).color
  Line9.BorderColor = TmpOpts.Specie(k).color
End Sub
Private Sub MakeColor(col As Long)
  ColorForm.color = col
  ColorForm.SelectColor = False
  ColorForm.Show vbModal
End Sub

''''''''''''''''''''''''''''''''''''
' Position control '''''''''''''''''
''''''''''''''''''''''''''''''''''''
'=========================== Sample controls ===========================
'To drag a control, simply call the DragBegin function with
'the control to be dragged
'=======================================================================

Private Sub PosReset_Click()
  DragEnd
  
  Initial_Position.Left = 0
  Initial_Position.Top = 0
  
  Initial_Position.Width = IPB.Width
  Initial_Position.Height = IPB.Height
  
  'EricL Hitting the reset button is sufficient to set the bots starting position
  'without having to click on the Initial Position control
  'These are percentages of the field width and height
  If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).Posrg = 1
    TmpOpts.Specie(CurrSpec).Posdn = 1
    TmpOpts.Specie(CurrSpec).Poslf = 0
    TmpOpts.Specie(CurrSpec).Postp = 0
  End If

End Sub

Private Sub Initial_Position_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = vbLeftButton Then
    DragBegin Initial_Position
  End If
End Sub

Private Sub IPB_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = vbLeftButton Then
    DragBegin Initial_Position
  End If
End Sub

'========================== Dragging Code ================================

'Initialization -- Do not call more than once
Public Sub DragInit()
    Dim i As Integer, xHandle As Single, yHandle As Single

    'Use black Picture box controls for 8 sizing handles
    'Calculate size of each handle
    xHandle = 8 * Screen.TwipsPerPixelX
    yHandle = 8 * Screen.TwipsPerPixelY
    'Load array of handles until we have 8
    For i = 0 To 7
        If i <> 0 Then
            Load picHandle(i)
        End If
        picHandle(i).Width = xHandle
        picHandle(i).Height = yHandle
        'Must be in front of other controls
        picHandle(i).ZOrder
    Next i
    
    For i = 0 To 3
      If i <> 0 Then
          Load RobPlacLine(i)
          RobPlacLine(i) = RobPlacLine(0)
      End If
      'Must be in front of other controls
      RobPlacLine(i).ZOrder
    Next i
    'Set mousepointers for each sizing handle
    picHandle(0).MousePointer = vbSizeNWSE
    picHandle(2).MousePointer = vbSizeNESW
    picHandle(4).MousePointer = vbSizeNWSE
    picHandle(6).MousePointer = vbSizeNESW
    
    RobPlacLine(0).MousePointer = vbSizeNS
    RobPlacLine(1).MousePointer = vbSizeNS
    
    RobPlacLine(2).MousePointer = vbSizeWE
    RobPlacLine(3).MousePointer = vbSizeWE
    
    'Initialize current control
    Set m_CurrCtl = Nothing
End Sub

'Drags the specified control
Public Sub DragBegin(ctl As Control)
    Dim rc As RECT

    'Hide any visible handles
    ShowHandles False
    
    'Save reference to control being dragged
    Set m_CurrCtl = ctl
    
    'Store initial mouse position
    GetCursorPos m_DragPoint
    
    'Save control position (in screen coordinates)
    'Note: control might not have a window handle
    m_DragRect.SetRectToCtrl m_CurrCtl, IPB, Frame1, SSTab1
    m_DragRect.TwipsToScreen m_CurrCtl
    
    'Make initial mouse position relative to control
    m_DragPoint.X = m_DragPoint.X - m_DragRect.Left
    m_DragPoint.Y = m_DragPoint.Y - m_DragRect.Top
    
    'Force redraw of form without sizing handles
    'before drawing dragging rectangle
    Refresh
    
    'Show dragging rectangle
    DrawDragRect
    
    'Indicate dragging under way
    m_DragState = StateDragging
    
    'In order to detect mouse movement over any part of the form,
    'we set the mouse capture to the form and will process mouse
    'movement from the applicable form events
    ReleaseCapture  'This appears needed before calling SetCapture
    SetCapture hwnd
    
    'Limit cursor movement within form
    GetWindowRect hwnd, rc
    ClipCursor rc
End Sub

'Clears any current drag mode and hides sizing handles
Public Sub DragEnd()
    Set m_CurrCtl = Nothing
    ShowHandles False
    m_DragState = StateNothing
End Sub

'To handle all mouse message anywhere on the form, we set the mouse
'capture to the form. Mouse movement is processed here
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim nWidth As Single, nHeight As Single
    Dim pt As POINTAPI

    If m_DragState = StateDragging Then
        'Save dimensions before modifying rectangle
        nWidth = m_DragRect.Right - m_DragRect.Left
        nHeight = m_DragRect.Bottom - m_DragRect.Top
        'Get current mouse position in screen coordinates
        GetCursorPos pt
        'Hide existing rectangle
        DrawDragRect
        'Update drag rectangle coordinates
        m_DragRect.Left = pt.X - m_DragPoint.X
        m_DragRect.Top = pt.Y - m_DragPoint.Y
        m_DragRect.Right = m_DragRect.Left + nWidth
        m_DragRect.Bottom = m_DragRect.Top + nHeight
        'Draw new rectangle
        DrawDragRect
    ElseIf m_DragState = StateSizing Then
        'Get current mouse position in screen coordinates
        GetCursorPos pt
        'Hide existing rectangle
        DrawDragRect
        'Action depends on handle being dragged
        Select Case m_DragHandle
            Case 0
                m_DragRect.Left = pt.X
                m_DragRect.Top = pt.Y
            Case 2
                m_DragRect.Right = pt.X
                m_DragRect.Top = pt.Y
            Case 4
                m_DragRect.Right = pt.X
                m_DragRect.Bottom = pt.Y
            Case 6
                m_DragRect.Left = pt.X
                m_DragRect.Bottom = pt.Y
            Case 9
                m_DragRect.Top = pt.Y
            Case 10
                m_DragRect.Bottom = pt.Y
            Case 11
                m_DragRect.Left = pt.X
            Case 12
                m_DragRect.Right = pt.X
        End Select
        'Draw new rectangle
        DrawDragRect
    End If
End Sub

'To handle all mouse message anywhere on the form, we set the mouse
'capture to the form. Mouse up is processed here
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then
        If m_DragState = StateDragging Or m_DragState = StateSizing Then
            'Hide drag rectangle
            DrawDragRect
            'Move control to new location
            m_DragRect.ScreenToTwips m_CurrCtl
            m_DragRect.SetCtrlToRect m_CurrCtl, IPB, Frame1, SSTab1
            'Restore sizing handles
            ShowHandles True
            'Free mouse movement
            ClipCursor ByVal 0&
            'Release mouse capture
            ReleaseCapture
            'Reset drag state
            m_DragState = StateNothing
            
            Dim w As Long, h As Long
    
            w = IPB.Width
            h = IPB.Height
    
            TmpOpts.Specie(CurrSpec).Posrg = (Initial_Position.Left + Initial_Position.Width) / w
            TmpOpts.Specie(CurrSpec).Posdn = (Initial_Position.Top + Initial_Position.Height) / h
            TmpOpts.Specie(CurrSpec).Poslf = (Initial_Position.Left) / w
            TmpOpts.Specie(CurrSpec).Postp = (Initial_Position.Top) / h
            
            If (TmpOpts.Specie(CurrSpec).Posrg > 1) Then TmpOpts.Specie(CurrSpec).Posrg = 1
            If (TmpOpts.Specie(CurrSpec).Posrg < 0) Then TmpOpts.Specie(CurrSpec).Posrg = 0
            
            If (TmpOpts.Specie(CurrSpec).Posdn > 1) Then TmpOpts.Specie(CurrSpec).Posdn = 1
            If (TmpOpts.Specie(CurrSpec).Posdn < 0) Then TmpOpts.Specie(CurrSpec).Posdn = 0
            
            If (TmpOpts.Specie(CurrSpec).Poslf > 1) Then TmpOpts.Specie(CurrSpec).Poslf = 1
            If (TmpOpts.Specie(CurrSpec).Poslf < 0) Then TmpOpts.Specie(CurrSpec).Poslf = 0
            
            If (TmpOpts.Specie(CurrSpec).Postp > 1) Then TmpOpts.Specie(CurrSpec).Postp = 1
            If (TmpOpts.Specie(CurrSpec).Postp < 0) Then TmpOpts.Specie(CurrSpec).Postp = 0
        End If
    End If
End Sub

'Process MouseDown over handles
Private Sub picHandle_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim i As Integer
    Dim rc As RECT

    'Handles should only be visible when a control is selected
    If picHandle(Index).Visible = False Then Exit Sub
    
    'NOTE: m_DragPoint not used for sizing
    'Save control position in screen coordinates
    m_DragRect.SetRectToCtrl m_CurrCtl, IPB, Frame1, SSTab1
    m_DragRect.TwipsToScreen m_CurrCtl
    'Track index handle
    m_DragHandle = Index
    'Hide sizing handles
    ShowHandles False
    'We need to force handles to hide themselves before drawing drag rectangle
    Refresh
    'Indicate sizing is under way
    m_DragState = StateSizing
    'Show sizing rectangle
    DrawDragRect
    'In order to detect mouse movement over any part of the form,
    'we set the mouse capture to the form and will process mouse
    'movement from the applicable form events
    SetCapture hwnd
    'Limit cursor movement within form
    GetWindowRect hwnd, rc
    ClipCursor rc
End Sub

Private Sub Robplacline_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim i As Integer
    Dim rc As RECT

    'Handles should only be visible when a control is selected
    If RobPlacLine(Index).Visible = False Then Exit Sub
    
    'NOTE: m_DragPoint not used for sizing
    'Save control position in screen coordinates
    m_DragRect.SetRectToCtrl m_CurrCtl, IPB, Frame1, SSTab1
    m_DragRect.TwipsToScreen m_CurrCtl
    'Track index handle
    m_DragHandle = Index + 9
    'Hide sizing handles
    ShowHandles False
    'We need to force handles to hide themselves before drawing drag rectangle
    Refresh
    'Indicate sizing is under way
    m_DragState = StateSizing
    'Show sizing rectangle
    DrawDragRect
    'In order to detect mouse movement over any part of the form,
    'we set the mouse capture to the form and will process mouse
    'movement from the applicable form events
    SetCapture hwnd
    'Limit cursor movement within form
    GetWindowRect hwnd, rc
    ClipCursor rc
End Sub

'Display or hide the sizing handles and arrange them for the current rectangld
Private Sub ShowHandles(Optional bShowHandles As Boolean = True)
    Dim i As Integer
    Dim xFudge As Long, yFudge As Long
    
    Dim ShowHandlesBool As Boolean
    
    ShowHandlesBool = True
    
    If bShowHandles And Not m_CurrCtl Is Nothing Then
        With m_DragRect
            If Not (.Width < 250 Or .Height < 250) Then
            
            'Save some calculations in variables for speed
            xFudge = (2 * Screen.TwipsPerPixelX)
            yFudge = (2 * Screen.TwipsPerPixelY)
            
            'Top Left
            picHandle(0).Move (.Left - IPB.Left - Frame1.Left - SSTab1.Left) + xFudge, _
              (.Top - IPB.Top - Frame1.Top) + yFudge - SSTab1.Top
            'Top right
            picHandle(2).Move .Left - IPB.Left - Frame1.Left - SSTab1.Left + .Width - picHandle(0).Width - xFudge, _
              .Top - IPB.Top - Frame1.Top + yFudge - SSTab1.Top
            'Bottom left
            picHandle(6).Move .Left - IPB.Left - Frame1.Left - SSTab1.Left + xFudge, _
              .Top + .Height - picHandle(0).Height - yFudge - IPB.Top - Frame1.Top - SSTab1.Top
            'Bottom right
            picHandle(4).Move (.Left - IPB.Left - Frame1.Left - SSTab1.Left + .Width) - picHandle(0).Width - xFudge, _
              .Top + .Height - picHandle(0).Height - yFudge - IPB.Top - Frame1.Top - SSTab1.Top
            Else
              ShowHandlesBool = False
            End If
              
            RobPlacLine(0).Move .Left - IPB.Left - Frame1.Left - SSTab1.Left, .Top - IPB.Top - Frame1.Top - SSTab1.Top, .Width, 60
            RobPlacLine(1).Move .Left - IPB.Left - Frame1.Left - SSTab1.Left, .Top + .Height - IPB.Top - Frame1.Top - SSTab1.Top - 60, .Width, 60
            
            RobPlacLine(2).Move .Left - IPB.Left - Frame1.Left - SSTab1.Left, .Top - IPB.Top - Frame1.Top - SSTab1.Top, 60, .Height
            RobPlacLine(3).Move .Left + .Width - IPB.Left - Frame1.Left - SSTab1.Left - 60, .Top - IPB.Top - Frame1.Top - SSTab1.Top, 60, .Height
        End With
    End If
    'Show or hide each handle
    picHandle(0).Visible = bShowHandles And ShowHandlesBool
    picHandle(2).Visible = bShowHandles And ShowHandlesBool
    picHandle(6).Visible = bShowHandles And ShowHandlesBool
    picHandle(4).Visible = bShowHandles And ShowHandlesBool
    
    RobPlacLine(0).Visible = bShowHandles
    RobPlacLine(1).Visible = bShowHandles
    RobPlacLine(2).Visible = bShowHandles
    RobPlacLine(3).Visible = bShowHandles
End Sub
'Draw drag rectangle. The API is used for efficiency and also
'because drag rectangle must be drawn on the screen DC in
'order to appear on top of all controls
Private Sub DrawDragRect()
    Dim hPen As Long, hOldPen As Long
    Dim hBrush As Long, hOldBrush As Long
    Dim hScreenDC As Long, nDrawMode As Long

    'Get DC of entire screen in order to
    'draw on top of all controls
    hScreenDC = GetDC(0)
    'Select GDI object
    hPen = CreatePen(PS_SOLID, 2, 0)
    hOldPen = SelectObject(hScreenDC, hPen)
    hBrush = GetStockObject(NULL_BRUSH)
    hOldBrush = SelectObject(hScreenDC, hBrush)
    nDrawMode = SetROP2(hScreenDC, R2_NOT)
    'Draw rectangle
    Rectangle hScreenDC, m_DragRect.Left, m_DragRect.Top, _
        m_DragRect.Right, m_DragRect.Bottom
    'Restore DC
    SetROP2 hScreenDC, nDrawMode
    SelectObject hScreenDC, hOldBrush
    SelectObject hScreenDC, hOldPen
    ReleaseDC 0, hScreenDC
    'Delete GDI objects
    DeleteObject hPen
End Sub


''''''''''''''''''''''''''''''''''''''''''''

'''General Panel'''''''''''''''''''''''''''''

'''''''''''''''''''''''''''''''''''''''''''''

'''''Start dimensions control

Private Sub FieldSizeSlide_Scroll()
  Dim t As Integer
  Dim oldsw As Single, oldsh As Single
  
  TmpOpts.FieldSize = FieldSizeSlide.value
  
  oldsw = TmpOpts.FieldWidth
  oldsh = TmpOpts.FieldHeight
  
  If TmpOpts.FieldSize = 1 Then 'F1 mode
    TmpOpts.FieldWidth = 9327
    TmpOpts.FieldHeight = 6928
  Else
    TmpOpts.FieldWidth = 8000
    TmpOpts.FieldHeight = 6000
    
    If TmpOpts.FieldSize <= 12 Then
      TmpOpts.FieldWidth = TmpOpts.FieldWidth * TmpOpts.FieldSize
      TmpOpts.FieldHeight = TmpOpts.FieldHeight * TmpOpts.FieldSize
    Else ' Field sizes larger than size 12 get big fast...
      TmpOpts.FieldWidth = (TmpOpts.FieldWidth * 12) * (TmpOpts.FieldSize - 12) * 2
      TmpOpts.FieldHeight = (TmpOpts.FieldHeight * 12) * (TmpOpts.FieldSize - 12) * 2
    End If
  End If
  
  FWidthLab.Caption = TmpOpts.FieldWidth
  FHeightLab.Caption = TmpOpts.FieldHeight
End Sub


'''''End Dimensions Control

'''''Start Seeded Random Control

Private Sub UserSeed_Click()
  TmpOpts.UserSeedToggle = UserSeed.value * True
  UserSeedText.Enabled = UserSeed.value * True
End Sub

Private Sub UserSeedText_Change()
  TmpOpts.UserSeedNumber = val(UserSeedText.text)
End Sub

''''''End Seeded Random Control

''''''Start Torroidal, etc.

Private Sub ToroidCheck_Click()
  TopDownCheck.value = ToroidCheck.value
  RightLeftCheck.value = ToroidCheck.value
  TmpOpts.Toroidal = ToroidCheck.value * True
End Sub

Private Sub TopDownCheck_Click()
  TmpOpts.Updnconnected = TopDownCheck.value * True
  If TopDownCheck.value = False Then ToroidCheck.value = False
End Sub

Private Sub RightLeftCheck_Click()
  TmpOpts.Dxsxconnected = RightLeftCheck.value * True
  If RightLeftCheck.value = False Then ToroidCheck.value = False
End Sub

'''''End Torroidal, etc.

''''''Waste Control
Private Sub CustomWaste_Change()
  If val(CustomWaste.text) = 0 Then
    TmpOpts.BadWastelevel = -1
  Else
    TmpOpts.BadWastelevel = val(CustomWaste.text)
  End If
End Sub

Private Sub VirusImmuneCheck_Click()
 If CurrSpec > -1 Then
    TmpOpts.Specie(CurrSpec).VirusImmune = False
    If VirusImmuneCheck.value = 1 Then TmpOpts.Specie(CurrSpec).VirusImmune = True
  End If
End Sub

Private Sub WasteThresholdUpDown_Change()
  'Buddied to CustomWaste, and synchronized,
  'so we don't have to do anything here
End Sub

'''''''End Waste Control

'''''''Start Misc
'Private Sub DisableTiesCheck_Click()
  'TmpOpts.DisableTies = DisableTiesCheck_Click.value * True
'End Sub
'''''''End Misc

'''''''Start Corpse Controls

Private Sub CorpseCheck_Click()
  TmpOpts.CorpseEnabled = CorpseCheck.value * True
  DecayText.Enabled = CorpseCheck.value * True
  DecayUpDn(0).Enabled = CorpseCheck.value * True
  DecayUpDn(1).Enabled = CorpseCheck.value * True
  FrequencyText.Enabled = CorpseCheck.value * True
  DecayOption(0).Enabled = CorpseCheck.value * True
  DecayOption(1).Enabled = CorpseCheck.value * True
  DecayOption(2).Enabled = CorpseCheck.value * True
End Sub

Private Sub DecayOption_Click(Index As Integer)
  TmpOpts.DecayType = Index + 1
End Sub

Private Sub DecayText_Change()
  TmpOpts.Decay = val(DecayText.text)
End Sub

Private Sub FrequencyText_Change()
  TmpOpts.Decaydelay = val(FrequencyText.text)
End Sub

Private Sub DecayUpDn_Change(Index As Integer)
  'Buddied to DecayText amd Frequency Text, so do nothing.
End Sub

'''''End Corpse Controls

'''''Start Veg Controls

'''StartPond Mode
Private Sub Pondcheck_Click()
  TmpOpts.Pondmode = Pondcheck.value * True
  LightText.Enabled = Pondcheck.value * True
  LightUpDn.Enabled = Pondcheck.value * True
  Gradient.Enabled = Pondcheck.value * True
  GradientUpDn.Enabled = Pondcheck.value * True
  GradientLabel.Enabled = Pondcheck.value * True
End Sub

Private Sub LightText_Change()
  TmpOpts.LightIntensity = val(LightText.text)
  'color_lightlines
End Sub

Private Sub LightUpDn_Change()
  'Buddied to LightText, and synchronized, so we don't have to do anything here
End Sub

Private Sub Gradient_Change()
  TmpOpts.Gradient = val(Gradient.text) / 10 + 1
  color_lightlines
End Sub

Private Sub GradientUpDn_Change()
  Dim a As Single
  a = GradientUpDn.value
  Gradient.text = (a / 5)
  TmpOpts.Gradient = a / 5
  'color_lightlines Botsareus 12/12/2012 No need for checking light mods twise
End Sub

Private Sub EnergyScalingFactor_Change()
  'this just controls the little graph to the left of this control,
  'doesn't effect the simulation
  If val(EnergyScalingFactor.text) = 0 Then EnergyScalingFactor.text = "1"
  color_lightlines
End Sub

Private Sub EnergyScalingFactorUpDown_Change()
  'Buddied to EnergyScalingFactor, and synchronized,
  'so we don't have to do anything here
End Sub

Private Sub color_lightlines()
  Dim Index As Integer
  Dim fxn As Single
  Dim depth As Single, depth2 As Single
  Dim greyform As Single
  Dim toplevel As Single
  Dim Gradient As Single
  Dim color As Long
  
  Gradient = TmpOpts.Gradient
  
  depth = 1.1
  If EnergyScalingFactor = 0 Then EnergyScalingFactor = 1
  toplevel = 2 * (val(EnergyScalingFactor.text) / (depth ^ Gradient))
   
  depth = TmpOpts.FieldHeight / 16 / 2000 + 1
  fxn = 2 * (TmpOpts.LightIntensity / (depth ^ Gradient)) / toplevel
  greyform = Convert_PercentageColor(Ceil(fxn, 1))
  greyform = Abs(greyform)
  color = (65536 * Ceil(greyform, 255)) + (256 * Ceil(greyform, 255))
  LightStrata(Index).BorderColor = color
  
  depth = 1
  fxn = 2 * (TmpOpts.LightIntensity / (depth ^ Gradient)) / toplevel
  greyform = Convert_PercentageColor(fxn)
  greyform = Abs(greyform)
  color = (65536 * Ceil(greyform, 255)) + (256 * Ceil(greyform, 255))
  LightStrata(15).BorderColor = color
  
  For Index = 1 To 14
    depth = (Index * TmpOpts.FieldHeight / 16) / 2000 + 1
    depth2 = ((Index + 1) * TmpOpts.FieldHeight / 16 / 2000) + 1
    fxn = 2 * (TmpOpts.LightIntensity / (depth ^ Gradient)) / toplevel
    fxn = fxn + 2 * (TmpOpts.LightIntensity / (depth2 ^ Gradient)) / toplevel
    fxn = Ceil(fxn / 2, 1)
    greyform = Convert_PercentageColor(fxn)
    greyform = Abs(greyform)
    LightStrata(Index).BorderColor = (65536 * greyform) + (256 * greyform)
  Next Index
  Frame17.Visible = False
  Frame17.Visible = True
End Sub

Private Function Convert_PercentageColor(sgl As Single) As Integer
  Dim temp As Single
  
  temp = 255 * sgl
  If temp > 255 Then temp = 255
  
  Convert_PercentageColor = temp
End Function

Private Function Ceil(ByVal a As Single, ByVal b As Single) As Single
  If a > b Then a = b
  Ceil = a
End Function

'''''''''''''''''''''''''''''''''''''''

'''End Pond Mode

'''Start Rest of Veg controls

'''''''''''''''''''''''''''''''''''''''

Private Sub MaxPopText_Change()
  TmpOpts.MaxPopulation = val(MaxPopText.text) Mod 32000
End Sub

Private Sub MaxPopUpDn_Change()
  'Buddied to MaxPopText, and synchronized, so we
  'do nothing
End Sub

Private Sub MinVegText_Change()
  TmpOpts.MinVegs = val(MinVegText.text) Mod 32000
End Sub

Private Sub MinVegUpDn_Change()
  'Buddied to MaxPopText, and synchronized, so we
  'do nothing
End Sub

Private Sub RepopAmountText_Change()
  TmpOpts.RepopAmount = val(RepopAmountText.text) Mod 32000
End Sub

Private Sub RepopAmountUpDown_Change(Index As Integer)
  'Buddied to RepopAmountText, and synchronized, so we
  'do nothing
End Sub

Private Sub RepopCooldownText_Change()
  TmpOpts.RepopCooldown = val(RepopCooldownText.text) Mod 32000
End Sub

Private Sub RepopCooldownUpDown_Change(Index As Integer)
  'Buddied to RepopCooldownText, and synchronized, so we
  'do nothing
End Sub

Private Sub KillDistVegsCheck_Click()
  TmpOpts.KillDistVegs = KillDistVegsCheck.value * True
End Sub

Private Sub MaxNRGText_Change()
  TmpOpts.MaxEnergy = val(MaxNRGText.text) Mod 32000
End Sub

Private Sub VEGNrgType_Click(Index As Integer)
  TmpOpts.VegFeedingMethod = Index
  Select Case Index
    Case 0
      VegNRGTypeText.text = "Favors small veggies and fast reproducing veggies, escpecially cancerous ones."
    Case 1
      VegNRGTypeText.text = "Favors large veggies, discourages small veggies. Veggy nrg is independant of reproduction methods."
    Case 2
      VegNRGTypeText.text = "Favors large, slow reproducing or even sterile veggies. Neutral towards small veggies."
  End Select
End Sub

Private Sub BodyNrgDist_change()
  TmpOpts.VegFeedingToBody = BodyNrgDist.value / 100
End Sub

''''''''''''''''''''''''''''''''''

'''''End Veg Controls and END GENERAL

''''''''''''''''''''''''''''''''''

''''''''''''''''''''''''''''''''''''''''''''

''''Physics Panel'''''''''''''''''''''''''''

''''''''''''''''''''''''''''''''''''''''''''

Private Sub SubstanceOption_Click(Index As Integer)
  Select Case Index
    Case 0 'liquid
      FrictionCombo.Enabled = False
      DragCombo.Enabled = True
    Case 1 'solid
      FrictionCombo.Enabled = True
      DragCombo.Enabled = False
  End Select
End Sub

'needs work
Private Sub DragCombo_Click()
  Select Case DragCombo.text
    Case DragCombo.list(0)
      TmpOpts.Viscosity = 0.01
      TmpOpts.Density = 0.0000001
    Case DragCombo.list(1)
      TmpOpts.Viscosity = 0.0005
      TmpOpts.Density = 0.0000001
    Case DragCombo.list(2)
      TmpOpts.Viscosity = 0.000025
      TmpOpts.Density = 0.0000001
    Case DragCombo.list(3)
      TmpOpts.Viscosity = 0#
      TmpOpts.Density = 0#
  End Select
End Sub

Private Sub EfficiencyCombo_Click()
  Select Case EfficiencyCombo.text
    Case EfficiencyCombo.list(0)
      TmpOpts.PhysMoving = 1
    Case EfficiencyCombo.list(1)
      TmpOpts.PhysMoving = 0.66
    Case EfficiencyCombo.list(2)
      TmpOpts.PhysMoving = 0.33
  End Select
End Sub

Private Sub FrictionCombo_Click()
  Select Case FrictionCombo.text
   Case FrictionCombo.list(0)
    TmpOpts.Zgravity = 4
    TmpOpts.CoefficientStatic = 0.9
    TmpOpts.CoefficientKinetic = 0.75
   Case FrictionCombo.list(1)
    TmpOpts.Zgravity = 2
    TmpOpts.CoefficientStatic = 0.6
    TmpOpts.CoefficientKinetic = 0.4
   Case FrictionCombo.list(2)
    TmpOpts.Zgravity = 1
    TmpOpts.CoefficientStatic = 0.05
    TmpOpts.CoefficientKinetic = 0.05
   Case FrictionCombo.list(3)
    TmpOpts.Zgravity = 0
    TmpOpts.CoefficientStatic = 0#
    TmpOpts.CoefficientKinetic = 0#
  End Select
End Sub

Private Sub GravityCombo_Click()
  Select Case GravityCombo.text
    Case GravityCombo.list(0)
      TmpOpts.Ygravity = 0
    Case GravityCombo.list(1)
      TmpOpts.Ygravity = 0.05
    Case GravityCombo.list(2)
      TmpOpts.Ygravity = 0.2
  End Select
End Sub

Private Sub BrownianCombo_Click()
  Select Case BrownianCombo.text
    Case BrownianCombo.list(0)
      TmpOpts.PhysBrown = 0.5
    Case BrownianCombo.list(1)
      TmpOpts.PhysBrown = 0
  End Select
End Sub


'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


Private Sub AddScript_Click()
  AddNewScript
End Sub


Private Sub RerunCheck_Click()
  Leaguererun = CBool(RerunCheck.value)
End Sub

Private Sub ToPhysics_Click()
  PhysicsOptions.Show vbModal
  Unload PhysicsOptions
End Sub

Private Sub DelScript_click()
  DeleteScript
End Sub

Private Sub Cancel_Click()
  Canc = True
  If Form1.Visible Then Form1.SecTimer.Enabled = True
  'Me.Hide
  Unload Me
End Sub

'
'  All settings
'

Private Sub ContestsText_Change()
  Maxrounds = val(ContestsText.text)
  'ContestsUpDn.value = val(ContestsText.text)
End Sub

Private Sub ContestsUpDn_Change()
  ContestsText.text = ContestsUpDn.value
  Maxrounds = val(ContestsText.text)
End Sub

' sets all conditions to F1 specs
Private Sub F1check_Click()
  If F1Check.value = 1 Then
    TmpOpts.F1 = True
  Else
    TmpOpts.F1 = False
 End If
  
End Sub

'Private Sub Form_Unload(Cancel As Integer) 'unload
'  Form1.Timer2.Enabled = True
'End Sub

Private Sub Form_Activate()
 ' Form1.SecTimer.Enabled = False
 ' TmpOpts = SimOpts
 ' Dim i As Long
    
 ' SpecList.CLEAR
 ' For i = 0 To TmpOpts.SpeciesNum - 1
 '   SpecList.additem (TmpOpts.Specie(i).Name)
 ' Next i
  
'  DispSettings

'Botsareus 12/12/2012 Hide always on top forms for easy readability
datirob.Visible = False
ActivForm.Visible = False

End Sub

Private Sub Form_Load()
Dim i As Integer
  SpeciesToggle = False
  Form1.SecTimer.Enabled = False
  TmpOpts = SimOpts
  CurrSpec = -1 ' EricL 4/1/2006 Initialize that no species is selected
 ' TmpOpts = SimOpts
  DragInit    'Initialize drag code
  strings Me
  
 ' SpecList.CLEAR
 ' For i = 0 To TmpOpts.SpeciesNum - 1
 '   SpecList.additem (TmpOpts.Specie(i).Name)
 ' Next i
 
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
  If TmpOpts.FieldWidth = 0 Then TmpOpts.FieldWidth = 16000
  If TmpOpts.FieldHeight = 0 Then TmpOpts.FieldHeight = 12000
  datatolist
  DispSettings
End Sub

'Private Sub FrequencyCheckText_Change()
'  SampFreq = val(FrequencyCheckText.text)
'End Sub

'Private Sub FrequencyCheckUpDn_Change()
'  FrequencyCheckText = FrequencyCheckUpDn.value
'End Sub

Private Sub Gradient_lostfocus()
  On Error Resume Next
  If val(Gradient.text) > 20 Then Gradient.text = "20"
  TmpOpts.Gradient = val(Gradient.text)
  GradientUpDn.value = val(Gradient.text) * 5
End Sub

Private Sub LeagueCheck_Click()
  If LeagueCheck.value = 1 Then
    If F1Check.value <> 1 Then
      F1Check.value = 1
      F1check_Click
    End If
    LeagueMode = True
    TmpOpts.League = True
    
    If Leaguetype(0).value = False Then
      Leaguetype(0).value = True
    End If
  
  Else
    TmpOpts.League = False
    LeagueMode = False
    'Leaguetype(0).value = False
  End If
End Sub

Private Sub LeagueAutoCheck()
  If LeagueCheck.value <> 1 Then
    LeagueCheck.value = 1
    LeagueCheck_Click
  End If
End Sub

Private Sub LeagueF1Option_Click()
  LeaguenameControl.text = "F1"
  LeagueAutoCheck
End Sub

Private Sub LeagueF2Option_Click()
  LeaguenameControl.text = "F2"
  LeagueAutoCheck
End Sub

Private Sub LeageSBOption_Click()
  LeaguenameControl.text = "Shortbot"
  LeagueAutoCheck
End Sub

Private Sub LeagueMBOption_Click()
  LeaguenameControl.text = "Multibot"
  LeagueAutoCheck
End Sub

Private Sub Leaguetype_Click(Index As Integer)
  'If Leaguetype(Index).value = False Then
  ''  Leaguetype(Index).value = True
  'End If
End Sub

Private Sub LightText_lostfocus()
  Dim a As Single
  a = val(LightText.text)
  If a < LightUpDn.Min Then a = LightUpDn.Min
  If a > LightUpDn.Max Then a = LightUpDn.Max
  LightUpDn.value = a
  TmpOpts.LightIntensity = a
End Sub

Private Sub OKButton_Click()
  Dim i As Integer
  Dim k As Integer
  Dim a As Integer
  Dim fso As FileSystemObject
  Set fso = New FileSystemObject
  
  DragEnd
  
  Contests = 0
  ReStarts = 0
  MDIForm1.Combo1.CLEAR
  MDIForm1.Combo1.additem WSnone
  
  For i = 0 To TmpOpts.SpeciesNum - 1
    If i > MAXNATIVESPECIES Then
      MsgBox "Exceeded number of native species."
    Else
      If TmpOpts.Specie(i).Native Then MDIForm1.Combo1.additem TmpOpts.Specie(i).Name
    End If
  Next i
    
  If TmpOpts.F1 Then
    a = MsgBox("You cannot change settings in the middle of a contest. Please restart the SIM or disable F1 mode if you wish to continue.", vbOKOnly)
    Exit Sub
  End If
  
  If Not (fso.FolderExists(inboundPathText.text) And fso.FolderExists(outboundPathText.text)) Then
    MsgBox ("Internet paths must be set to a vaild directory.")
    Exit Sub
  End If
  
  Canc = False
  
  ' EricL 4/2/2006 - moved these here from control change routine to fix init bugs
  TmpOpts.AutoSimTime = val(AutoSimTxt.text)
  TmpOpts.AutoRobTime = val(AutoRobTxt.text)
  TmpOpts.AutoSimPath = AutoSimPath.text
  TmpOpts.AutoRobPath = AutoRobPath.text
  TmpOpts.chartingInterval = val(ChartInterval.text)
  TmpOpts.Restart = RestartMode ' EricL 4/2/2006 Added this to pick up any changes to restart mode
 
  IntOpts.IName = Trim(IntName.text)
  IntOpts.InboundPath = inboundPathText.text
  IntOpts.OutboundPath = outboundPathText.text
  SaveInternetSett
  
  'These change values while a sim is running.
  'Copy them so the correct value will be put back into SimOpts
  TmpOpts.TotRunCycle = SimOpts.TotRunCycle
  TmpOpts.TotBorn = SimOpts.TotBorn
  TmpOpts.TotRunTime = SimOpts.TotRunTime
  TmpOpts.DayNightCycleCounter = SimOpts.DayNightCycleCounter
  TmpOpts.Daytime = SimOpts.Daytime
  If TmpOpts.DayNight = False Then TmpOpts.Daytime = True
  
  
  SimOpts = TmpOpts
  
  If InternetMode Then ResizeInternetTeleporter (SimOpts.FieldHeight / 150)
  
  Form1.ScaleWidth = SimOpts.FieldWidth
  Form1.ScaleHeight = SimOpts.FieldHeight
  Form1.visiblew = SimOpts.FieldWidth
  Form1.visibleh = SimOpts.FieldHeight
  Form1.xDivisor = 1
  Form1.yDivisor = 1
  If SimOpts.FieldWidth > 32000 Then Form1.xDivisor = SimOpts.FieldWidth / 32000
  If SimOpts.FieldHeight > 32000 Then Form1.yDivisor = SimOpts.FieldHeight / 32000
  Form1.SecTimer.Enabled = True
  Form1.Active = True
  'Me.Hide
  Unload Me
End Sub

Private Sub RestartSimCheck_Click()
  If RestartSimCheck = 1 Then
    RestartMode = True
  Else
    RestartMode = False
  End If
End Sub

Public Sub StartNew_Click() 'startnew
  Dim i As Integer
  Dim k As Integer
  Dim t As Integer
  
  DragEnd
  
  If Form1.Visible Then
    If MsgBox("Are you sure?", vbYesNo, "About to start a new simulation") = vbNo Then
        Exit Sub
    End If
  End If
  
  Contests = 0
  ReStarts = 0
  
  ' EricL Moved here from StartSimul() so that cycles counter isn't reset when sim settings
  ' are changed.  Only reset when a new simulation is started.
  TmpOpts.TotRunCycle = -1
  
  MDIForm1.visualize = True
  Form1.Label1.Visible = False
  
  If optionsform.LeaguenameControl.text = "" And LeagueMode Then
    MsgBox "No league name.  League must have a name.", vbOKOnly, "League Name Needed"
    Exit Sub
  Else
    Leaguename = optionsform.LeaguenameControl.text
  End If
  
  CloseDatabase
  MDIForm1.Combo1.CLEAR
  MDIForm1.Combo1.additem WSnone
  
  For i = 0 To TmpOpts.SpeciesNum - 1
    If i > MAXNATIVESPECIES Then
      MsgBox "Exceeded number of native species."
    Else
      If TmpOpts.Specie(i).Native Then MDIForm1.Combo1.additem TmpOpts.Specie(i).Name
    End If
  Next i
  
  If TmpOpts.F1 = True Then
    
    'Zero out all Costs
    For t = 1 To 70
      TmpOpts.Costs(t) = 0
    Next t
    
    'Now set the ones that matter
    TmpOpts.Costs(SHOTCOST) = 2
    TmpOpts.Costs(COSTSTORE) = 0.04
    TmpOpts.Costs(CONDCOST) = 0.004
    TmpOpts.Costs(MOVECOST) = 0.05
    TmpOpts.Costs(TIECOST) = 2
    TmpOpts.Costs(SHOTCOST) = 2
    TmpOpts.Costs(VENOMCOST) = 0.01
    TmpOpts.Costs(POISONCOST) = 0.01
    TmpOpts.Costs(SLIMECOST) = 0.1
    TmpOpts.Costs(SHELLCOST) = 0.1
    TmpOpts.Costs(COSTMULTIPLIER) = 1
    TmpOpts.Costs(BODYUPKEEP) = 0.00001
    TmpOpts.Costs(AGECOST) = 0.01
    TmpOpts.DynamicCosts = False
    
    TmpOpts.CorpseEnabled = False    ' No Corpses
    TmpOpts.DayNight = False         ' Sun never sets
    TmpOpts.FieldWidth = 9237
    TmpOpts.FieldHeight = 6928
    TmpOpts.FieldSize = 1
    TmpOpts.MaxEnergy = 40           ' Veggy nrg per cycle
    TmpOpts.MaxPopulation = 25       ' Veggy max population
    TmpOpts.MinVegs = 10
    TmpOpts.Pondmode = False
    TmpOpts.PhysBrown = 0         ' Animal Motion
    TmpOpts.Toroidal = True
    TmpOpts.Updnconnected = True
    TmpOpts.Dxsxconnected = True
   
    TmpOpts.BadWastelevel = 10000          ' Pretty high Waste Threshold
    
    For t = 0 To TmpOpts.SpeciesNum - 1
      TmpOpts.Specie(t).Fixed = False                 'Nobody is fixed
      TmpOpts.Specie(t).Mutables.Mutations = False    'Nobody can mutate
      TmpOpts.Specie(t).CantSee = False
      TmpOpts.Specie(t).DisableDNA = False
      TmpOpts.Specie(t).CantReproduce = False
      TmpOpts.Specie(t).DisableMovementSysvars = False
      TmpOpts.Specie(t).VirusImmune = False
      TmpOpts.Specie(t).qty = 5
      TmpOpts.Specie(t).Veg = False
      TmpOpts.Specie(t).Native = True
    Next t
    
    TmpOpts.Specie(0).Veg = True         'Force the first entry to be a veggy
    TmpOpts.Specie(0).qty = 10           ' Do this so that eye fudge works
        
    TmpOpts.FixedBotRadii = False
    TmpOpts.NoShotDecay = False
    TmpOpts.DisableTies = False
    TmpOpts.RepopAmount = 10
    TmpOpts.RepopCooldown = 1
    TmpOpts.MaxVelocity = 180
    TmpOpts.VegFeedingMethod = 0         ' Straight nrg /cycle feeding method
    TmpOpts.VegFeedingToBody = 0.5       ' 50/50 nrg/body veggy feeding ratio
    TmpOpts.SunUp = False                ' Turn off bringing the sun up due to a threshold
    TmpOpts.SunDown = False              ' Turn off setting the sun due to a threshold
    TmpOpts.CoefficientElasticity = 0    ' Collisions are soft.
    TmpOpts.Ygravity = 0
        
    ' Surface Friction - Metal Option
    TmpOpts.Zgravity = 2
    TmpOpts.CoefficientStatic = 0.6
    TmpOpts.CoefficientKinetic = 0.4
    
    'No Fluid Resistance
    TmpOpts.Viscosity = 0#
    TmpOpts.Density = 0#
    
    'Shot Energy Physics
    TmpOpts.EnergyProp = 1        ' 100% normal shot nrg
    TmpOpts.EnergyExType = True   ' Use Proportional shot nrg exchange method
    
   ' DispSettings
  End If
  
  For t = 0 To TmpOpts.SpeciesNum - 1
    TmpOpts.Specie(t).population = TmpOpts.Specie(t).qty
    TmpOpts.Specie(t).SubSpeciesCounter = 0
    TmpOpts.Specie(t).Native = True
  '  If TmpOpts.Specie(t).Name = "plant.txt" Then
  '    TmpOpts.Specie(t).DisplayImage.Picture = Form1.Plant.Picture
      
  '  End If
  Next t
  
  ContestMode = TmpOpts.F1
  MDIForm1.F1Piccy.Visible = TmpOpts.F1 * True
  TmpOpts.Restart = RestartMode ' EricL 4/2/2006 This was backwards.  Changed from RestartMode = TmpOpts.Restart
  
  ' EricL 4/2/2006 - moved these here from control's change routine to fix init bugs
  TmpOpts.AutoSimTime = val(AutoSimTxt.text)
  TmpOpts.AutoRobTime = val(AutoRobTxt.text)
  TmpOpts.AutoSimPath = AutoSimPath.text
  TmpOpts.AutoRobPath = AutoRobPath.text
  TmpOpts.chartingInterval = val(ChartInterval.text)
  
  TmpOpts.SpeciesNum = SpecList.ListCount
  Canc = False
  IntOpts.IName = IntName.text
  IntOpts.InboundPath = inboundPathText.text
  IntOpts.OutboundPath = outboundPathText.text
  SaveInternetSett
  'Me.Hide
  Unload Me
   
  If LeagueMode = True Then LeagueForm.Visible = True ' EricL 3/20/2006 Have to bring up league form after Options dialog goes away
  
  'Form1.Active = True
  
    'this just tricks the program into thinking we have enough
  'species for F1 mode.
  'If TmpOpts.League = True And TmpOpts.SpeciesNum = 2 Then
  '  additem TmpOpts.Specie(1).Name
  '  TmpOpts.SpeciesNum = TmpOpts.SpeciesNum + 1
  'End If
  
  SimOpts = TmpOpts
  
  If SimOpts.League = True Then
    LeagueMode = True 'should be anyway, but sometimes when
                      'restarting a league it screws up
    LeagueInputChallengers
    SetupLeague_Options
  '  SimOpts.F1 = True
    LeagueForm.F1ChallengeOption_Click
  End If
  
  
  If Form1.Active Then Form1.SecTimer.Enabled = True
  If InternetMode Then MDIForm1.F1Internet_Click
  
  
  StartAnotherRound = True ' Set true for first simulation.  Will get set true if running leagues or using auto-restart mode
  While StartAnotherRound
    StartAnotherRound = False
    Form1.StartSimul
  Wend
End Sub

Private Sub DispSettings()
  Dim t As Integer
  
  PauseButton.Caption = IIf(Form1.Active, "Unpaused", "Paused")
  
 
  FieldSizeSlide.value = TmpOpts.FieldSize
  MaxPopText.text = TmpOpts.MaxPopulation
  MinVegText.text = TmpOpts.MinVegs
  RepopAmountText.text = TmpOpts.RepopAmount
  RepopCooldownText.text = TmpOpts.RepopCooldown
  DecayText.text = TmpOpts.Decay
  LightText.text = TmpOpts.LightIntensity
  Gradient.text = TmpOpts.Gradient
'  DNLength.text = TmpOpts.CycleLength
  UserSeedText.text = TmpOpts.UserSeedNumber
  FrequencyText.text = TmpOpts.Decaydelay
  VEGNrgType(TmpOpts.VegFeedingMethod).value = True
  
  FWidthLab.Caption = TmpOpts.FieldWidth
  FHeightLab.Caption = TmpOpts.FieldHeight
  
  'DisableTiesCheck.value = TmpOpts.DisableTies * True
  ToroidCheck.value = TmpOpts.Toroidal * True
  TopDownCheck.value = TmpOpts.Updnconnected * True
  RightLeftCheck.value = TmpOpts.Dxsxconnected * True
  
  Pondcheck.value = TmpOpts.Pondmode * True
  Gradient.Enabled = TmpOpts.Pondmode * True
  LightText.Enabled = TmpOpts.Pondmode * True
  LightUpDn.Enabled = TmpOpts.Pondmode * True
  GradientUpDn.Enabled = TmpOpts.Pondmode * True
  
  CorpseCheck.value = TmpOpts.CorpseEnabled * True
  DecayText.Enabled = TmpOpts.CorpseEnabled * True
  DecayUpDn(0).Enabled = TmpOpts.CorpseEnabled * True
  DecayUpDn(1).Enabled = TmpOpts.CorpseEnabled * True
  
  'EricL 4/11/2006 Added these to initialize the control
  DecayOption(0).Enabled = TmpOpts.CorpseEnabled * True
  DecayOption(1).Enabled = TmpOpts.CorpseEnabled * True
  DecayOption(2).Enabled = TmpOpts.CorpseEnabled * True
  DecayOption(0).value = False
  DecayOption(1).value = False
  DecayOption(2).value = False
  
  'EricL 4/11/2006 Don't ask me why, but historically, DecayType was stored as DecayOption Index +1
  'So this IF statement is here to gaurd against the case where DecayType has never been set and has value 0 by default.
  If (TmpOpts.DecayType > 0) Then
   DecayOption(TmpOpts.DecayType - 1) = True
  Else
    DecayOption(0) = True
  End If
    
 ' DNLength.Enabled = TmpOpts.DayNight * True
'  DNCycleUpDn.Enabled = TmpOpts.DayNight * True
'  DNCheck.value = TmpOpts.DayNight * True
  
  UserSeed.value = TmpOpts.UserSeedToggle * True
  UserSeedText.Enabled = TmpOpts.UserSeedToggle * True
  
  FrequencyText.text = TmpOpts.Decaydelay
  
  Prop.text = Str(TmpOpts.EnergyProp * 100)
  Fixed.text = (TmpOpts.EnergyFix)
  FixUpDn.value = TmpOpts.EnergyFix
  ExchangeProp.value = TmpOpts.EnergyExType
  ExchangeFix.value = Not TmpOpts.EnergyExType
  
  'AutoSimPath As String
  AutoSimPath.text = TmpOpts.AutoSimPath
  'AutoSimTime As Integer
  AutoSimTxt.text = (TmpOpts.AutoSimTime)
  AutoSimUpDn.value = TmpOpts.AutoSimTime
  'AutoRobPath As String
  AutoRobPath.text = TmpOpts.AutoRobPath
  'AutoRobTime As Integer
  AutoRobTxt.text = (TmpOpts.AutoRobTime)
  AutoRobUpDn.value = TmpOpts.AutoRobTime
  
  StripMutationsCheck.value = TmpOpts.AutoSaveStripMutations * True
  DeleteOldFiles.value = TmpOpts.AutoSaveDeleteOlderFiles * True
  DeleteOldBotFilesCheck.value = TmpOpts.AutoSaveDeleteOldBotFiles * True
    
  'MutCurrMult As Single
  If TmpOpts.MutCurrMult <= 0 Then TmpOpts.MutCurrMult = 1
  MutSlide.value = Log(TmpOpts.MutCurrMult) / Log(2)
 
  If TmpOpts.MutCurrMult > 1 Then
    MutLab.Caption = CStr(TmpOpts.MutCurrMult) + " X"
  Else
    MutLab.Caption = "1/" + Str(2 ^ -MutSlide.value) + " X"
  End If
   
  'MutOscill As Boolean
  MutOscill.value = TmpOpts.MutOscill * True
  DisableMutationsCheck.value = TmpOpts.DisableMutations * True
  
  'MutCycMax As Long
  CyclesHi.text = TmpOpts.MutCycMax
  CyclesLo.text = TmpOpts.MutCycMin
  'MutCycMin As Long
  '
  'DBName As String
  DBName.text = TmpOpts.DBName
  DBEnable.value = TmpOpts.DBEnable * True
  DBExcludeVegs.value = TmpOpts.DBExcludeVegs * True
  
  IntName.text = IntOpts.IName
  inboundPathText.text = IntOpts.InboundPath
  outboundPathText.text = IntOpts.OutboundPath
  If inboundPathText.text = "" Then inboundPathText.text = MDIForm1.MainDir + "\IM\inbound"
  If outboundPathText.text = "" Then outboundPathText.text = MDIForm1.MainDir + "\IM\outbound"
  
  MaxNRGText.text = TmpOpts.MaxEnergy
    
  'display F1 page settings
  ContestMode = TmpOpts.F1
  F1Check.value = ContestMode * True
  RestartMode = TmpOpts.Restart
  RestartSimCheck.value = RestartMode * True
  
    
  If Maxrounds = 0 Then
    ContestsUpDn.value = 5
  Else
    ContestsUpDn.value = Maxrounds
  End If
  ContestsText.text = Maxrounds
    
  'If SampFreq = 0 Then
  '  FrequencyCheckUpDn.value = 10
  '  SampFreq = 10
  'Else
  '  FrequencyCheckUpDn.value = SampFreq
  'End If
  
  'FrequencyCheckText.text = SampFreq
  SampFreq = 10
  
  If TmpOpts.Ygravity >= 0.2 Then
    GravityCombo.text = GravityCombo.list(2)
  ElseIf TmpOpts.Ygravity >= 0.05 Then
    GravityCombo.text = GravityCombo.list(1)
  Else
    GravityCombo.text = GravityCombo.list(0)
  End If
  
  'EricL 5/7/2006 Initialize new UI
  FluidSolidRadio(TmpOpts.FluidSolidCustom).value = True
  CostRadio(TmpOpts.CostRadioSetting).value = True

    
  If TmpOpts.CoefficientKinetic = 0.75 And _
    TmpOpts.CoefficientStatic = 0.9 And _
    TmpOpts.Zgravity = 4 Then
    FrictionCombo.text = FrictionCombo.list(0)
  ElseIf TmpOpts.CoefficientKinetic = 0.4 And _
    TmpOpts.CoefficientStatic = 0.6 And _
    TmpOpts.Zgravity = 2 Then
    FrictionCombo.text = FrictionCombo.list(1)
  ElseIf TmpOpts.CoefficientStatic = 0.05 And _
    TmpOpts.CoefficientKinetic = 0.05 And _
    TmpOpts.Zgravity = 1 Then
    FrictionCombo.text = FrictionCombo.list(2)
  ElseIf TmpOpts.CoefficientStatic = 0# And _
    TmpOpts.CoefficientKinetic = 0# And _
    TmpOpts.Zgravity = 0 Then
    FrictionCombo.text = FrictionCombo.list(3)
  Else
    FrictionCombo.text = "Custom"
  End If
  

  If TmpOpts.PhysBrown >= 0.5 Then
    BrownianCombo.text = BrownianCombo.list(0)
  Else
    BrownianCombo.text = BrownianCombo.list(1)
  End If
  
  'EricL 3/21/2006 Changed from BrownianCombo to EfficiencyCombo in the section below to fix UI bug.  Cut and Paste error?
  If TmpOpts.PhysMoving >= 1# Then
    EfficiencyCombo.text = EfficiencyCombo.list(0)
  ElseIf TmpOpts.PhysMoving >= 0.66 Then
    EfficiencyCombo.text = EfficiencyCombo.list(1)
  Else
    EfficiencyCombo.text = EfficiencyCombo.list(2)
  End If
  
  'needs work
  If TmpOpts.Viscosity = 0.01 And _
     TmpOpts.Density = 0.0000001 Then
     DragCombo.text = DragCombo.list(0)
  ElseIf TmpOpts.Viscosity = 0.0005 And _
     TmpOpts.Density = 0.0000001 Then
     DragCombo.text = DragCombo.list(1)
  ElseIf TmpOpts.Viscosity = 0.000025 And _
     TmpOpts.Density = 0.0000001 Then
     DragCombo.text = DragCombo.list(2)
  ElseIf TmpOpts.Viscosity = 0# And _
     TmpOpts.Density = 0# Then
     DragCombo.text = DragCombo.list(3)
  Else
    DragCombo.text = "Custom"
  End If
    
  MaxVelSlider.value = TmpOpts.MaxVelocity
  BodyNrgDist.value = TmpOpts.VegFeedingToBody * 100
  
  'EricL 4/1/2006 Added these to initialize values
  ChartInterval.text = TmpOpts.chartingInterval
  CustomWaste.text = TmpOpts.BadWastelevel
  
  Elasticity.value = TmpOpts.CoefficientElasticity * 10
  Elasticity.text = TmpOpts.CoefficientElasticity
   
  FixBotRadius.value = TmpOpts.FixedBotRadii * True
  
  'Do this so the right CostX gets put back into SimOpts even when no Cost changes are made
  TmpOpts.Costs(COSTMULTIPLIER) = SimOpts.Costs(COSTMULTIPLIER)
  
  ' EricL Initialize that no species is selected
  CurrSpec = -1
  SpecVeg.value = 0
  BlockSpec.value = 0
  DisableVisionCheck.value = 0
  DisableMovementSysvarsCheck.value = 0
  DisableReproductionCheck.value = 0
  DisableDNACheck.value = 0
  VirusImmuneCheck.value = 0
  
  'So the right value gets put back in when the dialog is closed and tmpopts is copied back into simopts...
  'TmpOpts.SpeciesNum = SimOpts.SpeciesNum
  For t = 0 To TmpOpts.SpeciesNum - 1
    TmpOpts.Specie(t) = SimOpts.Specie(t) ' Population
    'TmpOpts.Specie(t).SubSpeciesCounter = SimOpts.Specie(t).SubSpeciesCounter
    'TmpOpts.Specie(t).Native = SimOpts.Specie(t).Native
  Next t
       
  'display the scriptlist
  LoadLists
  DispScript
  SpecList.Refresh
  
    
End Sub

Private Sub LoadSettings_Click() 'opensettings
'On Error GoTo fine
  CommonDialog1.FileName = ""
  CommonDialog1.InitDir = MDIForm1.MainDir + "\settings"
  CommonDialog1.Filter = "Settings file(*.set)|*.set"
  CommonDialog1.ShowOpen
  If CommonDialog1.FileName <> "" Then
    ReadSett CommonDialog1.FileName
    datatolist
    Dim i As Long
    
    SpecList.CLEAR
    For i = 0 To TmpOpts.SpeciesNum - 1
        If TmpOpts.Specie(i).Native Then SpecList.additem (TmpOpts.Specie(i).Name)
    Next i
    
    DispSettings
  End If
  Exit Sub
fine:
  MsgBox "Error loading"
End Sub

Private Sub SaveSettings_Click() 'savesettings
'On Error GoTo fine
  CommonDialog1.InitDir = MDIForm1.MainDir + "\settings"
  CommonDialog1.FileName = ""
  CommonDialog1.Filter = "Settings file(*.set)|*.set"
  CommonDialog1.ShowSave
  If CommonDialog1.FileName <> "" Then savesett CommonDialog1.FileName
fine:
End Sub

Public Sub savesett(path As String)
On Error GoTo fine
  Dim t As Integer
  Dim k As Integer
  Dim numSpecies As Integer
  Open path For Output As #1
  
  'EricL 4/13/2006 using this for version information
  '-2 is pre 2.42.2 versions
  '-1 is 2.42.2 and beyond VB fork
  '-3 is the C++ version
  t = -1
  Write #1, t
  
  numSpecies = 0
  For t = 0 To TmpOpts.SpeciesNum - 1
    If TmpOpts.Specie(t).Native Then numSpecies = numSpecies + 1
  Next t
  
  
  Write #1, numSpecies - 1  ' done this way becuase of the busted way the read routine loops through species...
  For t = 0 To TmpOpts.SpeciesNum - 1
  
    If Not TmpOpts.Specie(t).Native Then GoTo skipthisspecie
    
    'Write #1, TmpOpts.Specie(t).Posrg
    'Write #1, TmpOpts.Specie(t).Posdn
    'Write #1, TmpOpts.Specie(t).Poslf
    'Write #1, TmpOpts.Specie(t).Postp
    
    Write #1, TmpOpts.FieldWidth
    Write #1, TmpOpts.FieldHeight
    Write #1, 0
    Write #1, 0
    
    Write #1, TmpOpts.Specie(t).Mutables.mutarray(0)
    Write #1, TmpOpts.Specie(t).path
    Write #1, TmpOpts.Specie(t).qty
    Write #1, TmpOpts.Specie(t).Name
    Write #1, TmpOpts.Specie(t).Veg
    Write #1, TmpOpts.Specie(t).Fixed
    Write #1, TmpOpts.Specie(t).color
    Write #1, TmpOpts.Specie(t).Colind
    Write #1, TmpOpts.Specie(t).Stnrg
    For k = 0 To 13
      Write #1, TmpOpts.Specie(t).Mutables.mutarray(k)
    Next k
    For k = 0 To 12
      Write #1, TmpOpts.Specie(t).Skin(k)
    Next k
skipthisspecie:
  Next t
  Write #1, TmpOpts.SimName
  'TmpOpts.SpeciesNum = SpecList.ListCount
  
  'generali
  Write #1, TmpOpts.SpeciesNum
  Write #1, TmpOpts.FieldSize
  Write #1, TmpOpts.FieldWidth
  Write #1, TmpOpts.FieldHeight
  Write #1, TmpOpts.MaxPopulation
  Write #1, TmpOpts.BlockedVegs
  Write #1, TmpOpts.DisableTies
  Write #1, TmpOpts.PopLimMethod
  Write #1, TmpOpts.Toroidal
  Write #1, TmpOpts.MaxEnergy
  Write #1, TmpOpts.MinVegs
  
  'costi
  Write #1, TmpOpts.CostExecCond
  Write #1, TmpOpts.Costs(COSTSTORE)
  Write #1, TmpOpts.Costs(SHOTCOST)
  Write #1, TmpOpts.EnergyProp
  Write #1, TmpOpts.EnergyFix
  Write #1, TmpOpts.EnergyExType
  
  'fisica
  Write #1, TmpOpts.Ygravity
  Write #1, TmpOpts.Zgravity
  Write #1, TmpOpts.PhysBrown
  Write #1, TmpOpts.PhysMoving
  Write #1, TmpOpts.PhysSwim
  
  Write #1, TmpOpts.AutoSimPath
  Write #1, TmpOpts.AutoSimTime
  Write #1, TmpOpts.AutoRobPath
  Write #1, TmpOpts.AutoRobTime
  
  Write #1, TmpOpts.MutCurrMult
  Write #1, TmpOpts.MutOscill
  Write #1, TmpOpts.MutCycMax
  Write #1, TmpOpts.MutCycMin
  
  Write #1, TmpOpts.DBName
  Write #1, TmpOpts.DBEnable
  Write #1, TmpOpts.DBExcludeVegs
  
  Write #1, TmpOpts.Pondmode
  Write #1, False
  Write #1, TmpOpts.LightIntensity
  Write #1, TmpOpts.CorpseEnabled
  Write #1, TmpOpts.Decay
  Write #1, TmpOpts.Gradient
  Write #1, TmpOpts.DayNight
  Write #1, TmpOpts.CycleLength
  
  Write #1, TmpOpts.DecayType
  Write #1, TmpOpts.Decaydelay
  
  'obsolete
  Write #1, TmpOpts.Costs(MOVECOST)
  
  Write #1, TmpOpts.F1
  Write #1, TmpOpts.Restart
  
  SaveScripts
  
  Write #1, TmpOpts.Dxsxconnected
  Write #1, TmpOpts.Updnconnected
  
  Write #1, TmpOpts.RepopAmount
  Write #1, TmpOpts.RepopCooldown
  
  Write #1, TmpOpts.ZeroMomentum
  Write #1, TmpOpts.UserSeedToggle
  Write #1, TmpOpts.UserSeedNumber
  
  For t = 0 To TmpOpts.SpeciesNum - 1
    If Not TmpOpts.Specie(t).Native Then GoTo skipthisspecie2
    For k = 14 To 20
      Write #1, TmpOpts.Specie(t).Mutables.mutarray(k)
    Next k
    Write #1, TmpOpts.Specie(t).Mutables.Mutations
skipthisspecie2:
  Next t
  
  Write #1, TmpOpts.VegFeedingMethod
  Write #1, TmpOpts.VegFeedingToBody
  
  'New for 2.4:
  Write #1, TmpOpts.CoefficientStatic
  Write #1, TmpOpts.CoefficientKinetic
  Write #1, TmpOpts.PlanetEaters
  Write #1, TmpOpts.PlanetEatersG
  Write #1, TmpOpts.Viscosity
  Write #1, TmpOpts.Density
  
  
  For k = 0 To TmpOpts.SpeciesNum - 1
    If Not TmpOpts.Specie(k).Native Then GoTo skipthisspecie3
    Write #1, TmpOpts.Specie(k).Mutables.CopyErrorWhatToChange
    Write #1, TmpOpts.Specie(k).Mutables.PointWhatToChange
    
    Dim h As Integer
    
    For h = 0 To 20
      Write #1, TmpOpts.Specie(k).Mutables.Mean(h)
      Write #1, TmpOpts.Specie(k).Mutables.StdDev(h)
    Next h
skipthisspecie3:
  Next k
  
  For k = 0 To 70
    Write #1, TmpOpts.Costs(k)
  Next k
  
  For k = 0 To TmpOpts.SpeciesNum - 1
    If Not TmpOpts.Specie(k).Native Then GoTo skipthisspecie4
    Write #1, TmpOpts.Specie(k).Poslf
    Write #1, TmpOpts.Specie(k).Posrg
    Write #1, TmpOpts.Specie(k).Postp
    Write #1, TmpOpts.Specie(k).Posdn
skipthisspecie4:
  Next k
  
  Write #1, TmpOpts.MaxVelocity
  Write #1, TmpOpts.BadWastelevel 'EricL 4/1/2006 Added this
  Write #1, TmpOpts.chartingInterval 'EricL 4/1/2006 Added this
  Write #1, TmpOpts.FluidSolidCustom 'EricL 5/7/2006
  Write #1, TmpOpts.CostRadioSetting ' EricL 5/7/2006
  Write #1, TmpOpts.CoefficientElasticity ' EricL 5/7/2006
  Write #1, TmpOpts.MaxVelocity ' EricL 5/15/2006
  Write #1, TmpOpts.NoShotDecay ' EricL 6/8/2006
  Write #1, TmpOpts.SunUpThreshold 'EricL 6/8/2006 Added this
  Write #1, TmpOpts.SunUp 'EricL 6/8/2006 Added this
  Write #1, TmpOpts.SunDownThreshold 'EricL 6/8/2006 Added this
  Write #1, TmpOpts.SunDown 'EricL 6/8/2006 Added this
  Write #1, TmpOpts.AutoSaveStripMutations
  Write #1, TmpOpts.AutoSaveDeleteOlderFiles
  Write #1, TmpOpts.FixedBotRadii
  Write #1, TmpOpts.SunThresholdMode
    
  Close 1
  Exit Sub
fine:
  MsgBox ("Unable to save settings: some error occurred")
End Sub

Public Sub ReadSett(path As String)
On Error GoTo aiuto
  Dim t As Integer
  Dim col As Single
  Dim m As Integer
  Dim k As Integer
  Dim maxs As Integer
  Dim longv As Long
  Dim intv As Integer
  Dim singv As Single
  Dim boolv As Boolean
  Dim b As Integer
  

carica:
  On Error GoTo aiuto
  Open path For Input As #1
  Input #1, maxs 'we can actually use this for version info
  
  'EricL 4/13/2006 Check for older settings files.  2.42.1 fixed bugs that introduced incomptabilities...
  If maxs <> -1 Then
    If Right(path, 12) = "lastexit.set" Then
      MsgBox ("The settings from your last exit are incomptable with this version.  Last exit settings not loaded.  When you exit the program, a new lastexit settings file will be created automatically.")
    Else
      If Right(path, 11) = "default.set" Then
        MsgBox ("The default settings file is incomptable with this version.  You can save your settings to default.set to create a new one.  Settings not loaded.")
      Else
        MsgBox ("The settings file is incomptable with this version.  Settings not loaded.")
      End If
    End If
  Else
    clearall
    ReadSettFromFile
  End If
  Close 1
  
  'EricL 3/21/2006 Added following three lines to work around problem with default settings file
  If (TmpOpts.MaxEnergy = 500000) And (Right(path, 11) = "default.set") Then
    TmpOpts.MaxEnergy = 50
  End If
  lastsettings = path
  Exit Sub
aiuto:
  Close 1
  
  'EricL 3/22/2006 Added following section to work around case where there is no settings directory
  If Err.Number = 76 Then
    b = MsgBox("Cannot find the Settings Directory.  " + vbCrLf + _
            "Would you like me to create one?   " + vbCrLf + vbCrLf + _
            "If this is a new install, choose OK.", vbOKCancel + vbQuestion)
    If b = vbOK Then
       RecursiveMkDir (MDIForm1.MainDir + "\settings")
       InfoForm.Show 'Botsareus 5/8/2012 Show the info form if no settings where found
    Else
      MsgBox ("Darwinbots cannot continue.  Program will exit.")
      End 'Botsareus 7/12/2012 force DB to exit
    End If
  ElseIf Err.Number = 53 And Right(path, 12) = "lastexit.set" Then
       MsgBox ("Cannot find the settings file from your last exit.  " + vbCrLf + _
               "Using the internal default settings. " + vbCrLf + vbCrLf + _
               "If this is a new install, this is normal.")
      InfoForm.Show 'Botsareus 3/24/2012 Show the info form if no settings where found
  Else
    MsgBox MBcannotfindI, , MBwarning
    CommonDialog1.FileName = path
    CommonDialog1.ShowOpen
    path = CommonDialog1.FileName
    If path <> "" Then GoTo carica
  End If
End Sub



Public Sub ReadSettFromFile()
  Dim maxsp As Integer
  Dim strvar As String
  Dim check As Boolean
  Dim sinvar As Single
  Dim t As Integer
  Dim k As Integer
  Dim obsoleteLong As Long ' EricL 3/28/2006 Added to read obsolete long values from the saved settings file
  Input #1, maxsp
  
  For t = 0 To maxsp
    TmpOpts.Specie(t).Posrg = 1
    TmpOpts.Specie(t).Posdn = 1
    TmpOpts.Specie(t).Poslf = 0
    TmpOpts.Specie(t).Postp = 0
    
    'Obsolete
    Input #1, obsoleteLong 'EricL 3/28/2006 Changed to Long from k to fix bug with reloading settings with large fields
    Input #1, obsoleteLong 'EricL 3/28/2006 Changed to Long from k to fix bug with reloading settings with large fields
    Input #1, k
    Input #1, k
    
    Input #1, TmpOpts.Specie(t).Mutables.mutarray(0)
    Input #1, TmpOpts.Specie(t).path
    Input #1, TmpOpts.Specie(t).qty
    Input #1, TmpOpts.Specie(t).Name
    Input #1, TmpOpts.Specie(t).Veg
    Input #1, TmpOpts.Specie(t).Fixed
    Input #1, TmpOpts.Specie(t).color
    Input #1, TmpOpts.Specie(t).Colind
    Input #1, TmpOpts.Specie(t).Stnrg
    For k = 0 To 13
      Input #1, TmpOpts.Specie(t).Mutables.mutarray(k)
    Next k
    For k = 0 To 12
      Input #1, TmpOpts.Specie(t).Skin(k)
    Next k
  Next t
  
  'generali
  Input #1, TmpOpts.SimName
  Input #1, TmpOpts.SpeciesNum
  Input #1, TmpOpts.FieldSize
  Input #1, TmpOpts.FieldWidth
  Input #1, TmpOpts.FieldHeight
  Input #1, TmpOpts.MaxPopulation
  Input #1, TmpOpts.BlockedVegs
  Input #1, TmpOpts.DisableTies
  Input #1, TmpOpts.PopLimMethod
  Input #1, TmpOpts.Toroidal
  Input #1, TmpOpts.MaxEnergy
  Input #1, TmpOpts.MinVegs
  
  'costi
  Input #1, TmpOpts.CostExecCond
  Input #1, TmpOpts.Costs(COSTSTORE)
  Input #1, TmpOpts.Costs(SHOTCOST)
  Input #1, TmpOpts.EnergyProp
  Input #1, TmpOpts.EnergyFix
  Input #1, TmpOpts.EnergyExType
  
  'fisica
  Input #1, TmpOpts.Ygravity
  Input #1, TmpOpts.Zgravity
  Input #1, TmpOpts.PhysBrown
  Input #1, TmpOpts.PhysMoving
  Input #1, TmpOpts.PhysSwim
  
  Input #1, TmpOpts.AutoSimPath
  Input #1, TmpOpts.AutoSimTime
  Input #1, TmpOpts.AutoRobPath
  Input #1, TmpOpts.AutoRobTime
  Input #1, TmpOpts.MutCurrMult
  Input #1, TmpOpts.MutOscill
  Input #1, TmpOpts.MutCycMax
  Input #1, TmpOpts.MutCycMin
  Input #1, TmpOpts.DBName
  Input #1, TmpOpts.DBEnable
  Input #1, TmpOpts.DBExcludeVegs
  
  If Not EOF(1) Then Input #1, TmpOpts.Pondmode
  If Not EOF(1) Then Input #1, TmpOpts.CorpseEnabled 'dummy variable
  If Not EOF(1) Then Input #1, TmpOpts.LightIntensity
  If Not EOF(1) Then Input #1, TmpOpts.CorpseEnabled
  If Not EOF(1) Then Input #1, TmpOpts.Decay
  If Not EOF(1) Then Input #1, TmpOpts.Gradient
  If Not EOF(1) Then Input #1, TmpOpts.DayNight
  If Not EOF(1) Then Input #1, TmpOpts.CycleLength
  If Not EOF(1) Then Input #1, TmpOpts.DecayType
  If Not EOF(1) Then Input #1, TmpOpts.Decaydelay
  
  'obsolete
  If Not EOF(1) Then Input #1, TmpOpts.Costs(MOVECOST)
  
  If Not EOF(1) Then Input #1, TmpOpts.F1
  If Not EOF(1) Then Input #1, TmpOpts.Restart
  
  LoadScripts 'load up the scripts. Only available in form1. Can't access them from here.
  
  'even even newer newer stuff
  If Not EOF(1) Then Input #1, TmpOpts.Dxsxconnected
  If Not EOF(1) Then Input #1, TmpOpts.Updnconnected
  If Not EOF(1) Then Input #1, TmpOpts.RepopAmount
  If Not EOF(1) Then Input #1, TmpOpts.RepopCooldown
  If Not EOF(1) Then Input #1, TmpOpts.ZeroMomentum
  If Not EOF(1) Then Input #1, TmpOpts.UserSeedToggle
  If Not EOF(1) Then Input #1, TmpOpts.UserSeedNumber
  
  For t = 0 To maxsp
    For k = 14 To 20
      If Not EOF(1) Then Input #1, TmpOpts.Specie(t).Mutables.mutarray(k)
    Next k
    
    If Not EOF(1) Then Input #1, TmpOpts.Specie(t).Mutables.Mutations
  Next t
  
  If Not EOF(1) Then Input #1, TmpOpts.VegFeedingMethod
  If Not EOF(1) Then: Input #1, TmpOpts.VegFeedingToBody: Else: TmpOpts.VegFeedingToBody = 0.1
  
  'New for 2.4
  If Not EOF(1) Then Input #1, TmpOpts.CoefficientStatic
  If Not EOF(1) Then Input #1, TmpOpts.CoefficientKinetic
  If Not EOF(1) Then Input #1, TmpOpts.PlanetEaters
  If Not EOF(1) Then Input #1, TmpOpts.PlanetEatersG
  If Not EOF(1) Then Input #1, TmpOpts.Viscosity
  If Not EOF(1) Then Input #1, TmpOpts.Density
  
  For k = 0 To maxsp
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Mutables.CopyErrorWhatToChange
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Mutables.PointWhatToChange
    
    Dim h As Integer
    
    For h = 0 To 20
      If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Mutables.Mean(h)
      If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Mutables.StdDev(h)
    Next h
  Next k
  
  For k = 0 To 70
    Dim temp As Single
    If Not EOF(1) Then Input #1, temp
    TmpOpts.Costs(k) = temp
  Next k
  
  For k = 0 To maxsp
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Poslf
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Posrg
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Postp
    If Not EOF(1) Then Input #1, TmpOpts.Specie(k).Posdn
    TmpOpts.Specie(k).Native = True
  Next k
  
  If Not EOF(1) Then Input #1, TmpOpts.MaxVelocity
  
  TmpOpts.BadWastelevel = -1 ' Default
  If Not EOF(1) Then Input #1, TmpOpts.BadWastelevel 'EricL 4/1/2006 Added this
  
  TmpOpts.chartingInterval = 200 ' Default
  If Not EOF(1) Then Input #1, TmpOpts.chartingInterval 'EricL 4/1/2006 Added this
  
  TmpOpts.FluidSolidCustom = 2 ' Default to custom for older settings files
  If Not EOF(1) Then Input #1, TmpOpts.FluidSolidCustom 'EricL 5/7/2006 Added this
  
  TmpOpts.CostRadioSetting = 2 ' Default to custom for older settings files
  If Not EOF(1) Then Input #1, TmpOpts.CostRadioSetting 'EricL 5/7/2006 Added this
  
  TmpOpts.CoefficientElasticity = 0 ' Default for older settings files
  If Not EOF(1) Then Input #1, TmpOpts.CoefficientElasticity 'EricL 5/7/2006 Added this
  
  TmpOpts.MaxVelocity = 40 ' Default for older settings files
  If Not EOF(1) Then Input #1, TmpOpts.MaxVelocity 'EricL 5/15/2006 Added this
  
  TmpOpts.NoShotDecay = False ' Default for older settings files
  If Not EOF(1) Then Input #1, TmpOpts.NoShotDecay 'EricL 6/8/2006 Added this
    
  TmpOpts.SunUpThreshold = 500000   'Set to a reasonable default value
  If Not EOF(1) Then Input #1, TmpOpts.SunUpThreshold 'EricL 6/8/2006 Added this
    
  TmpOpts.SunUp = False   'Set to a reasonable default value
  If Not EOF(1) Then Input #1, TmpOpts.SunUp 'EricL 6/8/2006 Added this
    
  TmpOpts.SunDownThreshold = 1000000   'Set to a reasonable default value
  If Not EOF(1) Then Input #1, TmpOpts.SunDownThreshold 'EricL 6/8/2006 Added this
    
  TmpOpts.SunDown = False   'Set to a reasonable default value
  If Not EOF(1) Then Input #1, TmpOpts.SunDown 'EricL 6/8/2006 Added this
    
  TmpOpts.AutoSaveStripMutations = False
  If Not EOF(1) Then Input #1, TmpOpts.AutoSaveStripMutations
  
  TmpOpts.AutoSaveDeleteOlderFiles = False
  If Not EOF(1) Then Input #1, TmpOpts.AutoSaveDeleteOlderFiles
  
  TmpOpts.FixedBotRadii = False
  If Not EOF(1) Then Input #1, TmpOpts.FixedBotRadii
  
  TmpOpts.SunThresholdMode = 0
  If Not EOF(1) Then Input #1, TmpOpts.SunThresholdMode
  
  If (Not EOF(1)) Then MsgBox "This settings file is a newer version than this version can read.  " + vbCrLf + _
                              "Not all the information it contains can be " + vbCrLf + _
                              "transfered."
  
  If TmpOpts.FieldWidth = 0 Then TmpOpts.FieldWidth = 16000
  If TmpOpts.FieldHeight = 0 Then TmpOpts.FieldHeight = 12000
  If TmpOpts.MaxVelocity = 0 Then TmpOpts.MaxVelocity = 60
  If TmpOpts.Costs(DYNAMICCOSTSENSITIVITY) = 0 Then TmpOpts.Costs(DYNAMICCOSTSENSITIVITY) = 50
  
  
  'EricL 4/13/2006 divide by zero protection for older settings files.
  If TmpOpts.chartingInterval = 0 Then
    TmpOpts.chartingInterval = 200
  End If
  
  TmpOpts.DayNightCycleCounter = 0 ' When you load settings, you don't get the state from the last sim
  TmpOpts.Daytime = True ' EricL 3/21/2006 - this is a bettter place for this than in MDIForm_Load
End Sub

'
'
' S P E C I E S     S E T T I N G S
'------------------------------------
'
'
'
'  Species buttons
'


'
' Skin and mutrates
'


'
' List management
'

'
'   Species attributes
'

'
'
'   G E N E R A L    S E T T I N G S
'------------------------------------
'
'

'
'   P H Y S I C S    S E T T I N G S
'-------------------------------------
'

'
'  C O S T S   S E T T I N G S
'------------------------------
'

Private Sub Prop_Lostfocus()
  TmpOpts.EnergyProp = val(Prop.text) / 100
End Sub

Private Sub PropUpDn_Change()
  Dim a As Single
  a = PropUpDn.value
  Prop.text = Str$(a / 100#)
  TmpOpts.EnergyProp = a / 100#
End Sub

Sub Fixed_Lostfocus()
  Dim a As Single
  a = val(Fixed.text)
  If a < FixUpDn.Min Then a = FixUpDn.Min
  If a > FixUpDn.Max Then a = FixUpDn.Max
  TmpOpts.EnergyFix = a
End Sub

Private Sub FixUpDn_Change()
  Dim a As Single
  a = FixUpDn.value
  TmpOpts.EnergyFix = a
End Sub

Private Sub ExchangeProp_Click()
  TmpOpts.EnergyExType = ExchangeProp.value
End Sub

Private Sub ExchangeFix_Click()
  TmpOpts.EnergyExType = Not ExchangeFix.value
End Sub

'
'  M U T R A T E   O P T I O N S
'
'

Private Sub MutSlide_Scroll()
  TmpOpts.MutCurrMult = 2 ^ MutSlide.value
  If TmpOpts.MutCurrMult > 1 Then
    MutLab.Caption = Str$(TmpOpts.MutCurrMult) + " X"
  Else
    MutLab.Caption = "1/" + Str$(2 ^ -MutSlide.value) + " X"
  End If
End Sub

Private Sub CyclesHi_Change()
  TmpOpts.MutCycMax = val(CyclesHi.text)
End Sub

Private Sub CyclesLo_Change()
  TmpOpts.MutCycMin = val(CyclesLo.text)
End Sub

Private Sub MutOscill_Click()
  TmpOpts.MutOscill = False
  If MutOscill.value = 1 Then TmpOpts.MutOscill = True
End Sub

'
' A U T O S A V E   O P T I O N S
'--------------------------------
'

'Private Sub AutoSimTxt_Change()
'End Sub

Private Sub AutoSimBrowse_Click()
  CommonDialog1.InitDir = MDIForm1.MainDir + "/saves"
  CommonDialog1.DialogTitle = "Choose filename for simulation autosaves"
  CommonDialog1.Filter = "Simulation file(*.sim)|*.sim"
  CommonDialog1.ShowSave
  AutoSimPath.text = CommonDialog1.FileName
End Sub

Private Sub AutoRobBrowse_Click()
  CommonDialog1.InitDir = MDIForm1.MainDir + "/robots"
  CommonDialog1.DialogTitle = "Choose a filename for robot autosaves"
  CommonDialog1.ShowSave
  AutoRobPath.text = CommonDialog1.FileName
End Sub

'
'  D A T A B A S E   O P T I O N S
'  -------------------------------
'

Public Sub DBOptsEnable(enab As Boolean)
  DBEnable.Enabled = enab
  DBName.Enabled = enab
  DBBrowse.Enabled = enab
  Label50.Enabled = enab
  DBExcludeVegs.Enabled = enab
  StopDBRec.Enabled = Not enab
End Sub

Private Sub StopDBRec_Click()
  CloseDatabase
  SimOpts.DBEnable = False
End Sub

Private Sub DBBrowse_Click()
  CommonDialog1.InitDir = MDIForm1.MainDir + "/database"
  CommonDialog1.DialogTitle = "Select a name for the DataBase."
  CommonDialog1.Filter = "Text Database (*.txt)|*.txt"
  CommonDialog1.ShowSave
  DBName.text = CommonDialog1.FileName
End Sub

Private Sub DBEnable_Click()
  TmpOpts.DBEnable = False
  If DBEnable.value = 1 Then TmpOpts.DBEnable = True
End Sub

Private Sub DBExcludeVegs_Click()
  TmpOpts.DBExcludeVegs = False
  If DBExcludeVegs.value = 1 Then TmpOpts.DBExcludeVegs = True
End Sub

Private Sub DBName_Change()
  Dim a As String
  Dim b As Integer
  TmpOpts.DBName = DBName.text
  If DBName.text <> "" And TmpOpts.DBEnable Then
    a = dir(DBName.text)
    If a <> "" Then b = MsgBox("Existing database: append new records?", vbOKCancel + vbQuestion)
    If b = vbCancel Then
      DBName.text = ""
      TmpOpts.DBName = ""
      TmpOpts.DBEnable = False
      DispSettings
    End If
  End If
End Sub

'
'  I N T E R N E T   O P T I O N S
'  -------------------------------
'
Private Sub SaveInternetSett()
On Error GoTo fine
  Open MDIForm1.MainDir + "\intsett.ini" For Output As 1
    
  'Breaking change as of 2.44.07 - Shasta
  Print #1, IntName.text
  Print #1, inboundPathText.text
  Print #1, outboundPathText.text
  
  Close 1
  Exit Sub
fine:
  MsgBox ("Unable to save internet settings: some error occurred")
End Sub

Public Sub IntSettLoad()
  Dim a As String
  a = dir(MDIForm1.MainDir + "\intsett.ini")
  If a <> "" Then
    Open MDIForm1.MainDir + "\intsett.ini" For Input As 1

    'Breaking change as of 2.44.07 - Shasta
    Input #1, IntOpts.IName
    Input #1, IntOpts.InboundPath
    Input #1, IntOpts.OutboundPath
    
    Close 1
  End If
End Sub
