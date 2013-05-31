Attribute VB_Name = "QueryCompute"
Option Explicit
'our stack
Private Type Stack
  val(100) As Double
  pos As Integer
End Type
Private IntStack As Stack
'our stack manipulations
Private Sub PushIntStack(ByVal value As Double)
  Dim a As Integer
  
  If IntStack.pos >= 101 Then 'next push will overfill
    For a = 0 To 99
      IntStack.val(a) = IntStack.val(a + 1)
    Next a
    IntStack.val(100) = 0
    IntStack.pos = 100
  End If
  
  IntStack.val(IntStack.pos) = value
  IntStack.pos = IntStack.pos + 1
End Sub

Private Function PopIntStack() As Double
  IntStack.pos = IntStack.pos - 1
      
  If IntStack.pos = -1 Then
    IntStack.pos = 0
    IntStack.val(0) = 0
  End If
  
  PopIntStack = IntStack.val(IntStack.pos)
End Function

Private Sub ClearIntStack()
  IntStack.pos = 0
  IntStack.val(0) = 0
End Sub
Private Sub DNAadd()
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopIntStack
  a = PopIntStack
  
  If a > 2000000000 Then a = a Mod 2000000000
  If b > 2000000000 Then b = b Mod 2000000000
  
  c = a + b
  
  If Abs(c) > 2000000000 Then c = c - Sgn(c) * 2000000000
  PushIntStack c
End Sub

Private Sub DNASub() 'Botsareus 5/20/2012 new code to stop overflow
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopIntStack
  a = PopIntStack
  
  
  If a > 2000000000 Then a = a Mod 2000000000
  If b > 2000000000 Then b = b Mod 2000000000
  
  c = a - b
  
  If Abs(c) > 2000000000 Then c = c - Sgn(c) * 2000000000
  PushIntStack c
End Sub

Private Sub DNAmult()
  Dim a As Double
  Dim b As Double
  Dim c As Double
  b = PopIntStack
  a = PopIntStack
  c = CDbl(a) * CDbl(b)
  If Abs(c) > 2000000000 Then c = Sgn(c) * 2000000000
  PushIntStack CDbl(c)
End Sub

Private Sub DNAdiv()
  Dim a As Double
  Dim b As Double
  b = PopIntStack
  a = PopIntStack
  If b <> 0 Then
    PushIntStack a / b
  Else
    PushIntStack 0
  End If
End Sub
Private Sub DNApow()
    Dim a As Double
    Dim b As Double
    Dim c As Double
    b = PopIntStack
    a = PopIntStack
    
    If Abs(b) > 10 Then b = 10 * Sgn(b)
    
    If a = 0 Then
      c = 0
    Else
      c = a ^ b
    End If
    If Abs(c) > 2000000000 Then c = Sgn(c) * 2000000000
    PushIntStack c
End Sub

Function qcomp(ByVal query As String, ByVal min As Double, ByVal max As Double, ByVal absmin As Double, ByVal absmax As Double) As Double
'clear stack, this calculation
ClearIntStack
Dim splt() As String
splt = Split(query, " ")
Dim l As Integer
For l = 0 To UBound(splt)
'make sure data is lower case
splt(l) = LCase(splt(l))
'loop trough each element and compute it as nessisary
    If splt(l) = CStr(val(splt(l))) Then
        'push ze number
        PushIntStack (val(splt(l)))
    Else
        Select Case splt(l)
        Case "min"
            PushIntStack min
        Case "max"
            PushIntStack max
        Case "absmin"
            PushIntStack absmin
        Case "absmax"
            PushIntStack absmax
        Case "add"
            DNAadd
        Case "sub"
            DNASub
        Case "mult"
            DNAmult
        Case "div"
            DNAdiv
        Case "pow"
            DNApow
        End Select
    End If
Next
'return top of stack
qcomp = PopIntStack
End Function

