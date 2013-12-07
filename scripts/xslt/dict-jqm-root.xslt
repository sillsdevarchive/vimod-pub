<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="/">
            <xsl:call-template name="index">
                  <xsl:with-param name="langname" select="$langname"/>
            </xsl:call-template>
            <xsl:call-template name="Home">
                  <xsl:with-param name="langname" select="$langname"/>
            </xsl:call-template>
            <xsl:call-template name="quicklist">
                  <xsl:with-param name="data" select="lxGroup"/>
            </xsl:call-template>
            <xsl:apply-templates/>
      </xsl:template>
</xsl:stylesheet>
