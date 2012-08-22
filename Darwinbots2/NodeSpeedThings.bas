Attribute VB_Name = "NodeSpeedThings"
'Option Explicit
'
'Public Roborder(RobArrayMax) As Integer
'Public robocount As Integer
''by placing the order of access here instead
''of in the nodes only, we should speed up the program.
''just read the array incrementally until you hit a value of -1.
'
'Public Sub Sort_Robots_Roborder()
'Dim nd As node
'Dim x As Integer
'
'Set nd = rlist.firstrob
'  While Not nd Is rlist.last And x <= 1999
'    Roborder(x) = nd.robn
'    x = x + 1
'  Set nd = rlist.nextnode(nd)
'  Wend
'
'  robocount = x
'
'  Dim a As Integer
'  For a = x To UBound(rob())
'  Roborder(a) = -1
'  Next a
'
'  Sort_Roborder
'
'End Sub
'
'
'Public Sub Sort_Roborder()
''sort the robshoot array based on xpos's.
''this will save us alot of time later down the road.
''this will use the quicksort algorithm,
''because it's the fastest, even if it's the most complex
'
'  'quickSort
'  'Bubble_Sort
'  If Not Is_Sorted Then
'    Linear_Insertion_Sort
'  End If
'  'End If
'  'Shell_Sort
'
'  Dim a As Integer
'  For a = 0 To robocount - 1
'    rob(Roborder(a)).order = a
'  Next a
'
'End Sub
'
'Private Sub quickSort()
'  'q_sort 0, totalrobots - 1
'  Bubble_Sort
'  'bubble sort just to test out the algorithm
'End Sub
'
'Private Sub q_sort(Left As Integer, Right As Integer)
'
'  Dim Pivot As Integer
'  Dim l_hold As Integer
'  Dim r_hold As Integer
'
'  l_hold = Left
'  r_hold = Right
'  Pivot = Roborder(Left)
'  While (Left < Right)
'    While ((Roborder(Right) >= Pivot) And (Left < Right))
'      Right = Right - 1
'    Wend
'
'    If (Left <> Right) Then
'      Roborder(Left) = Roborder(Right)
'      Left = Left + 1
'    End If
'
'    While ((Roborder(Left) <= Pivot) And (Left < Right))
'      Left = Left + 1
'    Wend
'    If (Left <> Right) Then
'      Roborder(Right) = Roborder(Left)
'      Right = Right - 1
'    End If
'  Wend
'  Roborder(Left) = Pivot
'  Pivot = Left
'  Left = l_hold
'  Right = r_hold
'  If (Left < Pivot) Then q_sort Left, Pivot - 1
'  If (Right > Pivot) Then q_sort Pivot + 1, Right
'End Sub
'
'Private Sub Shell_Sort()
''this is a modified version of an insertion sort
''will work very well for our almost sorted data
'
'Dim inc As Integer
'Dim i As Integer
'Dim j As Integer
'Dim tmp As Long
'Dim tmpindex As Integer
'
'inc = robocount
'While inc > 0
'  i = 0
'  While i < robocount
'    j = i
'    tmp = rob(Roborder(i)).pos.x
'    tmpindex = Roborder(i)
'
'    If j < inc Then GoTo endwend
'    While (tmp < rob(Roborder(j - inc)).pos.x)
'      Roborder(j) = Roborder(j - inc)
'      j = j - inc
'      If j < inc Then GoTo endwend
'    Wend
'endwend:
'    tmp = rob(Roborder(j)).pos.x
'    i = i + 1
'  Wend
'
'  If inc / 2 <> 0 Then
'    inc = inc / 2
'  ElseIf inc = 1 Then
'    inc = 0
'  Else
'    inc = 1
'  End If
'Wend
'End Sub
'
'Private Function Is_Sorted() As Boolean
'  Dim a As Integer
'  For a = 0 To robocount - 1
'    If Roborder(a + 1) = -1 Then
'      Is_Sorted = True
'      Exit Function
'    End If
'    If Roborder(a) = Roborder(a + 1) Then
'      Is_Sorted = False
'      Exit Function
'    End If
'    If rob(Roborder(a)).pos.x > rob(Roborder(a + 1)).pos.x Then
'      Is_Sorted = False
'      Exit Function
'    End If
'  Next a
'  Is_Sorted = True
'End Function
'
'Private Sub Linear_Insertion_Sort()
'  Dim tmp As Long
'  Dim i As Long
'  Dim j As Long
'  Dim whilego As Boolean
'  Dim a As Long
'  Dim b As Long
'
'  For i = 1 To robocount - 1
'    j = i
'    whilego = True
'    If j = 0 Then whilego = False
'    While whilego
'      tmp = Roborder(j)
'      Roborder(j) = Roborder(j - 1)
'      Roborder(j - 1) = tmp
'
'      If Roborder(j) = 1 Then
'        j = j
'      End If
'
'      j = j - 1
'
'      If j = 0 Then whilego = False
'
'      If whilego Then
'        b = rob(Roborder(j)).pos.x
'        a = rob(Roborder(j - 1)).pos.x
'        If a <= b Then whilego = False
'      End If
'
'    Wend
'  Next i
'
'End Sub
'
'Private Sub Bubble_Sort()
'  Dim i As Integer
'  Dim j As Integer
'  Dim temp As Integer
'
'  For i = TotalRobots - 1 To 0 Step -1
'    For j = 1 To i
'      If rob(Roborder(j - 1)).pos.x > rob(Roborder(j)).pos.x Then
'        temp = Roborder(j - 1)
'        Roborder(j - 1) = Roborder(j)
'        Roborder(j) = temp
'      End If
'    Next j
'  Next i
'End Sub
