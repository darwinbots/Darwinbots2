Attribute VB_Name = "IntOpts"
Option Explicit

Public IName As String
Public FtpServer As String
Public IP As String
Public Proxy As String
Public Port As String
Public UseProxy As Boolean
Public Active As Boolean
Public Cycles As Long
Public WhenUpload As Boolean
Public XUpload As Single
Public YUpload As Single
Public XSpawn As Single
Public YSpawn As Single
Public RUpload As Single
Public NoVegs As Boolean
Public MinCellsNum As Integer
Public LastUploadCycle As Long
Public WaitForUpload As Long
Public ErrorNumber As Byte

Public Folder As String
Public Loginname As String
Public LoginPassword As String

Public NoOlder As Integer
Public NoOlderAsHours As Boolean

Public RetryAttempts As Integer
Public RetryRetry As Integer 'how many minutes to wait until we try to turn back on internet sharing

Public DownloadTimerAsCycles As Boolean 'are we downloading every X seconds or X cycles

Public Const ERROR_SUCCESS = 0&
Public Const APINULL = 0&
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public ReturnCode As Long

Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long

Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long

Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long

Public Function ActiveConnection() As Boolean
  Dim hKey As Long
  Dim lpSubKey As String
  Dim phkResult As Long
  Dim lpValueName As String
  Dim lpReserved As Long
  Dim lpType As Long
  Dim lpData As Long
  Dim lpcbData As Long
  ActiveConnection = False
  lpSubKey = "System\CurrentControlSet\Services\RemoteAccess"
  ReturnCode = RegOpenKey(HKEY_LOCAL_MACHINE, lpSubKey, phkResult)
  
  If ReturnCode = ERROR_SUCCESS Then
    hKey = phkResult
    lpValueName = "Remote Connection"
    lpReserved = APINULL
    lpType = APINULL
    lpData = APINULL
    lpcbData = APINULL
    ReturnCode = RegQueryValueEx(hKey, lpValueName, lpReserved, lpType, ByVal lpData, lpcbData)
    lpcbData = Len(lpData)
    ReturnCode = RegQueryValueEx(hKey, lpValueName, lpReserved, lpType, lpData, lpcbData)
    If ReturnCode = ERROR_SUCCESS Then
      If lpData = 0 Then
        ActiveConnection = False
      Else
        ActiveConnection = True
      End If
    End If
    RegCloseKey (hKey)
  End If
End Function

'Now we deal with internet stuff from the simulations point of view, as opposed to just mundane connections

'
'       I N T E R N E T
'

'

' looks whether a robot is in the upload gate
' in that case uploads it and kills it
' then closes the gate
Public Sub VerificaPosizione(r As Integer)
  Dim xr As Single
  Dim k As node
  xr = IntOpts.XUpload + IntOpts.RUpload
  
  If rob(r).pos.Y > IntOpts.YUpload And rob(r).pos.Y < (IntOpts.YUpload + IntOpts.RUpload) Then
    If rob(r).Veg And IntOpts.NoVegs Then
      KillOrganism r
    Else
      If UploadOrganism(r) Then
        KillOrganism r
        LastUploadCycle = SimOpts.TotRunCycle
        If IntOpts.WhenUpload Then LoadRandomOrg CSng(IntOpts.XSpawn + IntOpts.RUpload / 3), CSng(IntOpts.YSpawn + IntOpts.RUpload / 3)
        IntOpts.WaitForUpload = 1000 ' EricL was 10000
      Else
        LastUploadCycle = SimOpts.TotRunCycle
        IntOpts.WaitForUpload = 500 ' EricL was 5000
      End If
    End If
  End If
End Sub

