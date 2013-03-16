<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8"/>
      <xsl:param name="node2remove"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:template match="*[local-name() = $node2remove]">
            <xsl:apply-templates/>
      </xsl:template>
</xsl:stylesheet>
