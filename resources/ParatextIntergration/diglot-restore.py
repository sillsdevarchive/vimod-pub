import os
modsoriginalfile = mpp + '\\' + Project + '\\PrintDraft\\PrintDraft-mods.tex.original'
# write to batch file echo off. Overwrite previous file.

#rename the PrintDraft-mods.tex.original to PrintDraft-mods.tex
command = "ren \"" + modsoriginalfile + "\" \"PrintDraft-mods.tex\""
os.system(command)
