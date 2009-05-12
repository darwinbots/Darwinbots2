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

Public InternetMode As Boolean
Public StartInInternetMode As Boolean
Public InternetSaftyNet As Integer ' Used to count down for hung interent connections

Public Const ERROR_SUCCESS = 0&
Public Const APINULL = 0&
Public Const HKEY_LOCAL_MACHINE = &H80000002
Public ReturnCode As Long

Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long

Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long

Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long

'Public Function ActiveConnection() As Boolean
'  Dim hKey As Long
'  Dim lpSubKey As String
'  Dim phkResult As Long
'  Dim lpValueName As String
'  Dim lpReserved As Long
'  Dim lpType As Long
'  Dim lpData As Long
'  Dim lpcbData As Long
'  ActiveConnection = False
'  lpSubKey = "System\CurrentControlSet\Services\RemoteAccess"
'  ReturnCode = RegOpenKey(HKEY_LOCAL_MACHINE, lpSubKey, phkResult)
'
'  If ReturnCode = ERROR_SUCCESS Then
'    hKey = phkResult
'    lpValueName = "Remote Connection"
'    lpReserved = APINULL
'    lpType = APINULL
'    lpData = APINULL
'    lpcbData = APINULL
'    ReturnCode = RegQueryValueEx(hKey, lpValueName, lpReserved, lpType, ByVal lpData, lpcbData)
'    lpcbData = Len(lpData)
'    ReturnCode = RegQueryValueEx(hKey, lpValueName, lpReserved, lpType, lpData, lpcbData)
'    If ReturnCode = ERROR_SUCCESS Then
'      If lpData = 0 Then
'        ActiveConnection = False
'      Else
'        ActiveConnection = True
'      End If
'    End If
'    RegCloseKey (hKey)
'  End If
'End Function

'Now we deal with internet stuff from the simulations point of view, as opposed to just mundane connections

'
'       I N T E R N E T
'

'

' looks whether a robot is in the upload gate
' in that case uploads it and kills it
' then closes the gate
'Public Sub VerificaPosizione(r As Integer)
'  Dim xr As Single
'  Dim k As node
'  xr = IntOpts.XUpload + IntOpts.RUpload
'
'  If rob(r).pos.y > IntOpts.YUpload And rob(r).pos.y < (IntOpts.YUpload + IntOpts.RUpload) Then
'    If rob(r).Veg And IntOpts.NoVegs Then
'      KillOrganism r
'    Else
'      If UploadOrganism(r) Then
'        KillOrganism r
'        LastUploadCycle = SimOpts.TotRunCycle
'        If IntOpts.WhenUpload Then LoadRandomOrg CSng(IntOpts.XSpawn + IntOpts.RUpload / 3), CSng(IntOpts.YSpawn + IntOpts.RUpload / 3)
'        IntOpts.WaitForUpload = 1000 ' EricL was 10000
'      Else
'        LastUploadCycle = SimOpts.TotRunCycle
'        IntOpts.WaitForUpload = 500 ' EricL was 5000
'      End If
'    End If
'  End If
'End Sub

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
'Public Function IsInSpawnArea(x As Long, y As Long) As Boolean
' Dim xc As Single
'  Dim yc As Single
'  Dim ra As Single
'  IsInSpawnArea = False
'  ra = IntOpts.RUpload / 2
'  xc = IntOpts.XSpawn + ra
'  yc = IntOpts.YSpawn + ra
'  ra = ra * 2
'  If Sqr((x - xc) ^ 2 + (y - yc) ^ 2) < ra Then IsInSpawnArea = True
'End Function

' uploads

