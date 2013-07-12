<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx2-chap-grp2simplehtmlscr.xslt
    # Purpose:     Generate html from combined usx chapter grouped file
    #
    # Author:      Ian McQuay <ian_mcquay@sil.org>
    #
    # Created:     2013/07/05
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    # Adapted from work by Greg Trihus of SIL International
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:silp="http://silp.org.ph/ns">
      <xsl:output encoding="UTF-8" method="xml" name="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:output method="text"/>
      <xsl:include href='usfm-chap-before-after.xslt'/>
      <xsl:param name="parampath"/>
      <xsl:param name="buildpath"/>
      <xsl:param name="title"/>
      <xsl:param name="dir"/>
      <xsl:param name="langname"/>
      <xsl:param name="iso"/>
      <xsl:param name="bookorderlist" select="unparsed-text(document(../../resources/book-chaps.txt))"/>
      <xsl:param name="vol" select="'nt'"/>
      <xsl:param name="introword" select="'Introduction'"/>
      <xsl:param name="copyright" select="'2013 Wycliffe'"/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:variable name="bookorder">
            <xsl:call-template name="list2xml3attrib">
                  <xsl:with-param name="text" select="$bookorderlist"/>
                  <xsl:with-param name="element" select="'book'"/>
                  <xsl:with-param name="first" select="'seq'"/>
                  <xsl:with-param name="second" select="'code'"/>
                  <xsl:with-param name="third" select="'chapters'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml-3attrib.xslt'/>
      <xsl:include href='bible-book-func.xslt'/>
      <xsl:template match="/">
            <xsl:apply-templates select="data" mode="bookindex"/>
            <xsl:for-each select="//chapterGroup">
                  <xsl:variable name="book" select="parent::usx/bookGroup/book/@code"/>
                  <xsl:variable name="bookname" select="parent::usx/bookGroup/para[@style = 'h']"/>
                  <xsl:variable name="chapter" select="chapter/@number"/>
                  <xsl:call-template name="writehtmlchapter">
                        <xsl:with-param name="filename" select="concat($buildpath,'chap\',$book,'.',$chapter,$posturl)"/>
                        <xsl:with-param name="chapter" select="$chapter"/>
                        <xsl:with-param name="chapcontent" select="''"/>
                        <xsl:with-param name="book" select="$book"/>
                        <xsl:with-param name="bookname" select="$bookname"/>
                  </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="//bookGroup">
                  <xsl:variable name="book" select="parent::usx/bookGroup/book/@code"/>
                  <xsl:variable name="bookname" select="parent::usx/bookGroup/para[@style = 'h']"/>
                  <xsl:call-template name="writehtmlbookintro">
                        <xsl:with-param name="filename" select="concat($buildpath,'chap\',$book,'.0',$posturl)"/>
                        <xsl:with-param name="book" select="$book"/>
                        <xsl:with-param name="bookname" select="$bookname"/>
                  </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="//usx">
                  <xsl:variable name="book" select="current()/bookGroup/book/@code"/>
                  <xsl:variable name="bookname" select="current()/bookGroup/para[@style = 'h']"/>
                  <xsl:call-template name="writehtmlchapterindex">
                        <xsl:with-param name="filename" select="concat($buildpath,'index\',$book,'_index',$posturl)"/>
                        <xsl:with-param name="book" select="$book"/>
                        <xsl:with-param name="bookname" select="$bookname"/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="writehtmlchapter">
            <xsl:param name="filename"/>
            <xsl:param name="chapter"/>
            <xsl:param name="chapcontent"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="concat($book,$chapter)"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$filename"/>
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
                                                            <xsl:with-param name="chaptbefore" select="$chapter - 1"/>
                                                            <xsl:with-param name="book" select="$book"/>
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptbefore">
                                                      <xsl:with-param name="curchap" select="$chapter"/>
                                                      <xsl:with-param name="chaptbefore" select="$chapter - 1"/>
                                                      <xsl:with-param name="book" select="$book"/>
                                                </xsl:call-template>
                                          </a>
                                          <a href="../index/{$book}_index.html#c{$chapter -1}" data-icon="home">Chapters</a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:call-template name="chaptafter">
                                                            <xsl:with-param name="curchap" select="$chapter"/>
                                                            <xsl:with-param name="chaptafter" select="$chapter  + 1"/>
                                                            <xsl:with-param name="book" select="$book"/>
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptafter">
                                                      <xsl:with-param name="curchap" select="$chapter "/>
                                                      <xsl:with-param name="chaptafter" select="$chapter  + 1"/>
                                                      <xsl:with-param name="book" select="$book"/>
                                                </xsl:call-template>
                                          </a>
                                    </h1>
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <div class="chapter {$iso} {$vol} {$book}_{c/@number}">
                                          <xsl:apply-templates>
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                                <xsl:with-param name="bookname" select="$bookname"/>
                                                <xsl:with-param name="book" select="$book"/>
                                               <xsl:with-param name="chapcontent" select="$chapcontent"/>
                                          </xsl:apply-templates>
                                    </div>
                                    <div class="endnote">
                                          <xsl:apply-templates select="current()//note" mode="endnote">
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                               <xsl:with-param name="chapcontent" select="$chapcontent"/>
                                          </xsl:apply-templates>
                                    </div>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="data" mode="bookindex">
            <xsl:param name="filename" select="concat($buildpath,'index\index',$posturl)"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <head>
                              <title>
                                    <xsl:value-of select="$title"/>
                              </title>
                              <meta charset="UTF-8"/>
                              <meta name="viewport" content="width=device-width, initial-scale=1"/>
                              <link href="../css/mobile.css" rel="stylesheet"/>
                        </head>
                        <body>
                              <h1>
                                    <xsl:value-of select="$title"/>
                              </h1>
                              <dl>
                                    <xsl:for-each-group select="usx" group-by="silp:group(bookGroup/book/@code)">
                                          <xsl:sort select="silp:group(bookGroup/book/@code)"/>
                                          <xsl:sort select="silp:sequence(bookGroup/book/@code)"/>
                                          <xsl:variable name="book" select="bookGroup/book/@code"/>
                                          <dt>
                                                <xsl:value-of select="substring(silp:group(bookGroup/book/@code),2)"/>
                                          </dt>
                                          <xsl:for-each select="current-group()">
                                                <xsl:variable name="book" select="bookGroup/book/@code"/>
                                                <xsl:variable name="bookname" select="bookGroup/para[@style = 'h']"/>
                                                <dd>
                                                      <a href="../index/{$book}_index.html">
                                                            <xsl:value-of select="$bookname"/>
                                                      </a>
                                                </dd>
                                          </xsl:for-each>
                                    </xsl:for-each-group>
                              </dl>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="writehtmlbookintro">
            <xsl:param name="filename"/>
            <xsl:param name="chapter" select="'0'"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="$book"/>
            <xsl:text disable-output-escaping='yes'>
