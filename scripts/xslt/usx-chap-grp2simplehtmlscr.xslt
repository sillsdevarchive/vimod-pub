<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx-chap-grp2simplehtmlscr.xslt
    # Purpose:     Generate html from combined usx chapter grouped file
    # Part of:        Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    #
    # Author:       Greg Trihus of SIL International  
    # Adapted by: Ian McQuay <ian_mcquay@sil.org>
    # Created:      2013/07/05
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output encoding="UTF-8" method="xml" name="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:param name="parampath"/>
      <xsl:param name="buildpath"/>
      <xsl:param name="title"/>
      <xsl:param name="dir"/>
      <xsl:param name="langname"/>
      <xsl:param name="iso"/>
      <xsl:param name="vol" select="'nt'"/>
      <xsl:param name="introword" select="'Introduction'"/>
      <xsl:param name="copyright" select="'2013 Wycliffe'"/>
      <xsl:include href='usx-book-seq-func.xslt'/>
      <xsl:include href='bible-book-func.xslt'/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:variable name="allusx" select="."/>
      <xsl:template match="/">
            <xsl:for-each select="//chapterGroup">
                  <xsl:variable name="book" select="@book"/>
                  <xsl:variable name="bookname" select="parent::usx/bookGroup/para[@style = 'h']"/>
                  <xsl:variable name="chapter" select="@number"/>
                  <xsl:variable name="precedingverses" select="count(preceding::chapterGroup//note)"/>
                  <xsl:call-template name="writehtmlchapter">
                        <xsl:with-param name="filename" select="concat($buildpath,'chap\',$book,'.',$chapter,$posturl)"/>
                        <xsl:with-param name="chapter" select="$chapter"/>
                        <xsl:with-param name="versesbefore" select="$precedingverses"/>
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
                  <xsl:variable name="booknamelong" select="parent::usx/bookGroup/para[@style = 'mt1']"/>
                  <xsl:call-template name="writehtmlchapterindex">
                        <xsl:with-param name="filename" select="concat($buildpath,'index\',$book,'_index',$posturl)"/>
                        <xsl:with-param name="book" select="$book"/>
                        <xsl:with-param name="bookname" select="$bookname"/>
                        <xsl:with-param name="booknamelong" select="$booknamelong"/>
                  </xsl:call-template>
            </xsl:for-each>
            <xsl:apply-templates select="data" mode="bookindex"/>
            <xsl:call-template name="writestarterpage"/>
      </xsl:template>
      <xsl:template name="writehtmlchapter">
            <xsl:param name="filename"/>
            <xsl:param name="chapter"/>
            <xsl:param name="versesbefore"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="concat($book,$chapter,' ',$filename,'&#10;')"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="concat($bookname,' ',$chapter,' (',$iso,')')"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body>
                              <div data-role="header">
                                    <h1>
                                          <a data-icon="arrow-l">
                                                <xsl:attribute name="href">
                                                      <xsl:value-of select="f:chapbefore($chapter,$book)"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="f:trimname(f:chapbefore($chapter,$book))"/>
                                          </a>
                                          <a href="../index/{$book}_index.html#c{$chapter}" data-icon="home">Chapters</a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:value-of select="f:chapafter($chapter,$book)"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="f:trimname(f:chapafter($chapter,$book))"/>
                                          </a>
                                    </h1>
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <div class="chapter {$iso} {$vol} {$book}_{c/@number}">
                                          <xsl:apply-templates>
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                                <xsl:with-param name="bookname" select="$bookname"/>
                                                <xsl:with-param name="book" select="$book"/>
                                                <xsl:with-param name="versesbefore" select="$versesbefore"/>
                                          </xsl:apply-templates>
                                    </div>
                                    <div class="endnote">
                                          <xsl:apply-templates select="current()//note" mode="endnote">
                                                <xsl:with-param name="chapter" select="$chapter"/>
                                                <xsl:with-param name="versesbefore" select="$versesbefore"/>
                                          </xsl:apply-templates>
                                    </div>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="data" mode="bookindex">
            <xsl:variable name="filename" select="concat($buildpath,'index\index',$posturl)"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="$title"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body>
                              <h1>
                                    <xsl:value-of select="$title"/>
                              </h1>
                              <dl>
                                    <xsl:for-each-group select="usx" group-by="f:group(@book)">
                                          <xsl:sort select="f:group(@book)"/>
                                          <xsl:variable name="book" select="bookGroup/book/@code"/>
                                          <dt>
                                                <xsl:value-of select="substring(f:group(bookGroup/book/@code),2)"/>
                                          </dt>
                                          <xsl:for-each select="current-group()">
                                                <xsl:sort select="f:sequence(@book)"/>
                                                <xsl:variable name="book" select="bookGroup/book/@code"/>
                                                <xsl:variable name="bookname" select="bookGroup/para[@style = 'h']"/>
                                                <dd>
                                                      <a href="../index/{$book}_index.html" id="{$book}">
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
            <xsl:text disable-output-escaping='yes'>&#10;</xsl:text>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="concat($bookname,' Introduction (',$iso,')')"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
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
            <xsl:param name="booknamelong"/>
            <xsl:value-of select="concat($book,$chapter)"/>
            <xsl:text disable-output-escaping='yes'>&#10;</xsl:text>
            <xsl:value-of select="concat('$lastbook=',$lastbook,'&#10;')"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <!-- <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text> -->
                  <html lang="en">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="concat($bookname,' (',$iso,')')"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body>
                              <!-- <a href="../../../../../index.html" class="index-header-logo"></a> -->
                              <div data-role="header">
                                    <h1>
                                          <a data-icon="arrow-l">
                                                <xsl:attribute name="href">
                                                      <xsl:value-of select="f:bookbefore($book)"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="f:trimname(f:bookbefore($book))"/>
                                          </a>
                                          <a href="../index/index.html#{$book}" data-icon="home">Home</a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:value-of select="f:bookafter($book)"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="f:trimname(f:bookafter($book))"/>
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
                                          <xsl:if test="$chapter = ''">
                                                <xsl:apply-templates select="bookGroup" mode="index">
                                                      <xsl:with-param name="book" select="$book "/>
                                                      <xsl:with-param name="bookname" select="$bookname"/>
                                                </xsl:apply-templates>
                                          </xsl:if>
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
      <xsl:template match="bookGroup" mode="index">
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:variable name="name">
                  <xsl:text>../chap/</xsl:text>
                  <xsl:value-of select="$book"/>
                  <xsl:text>.0</xsl:text>
                  <xsl:text>.html</xsl:text>
            </xsl:variable>
            <dd>
                  <a href="{$name}" id="c">
                        <xsl:value-of select="$bookname"/>
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
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:param name="versesbefore"/>
            <!-- paragraph elements -->
            <div class="{@style}">
                  <xsl:apply-templates>
                        <xsl:with-param name="chapter" select="$chapter"/>
                        <xsl:with-param name="versesbefore" select="number($versesbefore)"/>
                        <xsl:with-param name="book" select="$book"/>
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
      <xsl:template match="char">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <!-- inline footnote text handling -->
            <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
            <xsl:text> </xsl:text>
      </xsl:template>
      <xsl:template match="note">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:param name="versesbefore"/>
            <xsl:param name="book"/>
            <!-- inline note handling by creating hyperlinks to endnotes -->
            <xsl:variable name="count" select="count(preceding::note) + 1 - count(preceding::chapterGroup//note)"/>
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:text>#f-</xsl:text>
                        <xsl:number value="$count" format="a"/>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                        <xsl:apply-templates select="node()"/>
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
            <xsl:param name="versesbefore"/>
            <xsl:param name="book"/>
            <!-- endnote handling  for note fields -->
            <xsl:variable name="count" select="count(preceding::note) + 1 - count(preceding::chapterGroup//note)"/>
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
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="preceding::verse[1]/@number"/>
                  </xsl:element>
                  <xsl:text> </xsl:text>
                  <xsl:apply-templates select="node()" mode="endnote">
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:apply-templates>
            </p>
      </xsl:template>
      <xsl:template match="char" mode="endnote">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <span class="{@style}">
                  <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
                  <xsl:text> </xsl:text>
            </span>
      </xsl:template>
      <xsl:template match="text()" mode="endnote">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="."/>
      </xsl:template>
      <xsl:template match="text()">
            <xsl:param name="chapter"/>
            <xsl:param name="bookname"/>
            <xsl:value-of select="."/>
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
      <xsl:template name="html-head">
            <xsl:param name="pagetitle"/>
            <xsl:param name="cssfile"/>
            <head>
                  <title>
                        <xsl:value-of select="$pagetitle"/>
                  </title>
                  <meta charset="UTF-8"/>
                  <meta name="viewport" content="width=device-width, initial-scale=1"/>
                  <link href="{$cssfile}" rel="stylesheet"/>
            </head>
      </xsl:template>
      <xsl:template name="writestarterpage">
            <!-- write starter page -->
            <xsl:variable name="starterindex" select="concat($buildpath,'/index.html')"/>
            <xsl:result-document href="{$starterindex}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
                  <html lang="en">
                        <head>
                              <title>
                                    <xsl:value-of select="$title"/>
                              </title>
                              <meta http-equiv="refresh" content="0; url=index/index.html"/>
                              <meta content="text/html; charset=UTF-8" http-equiv="content-type"/>
                              <meta charset="UTF-8"/>
                              <meta name="viewport" content="width=device-width, initial-scale=1"/>
                              <link href="../css/mobile.css" rel="stylesheet"/>
                        </head>
                        <body>
                              <div class="content">
                                    <h2>
                                          <xsl:value-of select="$title"/>
                                    </h2>
                                    <dl>
                                          <dt>Starting . . .</dt>
                                          <dd>If not started automatically, <a href='index/index.html'>click here</a></dd>
                                    </dl>
                              </div>
                              <script type="text/javascript" src="cordova-2.5.0.js"></script>
                              <script type="text/javascript" src="js/index.js"></script>
                              <script type="text/javascript">
            app.initialize();
        </script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:function name="f:trimname">
            <xsl:param name="string"/>
            <xsl:value-of select="replace(substring-before($string,'.html'),'../index/','')"/>
      </xsl:function>
</xsl:stylesheet>
