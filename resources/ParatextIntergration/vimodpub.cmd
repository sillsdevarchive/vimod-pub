:: Edit the location parameter below to match your VimodPub location.
set location=D:\All-SIL-Publishing\vimod-pub

::
:: The following lines should not be edited.
:: The next line changes the drive to the correct drive
%location:1,2%
:: Next change to path
cd "%location%"
:: Start the program
"%location%\pub.cmd"