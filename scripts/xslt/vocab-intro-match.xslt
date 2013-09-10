<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions"
                version="2.0">
   <xsl:function name="f:match">
      <xsl:param name="test"/>
      <xsl:choose>
         <xsl:when test="$test = 'b'">
            <xsl:text>h2</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'p'">
            <xsl:text>p</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'c'">
            <xsl:text>p</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 's'">
            <xsl:text>h3</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'charbold'">
            <xsl:text>span</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'charitalic'">
            <xsl:text>span</xsl:text>
         </xsl:when>
         <xsl:otherwise>div</xsl:otherwise>
      </xsl:choose>
   </xsl:function>
</xsl:stylesheet>