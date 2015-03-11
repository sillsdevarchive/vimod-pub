<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:       	udict-make-lang-js.xslt
    # Purpose:	Create a lang.js file from the variables
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-10 -16
    # Copyright:   	(c) 2014 SIL International
    # Licence:      	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:character-map name="langjs">
            <xsl:output-character character="`" string="'"/>
      </xsl:character-map>
      <xsl:output method="text" encoding="utf-8" use-character-maps="langjs"/>
      <xsl:include href="project.xslt"/>
      <xsl:variable name="part1" select="'/// works with dictionary.js
&#10;/// 11/10/2013		Laura Gabler		Created
&#10;///
&#10;/// These variables may vary for different languages
&#10;
&#10;var CopyrightInfo = `&amp;copy; '"/>
      <xsl:variable name="year" select="year-from-date(current-date())"/>
      <xsl:variable name="part2" select="' SIL Philippines`;
&#10;var Language = `'"/>
      <xsl:variable name="part3" select="
'`;
&#10;
&#10;//ALT_CHARS: used so that when searching, English characters will cover similar non-english characters
&#10;//as some devices may not have those characters, or they may not be easy to access
&#10;var ALT_CHARS = [{ letterRegex: /a/ig, replaceRegex: `[aāâ]` }, { letterRegex: /i/ig, replaceRegex: `(i|ī|í)` }, { letterRegex: /e/ig, replaceRegex: `(e|ē)` }, { letterRegex: /o/ig, replaceRegex: `(ō|ó)` }];
&#10;'"/>
      <xsl:template match="/">
            <xsl:value-of select="concat($part1,$year,$part2,$langname,$part3)"/>
      </xsl:template>
</xsl:stylesheet>
