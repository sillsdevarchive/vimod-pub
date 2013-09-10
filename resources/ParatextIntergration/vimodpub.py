# Starts the Vimod-Pub pub.cmd program, in order to post process USX files

# Written by Ian McQuay, SIL Philippines, July 2013 

# Import OS to be able to output correctly to Windows 
import os

# Send a command to start the LD_Link program
# all backslashes must be doubled as it is a Python escape character
os.startfile("D:\\My Paratext Projects\\cms\\vimodpub.cmd")
#os.startfile("C:\\My Paratext Projects\\cms\\vimodpub.cmd")