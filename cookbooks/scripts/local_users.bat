IF %computername%==%chefserver% exit

set var=local_user
set ver=1

IF EXIST c:\scripts\%var%_%ver%.txt (
	echo %var% Local users created before SysPrep already deleted. 
) ELSE (
        net user cnc /delete
	net user cnc2 /delete
	net user cnc3 /delete
	echo. 2>c:\scripts\%var%_%ver%.txt
)