'Below is taken care of by the physics function GateForces
'' a little repulsion field around the download gate, just to
'' avoid blocking the way to incoming robots
'Public Sub KeepOff()
'If IntOpts.Active = False Then Exit Sub
'  Dim r As Integer
'  Dim xr As Single
'  Dim xc As Single
'  Dim yc As Single
'  Dim ra As Single
'  Dim dc As Single
'  Dim spx As Single
'  Dim spy As Single
'  Dim k As node
'  ra = IntOpts.RUpload / 2
'  xr = IntOpts.XSpawn + IntOpts.RUpload
'  xc = IntOpts.XSpawn + ra
'  yc = IntOpts.YSpawn + ra
'  ra = ra * 2
'  Set k = rlist.firstpos(RobSize, IntOpts.XSpawn - IntOpts.RUpload / 2)
'  While Not (k.xpos + RobSize > xr) And Not (k Is rlist.last)
'    r = k.robn
'    dc = Sqr((rob(r).pos.x - xc) ^ 2 + (rob(r).pos.y - yc) ^ 2)
'    If dc < ra Then
'       spx = -((ra - dc) / ra ^ 2) * 200
'       spy = (yc - rob(r).pos.y) * spx
'       spx = (xc - rob(r).pos.x) * spx
'       'rob(r).ax = rob(r).ax + spx
'       'rob(r).ay = rob(r).ax + spy
'    End If
'    Set k = k.orn
'  Wend
'End Sub

' tells whether a certain position belongs to the spawn area
' (the download gate). Used by reproduce to avoid reproduction
' there
Public Function IsInSpawnArea(X As Long, Y As Long) As Boolean
  Dim xc As Single
  Dim yc As Single
  Dim ra As Single
  IsInSpawnArea = False
  ra = IntOpts.RUpload / 2
  xc = IntOpts.XSpawn + ra
  yc = IntOpts.YSpawn + ra
  ra = ra * 2
  If Sqr((X - xc) ^ 2 + (Y - yc) ^ 2) < ra Then IsInSpawnArea = True
End Function

' uploads

' root for organisms upload
' gives the file an appropriate name, saves it, and uploads it
Function UploadOrganism(r As Integer) As Boolean
  On Error GoTo fine
  Dim lst(100) As Integer
  Dim nome As String
  Dim k As Integer
  UploadOrganism = False
  If Not (rob(r).Veg And IntOpts.NoVegs) Then
    lst(0) = r
    ListCells lst()
    k = 0
    While lst(k) > 0
      rob(lst(k)).LastOwner = IntOpts.IName
      k = k + 1
    Wend
    Form1.Inet1.URL = IntOpts.FtpServer
    Form1.Inet1.AccessType = icUseDefault
    Form1.Inet1.Protocol = icFTP
    Form1.Inet1.password = IntOpts.LoginPassword
    Form1.Inet1.UserName = IntOpts.Loginname
    Form1.Inet1.Execute Form1.Inet1.URL, "CD " + Folder
    Do While Form1.Inet1.StillExecuting = True
      DoEvents
    Loop
    nome = AttribuisciNome(k)
    SaveOrganism MDIForm1.MainDir + "/Transfers/" + nome, r
    UploadOrganism = UploadFile(nome)
    Disconnect
    IntOpts.ErrorNumber = 0
  End If
  Exit Function
fine:
  Debug.Print "cannot connect to server"
  IntOpts.ErrorNumber = IntOpts.ErrorNumber + 1
  If IntOpts.ErrorNumber > 2 Then
    'keep trying in the future
    'IntOpts.Active = False
    'NetEvent.Appear "Server unreachable: turning off internet sharing"
    LogForm.AddLog "Server unreachable"
    Debug.Print "Server unreachable"
  End If
End Function

