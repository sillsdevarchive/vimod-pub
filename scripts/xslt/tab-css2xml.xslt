<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <!-- Incorporated this into css-class2attribset.xslt
  -->
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetextpath"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextpath)"/>
      <xsl:template match="/">
            <xsl:element name="database">
                  <xsl:analyze-string select="unparsed-text($sourcetexturi)" regex="\r\n">
                        <!-- split on newline,  -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:analyze-string select="." regex="^(.+)\t(.+)\t(.+)">
                                    <xsl:matching-substring>
                                          <xsl:element name="data">
                                                <xsl:attribute name="class">
                                                      <xsl:value-of select="regex-group(1)"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="selector">
                                                      <xsl:value-of select="regex-group(2)"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="regex-group(3)"/>
                                          </xsl:element>
                                    </xsl:matching-substring>
                                    <xsl:non-matching-substring/>
                              </xsl:analyze-string>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
