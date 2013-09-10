<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         xslt2html.xslt
    # Purpose:	Make a html representation of xslt files
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2013/08/22
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="">
      <xsl:param name="xsltname"/>
      <xsl:template match="/">
            <html xmlns="http://www.w3.org/1999/xhtml">
                  <head>
                        <title>
                              <xsl:value-of select="$xsltname"/>
                        </title>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                        <meta name="generator" content="SynEdit HTML exporter"/>
                        <style type="text/css">

body { color: #000000; background-color: #FFFFFF; }
.attributename { color: #FF0000; font-weight: bold; }
.attributevalue { color: #000000; }
.xml1-cdatasection { color: #808040; font-style: italic; }
.comment { color: #008000; font-style: italic; }
.xml1-doctypesection { color: #800000; font-style: italic; }
.elementname { color: #000080; font-weight: bold; }
.xml1-entityreference { color: #800000; }
.xml1-namespaceattributename { color: #808000; }
.xml1-namespaceattributevalue { color: #000080; }
.xml1-processinginstruction { color: #FF68FF; font-weight: bold; font-style: italic; }
.symbol { color: #800080; }
.text { color: #000000; font-weight: bold; }
.whitespace { color: #008080; }

</style>
                  </head>
                  <body>
                        <pre>
                              <code>
                                    <xsl:text>&lt;?xml version="1.0" encoding="utf-8"?&gt;&#13;&#10;</xsl:text>
                                    <xsl:apply-templates select="node()"/>
                              </code>
                        </pre>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="*">
            <span class="symbol">&lt;</span>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>elementname</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="name()"/>
            </xsl:element>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                  <xsl:when test="*">
                        <span class="symbol">&gt;</span>
                        <xsl:apply-templates select="node()"/>
                        <span class="symbol">&lt;</span>
                        <xsl:element name="span">
                              <xsl:attribute name="class">
                                    <xsl:text>elementname</xsl:text>
                              </xsl:attribute>
                              <xsl:value-of select="name()"/>
                        </xsl:element>
                        <span class="symbol">&gt;</span>
                  </xsl:when>
                  <xsl:otherwise>
                        <span class="symbol">/&gt;</span>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="@*">
            <xsl:text> </xsl:text>
            <span class="attributename">
                  <xsl:value-of select="name()"/>
            </span>
            <span class="symbol">="</span>
            <span class="attributevalue">
                  <xsl:value-of select="."/>
            </span>
            <span class="symbol">"</span>
      </xsl:template>
      <xsl:template match="text()">
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>text</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="."/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="comment()">
            <span class="symbol">&lt;!--</span>
            <span class="comment">
                  <xsl:value-of select="."/>
            </span>
            <span class="symbol">--&gt;&#13;&#10;</span>
      </xsl:template>
</xsl:stylesheet>
