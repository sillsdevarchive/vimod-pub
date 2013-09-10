<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:param name="path"/>
      <xsl:param name="files"/>
      <xsl:variable name="collection" select="collection(concat($path,'?select=',$files))"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="/">
            <data>
                  <xsl:apply-templates select="$collection/*"/>
            </data>
      </xsl:template>
</xsl:stylesheet>
