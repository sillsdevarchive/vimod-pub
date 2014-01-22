<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="usx-chap-grp2simplehtmlscr3.xslt"/>
      <xsl:template match="text()">
            <xsl:variable name="word" select="tokenize(.,' ')"/>
            <xsl:for-each select="$word">
                  <xsl:if test="string-length(.) gt 0">
                        <span class="word">
                              <xsl:value-of select="."/>
                              <xsl:text> </xsl:text>
                              <br/>
                              <span class="lower">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                              </span>
                        </span>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
