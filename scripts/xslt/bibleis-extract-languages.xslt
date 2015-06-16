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
      <xsl:template match="select[@name = 'language']">
            <xsl:apply-templates select="option"/>
      </xsl:template>
      <!--
      <xsl:template match="li">
            <xsl:apply-templates select="*"/>
      </xsl:template> -->
      <xsl:template match="option">
            <xsl:choose>
                  <xsl:when test="string-length(@value) = 3">
                        <xsl:value-of select="lower-case(@value)"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="."/>
<xsl:text>&#13;&#10;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
