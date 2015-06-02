:: scr file combiner
:main
@echo off
set starttime=%time%
set books=GEN EXO LEV NUM DEU JOS JDG RUT 1SA 2SA 1KI 2KI 1CH 2CH EZR NEH EST JOB PSA PRO ECC SNG ISA JER LAM EZK DAN HOS JOL AMO OBA JON MIC NAM HAB ZEP HAG ZEC MAL MAT MRK LUK JHN ACT ROM 1CO 2CO GAL EPH PHP COL 1TH 2TH 1TI 2TI TIT PHM HEB JAS 1PE 2PE 1JN 2JN 3JN JUD REV
rem set books=D:\All-SIL-Publishing\vimod-pub\resources\prod-books-only.txt
set langpre=%1
rem remove trailing asterist
set langpre=%langpre:~0,-1%
set intro=%intropart%
set fn=%fnpart%
set ext=%fileext%
set all=%allvptextfile%
rem set projectpath=D:\All-SIL-Publishing\vimod-pub\data\ventura2usfm\ifa-2007
if not defined allvptextfile echo add allvptextfile var to project.tasks & echo default value=%projectpath%\vp-u\allvp.txt &exit
if exist "%all%" del "%all%"
for %%b in (%books%) do call :copy %%b
echo start: %starttime% end: %time%
@echo off
goto :eof

:copy
rem echo on
set bk=%~1
set file=%projectpath%\%sourcefolder%\%langpre%%bk%%ext% 
set introfile=%projectpath%\%sourcefolder%\%langpre%%bk%%intro%%ext%
set fnfile=%projectpath%\%sourcefolder%\%langpre%%bk%%fn%%ext%
if exist %file% (
  echo %bk%
  echo @@@ scr %bk% = >> %all%
  if exist %introfile% copy /a %all%+%introfile% %all% /b
  copy  /a %all%+%file% %all% /a
  if exist %fnfile% (
    echo @@@ fn %bk% = >> %all%
    copy /a %all%+%fnfile% %all% /a
  )
  rem pause
)
goto :eof
