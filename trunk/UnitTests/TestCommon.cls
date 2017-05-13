VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TestCommon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : TestCommon
' Author    : dror
' Date      : 07/05/2017
' Purpose   : Test DB2 Common.bas module
'---------------------------------------------------------------------------------------
Const MOD_NAME = "TestCommon."
Option Explicit

Const FLOAT_COMPARISON_TOLERANCE As Single = 0.0001!

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Random
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Random_Minus10To10_I_Less_Than_J()
    Dim r As Long
    Dim I As Long, j As Long
    
    For I = -10 To 10
        For j = I To 20
            r = Random(I, j)
            Assert.That r >= I And r <= j, Iz.True, "Random(" & I & "," & j & ") ==> " & r & " must be between " & I & " to " & j & "."
        Next
    Next
End Sub
Public Sub Random_Minus10To10_I_Bigger_Than_J()
    Dim r As Long
    Dim I As Long, j As Long
    
    For j = -10 To 10
        For I = j To 10
            r = Random(I, j)
            Assert.That r <= I And r >= j, Iz.True, "Random(" & I & "," & j & ") ==> " & r & " must be between " & j & " to " & I & "."
        Next
    Next
End Sub
Public Sub Random_J_Less_I_Is_0()
    Dim r As Long
    r = Random(10, 0)
    Assert.AreEqual 0, r, "Random(10, 0) ==> " & r & " must be 0."
End Sub
Public Sub Random_Very_Large_Numbers()
    Dim r As Long
    Dim I As Long, j As Long
    
    For I = 1000001 To 1000010
        For j = I To I + 10
            r = Random(I, j)
            Assert.That r >= I And r <= j, Iz.True, "Random(" & I & "," & j & ") ==> " & r & " must be between " & I & " to " & j & "."
        Next
    Next
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'fRnd
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub fRnd_Positive_I_Less_Than_J()
    Dim r As Long
    Dim I As Long, j As Long
    
    For I = 10 To 20
        For j = I To 20
            r = fRnd(I, j)
            Assert.That r >= I And r <= j, Iz.True, "fRnd(" & I & "," & j & ") ==> " & r & " must be between " & I & " to " & j & "."
        Next
    Next
End Sub
Public Sub fRnd_Minus10To10_I_Less_Than_J()
    Dim r As Long
    Dim I As Long, j As Long
    
    For I = -10 To 10
        For j = I To 20
            r = fRnd(I, j)
            Assert.That r >= I And r <= j, Iz.True, "fRnd(" & I & "," & j & ") ==> " & r & " must be between " & I & " to " & j & "."
        Next
    Next
End Sub
Public Sub fRnd_Minus10To10_I_Bigger_Than_J()
    Dim r As Long
    Dim I As Long, j As Long
    
    For j = -10 To 10
        For I = j To 10
            r = fRnd(I, j)
            Assert.That r <= I And r >= j, Iz.True, "fRnd(" & I & "," & j & ") ==> " & r & " must be between " & j & " to " & I & "."
        Next
    Next
End Sub
Public Sub fRnd_Very_Large_Numbers()
    Dim r As Long
    Dim I As Long, j As Long
    
    For I = 1000001 To 1000010
        For j = I To I + 10
            r = fRnd(I, j)
            Assert.That r >= I And r <= j, Iz.True, "fRnd(" & I & "," & j & ") ==> " & r & " must be between " & I & " to " & j & "."
        Next
    Next
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Vectors - Dot
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Vector_Dot_Zero()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
        
    r = Dot(V1, V2)
    
    Assert.AreEqualFloats 0!, r, FLOAT_COMPARISON_TOLERANCE, "Dot(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 0."
End Sub
Public Sub Vector_Dot_Postive()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = 10.4: V1.Y = 20.67
    V2.X = 5.98: V2.Y = 3.25
    
    r = Dot(V1, V2)
    
    Assert.AreEqualFloats 129.3695!, r, FLOAT_COMPARISON_TOLERANCE, "Dot(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 129.3695!."
End Sub
Public Sub Vector_Dot_Negative()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = -100: V1.Y = -20.7
    V2.X = -5.3: V2.Y = -3.6
    
    r = Dot(V1, V2)
    
    Assert.AreEqualFloats 604.52!, r, FLOAT_COMPARISON_TOLERANCE, "Dot(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 604.52!."
