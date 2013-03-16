<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns" exclude-result-prefixes="silp">
<!-- Generic XHTML template
see newer inc-generic-html-with-match-func.xslt

-->
      <xsl:param name="precontext"/>
      <xsl:param name="postcontext"/>
      <xsl:param name="locref"/>
      <xsl:template match="*">
            <xsl:variable name="this-name" select="local-name()"/>
            <xsl:element name="{silp:match(local-name())}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                        <xsl:if test="$locref = 'yes'">
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="name()"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="count(preceding-sibling::*[name() = $this-name]) + 1"/>
                        </xsl:if>
                  </xsl:attribute>
                  <xsl:if test="$precontext = 'yes'">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="local-name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(preceding-sibling::*[1])"/>
                  </xsl:if>
                  <xsl:if test="$postcontext = 'yes'">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="local-name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(following-sibling::*[1])"/>
                  </xsl:if>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
