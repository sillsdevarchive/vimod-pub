<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     ff-dict-app-make-pages.xslt
    # Purpose:		build html5 pages for app.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="html" version="5.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="html5"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="app-framework-head.xslt"/>
      <!-- <xsl:include href='../../scripts/xslt/inc-dict-sense-hom.xslt'/> -->
      <!-- sense and homonym templates -->
      <!-- <xsl:include href='../../scripts/xslt/inc-dict-link.xslt'/> -->
      <!-- hyperlink handling -->
      <!-- <xsl:include href='../../scripts/xslt/inc-dict-table.xslt'/> -->
      <!-- table element handling -->
      <xsl:include href='../../scripts/xslt/inc-char-map-silp.xslt'/>
      <xsl:variable name="last" select="count(//lxGroup)"/>
      <xsl:variable name="eng-list">
            <xsl:apply-templates select="//lxGroup" mode="rev">
                  <xsl:with-param name="indexelement" select="$index_source_fields_eng"/>
            </xsl:apply-templates>
      </xsl:variable>
      <xsl:variable name="eng-group">
            <xsl:for-each-group select="$eng-list" group-by="lower-case(substring(@ie,1,1))">
                  <xsl:sort select="@ie"/>
                  <xsl:element name="alphaGroup">
                        <xsl:attribute name="alpha">
                              <xsl:value-of select="lower-case(substring(w[1]/@ie,1,1))"/>
                        </xsl:attribute>
                        <xsl:copy-of select="current-group()"/>
                  </xsl:element>
            </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="nat-list">
            <xsl:apply-templates select="//lxGroup" mode="rev">
                  <xsl:with-param name="indexelement" select="$index_source_fields_nat"/>
            </xsl:apply-templates>
      </xsl:variable>
      <xsl:variable name="nat-group">
            <xsl:for-each-group select="$nat-list" group-by="lower-case(substring(@ie,1,1))">
                  <xsl:sort select="@ie"/>
                  <xsl:element name="alphaGroup">
                        <xsl:attribute name="alpha">
                              <xsl:value-of select="lower-case(substring(w[1]/@ie,1,1))"/>
                        </xsl:attribute>
                        <xsl:copy-of select="current-group()"/>
                  </xsl:element>
            </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="reg-list">
            <xsl:apply-templates select="//lxGroup" mode="rev">
                  <xsl:with-param name="indexelement" select="$index_source_fields_reg"/>
            </xsl:apply-templates>
      </xsl:variable>
      <xsl:variable name="reg-group">
            <xsl:for-each-group select="$reg-list" group-by="lower-case(substring(@ie,1,1))">
                  <xsl:sort select="@ie"/>
                  <xsl:element name="alphaGroup">
                        <xsl:attribute name="alpha">
                              <xsl:value-of select="lower-case(substring(w[1]/@ie,1,1))"/>
                        </xsl:attribute>
                        <xsl:copy-of select="current-group()"/>
                  </xsl:element>
            </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="reg2-list">
            <xsl:apply-templates select="//lxGroup" mode="rev">
                  <xsl:with-param name="indexelement" select="$index_source_fields_reg2"/>
            </xsl:apply-templates>
      </xsl:variable>
      <xsl:variable name="reg2-group">
            <xsl:for-each-group select="$reg2-list" group-by="lower-case(substring(@ie,1,1))">
                  <xsl:sort select="@ie"/>
                  <xsl:element name="alphaGroup">
                        <xsl:attribute name="alpha">
                              <xsl:value-of select="lower-case(substring(w[1]/@ie,1,1))"/>
                        </xsl:attribute>
                        <xsl:copy-of select="current-group()"/>
                  </xsl:element>
            </xsl:for-each-group>
      </xsl:variable>
      <xsl:template match="/*">
            <xsl:call-template name="html5rootredirect">
                  <!-- make init page in root that redirects to  home page -->
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index.html')"/>
            </xsl:call-template>
            <xsl:call-template name="html5indexhome">
                  <!-- make app home page -->
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index\index.html')"/>
            </xsl:call-template>
            <xsl:for-each select="$indexes_to_build">
                  <xsl:choose>
                        <xsl:when test=". = 'ver'">
                              <xsl:text><!-- this is handled elsewhere --></xsl:text>
                        </xsl:when>
                        <!--
                        <xsl:when test=". = 'eng'">
                              <xsl:call-template select="$eng-group/alphaGroup" mode="revindex">
                                    <xsl:with-param name="indextobuild" select="."/>
                              </xsl:call-template>
                        </xsl:when>
                        <xsl:when test=". = 'nat'">
                              <xsl:call-template select="$nat-group/alphaGroup" mode="revindex">
                                    <xsl:with-param name="indextobuild" select="."/>
                              </xsl:call-template>
                        </xsl:when>
                        <xsl:when test=". = 'reg'">
                              <xsl:call-template select="$reg-group/alphaGroup" mode="revindex">
                                    <xsl:with-param name="indextobuild" select="."/>
                              </xsl:call-template>
                        </xsl:when>
                        <xsl:when test=". = 'reg2'">
                              <xsl:call-template select="$reg2-group/alphaGroup" mode="revindex">
                                    <xsl:with-param name="indextobuild" select="."/>
                              </xsl:call-template>
                        </xsl:when> -->
                        <xsl:otherwise>
                              <xsl:call-template select="${.}-group/alphaGroup" mode="revindex">
                                    <xsl:with-param name="indextobuild" select="."/>
                              </xsl:call-template>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:for-each>
            <xsl:apply-templates select="alphaGroup"/>
      </xsl:template>
      <xsl:template match="alphaGroup">
            <xsl:variable name="words-before" select="count(preceding::lxGroup)"/>
            <xsl:variable name="pre-alpha" select="preceding-sibling::*[1]/@alpha"/>
            <xsl:variable name="post-alpha" select="following-sibling::*[1]/@alpha"/>
            <xsl:call-template name="html5alphaindex">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index\',@alpha,'-index.html')"/>
                  <xsl:with-param name="words-before" select="$words-before"/>
                  <xsl:with-param name="cur-alpha" select="@alpha"/>
                  <xsl:with-param name="pre-alpha" select="$pre-alpha"/>
                  <xsl:with-param name="post-alpha" select="$post-alpha"/>
            </xsl:call-template>
            <xsl:apply-templates select="lxGroup">
                  <xsl:with-param name="words-before" select="$words-before"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="alphaGroup" mode="alphalist">
            <xsl:param name="cur-alpha"/>
            <xsl:if test="not(matches(@alpha,'^[2-9]'))">
                  <xsl:element name="a">
                        <xsl:attribute name="class">
                              <xsl:text>tab-item</xsl:text>
                              <xsl:if test="$cur-alpha = @alpha">
                                    <xsl:text> active</xsl:text>
                              </xsl:if>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                              <xsl:value-of select="concat('../index/',@alpha,'-index.html')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-transition">
                              <xsl:text>slide-in</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="@alpha"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="alphaGroup" mode="revindex">
            <xsl:param name="cur-alpha"/>
            <xsl:if test="not(matches(@alpha,'^[2-9]'))">
                  <xsl:element name="a">
                        <xsl:attribute name="class">
                              <xsl:text>tab-item</xsl:text>
                              <xsl:if test="$cur-alpha = @alpha">
                                    <xsl:text> active</xsl:text>
                              </xsl:if>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                              <xsl:value-of select="concat('../index/',@alpha,'-index.html')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-transition">
                              <xsl:text>slide-in</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="@alpha"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="alphaGroup" mode="alphalisthome">
            <xsl:param name="cur-alpha"/>
            <xsl:variable name="wordcount" select="count(lxGroup)"/>
            <xsl:if test="not(matches(@alpha,'^[2-9]'))">
                  <xsl:element name="li">
                        <xsl:attribute name="class">
                              <xsl:text>table-view-cell</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="a">
                              <xsl:attribute name="class">
                                    <xsl:text>push-right</xsl:text>
                                    <xsl:if test="$cur-alpha = @alpha">
                                          <xsl:text> active</xsl:text>
                                    </xsl:if>
                              </xsl:attribute>
                              <xsl:attribute name="href">
                                    <xsl:value-of select="concat('../index/',@alpha,'-index.html')"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-transition">
                                    <xsl:text>slide-in</xsl:text>
                              </xsl:attribute>
                              <xsl:value-of select="@alpha"/>
                              <xsl:text>&#8195;</xsl:text>
                              <xsl:element name="span">
                                    <xsl:attribute name="class">
                                          <xsl:text>indexdef</xsl:text>
                                    </xsl:attribute>
                                    <xsl:value-of select="$wordcount"/>
                              </xsl:element>
                        </xsl:element>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="lxGroup">
            <xsl:param name="words-before"/>
            <xsl:call-template name="html5word">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\words\w',format-number(number($words-before) + count(preceding-sibling::lxGroup) + 1, '00000'),'.html')"/>
                  <xsl:with-param name="words-before" select="$words-before"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template match="lxGroup" mode="index">
            <xsl:param name="words-before"/>
            <xsl:variable name="word" select="lx"/>
            <xsl:variable name="pos" select="position()"/>
            <li class="table-view-cell" id="wi{format-number(number($words-before) + number($pos), '00000')}">
                  <a data-transition="slide-in" class="push-right" href="../words/w{format-number(number($words-before) + number($pos), '00000')}.html">
                        <xsl:call-template name="hom">
                              <xsl:with-param name="string" select="$word"/>
                        </xsl:call-template>
                        <xsl:text>&#8195;</xsl:text>
                        <xsl:element name="span">
                              <xsl:attribute name="class">
                                    <xsl:text>indexdef</xsl:text>
                              </xsl:attribute>
                              <xsl:call-template name="defchooser"/>
                        </xsl:element>
                  </a>
            </li>
      </xsl:template>
      <xsl:template name="html5rootredirect">
            <xsl:param name="outputfile"/>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <!-- <xsl:with-param name="ratchet" select="'true'"/> -->
                              <xsl:with-param name="isinroot" select="'true'"/>
                              <xsl:with-param name="addredirect" select="'true'"/>
                        </xsl:call-template>
                        <body>
                              <header class="bar">
                                    <nav class="bar-nav">
                                          <!-- <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/a-index.html"></a> -->
                                          <h1 class="title">
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                                    <!-- Block button in standard bar fixed below top bar -->
                              </header>
                              <div class="content" id="content">

                              </div>
                              <footer class="bar bar-footer">
                                    <div class="bar-tab">
                                          <xsl:text><!-- empty to preserve footer --></xsl:text>
                                    </div>
                              </footer>
                              <script type="text/javascript" src="js/cordova.js"/>
                              <script type="text/javascript" src="js/index.js"/>
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5indexhome">
            <xsl:param name="outputfile"/>
            <xsl:param name="cur-alpha"/>
            <xsl:param name="pre-alpha"/>
            <xsl:param name="post-alpha"/>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <xsl:with-param name="ratchet" select="'true'"/>
                              <xsl:with-param name="silpdict" select="'true'"/>
                              <!-- <xsl:with-param name="isinroot" select="'true'"/> -->
                              <!-- <xsl:with-param name="addredirect" select="'true'"/> -->
                        </xsl:call-template>
                        <body>
                              <header class="bar">
                                    <nav class="bar-nav">
                                          <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/a-index.html"></a>
                                          <h1 class="title">
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                                    <!-- Block button in standard bar fixed below top bar -->
                              </header>
                              <div class="content" id="content">
                                    <div class="card" style="margin:55px 8px 55px 8px">
                                          <div class="table-view">
                                                <!-- <div class="slide-group"> -->
                                                <xsl:apply-templates select="/*/alphaGroup" mode="alphalisthome">
                                                      
                                                      <!-- <xsl:with-param name="cur-alpha" select="$cur-alpha"/> -->
                                                </xsl:apply-templates>
                                                <!-- </div> -->
                                          </div>
                                    </div>
                              </div>
                              <script type="text/javascript" src="js/cordova.js"/>
                              <script type="text/javascript" src="js/index.js"/>
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5alphaindex">
            <xsl:param name="outputfile"/>
            <xsl:param name="words-before"/>
            <xsl:param name="addcordovascripts"/>
            <xsl:param name="cur-alpha"/>
            <xsl:param name="pre-alpha"/>
            <xsl:param name="post-alpha"/>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <!-- <xsl:with-param name="purecss" select="'true'"/> -->
                              <xsl:with-param name="ratchet" select="'true'"/>
                              <!-- <xsl:with-param name="hammer" select="'true'"/> -->
                              <!-- <xsl:with-param name="android" select="'true'"/> -->
                        </xsl:call-template>
                        <!-- <xsl:call-template name="head"/> -->
                        <body>
                              <!--<script type="text/javascript">
                                    <xsl:call-template name="hammer-local-index"/>
                              </script> -->
                              <!-- Make sure all your bars are the first things in your <body> -->
                              <header class="bar">
                                    <nav class="bar-nav">
                                          <a data-transition="slide-out" class="icon icon-left-nav pull-left" id="left" href="../index/{$pre-alpha}-index.html"></a>
                                          <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/{$post-alpha}-index.html"></a>
                                          <h1 class="title">
                                                <a data-transition="slide-out" class="icon icon-bars " id="index" href="index.html"></a>
                                                <xsl:text>&#8195;&#8195;</xsl:text>
                                                <xsl:value-of select="$langname"/>
                                                <xsl:text> Index </xsl:text>
                                                <xsl:value-of select="upper-case($cur-alpha)"/>
                                          </h1>
                                    </nav>
                                    <!-- Block button in standard bar fixed below top bar -->
                              </header>
                              <div class="content" id="content">
                                    <div class="card" style="margin:55px 10px 55px 10px">
                                          <ul class="table-view">
                                                <!-- <li class="table-view-cell">&#160;</li> -->
                                                <xsl:apply-templates select="lxGroup" mode="index">
                                                      <xsl:with-param name="words-before" select="$words-before"/>
                                                </xsl:apply-templates>
                                          </ul>
                                    </div>
                              </div>
                              <!-- <script src="../js/hammer.min.js"></script> -->
                              <!-- <script type="text/javascript" src="js/cordova.js"/> -->
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5word">
            <xsl:param name="outputfile"/>
            <xsl:param name="words-before"/>
            <xsl:param name="addcordovascripts"/>
            <!-- <xsl:variable name="presiblings" select="count(preceding-sibling::lxGroup)"/> -->
            <xsl:variable name="presiblings">
                  <!--  This is to prevent errors on first and last entry. It points to self not non existant next -->
                  <xsl:choose>
                        <xsl:when test="count(following::lxGroup[1]) = 0">
                              <xsl:value-of select="count(preceding-sibling::lxGroup) - 1"/>
                        </xsl:when>
                        <xsl:when test="count(preceding::lxGroup[1]) = 0">
                              <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="count(preceding-sibling::lxGroup)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:value-of select="$file"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <!-- <xsl:with-param name="purecss" select="'true'"/> -->
                              <xsl:with-param name="ratchet" select="'true'"/>
                              <xsl:with-param name="silpdict" select="'true'"/>
                              <!-- <xsl:with-param name="hammer" select="'true'"/> -->
                              <!-- <xsl:with-param name="android" select="'true'"/> -->
                        </xsl:call-template>
                        <body>
                              <!-- <script type="text/javascript">
                                    <xsl:call-template name="hammer-local-conc"/>
                              </script> -->
                              <!-- Make sure all your bars are the first things in your <body> -->
                              <header class="bar">
                                    <nav class="bar-nav " style="text-align:center">
                                          <a data-transition="slide-out" class="icon icon-left-nav pull-left" id="left" href="../words/w{format-number(number($words-before) + $presiblings , '00000')}.html"></a>
                                          <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../words/w{format-number(number($words-before) + $presiblings + 2, '00000')}.html"></a>
                                          <h1 class="title">
                                                <a data-transition="slide-out" class="icon icon-bars " id="index" href="../index/{lower-case(substring(replace(lx,'^\-',''),1,1))}-index.html#wi{format-number(number($words-before) + $presiblings  + 1, '00000')}"></a>
                                                <xsl:text>&#8195;&#8195;</xsl:text>
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                              </header>
                              <div class="content" id="content">
                                    <div style="margin: 55px 10pt 55px 40px">
                                          <xsl:apply-templates select="*"/>
                                    </div>
                              </div>
                              <!-- <script src="../js/hammer.min.js"></script> -->
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="*">
            <!-- Generic data handling template                                                  -->
            <div class="{name(.)}">
                  <span class="d">
                        <xsl:choose>
                              <xsl:when test="name() = 'lx'">
                                    <xsl:call-template name="hom">
                                          <xsl:with-param name="string" select="."/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:apply-templates/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </span>
            </div>
      </xsl:template>
      <xsl:template match="*[local-name() = $groupdivs]">
            <!-- list for group div level elements from web-present-groups.txt -->
            <xsl:element name="div">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                  </xsl:attribute>
                  <xsl:if test="name() = 'msGroup'">
                        <xsl:attribute name="id">
                              <xsl:choose>
                                    <xsl:when test="ms = ''">
                                          <xsl:text>calc_sense</xsl:text>
                                          <xsl:value-of select="count(preceding-sibling::msGroup) + 1"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:text>sense</xsl:text>
                                          <xsl:value-of select="ms"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:attribute>
                        <xsl:attribute name="mspos">
                              <xsl:value-of select="count(preceding-sibling::msGroup) + 1"/>
                        </xsl:attribute>
                  </xsl:if>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="*[local-name() = $inlinespans]">
            <!-- list for span type elements like charbold|charitbold|charitalic  web-present-inline-spans.txt -->
            <span class="{name(.)}">
                  <xsl:apply-templates/>
            </span>
      </xsl:template>
      <xsl:template match="*[local-name() = $omit]" name="omit_elements"/>
      <!-- fields to be removed web-present-omit.txt -->
      <xsl:template match="*[local-name() = $sensehom]">
            <!-- fields to be tested for homonym numbers web-present-sense-hom.txt -->
            <xsl:param name="field" select="name()"/>
            <xsl:choose>
                  <xsl:when test="name() = $sensehomgrouped">
                        <span>
                              <xsl:attribute name="class">
                                    <xsl:value-of select="name()"/>
                                    <xsl:text> d</xsl:text>
                                    <xsl:call-template name="serialposition">
                                          <xsl:with-param name="followingsiblings" select="count(following-sibling::*[name() = $field])"/>
                                    </xsl:call-template>
                              </xsl:attribute>
                              <xsl:choose>
                                    <xsl:when test="child::link">
                                          <xsl:apply-templates/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:call-template name="hom">
                                                <xsl:with-param name="string" select="."/>
                                          </xsl:call-template>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </span>
                  </xsl:when>
                  <xsl:otherwise>
                        <div class="{name()}">
                              <span>
                                    <xsl:attribute name="class">
                                          <xsl:text>d</xsl:text>
                                          <xsl:call-template name="serialposition">
                                                <xsl:with-param name="followingsiblings" select="count(following-sibling::*[name() = $field])"/>
                                          </xsl:call-template>
                                    </xsl:attribute>
                                    <xsl:choose>
                                          <xsl:when test="child::link">
                                                <xsl:apply-templates/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:call-template name="hom">
                                                      <xsl:with-param name="string" select="."/>
                                                </xsl:call-template>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </span>
                        </div>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[local-name() = $csstranslate]">
            <!-- handle translation of abbreviations into full word in css -->
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="name()"/>
                        <xsl:text>_</xsl:text>
                        <xsl:value-of select="translate(.,$transfrom,$transto)"/>
                        <!-- period removed from abbreviation -->
                  </xsl:attribute>
            </xsl:element>
      </xsl:template>
      <xsl:template match="*[local-name() = $serialnodesnothom]">
            <!-- like sens hom but can't use that as it has numbers. But needs the last class added -->
            <xsl:param name="field" select="name()"/>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                        <xsl:text> d</xsl:text>
                        <xsl:call-template name="serialposition">
                              <xsl:with-param name="followingsiblings" select="count(following-sibling::*[name() = $field])"/>
                        </xsl:call-template>
                  </xsl:attribute>
                  <xsl:choose>
                        <xsl:when test="child::link">
                              <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:apply-templates/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:element>
      </xsl:template>
      <xsl:template match="ms">
            <!-- used to add sense number when they are absent -->
            <span class="{name(.)}">
                  <xsl:choose>
                        <xsl:when test=". = ''">
                              <xsl:value-of select="preceding-sibling::msGroup/@mspos"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:apply-templates/>
                        </xsl:otherwise>
                  </xsl:choose>
            </span>
      </xsl:template>
      <xsl:template match="co">
            <!-- This is needed to differentiate the \co field in different contexts for some dicts
			The \co is used as a second \gl field and sometimes as a comment field.  -->
            <xsl:element name="div">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                        <xsl:text> co-</xsl:text>
                        <xsl:value-of select="name(preceding-sibling::*[1])"/>
                        <xsl:text></xsl:text>
                  </xsl:attribute>
                  <span class="d">
                        <xsl:apply-templates/>
                  </span>
            </xsl:element>
      </xsl:template>
      <xsl:template name="serialposition">
            <xsl:param name="followingsiblings"/>
            <xsl:choose>
                  <xsl:when test="$followingsiblings = 0"/>
                  <xsl:otherwise>
                        <xsl:text> comma</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="homsense">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($string,'\d\s\d$')">
                        <!-- determine if string ends in a number space number sequence
                        <xsl:text>T1m1</xsl:text> -->
                        <xsl:call-template name="homandsenseparse">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($string,'[^\d]\s\d$')">
                        <!-- determine if string ends in a non-number space number sequence
                        <xsl:text>T1m2</xsl:text> -->
                        <xsl:call-template name="test2homorsenseafterspace">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($string,'[^\d]\d$')">
                        <!-- determine if string ends in a non-number space number sequence
                        <xsl:text>T1m3</xsl:text> -->
                        <xsl:call-template name="hom">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- string does not end in a number, return string
                        <xsl:text>T1m0</xsl:text> -->
                        <xsl:value-of select="$string"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="homandsenseparse">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="wordhom" select="substring($string,1,$len - 2)"/>
            <xsl:variable name="sensenumb" select="substring($string,$len,1)"/>
            <xsl:call-template name="hom">
                  <xsl:with-param name="string" select="$wordhom"/>
            </xsl:call-template>
            <xsl:call-template name="sense">
                  <xsl:with-param name="sense" select="$sensenumb"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template name="test2homorsenseafterspace">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="word" select="substring($string,1,$len - 2)"/>
            <xsl:variable name="lastnumb" select="substring($string,$len,1)"/>
            <xsl:choose>
                  <xsl:when test="$spacebeforehom = $true">
                        <!-- check if space before hom number param is set
                     <xsl:text>T2m1</xsl:text> -->
                        <xsl:call-template name="hom">
                              <!-- when space before hom number param is set, remove space -->
                              <xsl:with-param name="string" select="concat($word,$lastnumb)"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- when no space before hom number param is set, process as word and sense  <xsl:text>T2</xsl:text>-->
                        <xsl:value-of select="$word"/>
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="sense">
                              <xsl:with-param name="sense" select="$lastnumb"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="sense">
            <xsl:param name="sense"/>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>sense</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="$sense"/>
            </xsl:element>
      </xsl:template>
      <xsl:template name="hom">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="word" select="normalize-space(substring($string,1,$len - 1))"/>
            <xsl:variable name="homnumb" select="substring($string,$len,1)"/>
            <xsl:choose>
                  <xsl:when test="matches($string,'\d$')">
                        <xsl:value-of select="$word"/>
                        <span class="sub">
                              <xsl:value-of select="$homnumb"/>
                        </span>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="linkold">
            <xsl:variable name="len" select="string-length(.)"/>
            <xsl:variable name="sense" select="substring(.,$len,1)"/>
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:text>../words/w</xsl:text>
                        <xsl:value-of select="@data"/>
                        <xsl:text>.html</xsl:text>
                        <xsl:if test="matches(following-sibling::text()[1],'\s\d$') and string-length(following-sibling::text()[1]) = 2">
                              <xsl:text>#sense</xsl:text>
                              <xsl:value-of select="translate(following-sibling::text()[1],' ','')"/>
                        </xsl:if>
                  </xsl:attribute>
                  <xsl:if test="matches(following-sibling::text()[1],'\s\d$') and string-length(following-sibling::text()[1]) = 2">
                        <xsl:attribute name="class">
                              <xsl:text>senseafter</xsl:text>
                        </xsl:attribute>
                  </xsl:if>
                  <xsl:call-template name="hom">
                        <xsl:with-param name="string" select="."/>
                  </xsl:call-template>
            </xsl:element>
      </xsl:template>
      <xsl:template match="link">
            <xsl:variable name="len" select="string-length(.)"/>
            <xsl:variable name="sense" select="substring(.,$len,1)"/>
            <xsl:choose>
                  <xsl:when test="ancestor::lxGroup/lx = .">
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="a">
                              <xsl:attribute name="href">
                                    <xsl:text>../words/w</xsl:text>
                                    <xsl:value-of select="@data"/>
                                    <xsl:text>.html</xsl:text>
                                    <xsl:choose>
                                          <xsl:when test="parent::rt">
                                                <xsl:text>#table</xsl:text>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:if test="matches(following-sibling::sense[1],'\d$')">
                                                      <xsl:text>#sense</xsl:text>
                                                      <xsl:value-of select="following-sibling::sense[1]"/>
                                                </xsl:if>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                              <xsl:attribute name="title">
                                    <xsl:value-of select="@title"/>
                              </xsl:attribute>
                              <xsl:call-template name="hom">
                                    <xsl:with-param name="string" select="."/>
                              </xsl:call-template>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="tb">
            <xsl:element name="table">
                  <xsl:attribute name="class">
                        <xsl:value-of select="concat('tb_',translate(tabletitle,$transfrom,$transto))"/>
                  </xsl:attribute>
                  <!-- <xsl:if test="lxGroup//tb[1]"> </xsl:if> -->
                  <xsl:attribute name="id">
                        <xsl:text>table-</xsl:text>
                        <xsl:value-of select="count(preceding-sibling::tb)+1"/>
                  </xsl:attribute>
                  <caption class="tabletitle">
                        <xsl:apply-templates select="tabletitle"/>
                        <xsl:apply-templates select="tablesubtitle"/>
                  </caption>
                  <tbody>
                        <xsl:apply-templates select="*[not(matches(name(),'title'))]"/>
                  </tbody>
            </xsl:element>
      </xsl:template>
      <xsl:template match="c1|c2|c3|c4|c5|c6|c7|c8|c9|c10|td">
            <xsl:element name="td">
                  <xsl:attribute name="class">
                        <xsl:choose>
                              <xsl:when test="name() = 'td'">
                                    <xsl:value-of select="concat('c',count(preceding-sibling::*) +1)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="name()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="headrow">
            <xsl:element name="tr">
                  <xsl:attribute name="class">
                        <xsl:choose>
                              <xsl:when test="name() = 'th'">
                                    <xsl:value-of select="concat('c',count(preceding-sibling::*) +1)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="name()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="trow|row">
            <xsl:element name="tr">
                  <xsl:attribute name="class">
                        <xsl:value-of select="concat('r',count(preceding-sibling::*) +1)"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="tabletitle|tablesubtitle">
            <div class="name()">
                  <xsl:apply-templates/>
            </div>
      </xsl:template>
      <xsl:template match="gl" mode="index">
            <xsl:value-of select="."/>
            <xsl:text>; </xsl:text>
      </xsl:template>
      <xsl:template match="ie" mode="index">
            <xsl:value-of select="."/>
            <xsl:text>; </xsl:text>
      </xsl:template>
      <xsl:template name="defchooser">
            <xsl:choose>
                  <xsl:when test="descendant::ie">
                        <xsl:apply-templates select="descendant::ie" mode="index"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="descendant::gl" mode="index"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="lxGroup" mode="rev">
            <xsl:param name="indexelement"/>
            <xsl:variable name="pos" select="position()"/>
            <xsl:choose>
                  <xsl:when test="descendant::*[name() = $indexelement]">
                        <xsl:apply-templates select="$indexelement" mode="rev">
                              <xsl:with-param name="pos" select="$pos"/>
                        </xsl:apply-templates>
                  </xsl:when>
                  <xsl:when test="$indexelement = 'ie'">
                        <xsl:apply-templates select="gl" mode="rev">
                              <xsl:with-param name="pos" select="$pos"/>
                        </xsl:apply-templates>
                  </xsl:when>
                  <xsl:when test="$indexelement = 're'">
                        <xsl:apply-templates select="de" mode="rev">
                              <xsl:with-param name="pos" select="$pos"/>
                        </xsl:apply-templates>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="ie|gl|it|ii|iv|de|re|rn|rr|rr2" mode="rev">
            <xsl:param name="pos"/>
            <xsl:element name="w">
                  <xsl:attribute name="ie">
                        <xsl:value-of select="."/>
                  </xsl:attribute>
                  <xsl:attribute name="lx">
                        <xsl:value-of select="preceding::lx[1]"/>
                  </xsl:attribute>
                  <xsl:attribute name="pos">
                        <xsl:value-of select="$pos"/>
                  </xsl:attribute>
            </xsl:element>
      </xsl:template>
      <xsl:template match="w" mode="wordlist">
            <xsl:copy-of select=""/>
      </xsl:template>
      <xsl:template name="hammer-local-index">
var content = document.getElementById('content');

// create a simple instance
// by default, it only adds horizontal recognizers
var mc = new Hammer(content);

// listen to events...
mc.on("swipeleft swiperight pinch", function(ev) {
    if (ev.type = 'swiperight') {
    document.getElementById('right').click();
} else if (ev.type = 'swipeleft') {
    document.getElementById('left').click();
} 

});
</xsl:template>
      <xsl:template name="hammer-local-conc">
var content = document.getElementById('content');

// create a simple instance
// by default, it only adds horizontal recognizers
var mc = new Hammer(content);

// listen to events...
mc.on("swipeleft swiperight pinch", function(ev) {
    if (ev.type = 'swiperight') {
    document.getElementById('right').click();
} else if (ev.type = 'swipeleft') {
    document.getElementById('left').click();
} else if (ev.type = 'pinch') {
    document.getElementById('indexlink').click();
} 
});
</xsl:template>
</xsl:stylesheet>
