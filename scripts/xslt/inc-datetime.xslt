<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:function name="f:xdatetime">
            <xsl:param name="datestring"/>
            <xsl:param name="timestring"/>
            <xsl:param name="dateformat"/>
            <xsl:variable name="datebit" select="tokenize($datestring,'/')"/>
            <xsl:variable name="timebit" select="tokenize($timestring,' ')"/>
            <xsl:variable name="hhmm" select="tokenize($timebit[1],':')"/>
            <xsl:variable name="xdate">
                  <xsl:choose>
                        <xsl:when test="$dateformat = 'DMY'">
                              <xsl:value-of select="concat($datebit[3],'-',$datebit[2],'-',$datebit[1])"/>
                        </xsl:when>
                        <xsl:when test="$dateformat = 'MDY'">
                              <xsl:value-of select="concat($datebit[3],'-',$datebit[1],'-',$datebit[2])"/>
                        </xsl:when>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="xtime">
                  <xsl:choose>
                        <xsl:when test="$timebit[2] = 'PM'">
                              <xsl:value-of select="concat(number($hhmm[1])+12,':',$hhmm[1],':00')"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat($hhmm[1],':',$hhmm[1],':00')"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="concat($xdate,'T',$xtime)"/>
      </xsl:function>
</xsl:stylesheet>
