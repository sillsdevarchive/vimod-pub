<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:	extract data from ebible
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:strip-space elements="*"/>
      <xsl:template match="/*/*/table/tr">
            <xsl:value-of select="tokenize(td[2]/a/@href,'/')[last()]"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="td[2]/a"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="td[1]"/><xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="text()"/>
</xsl:stylesheet>
