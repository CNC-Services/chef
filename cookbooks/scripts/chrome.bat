IF %computername%==%chefserver% exit

set var=googlechromestandaloneenterprise
set ver=2

IF EXIST c:\scripts\%var%_%ver%.txt (
	echo %var% Already Installed
) ELSE (
	copy "\\%chefserver%\soft-deploy$\Misc\%var%.msi" c:\windows\temp\
	msiexec /q /i c:\windows\temp\%var%.msi
	echo. 2>c:\scripts\%var%_%ver%.txt
)
