<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vimod-get-pub-functions-to-otl.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8" name="text"/>
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="pubfile" select="'D:\All-SIL-Publishing\vimod-pub\pub.cmd'"/>
      <xsl:param name="outcallfile"/>
      <xsl:variable name="line" select="f:file2lines($pubfile)"/>
      <xsl:template match="/">
            <xsl:text>= V4 Outline MultiLine TabWidth=30</xsl:text>
<xsl:text>&#13;&#10;&#13;&#10;H="::File Header"&#13;&#10;</xsl:text>
            <xsl:for-each select="$line">
                  <xsl:choose>
                        <xsl:when test="matches(.,'^:[^:]')">
                              <xsl:text>&#13;&#10;&#13;&#10;H="</xsl:text>
                              <xsl:value-of select="."/>
                              <xsl:text>"&#13;&#10;</xsl:text>
                              <xsl:value-of select="."/><xsl:text>&#13;&#10;</xsl:text>
                        </xsl:when>
                        <xsl:when test="matches(.,'^::')">
<xsl:variable name="trimline" select="replace(.,'^:: ','')"/>
<xsl:choose>
<xsl:when test="matches($trimline,':')">
<xsl:text>   </xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text>      </xsl:text>
</xsl:otherwise>
</xsl:choose>
                              <xsl:value-of select="$trimline"/>
                              <xsl:text>&#13;&#10;</xsl:text>
                        </xsl:when>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
