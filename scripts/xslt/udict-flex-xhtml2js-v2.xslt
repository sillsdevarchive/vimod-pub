<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	flex-xhtml2js-v2.xslt
    # Purpose:		makes a JavaScript file with two JSON arrays in variables for use in U-dict dictionary app
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:character-map name="jsmap">
            <xsl:output-character character="&#34;" string="\&#34;"/>
            <xsl:output-character character="|" string="&#34;"/>
      </xsl:character-map>
      <xsl:strip-space elements="* div"/>
      <xsl:output method="xml" encoding="utf-8" use-character-maps="jsmap"/>
      <xsl:include href="flex-func.xslt"/>
      <xsl:variable name="squot">'</xsl:variable>
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
            <xsl:text>{|letter|:|</xsl:text>
            <xsl:value-of select="tokenize($letter,' ')[2]"/>
            <xsl:text>|,|index|:</xsl:text>
            <xsl:value-of select="count(preceding::*[@class = 'entry' or @class = 'minorentry'])"/>
            <xsl:text>,|count|:</xsl:text>
            <xsl:value-of select="count(*)"/>
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
            <xsl:text>&#10;{|word|:|</xsl:text>
            <xsl:value-of select="$word"/>
            <xsl:text>|,|sortWord|:|</xsl:text>
            <xsl:value-of select="$word"/>
            <!-- this needs a function to make letters regularized remove accents -->
            <xsl:text>|,|definitions|:[</xsl:text>
            <xsl:apply-templates select="*[@class = 'senses']"/>
            <xsl:text>],|html|:|</xsl:text>
            <xsl:element name="{name()}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="@class"/>
                  </xsl:attribute>
                  <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:apply-templates mode="html"/>
            </xsl:element>
            <xsl:text>|,|index|:</xsl:text>
            <xsl:value-of select="position() + $precwordcount - 1"/>
            <xsl:text>,|letterIndex|:</xsl:text>
            <xsl:value-of select="$letindex"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="following-sibling::*[@class = 'entry' or @class = 'minorentry']">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template><!--
      <xsl:template match="*[@class = 'senses']">
            <xsl:apply-templates select="*[@class = 'sense']"/>
      </xsl:template> -->
      <xsl:template match="*[@class = 'sense']">
            <xsl:apply-templates select="*[@class = 'definition']">
                  <xsl:with-param name="notlast" select="following-sibling::*[@class = 'sense']"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="*[@class = 'definition']">
            <xsl:param name="notlast"/>
            <xsl:text>|</xsl:text>
            <xsl:value-of select="*[1]"/>
            <xsl:text>|</xsl:text>
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
      <xsl:template match="@*|node()"  mode="html">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"  mode="html"/>
            </xsl:copy>
      </xsl:template>
      <!--
      <xsl:template match="text()" mode="html">
            <xsl:value-of select="replace(replace(.,'&quot;','\\&quot;'),$squot,concat('\\',$squot))"/>
      </xsl:template> -->
</xsl:stylesheet>