' root for organisms upload
' gives the file an appropriate name, saves it, and uploads it
'Function UploadOrganism(r As Integer) As Boolean
'
' Dim lst(100) As Integer
'  Dim nome As String
'  Dim k As Integer
'  UploadOrganism = False
'
' ' lst(0) = r
' ' ListCells lst()
' ' k = 0
' ' While lst(k) > 0
' '   rob(lst(k)).LastOwner = IntOpts.IName
' '   k = k + 1
' ' Wend
'
'  SetF1InternetMode
'
'  On Error GoTo fine
'  InternetSaftyNet = 30
'  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/FTP/Internet/F1"
'  ' Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/Internet/F1"
'  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
'    DoEvents
'  Loop
'  If InternetSaftyNet = 0 Then
'    Form1.Inet1.Cancel
'    Disconnect
'    LogForm.AddLog "Time out changing to FTP bot directory"
'    Exit Function
'  End If
'  nome = AttribuisciNome(k)
'  SaveOrganism MDIForm1.MainDir + "/Transfers/F1/out/" + nome, r
'  UploadOrganism = UploadFile(nome, MDIForm1.MainDir + "/Transfers/F1/out/" + nome, "/Internet/F1")
' ' Disconnect
'  IntOpts.ErrorNumber = 0
'  Exit Function
'
'fine:
'  If Form1.Inet1.ResponseCode = 0 Then
'    Disconnect
'    IntOpts.ErrorNumber = 0
'    Exit Function
'  End If
'
'  Debug.Print "cannot connect to server"
'  IntOpts.ErrorNumber = IntOpts.ErrorNumber + 1
'  If IntOpts.ErrorNumber > 2 Then
'    'keep trying in the future
'    'IntOpts.Active = False
'    'NetEvent.Appear "Server unreachable: turning off internet sharing"
'    LogForm.AddLog "Server unreachable"
'    Debug.Print "Server unreachable"
'  End If
'End Function

Public Function SetF1InternetMode()
  Form1.Inet1.URL = "ftp://ftp.darwinbots.com"
  'Form1.Inet1.URL = "ftp://sulaadventures.com"
  Form1.Inet1.AccessType = icUseDefault
  'Form1.Inet1.Protocol = icHTTP
  'Form1.Inet1.OpenURL
  Form1.Inet1.Protocol = icFTP
  Form1.Inet1.RemotePort = 21
  Form1.Inet1.RequestTimeout = 60
  Form1.Inet1.password = "InternetM001"  ' Actual password removed for security reasons
  Form1.Inet1.UserName = "dbimuser"      ' Actual user name removed for security reasons.
  'Form1.Inet1.password = "dbuser"  ' Actual password removed for security reasons
  'Form1.Inet1.UserName = "dbuser"      ' Actual user name removed for security reasons.
 End Function
 
Public Function OpenConnection() As Boolean
  OpenConnection = False
  On Error GoTo byebye
  SetF1InternetMode
  InternetSaftyNet = 60
  Form1.Inet1.OpenURL
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
byebye:
    Form1.Inet1.Cancel
   ' Unload Form1.Inet1
'    Disconnect
    LogForm.AddLog "Could not open connection to server.  " + Err.Description
    Exit Function
  End If
  OpenConnection = True

End Function


