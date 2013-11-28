:: Vimod-Pub plugin
:: Plugin Name: binmay
:: Description: interface to binmay.exe
:: Created: 2013-11-22
:: 

:control
#call :%pluginsubtask% %params%
call :replace %params%
goto :eof

:replace
:: Description: does binary search and replace
:: Plugin:
:: Required Parameter: 4
:: find - string
:: replace - string (can be empty i.e. "")
:: infile
:: outfile
set find=%~1
set replace=%~2
set curcommand="%binmay%" -s "%find%" -r "%replace%" -i "%infile%" -o "%outfile%"
call plugins\beforeplugincurcommand
%curcommand%
goto :eof
