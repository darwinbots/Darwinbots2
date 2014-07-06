VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMonitorSet 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "RGB Memory Monitor Settings"
   ClientHeight    =   3255
   ClientLeft      =   60
   ClientTop       =   330
   ClientWidth     =   5895
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3255
   ScaleWidth      =   5895
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   120
      Top             =   2760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Save Preset..."
      Height          =   375
      Left            =   1560
      TabIndex        =   27
      Top             =   2760
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load Preset..."
      Height          =   375
      Left            =   120
      TabIndex        =   26
      Top             =   2760
      Width           =   1335
   End
   Begin VB.Frame ffmRed 
      Caption         =   "Blue"
      Height          =   2535
      Index           =   2
      Left            =   3960
      TabIndex        =   18
      Top             =   120
      Width           =   1815
      Begin VB.TextBox txtMem 
         Height          =   285
         Index           =   2
         Left            =   120
         TabIndex        =   24
         Text            =   "1"
         Top             =   480
         Width           =   855
      End
      Begin VB.Frame ffmRange 
         Caption         =   "Active Range"
         Height          =   1575
         Index           =   2
         Left            =   120
         TabIndex        =   19
         Top             =   840
         Width           =   1575
         Begin VB.TextBox txtCeil 
            Height          =   285
            Index           =   2
            Left            =   120
            TabIndex        =   21
            Text            =   "32000"
            Top             =   1080
            Width           =   855
         End
         Begin VB.TextBox txtFloor 
            Height          =   285
            Index           =   2
            Left            =   120
            TabIndex        =   20
            Text            =   "0"
            Top             =   480
            Width           =   855
         End
         Begin VB.Label Label3 
            Caption         =   "Ceiling:"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   23
            Top             =   840
            Width           =   615
         End
         Begin VB.Label Label2 
            Caption         =   "Floor:"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   22
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Label Label1 
         Caption         =   "Memory location:"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   25
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame ffmRed 
      Caption         =   "Green"
      Height          =   2535
      Index           =   1
      Left            =   2040
      TabIndex        =   10
      Top             =   120
      Width           =   1815
      Begin VB.Frame ffmRange 
         Caption         =   "Active Range"
         Height          =   1575
         Index           =   1
         Left            =   120
         TabIndex        =   12
         Top             =   840
         Width           =   1575
         Begin VB.TextBox txtFloor 
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   14
            Text            =   "0"
            Top             =   480
            Width           =   855
         End
         Begin VB.TextBox txtCeil 
            Height          =   285
            Index           =   1
            Left            =   120
            TabIndex        =   13
            Text            =   "32000"
            Top             =   1080
            Width           =   855
         End
         Begin VB.Label Label2 
            Caption         =   "Floor:"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   16
            Top             =   240
            Width           =   615
         End
         Begin VB.Label Label3 
            Caption         =   "Ceiling:"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   15
            Top             =   840
            Width           =   615
         End
      End
      Begin VB.TextBox txtMem 
         Height          =   285
         Index           =   1
         Left            =   120
         TabIndex        =   11
         Text            =   "1"
         Top             =   480
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Memory location:"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   17
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame ffmRed 
      Caption         =   "Red"
      Height          =   2535
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1815
      Begin VB.TextBox txtMem 
         Height          =   285
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Text            =   "1"
         Top             =   480
         Width           =   855
      End
      Begin VB.Frame ffmRange 
         Caption         =   "Active Range"
         Height          =   1575
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   840
         Width           =   1575
         Begin VB.TextBox txtCeil 
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   9
            Text            =   "32000"
            Top             =   1080
            Width           =   855
         End
         Begin VB.TextBox txtFloor 
            Height          =   285
            Index           =   0
            Left            =   120
            TabIndex        =   7
            Text            =   "0"
            Top             =   480
            Width           =   855
         End
         Begin VB.Label Label3 
            Caption         =   "Ceiling:"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   8
            Top             =   840
            Width           =   615
         End
         Begin VB.Label Label2 
            Caption         =   "Floor:"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   6
            Top             =   240
            Width           =   615
         End
      End
      Begin VB.Label Label1 
         Caption         =   "Memory location:"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   3240
      TabIndex        =   0
      Top             =   2760
      Width           =   1215
   End
