:: Plugin Name: Phonegap
:: Purpose: Intergrate Phonegap create and build processes into VimodPub
:control
echo on
:: Description: Test if phonegap is installed on computer. Exits batch if not installed or runs pluginsubtask.
:: Required preset variables:
:: pluginsubtask
:: params
:: Required functions:
:: secondline

set phonegapinstalled=
set testphonegap=logs\phonegap-usage.txt
rem if not defined params set params=android
rem the following line will generate a file. If node and phonegap is installed the file will start with "Usage: node"
node "%appdata%\npm\node_modules\phonegap\bin\phonegap.js" --help  >%testphonegap%
call :getlineafter 1 "%testphonegap%"
if "%line:~0,11%" == "Usage: node" set phonegapinstalled=yes
if not defined phonegapinstalled (
    echo Phonegap not installed, or at lease not found in the path.
    echo Please read the following web page and install as instructed.
    echo http://docs.phonegap.com/en/3.0.0/guide_cli_index.md.html
    echo Phonegap will not run. This function will exit after you press any key.
    pause
    exit /b
)
call :%pluginsubtask% %params%
goto :eof

:create
:: Description: Create a phone gap project in the projectpath
:: Required preset variables:
:: buildsystem
:: revurl
:: appname
:: Required functions: 
:: common
set curcommand=call phonegap create --name %appname% --id %revurl% %buildsystem% 
call :common 
goto :eof

:install
:: Description: Create a phone gap project in the projectpath
:: Required preset variables:
:: buildsystem
:: Required functions: 
:: common
set curcommand=call phonegap install android
call :common phonegap
goto :eof

:build
:: Description: Create a phone gap project in the projectpath
:: Plugin:
:: Required preset variables:
:: buildsystem
:: revurl
:: appname
:: Required functions: 
:: common

set curcommand=call phonegap local build android
call :common phonegap
goto :eof

:mediaplugin
:: Description: Add media plugin to Phonegap
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
set curcommand=phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-media.git
call :common %buildsystem%
goto :eof

:common
:: Description: Runs the various options
:: Required preset variables:
:: projectpath
:: curcommand
:: Required parameters:
:: buildsystem

set startdir=%cd%
set buildsystem=%~1
call plugins\beforeplugincurcommand
cd "%projectpath%\%buildsystem%"
@echo on
%curcommand%
@echo off
cd "%startdir%"
goto :eof



:getlineafter
for /f "skip=%~1 delims=" %%i in (%~2) do (
    set line=%%i
    goto :eof 
)
goto :eof