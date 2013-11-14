:beforeplugincurcommand
:: Description: Checks if outfile exists, renames it if it does. Logs actions.
:: Plugin:
:: Required preset variables:
:: projectlog
:: projectbat
:: curcommand
:: Optional preset variables: 
:: writebat
if defined echocommandtodo echo Command to be attempted:
if defined echocommandtodo echo %curcommand%
echo "Command to be attempted:" >>%projectlog%
echo "%curcommand%" >>%projectlog%
if defined writebat echo %curcommand%>>%projectbat%
echo[ >>%projectlog%
goto :eof