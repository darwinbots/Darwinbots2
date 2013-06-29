!include MUI2.nsh
!include VB6RunTime.nsh
!include Library.nsh

# Settings
	Name "Darwinbots 2"
	OutFile "Darwinbots-2-45-03-Setup.exe"
	SetCompress auto
	SetCompressor lzma
	
	#Default Install Directory
	InstallDir "$PROFILE\Darwinbots2"
	
	#Installation Folder RegKey
	InstallDirRegKey HKCU "Software\Darwinbots2" "InstallLocation"
	
	#Try and get Admin privliges so we can register the dlls
	RequestExecutionLevel admin

# MUI Global Settings
	!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
	!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"
	#Header
	!define MUI_HEADERIMAGE
	!define MUI_HEADERIMAGE_BITMAP "db-header.bmp"
	!define MUI_HEADERIMAGE_UNBITMAP "db-header.bmp"
	#Welcome/Finish Page
	!define MUI_WELCOMEFINISHPAGE_BITMAP "db-welcome-in.bmp"
	!define MUI_UNWELCOMEFINISHPAGE_BITMAP "db-welcome-out.bmp"
	#Componenets Page
	!define MUI_COMPONENETSPAGE_NODESC
	#Installer/Uninstaller Page
	!define MUI_FINISHPAGE_NOAUTOCLOSE
	!define MUI_UNFINISHPAGE_NOAUTOCLOSE
	#Abort Warning
	!define MUI_ABORTWARNING
	!define MUI_UNABORTWARNING
	
# Variables
	Var StartMenuFolder
	Var AlreadyInstalled
# Pages
	# Install Pages
		# Welcome Page
		!insertmacro MUI_PAGE_WELCOME
		# License
		!insertmacro MUI_PAGE_LICENSE "License.rtf"
		# Componenets Selection
		# We actually dont have a need for a components page
		#!insertmacro MUI_PAGE_COMPONENTS
		# Directory Select
		!insertmacro MUI_PAGE_DIRECTORY
		# Start Menu Location
		!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
		!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Darwinbots2"
		!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "StartMenuFolder"
		!insertmacro MUI_PAGE_STARTMENU "Application" $StartMenuFolder
		# Install Files
		!insertmacro MUI_PAGE_INSTFILES
		# Finsih Page
		!insertmacro MUI_PAGE_FINISH
	# Uninstall Pages
		# Welcome Page
		!insertmacro MUI_UNPAGE_WELCOME
		# Confirm Page
		!insertmacro MUI_UNPAGE_CONFIRM
		# Progress Page
		!insertmacro MUI_UNPAGE_INSTFILES
		# Finish Page
		!insertmacro MUI_UNPAGE_FINISH
# LANGUAGE
	!insertmacro MUI_LANGUAGE "English"
# SECTIONS
	Section "-Darwinbots Section" SecDB
		IfFileExists "$INSTDIR\DBLaunch.exe" 0 new_installation 
			StrCpy $AlreadyInstalled 1
		new_installation:
		SetOutPath "$INSTDIR"
		# Files
		CreateDirectory "$INSTDIR\IM"
		CreateDirectory "$INSTDIR\IM\inbound"
		CreateDirectory "$INSTDIR\IM\outbound"
		CreateDirectory "$INSTDIR\Saves"
		CreateDirectory "$INSTDIR\Autosave"
		CreateDirectory "$INSTDIR\Robots"
		CreateDirectory "$INSTDIR\settings"
		File Darwin2.45.03B.exe
		File DBLaunch.exe
		File DarwinbotsIM.exe
		File "DB THEME GOLD.mp3"
		File "Graph Join.exe"
		File "Snapshot Search.exe"
		File License.rtf
		SetOutPath "$INSTDIR\Robots"
		File bots\*.txt
		
		# Store Install Folder
		WriteRegStr HKCU "Software\Darwinbots2" "InstallLocation" $INSTDIR
		
		# Create our uninstaller
		WriteUninstaller "$INSTDIR\Uninstall.exe"
		
		# Create the start menu shortcuts
		!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
			;Create shortcuts
			CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Darwinbots 2.lnk" "$INSTDIR\DBLaunch.exe"
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Graph Join.lnk" "$INSTDIR\Graph Join.exe"
			CreateShortCut "$SMPROGRAMS\$StartMenuFolder\Snapshot search.lnk" "$INSTDIR\Snapshot Search.exe"

		!insertmacro MUI_STARTMENU_WRITE_END
	SectionEnd
	
	Section "-VB6 Runtimes" SecVB
		# Installs the VB6 Runtime
		!insertmacro VB6RunTimeInstall vb6runtime $AlreadyInstalled
		  
		# Register our controls if they are not already there
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED COMCT232.OCX $SYSDIR\COMCT232.OCX $SYSDIR
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED COMDLG32.OCX $SYSDIR\COMDLG32.OCX $SYSDIR
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED MSCOMCTL.OCX $SYSDIR\MSCOMCTL.OCX $SYSDIR
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED RICHTX32.OCX $SYSDIR\RICHTX32.OCX $SYSDIR
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED TABCTL32.OCX $SYSDIR\TABCTL32.OCX $SYSDIR
		!insertmacro InstallLib REGDLL $AlreadyInstalled REBOOT_NOTPROTECTED MSSTDFMT.DLL $SYSDIR\MSSTDFMT.DLL $SYSDIR
		  
		  
	SectionEnd
	
	#UNSECTONS
	Section "un.Darwinbots Section" SecUnDB
		RMDir /r "$INSTDIR\IM"
		RMDir /r "$INSTDIR\Saves"
		RMDir /r "$INSTDIR\Autosave"
		RMDir /r "$INSTDIR\Robots"
		RMDir /r "$INSTDIR\settings"
		Delete $INSTDIR\Darwin2*.exe
		Delete $INSTDIR\*.gset
		Delete $INSTDIR\DBLaunch.exe
		Delete $INSTDIR\DarwinbotsIM.exe
		Delete "$INSTDIR\DB THEME GOLD.mp3"
		Delete "$INSTDIR\Graph Join.exe"
		Delete "$INSTDIR\Snapshot Search.exe"
		Delete $INSTDIR\intsett.ini
		Delete $INSTDIR\License.rtf
		Delete $INSTDIR\Uninstall.exe
		RMDir $INSTDIR
		
		!insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder
		Delete "$SMPROGRAMS\$StartMenuFolder\Darwinbots 2.lnk"
		Delete "$SMPROGRAMS\$StartMenuFolder\Snapshot search.lnk"
		Delete "$SMPROGRAMS\$StartMenuFolder\Graph Join.lnk"
		Delete "$SMPROGRAMS\$StartMenuFolder\Uninstall.lnk"
		RMDir "$SMPROGRAMS\$StartMenuFolder"

		DeleteRegKey HKCU "Software\Darwinbots2"
	SectionEnd
	
	Section "un.VB6 Runtimes" SecUnVB
		# Uninstalls the VB6 Runtime
		!insertmacro VB6RunTimeUnInstall
		
		# Get rid of the controls if nothing is using them
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\COMCT232.OCX
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\COMDLG32.OCX
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\MSCOMCTL.OCX
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\RICHTX32.OCX
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\TABCTL32.OCX
		!insertmacro UnInstallLib REGDLL SHARED REBOOT_NOTPROTECTED $SYSDIR\MSSTDFMT.DLL
	SectionEnd
	