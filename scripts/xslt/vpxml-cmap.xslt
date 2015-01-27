<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:  		vp2xml-tags.xslt
    # Purpose:	variables for agt 1992 vp typesetting
    # Used with:	Vimod Pub - http://projects.palaso.org/projects/vimod-pub 
    # Subproject:	ventura2usfm
    # Author:  		Ian McQuay <ian_mcquay.org>
    # Created:  	2014-03-10
    # Copyright:    (c) 2014 SIL International
    # Licence: 	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:character-map name="cmap">
            <xsl:output-character character="&#x007F;" string="-"/>
            <xsl:output-character character="&#96;" string="&#x2018;"/>
            <xsl:output-character character="&#39;" string="&#x2019;"/>
      </xsl:character-map>

      <xsl:function name="f:replaceencodedchars">
            <!-- Replace encoded characters  -->
            <xsl:param name="string"/>
            <xsl:variable name="rep0" select="replace($string,'\{%-?\d+\}','')"/>
            <!-- replace kerning markup -->
            <xsl:variable name="rep0b" select="replace($rep0,'\{R\}',' ')"/>
            <!-- remove new line breaks with space -->
            <xsl:variable name="rep1" select="replace($rep0b,'\{169\}','&#x201C;')"/>
            <!-- 169 becomes left double quote -->
            <xsl:variable name="rep2" select="replace($rep1,'\{170\}','&#x201D;')"/>
            <!-- 170 becomes right double quote -->
            <xsl:variable name="rep3" select="replace($rep2,'\{166\}','&#x0101;')"/>
            <!-- 166 becomes a with macron -->
            <xsl:value-of select="$rep3"/>
      </xsl:function>
</xsl:stylesheet>
    