' uploads the file NameAndPath to FTPsubdir
Public Function UploadFile(FileName As String, NameAndPath As String, FTPsubdir As String) As Boolean
  Dim c As String
  Dim ap As String
  
  SetF1InternetMode
  UploadFile = False
  
 ' On Error GoTo fine
  InternetSaftyNet = 30
  'Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/FTP" + FTPsubdir
  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + FTPsubdir
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
 '   Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out getting FTP Directory of bots"
    Exit Function
  End If
   
  ap = """"
  Form1.Inet1.RequestTimeout = 30
  c = "PUT " & ap & NameAndPath & ap & " " & ap & FileName & ap
  Debug.Print c
  InternetSaftyNet = 30
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  Debug.Print Form1.Inet1.ResponseInfo
  Debug.Print Form1.Inet1.ResponseCode
  
  If InternetSaftyNet = 0 Then
 '   Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out uploading organism"
 '   Unload Form1.Inet1
    Exit Function
  Else
    UploadFile = True
    Kill NameAndPath
  End If
  Exit Function
fine:
  Disconnect
  Debug.Print "Organism upload not sucessful - " + Form1.Inet1.ResponseInfo
  LogForm.AddLog "Unable to upload organism  " + Err.Description + " " + Str(Err.Number)
  Debug.Print Form1.Inet1.ResponseCode
  UploadFile = False
End Function



' gives an internet organism his absurd name
Public Function AttribuisciNome(n As Integer) As String
  Dim P As String
  P = "dt" + CStr(Format(Date, "yymmdd"))
  P = P + "cn" + "00" 'CStr(n)
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
Function LoadRandomOrgs(num As Integer, x As Single, Y As Single, Teleporter As Integer) As Boolean
  On Error GoTo fine
  Dim DirList(150) As String
  Dim k, i, dirnum As Integer
  Dim fase As Integer
  
  LoadRandomOrgs = False
  
  
  fase = 0
  Teleporters(Teleporter).ServerAvailable = True
    
  MDIForm1.F1InternetButton.DownPicture = Form1.ServerGood
  MDIForm1.F1InternetButton.Refresh

  SetF1InternetMode
  
  Debug.Print "Initializing FTP session."
  InternetSaftyNet = 30
  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/F1/bots"
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
 '   Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out changing to FTP bot file directory"
  '  Unload Form1.Inet1
    Exit Function
  End If
  fase = 1
  Debug.Print "FTP session initialized.  About to get FTP download list."
  CompileDirlist Directory, DirList()
  Debug.Print "FTP download list completed."
  
  dirnum = CInt(val(DirList(0)))
  If dirnum = 0 Then
    LoadRandomOrgs = False
    Disconnect
    Exit Function
  End If

  i = num
  If i > dirnum Then i = dirnum
  While i > 0
    'k = Random(1, CInt(val(DirList(0))))
    If DownloadOrganism(DirList(i), x, Y) = False Then GoTo getout
    If DeleteFile(DirList(i)) = False Then GoTo getout
    i = i - 1
  Wend
  LoadRandomOrgs = True
  fase = 4

getout:
  Disconnect
  IntOpts.ErrorNumber = 0
  Exit Function
fine:
  Disconnect
  Teleporters(Teleporter).ServerAvailable = False
  MDIForm1.F1InternetButton.DownPicture = Form1.ServerBad
  MDIForm1.F1InternetButton.Refresh
  
  LogForm.AddLog "Server Unreachable.  Teleporting intrasim. " + Err.Description
      
  If fase = 0 Then Debug.Print "Can't connect to FTP server"
  If fase = 1 Then Debug.Print "scaricata dir, poi errore"
  If fase = 2 Then Debug.Print "cancellata dir, poi errore"
  If fase = 3 Then Debug.Print "riscaricata dir, poi errore"
  If fase = 4 Then Debug.Print "impossibile disconnettersi"

End Function

' root for population file download
' downloads all files in the directory without deleting anything
Function DownloadPopFiles() As Boolean
  On Error GoTo fine
  Dim DirList(150) As String
  Dim k, i, dirnum As Integer
  Dim fase As Integer
  
  DownloadPopFiles = False
  
  fase = 0
  
  SetF1InternetMode
  InternetSaftyNet = 30
  Debug.Print "Initializing FTP session."
  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/F1/pop"
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
  '  Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out changing to FTP pop file directory"
  '  Unload Form1.Inet1
    Exit Function
  End If
  fase = 1
  Debug.Print "FTP session initialized.  About to get FTP download list."
  CompilePopDirlist Directory, DirList()
  Debug.Print "FTP download list completed."
  
  dirnum = CInt(val(DirList(0)))
  If dirnum = 0 Then
    DownloadPopFiles = False
 '   Form1.Inet1.Cancel
    Disconnect
    Exit Function
  End If
  i = dirnum
  While i > 0
    If DownloadFile(DirList(i), MDIForm1.MainDir + "\Transfers\F1\") = False Then GoTo getout
    i = i - 1
  Wend
  DownloadPopFiles = True
  fase = 4

getout:
  Disconnect
  IntOpts.ErrorNumber = 0
  Exit Function
fine:
  Disconnect
  LogForm.AddLog "Error Downloading Pop files  " + Err.Description + " " + Form1.Inet1.ResponseInfo + " " + Str(Form1.Inet1.ResponseCode)
  If fase = 0 Then Debug.Print "Can't connect to FTP server"
  If fase = 1 Then Debug.Print "scaricata dir, poi errore"
  If fase = 2 Then Debug.Print "cancellata dir, poi errore"
  If fase = 3 Then Debug.Print "riscaricata dir, poi errore"
  If fase = 4 Then Debug.Print "impossibile disconnettersi"
End Function

Public Function DeleteLocalFiles(path As String)
Dim i As Integer
Dim n As Integer
Dim sFile As String
Dim lElement As Long
Dim sAns() As String
ReDim sAns(0) As String

  sFile = dir(path, vbNormal + vbHidden + vbReadOnly + vbSystem + vbArchive)
    While sFile <> ""
      sAns(0) = sFile
      lElement = IIf(sAns(0) = "", 0, UBound(sAns) + 1)
      ReDim Preserve sAns(lElement) As String
      sAns(lElement) = sFile
      Kill (path + sAns(lElement))
      sFile = dir
    Wend

End Function

Public Function DeleteRemotePopFile(Name As String)
  On Error GoTo getout
  
' SetF1InternetMode
'  InternetSaftyNet = 60
'  Form1.Inet1.RequestTimeout = 60
'  Debug.Print "Initializing FTP session."
'  Form1.Inet1.Execute Form1.Inet1.URL, "CD " + "/F1/pop"
'  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
'    DoEvents
'  Loop
'
'
'  If InternetSaftyNet = 0 Then
'  '  Form1.Inet1.Cancel
'    Disconnect
'    LogForm.AddLog "Time out deleting remote pop file"
' '   Unload Form1.Inet1
'    Exit Function
'  End If
  DeleteFile ("/F1/pop/" + Name)
  Disconnect
  Exit Function
getout:
  LogForm.AddLog "Error Deleting Remote Pop file " + Err.Description
End Function


' organism download: takes the file name and spawn
' position, downloads it and loads it in the simulation
' Assumes FTP session is in place!!!!
Private Function DownloadOrganism(Name As String, x As Single, Y As Single) As Boolean
  DownloadOrganism = False
  If DownloadFile(Name, MDIForm1.MainDir + "\Transfers\F1\in\") Then
    DownloadOrganism = True
  End If
End Function

' downloads a file
Private Function DownloadFile(Name As String, wherePath As String) As Boolean

  Dim c As String
  Dim ap As String
  
  Dim fso As New FileSystemObject
  Dim fileToDelete As File
  
  On Error GoTo bypass
  Set fileToDelete = fso.GetFile(wherePath + Name + ".del")
  fileToDelete.Delete
bypass:

  On Error GoTo fine
  
  ap = """"
  c = "GET " & ap & Name & ap & " " & ap & wherePath + Name + ".del" & ap
  Form1.Inet1.RequestTimeout = 30
  InternetSaftyNet = 30
  Debug.Print c
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
  '  Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out downloading FTP file"
    DownloadFile = False
  '  Unload Form1.Inet1
    Exit Function
  End If
  
  Debug.Print Form1.Inet1.ResponseInfo
  Debug.Print Form1.Inet1.ResponseCode
  If Form1.Inet1.ResponseCode <> 0 Then
    DownloadFile = False
  Else
    DownloadFile = True
    Set fileToDelete = fso.GetFile(wherePath + Name + ".del")
    fileToDelete.Copy (wherePath + Name)
    'fileToDelete.Delete
  End If
  Exit Function
