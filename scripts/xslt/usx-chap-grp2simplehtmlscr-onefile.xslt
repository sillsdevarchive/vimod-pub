<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx-chap-grp2simplehtmlscr3.xslt
    # Purpose:     Generate html in simplehtmlscr, from combined usx chapter-grouped file.
    # Part of:        Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    #
    # Author:       Greg Trihus of SIL International  
    # Adapted by: Ian McQuay <ian_mcquay@sil.org>
    # Created:      2013/07/05  modified: 2013/08/24
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output encoding="UTF-8" method="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href='bible-book-func.xslt'/>
      <xsl:param name="buildpath"/>
      <xsl:param name="title"/>
      <xsl:param name="langname"/>
      <xsl:param name="iso"/>
      <xsl:param name="introductionword" select="'Introduction'"/>
      <xsl:param name="idjump" select="'on'"/>
      <xsl:param name="writetitle" select="'on'"/>
      <xsl:param name="dir" select="'ltr'"/>
      <xsl:param name="vol" select="'nt'"/>
      <xsl:param name="introword" select="'Introduction'"/>
      <xsl:param name="copyright" select="'2013 Wycliffe'"/>
      <xsl:param name="subrootlink" select="'no'"/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:variable name="allusx" select="."/>
      <xsl:template match="/">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="en">
                  <xsl:call-template name="html-head">
                        <xsl:with-param name="pagetitle" select="concat($title,' (',$iso,')')"/>
                        <xsl:with-param name="cssfile" select="'mobile.css'"/>
                  </xsl:call-template>
                  <body>
                        <xsl:apply-templates/>
                        <script type="text/javascript" src="cordova-2.5.0.js"></script>
                        <script type="text/javascript" src="js/index.js"></script>
                        <script type="text/javascript">
            app.initialize();
        </script>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="data">
            <div id="index" data-role="page">
                  <xsl:if test="$subrootlink = 'yes'">
                        <div data-role="header" data-position="fixed" id="index">
                              <h1>
                                    <a href="../index.html" data-icon="home">Home</a>
                              </h1>
                        </div>
                  </xsl:if>
                  <div id="divSearchContent" data-role="content">
                        <xsl:if test="$writetitle = 'on'">
                              <h1>
                                    <xsl:value-of select="$title"/>
                              </h1>
                        </xsl:if>
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
                                                <a href="#{$book}" id="books_{$book}">
                                                      <xsl:value-of select="$bookname"/>
                                                </a>
                                          </dd>
                                    </xsl:for-each>
                              </xsl:for-each-group>
                        </dl>
                  </div>
            </div>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="usx">
            <xsl:variable name="book" select="@book"/>
            <xsl:variable name="bookname" select="bookGroup/para[@style = 'h']"/>
            <xsl:variable name="booknamelong" select="bookGroup/para[@style = 'mt1']"/>
            <xsl:variable name="prebk" select="preceding-sibling::usx[1]/@book"/>
            <xsl:variable name="prebklastch">
                  <xsl:choose>
                        <xsl:when test="not(preceding-sibling::usx[1]/chapterGroup[last()]/@number)">
                              <xsl:text>0</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="preceding-sibling::usx[1]/chapterGroup[last()]/@number"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="postbk" select="following-sibling::usx[1]/@book"/>
            <xsl:call-template name="writehtmlchapterindex">
                  <xsl:with-param name="book" select="$book"/>
                  <xsl:with-param name="bookname" select="$bookname"/>
                  <xsl:with-param name="usx" select="."/>
                  <xsl:with-param name="prebk" select="$prebk"/>
                  <xsl:with-param name="postbk" select="$postbk"/>
            </xsl:call-template>
            <xsl:apply-templates select="bookGroup|chapterGroup">
                  <xsl:with-param name="prebk" select="$prebk"/>
                  <xsl:with-param name="postbk" select="$postbk"/>
                  <xsl:with-param name="prebklastch" select="$prebklastch"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="bookGroup|chapterGroup">
            <xsl:param name="prebk"/>
            <xsl:param name="postbk"/>
            <xsl:param name="prebklastch"/>
            <xsl:variable name="book" select="@book"/>
            <xsl:variable name="bookname" select="parent::usx/bookGroup/para[@style = 'h']"/>
            <xsl:variable name="chapter" select="@number"/>
            <xsl:variable name="precedingverses" select="count(preceding::chapterGroup//note)"/>
            <xsl:call-template name="writehtmlchapter">
                  <xsl:with-param name="filename" select="concat($buildpath,'\chap\',$book,'.',$chapter,$posturl)"/>
                  <xsl:with-param name="chapter" select="$chapter"/>
                  <xsl:with-param name="versesbefore" select="$precedingverses"/>
                  <xsl:with-param name="book" select="$book"/>
                  <xsl:with-param name="bookname" select="$bookname"/>
                  <xsl:with-param name="prebk" select="$prebk"/>
                  <xsl:with-param name="postbk" select="$postbk"/>
                  <xsl:with-param name="prebklastch" select="$prebklastch"/>
                  <xsl:with-param name="prechbk" select="preceding-sibling::*[1]/@book"/>
                  <xsl:with-param name="postchbk" select="following-sibling::*[1]/@book"/>
                  <xsl:with-param name="prech" select="preceding-sibling::*[1]/@number"/>
                  <xsl:with-param name="postch" select="following-sibling::*[1]/@number"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template name="writehtmlchapterindex">
            <xsl:param name="filename"/>
            <xsl:param name="usx"/>
            <xsl:param name="chapter"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:param name="booknamelong"/>
            <xsl:param name="prebk"/>
            <xsl:param name="postbk"/>
            <xsl:value-of select="concat($book,$chapter)"/>
            <xsl:text disable-output-escaping='yes'>&#10;</xsl:text>
            <xsl:variable name="filenameuri" select="f:file2uri($filename)"/>
            <div data-role="page" id="{$book}">
                  <div data-role="header" position="fixed" id="{$book}">
                        <h1>
                              <a data-icon="arrow-l">
                                    <xsl:attribute name="href">
                                          <xsl:choose>
                                                <xsl:when test="string-length($prebk) = 0">
                                                      <xsl:text>#index</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:value-of select="concat('#',$prebk)"/>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:value-of select="$prebk"/>
                              </a>
                              <a data-icon="home">
                                    <xsl:attribute name="href">
                                          <xsl:text>#index</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Home</xsl:text>
                              </a>
                              <a data-icon="arrow-r">
                                    <xsl:attribute name="href">
                                          <xsl:choose>
                                                <xsl:when test="string-length($postbk) = 0">
                                                      <xsl:text>#index</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:value-of select="concat('#',$postbk)"/>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:value-of select="$postbk"/>
                              </a>
                        </h1>
                  </div>
                  <div data-role="content" class="flexcroll">
                        <xsl:if test="$writetitle = 'on'">
                              <h2>
                                    <xsl:value-of select="$title"/>
                              </h2>
                        </xsl:if>
                        <dl>
                              <dt>
                                    <xsl:value-of select="$bookname"/>
                              </dt>
                              <xsl:if test="$chapter = ''">
                                    <xsl:apply-templates select="bookGroup" mode="index">
                                          <xsl:with-param name="book" select="$book "/>
                                          <xsl:with-param name="bookname" select="concat($bookname,' ',$introductionword)"/>
                                    </xsl:apply-templates>
                              </xsl:if>
                              <xsl:apply-templates select="$usx/chapterGroup/chapter" mode="index">
                                    <xsl:with-param name="book" select="$book "/>
                              </xsl:apply-templates>
                        </dl>
                  </div>
            </div>
      </xsl:template>
      <xsl:template name="writehtmlchapter">
            <xsl:param name="filename"/>
            <xsl:param name="chapter"/>
            <xsl:param name="versesbefore"/>
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:param name="prebk"/>
            <xsl:param name="postbk"/>
            <xsl:param name="prebklastch"/>
            <xsl:param name="prechbk"/>
            <xsl:param name="postchbk"/>
            <xsl:param name="prech"/>
            <xsl:param name="postch"/>
            <xsl:value-of select="concat($book,$chapter,' ',$filename,'&#10;')"/>
            <xsl:variable name="filenameuri" select="f:file2uri($filename)"/>
            <div data-role="page" id="{$book}{$chapter}">
                  <div data-role="header">
                        <h1>
                              <a data-icon="arrow-l">
                                    <xsl:attribute name="href">
                                          <xsl:choose>
                                                <xsl:when test="string-length($prebk) = 0">
                                                      <xsl:text>#index</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:choose>
                                                            <xsl:when test="string-length($prechbk) = 0">
                                                                  <xsl:value-of select="concat('#',$prebk,$prebklastch)"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:value-of select="concat('#',$book,$prech)"/>
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:choose>
                                          <xsl:when test="string-length($prebk) = 0">
                                                <xsl:text>#index</xsl:text>
                                                <!-- <xsl:if test="$idjump = 'on'">
                                                      <xsl:value-of select="concat('#',$book)"/>
                                                </xsl:if> -->
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:choose>
                                                      <xsl:when test="string-length($prechbk) = 0">
                                                            <xsl:value-of select="concat($prebk,$prebklastch)"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <xsl:value-of select="concat($book,$prech)"/>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </a>
                              <a data-icon="home">
                                    <xsl:attribute name="href">
                                          <xsl:value-of select="concat('#',$book)"/>
                                    </xsl:attribute>
                                    <xsl:text>Chapters</xsl:text>
                              </a>
                              <a data-icon="arrow-r">
                                    <xsl:attribute name="href">
                                          <xsl:choose>
                                                <xsl:when test="string-length($postbk) = 0">
                                                      <xsl:value-of select="'#index'"/>
                                                      <xsl:if test="$idjump = 'on'">
                                                            <xsl:value-of select="concat('#',$book)"/>
                                                      </xsl:if>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:choose>
                                                            <xsl:when test="string-length($postchbk) = 0">
                                                                  <xsl:value-of select="concat('#',$postbk,'0')"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:value-of select="concat('#',$book,$postch)"/>
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:choose>
                                          <xsl:when test="string-length($postbk) = 0">
                                                <xsl:text>index</xsl:text>
                                                <xsl:if test="$idjump = 'on'">
                                                      <xsl:value-of select="concat('#',$book)"/>
                                                </xsl:if>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:choose>
                                                      <xsl:when test="string-length($postchbk) = 0">
                                                            <xsl:value-of select="concat($postbk,'.','0')"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <xsl:value-of select="concat($book,'.',$postch)"/>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                          </xsl:otherwise>
                                    </xsl:choose>
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
            </div>
      </xsl:template>
      <xsl:template match="data" mode="bookindex">
            <xsl:variable name="filename0" select="concat($buildpath,'\index\index',$posturl)"/>
            <xsl:variable name="filename" select="f:file2uri($filename0)"/>
            <div data-role="page" id="bookindex">
                  <xsl:if test="$subrootlink = 'yes'">
                        <div data-role="header">
                              <h1>
                                    <a href="#index" data-icon="home">Home</a>
                              </h1>
                        </div>
                  </xsl:if>
                  <xsl:if test="$writetitle = 'on'">
                        <h1>
                              <xsl:value-of select="$title"/>
                        </h1>
                  </xsl:if>
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
            </div>
      </xsl:template>
      <xsl:template match="chapter" mode="index">
            <xsl:param name="book"/>
            <xsl:variable name="name">
                  <xsl:value-of select="concat('#',$book,string(@number))"/>
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
                  <a href="{$name}" id="bk_{$name}">
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
      <xsl:template match="para[@style = 'b']">
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
                  <style type="text/css" dir="ltr" title="included">
                        <xsl:call-template name="css"/>
                  </style>
            </head>
      </xsl:template>
      <xsl:template name="writestarterpage">
            <!-- write starter page -->
            <xsl:variable name="starterindex0" select="concat($buildpath,'\index.html')"/>
            <xsl:variable name="starterindex" select="f:file2uri($starterindex0)"/>
            <div data-role="page" id="pgSearch">
                  <div class="content">
                        <h2>
                              <xsl:value-of select="$title"/>
                        </h2>
                        <dl>
                              <dt>Starting . . .</dt>
                              <dd>If not started automatically, <a href='index/index.html'>click here</a></dd>
                        </dl>
                  </div>
            </div>
      </xsl:template>
      <xsl:template name="css">
            <xsl:text>/* Bible  */
