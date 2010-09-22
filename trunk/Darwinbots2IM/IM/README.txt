DarwinbotsIM - README.txt
***************************************
If you want to add support for a new version of Darwinbots, please dont edit
this program. The DarwinbotsVersion class holds all of the information needed
to scan for the values we want. This program attempts to download a list of 
new versions at start-up. To add a new version edit the file DarwinbotsIM.txt
and place the version name on a new line by its self. The version name is what
the executable is called, without the extension (ex. Darwin2.44.04). Now create
a new flie in /FTP/DBVersions/ with the same name. Now place the memory
addresses with their name and value on a new line for each. For example:

Name=Darwin2.44.04
Population=0x0060329E
Cps=0x005F5140
MutRate=0x005FBDC8
VegePopulation=0x0060354E
SizeLeft=0x00602C4C
SizeRight=0x00602C48
TotalCycles=0x005F513C

To find the addresses, use a memory scanner. I have been using Cheat Engine
which works very well and lets you find the values quickly. The following are
the datatypes in Cheat Engine.

Population - 2 Byes
Vege Population - 2 Bytes
Cps - Float
MutRate - Float
Size Left - 4 Bytes
Size Right - 4 Bytes
Total Cycles - 4 Bytes

If you do make changes to this program, make sure you increase the version
number for the assembley. Upload it at /FTP/DarwinbotsIM.exe replacing the old
version. Now edit DarwinbotsIM.txt and change the number on the first line to
the new assembley version number. This lets the old versions of the program
become aware that there is a new version and promt the user to update.
When you update DarwinbotsIM.exe, you should include the settings for any new
Darwinbots versions into the respective class. However, do not delete the old
files on the server.