<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:template match="*">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="*[id = 'list']">
            <xsl:apply-templates select="li"/>
      </xsl:template><!--
      <xsl:template match="li">
            <xsl:apply-templates select="*"/>
      </xsl:template> -->
      <xsl:template match="a">
            <xsl:value-of select="tokenize(tokenize(@href,'=')[2],'&amp;')[1]"/>
            <xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="*[@class='first-child']"/>
</xsl:stylesheet>
