<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="pathToCSVfile"/>
      <xsl:variable name="CSV" select="f:file2uri($pathToCSVfile)"/>
      <xsl:template match="/*">
            <xsl:analyze-string select="$CSV" regex="(.*)\n">
                  <xsl:matching-substring>
                        <xsl:if test="not(regex-group(1)='' or contains(regex-group(1),'Id'))">
                              <result>
                                    <xsl:variable name="fields" as="element()">
                                          <fields>
                                                <xsl:analyze-string select="regex-group(1)" regex="&quot;([^&quot;]*)&quot;,?">
                                                      <xsl:matching-substring>
                                                            <field>
                                                                  <xsl:value-of select="regex-group(1)"/>
                                                            </field>
                                                      </xsl:matching-substring>
                                                </xsl:analyze-string>
                                          </fields>
                                    </xsl:variable>
                                    <xsl:choose>
                                          <xsl:when test="$fields/*[2]='true'">
                                                <id>
                                                      <xsl:value-of select="$fields/*[1]"/>
                                                </id>
                                                <success>
                                                      <xsl:value-of select="$fields/*[2]"/>
                                                </success>
                                                <created>
                                                      <xsl:value-of select="$fields/*[3]"/>
                                                </created>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <errors>
                                                      <xsl:variable name="errorTokens" select="tokenize($fields/*[4],':')"/>
                                                      <xsl:for-each select="tokenize(substring-before(substring-after($errorTokens[3],'['),']'),',')">
                                                            <fields>
                                                                  <xsl:value-of select="normalize-space(.)"/>
                                                            </fields>
                                                      </xsl:for-each>
                                                      <message>
                                                            <xsl:value-of select="$errorTokens[not(position()=1) and not(position()=4)]" separator=":"/>
                                                      </message>
                                                      <statusCode>
                                                            <xsl:value-of select="$errorTokens[1]"/>
                                                      </statusCode>
                                                </errors>
                                                <success>
                                                      <xsl:value-of select="$fields/*[2]"/>
                                                </success>
                                                <created>
                                                      <xsl:value-of select="$fields/*[3]"/>
                                                </created>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </result>
                        </xsl:if>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
