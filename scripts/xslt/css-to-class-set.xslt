<?xml version="1.0"?>
<!-- 
Written to ingest css files and parse them into attribute-sets
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt">
      <xsl:param name="sourcetexturi"/>
      <xsl:param name="commonset" select="'normal'"/>
      <!-- ingest css and remove  cr nl and any double spaces -->
      <xsl:variable name="string1" select="replace(unparsed-text($sourcetexturi),'\s\s+','')"/>
      <!-- remove comments -->
      <xsl:variable name="string2" select="replace($string1,'/\*[^\*]*\*/','')"/>
      <!-- <xsl:variable name="string3" select="replace(unparsed-text($sourcetexturi),'\n','')" /> -->
      <!-- change output type to xml when completed -->
      <xsl:output method="xml" indent="yes" version="1.0" encoding="utf-8"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:template match="/">
            <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                  <!-- break into selector plus data sets -->
                  <xsl:analyze-string select="$string2" regex="\s*\}}\s*">
                        <!-- split on } character -->
                        <xsl:non-matching-substring>
                              <xsl:analyze-string select="." regex="([^\s]+)\s*\{{\s*([^\s]+)">
                                    <!-- split on { character -->
                                    <xsl:matching-substring>
                                          <xsl:call-template name="selector">
                                                <xsl:with-param name="selector" select="normalize-space(regex-group(1))"/>
                                                <xsl:with-param name="data" select="normalize-space(regex-group(2))"/>
                                          </xsl:call-template>
                                    </xsl:matching-substring>
                              </xsl:analyze-string>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template name="selector">
            <xsl:param name="selector"/>
            <xsl:param name="selector2" select="replace($selector,'(span|td|p)\.','')"/>
            <xsl:param name="data"/>
            <gen:attribute-set name="{$selector2}" use-attribute-sets="{$commonset}">
                  <xsl:analyze-string select="$data" regex="\s*;\s*">
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <gen:attribute name="{substring-before(.,':')}">
                                    <xsl:value-of select="substring-after(.,':')"/>
                              </gen:attribute>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </gen:attribute-set>
      </xsl:template>
</xsl:stylesheet>
