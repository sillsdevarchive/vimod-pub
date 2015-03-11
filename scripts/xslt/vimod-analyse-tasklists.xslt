<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vimod-analyse-tasklists.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="filelist"/>
      <xsl:variable name="file" select="f:file2lines($filelist)"/>
      <xsl:variable name="alltasks">
            <xsl:for-each select="$file">
                  <xsl:variable name="curline" select="f:file2lines(.)"/>
                  <xsl:for-each select="$curline">
                        <xsl:choose>
                              <xsl:when test="matches(.,'^#')"/>
                              <xsl:when test="matches(.,'; ')"/>
                              <xsl:when test="matches(.,';')">
                                    <xsl:value-of select="replace(.,'^.+;([a-z0-9]+).*$','$1')"/>
                                    <xsl:text>&#13;&#10;</xsl:text>
                              </xsl:when>
                              <xsl:otherwise/>
                        </xsl:choose>
                  </xsl:for-each>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="alltasks2" select="tokenize($alltasks,'\r?\n')"/>
      <xsl:variable name="sortedtasks">
            <xsl:perform-sort select="$alltasks2">
                  <xsl:sort/>
            </xsl:perform-sort>
      </xsl:variable>
      <xsl:variable name="sorted2" select="tokenize($sortedtasks,'\s+')"/>
      <xsl:template match="/">
            <xsl:for-each-group select="$sorted2" group-by=".">
                  <xsl:if test="string-length(current-group()[1]) gt 0">
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="current-group()[1]"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:if>
            </xsl:for-each-group>
      </xsl:template>
</xsl:stylesheet>