' uploads the organism file
Private Function UploadFile(Name As String) As Boolean
  On Error GoTo fine
  Dim c As String
  Dim ap As String
  ap = """"
  Form1.Inet1.RequestTimeout = 20
  c = "PUT " & ap & MDIForm1.MainDir + "/Transfers/" + Name & ap & " " & ap & Name & ap
  Debug.Print c
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
  Debug.Print Form1.Inet1.ResponseInfo
  'NetEvent.Appear "Organism saved on server"
  LogForm.AddLog "Organism saved on server"
  UploadFile = True
  Exit Function
fine:
  Debug.Print "upload non riuscito -" + Form1.Inet1.ResponseInfo
  'NetEvent.Appear "Unable to upload organism"
  LogForm.AddLog "Unable to upload organism"
  Debug.Print Form1.Inet1.ResponseCode
  UploadFile = False
End Function

' gives an internet organism his absurd name
Private Function AttribuisciNome(n As Integer) As String
  Dim P As String
  P = "dt" + CStr(Format(Date, "yymmdd"))
  P = P + "cn" + CStr(n)
  P = P + "mf" + CStr(Int(SimOpts.PhysMoving * 100))
  'p = p + "fr" + CStr(Int(SimOpts.PhysFriction * 100))
  'p = p + "gr" + CStr(Int(SimOpts.PhysGrav * 100))
  P = P + "bm" + CStr(Int(SimOpts.PhysBrown * 100))
  P = P + "sf" + CStr(Int(SimOpts.PhysSwim * 100))
  P = P + "ac" + CStr(Int(SimOpts.CostExecCond * 100))
  P = P + "sc" + CStr(Int(SimOpts.Costs(COSTSTORE) * 100))
  P = P + "ce" + CStr(Int(SimOpts.Costs(SHOTCOST) * 100))
  If SimOpts.EnergyExType Then
    P = P + "et" + CStr(Int(SimOpts.EnergyProp * 100))
    P = P + "tt1"
  Else
    P = P + "et" + CStr(Int(SimOpts.EnergyFix * 100))
    P = P + "tt2"
  End If
  P = P + "rc" + CStr(Random(0, 99999))
  P = P + ".dbo"
  AttribuisciNome = P
End Function

' download

' root for organisms download
' downloads the directory (deciding in case to delete part of it)
' choses a random file and loads it
Function LoadRandomOrg(X As Single, Y As Single) As Boolean
  On Error GoTo fine
  Dim DirList(150) As String
  Dim k As Integer
  Dim fase As Integer
  fase = 0
  Form1.Inet1.URL = IntOpts.FtpServer
  Form1.Inet1.AccessType = icUseDefault
  Form1.Inet1.Protocol = icFTP
  Form1.Inet1.RemotePort = 21
  Form1.Inet1.RequestTimeout = 10
  Form1.Inet1.UserName = IntOpts.Loginname
  Form1.Inet1.password = IntOpts.LoginPassword
  Debug.Print "inizializzato ftp"
  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + IntOpts.Folder
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
  Debug.Print "cambiata dir"
  CompileDirlist Directory, DirList()
  Debug.Print "caricata dir"
  fase = 1
  If val(DirList(0)) > 99 Then
    DeleteExceeding DirList
    fase = 2
    CompileDirlist Directory, DirList()
    fase = 3
  End If
  k = Random(1, CInt(DirList(0)))
  LoadRandomOrg = DownloadOrganism(DirList(k), X, Y)
  fase = 4
  Disconnect
  IntOpts.ErrorNumber = 0
  Exit Function
fine:
  If fase = 0 Then Debug.Print "impossibile connettersi al server"
  If fase = 1 Then Debug.Print "scaricata dir, poi errore"
  If fase = 2 Then Debug.Print "cancellata dir, poi errore"
  If fase = 3 Then Debug.Print "riscaricata dir, poi errore"
  If fase = 4 Then Debug.Print "impossibile disconnettersi"
  IntOpts.ErrorNumber = IntOpts.ErrorNumber + 1
  If IntOpts.ErrorNumber > 2 Then
    IntOpts.Active = False
    'NetEvent.Appear "Server unreachable: turning off internet sharing"
    LogForm.AddLog "Server unreachable: turning off internet sharing"
    Debug.Print "Server unreachable: turning off organisms sharing"
  End If
End Function

' organism download: takes the file name and spawn
' position, downloads it and loads it in the simulation
Private Function DownloadOrganism(Name As String, X As Single, Y As Single) As Boolean
  DownloadOrganism = False
  Form1.Inet1.AccessType = icUseDefault
  Form1.Inet1.Protocol = icFTP
  Form1.Inet1.URL = IntOpts.FtpServer
  Form1.Inet1.UserName = IntOpts.Loginname
  Form1.Inet1.password = IntOpts.LoginPassword
  Debug.Print "Initializing FTP connection"
  If DownloadFile(Name) Then
    LoadOrganism MDIForm1.MainDir + "/Transfers/" + Name, X, Y
    DownloadOrganism = True
  End If
End Function

' downloads a file
Private Function DownloadFile(Name As String) As Boolean
  On Error GoTo fine
  Dim c As String
  Dim ap As String
  ap = """"
  Form1.Inet1.RequestTimeout = 10
  c = "GET " & ap & Name & ap & " " & ap & MDIForm1.MainDir + "/Transfers/" & Name & ap
  Debug.Print "mandato comando recupero"
  Debug.Print c
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
  Debug.Print Form1.Inet1.ResponseInfo
  DownloadFile = True
  'Form1.Inet1.Execute , "QUIT"
  'NetEvent.Appear "Organism loaded from server"
  LogForm.AddLog "Organism loaded from server"
  Exit Function
