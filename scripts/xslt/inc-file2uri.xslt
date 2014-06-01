<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:choose>
                  <xsl:when test="substring($pathfile,1,2) = '..'">
                        <xsl:value-of select="replace($pathfile,'\\','/')"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