End Sub
Public Sub Vector_Dot_Mixed()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = 10.1: V1.Y = 20.987
    V2.X = -5.567: V2.Y = -3.6431
    
    r = Dot(V1, V2)
    
    Assert.AreEqualFloats -132.6844!, r, FLOAT_COMPARISON_TOLERANCE, "Dot(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be -132.6844!"
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Vectors - Cross
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Vector_Cross_Zero()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
        
    r = Cross(V1, V2)
    
    Assert.AreEqualFloats 0!, r, FLOAT_COMPARISON_TOLERANCE, "Cross(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 0."
End Sub
Public Sub Vector_Cross_Postive()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = 10.4: V1.Y = 20.67
    V2.X = 5.98: V2.Y = 3.25
    
    r = Cross(V1, V2)
    
    Assert.AreEqualFloats -89.8066!, r, FLOAT_COMPARISON_TOLERANCE, "Cross(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be -89.8066!."
End Sub
Public Sub Vector_Cross_Negative()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = -100: V1.Y = -20.7
    V2.X = -5.3: V2.Y = -3.6
    
    r = Cross(V1, V2)
    
    Assert.AreEqualFloats 250.29!, r, FLOAT_COMPARISON_TOLERANCE, "Cross(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 250.29!."
End Sub
Public Sub Vector_Cross_Mixed()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As Single
    
    V1.X = 10.1: V1.Y = 20.987
    V2.X = -5.567: V2.Y = -3.6431
    
    r = Cross(V1, V2)
    
    Assert.AreEqualFloats 80.03932!, r, FLOAT_COMPARISON_TOLERANCE, "Cross(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & r & " must be 80.03932!"
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Vectors - Add
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Vector_Add_Zero()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
        
    r = VectorAdd(V1, V2)
    
    Assert.AreEqualFloats 0!, r.X, FLOAT_COMPARISON_TOLERANCE, "Add(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [0,0]."
    Assert.AreEqualFloats 0!, r.Y, FLOAT_COMPARISON_TOLERANCE, "Add(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [0,0]."
End Sub
Public Sub Vector_Add_Postive()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10.4: V1.Y = 20.67
    V2.X = 5.98: V2.Y = 3.25
    
    r = VectorAdd(V1, V2)
    
    Assert.AreEqualFloats 16.38!, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [16.38,23.92]."
    Assert.AreEqualFloats 23.92!, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [16.38,23.92]."
End Sub
Public Sub Vector_Add_Negative()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = -100: V1.Y = -20.7
    V2.X = -5.3: V2.Y = -3.6
    
    r = VectorAdd(V1, V2)
    
    Assert.AreEqualFloats -105.3!, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [-105.3,-24.3]."
    Assert.AreEqualFloats -24.3!, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [-105.3,-24.3]."
End Sub
Public Sub Vector_Add_Mixed()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10.1: V1.Y = 20.987
    V2.X = -5.567: V2.Y = -3.6431
    
    r = VectorAdd(V1, V2)
    
    Assert.AreEqualFloats 4.533!, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [4.533,17.3439]."
    Assert.AreEqualFloats 17.3439!, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [4.533,17.3439]."
End Sub
Public Sub Vector_Add_Mixed_Large_Numbers()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10000000.12345: V1.Y = 2000001
    V2.X = -5000001.567: V2.Y = -300000.7
    
    r = VectorAdd(V1, V2)
    
    Assert.AreEqualFloats V1.X + V2.X, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X + V2.X) & " ," & (V1.Y + V2.Y) & "]."
    Assert.AreEqualFloats V1.Y + V2.Y, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorAdd(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X + V2.X) & " ," & (V1.Y + V2.Y) & "]."
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Vectors - Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Vector_Sub_Zero()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
        
    r = VectorSub(V1, V2)
    
    Assert.AreEqualFloats 0!, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [0,0]."
    Assert.AreEqualFloats 0!, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [0,0]."
End Sub
Public Sub Vector_Sub_Postive()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10.4: V1.Y = 20.67
    V2.X = 5.98: V2.Y = 3.25
    
    r = VectorSub(V1, V2)
    
    Assert.AreEqualFloats V1.X - V2.X, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
    Assert.AreEqualFloats V1.Y - V2.Y, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
