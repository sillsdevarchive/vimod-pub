<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
The lists are firstly separated by CR LF (Winows form) then by \s\s+ separated 
The control list source text is in the form:
included_item_1   included_item_2

	Modified by Ian McQuay 
	Created 2012-09-25
-->
      <xsl:param name="group"/>
      <xsl:param name="groupclass"/>
      <xsl:param name="data"/>
      <xsl:template name="textlist2xml">
            <xsl:param name="text"/>
            <xsl:analyze-string select="$text" regex="\r\n">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:analyze-string select="." regex="^(.*)\s\s+(.*)">
                              <xsl:matching-substring>
                                    <xsl:element name="{$group}">
                                          <xsl:if test="$groupclass != ''">
                                                <xsl:attribute name="class">
                                                      <xsl:value-of select="$groupclass"/>
                                                </xsl:attribute>
                                          </xsl:if>
                                          <xsl:element name="{$data}">
                                                <xsl:attribute name="class">c1</xsl:attribute>
                                                <xsl:value-of select="normalize-space(regex-group(1))"/>
                                          </xsl:element>
                                          <xsl:element name="{$data}">
                                                <xsl:attribute name="class">c2</xsl:attribute>
                                                <xsl:value-of select="normalize-space(regex-group(2))"/>
                                          </xsl:element>
                                    </xsl:element>
                              </xsl:matching-substring>
                              <xsl:non-matching-substring/>
                        </xsl:analyze-string>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
