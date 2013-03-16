<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- Takes a tab separated text file and outputs an xsl:attribute-set

input file in the following form
===================
body	margin	2cm
o	width	0.3cm
d	min-width	3cm
d	width	auto


 -->
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
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
            <xsl:element name="xsl:stylesheet" use-attribute-sets="xslt2">
                  <xsl:for-each-group select="$items/data" group-by="@class">
                        <xsl:sort select="@class"/>
                        <xsl:element name="xsl:attribute-set">
                              <xsl:attribute name="name">
                                    <xsl:value-of select="concat('class_',@class)"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="current-group()"></xsl:apply-templates>
                        </xsl:element>
                  </xsl:for-each-group>
            </xsl:element>
      </xsl:template>
      <xsl:template match="data">
            <xsl:element name="xsl:attribute">
                  <xsl:attribute name="name">
                        <xsl:value-of select="@selector"/>
                  </xsl:attribute>
                  <xsl:value-of select="."/>
            </xsl:element>
      </xsl:template>
      <xsl:attribute-set name="xslt2">
            <xsl:attribute name="version">2.0</xsl:attribute>
      </xsl:attribute-set>
</xsl:stylesheet>
