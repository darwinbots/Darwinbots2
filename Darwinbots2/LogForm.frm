VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form LogForm 
   AutoRedraw      =   -1  'True
   Caption         =   "Internet Log window"
   ClientHeight    =   3225
   ClientLeft      =   555
   ClientTop       =   420
   ClientWidth     =   6465
   LinkTopic       =   "Form2"
   ScaleHeight     =   3225
   ScaleWidth      =   6465
   Begin RichTextLib.RichTextBox TextBox 
      Height          =   3075
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6360
      _ExtentX        =   11218
      _ExtentY        =   5424
      _Version        =   393217
      ReadOnly        =   -1  'True
      ScrollBars      =   3
      TextRTF         =   $"LogForm.frx":0000
   End
End
Attribute VB_Name = "LogForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim LogText As String

Public Sub AddLog(text As String)
  LogText = LogText + vbCrLf + CStr(Date) + " " + CStr(Time) + ": " + text
  TextBox.text = LogText
  TextBox.SelStart = Len(TextBox.text)
End Sub

Private Sub Form_Activate()
  TextBox.text = LogText
  TextBox.SelStart = Len(TextBox.text)
End Sub

Private Sub Form_Load()
  SetWindowPos hwnd, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End Sub

Private Sub Form_Resize()
  If Me.Width > 240 Then TextBox.Width = Me.Width - 240
  If Me.Height > 520 Then TextBox.Height = Me.Height - 520
End Sub

