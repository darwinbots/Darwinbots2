Attribute VB_Name = "EnvironmentGrid"
Option Explicit

'The E grid is a term that incorporates different ideas:
'Idea 1: a place to store and deposit materials that the bots interact with
'Idea 2: a set of grids that defines physical realities
'  (such as simopts constants and toggles)

'Idea 1 is called the substance grid, Idea 2 is called the physics grid

'The substance grid is done in this file

Private Type Pheremonetype
  ID As Integer
  Amount As Integer
End Type

Const NUMBEROFSUBSTANCES As Integer = 10

Private Type Gridcell
  'Pheremones() As Pheremonetype
  'substance(NUMBEROFSUBSTANCES) As Integer 'holds amounts
  CoefficientStatic As Single
  CoefficientKinetic As Single
  Zgravity As Single
  Ygravity As Single
  Density As Double
  Viscosity As Double
  FlowType As Byte
  PhysBrown As Single
  PhysMoving As Single
End Type

'The EGrid.  Don't allow too fine a grain just yet
Public EGrid() As Gridcell



Public Function FindEGridX(pos As vector) As Integer
  If SimOpts.EGridWidth <> 0 Then
    FindEGridX = CInt(pos.x / SimOpts.EGridWidth)
  Else
    FindEGridX = CInt(pos.x / 4000)
  End If
End Function

Public Function FindEGridY(pos As vector) As Integer
  FindEGridY = CInt(pos.Y / SimOpts.EGridWidth)
End Function


Public Sub InitEGrid()
Dim numXCells As Integer
Dim numYCells As Integer
Dim x As Integer
Dim Y As Integer
  
  If Not SimOpts.EGridEnabled Then
    MDIForm1.EGridEnabled.Checked = False
    MDIForm1.GridSize.Enabled = False
    GoTo getout
  End If
    
  If SimOpts.EGridWidth = 0 Then SimOpts.EGridWidth = 5000
  MDIForm1.SetEgridMenu (SimOpts.EGridWidth)
    
  numXCells = CInt(SimOpts.FieldWidth / SimOpts.EGridWidth)
  numYCells = CInt(SimOpts.FieldHeight / SimOpts.EGridWidth)
  
  ReDim EGrid(numXCells, numYCells)
  
  For x = 0 To numXCells - 1
    For Y = 0 To numYCells - 1
     EGrid(x, Y).Ygravity = SimOpts.Ygravity * Rnd
     EGrid(x, Y).PhysBrown = SimOpts.PhysBrown * Rnd
     EGrid(x, Y).Zgravity = SimOpts.Zgravity * Rnd
   Next Y
  Next x
getout:
End Sub
