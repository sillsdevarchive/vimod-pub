@echo off
:: FimodPub batch file with menus and tasklist processing
:: by Ian McQuay
:: Modified 2013-02-04
:: Now hosted on projects.palaso.org


:main
call :pubvar
set iso=%1
if "%1" neq "" goto :projects

:chooseproject
call :genlanggroups
call :menu %defaultmenu% "Chooose project?"
goto :eof

:genlanggroups
::dir data /b/ad>dir.tmp
echo #>%defaultmenu%
for /F "eol=#" %%i in ('dir data /b/ad') do call :writeprojectsmenuline %%i
goto :eof

:writeprojectsmenuline
set project=%~1
call :checkdir data\%project%\setup
set projectmenu=data\%project%\setup\project.menu
echo %project% project;menu data\%project%\setup\project.menu "%project% project">>%defaultmenu%
::dir data\%project% /b/ad>data\%project%\dir.tmp
echo #>%projectmenu%
for /F "eol=#" %%i in ('dir data\%project% /b/ad') do call :writemenuline %%i

goto :eof

:writemenuline
set subproject=%~1
if "%subproject%" neq "setup" (
if "%subproject%" neq "xml" ( 
echo %subproject% project;menu data\%project%\%subproject%\setup\project.menu "%subproject% project">>%projectmenu%
)
)
goto :eof

:projects
call pub-var.cmd %iso%
::if not exist %cd%\%projectpath%\xml md %cd%\%projectpath%\xml
call %cd%\%projectpath%\setup\project.cmd
call :menu %projectpath%\setup\project.menu "Chooose a project task for %iso% - %langname%"
goto :eof

:startmenu
set count=0
set menutitle=%~1
set projectpath=%~2
set menufile=%~3
set menuname=%~n3
set iso=%~4
set varfile=%~5
if "%iso%" neq "" call %projectpath%\%iso%-var.cmd
if "%varfile%" neq "" call %varfile%
::if "%pcode%" == "" set pcode=%menuname%
if exist "%projectpath%\setup\%menufile%" (
set projectmenu=%projectpath%\setup\%menufile%
) else (
set projectmenu=%projectpath%\setup\project.menu
)
set setuppath=%projectpath%\setup
::if exist %setuppath%\menu-%iso%.cmd call %setuppath%\menu-%iso%.cmd
echo off
call :menu %projectmenu% "%menutitle% Project"
goto :eof

