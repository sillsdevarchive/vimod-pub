<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:        	epub-xhtml2f-func .xslt
    # Purpose:	create a xslt function that contains footnotes and cross references from the xhtml file. Created before running epub-xhtml2usfm.xslt
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014/03/11
    # Copyright:   	(c) 2013 SIL International
    # Licence:      	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="xsl">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
    <xsl:param name="f-caller" select="'+'"/>
    <xsl:param name="x-caller" select="'-'"/>
    <xsl:template match="/">
        <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <gen:function name="f:refmatch">
                <gen:param name="string"/>
                <gen:variable name="ref" select="substring($string,1,1)"/>
                <gen:choose>
                    <gen:when test="$string = 'xxxxx'"></gen:when>
                    <xsl:apply-templates select="descendant::*[@class = 'NoteFrame']"/>
                    <xsl:text>&#10;</xsl:text>
                    <gen:otherwise>
                        <gen:value-of select="concat('\',$ref,' ???\',$ref,'*')"/>
                    </gen:otherwise>
                </gen:choose>
            </gen:function>
        </gen:stylesheet>
    </xsl:template>
    <xsl:template match="*[@class = 'NoteFrame']">
        <xsl:apply-templates select="*[@class = 'f' or @class = 'x']"/>
    </xsl:template>
    <xsl:template match="*[@class = 'f']">
        <!-- The following is needed for when a xref is put in a f paragraph in error -->
        <xsl:apply-templates select="spanGroup" mode="footnote"/>
    </xsl:template>
    <xsl:template match="*[@class = 'x' ]">
        <!-- The following is needed for when a xref is put in a f paragraph in error -->
        <xsl:apply-templates select="spanGroup" mode="xref"/>
    </xsl:template>
    <xsl:template match="spanGroup" mode="xref">
        <xsl:variable name="id" select="tokenize(*[1],'_')[2]"/>
        <xsl:element name="xsl:when">
            <xsl:attribute name="test">
                <xsl:text>$string = '</xsl:text>
                <xsl:value-of select="$id"/>
                <xsl:text>'</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="concat('\x ',$x-caller,' ')"/>
            <xsl:apply-templates mode="xref"/>
            <xsl:text>\x*</xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="spanGroup" mode="footnote">
        <xsl:variable name="id" select="tokenize(*[1],'_')[2]"/>
        <xsl:element name="xsl:when">
            <xsl:attribute name="test">
                <xsl:text>$string = '</xsl:text>
                <xsl:value-of select="$id"/>
                <xsl:text>'</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="concat('\x ',$f-caller,' ')"/>
            <xsl:apply-templates mode="footnote"/>
            <xsl:text>\f*</xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="*" mode="xref">
        <xsl:variable name="classname" select="tokenize(@class,' ')"/>
        <xsl:choose>
            <xsl:when test="$classname = 'xo'">
                <xsl:value-of select="concat('\',$classname,' ')"/>
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="$classname = 'xt' ">
                <xsl:value-of select="concat('\',$classname,' ')"/>
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="$classname = 'xq' ">
                <xsl:value-of select="concat('\',$classname,' ')"/>
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="$classname = 'it'">
                <xsl:value-of select="concat('\',$classname,' ')"/>
                <xsl:value-of select="."/>
                <xsl:value-of select="concat('\',$classname,'*')"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="*" mode="footnote">
        <xsl:variable name="classname" select="tokenize(@class,' ')"/>
        <xsl:choose>
            <xsl:when test="$classname = 'fr' or $classname = 'ft'  or $classname = 'fq' ">
                <xsl:value-of select="concat('\',$classname,' ')"/>
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="$classname = 'it'">
                <xsl:value-of select="concat(' \',$classname,' ')"/>
                <xsl:value-of select="."/>
                <xsl:value-of select="concat('\',$classname,'*')"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
