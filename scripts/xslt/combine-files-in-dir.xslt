<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:strip-space elements="*"/>
      <xsl:param name="path2files"/>
      <xsl:param name="filespecs"/>
      <xsl:param name="level"/>
      <xsl:variable name="collection" select="collection(concat(f:file2uri($path2files),'?select=',$filespecs))"/>
      <xsl:template match="/">
            <data>
                  <xsl:choose>
                        <xsl:when test="$level = 1">
                              <xsl:apply-templates select="$collection/*"/>
                        </xsl:when>
                        <xsl:when test="$level = 2">
                              <xsl:apply-templates select="$collection/*/*"/>
                        </xsl:when>
                        <xsl:when test="$level = 3">
                              <xsl:apply-templates select="$collection/*/*/*"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:apply-templates select="$collection/*"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </data>
      </xsl:template>
</xsl:stylesheet>
