<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     generic-get-indented-lines.xslt
    # Purpose:	get indented lines
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="text" encoding="utf-8"/>
       <xsl:include href="inc-param-file2lines.xslt"/> 
      <xsl:template match="/*">
            <xsl:for-each select="$line">
                  <xsl:if test="matches(.,'^\s+')">
                        <xsl:value-of select="replace(.,'^\s+','')"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
