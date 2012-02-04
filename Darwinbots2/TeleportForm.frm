VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form TeleportForm 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "New Teleporter"
   ClientHeight    =   6420
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   8790
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6420
   ScaleWidth      =   8790
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame5 
      Caption         =   "Internet Options"
      Height          =   1935
      Left            =   4800
      TabIndex        =   32
      Top             =   2880
      Width           =   3855
      Begin VB.TextBox intOutText 
         Height          =   285
         Left            =   240
         TabIndex        =   34
         Top             =   1440
         Width           =   3375
      End
      Begin VB.TextBox intInText 
         Height          =   285
         Left            =   240
         TabIndex        =   33
         Top             =   720
         Width           =   3375
      End
      Begin VB.Label inboundLabel 
         Caption         =   "Inbound Path"
         Height          =   255
         Left            =   240
         TabIndex        =   36
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label outboundLabel 
         Caption         =   "Outbound Path"
         Height          =   255
         Left            =   240
         TabIndex        =   35
         Top             =   1200
         Width           =   1335
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Statistics"
      Height          =   2415
      Left            =   120
      TabIndex        =   12
      Top             =   3840
      Width           =   4575
      Begin VB.Label NumTeleported 
         Caption         =   "0"
         Height          =   255
         Left            =   1800
         TabIndex        =   14
         Top             =   360
         Width           =   2055
      End
      Begin VB.Label Label3 
         Caption         =   "Total Teleported:"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Type"
      Height          =   3015
      Left            =   120
      TabIndex        =   7
      Top             =   720
      Width           =   4575
      Begin VB.OptionButton TeleportOption 
         Caption         =   "Internet"
         Enabled         =   0   'False
         Height          =   255
         Index           =   3
         Left            =   600
         TabIndex        =   31
         Top             =   960
         Width           =   975
      End
      Begin VB.TextBox BackFlowText 
         Height          =   285
         Left            =   2160
         TabIndex        =   30
         Text            =   "10"
         Top             =   2280
         Width           =   735
      End
      Begin VB.CheckBox TeleportVeggiesCheck 
         Caption         =   "Teleport Autotrophs"
         Height          =   195
         Left            =   2400
         TabIndex        =   23
         Top             =   600
         Width           =   1695
      End
      Begin VB.CheckBox TeleportCorpsesCheck 
         Caption         =   "Teleport Corpses"
         Height          =   195
         Left            =   2400
         TabIndex        =   22
         Top             =   840
         Width           =   1575
      End
      Begin VB.CheckBox TeleportHeterotrophsCheck 
         Caption         =   "Teleport Heterotrophs"
         Height          =   195
         Left            =   2400
         TabIndex        =   21
         Top             =   360
         Width           =   1935
      End
      Begin VB.TextBox BotsPerPoll 
         Height          =   285
         Left            =   2160
         TabIndex        =   19
         Text            =   "10"
         Top             =   1920
         Width           =   735
      End
      Begin VB.TextBox InboundCycleCheck 
         Height          =   285
         Left            =   2160
         TabIndex        =   16
         Text            =   "10"
         Top             =   1560
         Width           =   735
      End
      Begin VB.OptionButton TeleportOption 
         Caption         =   "Inbound"
         Height          =   255
         Index           =   0
         Left            =   600
         TabIndex        =   10
         Top             =   720
         Width           =   975
      End
      Begin VB.OptionButton TeleportOption 
         Caption         =   "Outbound"
         Height          =   255
         Index           =   1
         Left            =   600
         TabIndex        =   9
         Top             =   480
         Width           =   1095
      End
      Begin VB.OptionButton TeleportOption 
         Caption         =   "Intrasim"
         Height          =   255
         Index           =   2
         Left            =   600
         TabIndex        =   8
         Top             =   240
         Width           =   975
      End
      Begin VB.Label Label5 
         Caption         =   "Backflow Limit"
         Height          =   255
         Left            =   960
         TabIndex        =   29
         Top             =   2280
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "bots"
         Height          =   255
         Left            =   3000
         TabIndex        =   28
         Top             =   2280
         Width           =   1335
      End
      Begin VB.Label InboundLabel4 
         Caption         =   "bots in at a time"
         Height          =   255
         Left            =   3000
         TabIndex        =   20
         Top             =   1920
         Width           =   1455
      End
      Begin VB.Label InboundLabel3 
         Caption         =   "Teleport max of "
         Height          =   255
         Left            =   960
         TabIndex        =   18
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label InboundLabel2 
         Caption         =   "cycles"
         Height          =   255
         Left            =   3000
         TabIndex        =   17
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label InboundLabel1 
         Caption         =   "Check every"
         Height          =   255
         Left            =   1080
         TabIndex        =   15
         Top             =   1560
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Properties"
      Height          =   1935
      Left            =   4800
      TabIndex        =   5
      Top             =   720
      Width           =   3855
      Begin VB.Frame Frame2 
         Caption         =   "Size"
         Height          =   855
         Left            =   240
         TabIndex        =   24
         Top             =   960
         Width           =   3495
         Begin MSComctlLib.Slider TeleporterSizeSlider 
            Height          =   315
            Left            =   240
            TabIndex        =   25
            Top             =   480
            Width           =   3135
            _ExtentX        =   5530
            _ExtentY        =   556
            _Version        =   393216
            LargeChange     =   50
            SmallChange     =   10
            Min             =   100
            Max             =   1000
            SelStart        =   100
            TickFrequency   =   50
            Value           =   100
         End
         Begin VB.Label Label10 
            Caption         =   "Small"
            Height          =   255
            Left            =   240
            TabIndex        =   27
            Top             =   240
            Width           =   735
         End
         Begin VB.Label Label11 
            Caption         =   "Large"
            Height          =   255
            Left            =   2880
            TabIndex        =   26
            Top             =   240
            Width           =   495
         End
      End
      Begin VB.CheckBox RespectShapesCheck 
         Caption         =   "Respect Shapes"
         Enabled         =   0   'False
         Height          =   195
         Left            =   480
         TabIndex        =   11
         Top             =   600
         Width           =   1575
      End
      Begin VB.CheckBox FixedCheck 
         Caption         =   "Fixed"
         Height          =   195
         Left            =   480
         TabIndex        =   6
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   5280
      TabIndex        =   3
      Top             =   5760
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   7080
      TabIndex        =   2
      Top             =   5760
      Width           =   1215
   End
   Begin VB.TextBox NetworkPath 
      Height          =   285
      Left            =   1320
      TabIndex        =   0
      Text            =   "path"
      ToolTipText     =   "The folder or network share to use to exchange bots"
      Top             =   240
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "e.g.   c:\db   or  \\server\share"
      Height          =   255
      Left            =   4080
      TabIndex        =   4
      Top             =   240
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "File Path:"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "TeleportForm"
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


