<?xml version="1.0"?>
<!-- 
Written to ingest css files and parse them into attribute-sets
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="cssfile"/>
      <xsl:param name="commonset" select="'normal'"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($cssfile)"/>
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
                              <xsl:analyze-string select="." regex="(.+)\s*\{{\s*(.+)">
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
            <xsl:param name="selector2" select="replace($selector,'[a-z]*\.','')"/>
            <xsl:param name="data"/>
            <xsl:choose>
                  <xsl:when test="lower-case(normalize-space($selector)) = 'body'">
                        <gen:attribute-set name="{$commonset}">
                              <xsl:call-template name="attributes">
                                    <xsl:with-param name="data" select="$data"/>
                              </xsl:call-template>
                        </gen:attribute-set>
                  </xsl:when>
                  <xsl:otherwise>
                        <gen:attribute-set name="{$selector2}" use-attribute-sets="{$commonset}">
                              <xsl:call-template name="attributes">
                                    <xsl:with-param name="data" select="$data"/>
                              </xsl:call-template>
                        </gen:attribute-set>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="attributes">
            <xsl:param name="data"/>
            <xsl:analyze-string select="$data" regex="\s*;\s*">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:variable name="name">
                              <xsl:choose>
                                    <xsl:when test="substring(normalize-space(substring-before(.,':')),1,1) = '-'">
                                          <xsl:value-of select="substring(normalize-space(substring-before(.,':')),2)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="normalize-space(substring-before(.,':'))"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>
                        <gen:attribute name="{$name}">
                              <xsl:value-of select="normalize-space(substring-after(.,':'))"/>
                        </gen:attribute>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
