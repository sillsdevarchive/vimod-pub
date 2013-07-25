<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns">
      <xsl:output method="xhtml" indent="yes"/>
      <xsl:include href='MDF-PWmatch.xslt'/>
      <xsl:include href='MDF-PWlang.xslt'/>
      <xsl:include href='MDF-PWclass.xslt'/>
      <xsl:param name="precontext"/>
      <xsl:param name="postcontext"/>
      <xsl:param name="table"/>
      <xsl:param name="hvostart" select="10000"/>
      <xsl:param name="collabel1"/>
      <xsl:param name="collabel2"/>
      <xsl:param name="collabel3"/>
      <xsl:param name="collabel4"/>
      <xsl:param name="locref"/>
      <xsl:param name="pagination"/>
      <xsl:strip-space elements="*"/>
      <xsl:variable name="css">
            <xsl:text>

</xsl:text>
      </xsl:variable>
      <xsl:template match="/*">
            <html>
                  <head>
                        <link rel="stylesheet" href="{$pagination}" type="text/css"/>
                        <style type="text/css">
                              <xsl:value-of select="$css"/>
                        </style>
                  </head>
                  <body>
                        <xsl:apply-templates/>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="*">
            <xsl:variable name="this-name" select="local-name()"/>
            <xsl:element name="{silp:match(name())}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="concat(silp:class(name()) ,' ',name())"/>
                  </xsl:attribute>
                  <xsl:if test="name() = 'lxGroup'">
                        <xsl:attribute name="id">
                              <xsl:text>hvo</xsl:text>
                              <xsl:value-of select="count(preceding-sibling::lxGroup)+ $hvostart"/>
                        </xsl:attribute>
                  </xsl:if>
                  <xsl:choose>
                        <xsl:when test="string-length(name()) &gt; 5">
                              <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>
                              <span lang="{silp:lang(name())}">
                                    <xsl:apply-templates/>
                              </span>
                        </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="string-length(name()) &lt; 5">
                        <span>
                              <xsl:text> </xsl:text>
                        </span>
                        
                  </xsl:if>
            </xsl:element>
      </xsl:template>
      <xsl:template match="alpha">
            <xsl:element name="h2">
                  <xsl:value-of select="@key"/>
            </xsl:element>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="@name|@id">
            <xsl:copy>
                  <xsl:apply-templates select="."/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
