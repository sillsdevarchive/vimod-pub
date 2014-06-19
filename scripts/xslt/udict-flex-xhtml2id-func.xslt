<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	flex-xhtml2id-func.xslt
    # Purpose:		Create a funcion template that will translate #hvo00000 links into positional links for flex-xhtml2js.xslt
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="xsl">
      <xsl:output method="xml" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:template match="/">
            <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="xsl">
                  <gen:function name="f:link">
                        <gen:param name="string"/>
                        <gen:choose>
                              <xsl:apply-templates select="//*[@class = 'letData']"/>
                        </gen:choose>
                  </gen:function>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template match="*[@class = 'letData']">
            <xsl:variable name="letindex" select="count(preceding-sibling::*[@class = 'letData'])"/>
            <xsl:variable name="precwordcount" select="count(preceding::*[@class = 'entry' or @class = 'minorentry'])"/>
            <xsl:apply-templates select="*">
                  <xsl:with-param name="letindex" select="$letindex"/>
                  <xsl:with-param name="precwordcount" select="$precwordcount"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="*[@class = 'entry' or @class = 'minorentry']">
            <xsl:param name="letindex"/>
            <xsl:param name="precwordcount"/>
            <xsl:variable name="id" select="@id"/>
            <xsl:choose>
                  <xsl:when test="string-length(@id) = 0 "/>
                  <xsl:otherwise>
                        <gen:when test="$string = '#{$id}'">
                              <xsl:value-of select="position() + $precwordcount -1"/>
                        </gen:when>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
