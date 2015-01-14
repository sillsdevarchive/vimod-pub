<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name: 	inc-xml-in-json.xslt
    # Purpose:	For including xml/html markup into a json field. To be used by another xslt
    # Part of:  	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:    	Ian McQuay <ian_mcquay.org>
    # Created:  	2014-12 -19
    # Copyright:		(c) 2014 SIL International
    # Licence:  		<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="*" mode="xml-in-json">
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:apply-templates select="@*" mode="xml-in-json"/>
            <xsl:text>&gt;</xsl:text>
            <!-- the folloing line uses node() to include child elements and text that must have the double quotes escaped -->
            <xsl:apply-templates select="node()" mode="xml-in-json"/>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="@*" mode="xml-in-json">
            <!-- this creates attributes for JSON with escaped double quotes -->
            <xsl:text> </xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>=\&quot;</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>\&quot;</xsl:text>
      </xsl:template>
      <xsl:template match="text()" mode="xml-in-json">
            <!-- This creates text with escaped double quotes -->
            <xsl:value-of select="normalize-space(replace(replace(.,'&quot;','\\&quot;'),$squot,concat('\\',$squot)))"/>
      </xsl:template>
</xsl:stylesheet>