fine:
  Debug.Print "Download of FTP file not sucessfull"
  DownloadFile = False
End Function

' disconnects from ftp site
Public Sub Disconnect()
On Error GoTo byebye
 
 Form1.Inet1.Cancel
 InternetSaftyNet = 30
 Form1.Inet1.RequestTimeout = 30
 Form1.Inet1.Execute Form1.Inet1.URL, "QUIT"
 Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
   DoEvents
 Loop
 If InternetSaftyNet = 0 Then
    Form1.Inet1.Cancel
    LogForm.AddLog "Time out disconnecting"
    'Unload Form1.Inet1
 End If
Exit Sub
byebye:
  LogForm.AddLog "Error disconnecting " + Err.Description
End Sub

' directory
' downloads the pure directory list from the current dir
' assumes FTP session
Function Directory() As String
  On Error GoTo fine
  Dim b As String
  Dim a As String
  
  b = "x"
  a = ""
  Directory = a
  
  Form1.Inet1.RequestTimeout = 30
  InternetSaftyNet = 30
  Form1.Inet1.Execute Form1.Inet1.URL, "DIR"
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
   ' Form1.Inet1.Cancel
    Disconnect
    LogForm.AddLog "Time out getting FTP Directory"
  '  Unload Form1.Inet1
    Exit Function
  End If
 
  While Len(b) > 0
    Form1.Inet1.RequestTimeout = 30
    InternetSaftyNet = 30
    b = Form1.Inet1.GetChunk(1024, icString)
    Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
      DoEvents
    Loop
    If InternetSaftyNet = 0 Then
     ' Form1.Inet1.Cancel
      Disconnect
      LogForm.AddLog "Time out getting chunks of FTP Directory"
     ' Unload Form1.Inet1
      Exit Function
    End If
    a = a + b
  Wend
  
  Debug.Print a
  If Len(a) < 10 Then Debug.Print "ahi ahi ahi"
  Debug.Print Form1.Inet1.ResponseInfo
  Directory = a
  Exit Function
