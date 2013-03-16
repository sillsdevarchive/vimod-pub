<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
The lists are \s separated (win CR LF or any space type) included items must be preceeded by a underscore
The control list source text is in the form:
_included item 1
_included item 2
excluded item
-->
      <xsl:variable name="groupsdivs">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$groupsdivstext"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="inlinespans">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$inlinespansstext"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="sensehom">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$sensehomtext"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="omit">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$omittext"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:template name="list2xml">
            <xsl:param name="text"/>
            <xsl:element name="control">
                  <xsl:analyze-string select="$text" regex="\s">
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:element name="element">
                                    <xsl:value-of select="."/>
                              </xsl:element>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
