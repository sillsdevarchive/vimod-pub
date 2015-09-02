<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2014 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:character-map name="langjs">
            <xsl:output-character character="[" string="("/>
            <xsl:output-character character="]" string=")"/>
      </xsl:character-map>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" use-character-maps="langjs"/>
      <xsl:strip-space elements="text"/>
      <xsl:include href="project.xslt"/>
      <!--<xsl:param name="national" select="'tl'"/>
      <xsl:param name="vernacular" select="'blx-PH'"/>
      <xsl:param name="regional" select="'ilo'"/>
      <xsl:param name="regional2"/>
      <xsl:param name="regional3"/> -->
      <xsl:variable name="wanted" select="//relation/@ref"/>
      <xsl:variable name="idlist">
            <xsl:apply-templates select="/*" mode="rel"/>
      </xsl:variable>
      <xsl:function name="f:langabbrev">
            <xsl:param name="langcode"/>
            <xsl:choose>
                  <xsl:when test="$langcode = 'en'">
                        <xsl:text>e</xsl:text>
                  </xsl:when>
                  <xsl:when test="$langcode = $national">
                        <xsl:text>n</xsl:text>
                  </xsl:when>
                  <xsl:when test="$langcode = $vernacular">
                        <xsl:text>v</xsl:text>
                  </xsl:when>
                  <xsl:when test="$langcode = $regional">
                        <xsl:text>r</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>r2</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:template match="/*">
            <data>
                  <xsl:apply-templates select="entry"/>
            </data>
      </xsl:template>
      <xsl:template match="entry">
            <lxGroup>
                  <xsl:apply-templates select="*">
                        <xsl:with-param name="hymnumb" select="@order"/>
                  </xsl:apply-templates>
            </lxGroup>
      </xsl:template>
      <xsl:template match="sense">
            <xsl:choose>
                  <xsl:when test="@order">
                        <xsl:element name="snGroup">
                              <xsl:element name="sn">
                                    <xsl:value-of select="@order +1"/>
                              </xsl:element>
                              <xsl:apply-templates select="*"/>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="*"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="grammatical-info">
            <ps>
                  <xsl:value-of select="@value"/>
            </ps>
      </xsl:template>
      <xsl:template match="gloss">
            <xsl:variable name="lang" select="f:langabbrev(@lang)"/>
            <xsl:element name="{concat('g',$lang)}">
                  <xsl:value-of select="text"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="definition">
            <xsl:apply-templates select="*">
                  <xsl:with-param name="prelet" select="'d'"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="example">
            <xvGroup>
                  <xv>
                        <xsl:value-of select="form/text"/>
                  </xv>
                  <xsl:apply-templates select="translation"/>
            </xvGroup>
      </xsl:template>
      <xsl:template match="translation">
            <xsl:apply-templates select="form" mode="trans"/>
      </xsl:template>
      <xsl:template match="form" mode="trans">
            <xsl:variable name="lang" select="f:langabbrev(@lang)"/>
            <xsl:element name="{concat('x',$lang)}">
                  <xsl:value-of select="text"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="*">
            <xsl:comment select="concat('Unmatched element: ',name())"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="lexical-unit">
            <xsl:param name="hymnumb"/>
            <xsl:variable name="lx" select="form/text"/>
            <lx>
                  <xsl:value-of select="$lx"/>
            </lx>
            <xsl:if test="$hymnumb">
                  <xsl:element name="hm">
                        <xsl:value-of select="$hymnumb"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="pronunciation">
            <xsl:variable name="value" select="form/text"/>
            <ph>
                  <xsl:value-of select="$value"/>
            </ph>
      </xsl:template>
      <xsl:template match="reversal">
            <xsl:variable name="value" select="form/text"/>
            <xsl:element name="r{f:langabbrev(@type)}">
                  <xsl:value-of select="$value"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="trait">
            <xsl:choose>
                  <xsl:when test="@name = 'semantic-domain-ddp4'">
                        <xsl:element name="sd">
                              <xsl:value-of select="@value"/>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="{name()}">
                              <xsl:choose>
                                    <xsl:when test="@morph-type">
                                          <xsl:value-of select="concat(@morph-type[1],': ',@value[1])"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="concat(@name[1],': ',@value[1])"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="field">
            <xsl:variable name="value" select="form/text[1]"/>
            <xsl:element name="{name()}">
                  <xsl:choose>
                        <xsl:when test="@type">
                              <xsl:value-of select="concat(@type[1],': ',$value[1])"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat(@name[1],': ',$value[1])"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:element>
      </xsl:template>
      <xsl:template match="subsense">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="form">
            <xsl:param name="prelet"/>
            <xsl:element name="{$prelet}{f:langabbrev(@lang)}">
                  <xsl:apply-templates select="*"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="note">
            <xsl:element name="nt">
                  <xsl:apply-templates select="form/text"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="text|span">
            <xsl:value-of select="replace(.,'\r?\n',' ')"/>
      </xsl:template>
      <xsl:template match="relation">
            <xsl:element name="lf">
                  <xsl:choose>
                        <xsl:when test="@type = 'Synonyms'">
                              <xsl:text>Syn = </xsl:text>
                        </xsl:when>
                        <xsl:when test="@type = 'Antonym'">
                              <xsl:text>Syn = </xsl:text>
                        </xsl:when>
                        <xsl:when test="@type = 'similar reference'">
                              <xsl:text>Sim = </xsl:text>
                        </xsl:when>
                        <xsl:when test="@type = '_component-lexeme'">
                              <xsl:variable name="type" select="trait/@value"/>
                              <xsl:choose>
                                    <xsl:when test="$type = 'Dialectal Variant'">
                                          <xsl:text>Dialt Var = </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:comment select="concat('Unmatched _component-lexeme/trait/@value: ',$type[1])"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:comment select="concat('Unmatched relation/@type: ',@type[1])"/>
                        </xsl:otherwise>
                  </xsl:choose>
                  <xsl:value-of select="f:lookuprow($idlist,@ref)[1]"/>
            </xsl:element>
      </xsl:template>
      <!-- Start relation templates -->
      <xsl:template match="entry" mode="rel">
            <xsl:variable name="lx" select="lexical-unit/form/text"/>
            <xsl:if test="@id = $wanted">
                  <row a="{lexical-unit/form/text}" b="{@order}" c="{@id}"/>
                  <!--  <xsl:value-of select="lexical-unit/form/text"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="@order"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="@id"/>
                  <xsl:text>&#10;</xsl:text> -->
            </xsl:if>
            <xsl:apply-templates select="sense" mode="rel">
                  <xsl:with-param name="lx" select="$lx"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="sense" mode="rel">
            <xsl:param name="lx"/>
            <xsl:if test="@id = $wanted">
                  <row a="{$lx}" b="{@order}" c="{@id}"/>
                  <!-- <xsl:value-of select="parent::*/lexical-unit/form/text"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="@order"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="@id"/>
                  <xsl:text>&#10;</xsl:text> -->
            </xsl:if>
      </xsl:template>
      <xsl:template match="text()" mode="rel"/>
      <xsl:function name="f:lookuprow">
            <xsl:param name="array"/>
            <xsl:param name="find"/>
            <xsl:for-each select="$array/row">
                  <xsl:if test="@c= $find">
                        <xsl:value-of select="@a"/>
                  </xsl:if>
            </xsl:for-each>
      </xsl:function>
</xsl:stylesheet>