fine:
  Debug.Print "Can't get FTP directory."
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
        'cn = InStr(i, "cn")
        'If cn > 0 Then
         ' If val(Mid(i, cn + 2)) >= IntOpts.MinCellsNum Then
            dlist(k) = i
            k = k + 1
          'End If
        'End If
      End If
    End If
    dr = Mid(dr, InStr(dr, vbCrLf) + 2)
  Wend
  dlist(0) = CStr(k - 1)
End Sub


' cleans from the directory those files which don't match
' download requirements
Private Sub CompilePopDirlist(ByVal dr As String, dlist() As String)
  Dim k As Integer
  Dim i As String, cn As Integer
  k = 1
  While InStr(dr, vbCrLf) > 2
    i = Left(dr, InStr(dr, vbCrLf) - 1)
    If InStr(i, "/") < 1 Then
      If Len(i) > 4 And Right(i, 4) = ".pop" Then
        dlist(k) = i
        k = k + 1
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
Public Function DeleteFile(Name As String) As Boolean
  On Error GoTo fine
  Dim c As String
  Dim ap As String
  ap = """"
  
  Form1.Inet1.RequestTimeout = 30
  InternetSaftyNet = 30
  c = "DELETE " & ap & Name & ap
  Debug.Print c
  Form1.Inet1.Execute Form1.Inet1.URL, c
  Do While Form1.Inet1.StillExecuting = True And InternetMode And InternetSaftyNet > 0
    DoEvents
  Loop
  If InternetSaftyNet = 0 Then
  '  Form1.Inet1.Cancel
   ' Disconnect
    LogForm.AddLog "Time out deleting FTP file"
    DeleteFile = False
  '  Unload Form1.Inet1
    Exit Function
  End If

  Debug.Print Form1.Inet1.ResponseInfo
  Debug.Print Form1.Inet1.ResponseCode
  Debug.Print "Deleted file on FTP share: ", Name
  DeleteFile = True
  Exit Function
fine:
  Debug.Print "Could not delete FTP file: ", Name
  DeleteFile = False
End Function
