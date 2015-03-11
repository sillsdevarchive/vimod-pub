<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vimod-compare-project-xslt-to-standard.xslt
    # Purpose:    compare a project.xslt to a known standard.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="file2evaluate"/>
      <xsl:variable name="newxslt" select="doc(f:file2uri($file2evaluate))"/>
      <xsl:variable name="newvar" select="$newxslt//*:param/@name"/>
      <xsl:variable name="benchvar" select="//*:param/@name"/>
      <xsl:template match="/">
            <xsl:for-each select="$benchvar">
                  <xsl:variable name="seq" select="position()"/>
                  <xsl:choose>
                        <xsl:when test=". = $newvar[$seq]">
                              <xsl:value-of select="concat('ok&#9;',.,'&#10;')"/>
                        </xsl:when>
                        <xsl:when test=". = $newvar">
                              <xsl:value-of select="concat('order&#9;',.,'&#10;')"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('NONE&#9;',.,'&#10;')"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
