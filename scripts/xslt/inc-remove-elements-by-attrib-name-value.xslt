<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         inc-remove-elements-by-attrib-name-value.xslt
    # Purpose:		include strip markup with attributes name and values, keep content
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:param name="attrib-name"/>
      <xsl:param name="attrib-value_list"/>
      <xsl:variable name="attrib-value" select="tokenize($attrib-value_list,' ')"/>
      <xsl:template match="*[name(@*) = $attrib-name][@* = $attrib-value]">
            <xsl:apply-templates/>
      </xsl:template>
</xsl:stylesheet>