fine:
  Debug.Print "download non riuscito"
  DownloadFile = False
End Function

' disconnects from ftp site
Private Sub Disconnect()
  Form1.Inet1.Execute Form1.Inet1.URL, "CLOSE"
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
End Sub

' directory

' downloads the pure directory
Function Directory() As String
  'On Error GoTo fine
  Dim b As String
  Dim a As String
  Form1.Inet1.RequestTimeout = 10
  'Form1.Inet1.Execute Form1.Inet1.URL, "DIR"
  Form1.Inet1.Execute , "DIR"
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
  b = "x"
  a = ""
  While Len(b) > 0
    b = Form1.Inet1.GetChunk(1024, icString)
    Do While Form1.Inet1.StillExecuting = True
      DoEvents
    Loop
    a = a + b
  Wend
  Debug.Print a
  If Len(a) < 10 Then Debug.Print "ahi ahi ahi"
  Debug.Print Form1.Inet1.ResponseInfo
  Directory = a
  Exit Function
fine:
  Debug.Print "Impossibile connettersi al server"
  Directory = "errore"
End Function

' cleans from the directory those files which don't match
' download requirements (such as cell number)
Private Sub CompileDirlist(ByVal dr As String, dlist() As String)
  Dim k As Integer
  Dim i As String, cn As Integer
  k = 1
  While InStr(dr, vbCrLf) > 2
    i = Left(dr, InStr(dr, vbCrLf) - 1)
    If InStr(i, "/") < 1 Then
      If Len(i) > 4 And Right(i, 4) = ".dbo" Then
        cn = InStr(i, "cn")
        If cn > 0 Then
          If val(Mid(i, cn + 2)) >= IntOpts.MinCellsNum Then
            dlist(k) = i
            k = k + 1
          End If
        End If
      End If
    End If
    dr = Mid(dr, InStr(dr, vbCrLf) + 2)
  Wend
  dlist(0) = CStr(k - 1)
End Sub

' erase files

' deletetion of part of the files in the remote dir
' chooses the eldest files
Private Function DeleteExceeding(dlist() As String) As Boolean
  Dim nf As Integer, j As Integer, sfn As Integer
  Dim df As Integer, t As Integer
  Dim k As Integer, mdt As Long
  Dim dt As Long
  Dim dellist(200) As String
  nf = val(dlist(0))
  df = nf / 4
  For t = 1 To df
    mdt = 999999
    For j = 1 To nf
      dt = val(Mid(dlist(j), 3, 6))
      If dt <= mdt And dt > 0 Then
        sfn = j
        mdt = dt
      End If
    Next j
    dellist(t) = dlist(sfn)
    dlist(sfn) = ".              "
  Next t
  For t = 1 To nf
    Debug.Print dlist(t)
  Next t
  Debug.Print "-------"
  For t = 1 To df
    Debug.Print dellist(t)
  Next t
  DeleteExceeding = True
  Form1.Inet1.AccessType = icUseDefault
  Form1.Inet1.Protocol = icFTP
  Form1.Inet1.URL = IntOpts.FtpServer
  For t = 1 To df
    DeleteExceeding = DeleteExceeding And DeleteFile(dellist(t))
  Next t
End Function

' actually deletes the remote files
Private Function DeleteFile(Name As String) As Boolean
  On Error GoTo fine
  Dim c As String
  Dim ap As String
  ap = """"
  Form1.Inet1.RequestTimeout = 40
  c = "DELETE " & ap & Name & ap
  Debug.Print c
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True
    DoEvents
  Loop
  Debug.Print Form1.Inet1.ResponseInfo
  Debug.Print "Cancellato ", Name
  DeleteFile = True
  Exit Function
fine:
  Debug.Print "cancellazione non riuscita di ", Name
  DeleteFile = False
End Function
