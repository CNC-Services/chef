IF %computername%==%chefserver% exit

set var=firefox_install
set ver=2

IF EXIST c:\scripts\%var%_%ver%.txt (
	echo %var% Already Installed
) ELSE (
	copy "\\%chefserver%\soft-deploy$\Misc\%var%.exe" c:\windows\temp\
	c:\windows\temp\%var%.exe -ms
	echo. 2>c:\scripts\%var%_%ver%.txt
)
