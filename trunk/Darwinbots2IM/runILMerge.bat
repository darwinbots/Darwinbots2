Set CLIM=%CD%\DarwinbotsCLIM\bin\Release
Set GUIM=%CD%\DarwinbotsGUIM\bin\Release
Set BASE=%CD%

CD %CLIM%
REN DarwinbotsIM.exe temp.exe
ilmerge /out:DarwinbotsIM.exe temp.exe IM.dll
DEL temp.exe
DEL IM.dll
DEL IM.pdb
XCOPY DarwinbotsIM.exe %BASE%

CD %GUIM%
REN DarwinbotsGUIM.exe temp.exe
ilmerge /out:DarwinbotsGUIM.exe temp.exe IM.dll
DEL temp.exe
DEL IM.dll
DEL IM.pdb
XCOPY DarwinbotsGUIM.exe %BASE%