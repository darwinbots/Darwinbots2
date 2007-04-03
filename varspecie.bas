Attribute VB_Name = "varspecie"
Public Type mutationprobs
  'should the mutation even be triggered?
  Mutations As Boolean
  mutarray(20) As Single 'probs of the different mutations
  
  Mean(20) As Single
  StdDev(20) As Single
  
  'Extras
  PointWhatToChange As Integer
  CopyErrorWhatToChange As Integer
End Type

Public Type datispecie
  Skin(13) As Integer
  path As String
  Name As String
  Stnrg As Integer
  Veg As Boolean
  Fixed As Boolean
  color As Long
  Colind As Integer
  Postp As Single
  Poslf As Single
  Posdn As Single
  Posrg As Single
  qty As Integer
  Comment As String
  Leaguefilecomment As String
  Mutables As mutationprobs
  CantSee As Boolean                ' Flag indicating eyes should be turned off for this species
  DisableDNA As Boolean             ' Flag indicating DNA should not execute for this species
  DisableMovementSysvars As Boolean ' Flag indicating movement sysvars should be disabled for this species
  CantReproduce As Boolean          ' Flag indicating whether reproduction has been disabled for this species.
End Type
