<!--
    #############################################################
    # Name:        generate-match-func2.xslt
    # Purpose:    generate a function list to match xml elements to html tags
    # Part of:     Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:      Ian McQuay <ian_mcquay.org>
    # Created:     2013/01/12
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="xsl">
      <!-- Part of the VimodPub transformations tools
	Used to generate a map for tranlating an xml element into a HTML tag.
	Written by Ian McQuay
	Modified 2013-02-04 
-->
      <xsl:output method="xml" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="fieldlist"/>
      <xsl:param name="defaultelement" select="'div'"/>
      <xsl:param name="listname"/>
      <xsl:variable name="fields">
            <xsl:call-template name="eleattb">
                  <xsl:with-param name="text" select="$fieldlist"/>
                  <xsl:with-param name="attbname" select="'html'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml-1ele2attb.xslt'/>
      <xsl:template match="/*">
            <gen:stylesheet version="2.0" xmlns:f="myfunctions">
                  <gen:function name="f:match">
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
                              <gen:otherwise>
                                    <xsl:value-of select="$defaultelement"/>
                              </gen:otherwise>
                        </gen:choose>
                  </gen:function>
                  <!-- <xsl:element name="variable">
                        <xsl:attribute name="name">
                              <xsl:value-of select="$listname"/>
                        </xsl:attribute>
                        <xsl:attribute name="select">
                              <xsl:text>'</xsl:text>
                              <xsl:value-of select="replace($fieldlist,':[a-z0-9]+ ',' ')"/>
                              <xsl:text>'</xsl:text>
                        </xsl:attribute>
                  </xsl:element>  -->
                  <xsl:element name="variable">
                        <xsl:attribute name="name">
                              <xsl:value-of select="$listname"/>
                        </xsl:attribute>
                        <xsl:attribute name="select">
<xsl:text>tokenize('</xsl:text>
                              <xsl:value-of select="replace($fieldlist,':[a-z0-9]+','')"/>
<xsl:text>','\s+')</xsl:text>
                        </xsl:attribute>
                  </xsl:element>
            </gen:stylesheet>
      </xsl:template>
</xsl:stylesheet>
