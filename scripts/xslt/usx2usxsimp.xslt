<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:template match="@*">
            <xsl:copy/>
      </xsl:template>
      <xsl:template match="/usx">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="*">
            <xsl:variable name="style">
                  <xsl:choose>
                        <xsl:when test="string-length(@style) = 0">
                              <xsl:value-of select="local-name()"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="@style"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:element name="{$style}">
                  <xsl:attribute name="usx">
                        <xsl:value-of select="local-name()"/>
                  </xsl:attribute>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="para[@style = 'restore']"/>
      <!--  
      <xsl:template match="chapter">
            <c>
                  <xsl:apply-templates select="@*|node()"/>
            </c>
      </xsl:template> -->
      <xsl:template match="book">
            <xsl:copy>
                  <xsl:apply-templates select="@style" mode="book"/>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="@style">
      </xsl:template>
      <xsl:template match="@style" mode="book">
            <xsl:copy/>
      </xsl:template>
</xsl:stylesheet>
