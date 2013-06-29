VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form parentele 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Parentele"
   ClientHeight    =   2790
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5220
   Icon            =   "parentele.frx":0000
   LinkTopic       =   "Form12"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2790
   ScaleWidth      =   5220
   StartUpPosition =   3  'Windows Default
   Tag             =   "9010"
   Begin VB.Frame Frame2 
      Height          =   2715
      Left            =   60
      TabIndex        =   0
      Top             =   0
      Width           =   5100
      Begin VB.CommandButton Command2 
         Caption         =   "Mostra tutta la linea di parentele"
         Height          =   375
         Left            =   1155
         TabIndex        =   7
         Tag             =   "9015"
         Top             =   1575
         Width           =   2535
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Evidenzia discendenti"
         Height          =   375
         Left            =   1365
         TabIndex        =   6
         Tag             =   "9014"
         Top             =   735
         Width           =   2070
      End
      Begin VB.TextBox Text1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   195
         Left            =   3045
         TabIndex        =   3
         Text            =   "4"
         Top             =   300
         Width           =   285
      End
      Begin VB.CommandButton Command4 
         Caption         =   "calcola"
         Height          =   315
         Left            =   1890
         TabIndex        =   1
         Tag             =   "9012"
         Top             =   255
         Width           =   975
      End
      Begin ComCtl2.UpDown UpDown1 
         Height          =   270
         Left            =   3435
         TabIndex        =   2
         Top             =   270
         Width           =   240
         _ExtentX        =   450
         _ExtentY        =   476
         _Version        =   327681
         Value           =   1
         BuddyControl    =   "Text1"
         BuddyDispid     =   196612
         OrigLeft        =   3435
         OrigTop         =   270
         OrigRight       =   3675
         OrigBottom      =   540
         Min             =   1
         SyncBuddy       =   -1  'True
         Wrap            =   -1  'True
         BuddyProperty   =   0
         Enabled         =   -1  'True
      End
      Begin VB.Line Line4 
         BorderColor     =   &H8000000C&
         X1              =   450
         X2              =   4545
         Y1              =   1350
         Y2              =   1350
      End
      Begin VB.Line Line3 
         BorderColor     =   &H80000009&
         X1              =   420
         X2              =   4515
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label Label5 
         Caption         =   "figlio"
         Height          =   225
         Left            =   3045
         TabIndex        =   10
         Tag             =   "9017"
         Top             =   2310
         Width           =   435
      End
      Begin VB.Label Label4 
         Caption         =   "genitore"
         Height          =   225
         Left            =   1365
         TabIndex        =   9
         Tag             =   "9016"
         Top             =   2310
         Width           =   645
      End
      Begin VB.Line Line2 
         BorderColor     =   &H8000000E&
         X1              =   2415
         X2              =   3885
         Y1              =   2205
         Y2              =   2205
      End
      Begin VB.Line Line1 
         BorderColor     =   &H8000000C&
         X1              =   1050
         X2              =   2415
         Y1              =   2205
         Y2              =   2205
      End
      Begin VB.Shape Shape2 
         BackColor       =   &H0000FFFF&
         BackStyle       =   1  'Opaque
         Height          =   225
         Left            =   3885
         Top             =   2100
         Width           =   225
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H0000FFFF&
         BackStyle       =   1  'Opaque
         Height          =   225
         Left            =   840
         Top             =   2100
         Width           =   225
      End
      Begin VB.Label Label3 
         Caption         =   "0"
         Height          =   255
         Left            =   1320
         TabIndex        =   8
         Top             =   300
         Width           =   555
      End
      Begin VB.Label Label1 
         Caption         =   "Discendenti :"
         Height          =   255
         Left            =   270
         TabIndex        =   5
         Tag             =   "9011"
         Top             =   300
         Width           =   930
      End
      Begin VB.Label Label2 
         Caption         =   "generazioni"
         Height          =   255
         Left            =   3780
         TabIndex        =   4
         Tag             =   "9013"
         Top             =   285
         Width           =   975
      End
   End
End
Attribute VB_Name = "parentele"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Dim maxrec As Integer
  If UpDown1.value > 0 Then
    maxrec = UpDown1.value
  Else
    maxrec = 1000
  End If
  Label3 = Str$(Form1.score(robfocus, 1, maxrec, 1))
End Sub

Private Sub Command2_Click()
  x = Str$(Form1.score(robfocus, 1, 1000, 2))
End Sub

Private Sub Command4_Click()
  calcolo
End Sub

Private Sub Form_Load()
  strings Me
  SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
  calcolo
End Sub

Sub mostra()
  calcolo
  parentele.Show vbModal
End Sub

Private Sub calcolo() 'Botsareus 6/22/2013 Fix for TotOffspring
  Dim maxrec As Integer
  If UpDown1.value > 0 Then
    maxrec = UpDown1.value
  Else
    maxrec = 1000
  End If
  Form1.TotalOffspring = 0
  Form1.score robfocus, 1, maxrec, 0
  Label3 = Form1.TotalOffspring
End Sub
