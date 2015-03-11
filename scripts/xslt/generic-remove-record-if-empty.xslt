<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         generic-remove-record-if-empty.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:strip-space elements="*"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:param name="recordelement"/>
      <xsl:param name="testfield"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[local-name() = $recordelement]">
            <xsl:variable name="string" select="*[local-name() = $testfield]"/>
            <xsl:choose>
                  <xsl:when test="string-length($string) gt 0">
                        <xsl:copy-of select="."/>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
