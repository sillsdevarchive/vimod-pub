rem                                       xml ed -d "/xml/table/rec[@id='2']" xml/table.xml
rem /manifest/uses-permission
:control
if not defined xml set xml=xml
call :%pluginsubtask% %params%
goto :eof

:delete
:: Description: Delete function
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
set querypath=%~1
set curcommand="%xml%" ed -d "%querypath%" "%infile%"
call plugins\beforeplugincurcommand
%curcommand%>"%outfile%"
goto :eof

:update
:: Description:
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
goto :eof

:validate
:: Description: Will validate a xml document, like after processing with non xml aware script. i.e. cct
:: Required preset variables:
:: xml
:: outfile
%xml% val -e "%outfile%"
goto :eof

