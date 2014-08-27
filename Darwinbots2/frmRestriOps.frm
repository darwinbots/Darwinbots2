VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmRestriOps 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Restriction Options"
   ClientHeight    =   4320
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   7290
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   7290
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnLoad 
      Caption         =   "Load Preset..."
      Height          =   375
      Left            =   120
      TabIndex        =   27
      Top             =   3840
      Width           =   1335
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "Save Preset..."
      Height          =   375
      Left            =   1560
      TabIndex        =   26
      Top             =   3840
      Width           =   1335
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "Apply"
      Height          =   375
      Left            =   6000
      TabIndex        =   2
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Frame ffmNChlr 
      Caption         =   "For Non-Repupulating Robots"
      Height          =   3735
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   3495
      Begin VB.Frame ffmP 
         Caption         =   "Property Applied Restrictions"
         Height          =   2415
         Left            =   120
         TabIndex        =   16
         Top             =   1200
         Width           =   3255
         Begin VB.CheckBox MutEnabledCheck 
            Caption         =   "Disable Mutations"
            Height          =   330
            Left            =   120
            TabIndex        =   17
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1715
            Width           =   2430
         End
         Begin VB.CheckBox VirusImmuneCheck 
            Caption         =   "Virus Immune"
            Height          =   330
            Left            =   120
            TabIndex        =   18
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1475
            Width           =   2430
         End
         Begin VB.CheckBox DisableMovementSysvarsCheck 
            Caption         =   "Disable Voluntary Movement"
            Height          =   330
            Left            =   120
            TabIndex        =   19
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1985
            Width           =   2430
         End
         Begin VB.CheckBox DisableReproductionCheck 
            Caption         =   "Disable Reproduction"
            Height          =   330
            Left            =   120
            TabIndex        =   24
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1225
            Width           =   2430
         End
         Begin VB.CheckBox DisableDNACheck 
            Caption         =   "Disable DNA Execution"
            Height          =   330
            Left            =   120
            TabIndex        =   20
            ToolTipText     =   "Speeds up the simulation by turning off DNA execution for this species"
            Top             =   995
            Width           =   2430
         End
         Begin VB.CheckBox DisableVisionCheck 
            Caption         =   "Disable Vision"
            Height          =   330
            Left            =   120
            TabIndex        =   21
            ToolTipText     =   "Speeds up the simulation by turning off vision for this species"
            Top             =   745
            Width           =   2430
         End
         Begin VB.CheckBox chkNoChlr 
            Caption         =   "Disable Chloroplasts"
            Height          =   210
            Left            =   120
            TabIndex        =   23
            ToolTipText     =   "Feed automatically this type (only for vegetables)"
            Top             =   320
            Width           =   2430
         End
         Begin VB.CheckBox BlockSpec 
            Caption         =   "Fixed in place"
            Height          =   330
            Left            =   120
            TabIndex        =   22
            Top             =   515
            Width           =   2430
         End
      End
      Begin VB.Frame ffmKillNChlr 
         Caption         =   "Fatal Restrictions"
         Height          =   975
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   3255
         Begin VB.CheckBox chkDQKillNChlr 
            Caption         =   "Kill robot if it is disqualified from league"
            Height          =   255
            Left            =   120
            TabIndex        =   7
            Top             =   600
            Width           =   3015
         End
         Begin VB.CheckBox chkMBKillNChlr 
            Caption         =   "Kill robot if robot not MB for 150 cycles"
            Height          =   375
            Left            =   120
            TabIndex        =   5
            ToolTipText     =   "For Multi-bots"
            Top             =   240
            Width           =   3015
         End
      End
   End
   Begin VB.Frame ffmChlr 
      Caption         =   "For Repupulating Robots"
      Height          =   3375
      Left            =   3720
      TabIndex        =   0
      Top             =   0
      Width           =   3495
      Begin VB.Frame ffmPChlr 
         Caption         =   "Property Applied Restrictions"
         Height          =   2055
         Left            =   120
         TabIndex        =   9
         Top             =   1200
         Width           =   3255
         Begin VB.CheckBox DisableMovementSysvarsCheckVeg 
            Caption         =   "Disable Voluntary Movement"
            Height          =   330
            Left            =   120
            TabIndex        =   12
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1680
            Width           =   2550
         End
         Begin VB.CheckBox MutEnabledCheckVeg 
            Caption         =   "Disable Mutations"
            Height          =   330
            Left            =   120
            TabIndex        =   10
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1440
            Width           =   2430
         End
         Begin VB.CheckBox VirusImmuneCheckVeg 
            Caption         =   "Virus Immune"
            Height          =   330
            Left            =   120
            TabIndex        =   11
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   1200
            Width           =   2430
         End
         Begin VB.CheckBox DisableReproductionCheckChlr 
            Caption         =   "Disable Reproduction"
            Height          =   330
            Left            =   120
            TabIndex        =   25
            ToolTipText     =   "Disables voluntary movement for this species"
            Top             =   960
            Width           =   2430
         End
         Begin VB.CheckBox DisableDNACheckVeg 
            Caption         =   "Disable DNA Execution"
            Height          =   330
            Left            =   120
            TabIndex        =   13
            ToolTipText     =   "Speeds up the simulation by turning off DNA execution for this species"
            Top             =   720
            Width           =   2430
         End
         Begin VB.CheckBox DisableVisionCheckVeg 
            Caption         =   "Disable Vision"
            Height          =   330
            Left            =   120
            TabIndex        =   14
            ToolTipText     =   "Speeds up the simulation by turning off vision for this species"
            Top             =   480
            Width           =   2430
         End
         Begin VB.CheckBox BlockSpecVeg 
            Caption         =   "Fixed in place"
            Height          =   330
            Left            =   120
            TabIndex        =   15
            Top             =   240
            Width           =   2430
         End
      End
      Begin VB.Frame ffmkillChlr 
         Caption         =   "Fatal Restrictions"
         Height          =   975
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   3255
         Begin VB.CheckBox chkDQKillChlr 
            Caption         =   "Kill robot if it is disqualified from league"
            Height          =   375
            Left            =   120
            TabIndex        =   8
            Top             =   520
            Width           =   3015
         End
         Begin VB.CheckBox chkMBKillChlr 
            Caption         =   "Kill robot if robot not MB for 150 cycles"
            Height          =   375
            Left            =   120
            TabIndex        =   6
            ToolTipText     =   "For Multi-bots"
            Top             =   240
            Width           =   3015
         End
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "frmRestriOps"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public res_state As Byte

