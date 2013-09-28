@echo off
:: Title: Vimod-Pub
:: Title Description: VimodPub batch file with menus and tasklist processing
:: Author: Ian McQuay
:: Created: 2012-03
:: Last Modified: 2013-08-29
:: Source: projects.palaso.org
:: Optional command line parameter:
:: projectpath - absolute or relative path.

:main
:: Description: Starting point of pub.cmd
:: Optional parameters:
:: projectpath or debugfunc - project path must contain a sub folder setup containing a project.menu or dubugfunc must be "debug"
:: functiontodebug
:: * - more debug parameters
:: Required functions:
:: funcdebugstart
:: funcdebugend
:: choosegroup
call :setup
if defined echofromstart echo on
if defined masterdebug call :funcdebugstart main
set projectpath=%1
set debugfunc=%1
set functiontodebug=%2
set params=%3 %4 %5 %6 %7 %8 %9
echo.
echo                        Vimod-Pub
echo     Various inputs multiple outputs digital publishing
echo       http://projects.palaso.org/projects/vimod-pub
echo    ----------------------------------------------------
if defined projectpath (
    rem this option when a valid menu is chosen
    if exist "%projectpath%\setup\project.menu" (
      call :menu "%projectpath%\setup\project.menu" "Choose project action?"
    ) else (
        rem debugging option
        echo on
        @echo debugging %functiontodebug%
        call :%functiontodebug% %params%
    )
)  else (
    rem default option with base menu
    rem call :choosegroup
    call :menu data\setup\project.menu "Choose Group?"
)
if defined masterdebug call :funcdebugend
goto :eof

rem Menuing and control functions ==============================================

:menu
:: Description: starts a menu 
:: Required parameters:
:: newmenulist
:: title
:: forceprojectpath
:: Required functions:
:: funcdebugstart
:: variableslist
:: checkifvimodfolder
:: menuwriteoption

