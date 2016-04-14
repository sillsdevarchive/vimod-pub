<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     app-framework-head.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="head">
            <xsl:param name="isapphome" select="'false'"/>
            <xsl:param name="addredirect" select="'false'"/>
            <xsl:param name="addapplemeta" select="'false'"/>
            <xsl:param name="purecss" select="'false'"/>
            <xsl:param name="ratchet" select="'false'"/>
            <xsl:param name="silpdict" select="'false'"/>
            <xsl:param name="hammer" select="'false'"/>
            <xsl:param name="android" select="'false'"/>
            <xsl:param name="appcss" select="'false'"/>
            <xsl:param name="isinroot"/>
            <xsl:variable name="rootpath">
                  <xsl:choose>
                        <xsl:when test="$isinroot = $true">
                              <xsl:text></xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text>../</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <head>
                  <meta charset="utf-8"/>
                  <title>
                        <!-- Ratchet template page  -->
                        <xsl:value-of select="$title"/>
                  </title>
                  <meta name="generator" content="Vimod-Pub ff-dict"/>
                  <xsl:element name="meta">
                        <xsl:attribute name="name">
                              <xsl:text>created</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="content">
                              <xsl:value-of select="current-dateTime()"/>
                        </xsl:attribute>
                  </xsl:element>
                  <!-- Sets initial viewport load and disables zooming  -->
                  <xsl:if test="$isapphome = $true">
                        <meta name="viewport" content="initial-scale=1, maximum-scale=1"/>
                  </xsl:if>
                  <xsl:if test="addapplemeta">
                        <!-- Makes your prototype chrome-less once bookmarked to your phone's home screen -->
                        <meta name="apple-mobile-web-app-capable" content="yes"/>
                        <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
                  </xsl:if>
                  <xsl:if test="$addredirect = $true">
                        <meta http-equiv="refresh" content="1; url=main.html"/>
                  </xsl:if>
                  <xsl:if test="$hammer = $true">
                        <script type="text/javascript" src="{$rootpath}js/hammer.min.js"></script>
                        <script type="text/javascript">
var content = document.getElementById('content');

// create a simple instance
// by default, it only adds horizontal recognizers
var mc = new Hammer(content);

// listen to events...
mc.on("swipeleft swiperight", function(ev) {
    if (ev.type = 'swiperight') {
    document.getElementById('right').click();
} else if (ev.type = 'swipeleft') {
    document.getElementById('left').click();
} 
});
</script>
                  </xsl:if>
                  <xsl:if test="$purecss = $true">
                        <link href="{$rootpath}css/pure-menu-scrollable.css" rel="stylesheet"/>
                  </xsl:if>
                  <xsl:if test="$silpdict = $true">
                        <link href="{$rootpath}css/silpdict.css" rel="stylesheet"/>
                        <link href="{$rootpath}css/labels.css" rel="stylesheet"/>
                  </xsl:if>
                  <xsl:if test="$ratchet = $true">
                        <!-- Include the compiled Ratchet CSS -->
                        <link href="{$rootpath}css/ratchet.css" rel="stylesheet"/>
                        <!-- Include the compiled Ratchet JS -->
                        <script src="{$rootpath}js/ratchet.js"></script>
                        <xsl:if test="$android = $true">
                              <link href="{$rootpath}css/ratchet-theme-android.css" rel="stylesheet"/>
                        </xsl:if>
                  </xsl:if>
                  <xsl:if test="$appcss = $true">
                        <link href="{$rootpath}css/app.css" rel="stylesheet"/>
                  </xsl:if>
            </head>
      </xsl:template>
</xsl:stylesheet>
