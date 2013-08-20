<?xml version="1.0" encoding="utf-8"
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
      </xsl:function>
</xsl:stylesheet>