Public teleporterFormMode As Integer

Private Sub CancelButton_Click()
  Me.Hide
End Sub

Private Sub Form_Activate()
Dim aspectRatio As Single

 aspectRatio = SimOpts.FieldHeight / SimOpts.FieldWidth
 
 If teleporterFormMode = 0 Then
  teleporterDefaultWidth = 300
  TeleporterSizeSlider.value = teleporterDefaultWidth
  FixedCheck.value = False
  TeleportOption(2).value = True
  NetworkPath.Enabled = False
  TeleportVeggiesCheck.value = 1
  TeleportCorpsesCheck.value = 1
  TeleportHeterotrophsCheck.value = 1
  RespectShapesCheck.value = 0
  InboundCycleCheck.text = "10"
  BotsPerPoll = "10"
  intInText.text = IntOpts.InboundPath
  intOutText.text = IntOpts.OutboundPath
Else
  Me.Caption = "Teleporter Properties"
  With (Teleporters(teleporterFocus))
    NetworkPath.text = .path
    TeleporterSizeSlider.value = Int(.Width / aspectRatio)
    FixedCheck.value = (Not .driftHorizontal) * True
    TeleportOption(2).value = .local
    NetworkPath.Enabled = Not .local
    TeleportOption(1).value = .Out
    TeleportOption(0).value = .In
    TeleportOption(3).value = .Internet
    TeleportVeggiesCheck.value = .teleportVeggies * True
    TeleportCorpsesCheck.value = .teleportCorpses * True
    TeleportHeterotrophsCheck.value = .teleportHeterotrophs * True
    RespectShapesCheck.value = .RespectShapes * True
    NumTeleported.Caption = Str$(.NumTeleported)
    InboundCycleCheck.text = .InboundPollCycles
    BotsPerPoll.text = .BotsPerPoll
    intOutText.text = .intOutPath
    intInText.text = .intInPath
  End With
End If
End Sub

