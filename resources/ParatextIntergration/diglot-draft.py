# Starts the writes then start the diglot-draft-combine.cmd batch file, 
# in order to combine two PDF files

# Written by Ian McQuay, SIL Publishing Asia, July 2013

# Import OS to be able to output correctly to Windows 
import os
batchfile = "C:\\Temp\\diglot-draft-combine.cmd"
# write to batch file echo off. Overwrite previous file.
pause = "echo pause>>" + batchfile
gotoeof = "echo goto :eof>>" + batchfile
commandstring0 = "echo @echo off >" + batchfile
commandstring1 = "echo set mpp=" + mpp + ">>" + batchfile
commandstring2 = "echo set draftbook=" + draftbook + ">>" + batchfile
commandstring3 = "echo set innerver=" + innerver + ">>" + batchfile
commandstring4 = "echo set outerver=" + Project + ">>" + batchfile
commandstring5 = "echo set pdftk=" + pdftk + ">>" + batchfile
commandstring6 = "echo set file2=%mpp%\\%innerver%\\PrintDraft\\printdraft-%innerver%-%draftbook%.pdf" + ">>" + batchfile
commandstring7 = 'echo set file1=%mpp%\\%outerver%\\PrintDraft\\printdraft-%outerver%-%draftbook%.pdf' + ">>" + batchfile
commandstring8 = 'echo set diglot=%mpp%\\%outerver%\\PrintDraft\\diglotdraft-%outerver%-%innerver%-%draftbook%.pdf' + ">>" + batchfile
#commandstring8a = "echo if not exist \"%file1%\" set report=File not found! %file1% \\&goto :error >>" + batchfile
#commandstring8b = "echo if not exist \"%file2%\" set report=File not found! %file2% \&goto :error>>" + batchfile
testpdftkreport = "echo set report=File not found! %pdftk% >>" + batchfile
commandstring8c = "echo if not exist \"%pdftk%\" goto :error >>" + batchfile

testmppreport = "echo set report=Folder not found! %mpp% >>" + batchfile
commandstring8d = "echo if not exist \"%mpp%\" goto :error >>" + batchfile
# pdftk A.pdf multibackground B.pdf output A_B_Diglot.pdf
commandstring9b = "echo echo command to run=\"%pdftk%\" \"%file1%\" multibackground \"%file2%\" output \"%diglot%\" >>" + batchfile
commandstring10 = "echo \"%pdftk%\" \"%file1%\" multibackground \"%file2%\" output \"%diglot%\" >>" + batchfile
commandstring11 = "echo :error >>" + batchfile
commandstring11a = "echo echo %report% >>" + batchfile
commandstring11b = "echo echo Checks your Options are correct in Paratext check >>" + batchfile
commandstring11c = "echo echo The batch file will exit >>" + batchfile
commandstring11d = "echo exit /b 1 >>" + batchfile
# append to batch file the variables. Some are repeated
os.system(commandstring0)
os.system(commandstring1)
os.system(commandstring2)
os.system(commandstring3)
os.system(commandstring4)
os.system(commandstring5)
os.system(commandstring6)
os.system(commandstring7)
os.system(commandstring8)
os.system(testpdftkreport)
os.system(commandstring8c)
os.system(testmppreport)
os.system(commandstring8d)
os.system(commandstring10)
os.system(pause)
os.system(gotoeof)
os.system(commandstring11)
os.system(commandstring11a)
os.system(commandstring11b)
os.system(commandstring11c)
os.system(pause)
os.system(commandstring11d)
os.system(gotoeof)


# call the just written file
os.startfile(batchfile)
