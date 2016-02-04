<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         dfm-make-properties.xslt
    # Purpose:     Make a DictionaryForMIDS properties file.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" name="cright" encoding="utf-8"/>
      <xsl:output method="text" omit-xml-declaration="yes" use-character-maps="nl"/>
      <xsl:character-map name="nl">
            <xsl:output-character character="&#10;" string="&#13;&#10;"/>
      </xsl:character-map>
      <xsl:strip-space elements="*"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="dfmsize"/>
      <xsl:param name="copyrightfile"/>
      <xsl:variable name="copyrighturi" select="f:file2uri($copyrightfile)"/>
      <xsl:template match="/">
            <xsl:result-document href="{$copyrighturi}" format="cright">
                  <xsl:value-of select="concat('Title: ',$voltitle)"/>
                  <xsl:value-of select="concat('&#10;Compiler: ',$compiler)"/>
                  <xsl:value-of select="concat('&#10;Publisher: ',$publisher)"/>
                  <xsl:value-of select="concat('&#10;Publication Date: ',$pubdate)"/>
            </xsl:result-document>
            <!-- write properties file -->
            <xsl:value-of select="concat('&#10;infoText: ',$voltitle,'. ',$publisher,'. version: ',$pubdate)"/>
            <xsl:value-of select="concat('&#10;dictionaryAbbreviation: ',$dfmsize)"/>
            <xsl:value-of select="concat('&#10;numberOfAvailableLanguages: ',$langs)"/>
            <xsl:value-of select="concat('&#10;language1DisplayText: ',$langname)"/>
            <xsl:value-of select="concat('&#10;language2DisplayText: ',$langname2)"/>
            <xsl:value-of select="concat('&#10;language1FilePostfix: ',$iso)"/>
            <xsl:value-of select="concat('&#10;language2FilePostfix: ',$iso2)"/>
            <xsl:text>&#10;language1IsSearchable: true</xsl:text>
            <xsl:text>&#10;language2IsSearchable: true</xsl:text>
            <xsl:text>&#10;language1GenerateIndex: true</xsl:text>
            <xsl:text>&#10;language2GenerateIndex: true</xsl:text>
            <xsl:text>&#10;language1HasSeparateDictionaryFile: false</xsl:text>
            <xsl:text>&#10;language2HasSeparateDictionaryFile: false</xsl:text>
            <xsl:if test="number($langs) ge 3">
                  <xsl:value-of select="concat('&#10;language3DisplayText: ',$langname3)"/>
                  <xsl:value-of select="concat('&#10;language3FilePostfix: ',$iso3)"/>
                  <xsl:text>&#10;language3IsSearchable: true</xsl:text>
                  <xsl:text>&#10;language3GenerateIndex: true</xsl:text>
                  <xsl:text>&#10;language3HasSeparateDictionaryFile: false</xsl:text>
                  <xsl:text>&#10;language3IsSearchable: true</xsl:text>
                  <xsl:text>&#10;language3GenerateIndex: true</xsl:text>
                  <xsl:text>&#10;language3HasSeparateDictionaryFile: false</xsl:text>
            </xsl:if>
            <xsl:if test="number($langs) ge 4">
                  <xsl:value-of select="concat('&#10;language4DisplayText: ',$langname4)"/>
                  <xsl:value-of select="concat('&#10;language4FilePostfix: ',$iso4)"/>
                  <xsl:text>&#10;language4IsSearchable: true</xsl:text>
                  <xsl:text>&#10;language4GenerateIndex: true</xsl:text>
                  <xsl:text>&#10;language4HasSeparateDictionaryFile: false</xsl:text>
                  <xsl:text>&#10;language4IsSearchable: true</xsl:text>
                  <xsl:text>&#10;language4GenerateIndex: true</xsl:text>
                  <xsl:text>&#10;language4HasSeparateDictionaryFile: false</xsl:text>
            </xsl:if>
            <xsl:text>
dictionaryGenerationSeparatorCharacter: '\t'
indexFileSeparationCharacter: '\t'
searchListFileSeparationCharacter: '\t'
dictionaryFileSeparationCharacter: '\t'
dictionaryGenerationOmitParFromIndex: true
dictionaryGenerationInputCharEncoding: UTF-8
indexCharEncoding: UTF-8
searchListCharEncoding: UTF-8
dictionaryCharEncoding: UTF-8</xsl:text>
            <xsl:text>
language1DictionaryUpdateClassName: de.kugihan.dictionaryformids.dictgen.dictionaryupdate.DictionaryUpdate
language2DictionaryUpdateClassName: de.kugihan.dictionaryformids.dictgen.dictionaryupdate.DictionaryUpdate</xsl:text>
            <xsl:if test="number($langs) ge 3">
                  <xsl:text>&#10;language3DictionaryUpdateClassName: de.kugihan.dictionaryformids.dictgen.dictionaryupdate.DictionaryUpdate</xsl:text>
            </xsl:if>
            <xsl:if test="number($langs) ge 4">
                  <xsl:text>&#10;language4DictionaryUpdateClassName: de.kugihan.dictionaryformids.dictgen.dictionaryupdate.DictionaryUpdate</xsl:text>
            </xsl:if>
            <xsl:text>
language1NormationClassName: de.kugihan.dictionaryformids.translation.normation.NormationEng
language2NormationClassName: de.kugihan.dictionaryformids.translation.normation.NormationEng</xsl:text>
            <xsl:if test="number($langs) ge 3">
                  <xsl:text>&#10;language3NormationClassName: de.kugihan.dictionaryformids.translation.normation.NormationEng</xsl:text>
            </xsl:if>
            <xsl:if test="number($langs) ge 4">
                  <xsl:text>&#10;language4NormationClassName: de.kugihan.dictionaryformids.translation.normation.NormationEng</xsl:text>
            </xsl:if>
            <xsl:text>
language1NumberOfContentDeclarations: 08
language1Content01DisplayText: GrammaticalTag
language1Content02DisplayText: Definition
language1Content03DisplayText: contentSampleUsage
language1Content04DisplayText: SampleUsageTranslation
language1Content05DisplayText: Labels
language1Content06DisplayText: Scientific
language1Content07DisplayText: Bold
language1Content08DisplayText: Italic
language1Content01FontColour: 128,0,0
language1Content02FontColour: 0,0,0
language1Content03FontColour: 0,0,255
language1Content04FontColour: 128,128,128
language1Content05FontColour: 128,128,128
language1Content05FontStyle: italic
language1Content06FontColour: 0,0,0
language1Content06FontStyle: italic
language1Content07FontStyle: bold
language1Content08FontStyle: italic</xsl:text>
      </xsl:template>
</xsl:stylesheet>
