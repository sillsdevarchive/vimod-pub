<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	fo-remove-margin-right-auto-guideword-dict.xslt
    # Purpose:		Need this fix as have not gotten css right to get csstoxslfo to do it properly. Or FOP does not use the marker as other FO processors do.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay@sil.org>
    # Created:      	2015-08-10
    # Copyright:    	(c) 2015 SIL International
    # Licence:      	<LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[@margin-right = 'auto']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:attribute name="margin-right">0pt</xsl:attribute>
                  <xsl:apply-templates select="node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="fo:marker">
            <xsl:copy>
                  <xsl:attribute name="marker-class-name">guideword</xsl:attribute>
                  <xsl:value-of select="following-sibling::text()[1]"/>
            </xsl:copy>
      </xsl:template>
      <!-- /fo:root/fo:page-sequence/fo:flow/fo:block/fo:block[2]/fo:block/fo:inline/fo:inline -->
      <!-- dict /fo:root/fo:page-sequence/fo:flow/fo:block/fo:block[2]/fo:block/fo:inline -->
</xsl:stylesheet>
