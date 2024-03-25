@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
	echo Admin right available. Continuing!
) else (
	echo PLEASE RUN AS ADMINISTRATOR
	goto eof
)

REM The list of file extensions to associate with given script
set list=css gitignore html ini js json lua log markdown md php py render sass scss template text txt xml java gd cs ps1

REM This is the batch file which should actually open the file
set myscript="%~dp0neovim.bat"

REM Create a new file tupe and associate it with %myscropt% via the PowerShell profile of windows terminal 
echo:
echo Create a `ftype` called `txtfile` and assign it to run with %myscript%:"
ftype txtfile=wt.exe new-tab -p PowerShell cmd /c "%myscript% \"%%1\""

REM Checking if the txtfile file type is correctly set
echo:
echo `ftype` set for `txtfile`, let's check its set:
ftype | findstr "txtfile"

REM Associate required extensions with created filetype
echo:
echo Create a `assoc` between extensions and`txtfile`
(for %%a in (%list%) do (
   assoc .%%a=txtfile
))

REM Chwcking if the associations are succesfully set
echo:
echo `assoc` set for each extension, lets check `assoc`:
assoc | findstr ".txt"

:eof
timeout 20
