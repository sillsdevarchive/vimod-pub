<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output method="text" omit-xml-declaration="yes" use-character-maps="silp"/>
      <xsl:param name="curlang"/>
      <xsl:include href='inc-char-map-silp.xslt'/>
      <xsl:template match="/data">
            <xsl:text>&#10;&#10;var </xsl:text>
            <xsl:value-of select="$curlang"/>
            <xsl:text>_alpha = </xsl:text>
            <xsl:apply-templates select="alphagroup|alpha"/>
      </xsl:template>
      <xsl:template match="alphagroup|alpha">
            <xsl:text>'&lt;a target="index" href="../index/</xsl:text>
            <xsl:value-of select="$curlang"/>
            <xsl:number value="position()" format="01"/>
            <xsl:text>.html" &gt;</xsl:text>
            <xsl:value-of select="@*"/>
            <xsl:choose>
                  <xsl:when test="position() eq last()">
                        <xsl:text>&lt;/a&gt;' &#59;</xsl:text>
                  </xsl:when>
                  <xsl:when test="@key eq 'n'">
                        <xsl:text>&lt;/a&gt; ' +</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&lt;/a&gt;&amp;nbsp&#59;' +</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:text>
</xsl:text>
      </xsl:template>
</xsl:stylesheet>
