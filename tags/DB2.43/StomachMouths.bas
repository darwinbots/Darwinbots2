Attribute VB_Name = "StomachMouths"
Option Explicit

Private Const Foodsize As Integer = 80
Private Const Foodmass As Integer = 90

Private Type Poisontype
  Amount As Single
  Memloc As Integer
End Type

Type MaterialPacket
'this holds things for the env grid, stomachs, food shots,
'mouths, feces, and anything else I can think of
'any values of -1 represent infinite amounts
'please don't reference these values anywhere except in this module.
'because things may need to be changed drastically in the future

  Amount As Single 'how much stuff is actually in our stomach.
                   'used for calculating ratios
  
  'cellular types
  nrg As Single
  protein As Single
  muscle As Single
  fat As Single
  poison As Single
  venom As Single
  'poison() As Poisontype 'we can have more than one type of poison in our stomach
  'Venom() As Poisontype
  Slime As Single
  CalciumShell As Single
  SilicateShell As Single
  carbs As Single
  
  CaCo3 As Single 'the natural occuring form of calcium.
  'most of the time this will pass right through
  Si2 As Single 'Si2, ie: sand, this too shall pass
  
  H2S As Single 'for black smokers
  s As Single   'ditto
  SO4 As Single
  Fe As Single
  FeS As Single
  FeS2 As Single
  
  N2 As Single 'gas
  N2O As Single 'gas
  'NH2 As Single
  NH3 As Single 'gas
  NH4 As Single
  NO2 As Single
  NO3 As Single
  
  
  O2 As Single 'gas
  CO2 As Single 'gas
  H20 As Single 'for terrestrial sims
  light As Single 'silly, yes, but this is how plants will receive nrg from light
  
  'an idea: user defined reactions and susbstances
  'for more complex simulations
  Customtype1 As Single
  Customtype2 As Single
  Customtype3 As Single
  Customtype4 As Single
  Customtype5 As Single
End Type

Public Function Equals_Part_Body(robot_number As Integer, n As Single) As MaterialPacket
'  Dim temp As MaterialPacket
  
  'With rob(robot_number).contents
   
  'temp.Waste = .Waste * n
  '.Waste = .Waste - temp.Waste
'  temp.nrg = .nrg * n
'  .nrg = .nrg - temp.nrg
'  temp.protein = .protein * n
'  .protein = .protein - temp.protein
'  temp.muscle = .muscle * n
'  .muscle = .muscle - temp.muscle
'  temp.fat = .fat * n
'  .fat = .fat - temp.fat
'  temp.Slime = .Slime * n
'  .Slime = .Slime - temp.Slime
'  temp.carbs = .carbs * n
'  .carbs = .carbs - temp.carbs
'  temp.CalciumShell = .CalciumShell * n
'  .CalciumShell = .CalciumShell - temp.CalciumShell
'  temp.SilicateShell = .SilicateShell * n
'  .SilicateShell = .SilicateShell - temp.SilicateShell
'  temp.H2S = .H2S * n
'  .H2S = .H2S - temp.H2S
'  'temp.calcium = .calcium * n
'  '.calcium = .calcium - temp.calcium
'  'temp.Silicate = .Silicate * n
'  '.Silicate = .Silicate - temp.Silicate
'  'temp.Sulfur = .Sulfur * n
'  '.Sulfur = .Sulfur - temp.Sulfur
'
'  'to add:
'  'stuff from stomach
'  'based on size
'  'etc.
'
'  'temp.Amount = temp.Waste + temp.nrg + temp.protein + temp.muscle + temp.fat
'  'temp.Amount = temp.Amount + temp.Slime + temp.carbs + temp.CalciumShell'
'  'temp.Amount = temp.Amount + temp.SilicateShell + temp.H2S + temp.calcium + temp.Silicate
'  'temp.Amount = temp.Amount + temp.Sulfur
'
  '.Amount = .Amount - temp.Amount
  
'  End With
End Function

Public Function Add_This(this As MaterialPacket)
  'Amount = Amount + this.Amount
End Function

