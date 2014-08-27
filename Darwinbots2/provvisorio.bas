Attribute VB_Name = "IntOpts"
Option Explicit

'Persistant Settings
Public IName As String
Public InboundPath As String
Public OutboundPath As String
Public ServIP As String
Public ServPort As String

'This is the window handle to DarwinbotsIM
Public pid As Long
Public Active As Boolean
Public InternetMode As Boolean
Public StartInInternetMode As Boolean


'This stuff is needed so graphing works
Public Const MAXINTERNETSPECIES = 500
Public Const MAXINTERNETSIMS = 100
Public InternetSpecies(MAXINTERNETSPECIES) As datispecie ' Used for graphing the number of species in the inter connected internet sim
Public numInternetSpecies As Integer
Public namesOfInternetBots(MAXINTERNETSPECIES) As String

' gives an internet organism his absurd name
Public Function AttribuisciNome(n As Integer) As String
  Dim p As String
  p = "dt" + CStr(Format(Date, "yymmdd"))
  p = p + "cn" + "00" 'CStr(n)
  p = p + "mf" + CStr(Int(SimOpts.PhysMoving * 100))
  p = p + "bm" + CStr(Int(SimOpts.PhysBrown * 100))
  p = p + "sf" + CStr(Int(SimOpts.PhysSwim * 100))
  p = p + "ac" + CStr(Int(SimOpts.CostExecCond * 100))
  p = p + "sc" + CStr(Int(SimOpts.Costs(COSTSTORE) * 100))
  p = p + "ce" + CStr(Int(SimOpts.Costs(SHOTCOST) * 100))
  If SimOpts.EnergyExType Then
    p = p + "et" + CStr(Int(SimOpts.EnergyProp * 100))
    p = p + "tt1"
  Else
    p = p + "et" + CStr(Int(SimOpts.EnergyFix * 100))
    p = p + "tt2"
  End If
  p = p + "rc" + CStr(Random(0, 99999))
  p = p + ".dbo"
  AttribuisciNome = p
End Function


