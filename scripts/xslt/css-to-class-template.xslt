<?xml version="1.0"?>
<!-- 
Written to ingest css files and parse them into attribute-sets
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="cssfile"/>
      <xsl:param name="illegalattribnames" select="'-moz-column-count -webkit-column-count'"/>
      <xsl:param name="commonset" select="'normal'"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($cssfile)"/>
      <xsl:variable name="badnames" select="tokenize(illegalattribnames,'\s+')"/>
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
                  <gen:template name="class-template">
                        <gen:param name="class"/>
                        <gen:choose>
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
                        </gen:choose>
                  </gen:template>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template name="selector">
            <xsl:param name="selector"/>
            <xsl:param name="selector2" select="replace($selector,'[a-z]*\.','')"/>
            <xsl:param name="data"/>
            <gen:when test="$class = '{$selector2}'">
                  <xsl:call-template name="attributes">
                        <xsl:with-param name="data" select="$data"/>
                  </xsl:call-template>
            </gen:when>
      </xsl:template>
      <xsl:template name="attributes">
            <xsl:param name="data"/>
            <xsl:analyze-string select="$data" regex="\s*;\s*">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:variable name="name" select="normalize-space(substring-before(.,':'))"/>
                        <xsl:choose>
                              <xsl:when test="$name = '-webkit-column-count'"/>
                              <xsl:when test="$name = '-moz-column-count'"/>
                              <xsl:otherwise>
                                    <gen:attribute name="{lower-case($name)}">
                                          <xsl:value-of select="normalize-space(substring-after(.,':'))"/>
                                    </gen:attribute>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