Private Sub btnOK_Click()
Dim t As Integer
'save based on state
Select Case res_state
Case 0
 TmpOpts.Specie(optionsform.CurrSpec).kill_mb = chkMBKillChlr.value * True
 TmpOpts.Specie(optionsform.CurrSpec).dq_kill = chkDQKillChlr.value * True
Case 1
 TmpOpts.Specie(optionsform.CurrSpec).kill_mb = chkMBKillNChlr.value * True
 TmpOpts.Specie(optionsform.CurrSpec).dq_kill = chkDQKillNChlr.value * True
Case 2
 x_res_kill_mb = chkMBKillNChlr.value * True
 x_res_other = chkNoChlr.value + BlockSpec.value * 2 + DisableVisionCheck.value * 4 + _
    DisableDNACheck.value * 8 + DisableReproductionCheck.value * 16 + _
    VirusImmuneCheck.value * 32 + DisableMovementSysvarsCheck.value * 64
 x_res_kill_mb_veg = chkMBKillChlr.value * True
 x_res_other_veg = BlockSpecVeg.value + DisableVisionCheckVeg.value * 2 + _
    DisableDNACheckVeg.value * 4 + DisableReproductionCheckChlr.value * 8 + _
    VirusImmuneCheckVeg.value * 16 + DisableMovementSysvarsCheckVeg.value * 32
