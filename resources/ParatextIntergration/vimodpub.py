# Starts the Vimod-Pub pub.cmd program, in order to post process USX files

# Written by Ian McQuay, SIL Philippines, July 2013 

# Import OS to be able to output correctly to Windows 
import os
batchfile = "C:\\Temp\\vimodpub-link.cmd"
# write to batch file echo off. Overwrite previous file.
commandstring = "echo @echo off >" + batchfile
os.system(commandstring)
# append to batch file the variable from PT cms option
commandstring = "echo set vimodfolder=" + vimodfolder + ">>" + batchfile
os.system(commandstring)
# append to batch file get the drive letter
commandstring = "echo set drive=%vimodfolder:~0,2%>>" + batchfile
os.system(commandstring)
# append to batch file swap to the correct drive
commandstring = "echo call %drive%>>" + batchfile
os.system(commandstring)
# append to batch file change path to vimod-pub
commandstring = "echo cd \"%vimodfolder%\">>" + batchfile
os.system(commandstring)
# append to batch file  the call to Vimod-Pub pub.exe
commandstring = "echo call \"%vimodfolder%\pub.cmd\">>" + batchfile
os.system(commandstring)
# call the just written file
os.startfile(batchfile)
