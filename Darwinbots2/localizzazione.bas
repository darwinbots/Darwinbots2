Attribute VB_Name = "localizzazione"
Public SBcycsec As String
Public SBtotobj As String
Public SBtotrob As String
Public SBtotveg As String
Public SBborn As String
Public SBtotcyc As String
Public SBtottim As String
Public MBexit As String
Public MBsure As String
Public MBnotloaded As String
Public MBnotsaved As String
Public MBwarning As String
Public MBcannotfindV As String
Public MBcannotfindI As String
Public MBrobotsdead As String
Public MBnovalidrob As String
Public MBSaveDNA As String
Public MBDNANotSaved As String
Public MBSaveSim As String
Public MBLoadSim As String
Public WSmutratesfor As String
Public WSmutrates As String
Public WSchoosedna As String
Public WSproperties As String
Public WSnone As String
Public WScannotfind As String
Public OTtoggledisplay As String

Sub globstrings()
  On Error Resume Next
  SBcycsec = LoadResString(14001)
  SBtotobj = LoadResString(14002)
  SBtotrob = LoadResString(14003)
  SBtotveg = LoadResString(14004)
  SBborn = LoadResString(14005)
  SBtotcyc = LoadResString(14006)
  SBtottim = LoadResString(14007)
  MBsure = LoadResString(20001)
  MBnotloaded = LoadResString(20002)
  MBnotsaved = LoadResString(20003)
  MBwarning = LoadResString(20004)
  MBcannotfindV = LoadResString(20005)
  MBcannotfindI = LoadResString(20006)
  MBrobotsdead = LoadResString(20007)
  MBnovalidrob = LoadResString(20014)
  WSmutratesfor = LoadResString(20008)
  WSmutrates = LoadResString(20009)
  WSchoosedna = LoadResString(20010)
  WSproperties = LoadResString(20011)
  WSnone = LoadResString(20012)
  WScannotfind = LoadResString(20013)
  MBSaveDNA = LoadResString(20016)
  MBDNANotSaved = LoadResString(20015)
  MBSaveSim = LoadResString(20017)
  MBLoadSim = LoadResString(20018)
  OTtoggledisplay = LoadResString(30000)
End Sub

Sub strings(frm As Form)
    On Error Resume Next
    Dim ctl As Control
    Dim obj As Object
    Dim fnt As Object
    Dim sCtlType As String
    Dim nVal As Integer
    frm.Caption = LoadResString(CInt(frm.Tag))
    For Each ctl In frm.Controls
        sCtlType = TypeName(ctl)
        If sCtlType = "Label" Then
            ctl.Caption = LoadResString(CInt(ctl.Tag))
        ElseIf sCtlType = "Menu" Then
            ctl.Caption = LoadResString(CInt(ctl.Caption))
        ElseIf sCtlType = "TabStrip" Then
            For Each obj In ctl.Tabs
                obj.Caption = LoadResString(CInt(obj.Tag))
                obj.ToolTipText = LoadResString(CInt(obj.ToolTipText))
            Next
        ElseIf sCtlType = "Toolbar" Then
            For Each obj In ctl.Buttons
                obj.ToolTipText = LoadResString(CInt(obj.ToolTipText))
            Next
        ElseIf sCtlType = "ListView" Then
            For Each obj In ctl.ColumnHeaders
                obj.text = LoadResString(CInt(obj.Tag))
            Next
        Else
            nVal = 0
            nVal = val(ctl.Tag)
            If nVal > 0 Then
              If ctl.Caption <> "" Then
                ctl.Caption = LoadResString(nVal)
              Else
                ctl.ToolTipText = LoadResString(nVal)
              End If
            End If
            nVal = 0
            nVal = val(ctl.ToolTipText)
            If nVal > 0 Then ctl.ToolTipText = LoadResString(nVal)
        End If
    Next
End Sub
