<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="f">
            <xsl:variable name="postfq" select="replace(.,'\|i','\\fq ')"/>
            <xsl:variable name="postft" select="replace($postfq,'\|r','\\ft ')"/>
            <xsl:variable name="postftspace" select="replace($postft,'\\ft  ',' \\ft ')"/>
            <xsl:variable name="emptyftfix" select="replace($postftspace,'\\ft $','')"/>
            <xsl:copy>
                  <xsl:value-of select="$emptyftfix"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>