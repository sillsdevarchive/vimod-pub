<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
 <xsl:template match="/*">
  <xsl:copy>
   <xsl:apply-templates select="v"/>
  </xsl:copy>
 </xsl:template>
 <xsl:template match="v">
<xsl:copy>
  
 <xsl:apply-templates select="@*"/>
  <xsl:value-of select="normalize-space(following-sibling::text()[1])" />
  
</xsl:copy> 
</xsl:template>
<xsl:template match="text()">
 
</xsl:template>
<xsl:template match="@*">
  <xsl:copy>
   
  </xsl:copy>
</xsl:template>
</xsl:stylesheet>