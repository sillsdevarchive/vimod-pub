<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
      <!-- 
Written by Ian McQuay
Date: 2012-07-20

Updated 2012-08-15 added copyright line
Updated 2012-08-16 added time stamp UTC to metadata

-->
      <xsl:param name="copyright" select="'2013 SIL Philippines'"/>
      <xsl:include href='dbs-html.xslt'/>
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
                              <link href="../../../css/mobile.css" rel="stylesheet"/>
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
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptbefore">
                                                      <xsl:with-param name="curchap" select="$chapter"/>
                                                      <xsl:with-param name="chaptbefore" select="$chapter - 1"/>
                                                </xsl:call-template>
                                          </a>
                                          <a href="{$book}_index.html" data-icon="home">Chapters</a>
                                          <a data-icon="arrow-r">
                                                <xsl:attribute name="href">
                                                      <xsl:call-template name="chaptafter">
                                                            <xsl:with-param name="curchap" select="$chapter "/>
                                                            <xsl:with-param name="chaptafter" select="$chapter  + 1"/>
                                                      </xsl:call-template>
                                                      <xsl:text>.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:call-template name="chaptafter">
                                                      <xsl:with-param name="curchap" select="$chapter "/>
                                                      <xsl:with-param name="chaptafter" select="$chapter  + 1"/>
                                                </xsl:call-template>
                                          </a>
                                    </h1>
                              </div>
                              <div data-role="sidebar">
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
                              </div>
                              <div data-role="content" class="flexcroll">
                                    <div class="chapter {$iso} {$vol} {$book}_{c/@number}">
                                          <xsl:apply-templates/>
                                    </div>
                                    <div class="endnote">
                                          <xsl:apply-templates select="//ancestor::cGroup/f" mode="endnote"/>
                                    </div>
                              </div>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="c">
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
            <h2 class="chapter-num">
                  <xsl:value-of select="@number"/>
            </h2>
      </xsl:template>
      <xsl:template match="p">
            <p>
                  <xsl:apply-templates/>
            </p>
      </xsl:template>
      <xsl:template match="*[@usx = 'para']">
            <!-- paragraph elements -->
            <p>
                  <xsl:attribute name="class">
                        <xsl:value-of select="local-name()"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </p>
      </xsl:template>
      <xsl:template match="bk|em">
            <!-- span elements -->
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:value-of select="local-name()"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="v">
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>verse-num v-</xsl:text>
                        <xsl:value-of select="@number"/>
                  </xsl:attribute>
                  <xsl:value-of select="@number"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="text">
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>verse </xsl:text>
                        <xsl:value-of select="@osis"/>
                        <!-- <xsl:text>_</xsl:text>
                        <xsl:value-of select="ancestor::cGroup/c/@number"/>
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="preceding::v[1]/@number"/> -->
                  </xsl:attribute>
                  <xsl:attribute name="data-osis">
                        <xsl:value-of select="replace(@osis,'_','.')"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="fr|ft|fq|fqa">
            <!-- inline footnote text handling -->
            <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
            <xsl:text> </xsl:text>
      </xsl:template>
      <xsl:template match="f">
            <!-- inline note handling -->
            <xsl:variable name="count" select="count(ancestor::cGroup/*/preceding::f) - 1"/>
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:text>#f-</xsl:text>
                        <xsl:number value="$count" format="a"/>
                  </xsl:attribute>
                  <xsl:attribute name="title">
                        <xsl:apply-templates select="fr|ft|fq|fqa"/>
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
            <!-- endnote handling -->
            <xsl:variable name="count" select="count(ancestor::cGroup/*/preceding::f) - 1"/>
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
                  <xsl:apply-templates select="fr|ft|fq|fqa" mode="endnote"/>
            </p>
      </xsl:template>
      <xsl:template match="fr|ft|fq|fqa" mode="endnote">
            <span class="{local-name()}">
                  <xsl:value-of select="normalize-space(replace(.,'&#xA;',''))"/>
                  <xsl:text> </xsl:text>
            </span>
      </xsl:template>
      <xsl:template match="s">
            <h3>
                  <xsl:apply-templates/>
            </h3>
      </xsl:template>
      <xsl:template match="r">
            <h4>
                  <xsl:apply-templates/>
            </h4>
      </xsl:template>
      <xsl:template match="sr">

      </xsl:template>
      <xsl:template match="b">
            <br/>
      </xsl:template>
</xsl:stylesheet>
