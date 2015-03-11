<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xs f">
      <!-- 
            From: http://andrewjwelch.com/code/xslt/csv/csv-to-xml_v2.html
            Modifications by: Ian McQuay 2014-12-22
            1: the original was missing the lines separator in the $lines var array definition, so I added \r?\n (Presume the original was lost in a copy)
            2: changed to include my inc-file2uri.xslt so a DOS/Windows path\filename could be passed unchanged to the template.
            3: changed the output element names to be dynamic based on the first line of the input. Only spaces handled but tweaking the translate would fix other issues.
            4: changed the function name space to conform to my function namespace
	-->
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:param name="pathToCSVfile"/>
      <xsl:variable name="pathToCSV" select="f:file2uri($pathToCSVfile)"/>
      <xsl:function name="f:getTokens" as="xs:string+">
            <xsl:param name="str" as="xs:string"/>
            <xsl:analyze-string select="concat($str, ',')" regex='(("[^"]*")+|[^,]*),'>
                  <xsl:matching-substring>
                        <xsl:sequence select='replace(regex-group(1), "^""|""$|("")""", "$1")'/>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:function>
      <xsl:template match="/" name="main">
            <xsl:choose>
                  <xsl:when test="unparsed-text-available($pathToCSV)">
                        <xsl:variable name="csv" select="unparsed-text($pathToCSV)"/>
                        <xsl:variable name="lines" select="tokenize($csv, '\r?\n')" as="xs:string+"/>
                        <xsl:variable name="elemNames" select="f:getTokens(translate($lines[1],'[]','_'))" as="xs:string+"/>
                        <root>
                              <xsl:for-each select="$lines[position() &gt; 1]">
                                    <xsl:if test="string-length(.) gt 0">
                                          <row>
                                                <xsl:variable name="lineItems" select="f:getTokens(.)" as="xs:string+"/>
                                                <xsl:for-each select="$elemNames">
                                                      <xsl:variable name="pos" select="position()"/>
                                                      <xsl:if test="string-length($lineItems[$pos]) gt 0">
                                                            <!-- only write element if there is data in field -->
                                                            <xsl:element name="{translate(.,' ','_')}">
                                                                  <xsl:value-of select="$lineItems[$pos]"/>
                                                            </xsl:element>
                                                      </xsl:if>
                                                </xsl:for-each>
                                          </row>
                                    </xsl:if>
                              </xsl:for-each>
                        </root>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>Cannot locate : </xsl:text>
                        <xsl:value-of select="$pathToCSV"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
