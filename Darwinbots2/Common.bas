Attribute VB_Name = "Common"
'vectors are not done as an object (class)
'to save speed.  Object calls, especially functions,
'slow things alot

'try it as a class if you like, but be sure to get out a profiler and
'see what kind of speed cut we're talking about

Option Explicit

Public Type vector
  x As Single
  y As Single
End Type

Declare Function GetInputState Lib "user32" () As Long
'Declare Function FastInvSqrt Lib "FastMath" (ByRef x As Single) As Single

Public Const PI As Single = 3.14159265
Public timerthis As Long

Declare Function GetTickCount Lib "kernel32.dll" () As Long

Public Function nextlowestmultof2(ByVal value As Integer) 'Botsareus 2/18/2014
Dim a As Integer
a = 1
Do
a = a * 2
Loop Until a > value
nextlowestmultof2 = a / 2
End Function

Public Function TargetDNASize(ByVal size As Integer) As Integer 'Botsareus 3/16/2014
Dim Max As Integer
Dim i As Integer
Dim overload As Double
Max = 250
For i = 1 To size
If i > Max Then
    overload = (5000 - Max) / 4750
    If overload < 0 Then overload = 0
    Max = Max + 10 + overload * 250
End If
Next
TargetDNASize = Max
End Function


Public Function Random(low, hi) As Long
  Random = Int((hi - low + 1) * Rnd + low)
  If hi < low And hi = 0 Then Random = 0
End Function

Public Function fRnd(ByVal low As Long, ByVal up As Long) As Long
  fRnd = CLng(Rnd * (up - low + 1) + low)
End Function

'Gauss returns a gaussian number centered at the
'mean with a standard deviation of stddev
'in theory anyway
Public Function Gauss(ByVal StdDev As Single, Optional ByVal Mean As Single = 0#) As Single

  'gasdev returns a gauss value with unit variance centered at 0
  
  'Protection against crazy values
  If Mean < -32000# Then Mean = -32000#
  If Mean > 32000# Then Mean = 32000#
  
  'Or is it Gauss = gasdev * stddev * stddev + mean
  If (Abs(StdDev) < 0.0000001 And StdDev <> 0#) Or Abs(StdDev) > 32000# Then ' Prevents underflows for very small or large stdDev
    Gauss = Mean + gasdev
    'StdDev = 1#               ' Reset the StdDev.  Likely a mutation took it too small or too large.
  Else
    Gauss = gasdev * StdDev + Mean
  End If
  
  If Gauss > 32000# Then Gauss = 32000#
  If Gauss < -32000# Then Gauss = -32000#
End Function

Private Function gasdev() As Single
  Static iset As Integer
  Static gset As Single
  Dim fac As Single, rsq As Single, V1 As Single, V2 As Single
  
  If (iset = 0) Then
    Do
      V1 = 2# * Rnd() - 1#
      V2 = 2# * Rnd() - 1#
      rsq = V1 * V1 + V2 * V2
    Loop While (rsq >= 1# Or rsq = 0#)
    fac = Sqr(-2# * Log(rsq) / rsq)
    gset = V1 * fac
    iset = 1
    gasdev = V2 * fac
  Else
    iset = 0
    gasdev = gset
  End If
End Function

'Vectors.  Wow does this make stuff easier
Public Function Dot(V1 As vector, V2 As vector) As Single
  Dot = V1.x * V2.x + V1.y * V2.y
End Function

Public Function Cross(V1 As vector, V2 As vector) As Single
  Cross = V1.x * V2.y - V1.y * V2.x
End Function

Public Function VectorAdd(V1 As vector, V2 As vector) As vector
  VectorAdd.x = V1.x + V2.x
  VectorAdd.y = V1.y + V2.y
End Function

Public Function VectorSub(V1 As vector, V2 As vector) As vector
  VectorSub.x = V1.x - V2.x
  VectorSub.y = V1.y - V2.y
End Function

Public Function VectorScalar(V1 As vector, k As Single) As vector
  VectorScalar.x = V1.x * k
  VectorScalar.y = V1.y * k
End Function


Public Function VectorUnit(V1 As vector) As vector 'unit vector.  Called vector unit to keep nomenclature consistant
  Dim mag As Single
  
  mag = VectorInvMagnitude(V1)
  
  VectorUnit.x = V1.x * mag
  VectorUnit.y = V1.y * mag

End Function

Public Function VectorMagnitude(V1 As vector) As Single
  ' This might seem overly complicated compared to sqr(X^2 + Y^2),
  ' But it gives better numerical behavior
  Dim minVal As Single
  Dim maxVal As Single
  minVal = Min(Abs(V1.x), Abs(V1.y))
  maxVal = Max(Abs(V1.x), Abs(V1.y))
  If maxVal < 0.00001 Then
    VectorMagnitude = 0
  Else
    VectorMagnitude = maxVal * Sqr(1 + (minVal / maxVal) ^ 2)
  End If
End Function

Public Function VectorInvMagnitude(V1 As vector) As Single
  'VectorInvMagnitude = FastInvSqrt(v1.x * v1.x + v1.y * v1.y)
  
  Dim mag As Single
  mag = VectorMagnitude(V1)
  
  If mag = 0# Then
    VectorInvMagnitude = -1#
  Else
    VectorInvMagnitude = 1# / mag
  End If
End Function

Public Function VectorMagnitudeSquare(V1 As vector) As Single
  VectorMagnitudeSquare = V1.x * V1.x + V1.y * V1.y
End Function

Public Function VectorSet(ByVal x As Single, ByVal y As Single) As vector
  VectorSet.x = x
  VectorSet.y = y
End Function

Public Function VectorMax(ByRef x As vector, ByRef y As vector) As vector
    VectorMax.x = Max(x.x, y.x)
    VectorMax.y = Max(x.y, y.y)
End Function

Public Function VectorMin(ByRef x As vector, ByRef y As vector) As vector
    VectorMin.x = Min(x.x, y.x)
    VectorMin.y = Min(x.y, y.y)
End Function

Public Function Max(ByVal x As Single, ByVal y As Single) As Single
    If (x > y) Then
        Max = x
        Exit Function
    End If
    Max = y
End Function

Public Function Min(ByVal x As Single, ByVal y As Single) As Single
    If (x < y) Then
        Min = x
        Exit Function
    End If
    Min = y
End Function

Public Sub restarter()
    traycleanup
    shell App.path & "\Restarter.exe " & App.path & "\" & App.EXEName
End Sub

Private Sub traycleanup()
On Error Resume Next
If HideDB Then
    MDIForm1.Show
    Form1.t.Remove
    MDIForm1.stealthmode = False
End If
End Sub


