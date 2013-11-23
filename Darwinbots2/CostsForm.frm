VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form CostsForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Costs"
   ClientHeight    =   9255
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10920
   Icon            =   "CostsForm.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1.373
   ScaleMode       =   0  'User
   ScaleWidth      =   0.973
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame2 
      Caption         =   "Cost Overrides"
      Height          =   4095
      Left            =   120
      TabIndex        =   70
      Top             =   4920
      Width           =   5655
      Begin VB.CheckBox AllowNegativeCostXCheck 
         Caption         =   "Allow Multiplier to go Negative"
         Height          =   255
         Left            =   3000
         TabIndex        =   101
         Top             =   360
         Width           =   2535
      End
      Begin VB.CheckBox DynamicCostsIncludePlantsCheck 
         Caption         =   "Include all robots"
         Height          =   255
         Left            =   240
         TabIndex        =   100
         Top             =   1800
         Width           =   1695
      End
      Begin VB.TextBox CostX 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.00000"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   1
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   98
         Text            =   "1.0"
         ToolTipText     =   "This value is applied to the costs to determine the actual costs per cycle"
         Top             =   360
         Width           =   1185
      End
      Begin VB.TextBox CostReinstate 
         Height          =   285
         Left            =   4320
         TabIndex        =   92
         Text            =   "0"
         ToolTipText     =   "Set the length of day and night in game cycles. The value entered here represents one full cycle of both."
         Top             =   1440
         Width           =   960
      End
      Begin VB.Frame Frame3 
         Caption         =   "Dynamic Cost Adjustment"
         Height          =   1815
         Left            =   120
         TabIndex        =   74
         Top             =   2160
         Width           =   5415
         Begin VB.TextBox DynamicCostsRangeL 
            Height          =   285
            Left            =   4440
            TabIndex        =   87
            Text            =   "100"
            ToolTipText     =   "Target bot population ignores corpses, walls, veggies"
            Top             =   1080
            Width           =   375
         End
         Begin VB.TextBox DynamicCostsRangeU 
            Height          =   285
            Left            =   4440
            TabIndex        =   83
            Text            =   "100"
            ToolTipText     =   "Target bot population ignores corpses, walls, veggies"
            Top             =   720
            Width           =   375
         End
         Begin VB.TextBox DynamicCostTargetPopulation 
            Height          =   285
            Left            =   4320
            TabIndex        =   80
            Text            =   "5000"
            ToolTipText     =   "Target bot population ignores corpses, walls, veggies"
            Top             =   360
            Width           =   465
         End
         Begin VB.CheckBox DynamicCosts 
            Caption         =   "Enable Dynamic Costs"
            Height          =   255
            Left            =   240
            TabIndex        =   79
            Top             =   240
            Width           =   1935
         End
         Begin MSComctlLib.Slider DynamicCostSensitivitySlider 
            Height          =   555
            Left            =   120
            TabIndex        =   75
            Top             =   840
            Width           =   2175
            _ExtentX        =   3836
            _ExtentY        =   979
            _Version        =   393216
            LargeChange     =   50
            Min             =   1
            Max             =   1000
            SelStart        =   1
            TickStyle       =   2
            TickFrequency   =   50
            Value           =   1
         End
         Begin ComCtl2.UpDown DynamicCostsUpDown 
            Height          =   285
            Left            =   4800
            TabIndex        =   81
            Top             =   360
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   100
            BuddyControl    =   "DynamicCostTargetPopulation"
            BuddyDispid     =   196617
            OrigLeft        =   3600
            OrigTop         =   360
            OrigRight       =   3855
            OrigBottom      =   645
            Increment       =   10
            Max             =   5000
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown UpDown1 
            Height          =   285
            Left            =   4800
            TabIndex        =   84
            Top             =   720
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   100
            BuddyControl    =   "DynamicCostsRangeU"
            BuddyDispid     =   196616
            OrigLeft        =   4800
            OrigTop         =   720
            OrigRight       =   5055
            OrigBottom      =   1005
            Max             =   100
            Min             =   1
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin ComCtl2.UpDown UpDown3 
            Height          =   285
            Left            =   4800
            TabIndex        =   88
            Top             =   1080
            Width           =   255
            _ExtentX        =   450
            _ExtentY        =   503
            _Version        =   327681
            Value           =   100
            BuddyControl    =   "DynamicCostsRangeL"
            BuddyDispid     =   196615
            OrigLeft        =   4800
            OrigTop         =   1080
            OrigRight       =   5055
            OrigBottom      =   1365
            Max             =   100
            Min             =   1
            SyncBuddy       =   -1  'True
            BuddyProperty   =   0
            Enabled         =   -1  'True
         End
         Begin VB.Label Label15 
            Caption         =   "%"
            Height          =   255
            Left            =   5160
            TabIndex        =   90
            ToolTipText     =   "Target includes only extant hetertrophs"
            Top             =   1155
            Width           =   135
         End
         Begin VB.Label Label14 
            Caption         =   "Lower Range: Target -"
            Height          =   255
            Left            =   2640
            TabIndex        =   89
            ToolTipText     =   "Target includes only extant hetertrophs"
            Top             =   1080
            Width           =   1695
         End
         Begin VB.Label Label13 
            Caption         =   "%"
            Height          =   255
            Left            =   5160
            TabIndex        =   86
            ToolTipText     =   "Target includes only extant hetertrophs"
            Top             =   795
            Width           =   135
         End
         Begin VB.Label Label12 
            Caption         =   "Upper Range: Target +"
            Height          =   255
            Left            =   2640
            TabIndex        =   85
            ToolTipText     =   "Target includes only extant hetertrophs"
            Top             =   720
            Width           =   1695
         End
         Begin VB.Label Label8 
            Caption         =   "Target Population"
            Height          =   255
            Left            =   2640
            TabIndex        =   82
            ToolTipText     =   "Target includes only extant hetertrophs"
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label Label7 
            Caption         =   "Sensitivity"
            Height          =   255
            Left            =   840
            TabIndex        =   78
            Top             =   600
            Width           =   855
         End
         Begin VB.Label Label10 
            Caption         =   "Low"
            Height          =   255
            Left            =   240
            TabIndex        =   77
            Top             =   1440
            Width           =   495
         End
         Begin VB.Label Label11 
            Caption         =   "High"
            Height          =   255
            Left            =   1800
            TabIndex        =   76
            Top             =   1440
            Width           =   375
         End
      End
      Begin VB.TextBox BotNoCostThreshold 
         Height          =   285
         Left            =   4320
         TabIndex        =   71
         Text            =   "0"
         ToolTipText     =   "Set the length of day and night in game cycles. The value entered here represents one full cycle of both."
         Top             =   1080
         Width           =   960
      End
      Begin ComCtl2.UpDown UpDown2 
         Height          =   285
         Left            =   5280
         TabIndex        =   72
         Top             =   1080
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   100
         AutoBuddy       =   -1  'True
         BuddyControl    =   "BotNoCostThreshold"
         BuddyDispid     =   196627
         OrigLeft        =   3600
         OrigTop         =   360
         OrigRight       =   3855
         OrigBottom      =   645
         Increment       =   10
         Max             =   5000
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin ComCtl2.UpDown UpDown4 
         Height          =   285
         Left            =   5280
         TabIndex        =   93
         Top             =   1440
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         _Version        =   327681
         Value           =   100
         AutoBuddy       =   -1  'True
         BuddyControl    =   "CostReinstate"
         BuddyDispid     =   196613
         OrigLeft        =   3600
         OrigTop         =   360
         OrigRight       =   3855
         OrigBottom      =   645
         Increment       =   10
         Max             =   5000
         SyncBuddy       =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin VB.Label Label19 
         Caption         =   "Cost Multiplier:"
         Height          =   195
         Left            =   240
         TabIndex        =   99
         ToolTipText     =   "Target includes only extant hetertrophs"
         Top             =   375
         Width           =   1095
      End
      Begin VB.Label Label16 
         Caption         =   "Reinstate Costs when population above"
         Height          =   255
         Left            =   1320
         TabIndex        =   91
         Top             =   1440
         Width           =   3015
      End
      Begin VB.Label Label9 
         Caption         =   "Zero Costs when population falls below"
         Height          =   255
         Left            =   1320
         TabIndex        =   73
         Top             =   1080
         Width           =   2895
      End
   End
   Begin VB.Frame AgeFrame 
      Caption         =   "Aging"
      Height          =   2535
      Left            =   5880
      TabIndex        =   62
      Top             =   6120
      Width           =   4095
      Begin VB.TextBox Costs 
         Height          =   285
         Index           =   33
         Left            =   1920
         TabIndex        =   95
         Text            =   "0.0001"
         ToolTipText     =   "Increase Age cost this amount per cycle once it begins"
         Top             =   1680
         Width           =   735
      End
      Begin VB.CheckBox LinearAgeCostCheck 
         Caption         =   "Increase by"
         Height          =   255
         Left            =   600
         TabIndex        =   94
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CheckBox AgeCostLog 
         Caption         =   "Increase log(bot age - cost start age)"
         Height          =   375
         Left            =   600
         TabIndex        =   69
         Top             =   2040
         Width           =   3255
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   32
         Left            =   1860
         TabIndex        =   67
         Text            =   "Text1"
         ToolTipText     =   "Don't begin charging the Age Cost until the bot reaches this age"
         Top             =   840
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   31
         Left            =   1860
         TabIndex        =   64
         Text            =   "Text1"
         ToolTipText     =   "The cost per cycle in nrg which will be multiplied times log(age) and charged to the bot"
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label18 
         Caption         =   "Once cost begins being applied:"
         Height          =   255
         Left            =   120
         TabIndex        =   97
         Top             =   1320
         Width           =   3405
      End
      Begin VB.Label Label17 
         Caption         =   "nrg per cycle"
         Height          =   255
         Left            =   2760
         TabIndex        =   96
         Top             =   1680
         Width           =   1215
      End
      Begin VB.Label Label6 
         Caption         =   "cycles old"
         Height          =   255
         Left            =   2940
         TabIndex        =   68
         Top             =   840
         Width           =   735
      End
      Begin VB.Label Label5 
         Caption         =   "Begins upon reaching"
         Height          =   255
         Left            =   120
         TabIndex        =   66
         Top             =   840
         Width           =   2535
      End
      Begin VB.Label Label4 
         Caption         =   "Age Cost"
         Height          =   255
         Left            =   120
         TabIndex        =   65
         Top             =   360
         Width           =   1725
      End
      Begin VB.Label Label3 
         Caption         =   "nrg per cycle"
         Height          =   255
         Left            =   2940
         TabIndex        =   63
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CommandButton Default 
      Caption         =   "F1 Default"
      Height          =   375
      Left            =   7200
      TabIndex        =   61
      Top             =   8760
      Width           =   1575
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "Okay"
      Height          =   375
      Left            =   9120
      TabIndex        =   54
      Top             =   8760
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Caption         =   "Morphological Costs"
      Height          =   5955
      Index           =   2
      Left            =   5880
      TabIndex        =   25
      Top             =   120
      Width           =   4935
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   8
         Left            =   2040
         TabIndex        =   105
         Text            =   "Text1"
         Top             =   5520
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   25
         Left            =   2040
         TabIndex        =   102
         Text            =   "Text1"
         Top             =   5040
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   30
         Left            =   2040
         TabIndex        =   55
         Text            =   "Text1"
         Top             =   4560
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   29
         Left            =   2040
         TabIndex        =   34
         Text            =   "Text1"
         Top             =   4080
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   28
         Left            =   2040
         TabIndex        =   33
         Text            =   "Text1"
         Top             =   3600
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   27
         Left            =   2040
         TabIndex        =   32
         Text            =   "Text1"
         Top             =   3120
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   26
         Left            =   2040
         TabIndex        =   31
         Text            =   "Text1"
         Top             =   2640
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   24
         Left            =   2040
         TabIndex        =   30
         Text            =   "Text1"
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   23
         Left            =   2040
         TabIndex        =   29
         Text            =   "Text1"
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   22
         Left            =   2040
         TabIndex        =   28
         Text            =   "Text1"
         Top             =   1200
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   21
         Left            =   2040
         TabIndex        =   27
         Text            =   "Text1"
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   20
         Left            =   2040
         TabIndex        =   26
         Text            =   "Text1"
         Top             =   240
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Chloroplast Cost"
         Height          =   255
         Index           =   10
         Left            =   300
         TabIndex        =   107
         Top             =   5520
         Width           =   1275
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per added chlr."
         Height          =   255
         Index           =   10
         Left            =   3120
         TabIndex        =   106
         Top             =   5520
         Width           =   1515
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per data per copy"
         Height          =   255
         Index           =   8
         Left            =   3120
         TabIndex        =   104
         Top             =   5040
         Width           =   1515
      End
      Begin VB.Label Label1 
         Caption         =   "DNA Copy"
         Height          =   255
         Index           =   9
         Left            =   300
         TabIndex        =   103
         Top             =   5040
         Width           =   1275
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per body per turn"
         Height          =   255
         Index           =   30
         Left            =   3120
         TabIndex        =   57
         Top             =   4560
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Body Upkeep"
         Height          =   255
         Index           =   30
         Left            =   300
         TabIndex        =   56
         Top             =   4560
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Voluntary Movement"
         Height          =   255
         Index           =   29
         Left            =   300
         TabIndex        =   53
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Rotation"
         Height          =   255
         Index           =   28
         Left            =   300
         TabIndex        =   52
         Top             =   720
         Width           =   1635
      End
      Begin VB.Label Label1 
         Caption         =   "Shell Cost"
         Height          =   255
         Index           =   27
         Left            =   300
         TabIndex        =   51
         Top             =   4080
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Tie Formation"
         Height          =   255
         Index           =   26
         Left            =   300
         TabIndex        =   50
         Top             =   1200
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Shot Formation"
         Height          =   255
         Index           =   25
         Left            =   300
         TabIndex        =   49
         Top             =   1680
         Width           =   1875
      End
      Begin VB.Label Label1 
         Caption         =   "DNA Upkeep"
         Height          =   255
         Index           =   24
         Left            =   300
         TabIndex        =   48
         Top             =   2160
         Width           =   1275
      End
      Begin VB.Label Label1 
         Caption         =   "Venom Cost"
         Height          =   255
         Index           =   22
         Left            =   300
         TabIndex        =   47
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Poison Cost"
         Height          =   255
         Index           =   21
         Left            =   300
         TabIndex        =   46
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Slime Cost"
         Height          =   255
         Index           =   20
         Left            =   300
         TabIndex        =   45
         Top             =   3600
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per bang"
         Height          =   255
         Index           =   29
         Left            =   3120
         TabIndex        =   44
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per radian"
         Height          =   255
         Index           =   28
         Left            =   3120
         TabIndex        =   43
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per firing"
         Height          =   255
         Index           =   27
         Left            =   3120
         TabIndex        =   42
         Top             =   1200
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "base nrg per shot"
         Height          =   255
         Index           =   26
         Left            =   3120
         TabIndex        =   41
         Top             =   1680
         Width           =   1335
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per data per cycle"
         Height          =   255
         Index           =   25
         Left            =   3120
         TabIndex        =   40
         Top             =   2160
         Width           =   1755
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per bp per copy"
         Height          =   255
         Index           =   24
         Left            =   5280
         TabIndex        =   39
         Top             =   840
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per unit constructed"
         Height          =   255
         Index           =   23
         Left            =   3120
         TabIndex        =   38
         Top             =   2640
         Width           =   1695
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per unit constructed"
         Height          =   255
         Index           =   22
         Left            =   3120
         TabIndex        =   37
         Top             =   3120
         Width           =   1695
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per unit constructed"
         Height          =   255
         Index           =   21
         Left            =   3120
         TabIndex        =   36
         Top             =   3600
         Width           =   1695
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per unit constructed"
         Height          =   255
         Index           =   20
         Left            =   3120
         TabIndex        =   35
         Top             =   4080
         Width           =   1695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "DNA Command Costs"
      Height          =   4755
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5655
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   3
         Left            =   1965
         TabIndex        =   60
         Text            =   "Text1"
         Top             =   1800
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   0
         Left            =   1965
         TabIndex        =   59
         Text            =   "Text1"
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   9
         Left            =   1965
         TabIndex        =   58
         Text            =   "Text1"
         Top             =   4260
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   7
         Left            =   1965
         TabIndex        =   6
         Text            =   "Text1"
         Top             =   3765
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   6
         Left            =   1965
         TabIndex        =   5
         Text            =   "Text1"
         Top             =   3270
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   5
         Left            =   1965
         TabIndex        =   4
         Text            =   "Text1"
         Top             =   2790
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   4
         Left            =   1965
         TabIndex        =   3
         Text            =   "Text1"
         Top             =   2280
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   2
         Left            =   1965
         TabIndex        =   2
         Text            =   "Text1"
         Top             =   1335
         Width           =   975
      End
      Begin VB.TextBox Costs 
         Height          =   315
         Index           =   1
         Left            =   1965
         TabIndex        =   1
         Text            =   "Text1"
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   9
         Left            =   3120
         TabIndex        =   24
         Top             =   4320
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   7
         Left            =   3120
         TabIndex        =   23
         Top             =   3825
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   6
         Left            =   3120
         TabIndex        =   22
         Top             =   3330
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   5
         Left            =   3120
         TabIndex        =   21
         Top             =   2850
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   4
         Left            =   3120
         TabIndex        =   20
         Top             =   2370
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   3
         Left            =   3120
         TabIndex        =   19
         Top             =   1875
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   2
         Left            =   3120
         TabIndex        =   18
         Top             =   1395
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   1
         Left            =   3120
         TabIndex        =   17
         Top             =   900
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "nrg per instance"
         Height          =   255
         Index           =   0
         Left            =   3120
         TabIndex        =   16
         Top             =   420
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "Stores"
         Height          =   255
         Index           =   8
         Left            =   180
         TabIndex        =   15
         Top             =   3780
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Logic"
         Height          =   255
         Index           =   7
         Left            =   180
         TabIndex        =   14
         Top             =   3300
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Condition"
         Height          =   255
         Index           =   6
         Left            =   180
         TabIndex        =   13
         Top             =   2820
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "Bitwise Command"
         Height          =   255
         Index           =   5
         Left            =   180
         TabIndex        =   12
         Top             =   2340
         Width           =   1275
      End
      Begin VB.Label Label1 
         Caption         =   "Advanced Command"
         Height          =   255
         Index           =   4
         Left            =   180
         TabIndex        =   11
         Top             =   1860
         Width           =   1875
      End
      Begin VB.Label Label1 
         Caption         =   "Basic Command"
         Height          =   255
         Index           =   3
         Left            =   180
         TabIndex        =   10
         Top             =   1380
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Flow Command"
         Height          =   255
         Index           =   2
         Left            =   180
         TabIndex        =   9
         Top             =   4320
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "*number"
         Height          =   255
         Index           =   1
         Left            =   180
         TabIndex        =   8
         Top             =   900
         Width           =   1095
      End
      Begin VB.Label Label1 
         Caption         =   "number"
         Height          =   255
         Index           =   0
         Left            =   180
         TabIndex        =   7
         Top             =   420
         Width           =   1095
      End
   End
