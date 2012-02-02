DarwinbotsIM - README.txt
***************************************
As of DB 2.46.00 and DBIM 1.3, DBIM will now read the sim information out of
a file rather than directly from the memory. This process should be backwards
and forward compatible. The binary format for these files is covered in 
population-file-format.txt. Please note where to enter new information as
this is vital to working with old and new versions.

If you do make changes to this program, make sure you increase the version
number for the assembley. Upload it at /FTP/DarwinbotsIM.exe replacing the old
version. Now edit DarwinbotsIM.txt and change the number on the first line to
the new assembley version number. This lets the old versions of the program
become aware that there is a new version and promt the user to update.
When you update DarwinbotsIM.exe, you should include the settings for any new
Darwinbots versions into the respective class. However, do not delete the old
files on the server.