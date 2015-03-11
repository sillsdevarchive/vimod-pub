<?xml version="1.0" encoding="utf-8" standalone="no"?>
    <!--
    #############################################################
    # Name:         generic-find-replace-in-target-nodes.xslt
    # Purpose:		Target specific elements to do a find and replace in.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Subpart:		inc-more
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015-02-14
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
      <xsl:param name="replaceinnodes_list"/>
      <xsl:variable name="replaceinnodes" select="tokenize($replaceinnodes_list,'\s+')"/>
      <xsl:include href="inc-find-replace.xslt"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[local-name() = $replaceinnodes]">
            <xsl:copy>
                  <xsl:value-of select="f:replace(.)"/>
            </xsl:copy >
      </xsl:template>
</xsl:stylesheet>
