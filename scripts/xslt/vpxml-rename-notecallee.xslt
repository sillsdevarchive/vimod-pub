<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:strip-space elements="*"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="vp2xml-tags.xslt"/>
      <xsl:template match="*[@value = $callee-features][ancestor::note]">
            <callee value="{.}"/>
      </xsl:template>
      <xsl:template match="*[matches(@value,$footnoteref)][ancestor::note]">
            <fr>
                  <xsl:value-of select="."/>
            </fr>
      </xsl:template>
      <!--
      <xsl:template match="*[string-length(@value)=][ancestor::note][string-length(.)=1]">
            <callee value="{.}"/>
      </xsl:template> -->
</xsl:stylesheet>
