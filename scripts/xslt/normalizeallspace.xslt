<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xml" indent="yes"/>
      <xsl:template match="/*|tb|title|trow|td">
            <xsl:copy>
                  <xsl:apply-templates/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="*">
            <xsl:copy>
                  <xsl:value-of select="normalize-space(.)"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
