<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2014 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:template match="//book">
            <xsl:value-of select="@book"/>
            <xsl:value-of select="'&#9;'"/>
            <xsl:value-of select="count(scr/para/caller)"/>
            <xsl:value-of select="'&#9;'"/>
            <xsl:value-of select="count(note/fnote)"/>
            <xsl:if test="count(scr/para/caller) ne count(note/fnote)">
                  <xsl:text>&#9;unequal</xsl:text>
            </xsl:if>
            <xsl:value-of select="'&#13;&#10;'"/>
      </xsl:template>
</xsl:stylesheet>