Private Sub OKButton_Click()
Dim i As Integer
Dim randomX As Single
Dim randomy As Single
Dim v As vector
Dim aspectRatio As Single
Dim realWidth As Single
Dim fso As FileSystemObject
Set fso = New FileSystemObject

  'Check to make sure interent paths are good
  If TeleportOption(3).value Then
    If Not (fso.FolderExists(intInText.text) And fso.FolderExists(intOutText.text)) Then
      MsgBox ("Internet paths must be set to a vaild directory.")
      Exit Sub
    End If
  End If

  aspectRatio = SimOpts.FieldHeight / SimOpts.FieldWidth
  realWidth = teleporterDefaultWidth * aspectRatio

  
  If teleporterFormMode = 0 Then
    i = Teleport.NewTeleporter(TeleportOption(0).value, TeleportOption(1).value, CSng(teleporterDefaultWidth), TeleportOption(3).value)
  Else
    i = teleporterFocus
  End If
  If i < 0 Then
    MsgBox ("Could not create Teleporter.")
  Else
    Teleporters(i).path = NetworkPath.text
    Teleporters(i).driftHorizontal = Not CBool(FixedCheck.value)
    Teleporters(i).driftVertical = Not CBool(FixedCheck.value)
    If FixedCheck.value Then Teleporters(i).vel = VectorSet(0, 0)
    Teleporters(i).local = TeleportOption(2).value
    Teleporters(i).In = TeleportOption(0).value
    Teleporters(i).Out = TeleportOption(1).value
    Teleporters(i).Internet = TeleportOption(3).value
    Teleporters(i).teleportVeggies = CBool(TeleportVeggiesCheck.value)
    Teleporters(i).teleportCorpses = CBool(TeleportCorpsesCheck.value)
    Teleporters(i).teleportHeterotrophs = CBool(TeleportHeterotrophsCheck.value)
    Teleporters(i).RespectShapes = CBool(RespectShapesCheck.value)
    Teleporters(i).Height = CSng(TeleporterSizeSlider.value)
    Teleporters(i).Width = CSng(TeleporterSizeSlider.value) * aspectRatio
    Teleporters(i).InboundPollCycles = CInt(val(InboundCycleCheck.text) Mod 32000)
    Teleporters(i).BotsPerPoll = CInt(val(BotsPerPoll.text) Mod 32000)
    Teleporters(i).PollCountDown = Teleporters(i).BotsPerPoll
    Teleporters(i).intInPath = intInText.text
    Teleporters(i).intOutPath = intOutText.text
        
  End If
  Me.Hide
  
End Sub

Private Sub TeleporterSizeSlider_Change()
  teleporterDefaultWidth = TeleporterSizeSlider.value
End Sub


Private Sub TeleportOption_Click(Index As Integer)
  If Index = 2 Or Index = 3 Then
    NetworkPath.Enabled = False
  Else
    NetworkPath.Enabled = True
  End If
  
  If Index = 1 Or Index = 2 Or Index = 3 Then
    TeleportHeterotrophsCheck.Enabled = True
    TeleportVeggiesCheck.Enabled = True
    TeleportCorpsesCheck.Enabled = True
  Else
    TeleportHeterotrophsCheck.Enabled = False
    TeleportVeggiesCheck.Enabled = False
    TeleportCorpsesCheck.Enabled = False
  End If
  
  If Index = 0 Or Index = 3 Then ' Outbound or Internet
    InboundLabel1.Enabled = True
    InboundLabel2.Enabled = True
    InboundLabel3.Enabled = True
    InboundLabel4.Enabled = True
    InboundCycleCheck.Enabled = True
    BotsPerPoll.Enabled = True
  Else 'Inbound
    InboundLabel1.Enabled = False
    InboundLabel2.Enabled = False
    InboundLabel3.Enabled = False
    InboundLabel4.Enabled = False
    InboundCycleCheck.Enabled = False
    BotsPerPoll.Enabled = False
  End If
  
  If Index = 3 Then 'Enable / Disable Internet controls
    TeleportOption(0).Enabled = False
    TeleportOption(1).Enabled = False
    TeleportOption(2).Enabled = False
    intInText.Enabled = True
    intOutText.Enabled = True
    inboundLabel.Enabled = True
    outboundLabel.Enabled = True
    TeleportCorpsesCheck.value = 0
    TeleportCorpsesCheck.Enabled = False
  Else
    TeleportOption(0).Enabled = True
    TeleportOption(1).Enabled = True
    TeleportOption(2).Enabled = True
    TeleportOption(3).Enabled = False
    intInText.Enabled = False
    intOutText.Enabled = False
    inboundLabel.Enabled = False
    outboundLabel.Enabled = False
  End If
End Sub

