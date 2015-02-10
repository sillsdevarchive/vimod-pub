<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:choose>
                  <xsl:when test="substring($pathfile,2,2) = ':\'">
                        <!-- matches drive:\path fromat -->
                        <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- assumes that the path is relative -->
                        <xsl:value-of select="replace($pathfile,'\\','/')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:file2linetokens">
            <xsl:param name="pathfile"/>
            <xsl:variable name="pathfileuri" select="f:file2uri($pathfile)"/>
            <xsl:variable name="text" select="unparsed-text($pathfileuri)"/>
            <xsl:sequence select="$text"/>
      </xsl:function>
</xsl:stylesheet>
