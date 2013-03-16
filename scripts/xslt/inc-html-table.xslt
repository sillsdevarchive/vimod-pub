<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns">
      <xsl:param name="table"/>
      <xsl:template match="*[local-name() = $table]">
            <xsl:element name="{silp:match(name())}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                        <xsl:if test="$locref = 'yes'">
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="name()"/>
                              <xsl:text>_</xsl:text>
                              <xsl:value-of select="count(preceding-sibling::*[name()])"/>
                        </xsl:if>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="*[silp:match(name()) = 'td']">
            <xsl:variable name="this-name" select="local-name()"/>
            <xsl:element name="{silp:match(name())}">
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
                        <xsl:value-of select="name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(preceding-sibling::*[1])"/>
                  </xsl:if>
                  <xsl:if test="$postcontext = 'yes'">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(following-sibling::*[1])"/>
                  </xsl:if>
                  <div class="nobreak">
                        <xsl:apply-templates/>
                  </div>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
