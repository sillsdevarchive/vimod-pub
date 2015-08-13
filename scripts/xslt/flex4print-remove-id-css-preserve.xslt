<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         flex4print-remove-id-css-preserve.xslt
    # Purpose:	remove unwanted id that have duplicates, change css file name and remover XML preserve except before sense numbers
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="no" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>
      <xsl:param name="cssmod"/>
      <xsl:template match="@id"/>
      <xsl:template match="*:link[@type]">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:attribute name="href">
                        <xsl:value-of select="$cssmod"/>
                  </xsl:attribute>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="*:a">
            <xsl:apply-templates select="node()"/>
      </xsl:template>
      <xsl:template match="*[@class = 'Sense-Reference-Number']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:apply-templates select="@xml:space" mode="sensenumber"/>
                  <xsl:value-of disable-output-escaping="yes" select="replace(.,' ','&#160;')"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="@xml:space"/>
      <xsl:template match="@xml:space" mode="sensenumber">
            <xsl:copy>
                  <xsl:value-of select="."/>
            </xsl:copy>
      </xsl:template>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[@class = 'senses']">
            <xsl:choose>
                  <xsl:when test="child::node()">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
