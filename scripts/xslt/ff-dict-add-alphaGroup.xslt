<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     ff-dict-add-alphaGroup.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="/*">
            <xsl:copy>
                  <xsl:for-each-group select="lxGroup" group-by="lower-case(substring(replace(lx,'^\-',''),1,1))">
                        <xsl:element name="alphaGroup">
                              <xsl:attribute name="alpha">
                                    <xsl:value-of select="substring(lower-case(replace(current-group()[1]/lx,'^\-','')),1,1)"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="current-group()"/>
                        </xsl:element>
                  </xsl:for-each-group>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