End Sub
Public Sub Vector_Sub_Negative()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = -100: V1.Y = -20.7
    V2.X = -5.3: V2.Y = -3.6
    
    r = VectorSub(V1, V2)
    
    Assert.AreEqualFloats V1.X - V2.X, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
    Assert.AreEqualFloats V1.Y - V2.Y, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
End Sub
Public Sub Vector_Sub_Mixed()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10.1: V1.Y = 20.987
    V2.X = -5.567: V2.Y = -3.6431
    
    r = VectorSub(V1, V2)
    
    Assert.AreEqualFloats V1.X - V2.X, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
    Assert.AreEqualFloats V1.Y - V2.Y, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
End Sub
Public Sub Vector_Sub_Mixed_Large_Numbers()
    Dim V1 As vector
    Dim V2 As vector
    Dim r As vector
    
    V1.X = 10000000.12345: V1.Y = 2000001
    V2.X = -5000001.567: V2.Y = -300000.7
    
    r = VectorSub(V1, V2)
    
    Assert.AreEqualFloats V1.X - V2.X, r.X, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
    Assert.AreEqualFloats V1.Y - V2.Y, r.Y, FLOAT_COMPARISON_TOLERANCE, "VectorSub(" & PrintVector(V1) & ", " & PrintVector(V2) & ") ==> " & PrintVector(r) & " must be [" & (V1.X - V2.X) & " ," & (V1.Y + V2.Y) & "]."
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Gauss
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Gauss_1000_Simple()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(1)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats 0, r, 0.05!
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 1!, r, 0.1!, "Gauss(1) ==> expected StdDev is 1!"
End Sub
Public Sub Gauss_1000()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(45.34, 789.349)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats 789.349, r, 5
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 45.34, r, 5
End Sub
Public Sub Gauss_1000_Negative()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(45.34, -789.349)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats -789.349, r, 5
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 45.34, r, 5
End Sub
Public Sub Gauss_1000_Large_Mean()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(45.34, 1000000)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats 32000!, r, 50
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 45.34!, r, 5, "Gauss(45.34, 1000000) ==> expected StdDev is 45.34"
End Sub
Public Sub Gauss_1000_Small_Mean()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(45.34, -1000000)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats -32000!, r, 50
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 45.34!, r, 5, "Gauss(45.34, -1000000) ==> expected StdDev is 45.34"
End Sub
Public Sub Gauss_1000_Small_Std()
    Dim Numbers(1000) As Single
    Dim r As Single
    Dim I As Long
    
    For I = 0 To UBound(Numbers)
        Numbers(I) = Gauss(0.0005!, 70)
    Next
    
    r = Mean(Numbers)
    Assert.AreEqualFloats 70!, r, 1
    r = StandardDeviation(Numbers)
    Assert.AreEqualFloats 0.0005!, r, 0.001!, "Gauss(0.0005!, 70) ==> expected StdDev is 0.0005!"
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Max
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Max_Positive()
    
    Assert.AreEqualFloats 0.0005!, Max(0.0005!, 0.0001!), 0, "Max(0.0005!, 0.0001!) ==> expected is 0.0005!"
    Assert.AreEqualFloats 2000!, Max(2000!, 2000!), 0, "Max(2000!, 2000!) ==> expected is 2000!"
End Sub
Public Sub Max_Negative()
    
    Assert.AreEqualFloats 0.0001!, Max(-0.0005!, 0.0001!), 0, "Max(0.0005!, 0.0001!) ==> expected is 0.0001!"
    Assert.AreEqualFloats -2000.1!, Max(-2000.1!, -2001.1!), 0, "Max(-2000.1!, -2001.1!) ==> expected is -2000.1!"
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Min
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub Min_Positive()
    
    Assert.AreEqualFloats 0.0001!, Min(0.0005!, 0.0001!), 0, "Min(0.0005!, 0.0001!) ==> expected is 0.0001!"
    Assert.AreEqualFloats 2000!, Min(2000!, 2000!), 0, "Min(2000!, 2000!) ==> expected is 2000!"
