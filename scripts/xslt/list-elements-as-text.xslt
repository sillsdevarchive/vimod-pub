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
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf-8" />
      <xsl:template match="/">
            <xsl:for-each-group select="//*" group-by="name()">
                  <xsl:sort select="name()"/>
                  <xsl:value-of select="name()"/>
                  <xsl:text> </xsl:text>
            </xsl:for-each-group>
      </xsl:template>
</xsl:stylesheet>
