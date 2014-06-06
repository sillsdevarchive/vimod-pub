<?xml version="1.0" encoding="UTF-8"?>
<!--
    #############################################################
    # Name:        usx-chap-grp2simplehtmlscr3.xslt
    # Purpose:     Generate html in simplehtmlscr, from combined usx-chapter-grouped file.
    # 			step 2 after step 1 usx2usx-chap-group.xslt
    # Part of:        Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    #
    # Author:       Greg Trihus of SIL International  
    # Adapted by: Ian McQuay <ian_mcquay@sil.org>
    # Created:      2013/07/05  modified: 2013/08/24
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output encoding="UTF-8" method="xml" name="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <!-- <xsl:include href="inc-interlin-test.xslt"/> -->
      <xsl:include href='bible-book-func.xslt'/>
      <xsl:include href='project.xslt'/>
      <xsl:variable name="copyright" select="concat('&#xA9; ',year-from-date(current-date()),' Wycliffe Bible Translators Inc.')"/>
      <xsl:variable name="removepara" select="tokenize($removeparalist,'\s+')"/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:variable name="allusx" select="."/>
      <xsl:variable name="includesot" select="matches($vol,'o')"/>
      <xsl:variable name="index2">
            <xsl:if test="$includesot">
                  <xsl:text>2</xsl:text>
            </xsl:if>
      </xsl:variable>
      <xsl:template match="/">
            <xsl:apply-templates select="data" mode="bookindex"/>
            <xsl:call-template name="writestarterpage"/>
            <xsl:call-template name="writewycliffecopyright"/>
            <xsl:call-template name="bibleontindex"/>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="data">
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
                  <xsl:with-param name="filename" select="concat($buildpath,'\index\',$book,'_index',$posturl)"/>
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
            <xsl:result-document href="{$filenameuri}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>
                  <html lang="{$iso}">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="concat($bookname,' (',$iso,')')"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body dir="{$textdir}">
                              <div data-role="header">
                                    <h1>
                                          <a data-icon="arrow-l">
                                                <xsl:attribute name="href">
                                                      <xsl:choose>
                                                            <xsl:when test="string-length($prebk) = 0">
                                                                  <xsl:value-of select="concat('../index/index',$index2,$posturl)"/>
                                                                  <xsl:if test="$idjump = 'on'">
                                                                        <xsl:value-of select="concat('#',$book)"/>
                                                                  </xsl:if>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:value-of select="concat('../index/',$prebk,'_index',$posturl)"/>
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of select="$prebk"/>
                                                <xsl:if test="string-length($prebk) = 0">
                                                      <xsl:text>&#32;<!-- space makes hyperline when $prebk empty --></xsl:text>
                                                </xsl:if>
                                          </a>
                                          <a data-icon="home">
                                                <xsl:attribute name="href">
                                                      <xsl:value-of select="concat('../index/index',$index2,$posturl)"/>
                                                      <xsl:if test="$idjump = 'on'">
                                                            <xsl:text>#</xsl:text>
                                                            <xsl:value-of select="$book"/>
                                                      </xsl:if>
                                                </xsl:attribute>
                                                <xsl:text>Home</xsl:text>
                                          </a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:choose>
                                                            <xsl:when test="string-length($postbk) = 0">
                                                                  <xsl:value-of select="concat('../index/index',$index2,$posturl)"/>
                                                                  <xsl:if test="$idjump = 'on'">
                                                                        <xsl:value-of select="concat('#',$book)"/>
                                                                  </xsl:if>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:value-of select="concat('../index/',$postbk,'_index',$posturl)"/>
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:value-of select="$postbk"/>
                                                <xsl:if test="string-length($postbk) = 0">
                                                      <xsl:text>&#32;<!-- space makes hyperline when $postbk empty --></xsl:text>
                                                </xsl:if>
                                          </a>
                                    </h1>
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <xsl:choose>
                                          <xsl:when test="f:groupname($book) = 'backmatter'">
                                                <xsl:apply-templates select="$usx/bookGroup" mode="backmatter"/>
                                          </xsl:when>
                                          <xsl:otherwise>
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
                                                                  <xsl:with-param name="bookname" select="$bookname"/>
                                                            </xsl:apply-templates>
                                                      </xsl:if>
                                                      <xsl:apply-templates select="$usx/chapterGroup/chapter" mode="index">
                                                            <xsl:with-param name="book" select="$book "/>
                                                      </xsl:apply-templates>
                                                </dl>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
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
            <xsl:variable name="pretest1" select="string-length($prebk) = 0 and string-length($prechbk) = 0"/>
            <xsl:variable name="pretest2" select="string-length($prechbk) = 0"/>
            <xsl:variable name="posttest1" select="string-length($postbk) = 0 and string-length($postchbk) = 0"/>
            <xsl:variable name="posttest2" select="string-length($postchbk) = 0"/>
            <xsl:if test="f:groupname($book) ne 'backmatter'">
                  <xsl:result-document href="{$filenameuri}" format="xml">
                        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>
                        <html lang="{$iso}">
                              <xsl:call-template name="html-head">
                                    <xsl:with-param name="pagetitle" select="concat($bookname,' ',$chapter,' (',$iso,')')"/>
                                    <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                              </xsl:call-template>
                              <body dir="{$textdir}">
                                    <div data-role="header">
                                          <h1>
                                                <a data-icon="arrow-l">
                                                      <xsl:attribute name="href">
                                                            <xsl:choose>
                                                                  <xsl:when test="$pretest1">
                                                                        <!-- when there is no book and chapter before the current chapter -->
                                                                        <xsl:value-of select="concat('../index/index',$posturl)"/>
                                                                        <xsl:if test="$idjump = 'on'">
                                                                              <xsl:value-of select="concat('#',$book)"/>
                                                                        </xsl:if>
                                                                  </xsl:when>
                                                                  <xsl:otherwise>
                                                                        <xsl:choose>
                                                                              <xsl:when test="$pretest2">
                                                                                    <xsl:value-of select="concat('../chap/',$prebk,'.',$prebklastch,$posturl)"/>
                                                                              </xsl:when>
                                                                              <xsl:otherwise>
                                                                                    <xsl:value-of select="concat('../chap/',$book,'.',$prech,$posturl)"/>
                                                                              </xsl:otherwise>
                                                                        </xsl:choose>
                                                                  </xsl:otherwise>
                                                            </xsl:choose>
                                                      </xsl:attribute>
                                                      <xsl:choose>
                                                            <xsl:when test="$pretest1">
                                                                  <xsl:text>index</xsl:text>
                                                                  <xsl:if test="$idjump = 'on'">
                                                                        <xsl:value-of select="concat('#',$book)"/>
                                                                  </xsl:if>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:choose>
                                                                        <xsl:when test="pretest2">
                                                                              <xsl:value-of select="concat($prebk,'.',$prebklastch)"/>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                              <xsl:value-of select="concat($book,'.',$prech)"/>
                                                                        </xsl:otherwise>
                                                                  </xsl:choose>
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </a>
                                                <a data-icon="home">
                                                      <xsl:attribute name="href">
                                                            <xsl:text>../index/</xsl:text>
                                                            <xsl:value-of select="$book"/>
                                                            <xsl:text>_index.html</xsl:text>
                                                            <xsl:if test="$idjump = 'on'">
                                                                  <xsl:text>#c</xsl:text>
                                                                  <xsl:value-of select="$chapter -1"/>
                                                            </xsl:if>
                                                      </xsl:attribute>
                                                      <xsl:text>Chapters</xsl:text>
                                                </a>
                                                <a data-icon="arrow-r">
                                                      <xsl:attribute name="href">
                                                            <xsl:choose>
                                                                  <xsl:when test="$posttest1">
                                                                        <xsl:value-of select="concat('../index/index',$index2,$posturl)"/>
                                                                        <xsl:if test="$idjump = 'on'">
                                                                              <xsl:value-of select="concat('#',$book)"/>
                                                                        </xsl:if>
                                                                  </xsl:when>
                                                                  <xsl:otherwise>
                                                                        <xsl:choose>
                                                                              <xsl:when test="$posttest2">
                                                                                    <xsl:value-of select="concat('../chap/',$postbk,'.','0',$posturl)"/>
                                                                              </xsl:when>
                                                                              <xsl:otherwise>
                                                                                    <xsl:value-of select="concat('../chap/',$book,'.',$postch,$posturl)"/>
                                                                              </xsl:otherwise>
                                                                        </xsl:choose>
                                                                  </xsl:otherwise>
                                                            </xsl:choose>
                                                      </xsl:attribute>
                                                      <xsl:choose>
                                                            <xsl:when test="$posttest1">
                                                                  <xsl:text>index</xsl:text>
                                                                  <xsl:if test="$idjump = 'on'">
                                                                        <xsl:value-of select="concat('#',$book)"/>
                                                                  </xsl:if>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                  <xsl:choose>
                                                                        <xsl:when test="$posttest2">
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
                                    <xsl:if test="$copyrightonchappage">
                                          <!-- If param is set then the copyright is written to the chapter pages on the bottom -->
                                          <h6>
                                                <xsl:choose>
                                                      <xsl:when test="string-length($altcopyright) = 0">
                                                            <xsl:value-of select="$copyright"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <xsl:value-of select="concat('&#169; ',$altcopyright)"/>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                          </h6>
                                    </xsl:if>
                              </body>
                        </html>
                  </xsl:result-document>
            </xsl:if>
      </xsl:template>
      <xsl:template match="data" mode="bookindex">
            <xsl:variable name="filename0">
                  <xsl:choose>
                        <xsl:when test="$includesot">
                              <xsl:value-of select="concat($buildpath,'\index\index2',$posturl)"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat($buildpath,'\index\index',$posturl)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="filename" select="f:file2uri($filename0)"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>
                  <html lang="{$iso}">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="$title"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body dir="{$textdir}">
                              <xsl:if test="$subrootlink = 'yes'">
                                    <div data-role="header">
                                          <h1>
                                                <a href="../../index.html" data-icon="home">Home</a>
                                          </h1>
                                    </div>
                              </xsl:if>
                              <xsl:if test="$includesot">
                                    <div data-role="header">
                                          <h1>
                                                <a data-icon="home" href="../index/index.html">Home</a>
                                          </h1>
                                    </div>
                              </xsl:if>
                              <div data-role="content" class="flexcroll">
                                    <xsl:if test="$writetitle = 'on'">
                                          <h1>
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                          <h6>
                                                <xsl:call-template name="langcopyright"/>
                                          </h6>
                                    </xsl:if>
                                    <dl>
                                          <xsl:for-each-group select="usx" group-by="f:grouporder(@book)">
                                                <xsl:sort select="f:grouporder(@book)"/>
                                                <dt id="{f:groupname(@book)}">
                                                      <xsl:value-of select="f:group(@book)"/>
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
                        <xsl:value-of select="$introword"/>
                  </a>
            </dd>
      </xsl:template>
      <xsl:template match="bookGroup" mode="backmatter">
            <xsl:param name="book"/>
            <xsl:param name="bookname"/>
            <xsl:variable name="name">
                  <xsl:text>../chap/</xsl:text>
                  <xsl:value-of select="$book"/>
                  <xsl:text>.0</xsl:text>
                  <xsl:text>.html</xsl:text>
            </xsl:variable>
            <xsl:apply-templates select="*"/>
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
                        <!-- <xsl:text> </xsl:text>
                        <xsl:value-of select="preceding::verse[1]/@number"/> -->
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
            <!--<xsl:param name="chapter"/>
            <xsl:param name="bookname"/> -->
            <xsl:value-of select="."/>
      </xsl:template>
      <!--  <xsl:template match="text()">
           <xsl:param name="chapter"/>
            <xsl:param name="bookname"/> 
            <xsl:value-of select="."/>
      </xsl:template>  -->
      <xsl:template match="para[@style = 'b']">
            <br/>
      </xsl:template>
      <xsl:template match="*[@style = $removepara]"/>
      <!-- Remove paragraphs since not scripture -->
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
      <xsl:template name="html-head">
            <xsl:param name="pagetitle"/>
            <xsl:param name="cssfile"/>
            <head>
                  <title>
                        <xsl:attribute name="dir">
                              <xsl:value-of select="$textdir"/>
                        </xsl:attribute>
                        <xsl:value-of select="$pagetitle"/>
                  </title>
                  <meta charset="UTF-8"/>
                  <meta name="viewport" content="width=device-width, initial-scale=1"/>
                  <link href="{$cssfile}" rel="stylesheet"/>
            </head>
      </xsl:template>
      <xsl:template name="writestarterpage">
            <!-- write starter page -->
            <xsl:variable name="starterindex0" select="concat($buildpath,'\index.html')"/>
            <xsl:variable name="starterindex" select="f:file2uri($starterindex0)"/>
            <xsl:result-document href="{$starterindex}" format="xml">
                  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>
                  <html lang="{$iso}">
                        <head>
                              <title>
                                    <xsl:attribute name="dir">
                                          <xsl:value-of select="$textdir"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$title"/>
                              </title>
                              <meta http-equiv="refresh" content="4; url=index/index.html"/>
                              <meta content="text/html; charset=UTF-8" http-equiv="content-type"/>
                              <meta charset="UTF-8"/>
                              <meta name="viewport" content="width=device-width, initial-scale=1"/>
                              <link href="css/mobile.css" rel="stylesheet"/>
                        </head>
                        <body dir="auto">
                              <div class="content">
                                    <xsl:choose>
                                          <xsl:when test="string-length($altcopyright) = 0">
                                                <xsl:call-template name="rightsstatement"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <h1>
                                                      <xsl:value-of select="$title"/>
                                                </h1>
                                                <dl>
                                                      <dt>Starting . . .</dt>
                                                      <dd>If not started automatically, <a href='index/index.html'>click here</a></dd>
                                                </dl>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </div>
                              <script type="text/javascript" src="cordova-2.5.0.js"></script>
                              <script type="text/javascript" src="js/index.js"></script>
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="rightsstatement">
            <h1>
                  <xsl:value-of select="$title"/>
            </h1>
            <h2>
                  <xsl:value-of select="$subtitle"/>
            </h2>
            <h4>
                  <xsl:value-of select="$langname"/>
            </h4>
            <h4><xsl:value-of select="$region"/>, <xsl:value-of select="$country"/></h4>
            <p>© <xsl:value-of select="year-from-date(current-date())"/>, Wycliffe Bible Translators, Inc. All rights reserved.</p>
            <p>This translation text is made available to you under the
