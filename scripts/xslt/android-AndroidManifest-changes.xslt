<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">
      <xsl:param name="icon-name"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="uses-permission"/>
      <xsl:template match="@android:icon">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="concat('@drawable/',$icon-name)"/>
            </xsl:attribute>
      </xsl:template>
      <xsl:template match="@android:debuggable">
            <xsl:attribute name="{name()}">
                  <xsl:value-of select="'false'"/>
            </xsl:attribute>
      </xsl:template>
</xsl:stylesheet>
