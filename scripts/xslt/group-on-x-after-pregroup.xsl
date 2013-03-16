<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:param name="pregroupnode" />
  <xsl:param name="groupnode" />
  <xsl:include href='inc-copy-anything.xslt' />
  <xsl:template match="*[local-name() = $pregroupnode]">
    <xsl:copy></xsl:copy>
    <xsl:element name="tablegroup">
      <xsl:apply-templates select="*[name() = $groupnode]" mode="table" />
    </xsl:element>
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="*[local-name() = $groupnode]"></xsl:template>
  <xsl:template match="*[local-name() = $groupnode]" mode="table">
    <xsl:copy>
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>