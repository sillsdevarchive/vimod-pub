<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:param name="find"/>
      <xsl:param name="replace"/>
      <xsl:template match="text()">
            <xsl:value-of select="replace(text(),$find,$replace)"/>
      </xsl:template>
</xsl:stylesheet>
