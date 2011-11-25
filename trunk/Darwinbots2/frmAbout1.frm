VERSION 5.00
Begin VB.Form DNA_Help 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Help for DNA commands"
   ClientHeight    =   7335
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   10455
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5062.748
   ScaleMode       =   0  'User
   ScaleWidth      =   9817.785
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Help 
      Height          =   5835
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   840
      Width           =   9975
   End
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   540
      Left            =   240
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   1
      Top             =   240
      Width           =   540
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "Enough Already!!"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   6480
      TabIndex        =   0
      Top             =   6840
      Width           =   1740
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   84.515
      X2              =   8451.465
      Y1              =   2070.654
      Y2              =   2070.654
   End
   Begin VB.Label lblTitle 
      Caption         =   "Application Title"
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   1050
      TabIndex        =   2
      Top             =   240
      Width           =   3885
   End
End
Attribute VB_Name = "DNA_Help"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Reg Key Security Options...
Const READ_CONTROL = &H20000
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_CREATE_LINK = &H20
Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + _
                       KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + _
                       KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
                     
' Reg Key ROOT Types...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Unicode nul terminated string
Const REG_DWORD = 4                      ' 32-bit number

Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
    Me.Caption = "DarwinBots V2.32beta DNA Help"
    lblTitle.Caption = "DarwinBots V2.32beta DNA Help"
    help.text = ""
    help.text = help.text + vbTab + vbTab + vbTab + vbTab + "DarwinBots V2.32beta DNA" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "This is a very brief listing of all the DNA commands and how they work" + vbCrLf
    help.text = help.text + vbTab + "Just to keep it interesting it is told from a robot's eye view. HeHe!" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "First here is a reminder of the mathematical operators" + vbCrLf
    help.text = help.text + "These can only be used in the Action step of the DNA. (after START)" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "add" + vbTab + "-----" + vbTab + "Adds the top two values on the stack and leaves the result on the stack" + vbCrLf
    help.text = help.text + vbTab + vbTab + "The original two numbers are removed." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(15 25 add) will add 15 to 25 and leave 40 on the stack" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "sub" + vbTab + "-----" + vbTab + "Subtracts the top value on the stack from the second value on the stack." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The result is left on the stack and the original two numbers are removed." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(15 25 sub) will subtract 25 from 15 and leave -10 on the stack" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "mult" + vbTab + "-----" + vbTab + "Multiplies the top two values on the stack and leaves the result on the stack" + vbCrLf
    help.text = help.text + vbTab + vbTab + "The original two numbers are removed." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(15 25 mult) will multiply 15 by 25 and leave 375 on the stack" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "div" + vbTab + "-----" + vbTab + "divides the second value on the stack by the top value on the stack." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The result is left on the stack and the original two numbers are removed." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(150 10 div) will divide 150 by 10 and leave 15 on the stack" + vbCrLf
    help.text = help.text + "" + vbCrLf
     
    help.text = help.text + "rnd" + vbTab + "-----" + vbTab + "Generates a random value from 0 to the top value on the stack." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The result is left on the stack and the original number is removed." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(150 rnd) will generate a random value from 0 to 150 leave it on the stack" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "inc" + vbTab + "-----" + vbTab + "Increments the value stored in a given memory cell by one." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The memory location is defined by the top number on the stack which is then deleted." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(330 inc) will increment the value stored in memory location 330 (.tie)" + vbCrLf
    help.text = help.text + "" + vbCrLf
     
    help.text = help.text + "dec" + vbTab + "-----" + vbTab + "decrements the value stored in a given memory cell by one." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The memory location is defined by the top number on the stack which is then deleted." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(2 dec) will decrement the value stored in memory location 2 (.dn)" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "store" + vbTab + "-----" + vbTab + "Stores the #2 value of the stack into the memory location defined by the #1 value." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The top two stack values are then deleted." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(55 4 store) will store a value of 55 in memory location 4 (.aimdx)" + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "angle" + vbTab + "-----" + vbTab + "Calculates the angle between my co-ordinates and two other co-ordinates." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Place the desired co-ordinates onto the stack first then this function will remove them both and place." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "the calculated angle onto the stack. (1000 1000 angle) will store the angle between where" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I am now and the target co-ordinates, 1000, 1000, onto the stack. Then I can use the new value to show " + vbCrLf
    help.text = help.text + vbTab + vbTab + "me which direction to head in." + vbCrLf
    help.text = help.text + "" + vbCrLf
    
 
  
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "And here are the Boolean comparisson functions which can also be used in the condition step of the DNA" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "=" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when they are exactly equal." + vbCrLf
    help.text = help.text + "%=" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when they are almost equal. +/- 10%" + vbCrLf
    help.text = help.text + "!=" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when they are NOT equal." + vbCrLf
    help.text = help.text + "!%=" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when they are NOT almost equal. +/- 10%" + vbCrLf
    help.text = help.text + ">" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when #2 is greater than #1." + vbCrLf
    help.text = help.text + "<" + vbTab + "-----" + vbTab + "Compares the top two values on the stack. Returns TRUE when #2 is less than #1." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "And finally the System Variables which can also be found in the file (sysvars2.21.txt)" + vbCrLf
    help.text = help.text + "Store a value in one of these locations or read a value from it to activate the command" + vbCrLf
    help.text = help.text + "Many of these are READ ONLY! eg. You can't store a meaningful value into .refeye!" + vbCrLf
    help.text = help.text + "There may be a few exceptions to this rule but hey! I have to keep some secrets." + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "Each of these labels represents a memory location. Remember to put a dot in front of them." + vbCrLf
    help.text = help.text + "If you want to read a value the use a star too." + vbCrLf
    help.text = help.text + "*.refeye will give you the value stored in the mem location represented by the label .refeye." + vbCrLf
  
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "up" + vbTab + "-----" + vbTab + "Accelerates me forward in the direction I am facing." + vbCrLf
    help.text = help.text + "dn" + vbTab + "-----" + vbTab + "Accelerates me backward away from the direction I am facing." + vbCrLf
    help.text = help.text + "sx" + vbTab + "-----" + vbTab + "Accelerates me to the left, 90 degrees from the direction I am facing." + vbCrLf
    help.text = help.text + "dx" + vbTab + "-----" + vbTab + "Accelerates me to the right, 90 degrees from the direction I am facing." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(25 .up store) will store a value of 25 in my memory location 1 (.up)" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I will accelerate by this amount provided my maximum velocity is not exceeded." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "aimsx" + vbTab + "-----" + vbTab + "Rotates me anti-clockwise by the value stored into this location." + vbCrLf
    help.text = help.text + "aimdx" + vbTab + "-----" + vbTab + "Rotates me clockwise by the value stored in this location." + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(25 .aimdx store) will store a value of 25 in my memory location 5 (.aimdx)" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I will rotate by this amount. The input value must be in the range of 1 to 1256." + vbCrLf
    help.text = help.text + "setaim" + vbTab + "-----" + vbTab + "This one could be really useful. By using this I can set my angle to a precise value. Used with angle it will be cool." + vbCrLf
    help.text = help.text + "setaim" + vbTab + "-----" + vbTab + "Used with angle it will be cool." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "shoot" + vbTab + "-----" + vbTab + "Makes me shoot a particle from my front end(usually)." + vbCrLf
    help.text = help.text + "shootval" + vbTab + "-----" + vbTab + "Defines the value of the particle shot with the shoot command." + vbCrLf
    help.text = help.text + "backshot" + vbTab + "-----" + vbTab + "Any non zero value here makes me shoot backwards instead of forward. Neat huh?" + vbCrLf
    help.text = help.text + vbTab + "Syntax." + vbTab + "(50 .shoot store) will store a value of 50 in my memory location 7 (.shoot)" + vbCrLf
    help.text = help.text + vbTab + vbTab + "The value stored in .shoot defines the memory location in which it will strike its target." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The value stored in .shootval will be transferred into that memory location when the shot hits another robot" + vbCrLf
    help.text = help.text + vbTab + vbTab + "A number of specific negative numbers can be used with .shoot." + vbCrLf
    help.text = help.text + vbTab + "-1" + vbTab + "Forces the target robot to fire a -2 (containing some of his energy) shot back toward the first robot" + vbCrLf
    help.text = help.text + vbTab + vbTab + "A -1 shot does not require a value to be stored in .shootval." + vbCrLf
    help.text = help.text + vbTab + "-2" + vbTab + "Fires a shot containing some of the robot's energy." + vbCrLf
    help.text = help.text + vbTab + "-3" + vbTab + "Fires a venom shot." + vbCrLf
    help.text = help.text + vbTab + "-4" + vbTab + "Fires a shot containing some of the robot's waste." + vbCrLf
    help.text = help.text + vbTab + "-5" + vbTab + "Poison shot. Cannot be fired voluntarily, only in response to an incoming -1 shot." + vbCrLf
    help.text = help.text + vbTab + "-6" + vbTab + "As -1 but specifically targets body points rather than energy points." + vbCrLf
     
    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + vbTab + "Hey somebody has been changing the way my poison and venom works. Lets take a look." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Cool! Now i can make custom poison and venom to turn specific memory locations on or off." + vbCrLf
    help.text = help.text + vbTab + vbTab + "in the robot that my shots hit." + vbCrLf
    help.text = help.text + "ploc" + vbTab + "-----" + vbTab + "Defines the memory location where my poison shots will hit" + vbCrLf
    help.text = help.text + vbTab + vbTab + "My poison shot will hit the target in this location and set the value there to zero for as long as he is affetxed by the poison." + vbCrLf
    help.text = help.text + "vloc" + vbTab + "-----" + vbTab + "Defines the memory location where my venom shots will hit" + vbCrLf
    help.text = help.text + vbTab + vbTab + "My venom shot will hit the target in this location and set a specific for as long as he is affected by the venom." + vbCrLf
    help.text = help.text + "venval" + vbTab + "-----" + vbTab + "This is the value that will be placed into the location where my venom shots will hit" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I can do all kinds of fun stuff with this I think." + vbCrLf

    help.text = help.text + "" + vbCrLf
    help.text = help.text + "robage" + vbTab + "-----" + vbTab + "How old am I? Returns my own age." + vbCrLf
    help.text = help.text + "mass" + vbTab + "-----" + vbTab + "How fat am I? Returns the my own mass." + vbCrLf
    help.text = help.text + "maxvel" + vbTab + "-----" + vbTab + "How fast can I move? Returns my maximum velocity. Depends on mass." + vbCrLf
    help.text = help.text + "aim" + vbTab + "-----" + vbTab + "What direction am I facing? Returns my own aim direction." + vbCrLf
    help.text = help.text + "eye1 thru eye9" + vbTab + "-----" + vbTab + "What am I looking at? Returns a value inversly proportional to my" + vbCrLf
    help.text = help.text + vbTab + vbTab + "distance from a viewed robot." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Each eye views a 10 degree arc." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Eye5 looks straight ahead and is the most important eye of all since all reference variables." + vbCrLf
    help.text = help.text + vbTab + vbTab + "(or refvars)are calculated from this eye." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Eye1 looks to the extreme left. About 45 degrees from the centre" + vbCrLf
    help.text = help.text + vbTab + vbTab + "Eye9 looks to the extreme right. About 45 degrees from the centre" + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "vel" + vbTab + "-----" + vbTab + "How fast am I moving? Returns my velocity. (in the direction I am facing)" + vbCrLf
    help.text = help.text + "pain" + vbTab + "-----" + vbTab + "Have I been hurt? Returns the amount of energy lost in the last cycle." + vbCrLf
    help.text = help.text + "pleas" + vbTab + "-----" + vbTab + "Have I been feeding? Returns the amount of energy gained in the last cycle." + vbCrLf
    help.text = help.text + vbTab + vbTab + "As .pain and .pleas both read positive and negative, we don't really need both. Do we?" + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "hitup" + vbTab + "-----" + vbTab + "Have I been hit from behind? Returns a value of 1 when some idiot rear-ends me." + vbCrLf
    help.text = help.text + "hitdn" + vbTab + "-----" + vbTab + "Have I been hit from the front? Returns a value of 1 when I ram somebody else." + vbCrLf
    help.text = help.text + "hitsx" + vbTab + "-----" + vbTab + "Have I been hit from the left? Returns a value of 1 when some idiot crashes into me." + vbCrLf
    help.text = help.text + "hitdx" + vbTab + "-----" + vbTab + "Have I been hit from the right? Returns a value of 1 when some idiot crashes into me." + vbCrLf
    help.text = help.text + "shup" + vbTab + "-----" + vbTab + "Have I been shot from behind? Returns the location value of the shot when somebody shoots me." + vbCrLf
    help.text = help.text + "shdn" + vbTab + "-----" + vbTab + "Have I been shot from the front? Returns the location value of the shot when somebody shoots me." + vbCrLf
    help.text = help.text + "shsx" + vbTab + "-----" + vbTab + "Have I been shot from the left? Returns the location value of the shot when somebody shoots me." + vbCrLf
    help.text = help.text + "shdx" + vbTab + "-----" + vbTab + "Have I been shot from the right? Returns the location value of the shot when somebody shoots me." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "edge" + vbTab + "-----" + vbTab + "Have I crashed into the side of the screen? Returns a value of 1 when I hit the edge." + vbCrLf
    help.text = help.text + "fixed" + vbTab + "-----" + vbTab + "Am I fixed in place? Returns a value of 1 If I am." + vbCrLf
    help.text = help.text + "fixpos" + vbTab + "-----" + vbTab + "Just enter a value of zero to become unfixed or any non-zero value to become fixed again." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "depth" + vbTab + "-----" + vbTab + "How deep am I swimming? Returns the value (in DB units) of my distance from the top of the screen." + vbCrLf
    help.text = help.text + "daytime" + vbTab + "-----" + vbTab + "Is it day or night? Returns the value of 1 for day and 0 for night" + vbCrLf
    help.text = help.text + "ypos" + vbTab + "-----" + vbTab + "How far am I from the top? Returns the value (in DB units) of my distance from the top of the screen." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Haven't we seen that before somewhere? No matter. Ypos and depth share the same memory address anyway." + vbCrLf
    help.text = help.text + "xpos" + vbTab + "-----" + vbTab + "How far am I from the left? Returns the value (in DB units) of my distance from the left of the screen." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "nrg" + vbTab + "-----" + vbTab + "How many energy points do I have left? Returns the value of my energy" + vbCrLf
    help.text = help.text + "body" + vbTab + "-----" + vbTab + "How many body points do I have left? Returns the value of my body" + vbCrLf
    help.text = help.text + vbTab + vbTab + "Body and energy are very closely related. Just think of body as fat storage. A little bit is left there each time I eat." + vbCrLf
    help.text = help.text + vbTab + vbTab + "something. DarwinBots are also able to store and retrieve body points at will. Each body point is worth 10 energy " + vbCrLf
    help.text = help.text + vbTab + vbTab + "points." + vbCrLf
    help.text = help.text + "strbody" + vbTab + "-----" + vbTab + "Store a number of body points away for a rainy day. I get 1 body for 10 energy." + vbCrLf
    help.text = help.text + "fdbody" + vbTab + "-----" + vbTab + "Retreive some of those body points as energy. I get 10 energy points back for 1 body." + vbCrLf
    help.text = help.text + vbTab + vbTab + "My energy storing and retrieving are limited to 100 points of energy in either direction so I can't abuse this ability." + vbCrLf

    help.text = help.text + "" + vbCrLf
    help.text = help.text + "setboy" + vbTab + "-----" + vbTab + "I feel like floating. Sets my bouyancy value in the range of -2000 (sink) to +2000 (float)." + vbCrLf
    help.text = help.text + "rdboy" + vbTab + "-----" + vbTab + "Just how floaty am I though? Reads back my bouyancy value." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Remember you can only float around in pond mode. Bouyancy is a waste of time otherwise." + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "repro" + vbTab + "-----" + vbTab + "It's time to have a baby. I will just let him have a percentage of my energy and body to give him" + vbCrLf
    help.text = help.text + vbTab + vbTab + "a good start in life. AAAHHH! isn't that cute?" + vbCrLf
    help.text = help.text + "mrepro" + vbTab + "-----" + vbTab + "Same as .repro but this time I will make sure that my baby gets the maximum mutations possible." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Even if my mutations are disabled in the options screen he will STILL mutate. BWAAHAAHAAHAA!!" + vbCrLf
    help.text = help.text + "sexrepro" + vbTab + "-----" + vbTab + "Similar to .repro but where can I get the genetic mix to give to my baby?" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I guess I could just grab the genetic code from the nearest passer by, mix it with my own. Et Voila!!" + vbCrLf
    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "!!TIES!!. These things are cool. I can do so much with them." + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "tie" + vbTab + "-----" + vbTab + "Fires a permanent tie toward another robot in my eye5 cell. It won't hit if he is too far away." + vbCrLf
    help.text = help.text + vbTab + vbTab + "The number that I store in .tie becomes the permanent reference address for that tie" + vbCrLf
    help.text = help.text + vbTab + vbTab + "I will need to remember this number so that I can access the tie a little later." + vbCrLf
    help.text = help.text + "tienum" + vbTab + "-----" + vbTab + "This is where I have to store a value to access my tie. If this doesn't match the number" + vbCrLf
    help.text = help.text + vbTab + vbTab + "that I used to make my tie then I can't get at it. What was that number again?" + vbCrLf
    help.text = help.text + "deltie" + vbTab + "-----" + vbTab + "This lets me delete a tie that I don't want any more. I still need that number though." + vbCrLf
    help.text = help.text + "tiepres" + vbTab + "-----" + vbTab + "Oh great! This one tells me the id number of that tie. Even if I didn't fire it?" + vbCrLf
    help.text = help.text + vbTab + vbTab + "If I have more than one tie though, it will only give me the id# for the last one made." + vbCrLf
    help.text = help.text + "tieloc" + vbTab + "-----" + vbTab + "I can comunicate through this tie. .tieloc lets me specify the memory address." + vbCrLf
    help.text = help.text + "tieval" + vbTab + "-----" + vbTab + "This one lets me set the value to transmit into your memory. You know. The location" + vbCrLf
    help.text = help.text + vbTab + vbTab + "defined in .tieloc. I wonder if I can use the same values that I can for .shoot?" + vbCrLf
    help.text = help.text + vbTab + vbTab + "Cool! I can! A -1 value lets me give away the number of energy pionts defined in .tieval." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Wait a minute! Why should I give you my energy? This is MY tie after all. Perhaps I could use a negative value?" + vbCrLf
    help.text = help.text + vbTab + vbTab + "Yeah! that worked. Apparently there is an upper limit of 1000 though." + vbCrLf
    help.text = help.text + "tieang" + vbTab + "-----" + vbTab + "Ties harden after a while. Whatever angle and length that they have at that point becomes permanent." + vbCrLf
    help.text = help.text + vbTab + vbTab + ".tiang lets metemporarily me bend the angle by the value that I store. It springs back though." + vbCrLf
    help.text = help.text + "tielen" + vbTab + "-----" + vbTab + ".tielen lets me stretch or shrink the tie for a cycle or two till it springs back." + vbCrLf
    help.text = help.text + "fixang" + vbTab + "-----" + vbTab + "This one lets me permanently change the angle between the tie and myself." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Zero should make me face you while 628 (half a circle) should make me face directly away from you." + vbCrLf
    help.text = help.text + "fixlen" + vbTab + "-----" + vbTab + "This one lets me permanently change the length of the tie between us." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Better not let it get beyond 1000 units or it will snap." + vbCrLf
    help.text = help.text + "stifftie" + vbTab + "-----" + vbTab + "This one lets me change the stiffness of all my ties. At zero they are springy." + vbCrLf
    help.text = help.text + vbTab + vbTab + "but at the maximum value of 40, my ties get really stiff. Apparently this works by limiting the difference." + vbCrLf
    help.text = help.text + vbTab + vbTab + "in velocity between me and my tied partner." + vbCrLf

    help.text = help.text + "sharenrg" + vbTab + "-----" + vbTab + "This lets me share my energy with any robot that I am tied too. I don't even need to know the tie" + vbCrLf
    help.text = help.text + vbTab + vbTab + "reference number for this. The number stored in here becomes the percentage of our total energy that I receive." + vbCrLf
    help.text = help.text + "sharewaste" + vbTab + "-----" + vbTab + "Now why would I want to share your waste? I know. Perhaps I can just keep 1% then you will get it all." + vbCrLf
    help.text = help.text + vbTab + vbTab + "If you happen to be a veggie then I can use you to convert it to energy again. Sweet!!" + vbCrLf
    help.text = help.text + "shareshell" + vbTab + "-----" + vbTab + "Oh! I can share your shell too. Perhaps we can work together to become a bigger and badder Mulit-Bot." + vbCrLf
    help.text = help.text + vbTab + vbTab + "I think we can actually have 200 shell each if we stay together. That is twice as much as we can alone." + vbCrLf
    help.text = help.text + "shareslime" + vbTab + "-----" + vbTab + "And we can share our slime as well. 200 points each! Wow! I only get 100 if I am alone." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Everything costs a lot less for a Multi-Bot as well. If there are two of us then it is all halved." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Do you think all the costs will be one third if we bring another robot into this Multi-Bot? Why don't we" + vbCrLf
    help.text = help.text + vbTab + vbTab + "all get together?." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Oh I see. I can only have 3 ties so the maximum energy cost reduction factor is 4. Besides that I need a spare" + vbCrLf
    help.text = help.text + vbTab + vbTab + "tie to feed through." + vbCrLf
    help.text = help.text + "multi" + vbTab + "-----" + vbTab + "This one returns a value of one when I become part of a Multi-Bot. That happens when the tie hardens." + vbCrLf
    help.text = help.text + vbTab + vbTab + "I need to be part of a Multi-Bot before I can use the share commands." + vbCrLf

    
    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "The reference variables! This is where I read information about the robot in my eye5 cell. (or even the last one" + vbCrLf
    help.text = help.text + vbTab + "who used to be in it, as these refvars are never cleared aftr use.)" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "refup" + vbTab + "-----" + vbTab + "How many .up commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refdn" + vbTab + "-----" + vbTab + "How many .dn commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refsx" + vbTab + "-----" + vbTab + "How many .sx commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refdx" + vbTab + "-----" + vbTab + "How many .dx commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refaimsx" + vbTab + "-----" + vbTab + "How many .aimsx commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refaimdx" + vbTab + "-----" + vbTab + "How many .aimdx commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refshoot" + vbTab + "-----" + vbTab + "How many .shoot commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refeye" + vbTab + "-----" + vbTab + "How many .eye commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + vbTab + vbTab + "eye1, eye2, eye5, eye9? Any of them. I'm not fussy." + vbCrLf
    help.text = help.text + "refnrg" + vbTab + "-----" + vbTab + "How energy do you have? Returns the number to me" + vbCrLf
    help.text = help.text + "refage" + vbTab + "-----" + vbTab + "How old are you? Returns the number to me" + vbCrLf
    help.text = help.text + "refaim" + vbTab + "-----" + vbTab + "Which direction are you facing? Returns the number to me" + vbCrLf
    help.text = help.text + "reftie" + vbTab + "-----" + vbTab + "How many .tie commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refpoison" + vbTab + "-----" + vbTab + "How many .strpoison commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "refvenom" + vbTab + "-----" + vbTab + "How many .strvenom commands do you have in your DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "reffixed" + vbTab + "-----" + vbTab + "Are you fixed to the spot like a blocked veggie? HaHa!" + vbCrLf
    help.text = help.text + "refkills" + vbTab + "-----" + vbTab + "How many robots have you killed? If you are too tough then maybe I should run away" + vbCrLf


    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "The personal variables! This is where I read information about myself." + vbCrLf
    help.text = help.text + vbTab + "It would be pretty strange to be able to check your DNA but not my own, wouldn't it?" + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "myup" + vbTab + "-----" + vbTab + "How many .up commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "mydn" + vbTab + "-----" + vbTab + "How many .dn commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "mysx" + vbTab + "-----" + vbTab + "How many .sx commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "mydx" + vbTab + "-----" + vbTab + "How many .dx commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myaimsx" + vbTab + "-----" + vbTab + "How many .aimsx commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myaimdx" + vbTab + "-----" + vbTab + "How many .aimdx commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myshoot" + vbTab + "-----" + vbTab + "How many .shoot commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myeye" + vbTab + "-----" + vbTab + "How many .eye commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myties" + vbTab + "-----" + vbTab + "How many .tie commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "mypoison" + vbTab + "-----" + vbTab + "How many .strpoison commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "myvenom" + vbTab + "-----" + vbTab + "How many .strvenom commands I you have in my DNA? Returns the number to me" + vbCrLf
    help.text = help.text + "kills" + vbTab + "-----" + vbTab + "How many other robots have I killed? Returns the number to me" + vbCrLf


    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "More advanced comunication methods." + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "out1" + vbTab + "-----" + vbTab + "Here I can store a value which I want to be easily visible to other robots." + vbCrLf
    help.text = help.text + "out2" + vbTab + "-----" + vbTab + "Here I can store a value which I want to be easily visible to other robots." + vbCrLf
    help.text = help.text + "in1" + vbTab + "-----" + vbTab + "In this location, I can read the value stored in .out1 of a robot that I'm looking at." + vbCrLf
    help.text = help.text + "in2" + vbTab + "-----" + vbTab + "In this location, I can read the value stored in .out2 of a robot that I'm looking at." + vbCrLf

    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + vbTab + "But I can also read your most closely guarded secrets if I really want to." + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "memloc" + vbTab + "-----" + vbTab + "I can store a value in here that represents ANY one of your memory locations." + vbCrLf
    help.text = help.text + "memval" + vbTab + "-----" + vbTab + "And this is where I can read back the value that you have stored there." + vbCrLf
    help.text = help.text + "tmemloc" + vbTab + "-----" + vbTab + "I can store a value in here that represents ANY one of your memory locations." + vbCrLf
    help.text = help.text + vbTab + vbTab + "But only if I am tied to you at the time." + vbCrLf
    help.text = help.text + "tmemval" + vbTab + "-----" + vbTab + "And this is where I can read back the value that you have stored there." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Bit of a bummer having to use the tie that way. Still could be useful though." + vbCrLf

    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "Here are some useful commands for combat and waste management." + vbCrLf
    help.text = help.text + "" + vbCrLf
    help.text = help.text + "mkslime" + vbTab + "-----" + vbTab + "I can make a layer of slime on my body to protect me from your ties. Trouble is it slowly dissolves away." + vbCrLf
    help.text = help.text + "mkshell" + vbTab + "-----" + vbTab + "I can make a big, thick shell to protect my body from your shots. Trouble is it makes me heavy." + vbCrLf
    help.text = help.text + "slime" + vbTab + "-----" + vbTab + "This tells me how much slime I currently have so that I know when to replace it." + vbCrLf
    help.text = help.text + "shell" + vbTab + "-----" + vbTab + "This tells me how big my shell currently is. Perhaps I should make it smaller with a negative value in .mkshell." + vbCrLf
    help.text = help.text + "strvenom" + vbTab + "-----" + vbTab + "Now I can make some venom to store away in a sac ready to shoot you with it." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Hmm? It is a bit expensive though. Only one venom point for two energy points." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Still when I paralyze you it will be well worth the cost." + vbCrLf
    help.text = help.text + "strpoison" + vbTab + "-----" + vbTab + "Perhaps I should make some poison too. That way when you shoot me, you will be the one in trouble." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Hmm? This is a bit expensive too. Only one poison point for two energy points." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Still it will be worth it to watch you whizzing around backwards while you are poisoned." + vbCrLf
    help.text = help.text + "venom" + vbTab + "-----" + vbTab + "This tells me how much venom I have stored up. I can carry up to 32000 units." + vbCrLf
    help.text = help.text + "poison" + vbTab + "-----" + vbTab + "This tells me how much poison I have stored up. I can carry up to 32000 units of it too." + vbCrLf
    help.text = help.text + "waste" + vbTab + "-----" + vbTab + "This tells me how much waste I have accumulated. I can only carry 32000 units of it." + vbCrLf
    help.text = help.text + vbTab + vbTab + "but it would most likely kill me long before I get that much. As I accumulate more of it, my body doesn't work as well." + vbCrLf
    help.text = help.text + vbTab + vbTab + "Luckily it is pretty easy to get rid of it. I can give it to a robot i am tied to or just shoot it out. No problem." + vbCrLf
    help.text = help.text + "pwaste" + vbTab + "-----" + vbTab + "Permanent waste! Shudder!! This stuff is nasty. It builds up slowly. When I dump regular waste" + vbCrLf
    help.text = help.text + vbTab + vbTab + "a little bit is left behind. I can never get rid of Permanent waste and eventually it WILL kill me. If you other robots" + vbCrLf
    help.text = help.text + vbTab + vbTab + "don 't get me first." + vbCrLf

    help.text = help.text + "sun" + vbTab + "-----" + vbTab + "Sun eh? That sounds pretty cool. What do you mean? it only returns a 1 if I am facing upwards?" + vbCrLf
    help.text = help.text + vbTab + vbTab + "What is the point of that?" + vbCrLf

    help.text = help.text + "" + vbCrLf
    help.text = help.text + vbTab + "The Tie reference variables! This is where I read information about the robot on the other end of my tie." + vbCrLf
    help.text = help.text + "" + vbCrLf
    
    help.text = help.text + "readtie" + vbTab + "-----" + vbTab + "I need to specify a tie id# to interogate before I can read values through it." + vbCrLf
    help.text = help.text + vbTab + vbTab + "This value stays with me for as long as I want so I only need to store it once." + vbCrLf
    help.text = help.text + "trefup" + vbTab + "-----" + vbTab + "Exactly like .refup but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefdn" + vbTab + "-----" + vbTab + "Exactly like .refdn but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefsx" + vbTab + "-----" + vbTab + "Exactly like .refsx but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefdx" + vbTab + "-----" + vbTab + "Exactly like .refdx but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefaimsx" + vbTab + "-----" + vbTab + "Exactly like .refaimsx but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefaimdx" + vbTab + "-----" + vbTab + "Exactly like .refaimdx but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefshoot" + vbTab + "-----" + vbTab + "Exactly like .refshoot but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefeye" + vbTab + "-----" + vbTab + "Exactly like .refeye but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefnrg" + vbTab + "-----" + vbTab + "Exactly like .refnrg but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefage" + vbTab + "-----" + vbTab + "Exactly like .refage but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefbody" + vbTab + "-----" + vbTab + "Reads the body body points of a tied robot through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "treffixed" + vbTab + "-----" + vbTab + "Exactly like .reffixed but reads through the tie specified in .readtie." + vbCrLf
    help.text = help.text + "trefaim" + vbTab + "-----" + vbTab + "Exactly like .refaim but reads through the tie specified in .readtie." + vbCrLf
   
   help.text = help.text + "" + vbCrLf
   help.text = help.text + "" + vbCrLf
   help.text = help.text + vbTab + "Well that is all the stuff that they have given me so far. Maybe I will get more stuff to play with in later versions!" + vbCrLf
   help.text = help.text + vbTab + "See You later" + vbCrLf


