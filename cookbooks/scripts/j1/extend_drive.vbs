diskpartScript = "C:\scripts\local\expand\extend_max.txt"
 
Set oShell = CreateObject("Wscript.Shell")
Set oShellExec = oShell.Exec("cmd /c diskpart -s " & diskpartScript)
set oStdOutputText = oShellExec.StdOut
 
On Error Resume Next
Do While Not oStdOutputText.AtEndOfStream
diskpartOutput = oStdOutputText.ReadLine
LogFile.writeline diskpartOutput
Loop