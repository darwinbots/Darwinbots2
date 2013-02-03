VERSION 5.00
Begin VB.Form MagLens 
   BackColor       =   &H00511206&
   Caption         =   "Magnifying Lens"
   ClientHeight    =   3735
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4890
   FillColor       =   &H00511206&
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3735
   ScaleWidth      =   4890
   ShowInTaskbar   =   0   'False
End
Attribute VB_Name = "MagLens"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Botsareusnotdone to be replaced later by zoom-in-follow
Option Explicit

Private Sub Form_Load()
   MagLens.Width = 2500
   MagLens.Height = 2500
   MagLens.ScaleWidth = MagLens.Width / 5
   MagLens.ScaleHeight = MagLens.Height / 5
End Sub

Public Function UpdateLens()
Dim SW As Single
Dim SH As Single
Dim X As Long
Dim Y As Long

X = MagLens.Left '+ (MagLens.Width / 2)
Y = MagLens.Top '+ (MagLens.Height / 2)

'MagLens.PaintPicture Form1.Image, _
'      0, _
'      0, _
'      MagLens.Width, _
'      MagLens.Height, _
'      X, _
'      Y, _
'      2500, _
'      2500
      
 'Form1.ScaleWidth = SW / 0.5
 'Form1.ScaleHeight = SW / 0.5
' MagLens.Lens.Picture = Form1.Image
' Form1.ScaleWidth = SW
' Form1.ScaleHeight = SW
 'MagLens.Lens.Scale (1000, 1000)-(2000, 2000)
 
End Function
