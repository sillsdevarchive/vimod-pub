<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" use-character-maps="silp"/>
      <xsl:include href='inc-char-map-silp.xslt'/>
      <xsl:param name="field2check"/>
      <xsl:param name="reference" select="'lx'"/>
      <xsl:variable name="headword">
            <xsl:apply-templates select="//*[name() = $reference]"/>
      </xsl:variable>
      <xsl:template match="/">
            <xsl:apply-templates select="//*[name() = $field2check]"/>
      </xsl:template>
      <xsl:template match="//*[name() = $field2check]">
            <xsl:choose>
                  <xsl:when test=". = $headword/element"/>
                  <xsl:when test="normalize-space(replace(replace(.,' \d$',''),'\([^\)]+\)','')) = $headword/element"/>
                  <xsl:when test="normalize-space(replace(replace(.,' \d ',''),'\([^\)]+\)','')) = $headword/element"/>
                  <xsl:otherwise>
                        <xsl:value-of select="preceding-sibling::*[name() = $reference][1]"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>&#13;
</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*"/>
      <xsl:template match="//*[name() = $reference]">
            <element>
                  <xsl:value-of select="."/>
            </element>
      </xsl:template>
</xsl:stylesheet>
