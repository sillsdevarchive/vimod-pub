<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="set[@name]">
            <xsl:element name="{@name}">
                  <xsl:apply-templates select="*"/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
