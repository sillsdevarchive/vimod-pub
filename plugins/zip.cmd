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
