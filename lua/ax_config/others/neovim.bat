@echo off

REM The app to open file with
set my_app=nvim

REM Get file path (from parameters)
set pp=%1

REM Surround path with 'single quotes' and escape already existing \'ones\'
set pp=%pp:'='\''%

REM Escape; semicolon\;
set pp=%pp:;=\;%

REM Run
"%my_app%" "%pp:"=%"
