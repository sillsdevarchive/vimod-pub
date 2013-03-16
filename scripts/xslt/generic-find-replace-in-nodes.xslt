<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cite="http://fake.org.au/ns/">
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
      <xsl:param name="replacenodeslist"/>
      <xsl:variable name="replacenodes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$replacenodeslist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href="inc-find-replace.xslt"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[local-name() = $replacenodes/element/text()]">
            <xsl:copy>
                  <xsl:value-of select="cite:replace(.)"/>
            </xsl:copy >
      </xsl:template>
</xsl:stylesheet>
