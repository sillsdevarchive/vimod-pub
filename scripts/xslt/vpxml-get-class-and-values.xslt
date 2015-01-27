<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vpxml-get-class-and-values.xslt
    # Purpose:	make two files to create a map to USFM from para and tag
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014-03 -03
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8" name="text"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="tagtextfile"/>
      <xsl:variable name="tagtexturi" select="f:file2uri($tagtextfile)"/>
      <xsl:template match="/*">
            <xsl:for-each-group select="//@class" group-by=".">
                  <xsl:sort select="."/>
                  <xsl:value-of select="concat('&#9;',current-group()[1],'&#10;')"/>
            </xsl:for-each-group>
            <xsl:result-document href="{$tagtexturi}" format="text">
                  <xsl:for-each-group select="//@value" group-by=".">
                        <xsl:sort select="."/>
                        <xsl:value-of select="concat('&#9;',current-group()[1],'&#9;&#10;')"/>
                  </xsl:for-each-group>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="node()"/>
</xsl:stylesheet>
