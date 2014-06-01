<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	booknames2YETbookdata.xslt
    # Purpose:		Transform a Paratext booknames.xml file into a tab data file
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-05-27
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="separator" select="'='"/>
      <xsl:param name="bookorderfile" select="'D:\All-SIL-Publishing\vimod-pub\resources\book-chaps.txt'"/>
      <xsl:param name="alkitabnumbfile" select="'D:\All-SIL-Publishing\vimod-pub\resources\PT-numb-code2alkitab-no-xref.txt'"/>
      <xsl:variable name="bookorderlist" select="unparsed-text(f:file2uri($bookorderfile))"/>
      <xsl:variable name="alkitabnumblist" select="unparsed-text(f:file2uri($alkitabnumbfile))"/>
      <xsl:template match="/*">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="book">
            <xsl:if test="string-length(@short) gt 0 and number(f:ptbkno(@code)) lt $booksbelow and number(f:ptbkno(@code)) gt 0">
                  <xsl:value-of select="f:ptbkno(@code)"/>
                  <xsl:value-of select="$separator"/>
                  <xsl:value-of select="@code"/>
                  <xsl:value-of select="$separator"/>
                  <xsl:value-of select="@short"/>
                  <xsl:value-of select="$separator"/>
                  <xsl:value-of select="@abbr"/>
                  <xsl:value-of select="$separator"/>
                  <xsl:value-of select="f:xrefno(@code)"/>
                  <xsl:text>&#13;&#10;</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:function name="f:ptbkno">
            <!-- function to match book @code to Paratext book number-->
            <xsl:param name="string"/>
            <xsl:call-template name="lookup">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$bookorderlist"/>
                  <xsl:with-param name="errortext" select="'ptbkno'"/>
                  <xsl:with-param name="finditem" select="2"/>
                  <xsl:with-param name="returnitem" select="1"/>
                  <xsl:with-param name="primaryseparator" select="'\r\n'"/>
                  <xsl:with-param name="secondaryseparator" select="' '"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:xrefno">
            <!-- function to match ver short book to Alkitab xref number-->
            <xsl:param name="string"/>
            <xsl:call-template name="lookup">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$alkitabnumblist"/>
                  <xsl:with-param name="errortext" select="'ptbkno'"/>
                  <xsl:with-param name="finditem" select="2"/>
                  <xsl:with-param name="returnitem" select="4"/>
                  <xsl:with-param name="primaryseparator" select="'\r\n'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
            </xsl:call-template>
      </xsl:function>
</xsl:stylesheet>
