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
rem set the codepage to unicode to handle special characters in parameters
chcp 65001
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
set defaultjustprojectpath=%~p1
set prevprojectpath=%projectpath%
set prevmenu=%menulist%
set letters=%lettersmaster%
set tasklistnumb=
set count=0
if defined echomenuparams echo menu params=%~0 "%~1" "%~2" "%~3" "%~4"
::call :ext %newmenulist%
rem detect if projectpath should be forced or not
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
    set projectpathbackslash=%defaultprojectpath:~0,-6%
    set projectpath=%defaultprojectpath:~0,-7%
    if defined userelativeprojectpath call :removeCommonAtStart projectpath "%projectpathbackslash%"
    set setuppath=%defaultprojectpath:~0,-1%
    echo off
    if exist "%newmenulist%" (
        set menulist=%newmenulist%
        set menutype=projectmenu
    ) else (
          set menutype=createdynamicmenu
          set menulist=created
    )
)
if defined echomenulist echo menulist=%menulist%
if defined echomenutype echo menutype=%menutype%
if defined echoprojectpath echo %projectpath%

set title=                     %~2
set menuoptions=
echo[
echo %title%
if defined echomenufile echo menu=%~1
if defined echomenufile echo menu=%~1
echo[
rem process the menu types to generate the menu items.
if "%menutype%" == "projectmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "commonmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "settings" call :writeuifeedback "%menulist%" %skiplines%
if "%menutype%" == "createdynamicmenu" for /F "eol=#" %%i in ('dir "%projectpath%" /b/ad') do (
    set action=menu "%projectpath%\%%i\setup\project.menu" "%%i project"
    call :checkifvimodfolder %%i
    if not defined skipwriting call :menuwriteoption %%i
)
if "%menulist%" neq "utilities.menu" (
    if defined echoutilities echo[
    if defined echoutilities echo        %utilityletter%. Utilities
)
echo[
if "%newmenulist%" == "data\setup\project.menu" (
    echo        %exitletter%. Exit batch menu
) else (
    if "%newmenulist%" == "setup\utilities.menu" (
      echo        %exitletter%. Return to Groups menu
    ) else (
      echo        %exitletter%. Return to calling menu
    )
)
echo[
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%' == '%utilityletter%' call :menu utilities.menu "Utilities Menu" "%projectpath%"
IF /I '%Choice%'=='%exitletter%' (
    if "%menulist%" == "setup\utilities.menu" (
          pub
    ) else (
        echo ...exit menu &exit /b
    )
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
if exist "%setuppath%\project.variables" (
      call :variableslist "%setuppath%\project.variables"
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
set projectlog=logs\%date:~-4,4%-%date:~-7,2%-%date:~-10,2%-build.log
set basepath=%cd%
call :variableslist setup-pub\vimod.variables
rem added to aid new users in setting up
call :testjava
if not defined java call :variableslist setup-pub\essential_installed.tools fatal
if exist setup-pub\user_installed.tools call :variableslist setup-pub\user_installed.tools
if exist setup-pub\userfeedback.settings call :variableslist setup-pub\userfeedback.settings
if exist setup-pub\functiondebug.settings call :variableslist setup-pub\functiondebug.settings
call :checkdir %cd%\logs
call :checkdir %cd%\data\logs
set classpath=%classpath%;%extendclasspath%
rem some localization may be needed for variables in local_var.cmd. 
if defined masterdebug call :funcdebugend
goto :eof


:checkdir
:: Description: checks if dir exists if not it is created
:: See also: ifnotexist
:: Required preset variabes: 1
:: projectlog
:: Optional preset variables:
:: echodirnotfound
:: Required parameters: 1
:: dir
:: Required functions:
:: funcdebugstart
:: funcdebugend
if defined masterdebug call :funcdebugstart checkdir
set dir=%~1
set report=Checking dir %dir% 
if exist %dir% (
      echo . . . Found! %dir% >>%projectlog%
) else (
    call :removecommonatstart dirout "%dir%"
    if defined echodirnotfound echo Creating . . . %dirout%
    echo . . . not found. %dir% >>%projectlog%
    echo mkdir %dir% >>%projectlog%
    mkdir "%dir%"
)
if defined masterdebug call :funcdebugend
goto :eof

rem built in commandline functions =============================================
:usercommand    
:: Description: A way of passing any commnand from a tasklist. It does not use infile and outfile.
:: Usage: call :usercommand "copy /y 'c:\patha\file.txt' 'c:\pathb\file.txt'"
:: Limitations: When command line needs single quote.
:: Required parameters:
:: curcommand
:: Required functions:
:: funcdebugstart
:: funcdebugend
:: inccount
:: echolog
if defined masterdebug call :funcdebugstart usercommand
call :inccount
set curcommand=%~1
set curcommand=%curcommand:'="%
call :echolog %curcommand%
%curcommand%
if defined masterdebug call :funcdebugend
goto :eof

:useriocommand    
:: Description: A way of passing any commnand from a tasklist. Uses infile and outfile.
:: Usage: call :useriocommand "copy /y" "" "c:\pathb\file.txt"
:: Required parameters:
:: curcommand
:: Required functions:
:: funcdebugstart
:: funcdebugend
:: inccount
:: echolog
if defined masterdebug call :funcdebugstart usercommand
call :inccount
set curcommand=%~1
call :infile "%~2"
call :outfile "%~3" "%projectpath%\xml\%pcode%-%count%-useriocommand.xml"
set curcommand=%curcommand:'="%  "%infile%" "%outfile%"
call :before
%curcommand%
call :after "user io command"
if defined masterdebug call :funcdebugend
goto :eof

:command
:: Description: runs a dos command
:: Example: call :command dir "/b/s data/iso"
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



:cct
:: Description: Privides interface to CCW32.
:: Required preset variables:
:: ccw32
:: Optional preset variables:
:: Required parameters:
:: script - can be one script.cct or serial comma separated "script1.cct,script2.cct,etc"
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
set trace=
if defined echojavatrace set trace=-t
set curcommand="%java%" %loadcat%=%cat% net.sf.saxon.Transform %trace% %usecatalog1% %usecatalog2% -o:"%outfile%" "%infile%" "%script%" %param%
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
set curcommand="%java%" net.sf.saxon.Query -o:"%outfile%" -s:"%infile%" "%script%" %param%
call :before
%curcommand%
call :after "XQuery transformation"
if defined masterdebug call :funcdebugend
goto :eof

:testjava
:: Description: Test if java is installed. Attempt to use local java.exe other wise it will exit with a wraning.

set javainstalled=
set testjava=java-version.txt
rem the following line will generate a file. If Java is installed the file will start with "Usage:""
java>%testjava%
set /p firstline=<%testjava%
if "%firstline:~0,11%" == "Usage: java" set javainstalled=yes
if not defined javainstalled (
      if exist tools\java\java.exe (
            set java=tools\java\java.exe
      ) else (
            echo No java found installed nor was java.exe found inVimod-Pub tools\java folder.
            echo Please install Java on your machine. 
            echo Get it here: http://www.java.com/en/download/
            echo The program will exit after this pause.
            pause
            exit /b
      )
) else (
      set java=java
)
goto :eof


:tidy
:: Description: runs Tidy program
:: Plugin: move to a plugin
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

if defined masterdebug call :funcdebugstart before
if defined echocommandtodo echo Command to be attempted:
if defined echocommandtodo echo %curcommand%
echo "Command to be attempted:" >>%projectlog%
echo "%curcommand%" >>%projectlog%
if defined writebat echo %curcommand%>>%projectbat%
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
if defined errorlevel color 04
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
if defined errorlevel echo %message% failed to create %nameext%.
if defined errorlevel echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 
if defined errorlevel color 07
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
set name=%~n1
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

:plugin
:: Description: used to access external plugins
:: Optional preset variables:
:: outputdefault
:: Required parameters:
:: action
:: Optional parameters:
:: params
:: infile
:: outfile
:: Required functions:
:: infile
:: outfile

call :inccount
set plugin=%~1
set pluginsubtask=%~2
set params=%~3
::if (%params%) neq (%params:'=%) set params=%params:'="%
set params=%params:'="%
call :infile "%~4"
call :outfile "%~5" "%outputdefault%"
set curcommand=call plugins\%plugin%
call :before
%curcommand%
call :after "%plugin% plugin complete"
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
:: depreciated: use var
:resolve
:: depreciated: use var
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
:: Required prerequisite variables: 3
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

:loop
:: Description:
:: Required preset variables:
:: looptype - Can be any of these: string, listinfile or command
:: comment
:: string or file or command
:: tasks or function
:: Required functions:
:: tasklist
if defined masterdebug call :funcdebugstart loop
if defined echoloopcomment echo "%comment%"
if "%looptype%" == "" echo looptype not defined, skipping this task& exit /b
rem the command type may be used to process files from a command like: dir /b *.txt
if "%looptype%" == "command" (
      if defined tasks FOR /F %%s IN ('%command%') DO call :tasklist %tasks% "%%s"
      if defined function FOR /F %%s IN ('%command%') DO call :%function% "%%s"
)
rem the listinfile type may be used to process the lines of a file.
if "%looptype%" == "listinfile" (
      if defined tasks FOR /F %%s IN (%file%) DO call :tasklist %tasks% "%%s"
      if defined function FOR /F %%s IN (%file%) DO call :%function% "%%s"
)
rem the string type is used to process a space sepparated string.
if "%looptype%" == "string" (
      if defined tasks FOR /F %%s IN ("%string%") DO call :tasklist %tasks% "%%s"
      if defined function FOR /F %%s IN ("%string%") DO call :%function% "%%s"
)
rem clear function and tasklist variables in case of later use.
set function=
set tasks=
if defined masterdebug call :funcdebugend
goto:eof

:loopcommand
:: Description: loops through a list created from a command like dir and passes that as a param to a tasklist.
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
:: Description: Loops through a list of files supplied by a file.
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
:: Description: Loops through a list supplied in a string.
:: Required preset variables:
:: comment
:: string
:: action
if defined masterdebug call :funcdebugstart loopstring
echo %comment%
::echo on
FOR /F %%s IN ("%string%") DO call :tasklist %action% %%s
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
    set name=
    set val=
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
:: Required parameters:
:: file
:: text
:: quotes
:: newfile

set file=%~1
set text=%~2
set quotes=%~3
set newfile=%~4
if defined quotes set text=%text:'="%
if defined newfile (
echo %text% >%file%
) else (
echo %text% >>%file%
)
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

:removeCommonAtStart
:: Description: loops through two strings and sets new variable representing unique data
:: Required parameters:
:: name - name of the variable to be returned
:: test - string to have common data removed from start
:: Optional parameters:
:: remove - string if not defined then use %cd% as string.
:: Required functions:
:: removelet
set name=%~1
set test=%~2
set remove=%~3
if not defined remove set remove=%cd%
set endmatch=
FOR /L %%l IN (0,1,100) DO if not defined notequal (
      call :removelet
      ) else (
      exit /b
      )
goto :eof

:removelet
:: Description: called by removeCommonAtStart to remove one letter from the start of two string variables
:: Required preset variables:
:: test
:: remove
:: name
set test=%test:~1%
set %name%=%test:~1%
set remove=%remove:~1%
if "%test:~0,1%" neq "%remove:~0,1%" set notequal=on&exit /b
goto :eof

:done