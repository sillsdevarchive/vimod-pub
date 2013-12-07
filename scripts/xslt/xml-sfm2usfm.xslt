<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:strip-space elements="*"/>
      <xsl:output method="text"/>
      <xsl:template match="sfm">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*">
            <xsl:value-of select="concat('&#13;&#10;\',name(),' ')"/>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="caller">
            <xsl:variable name="ref" select="substring-before(.,' ')"/>
            <xsl:variable name="text" select="substring-after(.,' ')"/>
            <xsl:value-of select="concat('\f + \fr ',$ref,' \ft ',$text,'\f*')"/>
      </xsl:template>
</xsl:stylesheet>
