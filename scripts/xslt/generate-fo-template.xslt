<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" exclude-result-prefixes="xsl" xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:output method="xml" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="pagetemplate" select="'fo-one page-layout.xslt'"/>
      <xsl:param name="attribtemplate" select="'attrib-set-temp.xslt'"/>
      <xsl:param name="inlineelementlist"/>
      <xsl:param name="blockelementlist"/>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:variable name="inlinelist">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$inlineelementlist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="blocklist">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$blockelementlist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:template match="/">
            <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                  <gen:include href='{$pagetemplate}'/>
                  <gen:include href='{$attribtemplate}'/>
                  <gen:include href='dict-fo-root-test.xslt'/>
                  <xsl:for-each select="$blocklist/element">
                        <gen:template match="{text()}">
                              <fo:block gen:use-attribute-sets="{text()}" role="{text()}">
                                    <gen:apply-templates select="*|text()"/>
                              </fo:block>
                        </gen:template>
                  </xsl:for-each>
                  <xsl:for-each select="$inlinelist/element">
                        <gen:template match="{text()}">
                              <fo:inline gen:use-attribute-sets="{text()}" role="{text()}">
                                    <gen:apply-templates select="*|text()"/>
                              </fo:inline>
                        </gen:template>
                  </xsl:for-each>
            </gen:stylesheet>
      </xsl:template>
</xsl:stylesheet>
