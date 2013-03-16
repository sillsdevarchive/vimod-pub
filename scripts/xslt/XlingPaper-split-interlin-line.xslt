<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"  encoding="utf-8" />
<!-- <xsl:include href='inc-copy-anything.xslt' /> -->
<xsl:param name="splitabout"/>
<xsl:param name="splitlength"/><!-- Split length will be longer for some laguage with long words and or many affixes -->
 


 <xsl:template match="//interlinear">
<xsl:value-of select="parent::example/@num" />

  <xsl:apply-templates />
<xsl:text>
</xsl:text>
 </xsl:template>
  <xsl:template match="lineGroup">
<xsl:text>&#9;</xsl:text><xsl:value-of select="count(line)" />
<xsl:for-each select="line">
 <xsl:text>&#9;</xsl:text> <xsl:value-of select="string-length(.)" />
</xsl:for-each>


 </xsl:template>
 <xsl:template match="*">
  <xsl:apply-templates>
   
  </xsl:apply-templates>
 </xsl:template>
 <xsl:template match="text()">
  
 </xsl:template>
</xsl:stylesheet>

