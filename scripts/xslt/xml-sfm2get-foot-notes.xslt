<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="caller">
            <xsl:variable name="callerno" select="count(preceding::caller) + 1"/>
            <xsl:variable name="note" select="//f[$callerno]"/>
            <caller>
                  <xsl:value-of select="$note"/>
            </caller>
      </xsl:template>
      <xsl:template match="f"/>
</xsl:stylesheet>
