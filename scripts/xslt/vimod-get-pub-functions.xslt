<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vimod-get-pub-functions.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8" name="text"/>
<xsl:output method="text" encoding="utf-8" />
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="pubfile" select="'D:\All-SIL-Publishing\vimod-pub\pub.cmd'"/>
      <xsl:param name="outcallfile"/>
      <xsl:variable name="line" select="f:file2lines($pubfile)"/>
      <xsl:variable name="sortedfunc">
            <xsl:for-each select="$line">
                  <xsl:sort/>
                  <xsl:choose>
                        <xsl:when test="matches(.,'^:[a-z]')">
                              <xsl:value-of select="replace(.,':','')"/>
                              <xsl:text>&#13;&#10;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise/>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="allcall">
            <xsl:for-each select="$line">
                  <xsl:choose>
                        <xsl:when test="matches(.,'^::')"/>
                        <xsl:when test="matches(.,'^rem')"/>
                        <xsl:when test="matches(.,'call :')">
                              <xsl:value-of select="replace(.,'^.*call :([a-z0-9%]+) ?.*','$1')"/>
                              <xsl:text>&#13;&#10;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise/>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="allcall2" select="tokenize($allcall,'\r?\n')"/>
      <xsl:variable name="callsorted">
            <xsl:perform-sort select="$allcall2">
                  <xsl:sort/>
            </xsl:perform-sort>
      </xsl:variable>
      <xsl:variable name="callsortednodes" select="tokenize($callsorted,'\s+')"/>
      <xsl:template match="/">
            <xsl:value-of select="$sortedfunc"/>
            <xsl:result-document href="{f:file2uri($outcallfile)}" format="text">
                  <xsl:for-each-group select="$callsortednodes" group-by=".">
                        <xsl:if test="string-length(current-group()[1]) gt 0">
                              <xsl:value-of select="count(current-group())"/>
                              <xsl:text>&#9;</xsl:text>
                              <xsl:value-of select="current-group()[1]"/>
                              <xsl:text>&#13;&#10;</xsl:text>
                        </xsl:if>
                  </xsl:for-each-group>
            </xsl:result-document>
      </xsl:template>
</xsl:stylesheet>
