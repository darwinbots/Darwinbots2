VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmPBMode 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Player Bot Mode Settings"
   ClientHeight    =   3420
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5865
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   5865
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame ffmSett 
      Height          =   3375
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5655
      Begin VB.CommandButton btnDel 
         Caption         =   "Delete"
         Height          =   375
         Left            =   1200
         TabIndex        =   6
         Top             =   2880
         Width           =   975
      End
      Begin VB.CommandButton btnAdd 
         Caption         =   "Add..."
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   2880
         Width           =   975
      End
      Begin VB.ListBox lstkey 
         Height          =   2460
         IntegralHeight  =   0   'False
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   5415
      End
      Begin VB.CommandButton btnLoad 
         Caption         =   "Load Preset..."
         Height          =   375
         Left            =   2760
         TabIndex        =   3
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton btnSave 
         Caption         =   "Save Preset..."
         Height          =   375
         Left            =   4200
         TabIndex        =   2
         Top             =   2880
         Width           =   1335
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label lblPress 
      Caption         =   "Press any key..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   5895
   End
End
Attribute VB_Name = "frmPBMode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private listpos As Integer

Private Sub btnAdd_Click()
ffmSett.Visible = False
lblPress.Visible = True
End Sub

Private Sub btnDel_Click()
If listpos = 0 Then Exit Sub
Dim i As Integer
For i = listpos To UBound(PB_keys) - 1
PB_keys(i) = PB_keys(i + 1)
Next
ReDim Preserve PB_keys(UBound(PB_keys) - 1)
relist
listpos = 0
End Sub

Private Sub btnLoad_Click()
Dim holdint As String
Dim i As Integer

CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "PlayerBot keys preset file(*.pbkp)|*.pbkp"
CommonDialog1.ShowOpen
If CommonDialog1.FileName <> "" Then
    ReDim PB_keys(0)
    Open CommonDialog1.FileName For Input As #80
        Do
            i = UBound(PB_keys)
            ReDim Preserve PB_keys(i + 1)
                Line Input #80, holdint
                PB_keys(i + 1).key = val(holdint)
                Line Input #80, holdint
                PB_keys(i + 1).memloc = val(holdint)
                Line Input #80, holdint
                PB_keys(i + 1).value = val(holdint)
                Line Input #80, holdint
                PB_keys(i + 1).Invert = holdint
        Loop Until EOF(80)
    Close #80
    relist
End If
End Sub

Private Sub btnSave_Click()
Dim i As Integer
CommonDialog1.FileName = ""
CommonDialog1.InitDir = MDIForm1.MainDir
CommonDialog1.Filter = "PlayerBot keys preset file(*.pbkp)|*.pbkp"
CommonDialog1.ShowSave
If CommonDialog1.FileName <> "" Then
    Open CommonDialog1.FileName For Output As #80
        For i = 1 To UBound(PB_keys)
            Print #80, PB_keys(i).key
            Print #80, PB_keys(i).memloc
            Print #80, PB_keys(i).value
            Print #80, PB_keys(i).Invert
        Next
    Close #80
End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Dim memloc As Double
Dim strmem As String
Dim strval As String
Dim value As Double
If lblPress.Visible Then

Do
    strmem = InputBox("Note: You must start a simulation before assigning by name. Enter a memory location to assign the key to:")
    If strmem = "" Then Exit Sub
    If IsNumeric(strmem) Then
        memloc = val(strmem)
    Else
        memloc = SysvarTok("." & strmem)
    End If
    If memloc = Int(memloc) And memloc > 0 And memloc < 1000 Then Exit Do
    MsgBox "Invalid memory location: " & memloc, vbCritical
Loop

Do
    strval = InputBox("Enter the value to assign to memory location " & memloc & ":")
    If strval = "" Then Exit Sub
    value = val(strval)
    If value = Int(value) And value >= -32000 And value <= 32000 Then Exit Do
    MsgBox "Invalid value: " & value, vbCritical
Loop

Dim i As Integer
i = UBound(PB_keys)

ReDim Preserve PB_keys(i + 1)
PB_keys(i + 1).key = CByte(KeyCode)
PB_keys(i + 1).memloc = CInt(memloc)
PB_keys(i + 1).value = CInt(value)
PB_keys(i + 1).Invert = MsgBox("Would you like to add this key inverted?", vbQuestion + vbYesNo) = vbYes
relist
ffmSett.Visible = True
lblPress.Visible = False
End If
End Sub

Private Sub relist()
lstkey.CLEAR
Dim i As Integer
For i = 1 To UBound(PB_keys)
  With PB_keys(i)
    lstkey.additem (IIf(.Invert, "Inverted ", "") & "Key: " & mapkey(.key) & "     Memory: " & mapmemory(.memloc) & "     Value: " & .value)
  End With
Next
End Sub


Private Function mapmemory(ByVal inmem As Integer) As String
On Error GoTo b:
mapmemory = SysvarDetok(inmem)
If Not IsNumeric(mapmemory) Then mapmemory = Right(mapmemory, Len(mapmemory) - 1)
Exit Function
b:
mapmemory = inmem
End Function


Private Function mapkey(ByVal inkey As Byte) As String
Dim i As Byte
Open App.path & "\keys.txt" For Input As #80
For i = 0 To inkey
Line Input #80, mapkey
Next
Close #80
End Function

Private Sub Form_Load()
relist
End Sub

Private Sub lstkey_Click()
listpos = lstkey.ListIndex + 1
End Sub
