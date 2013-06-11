<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <!-- Part of the SILP Dictionary Creator
Used to group by $groupnode and head node found within $parentnode
Written by Ian McQuay 
Created 2013-05-23

Initial putpose to group USX files by chapters and the head area.
1. First step in creating BrowserBible HTML

-->
      <xsl:output method="xml" indent="yes"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:template match="p|q|q1|q2">
            <xsl:copy>
                  <xsl:apply-templates mode="wrap"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="text()" mode="wrap">
            <xsl:if test="replace(.,' ','') != '&#10;'">
                  <xsl:element name="text">
                        <xsl:attribute name="osis">
                              <xsl:value-of select="//book/@code"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="ancestor::cGroup/c/@number"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="preceding::v[1]/@number"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="@*|*" mode="wrap">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
