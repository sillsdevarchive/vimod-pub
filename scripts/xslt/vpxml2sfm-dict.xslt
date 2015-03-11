<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     .xslt
    # Purpose:
    # Part of:  Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:   Ian McQuay <ian_mcquay.org>
    # Created:  2014- -
    # Copyright:    (c) 2014 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:template match="/*">
            <xsl:text>\id sfm recreated from Ventur Publisher text files</xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <!-- Paragraph elements -->
      <xsl:template match="*[@class=$lx]">
            <xsl:text>&#10;\lx</xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@class=$body]">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@class=$ms]">
            <xsl:text>&#10;\ms </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@class=$ld]">
            <xsl:apply-templates select="*[@tag=$bold][1]" mode="subentry"/>
            <xsl:apply-templates select="*[not(position()=1)]"/>
      </xsl:template>
      <xsl:template match="*[@class=$table]">
            <xsl:text>&#10;\table </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <!-- span elements -->
      <xsl:template match="*[@tag=$italic]">
            <xsl:variable name="text" select="normalize-space(.)"/>
            <xsl:choose>
                  <xsl:when test="$text = $pos">
                        <!-- Part of speech handling -->
                        <xsl:text>&#10;\ps </xsl:text>
                        <xsl:value-of select="translate(.,'.','')"/>
                        <xsl:apply-templates select="*"/>
                  </xsl:when>
                  <xsl:when test="following-sibling::*[1][@tag=$normal] and string-length(.) gt 10">
                        <xsl:text>&#10;\ex </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="translate(normalize-space(preceding-sibling::*[1]),' ','_') = $label">
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;\tag-i </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[@tag=$normal]">
            <xsl:variable name="text" select="normalize-space(.)"/>
            <xsl:choose>
                  <xsl:when test="string-length($text)=0"/>
                  <xsl:when test="$text = $closebraces"/>
                  <xsl:when test="$text = $semantic">
                        <xsl:text>&#10;\oc </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="translate($text,' ','_') = $label">
                        <xsl:apply-templates select="*[@tag=$italic]" mode="label">
                              <xsl:with-param name="labeltype" select="f:labelmap(normalize-space(.))"/>
                        </xsl:apply-templates>
                        <xsl:apply-templates select="*[@tag=$label]"/>
                        <!--   <xsl:text>&#10;\</xsl:text>
                        <xsl:value-of select="f:labelmap($text)"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="*"/>
                        <xsl:choose>
                              <xsl:when test="$text = 'Cf.'">
                                    <xsl:text>&#10;\re </xsl:text>
                                    <xsl:apply-templates select="*"/>
                              </xsl:when>
                              <xsl:when test="string-length($text)=0"/>
                              <xsl:otherwise>
                                    <xsl:text>&#10;\tag-label </xsl:text>
                                    <xsl:apply-templates/>
                              </xsl:otherwise>
                        </xsl:choose>-->
                  </xsl:when>
                  <xsl:when test="(normalize-space(preceding-sibling::*[1]) = $pos) or (normalize-space(preceding-sibling::*[2])=$semantic)">
                        <xsl:text>&#10;\gl </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="preceding-sibling::*[1][@tag=$italic] and string-length($text) gt 10 and not(normalize-space(preceding-sibling::*[1]) = $pos)">
                        <xsl:text>&#10;\tr </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;\tag-n </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[@tag = $bold]">
            <xsl:variable name="text" select="normalize-space(.)"/>
            <xsl:choose>
                  <xsl:when test="position() = 1"/>
                  <xsl:when test="matches($text,'\d+')">
                        <xsl:text>&#10;\ms </xsl:text>
                  </xsl:when>
                  <xsl:when test="normalize-space(preceding-sibling::*[1]) = $semantic">
                        <xsl:text>&#10;\oa </xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;\tag-b </xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@tag=$bold]" mode="subentry">
            <xsl:text>&#10;\ld </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="scrap">
            <xsl:variable name="text" select="normalize-space(.)"/>
            <xsl:variable name="lang" select="translate($text,'().','')"/>
            <xsl:choose>
                  <xsl:when test="$text = $source-lang">
                        <xsl:text>&#10;\d</xsl:text>
                        <xsl:value-of select="f:sourcelangmap(.)"/>
                        <xsl:apply-templates select="*"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;\tag-b-se </xsl:text>
                        <xsl:apply-templates/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[@tag=$italic]" mode="label">
            <xsl:param name="sfm"/>
            <xsl:variable name="followingnumb" select="following-sibling::*[@tag = 'N']"/>
                        <xsl:text>&#10;\</xsl:text>
                        <xsl:value-of select="$sfm"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="."/>
<xsl:if test="$followingnumb">
<xsl:value-of select="$followingnumb"/>
</xsl:if>

           <!-- <xsl:choose>
                  <xsl:when test="preceding-sibling::*[.=$label][1]">

                  </xsl:when>
                  <xsl:when test="preceding-sibling::*[.=$label][2] and preceding-sibling::*[1][@tag=$italic]">
                        <xsl:text>&#10;\</xsl:text>
                        <xsl:value-of select="$labeltype"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="."/>
                  </xsl:when>
                  <xsl:when test="preceding-sibling::*[.=$label][3] and preceding-sibling::*[1][@tag=$italic] and preceding-sibling::*[2][@tag=$italic]">
                        <xsl:text>&#10;\</xsl:text>
                        <xsl:value-of select="$labeltype"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates select="."/>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose> -->
      </xsl:template>
      <xsl:template match="*[@tag='N']" mode="label">

</xsl:template>
      <xsl:template match="*[matches(name(),'Group')]">
            <xsl:variable name="sfm" select="f:labelmap(replace(name(),'Group',''))"/>
            <xsl:apply-templates mode="label">
                  <xsl:with-param name="sfm" select="$sfm"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:function name="f:labelmap">
            <!-- function to match ver short book to Alkitab xref number-->
            <xsl:param name="string"/>
            <xsl:call-template name="lookup">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$label-map-array"/>
                  <xsl:with-param name="errortext" select="'label'"/>
                  <xsl:with-param name="finditem" select="1"/>
                  <xsl:with-param name="returnitem" select="2"/>
                  <xsl:with-param name="primaryseparator" select="'_'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:sourcelangmap">
            <!-- function to match ver short book to Alkitab xref number-->
            <xsl:param name="string"/>
            <xsl:call-template name="lookup">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$source-lang-array"/>
                  <xsl:with-param name="errortext" select="'source-lang'"/>
                  <xsl:with-param name="finditem" select="1"/>
                  <xsl:with-param name="returnitem" select="2"/>
                  <xsl:with-param name="primaryseparator" select="'_'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
            </xsl:call-template>
      </xsl:function>
</xsl:stylesheet>
