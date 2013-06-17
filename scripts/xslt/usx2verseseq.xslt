<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
<xsl:strip-space elements="usx" />

      <xsl:variable name="book" select="/usx/book/@code"/>
      <xsl:template match="/*">
            <usxv>
                  <xsl:apply-templates/>
            </usxv>
      </xsl:template>
      <xsl:template match="para">         <!-- preceding-sibling::c/@number -->
            <xsl:variable name="chapter" select="1"/>
            <xsl:choose>
                  <!-- remove unwanted para elements -->
                  <xsl:when test="local-name() = 'book'"/>
                  <xsl:when test="substring(@style,1,1) = 'i'"/>
                  <xsl:when test="@style = 'r'"/>
                  <xsl:when test="@style = 's'"/>
                  <xsl:when test="@style = 'h'"/>
                  <xsl:otherwise>
                        <xsl:apply-templates select="node()">
                              <xsl:with-param name="chapter" select="$chapter">
                   </xsl:with-param>
                        </xsl:apply-templates>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="cGroup|p|q|q1|q2|q3">
      <xsl:apply-templates select="node()">
                              <xsl:with-param name="chapter" select="ancestor-or-self::cGroup/@curchap">
                   </xsl:with-param></xsl:apply-templates>
      </xsl:template>
      <xsl:template match="book|hGroup|r|s|s2|f|x"></xsl:template>
      <xsl:template match="v|verse">
            <xsl:param name="chapter"/>
            <xsl:param name="versenumb" select="floor(number(replace(@number,'-','.')))" />
            <xsl:copy>
                  <xsl:attribute name="seq">
                        <xsl:call-template name="bkname2numb">
                              <xsl:with-param name="bkcode" select="$book"/>
                        </xsl:call-template>
                        
                        <xsl:number value="$chapter" format="000"/>
                        <xsl:number value="$versenumb" format="000"/>
                                              
                  </xsl:attribute>
                  <!-- <xsl:apply-templates select="@*"/> <xsl:call-template name="verse2numb">
                              <xsl:with-param name="versenumb" select="$versenumb"/>
                        </xsl:call-template>  -->
            </xsl:copy >
      </xsl:template>
      <xsl:template name="bkname2numb">
            <xsl:param name="bkcode"/>
            <xsl:choose>
                  <xsl:when test="$bkcode = 'NUM'">
                        <xsl:text>04</xsl:text>
                  </xsl:when>
                  <xsl:when test="$bkcode = 'GEN'">
                        <xsl:text>01</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$bkcode"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="verse2numb">
            <xsl:param name="versenumb"/>
            <xsl:choose>
                  <xsl:when test="string-length($versenumb) = 1">
                        <xsl:text>00</xsl:text>
                        <xsl:value-of select="$versenumb"/>
                  </xsl:when>
                  <xsl:when test="string-length($versenumb) = 2">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="$versenumb"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$versenumb"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
