<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="h">
            <xsl:variable name="title1" select="following-sibling::*[1][name() = 'mt1' or name() = 'mt2']"/>
            <xsl:variable name="title2" select="following-sibling::*[2][name() = 'mt1' or name() = 'mt2']"/>
            <xsl:variable name="title3" select="following-sibling::*[3][name() = 'mt1' or name() = 'mt2']"/>
            <xsl:copy>
                  <xsl:value-of select="."/>
            </xsl:copy>
            <xsl:element name="toc1">
                  <xsl:value-of select="normalize-space(concat($title1,' ',$title2,' ',$title3))"/>
            </xsl:element>
            <xsl:element name="toc2">
                  <xsl:value-of select="."/>
            </xsl:element>
            <xsl:element name="toc3">
                  <xsl:choose>
                        <xsl:when test="substring(.,2,1) = ' '">
                              <xsl:value-of select="substring(.,1,1)"/>
                              <xsl:value-of select="substring(.,3,2)"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="substring(.,1,3)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
