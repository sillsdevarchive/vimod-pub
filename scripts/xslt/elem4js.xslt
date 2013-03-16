<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output method="text" omit-xml-declaration="yes" encoding="utf-8" use-character-maps="silp"/>
      <!-- 2012-10-08 IKM added
		1. Paramatization to sources
		2. Added character-maps to change sorting characters to digraphs or display form. This is so that searches will find the desired character.
		3. Finished the work to parametise the fied selection. It works now.
-->
      <xsl:param name="primaryfield"/>
      <xsl:param name="secondaryfields"/>
      <xsl:param name="backupfield"/>
      <xsl:param name="arrayno"/>
      <xsl:variable name="getfields">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$secondaryfields"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-char-map-silp.xslt'/>
      <xsl:template match="/*">
            <xsl:if test="$arrayno = '0'">
                  <xsl:text>var dictionary = new Array();
</xsl:text>
            </xsl:if>
            <xsl:text>dictionary[</xsl:text>
            <xsl:value-of select="$arrayno"/>
            <xsl:text>] = new Array(</xsl:text>
            <xsl:apply-templates select="lxGroup"/>
            <xsl:text>)&#59;</xsl:text>
      </xsl:template>
      <xsl:template match="lxGroup">
            <xsl:variable name="primary" select="child::*[name() = $primaryfield][1]"/>
            <xsl:text>"</xsl:text>
            <xsl:choose>
                  <xsl:when test="string-length($primary) = 0">
                        <xsl:apply-templates select="*[local-name() = $backupfield]"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="*[local-name() = $primaryfield]"/>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="*[local-name() = $getfields/element/text()]"/>
            <xsl:choose>
                  <xsl:when test="position() eq last()">
                        <xsl:text>"</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>",
</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*">
            <xsl:value-of select="replace(.,'\|[bri]','')"/>
            <xsl:text>; </xsl:text>
      </xsl:template>
</xsl:stylesheet>
