<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cite="http://citations.ex.ac.uk/ns/" version="2.0">
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
<!-- Finds starting and ending text and removes it. --> 
      <xsl:param name="node"/>
      <xsl:param name="before"/>
      <xsl:param name="after"/>
      <xsl:variable name="replacenodes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$node"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[name() = $node]/text()">
            <xsl:analyze-string select="." regex="{$before}(.+){$after}">
                  <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                  </xsl:matching-substring>
                  <xsl:non-matching-substring>
                        <xsl:sequence select="."/>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
