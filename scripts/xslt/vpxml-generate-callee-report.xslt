<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vpxml-generate-callee-report.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="/*">
            <xsl:apply-templates select="book"/>
      </xsl:template>
      <xsl:template match="book">
            <xsl:value-of select="@book"/>
            <xsl:text> ==============&#13;&#10;</xsl:text>
            <xsl:apply-templates select="note"/>
      </xsl:template>
      <xsl:template match="note">
            <xsl:apply-templates select="para"/>
      </xsl:template>
      <xsl:template match="para[@class = $fnote]">
            <xsl:apply-templates select="tag[@value = $callee-feature]"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:apply-templates select="tag[@value = $callee-ref-tag]"/>
            <xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="tag[@value = $callee-feature]">
            <xsl:value-of select="."/>
      </xsl:template>
      <xsl:template match="tag[@value = $callee-ref-tag]">
            <xsl:choose>
                  <xsl:when test="matches(normalize-space(.),'^[\d:\-,ab]+$')">
                        <xsl:value-of select="."/>
                  </xsl:when>
                  <xsl:otherwise />
            </xsl:choose>
      </xsl:template>
            <xsl:template match="text()"/>
</xsl:stylesheet>