@font-face {
	font-family: 'padauk_src';
    src: url('fonts/padauk_src.eot');
    src: url('fonts/padauk_src.eot?#iefix') format('eot'),
         url('fonts/padauk_src.woff') format('woff'),
         url('fonts/padauk_src.ttf') format('truetype'),
         url('fonts/padauk_src.svg#webfontVIEluHTx') format('svg');
	font-weight: normal;
	font-style: normal;
}

.JUD {
	font-family: 'padauk_src';
}
body	{ font-family: 'Andika', 'AndikaRegular', 'Tahoma', 'Liberation Sans', 'andika_apacregular', 'sans-serif'; font-size: 13pt; line-height: 1.4em }
body.mainDoc	{
	background-color: rgb(239,255,255);
	min-width: 120px
	}
select { font-family:  'Andika', 'AndikaRegular', 'Tahoma', 'Liberation Sans', 'andika_apacregular', 'sans-serif'; font-size: 13pt; line-height: 1.4em }

/* Styles for USFM elements -- div for paragraph and span for character styles */
span.add { color: rgb(16,16,16); font-style: italic }
div.b { display: block; margin-left: 12em; text-indent: -2em; line-height: 1.4em }
span.bd, span.em { font-weight: bold }
span.bdit, span.bk {font-weight: bold; font-style: italic }
div.cd, div.conc {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:justify; margin-top: 6pt}
div.cls { display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:right; margin-top: 6pt}
div.cov {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:center; margin-top: 6pt}
div.d {  font-weight: bold; display: block; line-height: 1.4em; margin-top: 1.4em}
div.ebm {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt}
div.ebp {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em}
div.ebq div.ebq1 {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 12em; text-indent: -4em}
div.ebq2 {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 8em; text-indent: -4em}
div.ebq3 {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 252em; text-indent: -4em}
div.ebs, div.ebs1 {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em}
div.ebs2 {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em}
div.ebs3 {  font-size: 11pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em}
span.fm, span.notemark {  font-size: 11pt; vertical-align: super; margin-left: 2pt; line-height: 0}
div.fp {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 12em}
span.fq {  font-style: italic; color: rgb(0,0,128) }
span.fqa {  font-style: italic; color: rgb(0,0,128) }
span.fr {  color: rgb(0,0,16) }
span.ft {  font-weight: normal; color: rgb(0,0,128) }
span.fv {  color: maroon }
div.f {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 12em; text-indent: -12em }
div.glo {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em }
div.ib, div.idx, div.ie, div.iex, div.intro, div.ip, div.zp {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em }
div.ili, div.ili1 {  font-size: 11pt; color: rgb(0,0,128); display: list-item; list-style-type: square; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 0em; margin-left: 2em }
div.io, div.io1 {  font-size: 11pt; color: rgb(0,0,128); display: list-item; list-style-type: none; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 0em; margin-left: 2em }
div.io2 {  font-size: 11pt; color: rgb(0,0,128); display: list-item; list-style-type: none; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 0em; margin-left: 4em }
div.io3 {  font-size: 11pt; color: rgb(0,0,128); display: list-item; list-style-type: none; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 0em; margin-left: 6em }
div.io4 {  font-size: 11pt; color: rgb(0,0,128); display: list-item; list-style-type: none; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 0em; margin-left: 8em }
div.im {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left }
div.imi {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em; margin-left: 12em; margin-right: 12em }
div.imq {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em; margin-left: 12em }
div.imt, div.imt1 { font-weight: bold;  font-size: 13pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em }
div.imt2, div.iot { font-weight: bold;  font-size: 13pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em }
div.imt3, div.imte { font-weight: bold;  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: 2em }
span.ior { font-weight: bold }
div.ipi, div.ipq, div.pref, div.pub, div.pubinfo, div.spine {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-left: 2em; text-indent: 2em }
div.ipr {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align: right; margin-top: 6pt; margin-left: 2em; text-indent: 2em }
div.iq, div.iq1 {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: -8em; margin-left: 12em }
div.iq2 {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: -4em; margin-left: 12em }
div.iq3 {  font-size: 11pt; color: rgb(0,0,128); display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; text-indent: -2em; margin-left: 12em }
span.iqt { color: rgb(0,0,255) }
div.is, div.is1 {  font-size: 13pt; color: rgb(0,0,128); font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt }
div.is2 {  font-size: 11pt; color: rgb(0,0,128); font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt }
div.is3 {  font-size: 11pt; color: rgb(0,0,128); font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt }
span.it { font-style: italic }
span.k { font-weight: bold }
div.keyword, div.keyword1 {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-right: 12em; text-indent: -12em }
div.keyword2 {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-right: 12em; text-indent: -4em }
div.keyword3 {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:left; margin-top: 6pt; margin-right: 12em; text-indent: -2em }
div.li, div.li1, div.ph, div.ph1 { display: list-item; list-style-type: none; text-align:left; text-indent: 2em }
div.li2, div.ph2, div.phi { display: list-item; list-style-type: none; text-align:left; text-indent: 4em }
div.li3, div.ph3 { display: list-item; list-style-type: none; text-align:left; text-indent: 12em }
div.lit { text-align: right }
div.m { text-indent: 0em; margin-top: 0 }
div.mi { text-indent: 2em; text-align: left; margin-top: 0 }
div.mr {  font-size: 11pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:center; margin-top: 6pt; text-indent: 2em }
div.ms, div.ms1 { color: rgb(0,0,128); font-weight: bold;  font-size: 13pt; display: block; margin-bottom: 6pt; line-height: 1.4em; margin-top: 6pt }
div.ms2 { font-weight: bold;  font-size: 13pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:center; margin-top: 6pt; text-indent: 2em }
div.ms3 { font-weight: bold;  font-size: 13pt; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:center; margin-top: 6pt; text-indent: 2em }
div.mt, div.mt1, div.mte, div.mte1, h1 { font-weight: bold; font-size: 16pt; text-align: center; line-height: 1.7em }
div.mt2, div.mte2, h2 { font-weight: bold; font-size: 13pt; text-align: center; line-height: 1.7em }
div.mt3, div.mte3, h3 { font-weight: bold; font-size: 13pt; text-align: center; line-height: 1.7em }
div.nb, div.ps { text-indent: 0em; margin-top: 0em }
div.k1 { text-indent: 0em; text-align: left; font-weight: bold }
span.nd, span.sc { font-weight: bold;  /*font-variant: small-caps*/ }
span.ndx, span.no { font-style: normal }
span.ord { vertical-align: super; font-size: 11pt; text-decoration: underline }
div.p, div.p1, div.pb, div.pde, div.pdi {  text-indent: 2em; margin-top: 6pt; text-align: left; margin-left: 0em }
div.pc { text-indent: 0em; margin-top: 6pt; text-align: center }
div.pi, div.pi1 { text-indent: 2em; margin-top: 6pt; margin-left: 2em; text-align: justify }
div.pi2 { text-indent: 2em; margin-top: 6pt; margin-left: 4em; text-align: justify }
div.pi3 { text-indent: 2em; margin-top: 6pt; margin-left: 12em; text-align: justify }
div.pm, div.pmo, div.pmc, div.psi { text-indent: 2em; margin-top: 6pt; margin-left: 2em; margin-right: 2em; text-align: justify }
div.pmr, div.pr { text-indent: 2em; margin-top: 6pt; margin-left: 2em; margin-right: 2em; text-align: right; text-align: justify }
span.pn { color: rgb(0,0,8) }
span.pro { color: rgb(32,8,8) }
div.q, div.q1 { text-align:left; margin-top: 0pt; text-indent: -4em; margin-left: 4em }
div.q2 { text-align:left; margin-top: 0pt; text-indent: -2em; margin-left: 4em }
div.q3 { text-align:left; margin-top: 0pt; text-indent: -2em; margin-left: 6em }
div.qa {  font-weight: bold; display: block; margin-bottom: 6pt; line-height: 1.4em; text-align: center; margin-top: 6pt; text-indent: 0em }
span.qac { font-weight: bold }
div.qc { text-align: center; margin-top: 0pt; text-indent: 0em; margin-left: 0em }
div.qm, div.qm1 { text-align:left; margin-top: 0pt; text-indent: -8em; margin-left: 12em }
div.qm2 { text-align:left; margin-top: 0pt; text-indent: -12em; margin-left: 12em }
div.qm3 { text-align:left; margin-top: 0pt; text-indent: -4em; margin-left: 12em }
div.qr { text-align:right; margin-top: 0pt; text-indent: 0em }
div.qs { text-align:right; }
span.qt { font-style: oblique }
div.r, div.sr {  font-size: 13pt; font-style: italic; text-align: center; margin-bottom: 6pt; color: rgb(0,0,128) }
div.rr, div.rq, span.rq {  font-size: 11pt; font-style: italic; color: rgb(0,0,128); text-align: right }
div.s, div.s1 {  font-style: bold; color: rgb(0,0,128); text-align: center; margin-top: 8pt }
div.s2 {  font-size: 13pt; color: rgb(0,0,128); font-style: bold; text-align: center }
div.s3 {  font-size: 13pt; color: rgb(0,0,128); text-align: center }
span.sig { color: rgb(0,0,16) }
span.sls { font-style: italic }
div.sp { text-align: left;  font-size: 13pt; font-style: italic }
span.w, span.wg, span.wh, span.wr, span.zc { font-style: normal }
span.wj { color: rgb(192,0,0) }
span.xk {  font-weight: bold; color: rgb(0,0,128) }
span.xq {  color: rgb(0,0,128) }
span.xt, span.xo, span.notebackref {  color: rgb(0,0,128) }