End
Attribute VB_Name = "CostsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Botsareus 6/12/2012 form's icon change

Private Sub AgeCostLog_Click()
  If AgeCostLog.value = 1 Then
    LinearAgeCostCheck.Enabled = False
    Costs(AGECOSTLINEARFRACTION).Enabled = False
    Label17.Enabled = False
  Else
    LinearAgeCostCheck.Enabled = True
    Costs(AGECOSTLINEARFRACTION).Enabled = True
      Label17.Enabled = True
  End If
  TmpOpts.Costs(AGECOSTMAKELOG) = AgeCostLog.value
End Sub

Private Sub AllowNegativeCostXCheck_Click()
  TmpOpts.Costs(ALLOWNEGATIVECOSTX) = AllowNegativeCostXCheck.value
End Sub

Private Sub BotNoCostThreshold_Change()
  TmpOpts.Costs(BOTNOCOSTLEVEL) = val(ConvertCommasToDecimal(BotNoCostThreshold.text))
End Sub

Private Sub CostReinstate_Change()
  TmpOpts.Costs(COSTXREINSTATEMENTLEVEL) = val(ConvertCommasToDecimal(CostReinstate.text))
End Sub

Private Sub Costs_Change(Index As Integer)
  TmpOpts.Costs(Index) = val(ConvertCommasToDecimal(Costs(Index).text))
