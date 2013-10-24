import os
modsfile = mpp + '\\' + Project + '\\PrintDraft\\PrintDraft-mods.tex'
# write to batch file echo off. Overwrite previous file.

#rename the original file to preserve it
command = "if not exist \"" + mpp + '\\' + Project + "\\PrintDraft-mods.tex\" ren \"" + modsfile + "\" \"PrintDraft-mods.tex.original\""
os.system(command)

# build the parameters to construct outer PrintDraft-mods.tex file
BindingGutter = "echo \BindingGutter=" + BindingGutter + ">" + modsfile
BindingGuttertrue = "echo \BindingGuttertrue>>" + modsfile
FontSizeUnit = "echo \FontSizeUnit=" + FontSizeUnit + ">>" + modsfile
ParagraphedNotes = "echo \ParagraphedNotes{x}>>" + modsfile
newlanguage = "echo \newlanguage\printDraftLanguage>>" + modsfile
language = "echo \language\printDraftLanguage>>" + modsfile

# write new outer PrintDraft-mods.tex
os.system(BindingGutter)
os.system(BindingGuttertrue)
os.system(FontSizeUnit)
os.system(ParagraphedNotes)
os.system(newlanguage)
os.system(language)

