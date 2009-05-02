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
  Pheremones() As Pheremonetype
  substance(NUMBEROFSUBSTANCES) As Integer 'holds amounts
End Type

Dim SubstanceGrid(800, 600) As Gridcell 'Maybe 10 megs total

'1.  Inititialize Grid
'2.  Diffuse Grid
'3.  Bot interactions with grid
