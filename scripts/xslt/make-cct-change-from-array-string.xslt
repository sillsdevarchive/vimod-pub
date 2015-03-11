<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         make-cct-change-from-array-string.xslt
    # Purpose:		Make a cct from cctchanges variable supplied in project.xslt
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="project.xslt"/>
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:variable name="set" select="tokenize($cctcharchanges,'\s+')"/>
      <xsl:variable name="dquote">
            <xsl:text>"</xsl:text>
      </xsl:variable>
      <xsl:variable name="tab">
            <xsl:text>&#9;</xsl:text>
      </xsl:variable>
      <xsl:template match="/">
            <xsl:value-of select="concat('c ',$iso,' changes. Auto created. Do not adjust here. Make changes in the project.tasks','&#13;&#10;')"/>
            <xsl:for-each select="$set">
                  <xsl:variable name="pair" select="tokenize(.,'=')"/>
                  <xsl:if test="$pair[1] ne ''">
                        <xsl:value-of select="concat($dquote,$pair[1],$dquote,$tab,'&gt;',$tab,$dquote,$pair[2],$dquote,'&#13;&#10;')"/>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
