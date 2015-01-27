<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx2dbs_index.xsl
    # Purpose:     Generate book index from usx
    #
    # Author:      Greg Trihus <greg_trihus@sil.org>
    #
    # Created:     2013/04/30
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LGPL>
    ################################################################
    # Modified    2013/06/04 by Ian McQuay <ian_mcquay@sil.org
    # 		       Changed to xslt2	
    #		       Modified so it get Params from the USXsimple file
    #		       Modified to work with usxsimple
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:param name="parampath"/>
    <xsl:variable name="header" select="document($parampath)//header"/>
    <xsl:variable name="bookName" select="//h"/>
<xsl:variable name="book" select="//book/@code"/>
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    
    <!-- Recursive copy template -->   
    <xsl:template match="node() | @*">
        <xsl:apply-templates select="node() | @*"/>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html lang="en">
            <head>
                <title>
                    <xsl:value-of select="$header/title/text()"/>
                    <xsl:text> &#151; </xsl:text>
                    <xsl:value-of select="$bookName"/>
                </title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="../../../css/mobile.css" rel="stylesheet" />
                <link href="../../../css/flexcrollstyles.css" rel="stylesheet" type="text/css" />
                <script type='text/javascript' src="../../../js/flexcroll.js">&#xA0;</script>
            </head>
            <body>
                <a href="index.html" class="index-header-logo"></a>
                <div data-role="header">
                    <h1>
                    <xsl:value-of select="$header/title/text()"/>
                    <xsl:text> &#151; </xsl:text>
                    <xsl:value-of select="$bookName"/>
                    </h1>
                    <xsl:if test="count($header/library/@disable) = 0">
                        <a href="#"><div class="index-icon-library"></div><p>
                            <xsl:value-of select="$header/library/text()"/>
                        </p></a>
                    </xsl:if>
                    <xsl:if test="count($header/video/@disable) = 0">
                        <a href="../../../../../Video/000_Movies/_/playlist.html"><div class="index-icon-video"></div><p>
                            <xsl:value-of select="$header/video/text()"/>
                        </p></a>
                    </xsl:if>
                    <xsl:if test="count($header/audio/@disable) = 0">
                        <a href="../../../../../Audio/Bible/_/playlist.html"><div class="index-icon-audio"></div><p>
                            <xsl:value-of select="$header/audio/text()"/>
                        </p></a>
                    </xsl:if>
                    <xsl:if test="count($header/music/@disable) = 0">
                        <a href="Audio/Music/_/index.html"><div class="index-icon-music"></div><p>
                            <xsl:value-of select="$header/music/text()"/>
                        </p></a>
                    </xsl:if>
                    <xsl:if test="count($header/art/@disable) = 0">
                        <a href="../../../../Images/_/01-gen.html"><div class="index-icon-pictures"></div><p>
                            <xsl:value-of select="$header/art/text()"/>
                        </p></a>
                    </xsl:if>
                    <xsl:if test="count($header/about/@disable) = 0">
                        <a href="../../../../../_/aboutus.html"><div class="index-icon-about"></div><p>
                            <xsl:value-of select="$header/about/text()"/>
                        </p></a>
                    </xsl:if>
                </div>
                <div data-role="content"  class="flexcroll">
                    <dl>
                        <xsl:apply-templates/>
                    </dl>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="c">
        <xsl:variable name="name">
            <xsl:value-of select="$book"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="string(@number)"/>
            <xsl:text>.html</xsl:text>
        </xsl:variable>
        <dd><a href="{$name}">
            <xsl:value-of select="string(@number)"/>
        </a></dd>
    </xsl:template>

</xsl:stylesheet>