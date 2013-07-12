<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx2dbs_mobile.xsl
    # Purpose:     Generate mobile book index
    #
    # Author:      Greg Trihus <greg_trihus@sil.org>
    #
    # Created:     2013/05/15
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################
    # Modified    2013/06/04 by Ian McQuay <ian_mcquay@sil.org
    # 		       Changed to xslt2	
    #		       Modularised and source file is dbsParams.xml file
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
      <xsl:param name="cssfile" select="'../css/mobile.css'"/>
      <xsl:template match="/params">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
            <html lang="en">
                  <head>
                        <title>
                              <xsl:value-of select="//title/text()"/>
                        </title>
                        <meta content="text/html; charset=UTF-8" http-equiv="content-type"/>
                        <meta charset="UTF-8"/>
                        <meta name="viewport" content="width=device-width, initial-scale=1"/>
                        <link href="{$cssfile}" rel="stylesheet"/>
                  </head>
                  <body>
                        <xsl:apply-templates select="head"/>
                        <xsl:apply-templates select="bookCode"/>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="bookCode">
            <div data-role="content" class="flexcroll">
                  <div>
                        <xsl:attribute name="id">
                              <xsl:text>nt_</xsl:text>
                              <xsl:value-of select="//iso/text()"/>
                        </xsl:attribute>
                        <h1>
                              <xsl:value-of select="//title/text()"/>
                        </h1>
                        <div class="index-tab">
                              <dl>
                                    <dt>
                                          <xsl:text>Old Testament</xsl:text>
                                    </dt>
                                    <xsl:apply-templates select="book[@section = 'ot']"/>
                              </dl>
                        </div>
                        <div class="index-tab">
                              <dl>
                                    <dt>
                                          <xsl:text>New Testament</xsl:text>
                                    </dt>
                                    <xsl:apply-templates select="book[@section = 'nt']"/>
                              </dl>
                        </div>
                  </div>
            </div>
      </xsl:template>
      <xsl:template match="book">
            <!--  <xsl:variable name="idxName">
                                                            <xsl:text>StudyBible/content/Bibles/nt_</xsl:text>
                                                            <xsl:value-of select="//iso/text()"/>
                                                            <xsl:text>/</xsl:text>
                                                            <xsl:value-of select="@osis"/>
                                                            <xsl:text>_index.html</xsl:text>
                                                      </xsl:variable> -->
            <xsl:if test="@include = 'true'">
                  <dd>
                        <a>
                              <xsl:attribute name="href">
                                    <xsl:value-of select="@code"/>
                                    <xsl:text>_index.html</xsl:text>
                              </xsl:attribute>
                              <xsl:value-of select="./text()"/>
                        </a>
                  </dd>
            </xsl:if>
      </xsl:template>
      <xsl:template match="head">
            <a href="index.html" class="index-header-logo"></a>
            <div data-role="header">
                  <h1>
                        <xsl:value-of select="//title/text()"/>
                  </h1>
                  <xsl:if test="//library/@disable != 'yes'">
                        <a href="#">
                              <div class="index-icon-library"></div>
                              <p>
                                    <xsl:value-of select="//library/text()"/>
                              </p>
                        </a>
                  </xsl:if>
                  <xsl:if test="count(//video/@disable) = 0">
                        <a href="../../../../../Video/000_Movies/_/playlist.html">
                              <div class="index-icon-video"></div>
                              <p>
                                    <xsl:value-of select="//video/text()"/>
                              </p>
                        </a>
                  </xsl:if>
                  <xsl:if test="count(//audio/@disable) = 0">
                        <a href="../../../../../Audio/Bible/_/playlist.html">
                              <div class="index-icon-audio"></div>
                              <p>
                                    <xsl:value-of select="//audio/text()"/>
                              </p>
                        </a>
                  </xsl:if>
                  <xsl:if test="count(//music/@disable) = 0">
                        <a href="Audio/Music/_/index.html">
                              <div class="index-icon-music"></div>
                              <p>
                                    <xsl:value-of select="//music/text()"/>
                              </p>
                        </a>
                  </xsl:if>
                  <xsl:if test="count(//art/@disable) = 0">
                        <a href="../../../../Images/_/01-gen.html">
                              <div class="index-icon-pictures"></div>
                              <p>
                                    <xsl:value-of select="//art/text()"/>
                              </p>
                        </a>
                  </xsl:if>
                  <xsl:if test="count(//about/@disable) = 0">
                        <a href="../../../../../_/aboutus.html">
                              <div class="index-icon-about"></div>
                              <p>
                                    <xsl:value-of select="//about/text()"/>
                              </p>
                        </a>
                  </xsl:if>
            </div>
            <div data-role="sidebar">
                  <a>
                        <xsl:attribute name="href">
                              <xsl:text>#nt_</xsl:text>
                              <xsl:value-of select="//iso/text()"/>
                        </xsl:attribute>
                        <xsl:value-of select="//title/text()"/>
                  </a>
            </div>
      </xsl:template>
</xsl:stylesheet>
