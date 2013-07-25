<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
The lists are \s\s+ separated (win CR LF or any space type) 
The control list source text is in the form:
included_item_1
included_item_2
or
item1  item3   item3  etc
	Modified by Ian McQuay 
	Created 2012-06-14
-->
      <xsl:template name="list2xmlelevalue">
            <xsl:param name="text"/>
            <xsl:analyze-string select="$text" regex="\r\n">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:analyze-string select="." regex="^(.*)\s\s+(.*)">
                              <xsl:matching-substring>
                                    <xsl:element name="{regex-group(1)}">
                                          <xsl:value-of select="regex-group(2)"/>
                                    </xsl:element>
                              </xsl:matching-substring>
                              <xsl:non-matching-substring/>
                        </xsl:analyze-string>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
