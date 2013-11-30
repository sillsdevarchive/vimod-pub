:: Plugin Name: Phonegap
:: Purpose: Intergrate Phonegap creat and build processes into VimodPub
:control
call :%pluginsubtask% %params%
goto :eof

:create
:: Description: Create a phone gap project in the projectpath
:: Required preset variables:
:: phonegapfolder
:: revurl
:: appname
:: Required functions: 
:: common
set curcommand=call phonegap create %phonegapfolder% %revurl% %appname%
call :common 
goto :eof

:build
:: Description: Create a phone gap project in the projectpath
:: Plugin:
:: Required preset variables:
:: phonegapfolder
:: revurl
:: appname
:: Required functions: 
:: common

set curcommand=call phonegap build android
call :common %phonegapfolder%
goto :eof

:mediaplugin
:: Description: Add media plugin to Phonegap
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
set curcommand=phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-media.git
call :common %phonegapfolder%
goto :eof

:common
:: Description: Runs the various options
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
set startdir=%cd%
call plugins\beforeplugincurcommand
cd "%projectpath%\%~1"
@echo on
%curcommand%
@echo off
cd "%startdir%"
goto :eof