End Sub



Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
    Dim i As Long                                           ' Loop Counter
    Dim rc As Long                                          ' Return Code
    Dim hKey As Long                                        ' Handle To An Open Registry Key
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' Data Type Of A Registry Key
    Dim tmpVal As String                                    ' Tempory Storage For A Registry Key Value
    Dim KeyValSize As Long                                  ' Size Of Registry Key Variable
    '------------------------------------------------------------
    ' Open RegKey Under KeyRoot {HKEY_LOCAL_MACHINE...}
    '------------------------------------------------------------
    rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' Open Registry Key
    
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Handle Error...
    
    tmpVal = String$(1024, 0)                             ' Allocate Variable Space
    KeyValSize = 1024                                       ' Mark Variable Size
    
    '------------------------------------------------------------
    ' Retrieve Registry Key Value...
    '------------------------------------------------------------
    rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' Get/Create Key Value
                        
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Handle Errors
    
    If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95 Adds Null Terminated String...
        tmpVal = Left(tmpVal, KeyValSize - 1)               ' Null Found, Extract From String
    Else                                                    ' WinNT Does NOT Null Terminate String...
        tmpVal = Left(tmpVal, KeyValSize)                   ' Null Not Found, Extract String Only
    End If
    '------------------------------------------------------------
    ' Determine Key Value Type For Conversion...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' Search Data Types...
    Case REG_SZ                                             ' String Registry Key Data Type
        KeyVal = tmpVal                                     ' Copy String Value
    Case REG_DWORD                                          ' Double Word Registry Key Data Type
        For i = Len(tmpVal) To 1 Step -1                    ' Convert Each Bit
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' Build Value Char. By Char.
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' Convert Double Word To String
    End Select
    
    GetKeyValue = True                                      ' Return Success
    rc = RegCloseKey(hKey)                                  ' Close Registry Key
    GoTo getout                                             ' Exit
    
GetKeyError:      ' Cleanup After An Error Has Occured...
    KeyVal = ""                                             ' Set Return Val To Empty String
    GetKeyValue = False                                     ' Return Failure
    rc = RegCloseKey(hKey)                                  ' Close Registry Key
getout:
End Function


