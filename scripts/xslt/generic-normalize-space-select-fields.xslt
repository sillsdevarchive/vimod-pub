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
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:param name="field_list"/>
      <xsl:variable name="field" select="tokenize($field_list,'\s+')"/>
      <xsl:template match="*[local-name() = $field]">
            <xsl:copy>
                  <xsl:value-of select="normalize-space(.)"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
