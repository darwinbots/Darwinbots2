VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form ColorForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Custom Color"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5070
   Icon            =   "colorform.frx":0000
   LinkTopic       =   "Form12"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1695
   ScaleWidth      =   5070
   StartUpPosition =   3  'Windows Default
   Tag             =   "9001"
   Begin VB.CommandButton UseColor 
      Caption         =   "Use This Color"
      Height          =   375
      Left            =   1200
      TabIndex        =   7
      Top             =   1200
      Width           =   2415
   End
   Begin MSComctlLib.Slider SliderR 
      Height          =   225
      Left            =   1470
      TabIndex        =   4
      Top             =   420
      Width           =   2850
      _ExtentX        =   5027
      _ExtentY        =   397
      _Version        =   393216
      Max             =   255
      TickStyle       =   3
   End
   Begin MSComctlLib.Slider SliderG 
      Height          =   225
      Left            =   1470
      TabIndex        =   5
      Top             =   630
      Width           =   2850
      _ExtentX        =   5027
      _ExtentY        =   397
      _Version        =   393216
      Max             =   255
      TickStyle       =   3
   End
   Begin MSComctlLib.Slider SliderB 
      Height          =   225
      Left            =   1470
      TabIndex        =   6
      Top             =   840
      Width           =   2850
      _ExtentX        =   5027
      _ExtentY        =   397
      _Version        =   393216
      Max             =   255
      TickStyle       =   3
   End
   Begin VB.Label LabelB 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   195
      Left            =   855
      TabIndex        =   3
      Top             =   780
      Width           =   450
   End
   Begin VB.Label LabelG 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   195
      Left            =   855
      TabIndex        =   2
      Top             =   585
      Width           =   450
   End
   Begin VB.Label LabelR 
      Alignment       =   1  'Right Justify
      Caption         =   "0"
      Height          =   195
      Left            =   855
      TabIndex        =   1
      Top             =   390
      Width           =   450
   End
   Begin VB.Label Label1 
      Caption         =   "R G  B"
      Height          =   615
      Left            =   4455
      TabIndex        =   0
      Top             =   405
      Width           =   195
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H80000001&
      BackStyle       =   1  'Opaque
      Height          =   690
      Left            =   210
      Shape           =   1  'Square
      Top             =   330
      Width           =   615
   End
End
Attribute VB_Name = "ColorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim rval As Long
Dim gval As Long
Dim bval As Long
Public OldColor As Long
Public UseThisColor As Boolean
Public color As Long
Public SelectColor As Boolean

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  OldColor = color
  setcolor color
End Sub

Private Sub Form_terminate()
  
  UseThisColor = True
  Unload Me
End Sub

Private Sub SliderG_Scroll()
  gval = SliderG.value
  LabelG.Caption = Str$(gval)
  dispcolor
End Sub

Private Sub SliderR_Scroll()
  rval = SliderR.value
  LabelR.Caption = Str$(rval)
  dispcolor
End Sub

Private Sub SliderB_Scroll()
  bval = SliderB.value
  LabelB.Caption = Str$(bval)
  dispcolor
End Sub

Private Sub dispcolor()
  color = bval * 65536 + gval * 256 + rval
  Shape1.BackColor = color
End Sub

Sub setcolor(col As Long)
  bval = Int(col / 65536)
  col = col - bval * 65536
  gval = Int(col / 256)
  rval = col - gval * 256
  SliderB.value = bval
  SliderR.value = rval
  SliderG.value = gval
  LabelG.Caption = Str$(gval)
  LabelB.Caption = Str$(bval)
  LabelR.Caption = Str$(rval)
  dispcolor
  
End Sub

Private Sub UseColor_Click()
  UseThisColor = True
  SelectColor = True
  Unload Me
End Sub
