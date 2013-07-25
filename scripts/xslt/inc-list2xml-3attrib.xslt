<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
The lists are \s+ separated (win CR LF or any space type) included items must be preceeded by a underscore
The control list source text is in the form:
item1 item3 item3 
item1 item3 item3 
item1 item3 item3 
etc
	Modified by Ian McQuay 
	Created 2012-06-14
-->
      <xsl:template name="list2xml3attrib">
            <xsl:param name="text"/>
            <xsl:param name="element"/>
            <xsl:param name="first"/>
            <xsl:param name="second"/>
            <xsl:param name="third"/>
            <xsl:analyze-string select="$text" regex="\r\n">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:analyze-string select="." regex="^(.*)\s(.*)\s(.*)">
                              <xsl:matching-substring>
                                    <xsl:element name="{$element}">
                                          <xsl:attribute name="{$first}">
                                                <xsl:value-of select="regex-group(1)"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="{$second}">
                                                <xsl:value-of select="regex-group(2)"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="{$third}">
                                                <xsl:value-of select="regex-group(3)"/>
                                          </xsl:attribute>
                                    </xsl:element>
                              </xsl:matching-substring>
                              <xsl:non-matching-substring/>
                        </xsl:analyze-string>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
</xsl:stylesheet>
