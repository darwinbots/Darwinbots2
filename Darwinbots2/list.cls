VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "list"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' robots linked list
'
'  prev <--   fixed order    --> next
'  prev <--sorted by x coord --> next
'

Public head As New node
Public last As New node
Dim pcurr As node


Private Sub Class_Initialize()
  head.robn = 0
  last.robn = 0
  head.xpos = -10000
  last.xpos = 99999999
  Set head.pn = last
  Set head.orn = last
  Set head.pp = head
  Set head.orp = head
  Set last.pn = last
  Set last.orn = last
  Set last.pp = head
  Set last.orp = head
  Set pcurr = head
End Sub

Public Sub deleteall()
  head.robn = 0
  last.robn = 0
  head.xpos = -10000
  last.xpos = 99999999
  Set head.pn = last
  Set head.orn = last
  Set head.pp = head
  Set head.orp = head
  Set last.pn = last
  Set last.orn = last
  Set last.pp = head
  Set last.orp = head
  Set pcurr = head
End Sub

Public Sub addrobot(ind As Integer, ByVal xpos As Long)
  Dim k As node
  Set curr = New node
  Set last.pp.pn = curr
  Set curr.pp = last.pp
  Set curr.pn = last
  Set last.pp = curr
  curr.robn = ind
  curr.xpos = xpos
  Set k = head
  While k.xpos < xpos And k.xpos > 0
    Set k = k.orn
  Wend
  Set curr.orn = k
  Set curr.orp = k.orp
  Set k.orp.orn = curr
  Set k.orp = curr
End Sub

Public Sub delrobot(rob As node)
  Set rob.pp.pn = rob.pn
  Set rob.orp.orn = rob.orn
  Set rob.pn.pp = rob.pp
  Set rob.orn.orp = rob.orp
End Sub

Public Sub stay(ByVal rob As node, ByVal x As Long)
  Dim tmp As node
  If x < 0 Then x = 0
  rob.xpos = x
  Dim counter As Integer
  
  If rob.xpos > rob.orn.xpos Then
    Set tmp = rob.orn
    While rob.xpos > tmp.xpos
      Set tmp = tmp.orn
      counter = counter + 1
      If counter > 10000 Then Exit Sub
    Wend
    Set rob.orp.orn = rob.orn
    Set rob.orn.orp = rob.orp
    Set tmp.orp.orn = rob
    Set rob.orp = tmp.orp
    Set tmp.orp = rob
    Set rob.orn = tmp
  Else
    If rob.xpos < rob.orp.xpos Then
      Set tmp = rob.orp
      While rob.xpos < tmp.xpos
        Set tmp = tmp.orp
        counter = counter + 1
        If counter > 10000 Then Exit Sub
      Wend
      Set rob.orp.orn = rob.orn
      Set rob.orn.orp = rob.orp
      Set rob.orp = tmp
      Set rob.orn = tmp.orn
      Set tmp.orn = rob
      Set rob.orn.orp = rob
    End If
  End If
End Sub

Public Function nextnode(n As node) As node
  Set nextnode = n.pn
End Function

Public Function prevnode(n As node) As node
  Set prevnode = n.pp
End Function

Public Function nextorder(n As node) As node
  Set nextorder = n.orn
End Function

Public Function prevorder(n As node) As node
  Set prevorder = n.orp
End Function

Public Function firstrob() As node
  Set firstrob = head.pn
End Function

Public Function firstorder() As node
  Set firstorder = head.orn
End Function

Public Function firstnode() As node
  Set firstnode = head.pn
End Function

Public Function firstprox(ByVal n As node, dist As Integer) As node
  Dim xcurr As Long
  Dim ncurr As node
  Set ncurr = n
  xcurr = n.xpos
  Set n = n.orp
  While n.xpos + dist >= xcurr
    Set n = n.orp
  Wend
  Set firstprox = n.orn
End Function

Public Function firstpos(rsize As Integer, xpos As Single) As node
  Dim n As node
  Set n = head.orn
  While n.xpos + rsize < xpos And Not (n Is last)
    Set n = n.orn
  Wend
  Set firstpos = n
End Function

Public Function searchrob(ind As Integer) As node
  Dim tmp As node
  Set tmp = head.pn
  While tmp.robn <> ind And Not (tmp Is last)
    Set tmp = tmp.pn
  Wend
  Set searchrob = tmp
End Function

Public Sub printorder()
  Dim tmp As node
  Set tmp = head.orn
  While Not tmp Is last
    'Debug.Print tmp.robn, tmp.xpos
    Set tmp = tmp.orn
    Stop
  Wend
End Sub

Public Sub printmain()
  Dim tmp As node
  Set tmp = head.pn
  While Not tmp Is last
    'Debug.Print tmp.robn, tmp.xpos
    Set tmp = tmp.pn
  Wend
End Sub