:menu
set letters=abcdefghijklmnopqrstuvwxyz0123456789
::echo off
set menulist=%~1
set commonmenu=%~3
set setuppath=%~dp1
if not exist "%projectpath%\xml" md "%projectpath%\xml"
if "%commonmenu%" == "" set projectpath=%setuppath:\setup\=%
::if "%projectpath%" == "" set projectpath=%~p1&set projectpath=%projectpath:~0,-6%x
set title=     %~2     menu=%~1
set menuoptions=
echo[
echo %title%
echo[
rem FOR /F "eol=# tokens=1,2,3 delims=;" %%i in (%menulist%) do @echo        %%i. %%j &set option%%i=%%k &call :menuoptions %%i
FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
echo[
echo        x. Exit batch menu
echo[
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%'=='x' set iso= &echo ...exit menu&exit /b
:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice
FOR /D %%c IN (%menuoptions%) DO call :menueval %%c 
goto menu

:menuwriteoption
set let=%letters:~0,1%
set letters=%letters:~1%
@echo        %let%. %~1 
call :resolve option%let% "%action%"
call :menuoptions %let%
goto :eof

:menuoptions
set menuoptions=%menuoptions% %~1
goto :eof

:menueval

:: run through the choices to find a match then calls the selected option
set let=%~1
set option=option%let%
:: /I makes the IF comparison case-insensitive
IF /I '%Choice%'=='%let%' call :%%%option%%% 
goto :eof

:setup
set iso=
if "%~1" == "" (
SET proj=
SET /P Choice=Enter iso code: 
) else (
set proj=%1
)

set basepath=%cd%

echo =============================================
echo Setup %proj% variables
if exist var\%proj%.cmd (
call var\%proj%.cmd 
) else (
call :novarfile
)
mkdir log
set logtemp=log
::call build-func setuplog
call :dictvar
call :checks
set logtemp=
echo --------------------------------------------
goto :eof

:pubvar

:: Folder variables
set basepath=%cd%
set cctpath=scripts\cct
set xsltpath=scripts\xslt
set localhostpath=%htmlpath%
set fsprojectpath=%projectpath:\=/%
set defaultmenu=setup\projects.menu
set commontaskspath=%cd%\setup

:: some localization may be needed for variables in local_var.cmd. 
if "%localvar%" neq "checked" call local_var.cmd
set localvar=checked
goto :eof

:ifnotreport
:ifnotexisterror
echo off
set testfile=%~1
set message=%~2
set fatal=%~3
if not exist "%~1" (
echo %message% not found>>%logfile%
echo %message% not found
if "%fatal%" == "fatal" (
echo The script will end.
echo.
pause
exit /b
) 
) else (

echo . . . Found! %message%
echo . . . Found! %message% >>%logfile%

) 

echo off
goto :eof

:checks
:: create directories if not exist
echo[
echo Running checks for neccessary files and directoriesS
echo   basepath = %basepath%
echo   projectpath = %projectpath%
::call :checkdir %projectpath%\log
call :checkdir %projectpath%\checks
call :checkdir %projectpath%\checks\fields\
call :checkdir %projectpath%\xml
call :checkdir %projectpath%\setup

:: make localhost path
::call :checkdir %localhostpath%

:: make localhost subpaths
:: call :checkdir %localhostpath%\index
:: call :checkdir %localhostpath%\lexicon
:: call :checkdir %localhostpath%\common

:: make sure there are setup files available
::call :ifnotcopy "%basepath%\%projectpath%\setup\dictionary.txt" "%basepath%\setup\default-plb\*.*" "%basepath%\%projectpath%\setup"
::call :ifnotcopy  "%basepath%\%cctpath%\%iso%.cct" "%cctpath%\iso.cct" 

:: copy localhost files   \index.html
::call :ifnotcopy "%localhostpath%\index.html" "shells\ver2\index.html"
::call :ifnotcopy "%localhostpath%\common\find.html" "shells\ver2\common\*.*" "%localhostpath%\common"
::call :ifnotcopy "%projectpath%\%iso%.xslt" "%xsltpath%\iso.xslt"

:: Generate langs.js file
::set outfile=%localhostpath%\common\langs.js
::if not exist "%outfile%" (
::call build-func buildlangjs
::echo build-func buildlangjs
::echo build-func buildlangjs>>%logfile%
::) else (
::echo . . . Found! langs.js
::)

set gt=^>
set lt=^<
goto :eof

:novarfile
call:samplevarfile
call:clearlangvar
SET /P iso=Enter iso code: 
SET /P type=Enter markup type (usually plb): 
SET /P projectpath=Enter project relative path (usually data\%iso%): 
SET /P source=Enter source file name without path: 
SET /P langname=Enter vernacular language name: 
SET /P natlang=Enter National language name if used/needed: 
SET /P reglang=Enter Regional language name if used/needed: 
SET /P reg2lang=Enter second Regional language name if used/needed: 
SET /P reg3lang=Enter third Regional language name if used/needed: 
SET /P labelname=Enter name to use to tag entries ie Sinama for Sama Sibutu: 
SET /P separator=Enter separator for multiple entry fields: 
SET /P intropage=Enter filename of intro page (usually works-iso.html):
SET /P title=Enter filename of intro page (usually works-iso.html):
SET /P htmlpath=Enter HTML output path d;\path:D:\All-SIL-PLB\WebMaster\plb-www\works\%iso%
echo Custom collation settings. use defaults
SET /P set collationname=Leave blank for default collation:
SET /P set translateaccents=Leave blank for default (yes)
SET /P set customfind=Find like ng to change to eng for sorting
SET /P set customreplace=Replace string for sorting
set write=
set /P write=Do you want to write this information to a file for reuse? y or n:
if "%write%"=="y" call:writevarfile
goto :eof

:writevarfile
set outfile=var\%iso%.cmd
echo :%iso%>%outfile%
echo set iso=%iso%>>%outfile%
echo set type=%type%>>%outfile%
echo set projectpath=%projectpath%>>%outfile%
echo set source=%source%>>%outfile%
echo set langname=%langname%>>%outfile%
echo set natlang=%natlang%>>%outfile%
echo set reglang=%reglang%>>%outfile%
echo set reg2lang=%reg2lang%>>%outfile%
echo set reg3lang=%reg3lang%>>%outfile%
echo set labelname=%labelname%>>%outfile%
echo set splitseparator=%splitseparator%>>%outfile%
echo set intropage=%intropage%>>%outfile%
echo set title=%title%>>%outfile%
echo set htmlpath=%htmlpath%>>%outfile%
echo :: collation settings for costom collation>>%outfile%
echo set collationname=%collationname%>>%outfile%
echo set translateaccents=%translateaccents%>>%outfile%
echo set customfind=%customfind%>>%outfile%
echo set customreplace=%customreplace%>>%outfile%
goto :eof

:clearlangvar
SET iso=
SET type=
SET projectpath=
SET source=
SET langname=
SET natlang=
SET reglang=
SET reg2lang=
SET reg3lang=
SET labelname=
SET splitseparator=
SET intropage=
goto :eof

:samplevarfile
echo  var\%proj%.cmd does not exist.
echo Create this file in the following form
echo :iso
echo set iso=iso
echo set type=plb
echo set projectpath=data\iso
echo set source=iso-di.txt
echo set langname=Tagbanwa
echo set natlang=
echo set reglang=
echo set labelname=Tagbanwa
echo set splitseparator=;
echo set intropage=works-iso.html
echo set title=Ibatan - English Dictionary
echo set htmlpath=D:\All-SIL-PLB\WebMaster\plb-www\online\%iso%\dict6
echo :: collation settings for costom collation
echo set collationname=
echo set translateaccents=
echo set customfind=
echo set customreplace=
goto :eof


echo[
goto :eof

:setupfile
set report=Setup file %~1 copied if needed
%report2%echo copy "%basepath%\setup\default-%type%\%~1" "%projectpath%\setup"
copy "%basepath%\setup\default-%type%\%~1" "%projectpath%\setup"
goto :eof

:checkdir
set report=Checking dir %~1 
if exist "%~1"  (
          %report1%echo . . . Found! %~1
    ) else (
          %report1%echo . . . not found. %~1  
          mkdir "%~1" 
          %report1%echo mkdir "%~1" 
)
goto :eof


:debugsettings
:: Adjust report back levels 
:: Lev1-5 allows adjusting globally what is echoed back while processing
:: Set to :: to turn off reporting levels if all is going well.
:: Leave lev1 blank unless on debug level 0
set lev1=
:: Leave lev2 blank for good general reporting for debuglevel 1
set lev2=
:: Change to blank if you want more detailed progress reporting.
set lev3=
set lev4=::
set lev5=::
set xsltecho=off
set cctecho=off
set menuecho=off
goto :eof

:getiso
SET proj=
SET /P Choice=Enter iso code: 
goto :eof

:prince
call :ifnotexisterror %prince% "Prince XML" fatal
call :inccount
echo Creating PDF . . .
set style=%~1
call :infile "%~2"
set outfile=%~3
call :outfile "%~3" "%projectpath%\%pcode%-%writecount%-%~1.pdf"
call :before
%prince% -s "%style%" "%infile%" -o "%outfile%"
call :after "make PrinceXML PDF"
goto :eof



:ifnotcopy
if not exist %~1 (
    if "%~3" == "" (
        copy %~2 %~1
        %report1%echo copy %~2 %~1
        %report1%echo copy %~2 %~1>>%logfile%
    ) else (
        copy %~2 %~3
        %report1%echo copy %~2 %~3
        %report1%echo copy %~2 %~3>>%logfile%
    )
) else (
      %report1%echo . . . Found! %~1
)
goto :eof

:tasklist
::call build-func log "===== Starting %~2 from %~nx1 "
:: checks if the list is in the default directory, if it is it used that file, if not then it uses the given list
set list=%~1

if exist "%setuppath%\%list%" (
  set tasks=%setuppath%\%list%
) else  (
  if exist "%commontaskspath%\%list%" (
    set tasks=%commontaskspath%\%list%
  ) else (
    set tasks=%list%
  )
)
set pcode=%~2
set source=%projectpath%\%~3
set count=0
if not exist %tasks% (

echo tasks=%tasks%
echo Error tasklist not found &pause
)
FOR /F "eol=# tokens=2 delims=;" %%i in (%tasks%) do call :%%i
goto :eof

:task
call :%action%
goto :eof

:command
::call :ifnotexisterror %fopjar% "PDF creation via FOP" fatal
call :inccount
set command=%~1
set paramapp=%~2
set outfile=%~3
call :resolve paramapp "%paramapp%"
if "%paramapp%" neq "" set param=%paramapp:'="%
if "%~3" == "" (
echo %command% %param%
call %command% %param%
) else (
echo %command% %param% >"%outfile%"
call %command% %param%>"%outfile%"
call :after "Command done"
)
goto :eof

:start
call :inccount
set command=%~1
set paramapp=%~2
call :resolve paramapp "%paramapp%"
if "%paramapp%" neq "" set param=%paramapp:'="%
echo %command% %param%
%command% %param%
goto :eof

:fop
call :inccount
call :options %~1 -pdf
set script=-xsl "%~2"
call :infile "%~3"
call :outfile "%~4" %~1 
::call :before
::echo fop -xml "%infile%" -xsl %xsltpath%\%script% %options% "%outfile%"
echo on
if "%options%" == "-pdf" fop -fo "%infile%" "%outfile%"
if "%options%" == "-foout" fop -xml "%infile%" %script% %options% "%outfile%"
::java -jar css2fopnew.jar  "%infile%" "%outfile%"
::%fop% "%infile%" "%outfile%"
call :after
echo off
goto :eof


:cct
call :inccount
::echo on
set basepath=%cd%
set script=%~1
set scriptout=%script:.cct,=_%
call :infile "%~2"
call :outfile "%~3" "%projectpath%\xml\%pcode%-%writecount%-%scriptout%.xml"
::echo off
call :before
cd %cctpath%
echo %ccw32% %cctparam% -t "%script%" -o "%outfile%" "%infile%"
%ccw32% %cctparam% -t "%script%" -o "%outfile%" "%infile%"
cd %basepath%
call :after "Consistent Changes"
::
goto :eof


:validate
%xml% val -e "%outfile%"
goto :eof

:xslt
::echo %xsltecho%
call :inccount
set script=%xsltpath%\%~1.xslt
set allparam=%~2
set param=
call :resolve paramapp "%allparam%"
if "%paramapp%" neq "" set param=%paramapp:'="%
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%writecount%-%~1.xml"

call :before
%java%  -jar "%saxon9%"   -o "%outfile%" "%infile%" "%script%" %param% 
if not exist "%outfile%" echo %java%  -jar "%saxon9%"   -o "%outfile%" "%infile%" "%script%" %param%
call :after "XSLT transformation"
echo off
goto :eof

:settasktype
set settasktype=%~1
goto :eof


:setoutfile
set outfile=%~1
goto :eof

:before
::call :prereport
if exist "%outfile%" call :nameext "%outfile%"
if exist "%outfile%.pre.txt" (
del "%outfile%.pre.txt" 
rem echo        deleted "%nameext%.pre.txt" 
)
if exist "%outfile%" (
ren "%outfile%" "%nameext%.pre.txt" 
rem echo        renamed "%nameext%" to --} "%nameext%.pre.txt"
 
)
goto :eof

:after
call :nameext "%outfile%"
if not exist "%outfile%" (
    set errorlevel=1
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo %~1 failed to create %nameext%.
    if exist "%outfile%.pre.txt" (
        %report3%echo ren "%outfile%.pre.txt" "%nameext%"
        ren "%outfile%.pre.txt" "%nameext%"
        %report3%echo Previously existing %nameext% restored.
        %report3%echo The following processes will work on the previous version.
        echo .
    )
) else (
echo[
echo %writecount% Created:   %nameext%
echo[
if exist "%outfile%.pre.txt" del "%outfile%.pre.txt"
)
goto :eof

:nameext
set nameext="%~nx1"
::echo %nameext%
goto :eof

:name
set name="%~n1"
::echo %name%
goto :eof

:splitparam
FOR /F "tokens=2 delims==" %%i in (%~1) do set return=%%i:~-8
goto :eof


:file2uri
set uri%~2=
::set pathfile=%~1
call :resolve pathfile "%~1"
set numb=%~2
set uri%numb%=file:///%pathfile:\=/%
set return=file:///%pathfile:\=/%
%report1%echo       uri%numb%=%return:~0,25% . . . %return:~-30%
::echo       uri%numb%=%return%>>%logfile%
goto :eof

:inccount
set /A count=%count%+1
set writecount=%count%
if %count% lss 10 set writecount=%space%%count%
goto :eof



:html2pdf
:htmltopdf
:: Better to use the :manyparamcmd for wkhtmltopdf as there are so many param.
:: depreciated
call :ifnotexisterror %wkhtmltopdf% "Wkhtmltopdf" fatal
set param=%1
set params=%param:"=%
set params=%params:'="%
::set params=%params:]=>%
echo html2pdf %params%
"%wkhtmltopdf%" %params%
goto :eof

:copyoutfileto
call :inccount
set infile=%outfile%
set outfile=%~1
call :before

rem echo copy "%infile%" "%outfile%"
copy "%infile%" "%outfile%"
call :after "Copied "%infile%" to "%outfile%"
goto :eof


:reportlevel
if %~1 lss 1 set reoprt1=::
if %~1 lss 2 set reoprt2=::
if %~1 lss 3 set reoprt3=::
if %~1 lss 4 set reoprt4=::
if %~1 lss 5 set reoprt5=::
goto :eof

:tidy
call :inccount
call :options "%~1" "-asxml -utf8"
call :infile "%~2"
call :outfile "%~3" tidy
call :before
tidy %options% -o "%outfile%" "%infile%"
call :after
goto :eof

:parseparam
:: not working
FOR /F "eol=# delims=;" %%i in ("%input%") do set %%i
goto :eof

:manyparam
if "%first%" == "" (
set first=on
set param=%~1
) else (
set param=%param% %~1
)
goto :eof

:manyparamcmd
set param=%param:'="%
echo "%~1" %param%
"%~1"  %param%
set first=
goto :eof

:pandoc
call :ifnotexisterror %pandoc% "Pandoc" fatal
echo on
call :inccount
set options=%~1
set options=%options:'="%
if "%~2" == "" (
set infile=%outfile%
) else (
set infile=%~2
)
if "%~3" == "" (
set outfile=%projectpath%\xml\%pcode%-%writecount%-%~1.xml
) else (
set outfile=%~3
)
::call :before
echo %pandoc% %options%
::%pandoc% %options% -o "%outfile%" "%infile%"
%pandoc% %options%
echo off
call :after "Pandoc conversion"
goto :eof

:infile
if "%~1" == "" (
set infile=%outfile%
) else (
set infile=%~1
)
goto :eof

:outfile
if "%~1" == "" (
set outfile=%~2
) else (
set outfile=%~1
)
goto :eof

:options
if "%~1" == "" (
set options=%~2
) else (
set options=%~1
)
goto :eof

:setlong
%~0
echo %~0
goto :eof

:setvar
:resolve
:: Added handling so that a third param called echo will echo the variable back.
set var=%~1
if "%~3" == "" (
set value=%~2
) else (
if "%~3" == "echo" (
set value=%~2
) else (
set value=%~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9
)
)
::echo set %var%=%value%
set %var%=%value%
if "%~3" == "echo" echo %var%=%value%
goto :eof

:script
if "%~1" == "" (
set script=
) else (
set script=%~1
)
goto :eof

:serialtasks
::echo on
::call build-func log "Starting loop %~3"
set loopaction=%~1
set list=%~2
FOR /F %%s IN (%list%) DO call :%loopaction% %%s
::echo off
goto :eof

:indexProcessor
set inputvar=%~1
set input=%preinpath%%inputvar%%postinpath%
set output=%preoutpath%%inputvar%%postoutpath%
set cct=%ccts%
:: call :cct %cct% "%input%" "%output%"
call :cct "%cct%" "%input%" "%output%"
goto :eof

:phonegap
call :inccount
set phonegaptask=%~1
if '%phonegaptask%' == 'create' (
set phonegapbuildtype=%~2
set phonegapbuildpath=%~3
set phonegaprevuri=%~4
set phonegapprojectname=%~5
echo "%phonegappath%\%phonegapbuildtype%\bin\%phonegaptask%.bat" "%phonegapbuildpath%" "%phonegaprevuri%" "%phonegapProjectName%"
call "%phonegappath%\%phonegapbuildtype%\bin\%phonegaptask%.bat" "%phonegapbuildpath%" "%phonegaprevuri%" "%phonegapProjectName%"
call :after "phonegap %phonegaptask% done"
) else (
set phonegapbuildpath=%~2
set debug=
set debug=%~3
set outfile=%~4
if exist "%outfile%" del "%outfile%"
echo "%phonegapbuildpath%\phonegap\%phonegaptask%.bat" %debug%
call "%phonegapbuildpath%\phonegap\%phonegaptask%.bat" %debug%
call :ifnotexisterror "%outfile%" "%outfile% "
echo phonegap %phonegaptask% done
)
goto :eof

:cordova
call :inccount
set cordovatask=%~1
if '%cordovatask%' == 'create' (
set cordovabuildtype=%~2
set cordovabuildpath=%~3
set cordovarevuri=%~4
set cordovaprojectname=%~5
echo "%cordovapath%\cordova-%cordovabuildtype%\bin\%cordovatask%.bat" "%cordovabuildpath%" "%cordovarevuri%" "%CordovaProjectName%"
call "%cordovapath%\cordova-%cordovabuildtype%\bin\%cordovatask%.bat" "%cordovabuildpath%" "%cordovarevuri%" "%CordovaProjectName%"
call :after "Cordova %cordovatask% done"
) else (
set cordovabuildpath=%~2
set debug=
set debug=%~3
set outfile=%~4
if exist "%outfile%" del "%outfile%"
echo "%cordovabuildpath%\cordova\%cordovatask%.bat" %debug%
call "%cordovabuildpath%\cordova\%cordovatask%.bat" %debug%
call :ifnotexisterror "%outfile%" "%outfile% "
echo Cordova %cordovatask% done
)
goto :eof

:cordovabuild
call :inccount
set cordovaprojpath=
goto :eof

:zip
:: Zip file creation
call :ifnotexisterror "%zip%" "7zip" fatal
set zipfile=%zipoutdir%\dfm-%iso%-%size%-%langs%lang.zip
if exist "%zipfile%" del "%zipfile%"
set basepath=%cd%
cd "%cd%\data\%iso%\%langs%\%size%\JAR"
"%zip%" a -y "%zipfile%" 
::move dfm-%iso%-%size%-%langs%lang.zip \
call :ifnotdo "%zipfile%" "set ziperror=1"
cd "%basepath%"
goto :eof

:unzip
:: unzip file archive
call :ifnotexisterror "%zip%" "7zip not found" fatal
echo on
set zipfile=%cd%\%~1
set outpath=%~2
set basepath=%cd%
set overwrite=
if "%~3" == "overwrite" set overwrite=-y
cd "%outpath%"
"%zip%" x %overwrite% "%zipfile%"
cd "%basepath%"
echo off
goto :eof

:setdatetime
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

:loopcommand
echo "%comment%"
::echo on
FOR /F %%s IN ('%list%') DO call :%action%  %%s
goto:eof

:renamelast
set report=Named last file to %~1
set infile=%outfile%
set filename=%~1
call :drivepath "%infile%"
copy /Y "%infile%" "%drivepath%%filename%" 
::echo %action%
::call :action
goto :eof

:drivepath
set drivepath=%~dp1
echo %drivepath%
goto :eof

:action
call :before
if "%debug%" == "on" echo %actno% start- %action% 
if "%outfile%" == "" set outfile=null
if "%~1" == "" (
%action%
) else (
if "%~1" == "screen2file" %action% > %outfile%
if "%~1" == "append" %action% >> %outfile%
if "%~1" == "xml" (
echo ^<%~3/^> > %outfile%
)
)
call :after
goto :eof


:done