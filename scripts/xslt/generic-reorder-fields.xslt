<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output indent="yes" method="xml" version="1.0" encoding="utf-8" />
 <xsl:param name="group"/>
 <xsl:param name="field1"/>
 <xsl:param name="field2"/>
 <xsl:param name="field3"/>
 <xsl:param name="field4"/>
 <xsl:param name="field5"/>
 <xsl:param name="field6"/>
 <xsl:include href='inc-copy-anything.xslt' />
 <xsl:template match="*[local-name() = $group]">
 <xsl:copy>
    <xsl:apply-templates select="*[local-name() = $field1]"/>
  <xsl:apply-templates select="*[local-name() = $field2]"/>
  <xsl:apply-templates select="*[local-name() = $field3]"/>
  <xsl:apply-templates select="*[local-name() = $field4]"/>
  <xsl:apply-templates select="*[local-name() = $field5]"/>
  <xsl:apply-templates select="*[local-name() = $field6]"/>

 </xsl:copy>
   

 </xsl:template>
</xsl:stylesheet>
