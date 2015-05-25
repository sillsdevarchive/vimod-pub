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
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:param name="full_list"/>
      <xsl:param name="country_list"/>
      <xsl:variable name="full" select="f:file2lines($full_list)"/>
      <xsl:variable name="country" select="f:file2lines($country_list)"/>
      <xsl:template match="/">
            <xsl:for-each select="$full">
                  <xsl:variable name="lookupval" select="f:lookupdefault($country,.,'&#9;',1,2,'')"/>
                  <xsl:if test="string-length($lookupval[1]) gt 0">
                        <xsl:value-of select="."/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="$lookupval"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
