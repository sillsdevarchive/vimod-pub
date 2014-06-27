<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:template match="/">
<xsl:variable name="entry" select="count(//*[@class = 'entry'])"/>
            <xsl:text>main and minor entries: </xsl:text>
            <xsl:value-of select="count(//*[@class = 'minorentry']) + $entry"/>
            <xsl:text>&#13;&#10;Major entries: </xsl:text>
            <xsl:value-of select="$entry"/>
      </xsl:template>
</xsl:stylesheet>
