<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="string[@name = 'app_name']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:value-of select="$app_name"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