if defined masterdebug call :funcdebugstart menu
set newmenulist=%~1
set title=%~2
set errorlevel=
set forceprojectpath=%~3
set skiplines=%~4
set defaultprojectpath=%~dp1
set prevprojectpath=%projectpath%
set prevmenu=%menulist%
set letters=%lettersmaster%
set tasklistnumb=
set count=0
if defined echomenuparams echo menu params=%~0 "%~1" "%~2" "%~3" "%~4"
::call :ext %newmenulist%
if defined forceprojectpath (
    if defined echoforceprojectpath echo forceprojectpath=%forceprojectpath%
    set setuppath=%forceprojectpath%\setup
    set projectpath=%forceprojectpath%
    if exist "setup-pub\%newmenulist%" (
            set menulist=setup-pub\%newmenulist% 
            set menutype=settings
    ) else (
            set menulist=setup\%newmenulist%
            set menutype=commonmenu
    )
) else (
    if defined echoforceprojectpath echo forceprojectpath=%forceprojectpath%
    set projectpath=%defaultprojectpath:~0,-7%
    set setuppath=%defaultprojectpath:~0,-1%
    if exist "%newmenulist%" (
        set menulist=%newmenulist%
        set menutype=projectmenu
    ) else (
          set menutype=createdynamicmenu
    )
)
if defined echomenulist echo menulist=%menulist%
if defined echomenutype echo menutype=%menutype%
if defined echoprojectpath echo %projectpath%
if exist "%setuppath%\project.variables" call :variableslist "%setuppath%\project.variables"
set title=                     %~2
set menuoptions=
echo[
echo %title%
if defined echomenufile echo menu=%~1
if defined echomenufile echo menu=%~1
echo[
if "%menutype%" == "projectmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "commonmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "settings" call :writeuifeedback "%menulist%" %skiplines%
if "%menutype%" == "createdynamicmenu" for /F "eol=#" %%i in ('dir %projectpath% /b/ad') do (
    set action=menu %projectpath%\%%i\setup\project.menu "%%i project"
    call :checkifvimodfolder %%i
    if not defined skipwriting call :menuwriteoption %%i
)
if "%newmenulist%" neq "utilities.menu" (
    if defined echoutilities echo[
    if defined echoutilities echo        %utilityletter%. Utilities
)
echo[
echo        %exitletter%. Exit batch menu
echo[
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%' == '%utilityletter%' call :menu utilities.menu "Utilities Menu" "%projectpath%"
IF /I '%Choice%'=='%exitletter%' (
set iso=
set newmenulist=
echo ...exit menu&exit /b

)


:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice
FOR /D %%c IN (%menuoptions%) DO call :menueval %%c 
if defined masterdebug call :funcdebugend
goto menu

:menuwriteoption
:: Description: writes menu option to screen
:: Required preset variable: 1
:: leters
:: action
:: Required parameters: 1
:: menuitem

set menuitem=%~1
set let=%letters:~0,1%
if "%let%" == "0" goto :eof
set letters=%letters:~1%
:: write the menu item
echo        %let%. %menuitem% 
:: set the option letter
set option%let%=%action%
:: make the letter list
set menuoptions=%let% %menuoptions%
goto :eof


:checkifvimodfolder
:: Description: set the variable skipwriting so that the calling function does not write a menu line.
:: Optional preset variables:
:: echomenuskipping
:: Required parameters:
:: project

set project=%~1
set skipwriting=
if "%project%" == "setup" (
    if defined echomenuskipping echo skipping dir: %project%
    set skipwriting=on
)
if "%project%" == "xml" (
    if defined echomenuskipping echo skipping dir: %project% 
    set skipwriting=on
)
if "%project%" == "logs" (
    if defined echomenuskipping echo skipping dir: %project% 
    set skipwriting=on
)
goto :eof

:menueval
:: Description: resolves the users entered letter and starts the appropriate function
:: run through the choices to find a match then calls the selected option
:: Required preset variable: 1
:: choice
:: Required parameters: 1
:: let
if defined masterdebug call :funcdebugstart menueval
set let=%~1
set option=option%let%
:: /I makes the IF comparison case-insensitive
IF /I '%Choice%'=='%let%' call :%%%option%%% 
if defined masterdebug call :funcdebugend
goto :eof


:tasklist
:: Discription: Processes a tasks file.
:: Required preset variables: 3
:: projectlog
:: setuppath
:: commontaskspath
:: Required parameters: 1
:: tasklistname
:: Func calls:
:: funcdebugstart
:: funcdebugend
:: nameext
:: * - tasks from tasks file
if defined breaktasklist1 echo on
if defined masterdebug call :funcdebugstart tasklist
set tasklistname=%~1
set /A tasklistnumb=%tasklistnumb%+1
if defined breaktasklist1 pause
call :checkdir "%projectpath%\xml"
call :checkdir "%projectpath%\logs"
set projectlog="%projectpath%\logs\%date:~-4,4%-%date:~-7,2%-%date:~-10,2%-build.log"
set projectbat="%projectpath%\logs\%date:~-4,4%-%date:~-7,2%-%date:~-10,2%-build.bat"
:: checks if the list is in the commontaskspath, setuppath (default), if not then tries what is there.
if exist "%setuppath%\%tasklistname%" (
set tasklist=%setuppath%\%tasklistname%
if defined echotasklist echo [---- tasklist%tasklistnumb% project %tasklistname% ---- %time% ----
if defined echotasklist echo.
) else (
if exist "%commontaskspath%\%tasklistname%" (
set tasklist=%commontaskspath%\%tasklistname%
if defined echotasklist echo [---- tasklist%tasklistnumb% common  %tasklistname% ---- %time% ----
if defined echotasklist echo.
) else (
echo tasklist "%tasklistname%" not found
pause
exit /b
)
)
if defined breaktasklist2 pause
FOR /F "eol=# tokens=2 delims=;" %%i in (%tasklist%) do call :%%i
if defined breaktasklist3 pause
if defined echotasklistend echo   -------------------  tasklist%tasklistnumb% ended.  %time%]
@if defined masterdebug call :funcdebugend
set /A tasklistnumb=%tasklistnumb%-1
goto :eof


:setup
:: Description: sets variables for the batch file
:: Required rerequisite variables
:: projectpath
:: htmlpath
:: localvar
:: Func calls: 1
:: checkdir
if defined masterdebug call :funcdebugstart pubvar
set logfile=logs\%date:~-4,4%-%date:~-7,2%-%date:~-10,2%-build.log
set basepath=%cd%
call :variableslist setup-pub\vimod.variables
if not defined java call :variableslist setup-pub\essential_installed_in_path.tools
if not defined saxon9 call :variableslist setup-pub\essential_installed.tools fatal
if exist setup-pub\userfeedback.settings call :variableslist setup-pub\userfeedback.settings
if exist setup-pub\functiondebug.settings call :variableslist setup-pub\functiondebug.settings
if exist setup-pub\user_installed_in_path.tools call :variableslist setup-pub\user_installed_in_path.tools
if exist setup-pub\user_installed.tools call :variableslist setup-pub\user_installed.tools
call :checkdir %cd%\logs
set projectlog=%cd%\data\logs\%date:~-4,4%-%date:~-7,2%-%date:~-10,2%-build.log"
:: some localization may be needed for variables in local_var.cmd. 
if defined masterdebug call :funcdebugend
goto :eof


:checkdir
:: Description: checks if dir exists if not it is created
:: See also:
:: ifnotexist
:: Required preset variabes: 1
:: projectlog
:: Optional preset variabes: 1
:: report1
:: Required parameters: 1
:: dir
:: Required functions:
:: funcdebugstart
:: funcdebugend
if defined masterdebug call :funcdebugstart checkdir
set dir=%~1
set report=Checking dir %dir% 
if exist "%dir%"  (
          %report1%echo . . . Found! %dir% >>%logfile%
    ) else (
          %report1%echo . . . not found. %dir% >>%logfile%
          %report1%echo . . . not found. %dir%
          mkdir "%dir%" 
          %report1%echo mkdir "%dir%" >>%logfile%
          %report1%echo mkdir "%dir%"
)
if defined masterdebug call :funcdebugend
goto :eof

rem built in commandline functions =============================================

:command
:: Description: runs a dos command
:: Sample: call :command dir "/b/s data/iso"
:: Required parameters:
:: command
:: paramapp
:: outfile
:: append
:: Optional parameters:
:: Func calls:
if defined masterdebug call :funcdebugstart command
call :inccount
set command=%~1
set parameterstring=%~2
set outfile=%~3
set append=%~4
call :quoteinquote param "%parameterstring%"

if "%outfile%" == "" (

if "%command%" neq "echo" echo %command% %param%

echo[
call %command% %param%
echo[
) else (
if "%append%" == "" (
echo %command% %param% ^>"%outfile%"
call %command% %param%>"%outfile%"
) else (
echo %command% %param% ^>^>"%outfile%"
call %command% %param%>>"%outfile%"
)
call :after "Command done"
)
if defined masterdebug call :funcdebugend
goto :eof

rem External tools functions ===================================================

:prince
:: Description: interface to PrinceXML
:: Required preset variables: 2
:: prince
:: projectpath
:: Optional preset parameters: 2
:: pcode
:: writecount
:: Required parameters: 3
:: style
:: infile
:: outfile
if defined masterdebug call :funcdebugstart prince
call :ifnotexist"%prince%" fatal "Prince XML"
call :inccount
echo Creating PDF . . .
set style=%~1
call :infile "%~2"
call :outfile "%~3" "%projectpath%\%pcode%-%writecount%-%~1.pdf"
set curcommand=%prince% -s "%style%" "%infile%" -o "%outfile%"
call :before
%curcommand%
call :after "make PrinceXML PDF"
if defined masterdebug call :funcdebugend
goto :eof

:fop
:: Description: Interface to Apache Fop PDF creation.
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: options
:: script
:: Optional parameters:
:: infile
:: outfile
:: Required functions:
:: infile
:: outfile
:: inccount
:: before
:: after
if defined masterdebug call :funcdebugstart fop
call :inccount
call :setdefaultoptions %~1 -pdf
set script=%~2
set script=-xsl "%script%"
call :infile "%~3"
call :outfile "%~4" %~1 
::call :before
::echo fop -xml "%infile%" -xsl %xsltpath%\%script% %options% "%outfile%"
echo on
if "%options%" == "-pdf" fop -fo "%infile%" "%outfile%"
if "%options%" == "-foout" fop -xml "%infile%" %script% %options% "%outfile%"
call :after
echo off
if defined masterdebug call :funcdebugend
goto :eof


:cct
:: Description: Privides interface to CCW32.
:: Required preset variables:
:: ccw32
:: Optional preset variables:
:: Required parameters:
:: script - can be one script.cct or serial script1.cct,script2.cct,etc
:: Optional parameters: 2
:: infile
:: outfile
:: Required functions:
:: infile
:: outfile
:: inccount
:: before
:: after
if defined masterdebug call :funcdebugstart cct
set script=%~1
call :infile "%~2"
set scriptout=%script:.cct,=_%
call :inccount
call :outfile "%~3" "%projectpath%\xml\%pcode%-%count%-%scriptout%.xml"
set basepath=%cd%
set curcommand=%ccw32% %cctparam% -t "%script%" -o "%outfile%" "%infile%"
call :before
cd %cctpath%
%curcommand%
cd %basepath%
call :after "Consistent Changes"
::
if defined masterdebug call :funcdebugend
goto :eof


:validate
:: Description: Will validate a xml document like after processing with non xml aware script. i.e. cct
:: Required preset variables:
:: xml
:: outfile
%xml% val -e "%outfile%"
goto :eof

:xslt
:: Description: Provides interface to xslt2 by saxon9.jar
:: Required preset variables: 1
:: java
:: saxon9
:: Required parameters: 1
:: scriptname
:: Optional parameters: 3
:: allparam
:: infile
:: outfile
:: Func calls: 
:: inccount
:: infile
:: outfile
:: quoteinquote
:: before
:: after
if defined masterdebug call :funcdebugstart xslt
call :inccount
set script=%xsltpath%\%~1.xslt
set param=
set allparam=
set allparam=%~2
if defined allparam set param=%allparam:'="%
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%count%-%~1.xml"
set curcommand=%java%  -jar "%saxon9%"   -o:"%outfile%" "%infile%" "%script%" %param%
call :before
%curcommand%
call :after "XSLT transformation"
if defined masterdebug call :funcdebugend
goto :eof

:xquery
:: Description: Provides interface to xquery by saxon9.jar
:: Required preset variables: 1
:: java
:: saxon9
:: Required parameters: 1
:: scriptname
:: Optional parameters: 3
:: allparam
:: infile
:: outfile
:: Func calls: 6
:: inccount
:: infile
:: outfile
:: quoteinquote
:: before
:: after
:: created: 2013-08-20
if defined masterdebug call :funcdebugstart xquery
set scriptname=%~1
set allparam=%~2
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%writecount%-%scriptname%.xml"
call :inccount
set script=scripts\xquery\%scriptname%.xql
call :quoteinquote param "%allparam%"
set curcommand=%java% -cp "%saxon9%" net.sf.saxon.Query -o:"%outfile%" -s:"%infile%" "%script%" %param%
call :before
%curcommand%
call :after "XQuery transformation"
if defined masterdebug call :funcdebugend
goto :eof

:tidy
:: Description: runs Tidy program
:: Required preset variables: 1
:: tidy
:: Required parameters: 2
:: options
:: infile
:: outfile
if defined masterdebug call :funcdebugstart tidy
call :inccount
call :setdefaultoptions "%~1" "-asxml -utf8"
call :infile "%~2"
call :outfile "%~3" tidy
set curcommand=%tidy% %options% -o "%outfile%" "%infile%"
call :before
%curcommand%
call :after
if defined masterdebug call :funcdebugend
goto :eof

:manyparam
:: Description: Allows spreading of long commands accross many line in a tasks file. Needed for wkhtmltopdf.
:: Required preset variables: 1
:: first - set for all after the first of manyparam
:: Optional preset variables:
:: first - Not required for first of a series
:: Required parameters: 1
:: newparam
if defined masterdebug call :funcdebugstart manyparam
set newparam=%~1
if not defined first (
set first=on
set param=%newparam%
) else (
set param=%param% %newparam%
)
if defined masterdebug call :funcdebugend
goto :eof

:manyparamcmd
:: Description: places the command before all the serial parameters Needed for wkhtmltopdf.
:: Required preset variables: 1
:: param
:: Optional preset variables:
:: Required parameters: 1
:: command                                                       0
if defined masterdebug call :funcdebugstart manyparamcmd
set command=%~1
rem this can't work here: call :quoteinquote param %param%
if defined param set param=%param:'="%
call :echolog "%command%" %param%
"%command%"  %param%
rem clear the first variable
set first=
if defined masterdebug call :funcdebugend
goto :eof

:pandoc
:: Description: Make Pandoc available
:: Required preset variables: 
:: pandoc
:: Optional preset variables:
:: Required parameters: 1
:: options
:: Optional parameters:
:: Func calls:
if defined masterdebug call :funcdebugstart pandoc
call :ifnotexist %pandoc% fatal "Pandoc"
call :inccount
call :quoteinquote options %~1
call :infile %~2
call :outfile %~3 projectpath%\xml\%pcode%-%writecount%-%~1.xml
call :before
echo %pandoc% %options%
echo on
::%pandoc% %options% -o "%outfile%" "%infile%"
%pandoc% %options%  -o "%outfile%" "%infile%"
echo off
call :after "Pandoc conversion"
if defined masterdebug call :funcdebugend
goto :eof

:phonegap
:: Function: call PhoneGap hybrid app builder actions
:: Required parameters: 5
:: phonegaptask
:: phonegapbuildtype
:: phonegapbuildpath
:: phonegaprevuri
:: phonegapprojectname
if defined masterdebug call :funcdebugstart phonegap
call :inccount
set phonegaptask=%~1
set phonegapbuildtype=%~2
if '%phonegaptask%' == 'create' (
set phonegapbuildpath=%~3
set phonegaprevuri=%~4
set phonegapprojectname=%~5
echo "%phonegappath%\%phonegapbuildtype%\bin\%phonegaptask%.bat" "%phonegapbuildpath%" "%phonegaprevuri%" "%phonegapProjectName%"
call "%phonegappath%\%phonegapbuildtype%\bin\%phonegaptask%.bat" "%phonegapbuildpath%" "%phonegaprevuri%" "%phonegapProjectName%"
echo phonegap %phonegaptask% done
)
if '%phonegaptask%' == 'build'  (
set phonegapbuildpath=%~2
set debug=
set debug=%~3
set outfile=%~4
if exist "%outfile%" del "%outfile%"
echo "%phonegapbuildpath%\phonegap\%phonegaptask%.bat" %debug%
call "%phonegapbuildpath%\phonegap\%phonegaptask%.bat" %debug%
call :ifnotexist "%outfile%" "%outfile% "
echo phonegap %phonegaptask% done
)
if defined masterdebug call :funcdebugend
goto :eof

:cordova
:: Function: call Apache Cordova hybrid app builder actions
:: Required parameters: 5
:: cordovatask (allowed: 'create' or 'build')
:: cordovabuildtype
:: cordovabuildpath (cordovatask=create) or debug 
:: cordovarevuri  (cordovatask=create) or outfile
:: cordovaprojectname
if defined masterdebug call :funcdebugstart cordova
call :inccount
set cordovatask=%~1
set cordovabuildtype=%~2
if '%cordovatask%' == 'create' (
set cordovabuildpath=%~3
set cordovarevuri=%~4
set cordovaprojectname=%~5
echo "%cordovapath%\cordova-%cordovabuildtype%\bin\%cordovatask%.bat" "%cordovabuildpath%" "%cordovarevuri%" "%CordovaProjectName%"
call "%cordovapath%\cordova-%cordovabuildtype%\bin\%cordovatask%.bat" "%cordovabuildpath%" "%cordovarevuri%" "%CordovaProjectName%"
echo Cordova %cordovatask% done
) 
if '%cordovatask%' == 'build' (
set cordovabuildpath=%~2
set debug=
set debug=%~3
set outfile=%~4
call :ifexist "%outfile%" del
echo "%cordovabuildpath%\cordova\%cordovatask%.bat" %debug%
call "%cordovabuildpath%\cordova\%cordovatask%.bat" %debug%
call :ifnotexist "%outfile%" report " %outfile%"
echo Cordova %cordovatask% done
)
if defined masterdebug call :funcdebugend
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

:binmay
:: Required Parameter: 4
:: find string
:: replace string (can be empty i.e. "")
:: infile
:: outfile
if defined masterdebug call :funcdebugstart binmay
call :inccount
set find=%~1
set replace=%~2
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%writecount%-%~1.xml"
set curcommand="%binmay%" -s "%find%" -r "%replace%" -i "%infile%" -o "%outfile%"
call :before
%curcommand%
call :after "Binmay replace complete"
if defined masterdebug call :funcdebugend
goto :eof

:pathwayxetex
:: Description: Pathwayb commandline interface for XeTeX
:: Required preset variables:
:: projectpath
:: Optional preset variables:
:: masterdebug
:: Required parameters:
:: css
:: Optional parameters:
:: inputfile
:: Required functions:
:: infile
:: name
:: before
:: after
if defined masterdebug call :funcdebugstart pathwayxetex
set intype=Dictionary
set inputtype=xhtml
set transtype=XeLaTex
set workdir=%projectpath%
set css=%~1
set inputfile=%~1
set css=%~1
call :infile %inputfile%
call :name %infile%
set outfile=%projectpath%\%name%.pdf
set curcommand="%pathwayxetex%" -i %intype% -if %inputtype% -d "%workdir%" -f "%infile%" -t %transtype% -c "%css%"
call :before
%curcommand%
call :after "Pathway XeTeX PDF transformation"
if defined masterdebug call :funcdebugend
goto :eof

rem Tools sub functions ========================================================

:before
:: Description: Checks if outfile exists, renames it if it does. Logs actions.
:: Required preset variables:
:: projectlog
:: projectbat
:: Optional preset variables: 
:: outfile
:: curcommand
:: writebat
:: Func calls: 1
:: echolog
:: nameext
::call :prereport
if defined masterdebug call :funcdebugstart before
if defined echocommandtodo echo Command to be attempted:
if defined echocommandtodo echo %curcommand%
echo "Command to be attempted:" >>%projectlog%
echo "%curcommand%" >>%projectlog%
if "%writebat%" == "yes" echo %curcommand%>>%projectbat%
echo[ >>%projectlog%
if exist "%outfile%" call :nameext "%outfile%"
if exist "%outfile%.pre.txt" del "%outfile%.pre.txt" 
if exist "%outfile%" ren "%outfile%" "%nameext%.pre.txt" 
if defined masterdebug call :funcdebugend
goto :eof

:after
:: Description: Checks if outfile is created. Reports failures logs actions. Restors previous output file on failure.
:: Required preset variables: 3
:: outfile
:: projectlog
:: writecount
:: Optional parameters: 
:: report3
:: message
:: Func calls:
:: nameext
if defined masterdebug call :funcdebugstart after
set message=%~1
call :nameext "%outfile%"
if not exist "%outfile%" set errorlevel=1
if not exist "%outfile%" (
if defined errorlevel echo[
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
if defined errorlevel echo %message% failed to create %nameext%.
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  >>%projectlog%
if defined errorlevel echo %message% failed to create %nameext%.                           >>%projectlog%
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  >>%projectlog%
if defined errorlevel     echo[ >>%projectlog%

if exist "%outfile%.pre.txt" (
        call :echolog ren "%outfile%.pre.txt" "%nameext%"
        ren "%outfile%.pre.txt" "%nameext%"
call :echolog Previously existing %nameext% restored.

call :echolog The following processes will work on the previous version.
call :echolog ???????????????????????????????????????????????????????????????
        echo .
)
) else (
if defined echoafterspacepre echo[
call :echolog %writecount% Created:   %nameext%
if defined echoafterspacepost echo[
echo ---------------------------------------------------------------- >>%projectlog%
::echo[ >>%projectlog%
if exist "%outfile%.pre.txt" del "%outfile%.pre.txt"
)
if defined masterdebug call :funcdebugend
goto :eof

:nameext
:: Description: returns name and extension
:: Group type: parameter manipulation
:: Required parameters: 1
:: drive:\path\name.ext or path\name.ext or name.ext
:: created variable:
:: nameext
set nameext=%~nx1
goto :eof

:ext
:: Description: returns extension
:: Group type: parameter manipulation
:: Required parameters: 1
:: drive:\path\name.ext or path\name.ext or name.ext
:: created variable:
:: nameext
set ext=%~x1
goto :eof

:name
:: Description: Gets the name of a file 
:: Group type: parameter manipulation
:: Required parameters: 1
:: drive:\path\name.ext or path\name.ext or name.ext
:: created variable:
:: name
set name="%~n1"
goto :eof

:drivepath
:: Required parameters: 
:: Group type: parameter manipulation
:: drive:\path\name.ext or path\name.ext
set drivepath=%~dp1
if defined echodrivepath echo %drivepath%
goto :eof

:file2uri
:: Description: transforms dos path to uri path. i.e. c:\path\file.ext to file:///c:/path/file.ext
:: Group type: parameter manipulation
:: Required parameters:  1
:: pathfile
:: Optional parameters:
:: number
:: created variables: 1
:: uri%number%
if defined masterdebug call :funcdebugstart file2uri
call :setvar pathfile "%~1"
set numb=%~2
set uri%numb%=file:///%pathfile:\=/%
set return=file:///%pathfile:\=/%
if defined echofile2uri call :echolog       uri%numb%=%return:~0,25% . . . %return:~-30%
if defined masterdebug call :funcdebugend
goto :eof

:inccount
:: Description: iIncrements the count variable
:: Group type: parameter manipulation
:: Required preset variables:
:: space
:: count - on second and subsequent use
:: Optional preset variables: 1
:: count - on first use
set /A count=%count%+1
set writecount=%count%
if %count% lss 10 set writecount=%space%%count%
goto :eof


:copyoutfileto
:renamelast
:outputfile
:: Description: Copies last out file to new name. Used to make a static name other tasklists can use.
:: Required preset variables: 1
:: outfile
:: Required parameters: 1
:: newfilename
:: Func calls: 3
:: inccount
:: drivepath
:: nameext
if defined masterdebug call :funcdebugstart outputfile
call :inccount
set infile=%outfile%
set filename=%~1
call :drivepath "%filename%"
call :nameext "%filename%"
set outfile=%drivepath%%nameext%
set curcommand=copy /Y "%infile%" "%outfile%"
call :before
%curcommand% >> %projectlog%
call :after "Copied "%infile%" to "%outfile%"
if defined masterdebug call :funcdebugend
goto :eof

:dirlist
:: Description:
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: Optional parameters:
:: Required functions:
echo on
set dirpath=%~1
set dirlist=%~2
dir /b "%dirpath%" > "%dirlist%" 
echo off
goto :eof


:infile
:: Description: If infile is specifically set then uses that else uses previous outfile.
:: Group type: pipeline file handling
:: Required parameters: 1
:: testinfile
set testinfile=%~1
if "%testinfile%" == "" (
set infile=%outfile%
) else (
set infile=%testinfile%
)
goto :eof

:outfile
:: Description: If out file is specifically set then uses that else uses supplied name.
:: Group type: pipeline file handling
:: Required parameters: 2
:: testoutfile
:: defaultoutfile
set testoutfile=%~1
set defaultoutfile=%~2
if "%testoutfile%" == "" (
set outfile=%defaultoutfile%
) else (
set outfile=%testoutfile%
)
goto :eof

:setdefaultoptions
:: Description: Sets default options if not specifically set
:: Required parameters:
:: testoption
:: defaultoption
set testoption=%~1
set defaultoption=%~2
if "%testoption%" == "" (
set options=%defaultoption%
) else (
set options=%testoption%
)
goto :eof


:setvarlist
:: depreciated use var
:resolve
:: depreciated use var
:setvar
:var
:: Function: sets the variable
:: Group type: parameter manipulation
:: Required parameters: 2
:: varname
:: value
:: Added handling so that a third param called echo will echo the variable back.
set varname=%~1
set value=%~2
set %varname%=%value%
if "%~3" == "echo" echo %varname%=%value%
goto :eof

:quoteinquote
:: Description: Resolves single quotes withing double quotes. Surrounding double quotes dissapea, singles be come doubles.
:: Group type: parameter manipulation
:: Required parameters:
:: varname
:: paramstring
set varname=%~1
set paramstring=%~2
if defined paramstring set %varname%=%paramstring:'="%
goto :eof

:startfile
:: depreciated use  inputfile
:inputfile
:: Description: Sets the starting file of a serial tasklist, by assigning it to the var outfile
:: Optional preset variables: 2
:: writebat
:: projectbat
:: Required parameters: 1
:: outfile
:: Added handling so that a preset var %writebat%, will cause the item to be written to a batch file
set outfile=%~1
if "%writebat%" == "yes" echo set outfile=%~1 >>%projectbat%
goto :eof


:setdatetime
:: Description: generate a XML style date and time
:: Group type: parameter manipulation
:: Required parameters: 
::echo Setup log
set actno=1
set tenhour=%time:~0,1%
if "%tenhour%" == " " (
set myhour=0%time:~1,1%
) else (
set myhour=%time:~0,2%
)
set datetime=%date:~-4,4%-%date:~-7,2%-%date:~-10,2%T%myhour%%time:~3,2%%time:~6,2%
goto :eof

rem Loops ======================================================================

:serialtasks
:looptasks
:: Description: loop through tasks acording to %list%
:: Optional prerequisite variables: 3
:: comment
:: list
:: Required parameters: 1
:: tasklistfile
if defined masterdebug call :funcdebugstart looptasks
    set tasklistfile=%~1
    if "%~2" == "" (
        if "%list%" neq "" (
        set list=%list%
    ) else (
        echo No list set. Loop failure.
        pause
        exit /b
    )
) else (
    set list=%~2
)
if "%~3" == "" (
    if "%comment%" neq "" (
        set comment=%comment%
    ) else (
        echo No comment set. Loop failure.
        pause
        exit /b
    )
) else (
      set comment=%~3
)
echo "%comment%"
FOR /F %%s IN (%list%) DO call :tasklist "%tasklistfile%" %%s
set list=
set comment=
echo =====^> end looptasks
if defined masterdebug call :funcdebugend
goto:eof

:loopcommand
:: Description: loops through a list of tasklist files
:: Prerequisite parameters: 3
:: comment
:: list
:: action
if defined masterdebug call :funcdebugstart loopcommand
echo "%comment%"
::echo on
FOR /F %%s IN ('%list%') DO call :tasklist "%%s"
if defined masterdebug call :funcdebugend
goto:eof

:loopfileset
:: Required preset variables:
:: comment
:: fileset
:: action
if defined masterdebug call :funcdebugstart loopfileset
echo "%comment%"
::echo on
FOR /F %%s IN (%fileset%) DO call :%action% %%s
if defined masterdebug call :funcdebugend
goto:eof

:loopstring
:: Required preset variables:
:: comment
:: string
:: action
if defined masterdebug call :funcdebugstart loopstring
echo "%comment%"
::echo on
FOR /F %%s IN ("%string%") DO call :%action% %%s
if defined masterdebug call :funcdebugend
goto:eof


:action
:: Required preset variables:
:: action
:: outfile
:: debug
:: Optional parameters:
:: flag
if defined masterdebug call :funcdebugstart action
set flag=%~1
call :before
if "%debug%" == "on" echo %actno% start- %action% 
if "%outfile%" == "" set outfile=null
if "%flag%" == "" (
%action%
) else (
if "%flag%" == "screen2file" %action% > %outfile%
if "%flag%" == "append" %action% >> %outfile%
if "%flag%" == "xml" (
echo ^<%~3/^> > %outfile%
)
)
call :after
if defined masterdebug call :funcdebugend
goto :eof

:spinoffproject
:: Required parameters: 0
:: 2013-08-10
:: depreciated doing with tasks file
set copytext=%projectpath%\logs\copyresources*.txt
set copybat=%projectpath%\logs\copyresources.cmd
if exist "%copytext%" del "%copytext%"
if exist "%copybat%" del "%copybat%"
echo :: vimod-spinoff-project generated file>>"%copybat%"
if "%~1" == "" (
set outpath=C:\vimod-spinoff-project
) else (
set outpath=%~1
)
if "%~2" neq "" set projectpath=%~2

dir /a-d/b "%projectpath%\*.*">"%projectpath%\logs\files.txt"
call :xslt vimod-spinoff-project "projectpath='%projectpath%' outpath='%outpath%' projfilelist='%projectpath%\logs\files.txt'" scripts/xslt/blank.xml "%projectpath%\logs\spin-off-project-report.txt"
FOR /L %%n IN (0,1,100) DO call :joinfile %%n
if exist "%copybat%" call "%copybat%" 
::call :command xcopy "'%projectpath%\*.*' '%outpath%"
goto :eof

:ifexist
:: Required parameters: 2-3
:: testfile
:: action
:: outfileif   required (copy, xcopy)
:: Func   required (func)
:: Optional 1 param
:: switches
if defined masterdebug call :funcdebugstart ifexist
set testfile=%~1
set action=%~2
set switches=%~4
set outfileif=%~3
set func=%~4
if exist  "%testfile%" (
if "%action%" == "xcopy"  %action% %switches% "%testfile%" "%outfileif%"
if "%action%" == "copy" %action% %switches% "%testfile%" "%outfileif%"
if "%action%" == "del" %action% "%testfile%" 
if "%action%" == "call" %action% "%testfile%"
if "%action%" == "func" call :%func% "%testfile%"
)
if defined echoifexist (
if "%action%" == "xcopy" echo %action% %switches% "%testfile%" "%outfileif%"
if "%action%" == "copy" echo %action% %switches% "%testfile%" "%outfileif%"
if "%action%" == "del" echo %action% "%testfile%" 
if "%action%" == "call" echo %action% "%testfile%"
if "%action%" == "func" echo call :%func% "%testfile%"
)
if defined masterdebug call :funcdebugend
goto :eof

:ifnotexist
:: Required parameters: 3
:: testfile
:: action
:: infileif or func or command or message
:: Optional parameters: 1
:: switches
if defined masterdebug call :funcdebugstart ifnotexist
set testfile=%~1
set action=%~2
set infileif=%~3
set func=%~3
set command=%~3
set message=%~3
set switches=%~4
if not exist  "%testfile%" (
if "%action%" == "xcopy" %action% %switches% "%infileif%" "%testfile%"& call :echolog "File not found! %message%"
if "%action%" == "copy" %action% %switches% "%infileif%" "%testfile%"& call :echolog "File not found! %message%"
if "%action%" == "del" %action% "%infileif%" & call :echolog "File not found! %message%"
if "%action%" == "call" %action% "%infileif%"& call :echolog "File not found! %message%"
if "%action%" == "command" %command%& call :echolog "File not found! %message%"
if "%action%" == "func" call :%func% "%testfile%"& call :echolog "File not found! %message%"
if "%action%" == "fatal" (
call :echolog "File not found! %message%"
echo The script will end.
echo.
pause
exit /b
)
if "%action%" == "report" call :echolog "File not found! %message%"
)
if defined masterdebug call :funcdebugend
goto :eof

:echolog
:: Description: echoes a message to log file and to screen
:: Required preset variables: 1
:: projectlog
:: Required parameters: 1
:: message
if defined masterdebug call :funcdebugstart echolog
set message=%~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9
echo %message%
echo %message% >>%projectlog%
set message=
if defined masterdebug call :funcdebugend
goto :eof

:userinputvar
:: Description: provides method to interactively input a variable
:: Required parameters: 2
:: varname
:: question
if defined masterdebug call :funcdebugstart userinputvar
set varname=%~1
set question=%~2
set /P %varname%=%question%:
if defined masterdebug call :funcdebugend
goto :eof

:joinfiles
:: requires 4 parameters
:: %number%
:: pathname
:: ext
:: outfile
if defined masterdebug call :funcdebugstart joinfiles
set number=%~1
set pathname=%~2
set ext=%~3
set outfile=$~4
if "%number%" == "" echo Missing number parameter1 in :joinfiles
if "%pathname%" == "" echo Missing pathname parameter2 in :joinfiles
if "%ext%" == "" echo Missing ext parameter3 in :joinfiles
if "%outfile%" == "" echo Missing outfile parameter4 in :joinfiles
echo rem make file > "%outfile%"
if exist "%pathname%0.txt" (
FOR /L %%n IN (0,1,%number%) DO (
set numb=%%n
set file=%pathname%%numb%.txt
if exist "%file%" (
copy  "%outfile%"+"%file%" "%outfile%"
)
)
)
if defined masterdebug call :funcdebugend
goto :eof

:copyresources
:: Required parameters: 2
:: resourcename
:: resourcetarget
:: 2013-08-15
call :requiredparam resourcename "%~1"
call :requiredparam resourcetarget "%~2"
xcopy /e/y "%resourcename%" "%resourcetarget%"
goto :eof

:requiredparam
if defined masterdebug call :funcdebugstart requiredparam
set varname=%~1
set value=%~2
if "%value%" == "" (
echo Missing parameter: %varname%
pause
) else (
set %varname%=%value%
)
if defined masterdebug call :funcdebugend
goto :eof


:variableslist
:: Description: Handles variables list supplied in a file.
:: Optional preset variables:
:: echovariableslist
:: echoeachvariablelistitem
:: Required parameters:
:: list - a filename with name=value on each line of the file
:: checktype - for use with ifnotexist 
:: Required functions:
:: drivepath
:: nameext
:: ifnotexist
if defined echovariableslist echo ==== Processing variable list %~1 ==== 
set list=%~1
set checktype=%~2
FOR /F "eol=# delims== tokens=1,2" %%s IN (%list%) DO (
rem    set val=%%t
    set %%s=%%t
    if defined echoeachvariablelistitem echo %%s=%%t
    if defined checktype (
        call :drivepath %%t
        call :nameext %%t
        call :ifnotexist "%%t" %checktype% "%nameext% tool not found in %drivepath%."
    )
)
goto :eof


:appendtofile
:: Description: Func to append text to a file
:: Optional preset variables:
:: quotes
:: Required parameters:
:: file
:: text

set file=%~1
set text=%~2
set quotes=%~3
if defined quotes set text=%text:'="%
echo %text% >>%file%
goto :eof

rem UI and Debugging functions ========================================================

:writeuifeedback
:: Description: Produce a menu from a list to allow the user to change default list settings
:: Required preset variables:
:: Optional preset variables:
:: Required parameters:
:: list
:: Optional parameters:
:: Required functions:
::echo on
set list=%~1
set skiplines=%~2
if not defined skiplines set skiplines=1
FOR /F "eol=# tokens=1 skip=%skiplines% delims==" %%i in (%list%) do (
    if defined %%i (
          set action=var %%i
          call :menuwriteoption "ON  - Turn off %%i?"
    ) else (
          set action=var %%i on
          call :menuwriteoption "    - Turn on  %%i?"
    )
)
echo off
goto :eof

:funcdebugstart
:: Description: Debug function run at the start of a function
:: Required preset variables:
:: stacksource
:: stack - created upon first usage
:: Required parameters:
:: nefunc
@echo off
@if defined funcdebugstart @echo on
if defined echodebugmarker @echo +++++++++++++++++++++++++++++++++++++++++ starting func %~1 ++++
set newfunc=%~1
::@echo stacksource=%stacksource%
set /A stacknumb=%stacknumb%+1
if defined debugstack @echo stacknumb=%stacknumb%
set s%stacknumb%=%newfunc%
@echo off
set test=debug%newfunc%
if defined %test% echo on
@goto :eof

:funcdebugend
:: Description: Debug function run at the end of a function. Resets the calling functions debugging echo state
:: Required preset variables:
:: stacksource
:: stack
@echo off
if defined echodebugmarker @echo --------------------------------------------- %newfunc% func ended. ----
if defined funcdebugend echo on
set /A stacknumb=%stacknumb%-1
set returnhandle=s%stacknumb%
call :setvar return %%%returnhandle%%%
set returnfunc=debug%return%
set newfunc=%returnfunc%
if defined echofuncname echo %return%
@echo off
if defined %returnfunc% @echo on
@goto :eof

:done