IF %computername%==%chefserver% exit

set var=office
set ver=1

#Install office (Legacy)
IF EXIST c:\scripts\%var%.txt (
	echo no match
) ELSE (
    net use o: \\%chefserver%\soft-deploy$\office
    mkdir c:\windows\temp\office
    robocopy o:\64bit c:\windows\temp\office /MIR
    net use o: /delete
    c:\windows\temp\office\setup.exe /adminfile c:\windows\temp\office\office.MSP
    echo. 2>c:\scripts\%var%.txt
)

#Install office
#IF EXIST c:\scripts\%var%_%ver%.txt (
#        echo no match
#) ELSE (
#    net use o: \\%chefserver%\soft-deploy$\office
#    mkdir c:\windows\temp\office
#    robocopy o:\64bit c:\windows\temp\office /MIR
#    net use o: /delete
#    c:\windows\temp\office\setup.exe /adminfile c:\windows\temp\office\office.MSP
#    echo. 2>c:\scripts\%var%_%ver%.txt
#)
