Attribute VB_Name = "Globals"
'A temporary module for everything without a home.

Option Explicit

'Botsareus 7/2/2014 PlayerBot settings
Type keydata
 key As Byte
 memloc As Integer
 value As Integer
 Active As Boolean
 Invert As Boolean
End Type

Public Mouse_loc As vector
Public PB_keys() As keydata

'G L O B A L  S E T T I N G S Botsareus 3/15/2013
Public screenratiofix As Boolean
Public bodyfix As Integer
Public reprofix As Boolean
Public chseedstartnew As Boolean
Public chseedloadsim As Boolean
Public UseSafeMode As Boolean
Public GraphUp As Boolean
Public HideDB As Boolean
Public intFindBestV2 As Integer
Public UseOldColor As Boolean
Public startnovid As Boolean
'Botsareus 11/29/2013 The mutations tab
Public epireset As Boolean
Public epiresetemp As Single
Public epiresetOP As Integer
Public sunbelt As Boolean
'Botsareus 12/16/2013 Delta2 on mutations tab
Public Delta2 As Boolean
Public DeltaMainExp As Single
Public DeltaMainLn As Single
Public DeltaDevExp As Single
Public DeltaDevLn As Single
Public DeltaPM As Integer
Public DeltaWTC As Byte
Public DeltaMainChance As Byte
Public DeltaDevChance As Byte
'Botsareus 12/16/2013 Normalize DNA length
Public NormMut As Boolean
Public valNormMut As Integer
Public valMaxNormMut As Integer

'some global settings change within simulation
Public loadboylabldisp As Boolean
Public loadstartnovid As Boolean

Public tmpseed As Long 'used only by "load simulation"
Public simalreadyrunning As Boolean
Public autosaved As Boolean


'Botsareus 1/5/2014 Copy of Obstacle array
Public xObstacle() As Obstacle


'Variables below prefixed x_ are used for league and evolution, y_ are used only for evolution
'Variables prefixed _res_ are used for restriction overwrites
Public x_res_kill_chlr As Byte
Public x_res_kill_mb As Boolean
Public x_res_other As Byte
'
Public y_res_kill_chlr As Byte
Public y_res_kill_mb As Boolean
Public y_res_kill_dq As Boolean
Public y_res_other As Byte
'
Public x_res_kill_mb_veg As Boolean
Public x_res_other_veg As Byte
'
Public y_res_kill_mb_veg As Boolean
Public y_res_kill_dq_veg As Boolean
Public y_res_other_veg As Byte

'Botsareus 1/31/2014 Restart modes
Public x_restartmode As Byte
Public x_filenumber As Integer
Public leagueSourceDir As String
Public UseStepladder As Boolean
Public x_fudge As Byte
Public FudgeEyes As Boolean
Public FudgeAll As Boolean

Public Disqualify As Byte

Public StartChlr As Integer 'Botsareus 2/12/2014 Start repopulating robots with chloroplasts

Public ModeChangeCycles As Long 'Botsareus 2/14/2014 Used to calculate time difference and mode change for survival

Public y_robdir As String
Public y_graphs As Boolean
Public y_normsize As Boolean
Public y_hidePredCycl As Integer
Public y_LFOR As Single
Public y_Stgwins As Integer
Public y_zblen As Integer

Public y_eco_im As Byte
Public Corruptions As Integer

'actual evolution globals

Public curr_dna_size As Integer
Public hidePredCycl As Integer
Public Init_hidePredCycl As Integer
Public hidePredOffset As Integer
Public LFOR As Single
Public LFORdir As Boolean 'direction
Public LFORcorr As Single 'correction
Public hidepred As Boolean
Public target_dna_size As Integer

'Botsareus 9/30/2014 More out of memory preventive stuff

Public globalreprodisable As Boolean

' var structure, to store the correspondance name<->value
Public Type var
  Name As String
  value As Integer
End Type

