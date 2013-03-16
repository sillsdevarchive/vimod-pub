<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:silp="http://silp.org.ph/ns" exclude-result-prefixes="xsl">
      <!-- Takes a tab separated text file and outputs a xslt function for inclusion in another stylesheet

input file in the following form
=================================
body    margin  2cm
o       width   0.3cm
d       min-width       3cm
d       width   auto


 -->
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="sourcetexturi"/>
      <xsl:variable name="items">
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
      </xsl:variable>
      <xsl:template match="/">
            <gen:stylesheet version="2.0">
                  <gen:function name="silp:css-class-match">
                        <gen:param name="test"/>
                        <gen:choose>
                              <xsl:for-each-group select="$items/data" group-by="@class">
                                    <xsl:sort select="@class"/>
                                    <xsl:element name="xsl:when">
                                          <xsl:attribute name="test">
                                                <xsl:text>$test = '</xsl:text>
                                                <xsl:value-of select="concat('class_',@class)"/>
                                                <xsl:text>'</xsl:text>
                                          </xsl:attribute>
                                          <gen:text>
                                                <xsl:apply-templates select="current-group()"/>
                                          </gen:text>
                                    </xsl:element>
                              </xsl:for-each-group>
                              <gen:otherwise></gen:otherwise>
                        </gen:choose>
                  </gen:function>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template match="data">
            <xsl:value-of select="@selector"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>;</xsl:text>
      </xsl:template>
      <xsl:attribute-set name="xslt2">
            <xsl:attribute name="version">2.0</xsl:attribute>
      </xsl:attribute-set>
</xsl:stylesheet>
