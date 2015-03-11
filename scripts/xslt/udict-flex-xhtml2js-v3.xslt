<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	flex-xhtml2js-v3.xslt
    # Purpose:		makes a JavaScript file with two JSON arrays in variables for use in U-dict dictionary app
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <!--<xsl:character-map name="jsmap">
            <xsl:output-character character="&#34;" string="\&#34;"/>
            <xsl:output-character character="|" string="&#34;"/>
      </xsl:character-map> -->
      <xsl:strip-space elements="* div"/>
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="flex-func.xslt"/>
      <xsl:variable name="squote">'</xsl:variable>
      <xsl:variable name="dquote" select="'&#34;'"/>
      <xsl:variable name="edquote" select="'\&#34;'"/>
      <xsl:variable name="colon" select="':'"/>
      <xsl:variable name="lt" select="'&lt;'"/>
      <xsl:variable name="gt" select="'&gt;'"/>
      <xsl:variable name="fslash" select="'/'"/>
      <xsl:variable name="startarray" select="'['"/>
      <xsl:variable name="endarray" select="']'"/>
      <xsl:variable name="space" select="' '"/>
      <xsl:variable name="div" select="'div'"/>
      <xsl:variable name="bslash" select="'\'"/>
      <xsl:variable name="equals" select="'='"/>
      <xsl:template match="/">
            <xsl:text>// JavaScript Document&#10;function getLetters() {&#10;	return [</xsl:text>
            <xsl:apply-templates select="//*[@class = 'letData']" mode="index"/>
            <xsl:text>];&#10;}&#10;</xsl:text>
            <xsl:text>&#10;function getData() {&#10;	return [</xsl:text>
            <xsl:apply-templates select="//*[@class = 'letData']" mode="dict"/>
            <xsl:text>];&#10;}&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="*[@class = 'letData']" mode="index">
            <xsl:variable name="letter" select="preceding-sibling::*[1]/*"/>
            <xsl:text>{</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'letter'"/>
                  <xsl:with-param name="value" select="tokenize($letter,' ')[2]"/>
            </xsl:call-template>
            <xsl:text>,</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'index'"/>
                  <xsl:with-param name="value" select="number(count(preceding::*[@class = 'entry' or @class = 'minorentry']))"/>
                  <xsl:with-param name="type" select="'number'"/>
            </xsl:call-template>
            <xsl:text>,</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'count'"/>
                  <xsl:with-param name="value" select="count(*)"/>
                  <xsl:with-param name="type" select="'number'"/>
            </xsl:call-template>
            <xsl:text>}</xsl:text>
            <xsl:if test="following-sibling::*[@class = 'letData']">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[@class = 'letData']" mode="dict">
            <xsl:variable name="letindex" select="count(preceding-sibling::*[@class = 'letData'])"/>
            <xsl:variable name="precwordcount" select="count(preceding::*[@class = 'entry' or @class = 'minorentry'])"/>
            <xsl:apply-templates select="*">
                  <xsl:with-param name="letindex" select="$letindex"/>
                  <xsl:with-param name="precwordcount" select="$precwordcount"/>
            </xsl:apply-templates>
            <xsl:if test="following-sibling::*[@class = 'letData']">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[@class = 'entry' or @class = 'minorentry']">
            <xsl:param name="letindex"/>
            <xsl:param name="precwordcount"/>
            <xsl:variable name="word" select="normalize-space(*[@class = 'headword' or @class = 'headword-minor'])"/>
            <xsl:text>&#10;{</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'word'"/>
                  <xsl:with-param name="value" select="$word"/>
            </xsl:call-template>
            <xsl:text>,</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'sortWord'"/>
                  <xsl:with-param name="value" select="$word"/>
            </xsl:call-template>
            <!-- this needs a function to make letters regularized remove accents -->
            <xsl:text>,</xsl:text>
            <!-- English definitions -->
            <xsl:value-of select="concat($dquote,'definitions',$dquote,$colon,$startarray)"/>
            <xsl:apply-templates select="*[@class = 'senses']" mode="definition"/>
            <xsl:value-of select="$endarray"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="concat($dquote,'html',$dquote,$colon,$dquote)"/>
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:apply-templates select="@*" mode="html"/>
            <xsl:text>&gt;</xsl:text>
            <xsl:apply-templates select="*" mode="html"/>
            <xsl:value-of select="concat($lt,$fslash,name(),$gt)"/>
            <!-- get the html and reformat for inclusion in JSON file -->
            <xsl:text>",</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'index'"/>
                  <xsl:with-param name="value" select="position() + $precwordcount - 1"/>
            </xsl:call-template>
            <xsl:text>,</xsl:text>
            <xsl:call-template name="jsonpair">
                  <xsl:with-param name="name" select="'letterIndex'"/>
                  <xsl:with-param name="value" select="$letindex"/>
            </xsl:call-template>
            <xsl:text>}</xsl:text>
            <xsl:if test="following-sibling::*[@class = 'entry' or @class = 'minorentry']">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
      <!--
      <xsl:template match="*[@class = 'senses']">
            <xsl:apply-templates select="*[@class = 'sense']"/>
      </xsl:template> -->
      <xsl:template match="*[@class = 'sense']" mode="definition">
            <xsl:apply-templates select="*[@class = 'definition']" mode="definition">
                  <xsl:with-param name="notlast" select="following-sibling::*[@class = 'sense']"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="*[@class = 'grammatical-info']" mode="definition"/>
      <xsl:template match="*[@class = 'definition']" mode="definition">
            <xsl:param name="notlast"/>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="*[1]"/>
            <xsl:text>"</xsl:text>
            <xsl:if test="$notlast">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
      <!-- <xsl:template match="*" mode="html">
            <xsl:copy>
                  <xsl:apply-templates select="@*" mode="html"/>
            </xsl:copy>
            <xsl:apply-templates select="*" mode="html"/>
      </xsl:template>
      <xsl:template match="@*" mode="html">
            <xsl:copy-of select="."/>
      </xsl:template>-->
      <xsl:template match="br" mode="html">
            <xsl:value-of select="concat($lt,name(),$space,$fslash,$gt)"/>
      </xsl:template>
      <xsl:template match="*" mode="html">
            <!-- generic element handling to output html tags as text with handling for attributes -->
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:apply-templates select="@*" mode="html"/>
            <xsl:text>&gt;</xsl:text>
            <xsl:apply-templates select="node()" mode="html"/>
            <xsl:value-of select="concat($lt,$fslash,name(),$gt)"/>
      </xsl:template>
      <xsl:template match="@*" mode="html">
            <!-- output attributes as text with escaped quotes -->
            <xsl:variable name="name" select="name()"/>
            <xsl:value-of select="concat($space,$name,$equals,$edquote,.,$edquote)"/>
      </xsl:template>
      <xsl:template match="@xml:space" mode="html"/>
      <xsl:template match="@href" mode="html">
            <!-- special handling for href -->
            <xsl:variable name="name" select="'onclick'"/>
            <xsl:value-of select="concat($space,$name,$equals,$edquote,'selectByIndex(',f:link(.),', 2)',$edquote)"/>
      </xsl:template>
      <xsl:template match="text()" mode="html">
            <xsl:value-of select="replace(.,'&#34;','\\&#34;')"/>
      </xsl:template>
      <xsl:template name="jsonpair">
            <xsl:param name="name"/>
            <xsl:param name="value"/>
            <xsl:param name="type"/>
            <xsl:choose>
                  <xsl:when test="$type = 'number'">
                        <xsl:value-of select="concat($dquote,$name,$dquote,$colon,$value)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat($dquote,$name,$dquote,$colon,$dquote,$value,$dquote)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
