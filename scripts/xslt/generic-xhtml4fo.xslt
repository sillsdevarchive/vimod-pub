<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      xmlns:silp="http://silp.org.ph/ns"
      xmlns:html="http://www.w3.org/1999/xhtml/ns"
      exclude-result-prefixes="silp">
        <xsl:output method="xhtml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:include href='temp-match.xslt'/>
      <xsl:param name="title"/>
      <xsl:param name="precontext"/>
      <xsl:param name="postcontext"/>
      <xsl:include href='css-class-match.xslt' />
      
      <xsl:template match="/*">
            <html xmlns:html="http://www.w3.org/1999/xhtml/ns">
                  <head>
                        <meta name="generator" content="ToolBox PLB dictionary transformation"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
                        <title><xsl:value-of select="$title" /></title>
                  </head>
                  <body>
                        <xsl:apply-templates/>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="*">
            <xsl:element name="{silp:match(name())}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                  </xsl:attribute>
<xsl:if test="silp:css-class-match(concat('class_',local-name())) != ''">
                   <xsl:attribute name="style">
                        <xsl:value-of select="silp:css-class-match(concat('class_',local-name()))"/>
                  </xsl:attribute>
</xsl:if>
                  <xsl:if test="$precontext = 'yes'">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(preceding-sibling::*[1])"/>
                  </xsl:if>
                  <xsl:if test="$postcontext = 'yes'">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name()"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="name(following-sibling::*[1])"/>
                  </xsl:if>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
