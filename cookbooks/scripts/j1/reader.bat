IF %computername%==%chefserver% exit

set var=reader
set ver=2
set ext=exe

IF EXIST c:\scripts\%var%_%ver%.txt (
	echo %var% Already Installed
) ELSE (
	copy "\\%chefserver%\soft-deploy$\Misc\%var%.%ext%" c:\windows\temp\
        c:\windows\temp\%var%.%ext% /qn /sAll /rs /l /msi /qb- /norestart EULA_ACCEPT=YES REMOVE_PREVIOUS=YES DISABLE_ARM_SERVICE_INSTALL=1 UPDATE_MODE=0
	echo. 2>c:\scripts\%var%_%ver%.txt
)
