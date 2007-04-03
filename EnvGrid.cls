VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EnvGrid"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'' Experimental Environment Grid
'' the idea is quite obvious: using a grid to store
'' environment features (such as friction, swimming factor,
'' brownian motion, energy token for vegs, wall, etc).
'' Then one can draw, save and reload environment maps
'' with features distributed unequally, niches, etc.
'' My first idea (coming also from the discussions on the message board)
'' was of giving the user the ability to define "materials"
'' groups of features with a label name, and spreading them
'' in the grid
'
'' You can see the very first embryo of it in this way:
'' start a simulation, then pause the visual basic program,
'' go to the immediate pane and invoke initenv (simply write
'' initenv) and restart the program
'
''From Numsgil:
''This is how I'm thinking it should work:
''First off, you have materials.
''materials are things like sand, carbs, etc.
''some materials effect cells.  Some effect the physics of an area
''some do both.
''sand, for instance, increases friction.  If you have a cell
''packed to the brim with sand a bot shouldn't be able to get very far.
''note that the energy has to go somewhere, so maybe the bots could also try
''bouncing off of tightly packed sand.  Not sure how this would work.
'
'Dim grid(120, 90, 10) As Single
'
'Private Type material
'  Name As String
'  colour As Long
'  dat(10) As Single
'  conc As Single
'End Type
'
'Dim matlist(255) As material
'Public Sub InitGrid()
'  Dim x As Integer
'  Dim y As Integer
'  Dim z As Integer
'  ClearGrid
'  For z = 1 To 9
'    For x = 0 To 120
'      For y = 0 To 90
'        Select Case z
'          Case 1              '1=Nutrient (waste)
'            grid(x, y, z) = 0
'          Case 2, 3           '2=nitrate  3=phosphate
'            grid(x, y, z) = 0
'          Case 4              '4=Nutrient (waste)
'            grid(x, y, z) = 0
'          Case 5, 6           '5=Oxygen and 6=Carbon Dioxide
'            grid(x, y, z) = 128 + Int(Rnd * 20) - 10
'          Case 7, 8           '7=Silica  8=Calcium
'            grid(x, y, z) = 50 + Int(Rnd * 20) - 10
'        End Select
'      Next y
'    Next x
'  Next z
'
'End Sub
'Private Sub ClearGrid()
'  For z = 1 To 10
'    For x = 0 To 120
'      For y = 0 To 90
'        Select Case z
'          Case 1              '1=Nutrient (waste)
'            grid(x, y, z) = 0
'          Case 2              '3=Nutrient (Nitrate)
'            grid(x, y, z) = 0
'          Case 3              '2=Nutrient (phosphate)
'            grid(x, y, z) = 0
'          Case 4              '4=Nutrient (Sulfur)
'            grid(x, y, z) = 0
'          Case 5              '5=Oxygen
'            grid(x, y, z) = 0
'          Case 6              '6=CO2
'            grid(x, y, z) = 0
'          Case 7              '7 = silica
'            grid(x, y, z) = 0
'          Case 8              '8 = Calcium
'            grid(x, y, z) = 0
'          Case 9              '9=temperature
'            grid(x, y, z) = 20
'        End Select
'      Next y
'    Next x
'  Next z
'End Sub
'
'Private Function matnum(Name As String) As Integer
'  Dim t As Integer
'  t = 0
'  While matlist(t).Name <> "*end*" And matlist(t).Name <> Name
'    t = t + 1
'  Wend
'  If matlist(t).Name = "*end*" Then
'    t = -1
'  End If
'  matnum = t
'End Function
'
'Sub SetMainMat(dat() As Single)
'  For t = 0 To 10
'    matlist(0).dat(t) = dat(t)
'  Next t
'End Sub
'
'Public Sub DrawGrid(z)
'  Dim color1 As Long
'  Dim xx As Integer, yy As Integer
'  DrawWidth = 1
'
'  For xx = 0 To 119
'    For yy = 0 To 89
'      Select Case z
'        Case 1
'          color1 = RGB(grid(xx, yy, 1), grid(xx, yy, 1), 0)
'        Case 2
'          color1 = RGB(grid(xx, yy, 2), grid(xx, yy, 2), grid(xx, yy, 2))
'        Case 3
'          color1 = RGB(0, grid(xx, yy, 3), grid(xx, yy, 3))
'        Case 4
'          color1 = RGB(grid(xx, yy, 4), 0, 0)
'        Case 5
'          color1 = RGB(0, 0, grid(xx, yy, 5))
'        Case 6
'          color1 = RGB(grid(xx, yy, 6), 0, grid(xx, yy, 6))
'        Case 7
'          color1 = RGB(grid(xx, yy, 7), grid(xx, yy, 7), 125)
'        Case 8
'          color1 = RGB(0, grid(xx, yy, 8), 0)
'        Case 9
'          color1 = RGB(grid(xx, yy, 9), 100, 100)
'      End Select
'      Form1.Line (xx * 100, yy * 100)-(xx * 100 + 100, yy * 100 + 100), color1, BF
'    Next yy
'  Next xx
'
'  color1 = color1
'End Sub
'Public Sub RefreshGrid(z As Integer)
'  Dim Change As Single
'  Dim tot As Single
'  Dim val As Single
'  Dim Threshold As Integer
'  Threshold = 3
'  Change = 1
'  For xx = 0 To 120
'    For yy = 0 To 90
'      val = grid(xx, yy, z)
'
'        tot = 0
'        If xx < 90 Then
'          If grid(xx + 1, yy, z) - val > Threshold Then
'            grid(xx + 1, yy, z) = grid(xx + 1, yy, z) - Change
'            tot = tot + Change
'          End If
'        End If
'        If xx > 0 Then
'          If grid(xx - 1, yy, z) - val > Threshold Then
'            grid(xx - 1, yy, z) = grid(xx - 1, yy, z) - Change
'            tot = tot + Change
'          End If
'        End If
'        If yy < 90 Then
'          If grid(xx, yy + 1, z) - val > Threshold Then
'            grid(xx, yy + 1, z) = grid(xx, yy + 1, z) - Change
'            tot = tot + Change
'          End If
'        End If
'        If yy > 0 Then
'          If grid(xx, yy - 1, z) - val > Threshold Then
'            grid(xx, yy - 1, z) = grid(xx, yy - 1, z) - Change
'            tot = tot + Change
'          End If
'        End If
'        grid(xx, yy, z) = grid(xx, yy, z) + tot
'
'    Next yy
'  Next xx
'End Sub
'Public Sub ValueToGrid(x As Integer, y As Integer, z As Integer, nut As Integer)
'  Dim x1 As Integer
'  Dim y1 As Integer
'  x1 = Gridx(x)
'  y1 = Gridy(y)
'  If grid(x1, y1, z) + nut < 255 Then
'    grid(x1, y1, z) = grid(x1, y1, z) + nut
'  Else
'    grid(x1, y1, z) = 255
'  End If
'  x1 = x1
'End Sub
'Public Function Gridx(x As Integer)
'  Gridx = Int(x / 100)
'End Function
'Public Function Gridy(y As Integer)
'  Gridy = Int(y / 100)
'End Function
'Public Function Gridmat(x As Integer, y As Integer, z As Integer)
'  Gridmat = grid(Gridx(x), Gridy(y), z)
'End Function
'Public Property Get GetMat(x As Byte, y As Byte) As Variant
'  If x > 100 Then x = 100
'  If y > 100 Then y = 100
'  'GetMat = matlist(grid(x, Y)).dat
'End Property