</xsl:text>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <head>
                              <title>
                                    <xsl:value-of select="$bookname"/>
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
                                          <a href="../index/{$book}_index.html#c{$chapter}" data-icon="home">Chapters</a>
                                          <a href="../chap/{$book}.1.html" data-icon="arrow-r">Chapter 1</a>
                                    </h1>
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <div class="intro {$book}">
                                          <xsl:apply-templates>
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                                <xsl:with-param name="bookname" select="$bookname"/>
                                          </xsl:apply-templates>
                                    </div>
                                    <div class="endnote">
                                          <xsl:apply-templates select="current()//note" mode="endnote">
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                          </xsl:apply-templates>
                                    </div>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="writehtmlchapterindex">
            <xsl:param name="filename"/>
            <xsl:param name="chapter"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="concat($book,$chapter)"/>
            <xsl:text disable-output-escaping='yes'>
</xsl:text>
            <xsl:result-document href="{$filename}" format="xml">
                  <!-- <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text> -->
                  <html lang="en">
                        <head>
                              <title>
                                    <xsl:value-of select="$bookname"/>
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
                                          <xsl:value-of select="$title"/>
                                    </h2>
                                    <dl>
                                          <dt>
                                                <xsl:value-of select="$bookname"/>
                                          </dt>
                                          <xsl:apply-templates select="chapterGroup/chapter" mode="index">
                                                <xsl:with-param name="book" select="$book "/>
                                          </xsl:apply-templates>
                                    </dl>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="chapter" mode="index">
            <xsl:param name="book"/>
            <xsl:variable name="name">
                  <xsl:text>../chap/</xsl:text>
                  <xsl:value-of select="$book"/>
                  <xsl:text>.</xsl:text>
                  <xsl:value-of select="string(@number)"/>
                  <xsl:text>.html</xsl:text>
            </xsl:variable>
            <dd>
                  <a href="{$name}" id="c{@number}">
                        <xsl:value-of select="string(@number)"/>
                  </a>
            </dd>
      </xsl:template>
      <xsl:template match="chapter">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:param name="book"/>
            <xsl:if test="$chapter = 1">
                  <h3>
                        <a href="{$book}.0.html">
                              <xsl:value-of select="$introword"/>
                        </a>
                  </h3>
            </xsl:if>
            <h1 class="book-name">
                  <xsl:value-of select="$bookname"/>
            </h1>
            <h2 class="{local-name()}">
                  <xsl:value-of select="$chapter"/>
            </h2>
      </xsl:template>
      <xsl:template match="para">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:param name="chapcontent"/>
            <!-- paragraph elements -->
            <div class="{@style}">
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                        <xsl:with-param name="chapcontent" select="$chapcontent"/>
                  </xsl:apply-templates>
            </div>
      </xsl:template>
      <xsl:template match="*">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <!-- span elements -->
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:value-of select="@style"/>
                  </xsl:attribute>
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </xsl:element>
      </xsl:template>
      <xsl:template match="fr|ft|fq|fqa">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <!-- inline footnote text handling -->
            <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
            <xsl:text> </xsl:text>
      </xsl:template>
      <xsl:template match="note">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:param name="chapcontent"/>
            <!-- inline note handling -->
            <xsl:variable name="count" select="count(ancestor::chapterGroup//preceding::note) + 1"/>
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
      <xsl:template match="note" mode="endnote">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:param name="chapcontent"/>
            <!-- endnote handling -->
            <xsl:variable name="count" select="count(ancestor::chapterGroup//preceding::note)  + 1"/>
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
            <xsl:param name="bookname"/>
            <span class="{local-name()}">
                  <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
                  <xsl:text> </xsl:text>
            </span>
      </xsl:template>
      <xsl:template match="text()" mode="endnote">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="b">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <br/>
      </xsl:template>
      <xsl:template match="verse">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>verse-num v-</xsl:text>
                        <xsl:value-of select="@number"/>
                  </xsl:attribute>
                  <xsl:value-of select="@number"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="para[@style = 'h']">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
      </xsl:template>
      <xsl:template match="para[@style = 'ide']">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
      </xsl:template>
      <xsl:template match="para[@style = 'toc1' or @style = 'toc2' or @style = 'toc3']">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
      </xsl:template>
      <xsl:template match="book">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
      </xsl:template>
</xsl:stylesheet>
