<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- Takes a tab separated text file and outputs a css file

input file in the following form
=================================
body	margin	2cm
o	width	0.3cm
d	min-width	3cm
d	width	auto


 -->
      <xsl:output method="text" version="1.0" encoding="utf-8"/>
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
            <xsl:text>&#47;* CSS file *&#47;
</xsl:text>
            <xsl:for-each-group select="$items/data" group-by="@class">
                  <xsl:sort select="@class"/>
                  <xsl:value-of select="concat('.',@class)"/>
                  <xsl:text> { </xsl:text>
                  <xsl:apply-templates select="current-group()"></xsl:apply-templates>
                  <xsl:text>}
</xsl:text>
            </xsl:for-each-group>
      </xsl:template>
      <xsl:template match="data">
            <xsl:value-of select="@selector"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>; </xsl:text>
      </xsl:template>
</xsl:stylesheet>