'Constants for the graphs, which are used all over the place unfortunately -Botsareus 8/3/2012 reimplemented
Public Const POPULATION_GRAPH As Integer = 1
Public Const MUTATIONS_GRAPH As Integer = 2
Public Const AVGAGE_GRAPH As Integer = 3
Public Const OFFSPRING_GRAPH As Integer = 4
Public Const ENERGY_GRAPH As Integer = 5
Public Const DNALENGTH_GRAPH As Integer = 6
Public Const DNACOND_GRAPH As Integer = 7
Public Const MUT_DNALENGTH_GRAPH As Integer = 8
Public Const ENERGY_SPECIES_GRAPH As Integer = 9
Public Const DYNAMICCOSTS_GRAPH As Integer = 10
Public Const SPECIESDIVERSITY_GRAPH As Integer = 11
Public Const AVGCHLR_GRAPH As Integer = 12 'Botsareus 8/31/2013 Average chloroplasts graph
Public Const GENETIC_DIST_GRAPH As Integer = 13
Public Const GENERATION_DIST_GRAPH As Integer = 14
Public Const GENETIC_SIMPLE_GRAPH As Integer = 15
'Botsareus 5/24/2013 Customizable graphs
Public Const CUSTOM_1_GRAPH As Integer = 16
Public Const CUSTOM_2_GRAPH As Integer = 17
Public Const CUSTOM_3_GRAPH As Integer = 18
Public strGraphQuery1 As String
Public strGraphQuery2 As String
Public strGraphQuery3 As String
'Botsareus 5/31/2013 Special graph info
Public strSimStart As String
Public Const NUMGRAPHS = 18 'Botsareus 5/25/2013 Two more graphs, moved to globals
Public graphfilecounter(NUMGRAPHS) As Long
Public graphleft(NUMGRAPHS) As Long
Public graphtop(NUMGRAPHS) As Long
Public graphvisible(NUMGRAPHS) As Boolean
Public graphsave(NUMGRAPHS) As Boolean

Public TotalEnergy As Long     ' total energy in the sim
Public totnvegs As Integer          ' total non vegs in sim
Public totnvegsDisplayed As Integer   ' Toggle for display purposes, so the display doesn't catch half calculated value
Public totwalls As Integer          ' total walls count
Public totcorpse As Integer         ' Total corpses

Public TotalChlr As Long 'Panda 8/24/2013 total number of chlroroplasts

Public NoDeaths As Boolean     'Attempt to stop robots dying during the first cycle of a loaded sim
                                'later used in conjunction with a routine to give robs a bit of energy back after loading up.
Public maxfieldsize As Long

Public ismutating As Boolean 'Botsareus 2/2/2013 Tells the parseor to ignore debugint and debugbool while the robot is mutating

