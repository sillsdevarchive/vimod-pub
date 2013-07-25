<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="generate-bookmarks">
    <fo:bookmark-tree>
      <fo:bookmark internal-destination="TableOfContents">
        <fo:bookmark-title>Table of Contents</fo:bookmark-title>
      </fo:bookmark>
      <xsl:for-each select="/html/body//h1">
        <xsl:variable name="current-h1" select="generate-id()"/>
        <fo:bookmark starting-state="hide">
          <xsl:attribute name="internal-destination">
            <xsl:choose>
              <xsl:when test="@id">
                <xsl:value-of select="@id"/>
              </xsl:when>
              <xsl:when test="name(preceding-sibling::*[1]) = 'a' and
                              preceding-sibling::*[1][@name]">
                <xsl:value-of select="preceding-sibling::*[1]/@name"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$current-h1"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <fo:bookmark-title>
            <xsl:value-of select="."/>
          </fo:bookmark-title>
          <xsl:for-each select="following-sibling::h2">
            <xsl:variable name="current-h2" select="generate-id()"/>
            <xsl:if 
              test="generate-id(preceding-sibling::h1[1]) = $current-h1">
              <fo:bookmark starting-state="hide">
                <xsl:attribute name="internal-destination">
                  <xsl:choose>
                    <xsl:when test="@id">
                      <xsl:value-of select="@id"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$current-h2"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <fo:bookmark-title>
                  <xsl:value-of select="."/>
                </fo:bookmark-title>
                <xsl:for-each select="following-sibling::h3">
                  <xsl:variable name="current-h3" select="generate-id()"/>
                  <xsl:if 
                    test="generate-id(preceding-sibling::h2[1]) = $current-h2">
                    <fo:bookmark starting-state="hide">
                      <xsl:attribute name="internal-destination">
                        <xsl:choose>
                          <xsl:when test="@id">
                            <xsl:value-of select="@id"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$current-h3"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <fo:bookmark-title>
                        <xsl:value-of select="."/>
                      </fo:bookmark-title>
                      <xsl:for-each select="following-sibling::h4">
                        <xsl:if 
                          test="generate-id(preceding-sibling::h3[1]) = $current-h3">
                          <fo:bookmark starting-state="hide">
                            <xsl:attribute name="internal-destination">
                              <xsl:choose>
                                <xsl:when test="@id">
                                  <xsl:value-of select="@id"/>
                                </xsl:when>
                                <xsl:otherwise>
                                  <xsl:value-of select="generate-id()"/>
                                </xsl:otherwise>
                              </xsl:choose>
                            </xsl:attribute>
                            <fo:bookmark-title>
                              <xsl:value-of select="."/>
                            </fo:bookmark-title>
                          </fo:bookmark>
                        </xsl:if>
                      </xsl:for-each>
                    </fo:bookmark>
                  </xsl:if>
                </xsl:for-each>
              </fo:bookmark>
            </xsl:if>
          </xsl:for-each>
        </fo:bookmark>
      </xsl:for-each>
    </fo:bookmark-tree>
  </xsl:template>
</xsl:stylesheet>
