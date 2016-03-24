<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     bible-conc-app-make-pages.xslt
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
      <xsl:template match="/*">
            <xsl:call-template name="html5cordovaindex">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index\index.html')"/>
            </xsl:call-template>
            <xsl:call-template name="html5cordovalanding">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index.html')"/>
            </xsl:call-template>
            <xsl:apply-templates select="alphaGroup"/>
      </xsl:template>
      <xsl:template match="alphaGroup">
            <xsl:variable name="words-before" select="count(preceding::w)"/>
            <xsl:variable name="pre-alpha" select="preceding-sibling::*[1]/@alpha"/>
            <xsl:variable name="post-alpha" select="following-sibling::*[1]/@alpha"/>
            <xsl:call-template name="html5index">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\index\',@alpha,'-list.html')"/>
                  <xsl:with-param name="words-before" select="$words-before"/>
                  <xsl:with-param name="cur-alpha" select="@alpha"/>
                  <xsl:with-param name="pre-alpha" select="$pre-alpha"/>
                  <xsl:with-param name="post-alpha" select="$post-alpha"/>
            </xsl:call-template>
            <xsl:apply-templates select="w">
                  <xsl:with-param name="words-before" select="$words-before"/>
                  <xsl:with-param name="cur-alpha" select="@alpha"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="w" mode="index">
            <xsl:param name="words-before"/>
            <li class="table-view-cell" id="wi{format-number(number($words-before) + count(preceding-sibling::w) + 1, '00000')}">
                  <a data-transition="slide-in" class="push-right" href="../words/w{format-number(number($words-before) + count(preceding-sibling::w) + 1, '00000')}.html">
                        <xsl:value-of select="@word"/>
                        <xsl:text>&#8195;</xsl:text>
                        <xsl:value-of select="@count"/>
                  </a>
            </li>
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
                              <xsl:value-of select="concat('../index/',@alpha,'-list.html')"/>
                        </xsl:attribute>
                        <xsl:attribute name="data-transition">
                              <xsl:text>slide-in</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="style">
                              <xsl:text>padding: 9pt 9pt 9pt 9pt; text-decoration:none;display: inline-block;</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="@alpha"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="alphaGroup" mode="alphalisthome">
            <xsl:param name="cur-alpha"/>
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
                                    <xsl:value-of select="concat('../index/',@alpha,'-list.html')"/>
                              </xsl:attribute>
                              <xsl:attribute name="data-transition">
                                    <xsl:text>slide-in</xsl:text>
                              </xsl:attribute>
                              <xsl:value-of select="@alpha"/>
                        </xsl:element>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <xsl:template match="w">
            <xsl:param name="words-before"/>
            <xsl:param name="cur-alpha"/>
            <xsl:call-template name="html5wordconc">
                  <xsl:with-param name="outputfile" select="concat($projectpath,'\cordova\www\words\w',format-number(number($words-before) + count(preceding-sibling::w) + 1, '00000'),'.html')"/>
                  <xsl:with-param name="words-before" select="$words-before"/>
                  <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template match="bk">
            <p class="book">
                  <xsl:choose>
                        <xsl:when test="matches(@book,'^\d')">
                              <xsl:value-of select="substring(@book,1,2)"/>
                              <xsl:value-of select="lower-case(substring(@book,3,1))"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="substring(@book,1,1)"/>
                              <xsl:value-of select="lower-case(substring(@book,2,2))"/>
                        </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text> </xsl:text>
                  <xsl:apply-templates select="chapter"/>
                  <xsl:text> </xsl:text>
            </p>
      </xsl:template>
      <xsl:template match="chapter">
            <span class="chap">
                  <xsl:value-of select="@number"/>
            </span>
            <xsl:text>:</xsl:text>
            <xsl:apply-templates select="verse"/>
            <xsl:if test="position() ne last()">
                  <xsl:text>; </xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="verse">
            <xsl:choose>
                  <xsl:when test="preceding-sibling::verse[1]/@number = @number"/>
                  <xsl:otherwise>
                        <xsl:if test="position() ne 1">
                              <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@number"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="footer">
            <xsl:param name="cur-alpha"/>
            <footer class="bar bar-footer">
                  <div class="bar-nav" style="white-space: nowrap;  overflow-x: auto;  -webkit-overflow-scrolling: touch;  -ms-overflow-style: -ms-autohiding-scrollbar;">
                        <xsl:apply-templates select="/*/alphaGroup" mode="alphalist">
                              <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
                        </xsl:apply-templates>
                  </div>
            </footer>
      </xsl:template>
      <xsl:template name="html5index">
            <xsl:param name="outputfile"/>
            <xsl:param name="words-before"/>
            <xsl:param name="addcordovascripts"/>
            <xsl:param name="cur-alpha"/>
            <xsl:param name="pre-alpha"/>
            <xsl:param name="post-alpha"/>
            <xsl:variable name="pre-alpha-fix">
                  <xsl:choose>
                        <xsl:when test="string-length($pre-alpha) = 0">
                              <xsl:value-of select="$cur-alpha"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="$pre-alpha"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="post-alpha-fix">
                  <xsl:choose>
                        <xsl:when test="string-length($post-alpha) = 0">
                              <xsl:value-of select="$cur-alpha"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="$post-alpha"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <!-- <xsl:with-param name="purecss" select="'true'"/> -->
                              <!-- <xsl:with-param name="ratchet" select="'true'"/> -->
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
                                          <a data-transition="slide-out" class="icon icon-left-nav pull-left" id="left" href="../index/{$pre-alpha-fix}-list.html"></a>
                                          <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/{$post-alpha-fix}-list.html"></a>
                                          <h1 class="title">
                                                <a data-transition="slide-out" class="icon icon-bars " id="index" href="index.html"></a>
                                                <xsl:text>&#8195;&#8195;</xsl:text>
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                                    <!-- Block button in standard bar fixed below top bar -->
                              </header>
                              <div class="content" id="content">
                                    <div class="card" style="margin:55px 10px 55px 10px">
                                          <ul class="table-view">
                                                <!-- <li class="table-view-cell">&#160;</li> -->
                                                <xsl:apply-templates select="w" mode="index">
                                                      <xsl:with-param name="words-before" select="$words-before"/>
                                                </xsl:apply-templates>
                                          </ul>
                                    </div>
                              </div>
                              <!--    <div class="bar bar-footer">
                                    <div class="bar-tab">
                                          <xsl:apply-templates select="/*/alphaGroup" mode="alphalist">
                                                <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
                                          </xsl:apply-templates>
                                    </div>
                              </div> -->
                              <xsl:call-template name="footer">
                                    <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
                              </xsl:call-template>
                              <!-- <script src="../js/hammer.min.js"></script> -->
                              <!-- <script type="text/javascript" src="js/cordova.js"/> -->
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5wordconc">
            <xsl:param name="outputfile"/>
            <xsl:param name="cur-alpha"/>
            <xsl:param name="words-before"/>
            <xsl:param name="addcordovascripts"/>
            <!-- <xsl:variable name="presiblings" select="count(preceding-sibling::w)"/> -->
            <xsl:variable name="presiblings">
                  <!--  This is to prevent errors on first and last entry. It points to self not non existant next -->
                  <xsl:choose>
                        <xsl:when test="count(following::w[1]) = 0">
                              <xsl:value-of select="count(preceding-sibling::w) - 1"/>
                        </xsl:when>
                        <xsl:when test="count(preceding::w[1]) = 0">
                              <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="count(preceding-sibling::w)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:value-of select="$file"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <!-- <xsl:with-param name="purecss" select="'true'"/> -->
                              <!-- <xsl:with-param name="ratchet" select="'true'"/> -->
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
                                                <a data-transition="slide-out" class="icon icon-bars " id="index" href="../index/{lower-case(substring(@word,1,1))}-list.html#wi{format-number(number($words-before) + $presiblings  + 1, '00000')}"></a>
                                                <xsl:text>&#8195;&#8195;</xsl:text>
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                              </header>
                              <div class="content" id="content">
                                    <div style="margin: 55px 10pt 55px 10pt">
                                          <xsl:element name="h2">
                                                <xsl:value-of select="@word"/>
                                          </xsl:element>
                                          <xsl:apply-templates select="bk"/>
                                    </div>
                                    <!--<div class="bar bar-footer">
                                          <div class="bar-tab">
                                                
                                                <xsl:text></xsl:text>
                                          </div>
                                    </div> -->
                              </div>
                              <xsl:call-template name="footer">
                                    <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
                              </xsl:call-template>
                              <!-- <script src="../js/hammer.min.js"></script> -->
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5cordovaindex">
            <xsl:param name="outputfile"/>
            <xsl:param name="cur-alpha"/>
            <xsl:param name="pre-alpha"/>
            <xsl:param name="post-alpha"/>
            <xsl:variable name="file" select="f:file2uri($outputfile)"/>
            <xsl:result-document href="{$file}" format="html5">
                  <html>
                        <xsl:call-template name="head">
                              <xsl:with-param name="ratchet" select="'true'"/>
                              <xsl:with-param name="isapphome" select="'true'"/>
                              <xsl:with-param name="hammer" select="'true'"/>
                              <!-- <xsl:with-param name="isinroot" select="'true'"/> -->
                              <!-- <xsl:with-param name="addredirect" select="'true'"/> -->
                        </xsl:call-template>
                        <body>
                              <header class="bar">
                                    <nav class="bar-nav">
                                          <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/a-list.html"></a>
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
                              <xsl:call-template name="footer">
                                    <xsl:with-param name="cur-alpha" select="$cur-alpha"/>
                              </xsl:call-template>
                              <script type="text/javascript" src="js/cordova.js"/>
                              <script type="text/javascript" src="js/index.js"/>
                              <script type="text/javascript">app.initialize();</script>
                        </body>
                  </html>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="html5cordovalanding">
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
                                          <!-- <a data-transition="slide-in" class="icon icon-right-nav pull-right" id="right" href="../index/a-list.html"></a> -->
                                          <h1 class="title">
                                                <xsl:value-of select="$title"/>
                                          </h1>
                                    </nav>
                                    <!-- Block button in standard bar fixed below top bar -->
                              </header>
                              <div class="content" id="content">

                              </div>
                              <footer class="bar bar-footer">
                                    <div class="bar-nav">
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