End Sub

Private Sub CostX_Change()
  TmpOpts.Costs(COSTMULTIPLIER) = val(ConvertCommasToDecimal(CostX.text))
  SimOpts.Costs(COSTMULTIPLIER) = val(ConvertCommasToDecimal(CostX.text)) ' Have to do this here since DispSettings gets called again when the Options dialog repaints...
  TmpOpts.oldCostX = val(ConvertCommasToDecimal(CostX.text))
End Sub

Private Sub Default_Click()
  Costs(0).text = "0"
  Costs(1).text = "0"
  Costs(2).text = "0"
  Costs(3).text = "0"
  Costs(4).text = "0"
  Costs(5).text = ".004"
  Costs(6).text = "0"
  Costs(7).text = ".04"
  Costs(8).text = "0"
  Costs(9).text = "0"
  
  Costs(20).text = ".05"
  Costs(21).text = "0"
  Costs(22).text = "2"
  Costs(23).text = "2"
  Costs(24).text = "0"
  Costs(25).text = "0"
  Costs(26).text = "0.01"
  Costs(27).text = "0.01"
  Costs(28).text = "0.1"
  Costs(29).text = "0.1"
  
  Costs(8).text = "0.2"
  
  Costs(AGECOSTSTART).text = "0"  'EricL 4/12/2006 New for 2.42.2
  AgeCostLog.value = 0 'EricL 4/12/2006 New for 4.24.2
  BotNoCostThreshold.text = "0"
  CostReinstate.text = "0"
  DynamicCostTargetPopulation.Enabled = False
  DynamicCosts.Enabled = False
  TmpOpts.DynamicCosts = False
  CostX.text = "1"
  Costs(BODYUPKEEP).text = "0.00001"
  Costs(AGECOST).text = "0.01"
  
  
