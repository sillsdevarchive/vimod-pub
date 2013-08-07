<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:param name="filetypeextensions" select="'.pdf .zip'"/>
      <xsl:param name="omitifcontains" select="'donotcopy'"/>
      <xsl:strip-space elements="*"/>
      <xsl:variable name="filetypes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="lower-case($filetypeextensions)"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="files4reap">
            <xsl:if test="lower-case(ext) = $filetypes/element">
                  <xsl:if test="not(matches(fileext,$omitifcontains))">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy></xsl:if>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