End
Attribute VB_Name = "frmMonitorSet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public Monitor_mem_r As Integer
Public Monitor_mem_g As Integer
Public Monitor_mem_b As Integer
Public Monitor_floor_r As Integer
Public Monitor_floor_g As Integer
Public Monitor_floor_b As Integer
Public Monitor_ceil_r As Integer
Public Monitor_ceil_g As Integer
Public Monitor_ceil_b As Integer

Public overwrite As Boolean
Private okclick As Boolean

Private Sub btnCancel_Click()
Unload Me
End Sub

Private Sub btnOK_Click()
Monitor_mem_r = txtMem(0)
Monitor_mem_g = txtMem(1)
Monitor_mem_b = txtMem(2)
'
Monitor_floor_r = txtFloor(0)
Monitor_floor_g = txtFloor(1)
Monitor_floor_b = txtFloor(2)
'
Monitor_ceil_r = txtCeil(0)
Monitor_ceil_g = txtCeil(1)
Monitor_ceil_b = txtCeil(2)
'
okclick = True
Unload Me
End Sub

Private Sub Command1_Click() 'load a preset
Dim holdint As Integer

CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "Monitor preset file(*.mtrp)|*.mtrp"
CommonDialog1.ShowOpen
If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Binary As #80
        Get 80, , holdint
            txtMem(0).text = holdint
        Get 80, , holdint
            txtMem(1).text = holdint
        Get 80, , holdint
            txtMem(2).text = holdint
        '
        Get 80, , holdint
            txtFloor(0).text = holdint
        Get 80, , holdint
            txtFloor(1).text = holdint
        Get 80, , holdint
            txtFloor(2).text = holdint
        '
        Get 80, , holdint
            txtCeil(0).text = holdint
        Get 80, , holdint
            txtCeil(1).text = holdint
        Get 80, , holdint
            txtCeil(2).text = holdint
    Close #80
End If
End Sub

Private Sub Command2_Click() 'save a preset
CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "Monitor preset file(*.mtrp)|*.mtrp"
CommonDialog1.ShowSave
If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Binary As #80
        Put 80, , CInt(txtMem(0).text)
        Put 80, , CInt(txtMem(1).text)
        Put 80, , CInt(txtMem(2).text)
        '
        Put 80, , CInt(txtFloor(0).text)
        Put 80, , CInt(txtFloor(1).text)
        Put 80, , CInt(txtFloor(2).text)
        '
        Put 80, , CInt(txtCeil(0).text)
        Put 80, , CInt(txtCeil(1).text)
        Put 80, , CInt(txtCeil(2).text)
    Close #80
End If
End Sub

Private Sub Form_Load()
If overwrite Then
    txtMem(0) = Monitor_mem_r
    txtMem(1) = Monitor_mem_g
    txtMem(2) = Monitor_mem_b
    '
    txtFloor(0) = Monitor_floor_r
    txtFloor(1) = Monitor_floor_g
    txtFloor(2) = Monitor_floor_b
    '
    txtCeil(0) = Monitor_ceil_r
    txtCeil(1) = Monitor_ceil_g
    txtCeil(2) = Monitor_ceil_b
Else
    btnOK.Left = btnCancel.Left
    btnCancel.Visible = False
End If
overwrite = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
If Not okclick Then overwrite = btnCancel.Visible
End Sub

Private Sub txtCeil_LostFocus(Index As Integer)
Dim v As Double
v = val(txtCeil(Index))
If v < -32000 Then v = -32000
If v > 32000 Then v = 32000
If v < val(txtFloor(Index)) + 1 Then v = val(txtFloor(Index)) + 1
v = CInt(v)
txtCeil(Index) = v
End Sub

Private Sub txtFloor_LostFocus(Index As Integer)
Dim v As Double
v = val(txtFloor(Index))
If v < -32000 Then v = -32000
If v > 32000 Then v = 32000
If v > val(txtCeil(Index)) - 1 Then v = val(txtCeil(Index)) - 1
v = CInt(v)
txtFloor(Index) = v
End Sub

Private Sub txtMem_LostFocus(Index As Integer)

If Not IsNumeric(txtMem(Index)) Then
    
    txtMem(Index) = SysvarTok("." & txtMem(Index))
    
End If

    Dim v As Integer
    v = val(txtMem(Index))
    If v < 1 Then v = 1
    If v > 999 Then v = 999
    txtMem(Index) = v
End Sub