End Sub

Private Sub DynamicCosts_Click()
  TmpOpts.Costs(USEDYNAMICCOSTS) = DynamicCosts.value * True
  DynamicCostTargetPopulation.Enabled = DynamicCosts.value * True
  DynamicCostsUpDown.Enabled = DynamicCosts.value * True
  DynamicCostSensitivitySlider.Enabled = DynamicCosts.value * True
  DynamicCostsRangeU.Enabled = DynamicCosts.value * True
  DynamicCostsRangeL.Enabled = DynamicCosts.value * True
 ' TmpOpts.Costs(COSTMULTIPLIER) = 1 ' Start at 1 if enabled or re-enabled
End Sub

Private Sub DynamicCostSensitivitySlider_Change()
  TmpOpts.Costs(DYNAMICCOSTSENSITIVITY) = DynamicCostSensitivitySlider.value
End Sub

Private Sub DynamicCostsIncludePlantsCheck_Click()
  TmpOpts.Costs(DYNAMICCOSTINCLUDEPLANTS) = DynamicCostsIncludePlantsCheck.value
End Sub

Private Sub DynamicCostsRangeL_Change()
  TmpOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE) = val(DynamicCostsRangeL.text)
End Sub

Private Sub DynamicCostsRangeU_Change()
    TmpOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE) = val(DynamicCostsRangeU.text)
