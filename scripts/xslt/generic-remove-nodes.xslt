<?xml version="1.0" encoding="UTF-8"?>
<!-- Part of the SILP Dictionary Creator
	Delete nodes
	Itended to remove multiple elements supplied in the $spacedlist parameter in the format
	Written by Ian McQuay 
	Created 2012-06-14
	Modified: 2012-08-21
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:import href='inc-copy-anything.xslt'/>
      <!-- inc-copy-anything.xslt - Match any node or element -->
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="database"/>
      <xsl:param name="removenodelist"/>
      <xsl:variable name="list">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$removenodelist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:template match="*[local-name() = $list/*/text()]"/>
</xsl:stylesheet>
