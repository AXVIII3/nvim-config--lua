@echo off

REM Check if the shell is running in admin... If not then warn and exit
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Admin right available. Continuing!
) else (
	echo PLEASE RUN AS ADMINISTRATOR
	goto eof
)

REM The list of file extensions to associate with given script
set list=css gitignore html ini js json lua log markdown md php py text txt xml java gd cs ps1

REM This is the command responsible for handling the file
set command=nvim
set profile=PowerShell

REM Create a new file tupe and associate it with %command% via windows terminal in the profile %profile%
echo Create a `ftype` called `txtfile` and assign it to run with %command%:
ftype txtfile=wt.exe new-tab -p %profile% cmd /c %command% "%%1"


REM Hey! I have this batch script which openREM Checking if the txtfile file type is correctly set
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
pause