'Botsareus 6/11/2013 For music
Declare Function mciSendString Lib "winmm" Alias "mciSendStringA" (ByVal _
    lpstrCommand As String, ByVal lpstrReturnString As String, _
    ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long


Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" _
           (ByVal lpPrevWndFunc As Long, _
            ByVal hwnd As Long, _
            ByVal MSG As Long, _
            ByVal wParam As Long, _
            ByVal lParam As Long) As Long

Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
           (ByVal hwnd As Long, _
            ByVal nIndex As Long, _
            ByVal dwNewLong As Long) As Long
            
Private Declare Function RegisterWindowMessage Lib "user32" _
   Alias "RegisterWindowMessageA" (ByVal lpString As String) As Long
   
'Windows API calls for GetWinHandle
'Stolen from MSDN somewhere
Private Const GW_HWNDNEXT = 2
Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, _
  ByVal wCmd As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" _
  (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Const GWL_WNDPROC = -4
Public Declare Function GetWindowThreadProcessId Lib "user32" _
  (ByVal hwnd As Long, lpdwprocessid As Long) As Long
'Stuff for close window
Private Declare Function WaitForSingleObject Lib "kernel32" _
   (ByVal hHandle As Long, _
   ByVal dwMilliseconds As Long) As Long
Private Declare Function PostMessage Lib "user32" _
   Alias "PostMessageA" _
   (ByVal hwnd As Long, _
   ByVal wMsg As Long, _
   ByVal wParam As Long, _
   ByVal lParam As Long) As Long
Private Declare Function IsWindow Lib "user32" _
   (ByVal hwnd As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" _
   (ByVal dwDesiredAccess As Long, _
   ByVal bInheritHandle As Long, _
   ByVal dwProcessId As Long) As Long
'For args to the IM client
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   
Const WM_CLOSE = &H10
Const INFINITE = &HFFFFFFFF
Const SYNCHRONIZE = &H100000
   
Global lpPrevWndProc As Long
Global gHW As Long

Private MSWHEEL_ROLLMSG     As Long


Public Sub Hook()
  MSWHEEL_ROLLMSG = RegisterWindowMessage("MSWHEEL_ROLLMSG")
  lpPrevWndProc = SetWindowLong(gHW, GWL_WNDPROC, _
                                     AddressOf WindowProc)
End Sub

Public Sub UnHook()
  Dim lngReturnValue As Long
  
  lngReturnValue = SetWindowLong(gHW, GWL_WNDPROC, lpPrevWndProc)
End Sub

Function WindowProc(ByVal hw As Long, _
                        ByVal uMsg As Long, _
                        ByVal wParam As Long, _
                        ByVal lParam As Long) As Long

  Select Case uMsg
    Case MSWHEEL_ROLLMSG
        'Form1.MouseWheelZoom 'Botsareus 4/1/2014 Never worked
    Case Else
       WindowProc = CallWindowProc(lpPrevWndProc, hw, _
                                           uMsg, wParam, lParam)
  End Select
End Function

Private Function ProcIDFromWnd(ByVal hwnd As Long) As Long
   Dim idProc As Long
   
   ' Get PID for this HWnd
   GetWindowThreadProcessId hwnd, idProc
   
   ' Return PID
   ProcIDFromWnd = idProc
End Function

Public Function GetWinHandle(pid As Long) As Long
   Dim tempHwnd As Long
   
   ' Grab the first window handle that Windows finds:
   tempHwnd = FindWindow(vbNullString, vbNullString)
   
   ' Loop until you find a match or there are no more window handles:
   Do Until tempHwnd = 0
      ' Check if no parent for this window
      If GetParent(tempHwnd) = 0 Then
         ' Check for PID match
         If pid = ProcIDFromWnd(tempHwnd) Then
            ' Return found handle
            GetWinHandle = tempHwnd
            ' Exit search loop
            Exit Do
         End If
      End If
   
      ' Get the next window handle
      tempHwnd = GetWindow(tempHwnd, GW_HWNDNEXT)
   Loop
End Function
      
Public Function CloseWindow(pid As Long)
Dim lngReturnValue As Long
Dim lngResult As Long
Dim hThread As Long
Dim hProcess As Long
Dim hWindow As Long

    hWindow = GetWinHandle(pid)
    hThread = GetWindowThreadProcessId(hWindow, pid)
    hProcess = OpenProcess(SYNCHRONIZE, 0&, pid)
    lngReturnValue = PostMessage(hWindow, WM_CLOSE, 0&, 0&)
    lngResult = WaitForSingleObject(hProcess, INFINITE)
        
End Function


' Not sure where to put this function, so it's going here
' makes poff. that is, creates that explosion effect with
' some fake shots...
Public Sub makepoff(n As Integer)
  Dim an As Integer
  Dim vs As Integer
  Dim vx As Integer
  Dim vy As Integer
  Dim x As Long
  Dim y As Long
  Dim t As Byte
  For t = 1 To 20
    an = (640 / 20) * t
    vs = Random(RobSize / 40, RobSize / 30)
    vx = rob(n).vel.x + absx(an / 100, vs, 0, 0, 0)
    vy = rob(n).vel.y + absy(an / 100, vs, 0, 0, 0)
    With rob(n)
    x = Random(.pos.x - .radius, .pos.x + .radius)
    y = Random(.pos.y - .radius, .pos.y + .radius)
    End With
    If Random(1, 2) = 1 Then
      createshot x, y, vx, vy, -100, 0, 0, RobSize * 2, rob(n).color
    Else
      createshot x, y, vx, vy, -100, 0, 0, RobSize * 2, DBrite(rob(n).color)
    End If
  Next t
End Sub

' not sure where to put this function, so it's going here
' adds robots on the fly loading the script of specie(r)
' if r=-1 loads a vegetable (used for repopulation)
Public Sub aggiungirob(ByVal r As Integer, ByVal x As Single, ByVal y As Single) 'Botsareus 5/22/2014 Bugfix by adding byval
  Dim k As Integer
  Dim a As Integer
  Dim i As Integer
  Dim counter As Integer
  
  If r = -1 Then
    counter = 0
    r = Random(0, SimOpts.SpeciesNum - 1)  ' start randomly in the list of species
    
    'Now walk all the species to find a veg.  Should repopulate randomly form all the vegs in the sim
    While ((Not SimOpts.Specie(r).Veg) Or (Not SimOpts.Specie(r).Native)) And counter < SimOpts.SpeciesNum
       r = r + 1
       If r = SimOpts.SpeciesNum Then r = 0
       counter = counter + 1
    Wend
    
    If Not SimOpts.Specie(r).Veg Or Not SimOpts.Specie(r).Native Then
    '  MsgBox "Cannot repopulate with vegetables: add autotroph species or disable repopulation", vbOKOnly + vbCritical, "Warning!"
      'Active = False
      'Form1.SecTimer.Enabled = False
      GoTo getout
    End If
    
    x = fRnd(SimOpts.Specie(r).Poslf * (SimOpts.FieldWidth - 60), SimOpts.Specie(r).Posrg * (SimOpts.FieldWidth - 60))
    y = fRnd(SimOpts.Specie(r).Postp * (SimOpts.FieldHeight - 60), SimOpts.Specie(r).Posdn * (SimOpts.FieldHeight - 60))
  End If
  
  If SimOpts.Specie(r).Name <> "" And SimOpts.Specie(r).path <> "Invalid Path" Then
    a = RobScriptLoad(respath(SimOpts.Specie(r).path) + "\" + SimOpts.Specie(r).Name)
    If a < 0 Then
      SimOpts.Specie(r).Native = False
      GoTo getout
    End If
    
    'Check to see if we were able to load the bot.  If we can't, the path may be wrong, the sim may have
    'come from another machine with a different install path.  Set the species path to an empty string to
    'prevent endless looping of error dialogs.
    If Not rob(a).exist Then
      SimOpts.Specie(r).path = "Invalid Path"
      GoTo getout
    End If
    
    rob(a).Veg = SimOpts.Specie(r).Veg
    If rob(a).Veg Then rob(a).chloroplasts = StartChlr 'Botsareus 2/12/2014 Start a robot with chloroplasts
    'NewMove loaded via robscriptload
    rob(a).Fixed = SimOpts.Specie(r).Fixed
    rob(a).CantSee = SimOpts.Specie(r).CantSee
    rob(a).DisableDNA = SimOpts.Specie(r).DisableDNA
    rob(a).DisableMovementSysvars = SimOpts.Specie(r).DisableMovementSysvars
    rob(a).CantReproduce = SimOpts.Specie(r).CantReproduce
    rob(a).VirusImmune = SimOpts.Specie(r).VirusImmune
    rob(a).Corpse = False
    rob(a).Dead = False
    rob(a).body = 1000
  '  EnergyAddedPerCycle = EnergyAddedPerCycle + 10000
    rob(a).radius = FindRadius(a)
    rob(a).Mutations = 0
    rob(a).LastMut = 0
    rob(a).generation = 0
    rob(a).SonNumber = 0
    rob(a).parent = 0
    rob(a).mem(468) = 32000
    rob(a).mem(AimSys) = Random(1, 1256) / 200
    rob(a).mem(SetAim) = rob(a).aim * 200
'    rob(a).mem(480) = 32000 Botsareus 2/21/2013 Broken
'    rob(a).mem(481) = 32000
'    rob(a).mem(482) = 32000
'    rob(a).mem(483) = 32000
    rob(a).aim = Rnd(PI)
    Erase rob(a).mem
    'If rob(a).Veg Then rob(a).Feed = 8
    If rob(a).Shape = 0 Then
      rob(a).Shape = Random(3, 5)
    End If
    If rob(a).Fixed Then rob(a).mem(216) = 1
    rob(a).pos.x = x
    rob(a).pos.y = y
    
    
    rob(a).aim = Rnd * PI * 2 'Botsareus 5/30/2012 Added code to rotate the robot on placment
    rob(a).mem(SetAim) = rob(a).aim * 200
    
    'Bot is already in a bucket due to the prepare routine
   ' rob(a).BucketPos.x = -2
   ' rob(a).BucketPos.Y = -2
    UpdateBotBucket a
    rob(a).nrg = SimOpts.Specie(r).Stnrg
   ' EnergyAddedPerCycle = EnergyAddedPerCycle + rob(a).nrg
    rob(a).Mutables = SimOpts.Specie(r).Mutables
    
    rob(a).Vtimer = 0
    rob(a).virusshot = 0
    rob(a).genenum = CountGenes(rob(a).dna)
    
    
    rob(a).DnaLen = DnaLen(rob(a).dna())
    rob(a).GenMut = rob(a).DnaLen / GeneticSensitivity 'Botsareus 4/9/2013 automatically apply genetic to inserted robots
    
    
    rob(a).mem(DnaLenSys) = rob(a).DnaLen
    rob(a).mem(GenesSys) = rob(a).genenum
    
    
    For i = 0 To 7 'Botsareus 5/20/2012 fix for skin engine
      rob(a).Skin(i) = SimOpts.Specie(r).Skin(i)
    Next i
    
    rob(a).color = SimOpts.Specie(r).color
    makeoccurrlist a
  End If
getout:
End Sub

