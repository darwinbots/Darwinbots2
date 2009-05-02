VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form LogForm 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Log window"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   6465
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6465
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox TextBox 
      Height          =   3075
      Left            =   45
      TabIndex        =   0
      Top             =   75
      Width           =   6360
      _ExtentX        =   11218
      _ExtentY        =   5424
      _Version        =   393217
      Enabled         =   -1  'True
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

Private Sub Form_Resize()
  If Me.Width > 240 Then TextBox.Width = Me.Width - 240
  If Me.Height > 520 Then TextBox.Height = Me.Height - 520
End Sub

