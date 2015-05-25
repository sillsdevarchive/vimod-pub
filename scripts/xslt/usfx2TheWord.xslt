<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         usfx2TheWord.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:strip-space elements="*"/>
      <xsl:variable name="unwantedintro" select="tokenize('imt imt1 imt2 is ip iot io io1 io2 io3 h id toc mt',' ')"/>
      <xsl:variable name="introsection1" select="tokenize('imte',' ')"/>
      <xsl:variable name="section1" select="tokenize('s',' ')"/>
      <xsl:variable name="introsection2" select="tokenize('mt2 imte2 ',' ')"/>
      <xsl:variable name="section2" select="tokenize('s2',' ')"/>
      <xsl:variable name="inchapsection" select="tokenize('s s1 s2 r',' ')"/>
      <xsl:variable name="section3" select="tokenize('r',' ')"/>
      <xsl:variable name="newlinemarker" select="tokenize('p q q1 q2 q3 m pi pc',' ')"/>
      <xsl:variable name="indentmarker" select="tokenize('q q1 q2 q3 pi ',' ')"/>
      <xsl:variable name="marginmarker" select="tokenize('p m pc',' ')"/>
<xsl:variable name="debug" select="'on'"/>
      <xsl:template match="/usfx">
            <xsl:apply-templates select="book"/>
            <xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="book">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="p[@sfm = $unwantedintro]|*[name()= $unwantedintro]"/>
      <xsl:template match="s">
            <xsl:text>&lt;TS1&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&lt;Ts&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="p[@sfm = $introsection1]">
            <xsl:text>&lt;TS1&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&lt;Ts&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="s[@sfm = $section2]">
            <xsl:text>&lt;TS2&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&lt;Ts&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="p|q">
            <xsl:if test="name() = $indentmarker">
                  <xsl:value-of select="concat('&lt;PI',@level,'&gt;')"/>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="not(*[last()][name() = 've'])">
                  <xsl:choose>
                        <xsl:when test="following-sibling::*[1][name() = $indentmarker]">
                              <xsl:text>&lt;CI&gt;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text>&lt;CM&gt;</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:if>
      </xsl:template>
      <xsl:template match="v">
<xsl:if test="$debug = 'on'">
<xsl:value-of select="@id"/>
<xsl:text> </xsl:text>
</xsl:if>
      </xsl:template>
      <xsl:template match="ve">
            <xsl:if test="matches(preceding::v[1]/@id,'[,\-]')">
                  <xsl:variable name="vrange" select="tokenize(preceding::v[1]/@id,'[,\-]')"/>
                  <xsl:call-template name="emptyverse">
                        <xsl:with-param name="next" select="number($vrange[1])+1"/>
                        <xsl:with-param name="last" select="$vrange[last()]"/>
                  </xsl:call-template>
            </xsl:if>
            <xsl:if test="parent::*/following-sibling::*[1][name() = $newlinemarker]">
                  <xsl:choose>
                        <xsl:when test="parent::*/following-sibling::*[1][name() = $indentmarker]">
                              <xsl:text>&lt;CI&gt;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text>&lt;CM&gt;</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:if>
            <xsl:text>&#13;&#10;</xsl:text>
      </xsl:template>
      <xsl:template name="emptyverse">
            <xsl:param name="next"/>
            <xsl:param name="last"/>
            <xsl:text>&#13;&#10;(-)</xsl:text>
            <xsl:if test="number($last) gt number($next) ">
                  <xsl:call-template name="emptyverse">
                        <xsl:with-param name="next" select="number($next) + 1"/>
                        <xsl:with-param name="last" select="$last"/>
                  </xsl:call-template>
            </xsl:if>
      </xsl:template>
      <xsl:template match="f">
            <xsl:text>&lt;RF&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&lt;Rf&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="fr|ft|fq">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="text()">
            <xsl:value-of select="normalize-space(.)"/>
      </xsl:template>
</xsl:stylesheet>
