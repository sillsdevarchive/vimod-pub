<xsl:stylesheet version="2.0" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      xmlns:gen="dummy-namespace-for-the-generated-xslt" 
      xmlns:silp="http://silp.org.ph/ns" 
      exclude-result-prefixes="xsl">
<!-- Part of the FimodPub transformations tools
	Used to generate a map for tranlating an xml element into a HTML tag.
	Written by Ian McQuay
	Modified 2013-02-04 
-->
      <xsl:output method="xml" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="fieldlist"/>
      <xsl:variable name="fields">
            <xsl:call-template name="eleattb">
                  <xsl:with-param name="text" select="$fieldlist"/>
                  <xsl:with-param name="attbname" select="'html'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml-1ele2attb.xslt'/>
      <xsl:template match="/*">
            <gen:stylesheet version="2.0" xmlns:silp="http://silp.org.ph/ns">
                  <gen:function name="silp:match">
                  <gen:param name="test"/>
                        <gen:choose>
                              <!-- Generate the structure of the XSL stylesheet -->
                              <xsl:for-each select="$fields/item">
                                    <gen:when test="$test = '{text()}'">
                                          <gen:text>
                                                <xsl:value-of select="child::match"/>
                                          </gen:text>
                                    </gen:when>
                              </xsl:for-each>
                              <!-- put the logic for the generated XSLT here -->
                              <gen:otherwise>div</gen:otherwise>
                        </gen:choose>
                  </gen:function>
            </gen:stylesheet>
      </xsl:template>
</xsl:stylesheet>
