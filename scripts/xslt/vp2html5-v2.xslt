<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:preserve-space elements="*"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes" use-character-maps="xul"/>
      <xsl:param name="sourcetextfile"/>
      <xsl:param name="cssfile"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextfile)"/>
      <xsl:variable name="text1" select="replace(replace(unparsed-text($sourcetexturi),'(\r)',''),'&lt;(\d+)&gt;','&#128;#$1;')"/>
      <xsl:variable name="text2" select="concat('&#10;',replace(replace($text1,'&lt;&lt;','&#8220;'),'&gt;&gt;','&#8221;'))"/>
      <xsl:variable name="text0" select="replace(replace(unparsed-text($sourcetexturi),'(\r)',''),'&lt;(\d+)&gt;','&amp;#$1;')"/>
      <xsl:variable name="text3" select="replace($text2,'\n','')"/>
      <xsl:variable name="punctuation" select="',.?!'"/>
      <xsl:character-map name="xul">
            <xsl:output-character character="&#128;" string='&amp;'/>
      </xsl:character-map>
      <xsl:template match="/">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="en">
                  <xsl:call-template name="head"/>
                  <xsl:element name="body">
                        <xsl:analyze-string select="$text2" regex="\n@">
                              <xsl:matching-substring/>
                              <xsl:non-matching-substring>
                                    <xsl:call-template name="parsediv">
                                          <xsl:with-param name="string" select="."/>
                                    </xsl:call-template>
                              </xsl:non-matching-substring>
                        </xsl:analyze-string>
                  </xsl:element>
            </html>
      </xsl:template>
      <xsl:template name="parsediv">
            <!-- analyze-string template -->
            <xsl:param name="string"/>
            <xsl:variable name="divclass" select="replace(substring-before($string,' = '),' ','_')"/>
            <xsl:variable name="data" select="substring-after($string,' = ')"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:choose>
                  <xsl:when test="string-length(translate($data,'&#13; ','')) = 0">

</xsl:when>
                  <xsl:when test="substring-before($divclass,'_') = 'TABLE'">
                        <xsl:choose>
                              <xsl:when test="$divclass = 'TABLE_HEADING'">
                                    <div class="{$divclass}">
                                          <xsl:call-template name="parsedivstring">
                                                <xsl:with-param name="string" select="$data"/>
                                          </xsl:call-template>
                                    </div>
                              </xsl:when>
                              <xsl:otherwise>
                                    <table class="{$divclass}">
                                          <xsl:call-template name="parsetablelines">
                                                <xsl:with-param name="string" select="$data"/>
                                          </xsl:call-template>
                                    </table>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <div class="{$divclass}">
                              <xsl:choose>
                                    <xsl:when test="matches($data,'&lt;')">
                                          <xsl:call-template name="parsedivstring">
                                                <xsl:with-param name="string" select="$data"/>
                                          </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$data"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </div>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="parsedivstring">
            <!-- analyze-string template -->
            <xsl:param name="string"/>
            <xsl:analyze-string select="$string" regex="&lt;">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:choose>
                              <xsl:when test="matches(.,'&gt;')">
                                    <xsl:call-template name="parsetagndata">
                                          <xsl:with-param name="string" select="."/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="."/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="parsetagndata">
            <xsl:param name="string"/>
            <xsl:analyze-string select="replace($string,'\n','')" regex="(.+)&gt;(.*)" flags="m">
                  <xsl:matching-substring>
                        <xsl:if test="string-length(regex-group(2)) gt 0">
                              <xsl:element name="span">
                                    <xsl:attribute name="class">
                                          <xsl:value-of select="regex-group(1)"/>
                                    </xsl:attribute>
                                    <!-- insert space before if not punctuation -->
                                    <xsl:choose>
                                          <xsl:when test="substring(regex-group(2),1,1) = ',' 
or substring(regex-group(2),1,1) = '.' 
or substring(regex-group(2),1,1) = '?' 
or substring(regex-group(2),1,1) = '!'
or substring(regex-group(2),1,1) = ';'
or substring(regex-group(2),1,1) = ')'
"/>
                                          <xsl:otherwise>
                                                <xsl:text> </xsl:text>
                                          </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of select="normalize-space(regex-group(2))"/>
                              </xsl:element>
                        </xsl:if>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="head">
            <head>
                  <meta charset="utf-8"/>
                  <link rel="stylesheet" href="{$cssfile}" type="text/css"/>
                  <!-- sample css
.lxGroup { margin: 3pt 0 03pt 0;}
.lemma {font-size: 120%;margin: 8pt 0 0 0;}
.ENTRY_BODY {display:inline;}
.ENTRY_BODY:before {content:' '}
.M:after {content:' '}
.MI:after {content:' '}
.B {font-weight:bold} -->
            </head>
      </xsl:template>
      <xsl:template name="parsetablelines">
            <!-- analyze-string template -->
            <xsl:param name="string"/>
            <xsl:analyze-string select="$string" regex="\n">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <tr>
                              <xsl:call-template name="parsetablecells">
                                    <xsl:with-param name="string" select="."/>
                              </xsl:call-template>
                        </tr>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="parsetablecells">
            <!-- analyze-string template -->
            <xsl:param name="string"/>
            <xsl:analyze-string select="$string" regex="\t">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <td>
                              <xsl:choose>
                                    <xsl:when test="matches(.,'&lt;')">
                                          <xsl:if test="string-length(substring-before(.,'&lt;')) gt 0">
                                                <xsl:value-of select="substring-before(.,'&lt;')"/>
                                          </xsl:if>
                                          <xsl:call-template name="parsedivstring">
                                                <xsl:with-param name="string" select="."/>
                                          </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="."/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </td>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
