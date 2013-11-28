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

set startdir=%cd%
set curcommand=call phonegap create %phonegapfolder% %revurl% %appname%
call plugins\beforeplugincurcommand
cd "%projectpath%"
@echo on
%curcommand%
@echo off
cd "%startdir%"
goto :eof

:build
:: Description: Create a phone gap project in the projectpath
:: Plugin:
:: Required preset variables:
:: phonegapfolder
:: revurl
:: appname

set startdir=%cd%
set curcommand=call phonegap build android
call plugins\beforeplugincurcommand
cd "%projectpath%\%phonegapfolder%"
@echo on
%curcommand%
@echo off
cd "%startdir%"
goto :eof