terms of the Creative Commons License: Attribution-Noncommercial-No Derivative Works.
(<a href="http://creativecommons.org/licenses/by-nc-nd/3.0/">http://creativecommons.org/licenses/by-nc-nd/3.0/</a>)
In addition, you have permission to port the text to different file formats, as long as you
do not change any of the text or punctuation of the Bible.</p>
            <p>You may share, copy, distribute, transmit, and extract portions
or quotations from this work, provided that you include the above copyright
information:</p>
            <ul>
                  <li>You must give Attribution to the work.</li>
                  <li>You do not sell this work for a profit.</li>
                  <li>You do not make any derivative works that change any of the actual words or punctuation of the Scriptures.</li>
            </ul>
            <p>Permissions beyond the scope of this license may be
available if you <a href="mailto:ScriptureCopyrightPermissions_Intl@Wycliffe.org">contact
us</a> with your request.</p>
            <p><b><xsl:value-of select="$title"/></b> in <xsl:value-of select="$langname"/></p>
      </xsl:template>
      <xsl:template name="writewycliffecopyright">
            <xsl:variable name="filename0" select="concat($buildpath,'\index\rights',$posturl)"/>
            <xsl:variable name="filename" select="f:file2uri($filename0)"/>
            <xsl:result-document href="{$filename}" format="xml">
                  <html lang="{$iso}">
                        <xsl:call-template name="html-head">
                              <xsl:with-param name="pagetitle" select="$title"/>
                              <xsl:with-param name="cssfile" select="'../css/mobile.css'"/>
                        </xsl:call-template>
                        <body dir="{$textdir}">
                              <div data-role="header">
                                    <h1>
                                          <a href="index.html" data-icon="home">Home</a>
                                    </h1>
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <xsl:call-template name="rightsstatement"/>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="bibleontindex">
            <xsl:variable name="filename0" select="concat($buildpath,'\index\index',$posturl)"/>
            <xsl:variable name="filename" select="f:file2uri($filename0)"/>
            <xsl:if test="$includesot">
                  <xsl:result-document href="{$filename}" format="xml">
                        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;&#10;</xsl:text>
                        <html lang="en">
                              <head>
                                    <title dir="">Ketengban Alkitab</title>
                                    <meta charset="UTF-8"/>
                                    <meta name="viewport" content="width=device-width, initial-scale=1"/>
                                    <link href="../css/mobile.css" rel="stylesheet"/>
                              </head>
                              <body dir="{$textdir}">
                                    <div data-role="content" class="flexcroll">
                                          <h1>
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                          <h6>
                                                <xsl:call-template name="langcopyright"/>
                                          </h6>
                                          <dl>
                                                <dt id="bibleheader">
                                                      <xsl:value-of select="$title"/>
                                                </dt>
                                                <xsl:if test="string-length($oldtestament) gt 0">
                                                      <dd>
                                                            <a href="../index/index2.html#oldtestament" id="ot">
                                                                  <xsl:value-of select="$oldtestament"/>
                                                            </a>
                                                      </dd>
                                                </xsl:if>
                                                <dd>
                                                      <a href="../index/index2.html#newtestament" id="nt">
                                                            <xsl:value-of select="$newtestament"/>
                                                      </a>
                                                </dd>
                                                <xsl:if test="string-length($apocrypha) gt 0">
                                                      <dd>
                                                            <a href="../index/index2.html#apocrypha" id="ap">
                                                                  <xsl:value-of select="$apocrypha"/>
                                                            </a>
                                                      </dd>
                                                </xsl:if>
                                                <xsl:if test="string-length($backmatter) gt 0">
                                                      <dd>
                                                            <a href="../index/index2.html#backmatter" id="bm">
                                                                  <xsl:value-of select="$backmatter"/>
                                                            </a>
                                                      </dd>
                                                </xsl:if>
                                          </dl>
                                    </div>
                              </body>
                        </html>
                  </xsl:result-document>
            </xsl:if>
      </xsl:template>
      <xsl:template name="langcopyright">
            <xsl:choose>
                  <xsl:when test="string-length($altcopyright) = 0">
                        <xsl:value-of select="$langname"/>
                        <xsl:text>&#x2003;</xsl:text>
                        <a href="../index/rights.html">
                              <xsl:value-of select="$copyright"/>
                        </a>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat($langname,'&#2003;',$altcopyright)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:function name="f:trimname">
            <xsl:param name="string"/>
            <xsl:value-of select="replace(substring-before($string,'.html'),'../index/','')"/>
      </xsl:function>
</xsl:stylesheet>
