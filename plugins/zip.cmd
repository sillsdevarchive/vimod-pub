:: Plugin Name: Zip
:: Purpose: Intergrate Zip and Unzip processes into VimodPub
:control
:: Description: Test if Zip is installed on computer. Exits batch if not installed or runs pluginsubtask.
:: Required preset variables:
:: pluginsubtask
:: params
:: Required functions:
:: secondline
set plugininstalled=
set testfile=logs\zip-usage.txt
rem the following line will generate a file. If zip is installed the file will have line 3 like: Zip 2.3 (November 29th 1999). Usage:
zip  >%testfile%
call :getline 3 "%testfile%"
if "%getline:~0,3%" == "Zip" set plugininstalled=yes
if not defined plugininstalled (
    echo Zip not installed, or at lease not found in the path.
    echo Zip will not run. This function will exit after you press any key.
    pause
    exit /b
)
call :%pluginsubtask% %params%
goto :eof

:zip
:: Create a zip file
:: Prerequisite parameters: 1
:: zip
:: Required parameters: 2
:: workdir
:: outfile
if defined masterdebug call :funcdebugstart zip
call :inccount
set workdir=%~1
set outfile=%~2
call :ifnotexist "%zip%" fatal "7zip"
if exist "%outfile%" del "%outfile%"
set basepath=%cd%
set command="%zip%" a -y "%outfile%"
call :before
cd "%workdir%"
%command% 
cd "%basepath%"
call :after "%outfile% created"
if defined masterdebug call :funcdebugend
goto :eof

:unzip
:: Unzip a zip archive
:: Prerequisite parameters: 1
:: zip
:: Required parameters: 2
:: zipfile = relpath\file.zip
:: outpath = absolute path
:: Optional parameter: 1
:: overwrite  = string "overwrite"
if defined masterdebug call :funcdebugstart unzip
call :ifnotexisterror "%zip%" fatal "7zip"
echo on
set zipfile=%~dp1\%~1
set outpath=%~2
set overwrite=%~3
set basepath=%cd%
set switch=
if "%~3" == "overwrite" set switch=-y
set command="%zip%" x %switch% "%zipfile%"
set preserveoutfile=%outfile%
set outfile=
call :before
cd "%outpath%"
%cmmand%
cd "%basepath%"
set outfile=%preserveoutfile%
call :after "%zipfile% unzipped"
if defined masterdebug call :funcdebugend
goto :eof

:getline
:: Description: Get a specific line from a file
:: Required parameters:
:: linetoget
:: file
if defined echogetline echo on
set /A count=%~1-1
if "%count%" == "0" (
    for /f %%i in (%~2) do (
        set getline=%%i
        goto :eof 
    )
) else (
    for /f "skip=%count% " %%i in (%~2) do (
        set getline=%%i
        goto :eof 
    )
)
@echo off
goto :eof