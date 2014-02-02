Attribute VB_Name = "Module1"
Option Explicit

    'Kill process by path
    
     Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long

      Private Declare Function Process32First Lib "kernel32" ( _
         ByVal hSnapshot As Long, lppe As PROCESSENTRY32) As Long

      Private Declare Function Process32Next Lib "kernel32" ( _
         ByVal hSnapshot As Long, lppe As PROCESSENTRY32) As Long

      Private Declare Function CloseHandle Lib "Kernel32.dll" _
         (ByVal Handle As Long) As Long

      Private Declare Function OpenProcess Lib "Kernel32.dll" _
        (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, _
            ByVal dwProcId As Long) As Long

      Private Declare Function EnumProcesses Lib "psapi.dll" _
         (ByRef lpidProcess As Long, ByVal cb As Long, _
            ByRef cbNeeded As Long) As Long

      Private Declare Function GetModuleFileNameExA Lib "psapi.dll" _
         (ByVal hProcess As Long, ByVal hModule As Long, _
            ByVal ModuleName As String, ByVal nSize As Long) As Long

      Private Declare Function EnumProcessModules Lib "psapi.dll" _
         (ByVal hProcess As Long, ByRef lphModule As Long, _
            ByVal cb As Long, ByRef cbNeeded As Long) As Long

      Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" ( _
         ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long

      Private Declare Function GetVersionExA Lib "kernel32" _
         (lpVersionInformation As OSVERSIONINFO) As Integer

      Private Type PROCESSENTRY32
         dwSize As Long
         cntUsage As Long
         th32ProcessID As Long           ' This process
         th32DefaultHeapID As Long
         th32ModuleID As Long            ' Associated exe
         cntThreads As Long
         th32ParentProcessID As Long     ' This process's parent process
         pcPriClassBase As Long          ' Base priority of process threads
         dwFlags As Long
         szExeFile As String * 260       ' MAX_PATH
      End Type

      Private Type OSVERSIONINFO
         dwOSVersionInfoSize As Long
         dwMajorVersion As Long
         dwMinorVersion As Long
         dwBuildNumber As Long
         dwPlatformId As Long           '1 = Windows 95.
                                        '2 = Windows NT

         szCSDVersion As String * 128
      End Type

      Private Const PROCESS_QUERY_INFORMATION = 1024
      Private Const PROCESS_VM_READ = 16
      Private Const MAX_PATH = 260
      Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
      Private Const SYNCHRONIZE = &H100000
      'STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF
      Private Const PROCESS_ALL_ACCESS = &H1F0FFF
      Private Const TH32CS_SNAPPROCESS = &H2&
      Private Const hNull = 0

      Function StrZToStr(s As String) As String
         StrZToStr = Left$(s, Len(s) - 1)
      End Function

      Private Function getVersion() As Long
         Dim osinfo As OSVERSIONINFO
         Dim retvalue As Integer
         osinfo.dwOSVersionInfoSize = 148
         osinfo.szCSDVersion = Space$(128)
         retvalue = GetVersionExA(osinfo)
         getVersion = osinfo.dwPlatformId
      End Function

      Private Sub KillApp(ByVal path As String)
      Dim myProcess As Long
      Dim AppKill As Long
      Dim exitCode As Long
      Dim pfname As String
      
      Select Case getVersion()

      Case 1 'Windows 95/98

         Dim f As Long, sname As String
         Dim hSnap As Long, proc As PROCESSENTRY32
         hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
         If hSnap = hNull Then Exit Sub
         proc.dwSize = Len(proc)
         ' Iterate through the processes
         f = Process32First(hSnap, proc)
         Do While f
           sname = StrZToStr(proc.szExeFile)
           If trimexe(sname) = trimexe(path) Then
            myProcess = OpenProcess(PROCESS_ALL_ACCESS, False, proc.th32ProcessID)
            AppKill = TerminateProcess(myProcess, exitCode)
            Call CloseHandle(myProcess)
           End If
           f = Process32Next(hSnap, proc)
         Loop

      Case 2 'Windows NT

         Dim cb As Long
         Dim cbNeeded As Long
         Dim NumElements As Long
         Dim ProcessIDs() As Long
         Dim cbNeeded2 As Long
         Dim NumElements2 As Long
         Dim Modules(1 To 200) As Long
         Dim lRet As Long
         Dim ModuleName As String
         Dim nSize As Long
         Dim hProcess As Long
         Dim i As Long
         'Get the array containing the process id's for each process object
         cb = 8
         cbNeeded = 96
         Do While cb <= cbNeeded
            cb = cb * 2
            ReDim ProcessIDs(cb / 4) As Long
            lRet = EnumProcesses(ProcessIDs(1), cb, cbNeeded)
         Loop
         NumElements = cbNeeded / 4

         For i = 1 To NumElements
            'Get a handle to the Process
            hProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, ProcessIDs(i))
            'Got a Process handle
            If hProcess <> 0 Then
                'Get an array of the module handles for the specified
                'process
                lRet = EnumProcessModules(hProcess, Modules(1), 200, _
                                             cbNeeded2)
                'If the Module Array is retrieved, Get the ModuleFileName
                If lRet <> 0 Then
                   ModuleName = Space(MAX_PATH)
                   nSize = 500
                   lRet = GetModuleFileNameExA(hProcess, Modules(1), _
                                   ModuleName, nSize)
                   If trimexe(Left(ModuleName, lRet)) = trimexe(path) Then
                        AppKill = TerminateProcess(hProcess, 0&)
                        Call CloseHandle(myProcess)
                   End If
                End If
            End If
          'Close the handle to the process
         lRet = CloseHandle(hProcess)
         Next

      End Select
      End Sub


Function trimexe(s As String) As String
trimexe = Replace(s, ".exe", "")
End Function


Sub wait(n As Byte)
Dim e As Long
e = Timer
Do
DoEvents
Loop Until ((e + n) Mod 86400) < Timer And IIf((e + n) > 86400, Timer < 100, True)
End Sub

Sub Main()
wait 2
KillApp Command$
wait 2
Shell Command$, vbNormalFocus
End Sub
