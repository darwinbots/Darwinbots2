Imports System.IO
Public Class Form1
    Dim infolder As String
    Dim outfolder As String

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim strFileSize As String = ""
        Dim di As New IO.DirectoryInfo(outfolder)
        Dim aryFi As IO.FileInfo() = di.GetFiles("*.*")
        Dim fi As IO.FileInfo

        Dim fir(0) As String
        For Each fi In aryFi
            fir(UBound(fir)) = fi.Name
            ReDim Preserve fir(UBound(fir) + 1)
        Next
        Dim mf As String = fir(UBound(fir) * Rnd())
        Try
            IO.File.Move(outfolder & "\" & mf, infolder & "\" & mf)
        Catch ex As Exception
        End Try
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim c As Byte
        For Each p As Process In Process.GetProcesses
            If p.ProcessName = "DarwinBotsIM" Then
                c = c + 1
                If c = 2 Then End
            End If
        Next
        ' ''-in "C:\in" -out "C:\out" -name Newbie 5676 -pid  4404
        Dim sp() As String = Split(Command, """")
        infolder = sp(1)
        outfolder = sp(3)
        Randomize()
        Timer1.Enabled = True
    End Sub

End Class
