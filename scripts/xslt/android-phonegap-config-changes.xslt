<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="revurl"/>
    <xsl:param name="appname"/>
    <xsl:param name="description" select="'Simple Scripture reader for Android'"/>
    <xsl:param name="puburl" select="'www.wycliffe.org'"/>
    <xsl:param name="pubemail" select="'info@wycliffe.org'"/>
    <xsl:param name="pubgroup" select="'Asia Publishing'"/>
    <xsl:include href="inc-copy-anything.xslt"/>
    <xsl:template match="@id">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="$revurl"/>
        </xsl:attribute>
        
    </xsl:template>
    <xsl:template match="*:name">
        <xsl:copy>
            <xsl:value-of select="$appname"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*:description">
        <xsl:copy>
            <xsl:value-of select="$description"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@href" mode="author">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="$puburl"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="@email" mode="author">
        <xsl:attribute name="{name()}">
            <xsl:value-of select="$pubemail"/>
        </xsl:attribute>
    </xsl:template>
    <xsl:template match="*:author">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="author"/>
            <xsl:value-of select="$pubgroup"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
