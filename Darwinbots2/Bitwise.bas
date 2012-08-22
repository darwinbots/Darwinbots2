Attribute VB_Name = "Bitwise"
Option Explicit

'Darwinbots uses Two's Compliment for bit representation.
'Note that the first bit is that bit which is written leftmost in
'writing.  ie: 1 is first bit 00000000000000000000000000000001

'Note that bitwise operations are mod 2^(n-1) where n is the number of bits
'1 bit is used for positive/negative.  Also, you can go one large in the
'negative direction than you can in the positive

Public Type DoubleWord '4 bytes
  bit(31) As Boolean '32 bit locations
End Type

'tested and works Sept-21-05
Public Function NumberToBit(ByVal value As Long) As DoubleWord
  Dim negative As Boolean
  Dim counter As Long

  If value < 0 Then
    negative = True
    value = -value
  End If

  For counter = 30 To 0 Step -1
    If value \ Int(2 ^ counter) = 1 Then
      'bit is true
      NumberToBit.bit(counter) = True
      value = value - 2 ^ counter
    Else
      NumberToBit.bit(counter) = False
    End If
  Next counter

  If negative Then
    'invert bits then add 1
    InvertBits NumberToBit
    IncBits NumberToBit
  End If
End Function

'tested and works Sept-21-05
Public Function BitToNumber(ByRef bits As DoubleWord) As Long
  Dim counter As Long
  Dim negative As Boolean

  BitToNumber = 0
  negative = False

  If bits.bit(31) = True Then
    'negative value, so subtract 1 then invert bits
    'to get magnitude
    negative = True
    DecBits bits
    InvertBits bits
  End If

  For counter = 0 To 30 '31st bit is always zero at this point
    BitToNumber = BitToNumber + (2 ^ counter) * (bits.bit(counter) * True)
  Next counter

  If negative Then BitToNumber = -BitToNumber
End Function

Public Sub InvertBits(ByRef bits As DoubleWord) 'compliment
  Dim counter As Long

  For counter = 0 To 31
    bits.bit(counter) = Not bits.bit(counter)
  Next counter
End Sub

'tested and works Sept-21-05
Public Sub IncBits(ByRef bits As DoubleWord) 'bitinc
  Dim counter As Long

  For counter = 0 To 31
    If bits.bit(counter) = False Then
      bits.bit(counter) = True
      Exit Sub 'we're done
    Else
      'we have to carry bits
      bits.bit(counter) = False
    End If
  Next counter
End Sub

'tested and works Sept-21-05
Public Sub DecBits(ByRef bits As DoubleWord) 'bitdec
  Dim counter As Long

  For counter = 0 To 31
    If bits.bit(counter) = True Then
      bits.bit(counter) = False
      Exit Sub 'we're done
    Else
      'we have to borrow bits
      bits.bit(counter) = True
    End If
  Next counter
End Sub

'tested and works Sept-21-05
Public Sub BitShiftLeft(ByRef bits As DoubleWord) 'AKA mult by 2 (<<)
  Dim counter As Long

  For counter = 31 To 1 Step -1
    bits.bit(counter) = bits.bit(counter - 1)
  Next counter

  bits.bit(0) = False
End Sub

'tested and works Sept-21-05
Public Sub BitShiftRight(ByRef bits As DoubleWord) 'AKA divide by 2 (>>)
  Dim counter As Long
  Dim lastbit As Boolean
  
  lastbit = bits.bit(31)

  For counter = 0 To 30
    bits.bit(counter) = bits.bit(counter + 1)
  Next counter

  bits.bit(31) = lastbit
End Sub

Public Function BitAND(ByRef bitsA As DoubleWord, ByRef bitsB As DoubleWord) As DoubleWord
  Dim counter As Long

  For counter = 0 To 31
    BitAND.bit(counter) = bitsA.bit(counter) And bitsB.bit(counter)
  Next counter
End Function

Public Function BitOR(ByRef bitsA As DoubleWord, bitsB As DoubleWord) As DoubleWord
  Dim counter As Long

  For counter = 0 To 31
    BitOR.bit(counter) = bitsA.bit(counter) Or bitsB.bit(counter)
  Next counter
End Function

Public Function BitXOR(ByRef bitsA As DoubleWord, bitsB As DoubleWord) As DoubleWord
  Dim counter As Long

  For counter = 0 To 31
    BitXOR.bit(counter) = bitsA.bit(counter) Xor bitsB.bit(counter)
  Next counter
End Function
