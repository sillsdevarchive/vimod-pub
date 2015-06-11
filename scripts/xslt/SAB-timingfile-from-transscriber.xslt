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
    ################################################################ 
Input file is a Transcriber 1.5 file and output file is a ??? file for inclusion in


-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:strip-space elements="*"/>
      <xsl:template match="//Turn">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="Sync">
            <xsl:choose>
                  <xsl:when test="@time = '0'"/>
                  <xsl:otherwise>
                        <xsl:value-of select="@time"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="@time"/>
                        <xsl:text>&#9;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="text()">
            <xsl:choose>
                  <xsl:when test="normalize-space(.) = '\ref	\gl'"/>
                  <xsl:otherwise>
                        <xsl:value-of select="tokenize(normalize-space(.),'\s')[1]"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
