<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:param name="newname"/>
      <xsl:template match="string[@name = 'app_name']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:value-of select="$newname"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