Case 3
  'overwrite current simulation with given rules
  For t = 1 To MaxRobs
    If rob(t).exist Then
      If rob(t).Veg Then
       rob(t).multibot_time = IIf(chkMBKillChlr.value * True, 210, 0)
       If rob(t).dq <> 2 Then rob(t).dq = chkDQKillChlr.value
       '
       rob(t).Fixed = BlockSpecVeg.value * True
       If rob(t).Fixed Then
        rob(t).mem(216) = 1
        rob(t).vel.x = 0
        rob(t).vel.y = 0
       End If
       rob(t).CantSee = DisableVisionCheckVeg.value * True
       rob(t).DisableDNA = DisableDNACheckVeg.value * True
       rob(t).CantReproduce = DisableReproductionCheckChlr.value * True
       rob(t).VirusImmune = VirusImmuneCheckVeg.value * True
       If x_restartmode = 0 Then rob(t).Mutables.Mutations = MutEnabledCheckVeg.value = 0
       rob(t).DisableMovementSysvars = DisableMovementSysvarsCheckVeg.value * True
      Else
       rob(t).multibot_time = IIf(chkMBKillNChlr.value * True, 210, 0)
       If rob(t).dq <> 2 Then rob(t).dq = chkDQKillNChlr.value
       '
       rob(t).NoChlr = chkNoChlr.value * True
       rob(t).Fixed = BlockSpec.value * True
       If rob(t).Fixed Then
        rob(t).mem(216) = 1
        rob(t).vel.x = 0
        rob(t).vel.y = 0
       End If
       rob(t).CantSee = DisableVisionCheck.value * True
       rob(t).DisableDNA = DisableDNACheck.value * True
       rob(t).CantReproduce = DisableReproductionCheck.value * True
       rob(t).VirusImmune = VirusImmuneCheck.value * True
       If x_restartmode = 0 Then rob(t).Mutables.Mutations = MutEnabledCheck.value = 0
       rob(t).DisableMovementSysvars = DisableMovementSysvarsCheck.value * True
      End If
    End If
  Next
Case 4
 y_res_kill_mb = chkMBKillNChlr.value * True
 y_res_other = chkNoChlr.value + BlockSpec.value * 2 + DisableVisionCheck.value * 4 + _
    DisableDNACheck.value * 8 + DisableReproductionCheck.value * 16 + _
    VirusImmuneCheck.value * 32 + DisableMovementSysvarsCheck.value * 64
 y_res_kill_mb_veg = chkMBKillChlr.value * True
 y_res_other_veg = BlockSpecVeg.value + DisableVisionCheckVeg.value * 2 + _
    DisableDNACheckVeg.value * 4 + DisableReproductionCheckChlr.value * 8 + _
    VirusImmuneCheckVeg.value * 16 + DisableMovementSysvarsCheckVeg.value * 32
 y_res_kill_dq = chkDQKillNChlr.value * True
 y_res_kill_dq_veg = chkDQKillChlr.value * True
End Select
Unload Me
End Sub

Private Sub Form_Activate()
Dim lastmod As Byte
Dim holdother As Byte
'configure form based on possible states
'step1 reset everything
ffmChlr.Visible = True
ffmNChlr.Visible = True
ffmP.Visible = True
ffmPChlr.Visible = True
ffmkillChlr.Visible = True
ffmKillNChlr.Visible = True
chkDQKillChlr.Visible = True
chkDQKillNChlr.Visible = True
btnLoad.Visible = False
btnSave.Visible = False
If x_restartmode = 0 Then
    MutEnabledCheck.Visible = True
    MutEnabledCheckVeg.Visible = True
Else
    MutEnabledCheck.Visible = False
    MutEnabledCheckVeg.Visible = False
End If
'step2 reconfigure
Select Case res_state
Case 0 'just kills for veg
    ffmNChlr.Visible = False
    ffmPChlr.Visible = False
    Caption = "Restriction Options: " & TmpOpts.Specie(optionsform.CurrSpec).Name
    '
    chkMBKillChlr.value = TmpOpts.Specie(optionsform.CurrSpec).kill_mb * True
    chkDQKillChlr.value = TmpOpts.Specie(optionsform.CurrSpec).dq_kill * True
    '
Case 1 'just kills for Nveg
    ffmChlr.Visible = False
    ffmP.Visible = False
    Caption = "Restriction Options: " & TmpOpts.Specie(optionsform.CurrSpec).Name
    '
    chkMBKillNChlr.value = TmpOpts.Specie(optionsform.CurrSpec).kill_mb * True
    chkDQKillNChlr.value = TmpOpts.Specie(optionsform.CurrSpec).dq_kill * True
    '
