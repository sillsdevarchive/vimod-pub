<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="text()">
            <xsl:variable name="posti" select="replace(.,'\|i','\\em ')"/>
            <xsl:variable name="postr" select="replace($posti,'\|r','\\em* ')"/>
            <xsl:copy>
                  <xsl:value-of select="$postr"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
