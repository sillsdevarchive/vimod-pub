<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">
      <xsl:param name="icon-name"/>
      <xsl:param name="package"/>
      <xsl:param name="androidname"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="uses-permission"/>
      <xsl:template match="@android:icon">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="concat('@drawable/',$icon-name)"/>
            </xsl:attribute>
      </xsl:template>
<!--
      <xsl:template match="@android:debuggable">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="'false'"/>
            </xsl:attribute>
      </xsl:template>
      <xsl:template match="activity/@android:name">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="$androidname"/>
            </xsl:attribute>
      </xsl:template>
      <xsl:template match="@package">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="$package"/>
            </xsl:attribute>
      </xsl:template> -->
</xsl:stylesheet>
