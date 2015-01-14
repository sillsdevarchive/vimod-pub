<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	dict-silp2js.xslt
    # Purpose:		makes a JavaScript file with two JSON arrays in variables for use in U-dict dictionary app
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:strip-space elements="*"/>
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-xml-in-json.xslt"/>
      <xsl:include href='project.xslt'/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href='inc-css-common-param.xslt'/>
      <xsl:include href='../../scripts/xslt/inc-dict-make-control-lists.xslt'/>
      <xsl:include href='../../scripts/xslt/inc-dict-sense-hom.xslt'/>
      <!-- sense and homonym templates -->
      <xsl:include href='../../scripts/xslt/inc-dict-link.xslt'/>
      <!-- hyperlink handling -->
      <xsl:include href='../../scripts/xslt/inc-dict-table.xslt'/>
      <xsl:include href='../../scripts/xslt/inc-char-map-silp.xslt'/>
      <xsl:variable name="squot">'</xsl:variable>
      <xsl:template match="/*">
            <xsl:text>// JavaScript Document&#10;function getLetters() {&#10;	return [</xsl:text>
            <xsl:apply-templates select="//*[@class = 'letData']" mode="index"/>
            <xsl:text>];&#10;}&#10;</xsl:text>
            <xsl:text>&#10;function getData() {&#10;	return [</xsl:text>
            <xsl:apply-templates />
            <xsl:text>];&#10;}&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="*[@class = 'letData']" mode="index"><!-- this needs redoing -->
            <xsl:variable name="letter" select="preceding-sibling::*[1]/*"/>
            <xsl:text>{"letter":"</xsl:text>
            <xsl:value-of select="tokenize($letter,' ')[2]"/>
            <xsl:text>","index":</xsl:text>
            <xsl:value-of select="count(preceding::*[@class = 'entry' or @class = 'minorentry'])"/>
            <xsl:text>,"count":</xsl:text>
            <xsl:value-of select="count(*)"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="following-sibling::*[@class = 'letData']">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="body">
            <xsl:text>&#10;&#9;&#9;{"word":"</xsl:text>
            <xsl:value-of select="@word"/>
            <xsl:text>","sortWord":"</xsl:text>
            <xsl:value-of select="@word"/>
            <!-- this maybe needs a function to make letters regularized remove accents -->
            <xsl:text>","definitions":[</xsl:text>
            <xsl:apply-templates select="*[@class = 'senses']"/>
            <xsl:text>],"html":"</xsl:text>
            <!-- the apply-templates uses the three included templates from inc-xml-in-json.xslt  -->
            <xsl:apply-templates mode="xml-in-json"/>
            <xsl:text>","index":</xsl:text>
            <xsl:value-of select="@lxno"/>
            <xsl:text>,"letterIndex":</xsl:text>
            <!-- this letterIndex should be a number not a letter -->
            <xsl:value-of select="substring(@word,1,1)"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="not(last())">
                  <xsl:text>,</xsl:text>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
