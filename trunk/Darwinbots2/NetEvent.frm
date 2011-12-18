VERSION 5.00
Begin VB.Form NetEvent 
   BackColor       =   &H80000009&
   BorderStyle     =   0  'None
   Caption         =   "Network event"
   ClientHeight    =   1095
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2205
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "NetEvent.frx":0000
   ScaleHeight     =   1095
   ScaleWidth      =   2205
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Left            =   1755
      Top             =   630
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   195
      Left            =   780
      TabIndex        =   2
      Top             =   840
      Width           =   555
   End
   Begin VB.Label Netlab2 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BackStyle       =   0  'Transparent
      Caption         =   "Something happened!"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   500
      Left            =   90
      TabIndex        =   1
      Top             =   105
      Width           =   2010
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H80000012&
      BorderWidth     =   2
      Height          =   1095
      Left            =   0
      Top             =   0
      Width           =   2215
   End
   Begin VB.Label NetLab 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BackStyle       =   0  'Transparent
      Caption         =   "Something happened!"
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000007&
      Height          =   500
      Left            =   105
      TabIndex        =   0
      Top             =   135
      Width           =   2010
   End
End
Attribute VB_Name = "NetEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Mx As Single
Dim My As Single

Public Sub stayontop()
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub Form_Load()
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End Sub

Sub Appear(txt As String)
  Me.Left = MDIForm1.Left + MDIForm1.Width - Me.Width
  Me.top = MDIForm1.top
  NetLab.Caption = txt
  Netlab2.Caption = txt
  If OptionsForm.Visible = False Then
    Timer1.Interval = 5000
    Timer1.Enabled = True
    Me.Show
  End If
End Sub

Private Sub Form_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = x
  My = y
End Sub

Private Sub Form_MouseMove(button As Integer, Shift As Integer, x As Single, y As Single)
  If Mx > 0 Or My > 0 Then
    dx = x - Mx
    dy = y - My
    Me.Move Me.Left + dx, Me.top + dy
  End If
End Sub

Private Sub Form_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = 0
  My = 0
End Sub

Private Sub Label1_Click()
  Timer1.Enabled = False
  Me.Hide
End Sub

Private Sub NetLab_Change()
  Me.stayontop
End Sub

Private Sub NetLab_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = x
  My = y
End Sub

Private Sub NetLab_MouseMove(button As Integer, Shift As Integer, x As Single, y As Single)
  If Mx > 0 Or My > 0 Then
    dx = x - Mx
    dy = y - My
    Me.Move Me.Left + dx, Me.top + dy
    If Me.top < 0 Then Me.top = 0
  End If
End Sub

Private Sub NetLab_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = 0
  My = 0
End Sub

Private Sub NetLab2_MouseDown(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = x
  My = y
End Sub

Private Sub NetLab2_MouseMove(button As Integer, Shift As Integer, x As Single, y As Single)
  If Mx > 0 Or My > 0 Then
    dx = x - Mx
    dy = y - My
    Me.Move Me.Left + dx, Me.top + dy
    If Me.top < 0 Then Me.top = 0
  End If
End Sub

Private Sub NetLab2_MouseUp(button As Integer, Shift As Integer, x As Single, y As Single)
  Mx = 0
  My = 0
End Sub

Private Sub Timer1_Timer()
  Timer1.Enabled = False
  Me.Hide
End Sub
