Attribute VB_Name = "stringops"
' some useful string operations

Function extractpath(path As String) As String
  Dim k As Integer
  Dim OK As Integer
  If path <> "" Then
    k = 1
    While InStr(k, path, "\") > 0
      OK = k
      k = InStr(k, path, "\") + 1
    Wend
    'EricL - If condition below added March 15, 2006
    If k = 1 Then
      extractpath = ""
    Else
      extractpath = Left(path, k - 2)
    End If
  End If
End Function

Function extractname(path As String) As String
  Dim k As Integer
  Dim OK As Integer
  If path <> "" Then
    k = 1
    While InStr(k, path, "\") > 0
      OK = k
      k = InStr(k, path, "\") + 1
    Wend
    extractname = Right(path, Len(path) - k + 1)
  End If
End Function

Function extractexactname(Name As String) As String
'Botsareus 12/11/2013 Extracts the name portion of fname
Dim sp() As String
sp = Split(Name, ".")
extractexactname = sp(0)
End Function

Function relpath(path As String) As String
  If path Like MDIForm1.MainDir + "*" Then
    path = "&#" + Right(path, Len(path) - Len(MDIForm1.MainDir))
  End If
  relpath = path
End Function

Function respath(path As String) As String
  If Left(path, 2) = "&#" Then
    path = MDIForm1.MainDir + Right(path, Len(path) - 2)
  End If
  If path = "" Then path = MDIForm1.MainDir + "\Robots"
  respath = path
End Function

Function ConvertCommasToDecimal(s As String) As String

  ConvertCommasToDecimal = Replace(s, ",", ".")

End Function

'Botsareus 1/29/2014 replace special chars function
Function replacechars(s As String) As String
Dim i As Byte
For i = 0 To 31
s = Replace(s, Chr(i), "?")
Next
For i = 127 To 254
s = Replace(s, Chr(i), "?")
Next
replacechars = s
End Function
