<?xml version="1.0"?>
<!-- Generic Tab separated variables to xml
Required parameter: fieldname list

 -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>
      <xsl:param name="seq"/>
      <xsl:param name="fieldnamelist"/>
      <xsl:param name="sourcefile"/>
      <xsl:param name="group" select="'item'"/>
      <xsl:param name="sepvar1" select="'\r\n'"/>
      <xsl:param name="sepvar2" select="'\t'"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcefile)"/>
      <xsl:variable name="fieldname" select="tokenize($fieldnamelist,' ')"/>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:template match="/">
            <database>
                  <xsl:choose>
                        <xsl:when test="unparsed-text-available($sourcetexturi)">
                              <xsl:analyze-string select="unparsed-text($sourcetexturi)" regex="{$sepvar1}">
                                    <xsl:matching-substring/>
                                    <xsl:non-matching-substring>
                                          <xsl:element name="{$group}">
                                                <xsl:analyze-string select="." regex="{$sepvar2}">
                                                      <xsl:matching-substring/>
                                                      <xsl:non-matching-substring>
                                                            <xsl:variable name="pos" select="(position()+1) div 2"/>
                                                            <xsl:element name="{$fieldname[$pos]}">
                                                                  <xsl:value-of select="."/>
                                                            </xsl:element>
                                                      </xsl:non-matching-substring>
                                                </xsl:analyze-string>
                                          </xsl:element>
                                    </xsl:non-matching-substring>
                              </xsl:analyze-string>
                        </xsl:when>
                        <xsl:otherwise>
                              <error>Source text: <xsl:value-of select="$sourcefile"/> not found</error>
                        </xsl:otherwise>
                  </xsl:choose>
            </database>
      </xsl:template>
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
      </xsl:function>
</xsl:stylesheet>
