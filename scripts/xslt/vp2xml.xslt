<?xml version="1.0"?>
<xsl:stylesheet version="2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes" use-character-maps="cmap"/>
      <xsl:param name="sourcetextfile"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextfile)"/>
      <xsl:variable name="text1" select="replace(replace(unparsed-text($sourcetexturi),'(\r)',''),'&lt;(\d+)&gt;','&amp;#$1;')"/>
      <xsl:variable name="text2" select="concat('&#10;',replace(replace($text1,'&lt;&lt;','&#8220;'),'&gt;&gt;','&#8221;'))"/>
      <xsl:template match="/">
            <xsl:element name="database">
                  <xsl:analyze-string select="$text2" regex="\n@">
                        <!-- split on backslash, add a space to the end of every line so every empty sfm can be found -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:variable name="chaptype" select="substring-before(.,' = ')"/>
                              <xsl:variable name="initialstring" select="replace(substring-after(.,' ='),'\n','')"/>
                              <xsl:variable name="prestring" select="substring-before($initialstring,'&lt;')"/>
                              <xsl:variable name="poststring" select="substring-after($initialstring,'&lt;')"/>
                              <xsl:element name="para">
                                    <xsl:attribute name="class">
                                          <xsl:value-of select="$chaptype"/>
                                    </xsl:attribute>
                                    <xsl:choose>
                                          <xsl:when test="string-length($prestring) gt 0">
                                                <xsl:value-of select="normalize-space($prestring)"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="normalize-space($initialstring)"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                          <xsl:when test="substring-before($poststring,'&gt;') = '\d+'">
                                                <xsl:variable name="numb" select="substring-before($poststring,'&gt;')"/>
                                                <xsl:value-of select="concat('&amp;',$numb,';')" disable-output-escaping="no"/>
                                                <xsl:call-template name="parsestring">
                                                      <xsl:with-param name="string" select="$poststring"/>
                                                </xsl:call-template>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:call-template name="parsestring2">
                                                      <xsl:with-param name="string" select="$poststring"/>
                                                </xsl:call-template>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:element>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
      <xsl:template name="parsestring">
            <!-- recursive template -->
            <xsl:param name="string"/>
            <xsl:variable name="tag" select="substring-before($string,'&gt;')"/>
            <xsl:variable name="dataplus" select="substring-after($string,'&gt;')"/>
            <xsl:variable name="data" select="substring-before($dataplus,'&lt;')"/>
            <xsl:variable name="newstring" select="substring-after($string,'&lt;')"/>
            <xsl:if test="string-length($dataplus) gt 0">
                  <xsl:element name="span">
                        <xsl:attribute name="class">
                              <xsl:value-of select="concat('vp_',$tag)"/>
                        </xsl:attribute>
                        <xsl:choose>
                              <xsl:when test="string-length($data) gt 0">
                                    <xsl:value-of select="normalize-space($data)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="normalize-space($dataplus)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:element>
            </xsl:if>
            <xsl:if test="string-length($newstring) gt 0">
                  <xsl:call-template name="parsestring">
                        <xsl:with-param name="string" select="$newstring"/>
                  </xsl:call-template>
            </xsl:if>
      </xsl:template>
      <xsl:template name="parsestring2">
            <!-- analyze-string template -->
            <xsl:param name="string"/>
            <xsl:analyze-string select="$string" regex="&lt;">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:call-template name="parsetagndata">
                              <xsl:with-param name="string" select="."/>
                        </xsl:call-template>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="parsetagndata">
            <xsl:param name="string"/>
            <xsl:analyze-string select="$string" regex="(.+)&gt;(.*)">
                  <xsl:matching-substring>
                        <xsl:if test="string-length(regex-group(2)) gt 0">
                              <xsl:element name="span">
                                    <xsl:attribute name="class">
                                          <xsl:value-of select="regex-group(1)"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="normalize-space(regex-group(2))"/>
                              </xsl:element>
                        </xsl:if>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      
</xsl:stylesheet>
