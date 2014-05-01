<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:		usx2usfm.xslt
    # Purpose:	Transform USX file back into USFM
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-04-22
    # Copyright:    (c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:strip-space elements="*"/>
      <xsl:template match="/*">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="para">
            <xsl:text>&#10;\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="book">
            <xsl:text>&#10;\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@code"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="chapter">
            <xsl:text>&#10;\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@number"/>
      </xsl:template>
      <xsl:template match="verse">
            <xsl:text>&#10;\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@number"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
<xsl:template match="note">
            <xsl:text>\</xsl:text>
            <xsl:value-of select="@style"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@caller"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
<xsl:text>\</xsl:text>
<xsl:value-of select="@style"/>
<xsl:text>*</xsl:text>
</xsl:template>
</xsl:stylesheet>
