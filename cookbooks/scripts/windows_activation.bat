IF %computername%==%chefserver% exit

@echo off

IF EXIST "c:\scripts\win_act.txt" (
    echo Windows already activated
) ELSE (
    mkdir c:\scripts
    echo. 2>c:\scripts\win_act.txt
    slmgr.vbs /ipk %winactkey%
    slmgr.vbs /ato
)

exit
