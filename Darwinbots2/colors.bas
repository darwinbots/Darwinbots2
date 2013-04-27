Attribute VB_Name = "stuffcolors"
Public Type R_G_B
r As Long
g As Long
b As Long
End Type
Public Type H_S_L
h As Double
s As Double
l As Double
End Type

Public chartcolor As Long
Public backgcolor As Long

Public Function hsltorgb(hslin As H_S_L) As R_G_B
hsltorgb = huetorgb(hslin.h)
Dim c As R_G_B
c.r = 127.5
c.g = 127.5
c.b = 127.5
hsltorgb = mixrgb(hsltorgb, c, 1 - (hslin.s / 240))
If hslin.l < 120 Then
c.r = 0
c.g = 0
c.b = 0
hsltorgb = mixrgb(c, hsltorgb, hslin.l / 120)
Else
c.r = 255
c.g = 255
c.b = 255
hsltorgb = mixrgb(hsltorgb, c, (hslin.l - 120) / 120)
End If
End Function

Public Function huetorgb(h) As R_G_B
Dim Delta As Double
Delta = Int(h) Mod 40
 h = h - Delta
  Delta = 255 / 40 * Delta
If h < 240 Then
huetorgb.r = 255
huetorgb.g = 0
huetorgb.b = 255 - Delta
End If
If h < 200 Then
huetorgb.r = Delta
huetorgb.g = 0
huetorgb.b = 255
End If
If h < 160 Then
huetorgb.r = 0
huetorgb.g = 255 - Delta
huetorgb.b = 255
End If
If h < 120 Then
huetorgb.r = 0
huetorgb.g = 255
huetorgb.b = Delta
End If
If h < 80 Then
huetorgb.r = 255 - Delta
huetorgb.g = 255
huetorgb.b = 0
End If
If h < 40 Then
huetorgb.r = 255
huetorgb.g = Delta
huetorgb.b = 0
End If
End Function

Public Function mixrgb(c1 As R_G_B, c2 As R_G_B, factor) As R_G_B
mixrgb.r = c1.r * (1 - factor) + c2.r * factor
mixrgb.g = c1.g * (1 - factor) + c2.g * factor
mixrgb.b = c1.b * (1 - factor) + c2.b * factor
End Function

