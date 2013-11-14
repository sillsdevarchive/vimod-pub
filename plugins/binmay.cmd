:control
call :%action% %params%
goto :eof

:binmay
:: Description: interface to Binmay.exe via plugin
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
