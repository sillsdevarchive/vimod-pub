<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:		ethnologue-extract-countries.xslt
    # Purpose:	After making an Ethnologue pseudo XHTML into XML (should not need to but) you can extract the iso codes and language names.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015-05-25
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:template match="*">
            <!--<xsl:value-of select="name()"/>
            <xsl:text>&#13;&#10;</xsl:text> -->
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="*[matches(@href,'/country/')][name() = 'a']">
            <xsl:value-of select="."/>
            <xsl:text>=</xsl:text>
            <xsl:value-of select="replace(@href,'/country/','')"/>
            <xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
</xsl:stylesheet>
