<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="/lift">
            <xsl:apply-templates select="entry"/>
      </xsl:template>
      <xsl:template match="entry">
            <xsl:param name="headword" select="lexical-unit/form/text"/>
            <xsl:if test="string-length($headword) ne 0">
                  <xsl:apply-templates select="sense">
                        <xsl:with-param name="headword" select="$headword"/>
                  </xsl:apply-templates>
            </xsl:if>
            <!--
             <xsl:for-each select="sense">
                  <xsl:call-template name="senseentry">
                    <xsl:with-param name="headword" select="$headword"/>
                  </xsl:call-template>
            </xsl:for-each>
-->
      </xsl:template>
      <xsl:template match="lexical-unit/form/text">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="sense/definition/form/text[@lang = 'en']">
            <xsl:apply-templates/>
      </xsl:template>
      <!--
      <xsl:template name="senseentry">
            <xsl:param name="headword"/>
            <xsl:variable name="l1" select="sense[1]/definition/form[@lang = 'en']/text"/>
            <xsl:variable name="l2" select="sense[1]/definition/form[@lang = 'tl']/text"/>
            <xsl:choose>
                  <xsl:when test="string-length($l1) + string-length($l2) = 0"/>
                  <xsl:otherwise>
                        <xsl:apply-templates select="$headword"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:apply-templates select="$l1"/>
                        <xsl:text> &#9;</xsl:text>
                        <xsl:apply-templates select="$l2"/>
                        <xsl:text> </xsl:text>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template> -->
      <xsl:template match="sense">
            <xsl:param name="headword"/>
            <xsl:variable name="lang-eng">
                  <xsl:choose>
                        <xsl:when test="string-length(definition/form[@lang = 'en']/text) gt 0">
                              <xsl:value-of select="definition/form[@lang = 'en']/text"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="gloss[@lang = 'en']/text"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="lang-nat">
                  <xsl:choose>
                        <xsl:when test="string-length(sense[1]/definition/form[@lang = $national]/text) gt 0">
                              <xsl:value-of select="definition/form[@lang = $national]/text"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="gloss[@lang = $national]/text"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="lang-reg">
                  <xsl:choose>
                        <xsl:when test="string-length(sense[1]/definition/form[@lang = $regional]/text) gt 0">
                              <xsl:value-of select="definition/form[@lang = $regional]/text"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="gloss[@lang = $regional]/text"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="lang-reg2">
                  <xsl:choose>
                        <xsl:when test="string-length(sense[1]/definition/form[@lang = $regional2]/text) gt 0">
                              <xsl:value-of select="definition/form[@lang = $regional2]/text"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="gloss[@lang = $regional2]/text"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="lang-reg3">
                  <xsl:choose>
                        <xsl:when test="string-length(sense[1]/definition/form[@lang = $regional3]/text) gt 0">
                              <xsl:value-of select="definition/form[@lang = $regional3]/text"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="gloss[@lang = $regional3]/text"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                  <xsl:when test="string-length($lang-eng) + string-length($lang-nat) = 0"/>
                  <xsl:otherwise>
                        <xsl:apply-templates select="$headword"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:apply-templates select="$lang-eng"/>
                        <xsl:if test="number($langs) ge 3">
                              <xsl:text> &#9;</xsl:text>
                              <xsl:apply-templates select="$lang-nat"/>
                        </xsl:if>
                        <xsl:if test="number($langs) ge 4">
                              <xsl:text> &#9;</xsl:text>
                              <xsl:apply-templates select="$lang-reg"/>
                        </xsl:if>
                        <xsl:if test="number($langs) ge 5">
                              <xsl:text> &#9;</xsl:text>
                              <xsl:apply-templates select="$lang-reg2"/>
                        </xsl:if>
                        <xsl:if test="number($langs) ge 6">
                              <xsl:text> &#9;</xsl:text>
                              <xsl:apply-templates select="$lang-reg3"/>
                        </xsl:if>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
