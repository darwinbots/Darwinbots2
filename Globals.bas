Attribute VB_Name = "Globals"
'A temporary module for everything without a home.

Option Explicit

' var structure, to store the correspondance name<->value
Public Type var
  Name As String
  value As Integer
End Type

Public TotalEnergy As Long     ' total energy in the sim
Public totnvegs As Integer          ' total non vegs in sim
Public totnvegsDisplayed As Integer   ' Toggle for display purposes, so the display doesn't catch half calculated value
Public totwalls As Integer          ' total walls count
Public totcorpse As Integer         ' Total corpses

Public NoDeaths As Boolean     'Attempt to stop robots dying during the first cycle of a loaded sim
                                'later used in conjunction with a routine to give robs a bit of energy back after loading up.
Public maxfieldsize As Long

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
            
Public Const GWL_WNDPROC = -4

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
        Form1.MouseWheelZoom
    Case Else
       WindowProc = CallWindowProc(lpPrevWndProc, hw, _
                                           uMsg, wParam, lParam)
  End Select
End Function


' Not sure where to put this function, so it's going here
' makes poff. that is, creates that explosion effect with
' some fake shots...
Public Sub makepoff(n As Integer)
  Dim an As Integer
  Dim vs As Integer
  Dim vx As Integer
  Dim vy As Integer
  Dim X As Long
  Dim Y As Long
  Dim t As Byte
  For t = 1 To 20
    an = (640 / 20) * t
    vs = Random(RobSize / 40, RobSize / 30)
    vx = rob(n).vel.X + absx(an / 100, vs, 0, 0, 0)
    vy = rob(n).vel.Y + absy(an / 100, vs, 0, 0, 0)
    With rob(n)
    X = Random(.pos.X - .radius, .pos.X + .radius)
    Y = Random(.pos.Y - .radius, .pos.Y + .radius)
    End With
    If Random(1, 2) = 1 Then
      createshot X, Y, vx, vy, -100, 0, 0, RobSize * 2, rob(n).color
    Else
      createshot X, Y, vx, vy, -100, 0, 0, RobSize * 2, DBrite(rob(n).color)
    End If
  Next t
End Sub

' not sure where to put this function, so it's going here
' adds robots on the fly loading the script of specie(r)
' if r=-1 loads a vegetable (used for repopulation)
Public Sub aggiungirob(r As Integer, X As Single, Y As Single)
  Dim k As Integer
  Dim a As Integer
  Dim i As Integer
  If r = -1 Then
    r = 0
    
    While Not SimOpts.Specie(r).Veg And r < 40
      r = r + 1
    Wend
    
    If Not SimOpts.Specie(r).Veg Then
      'MsgBox "Cannot repopulate with vegetables: add autotroph species or disable repopulation", vbOKOnly + vbCritical, "Warning!"
      'Active = False
      'Form1.SecTimer.Enabled = False
      Exit Sub
    End If
    
    X = fRnd(SimOpts.Specie(r).Poslf * (SimOpts.FieldWidth - 60), SimOpts.Specie(r).Posrg * (SimOpts.FieldWidth - 60))
    Y = fRnd(SimOpts.Specie(r).Postp * (SimOpts.FieldHeight - 60), SimOpts.Specie(r).Posdn * (SimOpts.FieldHeight - 60))
  End If
  
  If SimOpts.Specie(r).Name <> "" And SimOpts.Specie(r).path <> "Invalid Path" Then
    a = RobScriptLoad(respath(SimOpts.Specie(r).path) + "\" + SimOpts.Specie(r).Name)
    
    'Check to see if we were able to load the bot.  If we can't, the path may be wrong, the sim may have
    'come from another machine with a different install path.  Set the species path to an empty string to
    'prevent endless looping of error dialogs.
    If Not rob(a).exist Then SimOpts.Specie(r).path = "Invalid Path"
    
    rob(a).Veg = SimOpts.Specie(r).Veg
    'NewMove loaded via robscriptload
    rob(a).Fixed = SimOpts.Specie(r).Fixed
    rob(a).CantSee = SimOpts.Specie(r).CantSee
    rob(a).DisableDNA = SimOpts.Specie(r).DisableDNA
    rob(a).DisableMovementSysvars = SimOpts.Specie(r).DisableMovementSysvars
    rob(a).CantReproduce = SimOpts.Specie(r).CantReproduce
    rob(a).Corpse = False
    rob(a).Dead = False
    rob(a).body = 1000
  '  EnergyAddedPerCycle = EnergyAddedPerCycle + 10000
    rob(a).radius = FindRadius(rob(a).body)
    rob(a).Mutations = 0
    rob(a).LastMut = 0
    rob(a).generation = 0
    rob(a).SonNumber = 0
    rob(a).parent = 0
    rob(a).mem(468) = 32000
    rob(a).mem(AimSys) = Random(1, 1256) / 200
    rob(a).mem(SetAim) = rob(a).aim * 200
    rob(a).mem(480) = 32000
    rob(a).mem(481) = 32000
    rob(a).mem(482) = 32000
    rob(a).mem(483) = 32000
    rob(a).aim = Rnd(PI)
    Erase rob(a).mem
    'If rob(a).Veg Then rob(a).Feed = 8
    If rob(a).Shape = 0 Then
      rob(a).Shape = Random(3, 5)
    End If
    If rob(a).Fixed Then rob(a).mem(216) = 1
    rob(a).pos.X = X
    rob(a).pos.Y = Y
    'UpdateBotBucket a
    rob(a).nrg = SimOpts.Specie(r).Stnrg
   ' EnergyAddedPerCycle = EnergyAddedPerCycle + rob(a).nrg
    rob(a).Mutables = SimOpts.Specie(r).Mutables
    
    rob(a).Vtimer = 0
    rob(a).virusshot = 0
    
    
    For i = 1 To 13
      rob(a).Skin(i) = SimOpts.Specie(r).Skin(i)
    Next i
    rob(a).color = SimOpts.Specie(r).color
    makeoccurrlist a
  End If
End Sub