End Sub

Private Sub DynamicCostTargetPopulation_Change()
  TmpOpts.Costs(DYNAMICCOSTTARGET) = val(DynamicCostTargetPopulation.text)
 ' TmpOpts.Costs(COSTMULTIPLIER) = 1 ' Start at 1 if the value is changed
End Sub

Private Sub ExitButton_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim counter As Integer
  
  For counter = 0 To 33 'add up to 50 as new costs are added
  If counter > 9 And counter < 20 Then GoTo fine
    Costs(counter).text = TmpOpts.Costs(counter)
fine:
  Next counter
  
  'EricL 4/12/2006 Set the value of the checkboxes.  Do this way to guard against weird values
  If TmpOpts.Costs(AGECOSTMAKELOG) = 1 Then
    AgeCostLog.value = 1
    LinearAgeCostCheck.Enabled = False
    Costs(AGECOSTLINEARFRACTION).Enabled = False
    Label17.Enabled = False
  Else
    AgeCostLog.value = 0
    LinearAgeCostCheck.Enabled = True
    Costs(AGECOSTLINEARFRACTION).Enabled = True
    Label17.Enabled = True
  End If
  If TmpOpts.Costs(AGECOSTMAKELINEAR) = 1 Then
    LinearAgeCostCheck.value = 1
  Else
    LinearAgeCostCheck.value = 0
  End If
  If (TmpOpts.Costs(AGECOSTMAKELOG) = 1) And (TmpOpts.Costs(AGECOSTMAKELINEAR) = 1) Then
    ' This should never happen...  Set em both to unchecked since something is amiss...
    AgeCostLog.value = 0
    LinearAgeCostCheck.Enabled = True
    Costs(AGECOSTLINEARFRACTION).Enabled = True
    Label17.Enabled = True
    LinearAgeCostCheck.value = 0
  End If
  If TmpOpts.Costs(ALLOWNEGATIVECOSTX) = 1 Then
    AllowNegativeCostXCheck.value = 1
  Else
    AllowNegativeCostXCheck.value = 0
  End If
  
  'Need to load this as it changes and will get put back.
  TmpOpts.Costs(COSTMULTIPLIER) = SimOpts.Costs(COSTMULTIPLIER)
    
  CostX.text = TmpOpts.Costs(COSTMULTIPLIER)
    
  BotNoCostThreshold.text = TmpOpts.Costs(BOTNOCOSTLEVEL)
  CostReinstate.text = TmpOpts.Costs(COSTXREINSTATEMENTLEVEL)
  DynamicCosts.value = TmpOpts.Costs(USEDYNAMICCOSTS) * True
  DynamicCostTargetPopulation.text = TmpOpts.Costs(DYNAMICCOSTTARGET)
  DynamicCostTargetPopulation.Enabled = DynamicCosts.value * True
  DynamicCostsUpDown.Enabled = DynamicCosts.value * True
  DynamicCostSensitivitySlider.value = TmpOpts.Costs(DYNAMICCOSTSENSITIVITY)
  DynamicCostSensitivitySlider.Enabled = DynamicCosts.value * True
  DynamicCostsRangeU.text = TmpOpts.Costs(DYNAMICCOSTTARGETUPPERRANGE)
  DynamicCostsRangeU.Enabled = DynamicCosts.value * True
  DynamicCostsRangeL.text = TmpOpts.Costs(DYNAMICCOSTTARGETLOWERRANGE)
  DynamicCostsRangeL.Enabled = DynamicCosts.value * True
  DynamicCostsIncludePlantsCheck.value = IIf(TmpOpts.Costs(DYNAMICCOSTINCLUDEPLANTS) = 0, 0, 1)
     
End Sub



Private Sub LinearAgeCostCheck_Click()
  If LinearAgeCostCheck.value = 1 Then
    AgeCostLog.Enabled = False
  Else
    AgeCostLog.Enabled = True
  End If
  TmpOpts.Costs(AGECOSTMAKELINEAR) = LinearAgeCostCheck.value
End Sub

