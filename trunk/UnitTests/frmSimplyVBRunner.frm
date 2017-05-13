VERSION 5.00
Object = "{7983BD3B-752A-43EA-9BFF-444BBA1FC293}#4.0#0"; "SimplyVBUnit.Component.ocx"
Begin VB.Form frmSimplyVBRunner 
   Caption         =   "Form1"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9195
   LinkTopic       =   "Form1"
   ScaleHeight     =   5325
   ScaleWidth      =   9195
   StartUpPosition =   3  'Windows Default
   Begin SimplyVBComp.UIRunner UIRunner1 
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9135
      _ExtentX        =   16113
      _ExtentY        =   9128
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   177
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmSimplyVBRunner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : frmSimplyVBRunner
' Author    : dsaddan
' Date      : 08/05/2017
' Purpose   :
'---------------------------------------------------------------------------------------
Option Compare Text
Option Explicit

Const MOD_NAME = "frmSimplyVBRunner."

'---------------------------------------------------------------------------------------
' Module    : frmSimplyVBRunner
' Author    : dror
' Date      : 07/05/2017
' Purpose   :
'---------------------------------------------------------------------------------------
Private Sub Form_Load()
          
10        On Error GoTo func_err
          Const FUNC_NAME = MOD_NAME & "Form_Load"

20        AddTest New TestCommon
30    Exit Sub

func_err:
40        MsgBox "Error " & Err.Number & " in " & FUNC_NAME & "[" & Erl & "]" & "\" & Err.source & ": " & Err.Description
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'   Don't change anything below
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'---------------------------------------------------------------------------------------
' Procedure : Form_Initialize
' Author    : dsaddan
' Date      : 08/05/2017
' Purpose   :
' History   :
'---------------------------------------------------------------------------------------
Private Sub Form_Initialize()
10        On Error GoTo func_err
          Const FUNC_NAME = MOD_NAME & "Form_Initialize"

20        Call Me.UIRunner1.Init(App)
30    Exit Sub

func_err:
40        MsgBox "Error " & Err.Number & " in " & FUNC_NAME & "[" & Erl & "]" & "\" & Err.source & ": " & Err.Description
End Sub

'---------------------------------------------------------------------------------------
' Procedure : Form_KeyDown
' Author    : dsaddan
' Date      : 08/05/2017
' Purpose   : Enables the escape key to exit the tests for rapid testing.
' History   :
'---------------------------------------------------------------------------------------
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
10        On Error GoTo func_err
    Const FUNC_NAME = MOD_NAME & "Form_KeyDown"

20        If KeyCode = vbKeyEscape Then Call Unload(Me)
30    Exit Sub

func_err:
40        MsgBox "Error " & Err.Number & " in " & FUNC_NAME & "[" & Erl & "]" & "\" & Err.source & ": " & Err.Description
End Sub

