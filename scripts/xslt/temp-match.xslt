<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns"
                version="2.0">
   <xsl:function name="silp:match">
      <xsl:param name="test"/>
      <xsl:choose>
         <xsl:when test="$test = 'c'">
            <xsl:text>h2</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'c2'">
            <xsl:text>h5</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'om'">
            <xsl:text>h3</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'os'">
            <xsl:text>h4</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'o'">
            <xsl:text>td</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'e'">
            <xsl:text>td</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 't'">
            <xsl:text>td</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'k'">
            <xsl:text>td</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'oGroup'">
            <xsl:text>tr</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'tbGroup'">
            <xsl:text>table</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'tb'">
            <xsl:text>thead</xsl:text>
         </xsl:when>
         <xsl:when test="$test = 'charbold'">
            <xsl:text>span</xsl:text>
         </xsl:when>
         <xsl:otherwise>div</xsl:otherwise>
      </xsl:choose>
   </xsl:function>
</xsl:stylesheet>