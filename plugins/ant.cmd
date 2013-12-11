:: Vimod-Pub plugin
:: Plugin Name: ant
:: Description: interface to binmay.exe
:: Created: 2013-11-22
:: 
:control
set startdir=%cd%
set curcommand=%ant% %pluginsubtask% %params%
call plugins\beforeplugincurcommand

cd "%androidantbuildpath%"
%curcommand%
cd "%startdir%"
@echo off
@echo off
goto :eof

