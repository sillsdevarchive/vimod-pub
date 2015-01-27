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
      <xsl:include href='usfm-chap-before-after.xslt'/>
      <xsl:param name="parampath"/>
      <xsl:variable name="header" select="document($parampath)//header"/>
      <xsl:variable name="bookName" select="//h"/>
      <xsl:variable name="book" select="//book/@code"/>
      <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
      <!-- Recursive copy template to get process node tree only elements specifically found below will be output-->
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
                        <meta charset="UTF-8"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1"/>
                        <link href="../css/mobile.css" rel="stylesheet" type="text/css"/>
                  </head>
                  <body>
                        <a href="index.html" class="index-header-logo"></a>
                        <div data-role="header">
                              <h1>
                                    <a data-icon="arrow-l">
                                          <xsl:attribute name="href">
                                                <xsl:text>../index/</xsl:text>
                                                <xsl:call-template name="bookbefore">
                                                      <xsl:with-param name="string" select="$book"/>
                                                </xsl:call-template>
                                                <xsl:text>.html</xsl:text>
                                          </xsl:attribute>
                                          <xsl:call-template name="bookbefore">
                                                <xsl:with-param name="string" select="$book"/>
                                          </xsl:call-template>
                                    </a>
                                    <a href="../index/index.html" data-icon="home">Home</a>
                                    <a data-icon="arrow-r">
                                          <xsl:attribute name="href">
                                                <xsl:text>../index/</xsl:text>
                                                <xsl:call-template name="bookafter">
                                                      <xsl:with-param name="string" select="$book "/>
                                                </xsl:call-template>
                                                <xsl:text>.html</xsl:text>
                                          </xsl:attribute>
                                          <xsl:call-template name="bookafter">
                                                <xsl:with-param name="string" select="$book "/>
                                          </xsl:call-template>
                                    </a>
                              </h1>
                        </div>
                        <div data-role="content" class="flexcroll">
                              <h2>
                                    <xsl:value-of select="$header/title/text()"/>
                              </h2>
                              <dl>
                                    <dt>
                                          <xsl:value-of select="$bookName"/>
                                    </dt>
                                    <xsl:apply-templates/>
                              </dl>
                        </div>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="//c">
            <xsl:variable name="name">
                  <xsl:text>../chap/</xsl:text>
                  <xsl:value-of select="$book"/>
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="string(@number)"/>
                  <xsl:text>.html</xsl:text>
            </xsl:variable>
            <dd>
                  <a href="{$name}">
                        <xsl:value-of select="string(@number)"/>
                  </a>
            </dd>
      </xsl:template>
</xsl:stylesheet>
