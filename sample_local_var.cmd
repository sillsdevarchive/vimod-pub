:: 1. Localise this file for your machine.
:: 2. rename this file to local_var.cmd

:: alternative path location of XSLTs
set altxsltpath=D:\All-SIL-PLB\WebMaster\Publishing\Dict-svn\scripts\xslt

:: Tools
:: These tools are on the %path% so do not need their location,
:: if not on path set up like the following
:: set binmay=C:\[your\path]\binmay.exe
:: tools in the path
:: A Java Runtime Environment JRE is needed or a Java SDK is essential for using Saxon9
set java=java
:: XML is from http://xmlstar.sourceforge.net/
set xml=xml
:: 
set binmay=binmay
:: http://www.sil.org/computing/catalog/show_software.asp?id=4
set ccw32=ccw32
:: http://gnuwin32.sourceforge.net/packages/coreutils.htm
set csplit=csplit
set uniq=uniq
set sort=sort
:: http://gnuwin32.sourceforge.net/packages/sed.htm
set sed=sed

:: tools not found in path
:: set variable for any tools that cannot be found in the path
:: http://saxon.sourceforge.net
set saxon9=C:\Program Files (x86)\Kernow\lib\saxon9.jar
call :ifnotexisterror "%saxon9%" "Saxon XSLT" fatal
:: http://www.princexml.com
set prince="C:\Program Files (x86)\Prince\engine\bin\Prince.exe"
call :ifnotexisterror %prince% "Prince XML"
:: http://code.google.com/p/wkhtmltopdf/
set wkhtmltopdf="C:\Program Files (x86)\wkhtmltopdf\wkhtmltopdf.exe"
call :ifnotexisterror %wkhtmltopdf% "Wkhtmltopdf"
:: http://johnmacfarlane.net/pandoc/installing.html
set pandoc="C:\Program Files (x86)\Pandoc\bin\pandoc.exe"
call :ifnotexisterror %pandoc% "Pandoc"
:: http://xmlgraphics.apache.org/fop/
set fopjar="C:\Program Files (x86)\fop\build\fop.jar"
call :ifnotexisterror %fopjar% "PDF creation via FOP"
set fop="C:\Program Files (x86)\fop\fop.bat"

::other variables
set cctparam=-u -b -q -n
set varfile=setup\default-setup-%type%.TXT
set space=0
goto :eof

:ifnotexisterror
set testfile=%~1
set message=%~2
echo.
echo %message%
echo %message%>>%logfile%
echo.
if "%~3" == "fatal" (
echo The script will end.
echo.
pause
exit /b
) 
pause
goto :eof