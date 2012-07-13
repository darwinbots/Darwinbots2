Attribute VB_Name = "Common"
'vectors are not done as an object (class)
'to save speed.  Object calls, especially functions,
'slow things alot

'try it as a class if you like, but be sure to get out a profiler and
'see what kind of speed cut we're talking about

Option Explicit

Public Type vector
  x As Single
  Y As Single
  magnitude As Single 'the only function that should
    '_EVER_ address this is VectorMagnitude
End Type

Declare Function GetInputState Lib "user32" () As Long
'Declare Function FastInvSqrt Lib "FastMath" (ByRef x As Single) As Single

Public Const PI As Single = 3.14159265
Public timerthis As Long

Declare Function GetTickCount Lib "kernel32.dll" () As Long

Public Function Random(low, up) As Long
  Random = Int((up - low + 1) * Rnd + low)
  If up < low And up = 0 Then Random = 0
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
  Dot = V1.x * V2.x + V1.Y * V2.Y
End Function

Public Function Cross(V1 As vector, V2 As vector) As Single
  Cross = V1.x * V2.Y - V1.Y * V2.x
End Function

Public Function VectorAdd(V1 As vector, V2 As vector) As vector
  VectorAdd.x = V1.x + V2.x
  VectorAdd.Y = V1.Y + V2.Y
End Function

Public Function VectorSub(V1 As vector, V2 As vector) As vector
  VectorSub.x = V1.x - V2.x
  VectorSub.Y = V1.Y - V2.Y
End Function

Public Function VectorScalar(V1 As vector, k As Single) As vector
  VectorScalar.x = V1.x * k
  VectorScalar.Y = V1.Y * k
End Function


Public Function VectorUnit(V1 As vector) As vector 'unit vector.  Called vector unit to keep nomenclature consistant
  Dim mag As Single
  
  mag = VectorInvMagnitude(V1)
  
  VectorUnit.x = V1.x * mag
  VectorUnit.Y = V1.Y * mag

End Function

Public Function VectorMagnitude(V1 As vector) As Single
'  If VectorMagnitudeSquare(V1) <> (V1.magnitude * V1.magnitude) Then
'    V1.magnitude = Sqr(V1.x ^ 2 + V1.y ^ 2)
'  End If
  V1.magnitude = Sqr(V1.x ^ 2 + V1.Y ^ 2)
  VectorMagnitude = V1.magnitude
End Function

Public Function VectorInvMagnitude(V1 As vector) As Single
  'VectorInvMagnitude = FastInvSqrt(v1.x * v1.x + v1.y * v1.y)
    
  If V1.x = 0# And V1.Y = 0# Then
    VectorInvMagnitude = -1#
  Else
    VectorInvMagnitude = 1# / Sqr(V1.x * V1.x + V1.Y * V1.Y)
  End If
End Function

Public Function VectorMagnitudeSquare(V1 As vector) As Single
  VectorMagnitudeSquare = V1.x * V1.x + V1.Y * V1.Y
End Function

Public Function VectorSet(ByVal x As Single, ByVal Y As Single) As vector
  VectorSet.x = x
  VectorSet.Y = Y
End Function

Public Function VectorMax(ByRef x As vector, ByRef Y As vector) As vector
    VectorMax.x = Max(x.x, Y.x)
    VectorMax.Y = Max(x.Y, Y.Y)
End Function

Public Function VectorMin(ByRef x As vector, ByRef Y As vector) As vector
    VectorMin.x = Min(x.x, Y.x)
    VectorMin.Y = Min(x.Y, Y.Y)
End Function

Public Function Max(ByVal x As Single, ByVal Y As Single) As Single
    If (x > Y) Then
        Max = x
        Exit Function
    End If
    
    Max = Y
End Function

Public Function Min(ByVal x As Single, ByVal Y As Single) As Single
    If (x < Y) Then
        Min = x
        Exit Function
    End If
    
    Min = Y
End Function