IF %computername%==%chefserver% exit

set var=vnc
set ver=1
set ext=msi

IF EXIST c:\scripts\%var%_%ver%.txt (
	echo %var% Already Installed
) ELSE (
	copy "\\%chefserver%\soft-deploy$\Misc\%var%.%ext%" c:\windows\temp\
        msiexec /i c:\windows\temp\%var%.%ext% /quiet /norestart ADDLOCAL=Server,Viewer VIEWER_ASSOCIATE_VNC_EXTENSION=1 SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 VIEWER_ADD_FIREWALL_EXCEPTION=1 SERVER_ALLOW_SAS=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=warr10r SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=%vncpassword%
	echo. 2>c:\scripts\%var%_%ver%.txt
)
