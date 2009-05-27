VERSION 5.00
Begin VB.Form ActivForm 
   AutoRedraw      =   -1  'True
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Genes Activations"
   ClientHeight    =   990
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5715
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   990
   ScaleWidth      =   5715
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox pbox 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   5715
      TabIndex        =   0
      Top             =   810
      Width           =   5715
   End
   Begin VB.Shape cornice2 
      Height          =   570
      Left            =   0
      Top             =   0
      Width           =   5715
   End
   Begin VB.Shape cornice 
      Height          =   240
      Left            =   0
      Top             =   555
      Width           =   5715
   End
End
Attribute VB_Name = "ActivForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim gb() As Integer

Public Sub NoFocus()
  Me.FillStyle = 0
  Me.FillColor = vbBlack
  Line (cornice.Left, cornice.Top)-(cornice.Left + cornice.Width, cornice.Top + cornice.Height), , B
  Line (cornice2.Left, cornice2.Top)-(cornice2.Left + cornice2.Width, cornice2.Top + cornice2.Height), , B
End Sub

Public Sub DrawGrid(ga() As Boolean)
  DrawStat ga()
  If UBound(gb) <> UBound(ga) Then
    ReDim gb(UBound(ga))
    SetLab ga()
  End If
  DrawDyn ga()
End Sub

Private Sub SetLab(ga() As Boolean)
  Dim t As Integer, d As Integer, da As Integer, stp As Single
  Dim cy As Long
  da = UBound(ga)
  If da = 0 Then da = 1
  stp = pbox.Width / da
  pbox.Cls
  If da < 25 Then
    'pbox.CurrentX = pbox.Left + (pbox.Width / da) / 2
    'pbox.Print "1";
    For t = 0 To da - 1
      pbox.CurrentX = pbox.Left + (pbox.Width / da) * t + (pbox.Width / da) / 2 - Len(CStr(t + 1)) * 40
      pbox.Print CStr(t + 1);
    Next t
  Else
    cy = pbox.CurrentY
    For t = 5 To da - 1 Step 5
      pbox.CurrentY = cy
      pbox.CurrentX = (pbox.ScaleWidth / da) * t + (pbox.ScaleWidth / da) / 2 - Len(CStr(t + 1)) * 40
      pbox.Print CStr(t);
      pbox.Line (stp * (t), 0)-Step(0, pbox.ScaleHeight / 2), vbBlack
    Next t
  End If
End Sub

Private Sub DrawStat(ga() As Boolean)
  Dim stp As Single, t As Integer, gn As Integer
  gn = UBound(ga)
  If gn = 0 Then Exit Sub ' EricL to prevent overflow
  stp = cornice.Width / gn
  Me.FillStyle = 0
  For t = 1 To gn
    If ga(t) Then
      Me.FillColor = vbGreen
    Else
      Me.FillColor = vbRed
    End If
    Me.Line (cornice.Left + stp * (t - 1), cornice.Top)-(cornice.Left + stp * (t), cornice.Top + cornice.Height), , B
  Next t
End Sub

Private Sub DrawDyn(ga() As Boolean)
  Dim stp As Single, t As Integer, gn As Integer
  Dim GrH As Single, ReH As Single
  gn = UBound(ga)
  If gn = 0 Then Exit Sub
  stp = cornice2.Width / gn
  Me.FillStyle = 0
  For t = 1 To gn
    If ga(t) Then
      gb(t) = gb(t) + (100 - gb(t)) / 5
      If gb(t) > 100 Then gb(t) = 100
    Else
      gb(t) = gb(t) - gb(t) / 5
      If gb(t) < 0 Then gb(t) = 0
    End If
    GrH = gb(t) / 100 * cornice2.Height
    ReH = cornice2.Height - GrH
    Me.FillColor = vbBlue
    Me.Line (cornice2.Left + stp * (t - 1), cornice2.Top)-(cornice2.Left + stp * (t), cornice2.Top + ReH), , B
    Me.FillColor = vbCyan
    Me.Line (cornice2.Left + stp * (t - 1), cornice2.Top + ReH)-(cornice2.Left + stp * (t), cornice2.Top + ReH + GrH), , B
  Next t
End Sub

Private Sub Form_Load()
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  ReDim gb(1)
End Sub