Case 2 'league
    MutEnabledCheck.Visible = False
    MutEnabledCheckVeg.Visible = False
    '
    chkDQKillChlr.Visible = False
    chkDQKillNChlr.Visible = False
    Caption = "League Restriction Options"
    '
    chkMBKillNChlr.value = x_res_kill_mb * True
    '
        holdother = x_res_other
    '
        lastmod = holdother Mod 2
    chkNoChlr.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    BlockSpec.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableVisionCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableDNACheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableReproductionCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    VirusImmuneCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableMovementSysvarsCheck.value = lastmod
    '
    chkMBKillChlr.value = x_res_kill_mb_veg * True
    '
        holdother = x_res_other_veg
    '
        lastmod = holdother Mod 2
    BlockSpecVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableVisionCheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableDNACheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableReproductionCheckChlr.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    VirusImmuneCheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableMovementSysvarsCheckVeg.value = lastmod
Case 3
    Caption = "Restriction Options: Active simulation"
    btnLoad.Visible = True
    btnSave.Visible = True
Case 4
    MutEnabledCheck.Visible = False
    MutEnabledCheckVeg.Visible = False
    '
    Caption = "Evolution Restriction Options"
    '
    chkMBKillNChlr.value = y_res_kill_mb * True
    '
        holdother = y_res_other
    '
        lastmod = holdother Mod 2
    chkNoChlr.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    BlockSpec.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableVisionCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableDNACheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableReproductionCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    VirusImmuneCheck.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableMovementSysvarsCheck.value = lastmod
    '
    chkMBKillChlr.value = y_res_kill_mb_veg * True
    '
        holdother = y_res_other_veg
    '
        lastmod = holdother Mod 2
    BlockSpecVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableVisionCheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableDNACheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableReproductionCheckChlr.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    VirusImmuneCheckVeg.value = lastmod
        holdother = (holdother - lastmod) / 2
        lastmod = holdother Mod 2
    DisableMovementSysvarsCheckVeg.value = lastmod
    '
    chkDQKillNChlr.value = y_res_kill_dq * True
    '
    chkDQKillChlr.value = y_res_kill_dq_veg * True
End Select
End Sub

Private Sub btnLoad_Click()
Dim val As String
CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "Restriction preset file(*.resp)|*.resp"
CommonDialog1.ShowOpen
If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Input As #80
        Line Input #80, val
        chkMBKillNChlr.value = val
        Line Input #80, val
        chkDQKillNChlr.value = val
        Line Input #80, val
        chkNoChlr.value = val
        Line Input #80, val
        BlockSpec.value = val
        Line Input #80, val
        DisableVisionCheck.value = val
        Line Input #80, val
        DisableDNACheck.value = val
        Line Input #80, val
        DisableReproductionCheck.value = val
        Line Input #80, val
        VirusImmuneCheck.value = val
        Line Input #80, val
        MutEnabledCheck.value = val
        Line Input #80, val
        DisableMovementSysvarsCheck.value = val
        '
        Line Input #80, val
        chkMBKillChlr.value = val
        Line Input #80, val
        chkDQKillChlr.value = val
        Line Input #80, val
        BlockSpecVeg.value = val
        Line Input #80, val
        DisableVisionCheckVeg.value = val
        Line Input #80, val
        DisableDNACheckVeg.value = val
        Line Input #80, val
        DisableReproductionCheckChlr.value = val
        Line Input #80, val
        VirusImmuneCheckVeg.value = val
        Line Input #80, val
        MutEnabledCheckVeg.value = val
        Line Input #80, val
        DisableMovementSysvarsCheckVeg.value = val
    Close #80
End If
End Sub

Private Sub btnSave_Click()
CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "Restriction preset file(*.resp)|*.resp"
CommonDialog1.ShowSave
If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Output As #80
        Print #80, chkMBKillNChlr.value
        Print #80, chkDQKillNChlr.value
        Print #80, chkNoChlr.value
        Print #80, BlockSpec.value
        Print #80, DisableVisionCheck.value
        Print #80, DisableDNACheck.value
        Print #80, DisableReproductionCheck.value
        Print #80, VirusImmuneCheck.value
        Print #80, MutEnabledCheck.value
        Print #80, DisableMovementSysvarsCheck.value
        '
        Print #80, chkMBKillChlr.value
        Print #80, chkDQKillChlr.value
        Print #80, BlockSpecVeg.value
        Print #80, DisableVisionCheckVeg.value
        Print #80, DisableDNACheckVeg.value
        Print #80, DisableReproductionCheckChlr.value
        Print #80, VirusImmuneCheckVeg.value
        Print #80, MutEnabledCheckVeg.value
        Print #80, DisableMovementSysvarsCheckVeg.value
    Close #80
End If
End Sub
