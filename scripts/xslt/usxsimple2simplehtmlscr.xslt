<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx2-chap-grp2simplehtmlscr.xslt
    # Purpose:     Generate html from combined usx chapter grouped file
    #
    # Author:      Ian McQuay <ian_mcquay@sil.org>
    #
    # Created:     2013/07/05
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LGPL>
    # Adapted from work by Greg Trihus of SIL International
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output encoding="UTF-8" method="xml" name="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:output method="text"/>
      
      
      <xsl:param name="parampath"/>
      <xsl:param name="outpath"/>
      <xsl:param name="vol" select="'nt'"/>
      <xsl:param name="copyright" select="'2013 Wycliffe'"/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:variable name="bookhandle" select="/usx/book/@code"/>
      <xsl:variable name="book" select="/usx/book/@code"/>
      <xsl:variable name="bookname" select="/usx/hGroup/h"/>
      <xsl:variable name="header" select="document($parampath)//header"/>
      <xsl:variable name="iso" select="document($parampath)//iso/text()"/>
      <xsl:variable name="lang" select="document($parampath)//lang/text()"/>
      <xsl:variable name="dir" select="document($parampath)//dir/text()"/>
      <xsl:include href='usfm-chap-before-after.xslt'/>
      <xsl:template match="/usx">
            <xsl:for-each select="cGroup">
                  <xsl:variable name="chapter" select="c/@number"/>
                  <xsl:call-template name="writehtmlpage">
                        <xsl:with-param name="filename" select="concat($outpath,$bookhandle,'.',$chapter,$posturl)"/>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="writehtmlpage">
            <xsl:param name="filename"/>
            <xsl:param name="chapter"/>
            <xsl:value-of select="$chapter"/>
            <xsl:text disable-output-escaping='yes'>
</xsl:text>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <head>
                              <title>
                                    <xsl:value-of select="$bookname"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$chapter"/>
                                    <xsl:text>  (</xsl:text>
                                    <xsl:value-of select="$iso"/>
                                    <xsl:text>)</xsl:text>
                              </title>
                              <meta charset="UTF-8"/>
                              <meta name="viewport" content="width=device-width, initial-scale=1"/>
                              <link href="../css/mobile.css" rel="stylesheet"/>
                        </head>
                        <body>
                              <!-- <a href="../../../../../index.html" class="index-header-logo"></a> -->
                              <div data-role="header">
                                    <h1>
                                          <a data-icon="arrow-l">
                                                <xsl:attribute name="href">
                                                      <xsl:call-template name="chaptbefore">
                                                            <xsl:with-param name="curchap" select="$chapter"/>
                                                            <xsl:with-param name="string" select="$book"/>
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptbefore">
                                                      <xsl:with-param name="curchap" select="$chapter"/>
                                                      <xsl:with-param name="string" select="$book"/>
                                                </xsl:call-template>
                                          </a>
                                          <a href="../index/{$book}_index.html" data-icon="home">Chapters</a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:call-template name="chaptafter">
                                                            <xsl:with-param name="curchap" select="$chapter "/>
                                                            <xsl:with-param name="string" select="$book"/>
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptafter">
                                                      <xsl:with-param name="curchap" select="$chapter "/>
                                                      <xsl:with-param name="string" select="$book"/>
                                                </xsl:call-template>
                                          </a>
                                    </h1>
                              </div>
                              <!--      <div data-role="sidebar">
                                    <xsl:for-each select="//c">
                                          <xsl:variable name="name">
                                                <xsl:value-of select="$book"/>
                                                <xsl:text>.</xsl:text>
                                                <xsl:value-of select="string(@number)"/>
                                                <xsl:text>.html</xsl:text>
                                          </xsl:variable>
                                          <a href="{$name}">
                                                <xsl:value-of select="string(@number)"/>
                                          </a>
                                    </xsl:for-each>
                              </div> -->
                              <div data-role="content" class="flexcroll">
                                    <div class="chapter {$iso} {$vol} {$book}_{c/@number}">
                                          <xsl:apply-templates>
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                          </xsl:apply-templates>
                                    </div>
                                    <div class="endnote">
                                          <xsl:apply-templates select="current()//f" mode="endnote">
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                          </xsl:apply-templates>
                                    </div>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="c">
            <xsl:param name="chapter"/>
            <h1 class="book-name">
                  <xsl:choose>
                        <xsl:when test="@number = '1'">
                              <xsl:value-of select="//mt"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="$bookname"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </h1>
            <h2 class="{local-name()}">
                  <xsl:value-of select="$chapter"/>
            </h2>
      </xsl:template>
      <xsl:template match="*[@usx = 'para']">
            <xsl:param name="chapter"/>
            <!-- paragraph elements -->
            <div class="{local-name()}">
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </div>
      </xsl:template>
      <xsl:template match="*">
            <xsl:param name="chapter"/>
            <!-- span elements -->
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:value-of select="local-name()"/>
                  </xsl:attribute>
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </xsl:element>
      </xsl:template>
      <xsl:template match="fr|ft|fq|fqa">
            <xsl:param name="chapter"/>
            <!-- inline footnote text handling -->
            <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
            <xsl:text> </xsl:text>
      </xsl:template>
      <xsl:template match="f">
            <xsl:param name="chapter"/>
            <!-- inline note handling -->
            <xsl:variable name="count" select="count(preceding::f[@curchap = $chapter]) + 1"/>
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:text>#f-</xsl:text>
                        <xsl:number value="$count" format="a"/>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                        <xsl:apply-templates select="*">
                              <xsl:with-param name="chapter" select="$chapter"/>
                        </xsl:apply-templates>
                  </xsl:attribute>
                  <xsl:attribute name="class">
                        <xsl:text>caller</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="id">
                        <xsl:text>c-</xsl:text>
                        <xsl:number value="$count" format="a"/>
                  </xsl:attribute>
                  <xsl:number value="$count" format="a"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="f" mode="endnote">
            <xsl:param name="chapter"/>
            <!-- endnote handling -->
            <xsl:variable name="count" select="count(preceding::f[@curchap = $chapter]) + 1"/>
            <p class="note">
                  <xsl:element name="a">
                        <xsl:attribute name="href">
                              <xsl:text>#c-</xsl:text>
                              <xsl:number value="$count" format="a"/>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                              <xsl:text>caller</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="id">
                              <xsl:text>f-</xsl:text>
                              <xsl:number value="$count" format="a"/>
                        </xsl:attribute>
                        <xsl:number value="$count" format="a"/>
                  </xsl:element>
                  <xsl:apply-templates select="*" mode="endnote">
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </p>
      </xsl:template>
      <xsl:template match="fr|ft|fq|fqa" mode="endnote">
            <xsl:param name="chapter"/>
            <span class="{local-name()}">
                  <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
                  <xsl:text> </xsl:text>
            </span>
      </xsl:template>
      <xsl:template match="s">
            <xsl:param name="chapter"/>
            <h3>
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </h3>
      </xsl:template>
      <xsl:template match="r">
            <xsl:param name="chapter"/>
            <h4>
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </h4>
      </xsl:template>
      <xsl:template match="sr">
            <xsl:param name="chapter"/>
      </xsl:template>
      <xsl:template match="b">
            <xsl:param name="chapter"/>
            <br/>
      </xsl:template>
      <xsl:template match="v">
            <xsl:param name="chapter"/>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>verse-num v-</xsl:text>
                        <xsl:value-of select="@number"/>
                  </xsl:attribute>
                  <xsl:value-of select="@number"/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
