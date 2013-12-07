<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="lxGroup">
            <xsl:variable name="prevpage">
                  <xsl:choose>
                        <xsl:when test="position() gt 1">
                              <xsl:value-of select="concat('../lexicon/lx',format-number($lxid - 1,'00000'),$posturl)"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('../home.',$posturl)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="nextpage">
                  <xsl:choose>
                        <xsl:when test="position() lt last()">
                              <xsl:value-of select="concat('../lexicon/lx',format-number($lxid + 1,'00000'),$posturl)"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('../home.',$posturl)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="filename" select="concat($path,$prefile,format-number(position(),'00000'),$posturl)">
            <xsl:result-document href="{$filename}" format="xhtml">
                  <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
                        <head>
                              <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8"/>
                              <meta name="generator" content="PLB Dictionary Generator"/>
                              <xsl:element name="meta">
                                    <xsl:attribute name="name">
                                          <xsl:text>created</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="content">
                                          <xsl:value-of select="current-dateTime()"/>
                                    </xsl:attribute>
                              </xsl:element>
                              <title>
                                    <xsl:value-of select="lx"/>
                              </title>
                              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                              <meta name="viewport" content="width=device-width, initial-scale=1"/>
                              <link rel="stylesheet" href="../common/lsilpdict.css" type="text/css"/>
                              <link rel="stylesheet" href="../common/llabels.css" type="text/css"/>
                              <link rel="stylesheet" href="../common/l/1.3.1/jquery.mobile-1.3.1.min.css"/>
                              <script src="../common/jquery-1.9.1.min.js"></script>
                              <script src="../common/l/jquery.mobile-1.3.1.min.js"></script>
                        </head>
                        <body class="lx{format-number($lxno,'00000')}">
                              <div data-role="header" data-theme="b" data-position="fixed">
                                    <a href="#letters" data-rel="close" data-icon="bars" data-iconpos="notext"></a>
                                    <h1>
                                          <xsl:value-of select="$langname"/>
                                    </h1>
                              </div>
                              <!-- /header -->
                              <div data-role="content">
                                    <div class="{name(.)}">
                                          <xsl:apply-templates/>
                                    </div>
                                    <div class="copyright">
                                          <xsl:text>© </xsl:text>
                                          <xsl:value-of select="$copyright"/>
                                    </div>
                              </div>
                              <div data-role="footer" data-theme="b" data-position="fixed">
                                    <div data-role="navbar">
                                          <ul>
                                                <li>
                                                      <a href="{$prevpage}" data-icon="arrow-l" data-iconpos="notext"></a>
                                                </li>
                                                <li>
                                                      <a href="" data-rel="back" data-icon="back" data-iconpos="notext"></a>
                                                </li>
                                                <li>
                                                      <a href="{$nextpage}" data-icon="arrow-r" data-iconpos="notext"></a>
                                                </li>
                                          </ul>
                                    </div>
                                    <!-- /navbar -->
                              </div>
                              <!-- /footer -->
                              <div data-role="panel" id="letters">
                                    <div data-role="collapsible" data-collapsed="false" data-mini="true" data-theme="b" data-inset="false">
                                          <ul data-role="listview" data-filter="true">
                                                <li>
                                                      <a href="../index/home.html">Home</a>
                                                </li>
                                                <li data-role="list-divider">Quick Manobo word and meaning</li>
                                                <li>
                                                      <a href="../dev/Page2.html">Quick browse</a>
                                                </li>
                                                <li data-role="list-divider">Browse and search</li>
                                                <li>
                                                      <a href="Page3.html">Manobo</a>
                                                </li>
                                                <li>
                                                      <a href="Page3.html">English</a>
                                                </li>
                                                <li>
                                                      <a href="Page3.html">Tagalog</a>
                                                </li>
                                          </ul>
                                    </div>
                                    <!-- panel content goes here -->
                              </div>
                              <!-- /panel -->
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
</xsl:stylesheet>
