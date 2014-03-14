Attribute VB_Name = "IntOpts"
Option Explicit

'Persistant Settings
Public IName As String
Public InboundPath As String
Public OutboundPath As String

'This is the window handle to DarwinbotsIM
Public pid As Long
Public pid2 As Long
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
  Dim P As String
  P = "dt" + CStr(Format(Date, "yymmdd"))
  P = P + "cn" + "00" 'CStr(n)
  P = P + "mf" + CStr(Int(SimOpts.PhysMoving * 100))
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