End Sub
Public Sub Min_Negative()
    
    Assert.AreEqualFloats -0.0005!, Min(-0.0005!, 0.0001!), 0, "Min(0.0005!, 0.0001!) ==> expected is -0.0005!"
    Assert.AreEqualFloats -2001.1!, Min(-2000.1!, -2001.1!), 0, "Min(-2000.1!, -2001.1!) ==> expected is -2001.1!"
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'NextLowestMultOf2
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub NextLowestMultOf2_Positive()
    Assert.AreEqual 1, NextLowestMultOf2(0)
    Assert.AreEqual 1, NextLowestMultOf2(1)
    Assert.AreEqual 2, NextLowestMultOf2(2)
    Assert.AreEqual 512, NextLowestMultOf2(512)
    Assert.AreEqual 512, NextLowestMultOf2(513)
    Assert.AreEqual 512, NextLowestMultOf2(1023)
End Sub
Public Sub NextLowestMultOf2_Negative()
    Assert.AreEqual 1, NextLowestMultOf2(-512)
    Assert.AreEqual 1, NextLowestMultOf2(-513)
    Assert.AreEqual 1, NextLowestMultOf2(-1023)
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'rndy
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub rndy_simple()
    Dim r As Single
    Dim I As Long
    
    UseIntRnd = False
    
    For I = 1 To 10
        r = rndy()
        Assert.That r >= 0 And r <= 1, Iz.True, "rndy() ==> " & r & " must be between 0 to 1."
    Next
End Sub

Public Sub rndy_Using_UseIntRnd()
    Dim r As Single
    Dim I As Long
    
    UseIntRnd = True
    
    For I = 1 To 10
        r = rndy()
        Assert.That r >= 0 And r <= 1, Iz.True, "rndy() ==> " & r & " must be between 0 to 1."
    Next
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Utils
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Function PrintVector(v As vector) As String
    PrintVector = "[" & v.X & "," & v.Y & "]"
End Function

'---------------------------------------------------------------------------------------
' Procedure : Mean
' Author    : dsaddan
' Date      : 08/05/2017
' Purpose   : Calculates the Arithmetic Mean or Average of a Set of Numbers
' History   :
'---------------------------------------------------------------------------------------
Private Function Mean(Numbers() As Single) As Single
10        On Error GoTo func_err
          Const FUNC_NAME = MOD_NAME & "Mean"

          Dim Total As Single
          Dim Cnt As Integer
          Dim I As Long
          
20        For I = 0 To UBound(Numbers)
30            Total = Total + Numbers(I)
40            Cnt = Cnt + 1
50        Next
          
60        Mean = Total / Cnt
70    Exit Function

func_err:
80        Err.Raise Err.Number, FUNC_NAME & "[" & Erl & "]" & "\" & Err.source, Err.Description

End Function

'---------------------------------------------------------------------------------------
' Procedure : StandardDeviation
' Author    : dsaddan
' Date      : 08/05/2017
' Purpose   :
'   Calculates the Standard Deviation of a Population from which a Sample is selected
'   Standard Deviation (S) = ((Sum(XNumber-Mean)^2)/(Count-1))^0.5
'   Where XNumber is a number in a set of numbers
'   Mean is the Mean of the set of numbers
'   Count is the number of members in the set
' History   :
'---------------------------------------------------------------------------------------
Private Function StandardDeviation(Numbers() As Single) As Single
10        On Error GoTo func_err
    Const FUNC_NAME = MOD_NAME & "StandardDeviation"
   
          Dim Variance As Single
          Dim Total As Single
          Dim Cnt As Integer
          Dim Avg As Single
          Dim I As Long
          
          
20        Avg = Mean(Numbers)
30        For I = 0 To UBound(Numbers)
40            Total = Total + (Numbers(I) - Avg) ^ 2
50            Cnt = Cnt + 1
60        Next
          
          'The variance of the set of numbers
70        Variance = Total / Cnt
          
          'Standard Deviation is Square Root of Variance
80        StandardDeviation = Sqr(Variance)

90    Exit Function

func_err:
100       Err.Raise Err.Number, FUNC_NAME & "[" & Erl & "]" & "\" & Err.source, Err.Description
End Function
