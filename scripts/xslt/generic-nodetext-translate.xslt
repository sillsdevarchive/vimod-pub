<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cite="http://citations.ex.ac.uk/ns/" version="2.0">
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
       <xsl:param name="node" />
      <xsl:param name="match" />
      <xsl:param name="replace" />
      <xsl:variable name="replacenodes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$node"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[name() = $replacenodes/element/text()]/text()">
             <xsl:value-of select="translate(., $match, $replace)" />
      </xsl:template>
</xsl:stylesheet>


