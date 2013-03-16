<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
The lists are firstly separated by CR LF (Winows form) then by \s\s+ separated 
The control list source text is in the form:
included_item_1   included_item_2

	Modified by Ian McQuay 
	Created 2012-09-25
-->
      <xsl:template name="eleattb">
            <xsl:param name="text"/>
            <xsl:param name="attbname"/>
            <xsl:analyze-string select="$text" regex="\s+">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:analyze-string select="." regex="^(.*):(.*)">
                              <xsl:matching-substring>
                                    <xsl:element name="item">

                                          <xsl:value-of select="normalize-space(regex-group(1))"/>
                                    <xsl:element name="match">

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
                                          
