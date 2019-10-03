IF %computername%==%chefserver% exit

set var=msoffice_act2
IF EXIST c:\scripts\%var%.txt (
	echo %var% Already Activated
) ELSE (
    gpupdate /force
    cscript "C:\Program Files\Microsoft Office\Office16\ospp.vbs" /inpkey:%msofficekey%
    cscript "C:\Program Files\Microsoft Office\Office16\ospp.vbs" /act 
    echo. 2>c:\scripts\%var%.txt
)
