<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:param name="removefieldlist" select="'id h s r mt mt1 mt2 mt3 ip is restore fig note'"/>
      <xsl:variable name="removefields">
            <xsl:call-template name="tokenizeString">
                  <xsl:with-param name="list" select="$removefieldlist"/>
                  <xsl:with-param name="delimiter" select="' '"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:template match="*">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@style = $removefields/item]"/>
      <xsl:template name="tokenizeString">
            <!--passed template parameter -->
            <xsl:param name="list"/>
            <xsl:param name="delimiter"/>
            <xsl:choose>
                  <xsl:when test="contains($list, $delimiter)">
                        <item>
                              <!-- get everything in front of the first delimiter -->
                              <xsl:value-of select="substring-before($list,$delimiter)"/>
                        </item>
                        <xsl:call-template name="tokenizeString">
                              <!-- store anything left in another variable -->
                              <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                              <xsl:with-param name="delimiter" select="$delimiter"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="$list = ''">
                                    <xsl:text/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <item>
                                          <xsl:value-of select="$list"/>
                                    </item>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