div.maintitle        { display: block; text-align: center;  font-size: 18pt; font-weight: bold; margin-top: 10pt; margin-bottom: 10pt }
div.maintitle1       { display: block; text-align: center;  font-size: 18pt; font-weight: bold; margin-top: 2pt }
div.maintitle2       { display: block; text-align: center; font-size: 13pt; font-weight: bold; font-style: italic; margin-bottom: 2pt }
div.copyright, div.fine { display: block; text-align: center;  font-size: 6pt; color: #808080; margin-bottom: 2pt }
div.toc {display: block;  font-size: 13pt; text-align: left; text-indent: -1em; margin-left: 1em }
div.toc1 {display: block;  font-size: 13pt; text-align: left; text-indent: -1em; margin-left: 2em }
div.toc2 {display: block;  font-size: 11pt; text-align: left; text-indent: -1em; margin-left: 3em }

div.sectionheading, div.chapterlabel   { display: block; text-align: center;  font-size: 13pt; font-weight: bold; margin-top: 12pt }
div.sectionsubheading   { display: block; text-align: center;  font-weight: bold; font-style: italic; margin-top: 6pt; margin-left: 12pt } /* JohnT */
div.sectionsubsubheading   { display: block; text-align: center;  font-size: 13pt; font-weight: bold; font-style: normal; margin-top: 6pt; margin-left: 12pt } /* JohnT */
div.parallel		 {  display: block; text-align: center; font-style: italic; margin-top: 0pt; font-size:9pt } /* JohnT */
div.parallelSub		 {  display: block; text-align: center; font-style: italic; margin-top: 0pt; margin-left: 12pt; font-size:9pt } /* JohnT */


/* JohnT: based on a recommendation in http://www.xs4all.nl/~sbpoley/webmatters/superscripts.html,  to make line spacing
as nearly as possible uniform despite superscripts, especially in FF, we set block elements that contain them to a line-height
of 1.4 em, and the actual superscript elements have a line-height of zero.*/
div.navButtons {  font-size: 13pt; font-weight: bold; display: block; margin-bottom: 6pt; line-height: 52pt; text-align: center; clear: both; border-radius: 5px }
div.navButtons a { padding: 3px; background-color: #036; border-bottom: 1px solid #eee; border-radius: 5px; }
div.navButtons a:visited { color: #ffff66; text-decoration: none; border-radius: 5px; }
div.navButtons a:link { color: #ffffff; text-decoration: none; border-radius: 5px; }
div.navButtons a:hover { background-color: #0520ff; color: #fff; border-radius: 5px; }
div.navChapters {  font-size: 10pt; display: block; margin-bottom: 10pt; text-align: center; line-height: 28pt; border-radius: 5px; }
div.navChapters a { padding: 3px; background-color: #036; border-bottom: 1px solid #eee; border-radius: 5px; }
div.navChapters a:visited { color: #ffff66; text-decoration: none; border-radius: 5px; }
div.navChapters a:link { color: #ffffff; text-decoration: none; border-radius: 5px; }
div.navChapters a:hover { background-color: #0520ff; color: #fff; border-radius: 5px; }
div.prose            { display: block; margin-bottom: 6pt; line-height: 1.4em; text-align:justify; margin-top: 6pt}
div.proseblock       { display: block; line-height: 1.4em; text-align:justify}
div.proseblockindent { display: block; margin-left: 1cm; line-height: 1.4em; text-align:justify }
div.poetry           { display: block; margin-left: 1.5cm; text-indent: -0.5cm; line-height: 1.4em }
div.embeddedPoetry   { display: block; margin-left: 2.0cm; text-indent: -0.5cm; line-height: 1.4em; margin-right: 1.0cm; text-align:justify }
div.deepPoetry       { display: block; margin-left: 2.5cm; text-indent: -0.5cm; line-height: 1.4em; margin-right: 1.0cm; text-align:justify }
div.list             { margin-left: 1cm; text-indent: -0.5cm; line-height: 1.4em }
div.quoteSource		 { display:block; text-align:right; font-style:italic}
div.introListItem    { margin-left: 1cm; text-indent: -0.5cm; line-height: 1.4em }
div.pageFooter       { display: block; margin-bottom: 6pt; text-align: left; margin-top: 6pt; padding: 3px;  font-size: 11pt}
div.text            {margin-left: 0;margin-right:0}
div {margin-left: 5px; margin-right:5px}
div.bookList {  font-size: 11pt; line-height: 8pt; float: left; margin: 0px; padding: 3px; width: 120px; background: rgb(223,255,255) }
div.main { /* margin-left: 132px; padding: 4px;*/ background: rgb(246,256,246) }
div.mainindex { margin-left: 132px; padding: 4px; background: rgb(240,256,244) }
div.bookLine  {  font-size: 11pt; line-height: 12pt; display: block; text-align:left; width: 120px; border-radius: 5px; }
div.bookLine a { display: block; padding: 3px; background-color: #036; border-bottom: 1px solid #eee; border-radius: 5px; }
div.bookLine a:visited { color: #ffff66; text-decoration: none; border-radius: 5px; }
div.bookLine a:link { color: #ffffff; text-decoration: none; border-radius: 5px; }
div.bookLine a:hover { background-color: #0520ff; color: #fff; border-radius: 5px; }
div.dcbookLine  {  font-size: 11pt; line-height: 12pt; display: block; text-align:left; width: 120px; border-radius: 5px; border-radius: 5px; }
div.dcbookLine a { display: block; padding: 3px; background-color: #404040; border-bottom: 1px solid #eee; border-radius: 5px; }
div.dcbookLine a:visited { color: #ffff66; text-decoration: none; border-radius: 5px; }
div.dcbookLine a:link { color: #ffffff; text-decoration: none; border-radius: 5px; }
div.dcbookLine a:hover { background-color: #ababab; color: #fff; border-radius: 5px; }

p.note, p.footnote, p.crossRefNote { display: block;   margin-top: 3pt; font-size: 13pt; text-align: left; margin-left: 0em; color: rgb(0,0,128) }

span.chapter         {  font-size: 18pt; font-weight: bold; float:left; margin-right: 4pt; line-height: 30pt; padding-top: 1pt; vertical-align:top }
div.p span.chapter, div.q span.chapter, div.q1 span.chapter div.q2 span.chapter, div.q3 span.chapter, div.poetry span.chapter         {margin-right: 20pt }
span.verse           { white-space:nowrap;  vertical-align: super; font-size: 11pt; margin-left: 0pt; margin-right: 0pt; color: rgb(0,128,0); line-height:  0 }
span.smallcaps       { font-size: smaller }
span.crmark			 {  font-size: 11pt; vertical-align: super; margin-left: 2pt; line-height: 0}
span.overlap        {} /* Where chapter number splits paragraph, used for part of paragraph in a different chapter. */
div.figure {float:right;text-indent:0em;padding:5px;border:2px solid blue;margin:5px; }
span.figcopr {font-size: 7pt; color: rgb(180,180,200); line-height: 7pt}
span.figCaption {font-size: 10pt; color: rgb(0,0,128); line-height: 9pt}
span.figref {font-size: 10pt; color: rgb(0,0,128); font-weight: bold}
 
select, option { font-size: 13pt; line-height: 1.4em}

/* JohnT: for tooltips. The dummy font-size rule is a trick to make IE 'notice' the hover on the span, which apparently it otherwise ignores. */
a span.popup {display:none}
a span.crpopup {display:none}
a:hover {
  font-size: 100%;
  }
 
a:hover span.popup 
{
  
  position: absolute;
  display: block;
  background: rgb(255,255,255);
  border: 1px solid black;
  color: rgb(0,0,128);
  margin-left:2pt;
  padding-left: 3pt;
  padding-right: 3pt;
  text-decoration: none;
  text-indent: 0pt;
  z-index: 1;
  max-width: 3in;
  font-weight:normal;
  text-align:left;
  }
  a:hover span.crpopup {
  
  position: absolute;
  display: block;
  background: rgb(255,255,255);
  border: 1px solid black;
  color: rgb(0,0,128);
  margin-left:2pt;
  padding-left: 3pt;
  padding-right: 3pt;
  text-decoration: none;
  text-indent: 0pt;
  z-index: 1;
  max-width: 3in;
  font-weight:normal;
  text-align:left;
  }

td.text              { line-height: 18pt }

a.noteBackRef		{  margin-right: 4pt}

/* JohnT, for chapter index */
body.BookChapIndex, body.ConcIndex	{background: #ff8}
div.BookChapIndex	{ }
p.IndexChapterList	{ margin-left: 18pt; margin-top: 0pt; margin-bottom: 0pt }
p.IndexIntroduction	{ margin-left: 18pt; margin-top: 0pt; margin-bottom: 0pt; padding-bottom: 0pt}
p.IndexBookName		{ margin-bottom: 0pt; margin-top: 3pt }

/* JohnT, for word occurrence files */
span.OccRef			{color:Maroon}
span.special		{color:Gray}

/* JohnT, for bookNames index file */
table.BookNameTable {}
th.bookNameHeader,th.bookNameVernHeader, td.bookNameMissing, td.bookNameItem	{padding-right: 4pt}
th.bookNameHeader,th.bookNameVernHeader	{text-align:left}
td.bookNameVern,th.bookNameVernHeader	{color:Blue}
td.bookNameMissing						{background-color:Yellow}
td.bookNameItem							{}

/* JohnT: for print footer. Note there should be only one in doc, with ID (not class) print-footer.
This does not work well...not at all in IE (the footer div is hidden on screen, appears inline in print).
In Firefox it sort of works, but the footer is in addition to the standard one and prints too close to
other text, sometimes on top of it. Currently I am not using these styles. */
@media print {
	div#print-footer {display: block; position: fixed; bottom: 0; padding-top: 10pt}
}
@media screen {
	div#print-footer {display: none;}
}

*												{margin: 0;padding: 0}
p												{margin: 0 0 6pt 0;padding: 0}
.q, .q1												{margin: 0 0 6pt 6pt;padding: 0}
.q2												{margin: 0 0 6pt 12pt;padding: 0}
a {text-decoration: none;}
div[data-role="content"]						{padding:45px 10px 10px 10px;font-family: helvetica, sans-serif;line-height: 1.5;color: #555}

div[data-role="header"] 						{position:fixed !important;height:44px;width: 100%;background-color: #222;color: #898989;line-height: 44px;opacity: .2}
div[data-role="header"]:hover 					{opacity: 1}
div[data-role="header"] a						{width:50px;height:44px;position: fixed;top:0;text-indent: -9999px;opacity: .5;color: #222;text-decoration: none}
div[data-role="header"] a:hover 				{opacity: 1}
div[data-role="header"] a[data-icon="home"]		{background: url(images/menu.png) center no-repeat #222;width:100%;height:44px;left:50%;width:50px;margin-left: -25px}
div[data-role="header"] a[data-icon="arrow-r"]	{background: url(images/right-arrow.png) center no-repeat #222;right:0}
div[data-role="header"] a[data-icon="arrow-l"]	{background: url(images/left-arrow.png) center no-repeat #222;left:0}

dl												{height: auto;border-bottom: 1px solid #e6e6e6;padding-top: 5px;}
dl dt											{background: #222;text-align: center;color: #ccc;cursor: default;display: block;float: left;font-size: 12px;height: 40px;line-height: 40px;padding: 0;padding-right: 9px;padding-left: 20px;width: auto;text-transform: uppercase}
dl dt, dl dd									{float: none;height: auto}
dl dd											{text-align: center}
dl dd a											{font-family: Verdana, Geneva, sans-serif;color: #555;display: block;font-size: 20px;height: auto;line-height: 1;padding: 15px 20px;}
dl dd a:hover									{background: #222; color: #fff}


/* Bible Specific */
ins												{font-style: italic;text-decoration: none}
h2 												{text-align: center}
.note 											{}
.verse-num										{vertical-align: top; font-size: x-small;color: #777}
.caller {vertical-align: super;font-size: 75%; color:red}
h4 {}
h6 {text-align:center;}
</xsl:text>
      </xsl:template>
      <xsl:function name="f:trimname">
            <xsl:param name="string"/>
            <xsl:value-of select="replace(substring-before($string,'.html'),'../index/','')"/>
      </xsl:function>
</xsl:stylesheet>
