import os
modsfile = mpp + '\\' + Project + '\\PrintDraft\\PrintDraft-mods.tex'
# write to batch file echo off. Overwrite previous file.

#rename the original file to preserve it
command = "if not exist \"" + mpp + '\\' + Project + "\\PrintDraft-mods.tex\" ren \"" + modsfile + "\" \"PrintDraft-mods.tex.original\""
os.system(command)

f = open(modsfile,'w')
f.write('\\BindingGutter=' + FontSizeUnit + '\n')
f = open(modsfile,'a')
f.write('\\BindingGuttertrue\n')

