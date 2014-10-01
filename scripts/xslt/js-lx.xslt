<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output method="text" omit-xml-declaration="yes" encoding="utf-8" use-character-maps="silp"/>
      <!-- 2012-10-08 IKM added
		1. Paramatization to sources
		2. Added character-maps to change sorting characters to digraphs or display form. This is so that searches will find the desired character.
		3. Finished the work to parametise the fied selection. It works now.
-->
      <xsl:param name="headwordfields"/>
      <xsl:variable name="getfields">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$headwordfields"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-char-map-silp.xslt'/>
      <xsl:template match="/*">
            <xsl:text>var lx = new Array();
lx[0] = new Array(</xsl:text>
            <xsl:apply-templates select="lxGroup"/>
            <xsl:text>)&#59;</xsl:text>
      </xsl:template>
      <xsl:template match="lxGroup">
            <xsl:text>"</xsl:text>
            <xsl:apply-templates select="*[local-name() = $getfields/element/text()]"/>
            <xsl:choose>
                  <xsl:when test="position() eq last()">
                        <xsl:text>"</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>",&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*">
            <xsl:if test="name() ne 'lx'">
                  <xsl:text> &#8226; </xsl:text>
            </xsl:if>
            <xsl:value-of select="translate(.,'&#34;=','')"/>
      </xsl:template>
</xsl:stylesheet>
