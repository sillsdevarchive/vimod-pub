<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:		YouVersion-extract-languages.xslt
    # Purpose:	Extract iso data from YouVersion versions page.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015-05-28
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:variable name="prohibited" select="tokenize('English Afrikaans Ελληνιστική Siyin Mbay Marba Svenska',' ')"/>
      <xsl:template match="*">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="a">
            <!--<xsl:value-of select="substring(tokenize(.,'-')[2],1,3)"/> -->
            <xsl:if test="matches(@href,'/versions/')">
                  <xsl:value-of select="substring(tokenize(@href,'\-')[2],1,3)"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="."/>
                  <xsl:text>&#13;&#10;</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="li">
            <xsl:choose>
                  <xsl:when test="matches(text()[1],'\(\d+\)$')">
                        <xsl:choose>
                              <xsl:when test="normalize-space(substring-before(text()[1],' ')) = $prohibited"/>
                              <xsl:otherwise>
                                    <xsl:text>============= </xsl:text>
                                    <xsl:value-of select="normalize-space(text()[1])"/>
                                    <xsl:text> ===============&#13;&#10;</xsl:text>
                                    <xsl:apply-templates select="*"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="*"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
