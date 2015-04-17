<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vpxml-generate-caller-report.xslt
    # Purpose:      Looks at the callers to compare to callee report
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015-03-04
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
            <xsl:apply-templates select="scr//tag"/>
      </xsl:template>
      <xsl:template match="tag[@value = $caller-feature][. = $caller]">
            <xsl:variable name="chap" select="preceding::para[@class = $c][1]/tag[1]"/>
            <xsl:variable name="verse" select="preceding::tag[@value = $v][1]"/>
            <xsl:value-of select="."/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="concat($chap,':',$verse)"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="text()"/>
</xsl:stylesheet>
