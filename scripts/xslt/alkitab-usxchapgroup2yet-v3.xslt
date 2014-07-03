<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:        	alkitab-usxchaptergroup2yet.xslt
    # Purpose:		Take a single chapter grouped USX file and generate a YET file for Alkitab (Quick Bible) app
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Sub-project:	Alkitab YES file generator from Paratext USX files
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-05-24
    # Copyright:    	(c) 2014 SIL International
    # Licence:      	<LPGL>
    ################################################################

Note:
verse is in rebuild
add handling for parallel passages
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <!--
      <xsl:include href="project-param.xslt"/> -->
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="project.xslt"/>
      <!-- <xsl:include href="inc-replace.xslt"/> -->
      <xsl:strip-space elements="*"/>
      <xsl:variable name="non-scr-para-list" select="concat($non-scr-para-list-additions,' ',$section-para-list,'  ',$parallel-para-list)"/>
      <xsl:variable name="section-or-parallel-para-list" select="concat($parallel-para-list,' ',$section-para-list)"/>
      <xsl:variable name="verbookname2xrefnumb-set" select="unparsed-text(f:file2uri($verbookname2xrefnumb-file))"/>
      <xsl:variable name="book-number-set" select="unparsed-text(f:file2uri($alkitabbooknumber-file))"/>
      <xsl:variable name="refessentialreplacefixes" select="
'; (\d+:)=, $1=		ESSENTIAL DO NOT REMOVE Replace semicolon with comma where it is in the same book
--=–=				ESSENTIAL DO NOT REMOVE Replace double hyphen with en dash
(\d+)\-(\d+)=$1‒$2=	ESSENTIAL DO NOT REMOVE Replace hyphen between numbers with \u2012 char'
"/>
      <!-- The above are essentials ro replacements in ref either x or r -->
      <xsl:variable name="xref-replace-set">
            <xsl:choose>
                  <xsl:when test="unparsed-text-available(f:file2uri($xrefreplacesetfile)) and string-length(unparsed-text(f:file2uri($xrefreplacesetfile))) gt 0">
                        <xsl:value-of select="replace(concat($refessentialreplacefixes,'&#13;&#10;',unparsed-text(f:file2uri($xrefreplacesetfile))),'&#13;&#10;$','')"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$refessentialreplacefixes"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <xsl:variable name="rref-replace-set">
            <xsl:choose>
                  <xsl:when test="unparsed-text-available(f:file2uri($rrefreplacesetfile)) and string-length(unparsed-text(f:file2uri($rrefreplacesetfile))) gt 0">
                        <xsl:value-of select="replace(concat($refessentialreplacefixes,'&#13;&#10;',unparsed-text(f:file2uri($rrefreplacesetfile))),'&#13;&#10;$','')"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$refessentialreplacefixes"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <xsl:variable name="non-scr-para" select="tokenize($non-scr-para-list,'\s+')"/>
      <xsl:variable name="section-para-array" select="tokenize($section-para-list,'\s+')"/>
      <xsl:variable name="parallel-para-array" select="tokenize($parallel-para-list,'\s+')"/>
      <xsl:variable name="section-or-parallel-para-array" select="tokenize($section-or-parallel-para-list,'\s+')"/>
      <xsl:variable name="scr-para" select="tokenize($scr-para-set,'\s+')"/>
      <xsl:variable name="scr-para-in-verse" select="tokenize(replace($scr-para-set,'p=@\^','p=@0'),'\s+')"/>
      <xsl:variable name="fullregex" select="'^(\d?[A-Za-z\.\- ]+) (\d+):(\d+)'"/>
      <xsl:variable name="anyhyphen" select="'[&#x2012;&#x2013;&#x2014;]'"/>
      <xsl:variable name="truearray" select="tokenize('on yes true',' ')"/>
      <xsl:template match="/">
            <!-- info data from parameters -->
            <xsl:text>info	shortName	</xsl:text>
            <xsl:value-of select="$shortName"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>info	title	</xsl:text>
            <xsl:value-of select="$title"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>info	longName	</xsl:text>
            <xsl:value-of select="$longName"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>info	description	</xsl:text>
            <xsl:value-of select="$description"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>info	locale	</xsl:text>
            <xsl:value-of select="$locale"/>
            <!-- add Book names -->
            <xsl:apply-templates select="data/usx" mode="bookname"/>
            <!-- Add verse data to file -->
            <xsl:apply-templates select="data/usx"/>
            <!-- Not implimented - Add Section headers and cross references (\s=pericope and \r =parallel) -->
            <xsl:apply-templates select="//para[@style = $section-or-parallel-para-array]" mode="section"/>
            <xsl:if test="$includexref = $truearray">
                  <!-- Implimented but with problems- Add x ref handling  -->
                  <xsl:apply-templates select="//chapterGroup//note[@style = 'x']" mode="xref"/>
            </xsl:if>
            <!-- Not implimented - Add footnote handling  -->
            <xsl:apply-templates select="//chapterGroup//note[@style = 'f']" mode="footnote"/>
      </xsl:template>
      <xsl:template match="usx" mode="bookname">
            <!-- generates each book name for YET file -->
            <xsl:variable name="bookname" select="bookGroup/para[@style = 'h']"/>
            <xsl:variable name="bookname">
                  <xsl:choose>
                        <xsl:when test="string-length(f:bookname(@book)) gt 0">
                              <xsl:value-of select="f:bookname(@book)"/>
                        </xsl:when>
                        <xsl:when test="string-length(bookGroup/para[@style = 'h']) gt 0">
                              <xsl:value-of select="bookGroup/para[@style = 'h']"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <!-- error message returned -->
                              <xsl:text>XXXX[ no \h or name in book names]</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>book_name	</xsl:text>
            <xsl:value-of select="f:book_numb(@book)"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="$bookname"/>
      </xsl:template>
      <xsl:template match="usx">
            <!-- get book number for later use -->
            <xsl:variable name="booknumb" select="f:book_numb(@book)"/>
            <xsl:apply-templates select="chapterGroup">
                  <xsl:with-param name="booknumb" select="$booknumb"/>
            </xsl:apply-templates >
      </xsl:template>
      <xsl:template match="chapterGroup">
            <!-- Get chapter number for later use and pass on book number -->
            <xsl:param name="booknumb"/>
            <xsl:variable name="chapter" select="@number"/>
            <xsl:apply-templates select="*">
                  <xsl:with-param name="booknumb" select="$booknumb"/>
                  <xsl:with-param name="chapter" select="$chapter"/>
            </xsl:apply-templates >
      </xsl:template>
      <xsl:template match="para">
            <!-- removes non scr paragraphs and passes on booknumb and chapter param -->
            <xsl:param name="booknumb"/>
            <xsl:param name="chapter"/>
            <xsl:choose>
                  <xsl:when test="@style = $non-scr-para"/>
                  <xsl:otherwise>
                        <xsl:if test="name(child::node()[1]) ne 'verse'">
                              <!-- if the first node of the para is not a verse then insert  -->
                              <xsl:value-of select="f:scr_para(@style)"/>
                        </xsl:if>
                        <xsl:apply-templates select="node()">
                              <xsl:with-param name="booknumb" select="$booknumb"/>
                              <xsl:with-param name="chapter" select="$chapter"/>
                        </xsl:apply-templates >
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="para" mode="section">
            <xsl:variable name="book" select="ancestor::chapterGroup/@book"/>
            <xsl:variable name="booknumb" select="f:book_numb($book)"/>
            <xsl:variable name="curchap" select="ancestor::chapterGroup/@number"/>
            <xsl:variable name="curverse" select="f:bridgefix(following::verse[1]/@number)"/>
            <xsl:choose>
                  <xsl:when test="@style = $section-para-array">
                        <xsl:text>&#10;pericope&#9;</xsl:text>
                        <xsl:value-of select="$booknumb"/>
                        <!-- book number -->
                        <xsl:text>&#9;</xsl:text>
                        <!-- chapter number -->
                        <xsl:value-of select="$curchap"/>
                        <xsl:text>&#9;</xsl:text>
                        <!-- Verse number -->
                        <xsl:value-of select="translate($curverse,'abcde','')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <xsl:when test="@style = $parallel-para-array">
                        <xsl:variable name="book" select="replace(.,concat($fullregex,'.*'),'$1')"/>
                        <!-- this is used to keep ref with out book name connected by commas to the book name, but  where a new book occurs the semi colon is preserved -->
                        <xsl:variable name="userfixedstring">
                              <xsl:variable name="finditem" select="1"/>
                              <xsl:variable name="returnitem" select="2"/>
                              <xsl:variable name="primaryseparator" select="'\r?\n'"/>
                              <xsl:variable name="secondaryseparator" select="'='"/>
                              <xsl:variable name="wholearray" select="tokenize($xref-replace-set,$primaryseparator)"/>
                              <xsl:call-template name="replace-slave">
                                    <xsl:with-param name="seq" select="1"/>
                                    <xsl:with-param name="string" select="translate(.,'()','')"/>
                                    <xsl:with-param name="wholearray" select="$wholearray"/>
                                    <xsl:with-param name="secondaryseparator" select="$secondaryseparator"/>
                                    <xsl:with-param name="finditem" select="1"/>
                                    <xsl:with-param name="returnitem" select="2"/>
                              </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="ref" select="tokenize($userfixedstring,'; ?')"/>
                        <!-- xref first split on semi colons to feed to ref-parser -->
                        <xsl:for-each select="$ref">
                              <xsl:variable name="book" select="replace(.,concat($fullregex,'.*'),'$1')"/>
                              <xsl:variable name="chap" select="replace(.,concat($fullregex,'.*'),'$2')"/>
                              <!--<xsl:if test="position() gt 1">
                                    <xsl:text>; </xsl:text>
                              </xsl:if>-->
                              <xsl:text>&#13;&#10;parallel&#9;@a:</xsl:text>
                              <xsl:call-template name="ref-parser">
                                    <xsl:with-param name="book" select="$book"/>
                                    <xsl:with-param name="chap" select="$chap"/>
                                    <xsl:with-param name="ref" select="."/>
                              </xsl:call-template>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="."/>
                              <xsl:text></xsl:text>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;XXXX-unhandled-section/ref</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <!-- chapter element is not used -->
      <xsl:template match="chapter"/>
      <xsl:template match="verse">
            <!-- Lots of processing done here to generate each verse and insert paragraph information -->
            <xsl:param name="booknumb"/>
            <xsl:param name="chapter"/>
            <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
            <xsl:variable name="postverse" select="following::verse[1]/@number"/>
            <xsl:variable name="lastverseofchap" select="following::verse[1]/@number"/>
            <xsl:variable name="verserange" select="tokenize($preverse,'[\-,]')"/>
            <xsl:choose>
                  <xsl:when test="matches(@number,'^\d+[bcde]$')">
                        <!-- don't add  a new verse line as not allowed -->
                        <!-- the match matches the whole string so verse ranges are excluded here -->
                        <xsl:text></xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>&#10;verse&#9;</xsl:text>
                        <xsl:value-of select="$booknumb"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:choose>
                              <!-- Handle where bridge occues at last verse by adjusting chapter number to previous chapter -->
                              <xsl:when test="matches($preverse,'\-') and f:bridgefix(@number) = '1'">
                                    <!-- bridge occurs at end of chapter so adjust chapter back one  -->
                                    <xsl:value-of select="number($chapter) -1"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="$chapter"/>
                              </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>&#9;</xsl:text>
                        <!-- verse handling for bridges -->
                        <xsl:choose>
                              <!-- this looks for bridges in previous verse -->
                              <xsl:when test="matches($preverse,'[\-,]')">
                                    <!-- When found this insert blank verses before the current verse up untill the last verse of the bridge -->
                                    <xsl:variable name="versenumb" select="tokenize($preverse,'[\-,]')"/>
                                    <xsl:call-template name="blankverse">
                                          <xsl:with-param name="firstnumb" select="$versenumb[1]"/>
                                          <xsl:with-param name="lastnumb" select="$versenumb[2]"/>
                                          <xsl:with-param name="booknumb" select="$booknumb"/>
                                          <xsl:with-param name="chapter" select="$chapter"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <!-- if no bridge found do nothing -->
                                    <xsl:text></xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                        <!-- f:bridgefix ouputs first verse of bridge or only verse-->
                        <xsl:value-of select="replace(f:bridgefix(@number),'a','')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:if test="string-length(replace(following-sibling::text()[1],'\s','')) gt 0">
                              <xsl:text>@@</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                              <!-- looks to see if verse is start of paragraph -->
                              <xsl:when test="string-length(replace(following-sibling::text()[1],'\s','')) = 0"/>
                              <xsl:when test="position() ne 1">
                                    <xsl:value-of select="f:scr_para_in_verse(parent::para/@style)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:scr_para(parent::para/@style)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="note[@style = 'x']">
            <!-- xref notes caller handling -->
            <xsl:variable name="book" select="ancestor::chapterGroup/@book"/>
            <xsl:variable name="booknumb" select="f:book_numb($book)"/>
            <xsl:variable name="curchap" select="ancestor::chapterGroup/@number"/>
            <xsl:variable name="curverse" select="f:bridgefix(preceding::verse[1]/@number)"/>
            <xsl:if test="$includexref = $truearray">
                  <xsl:text>@&lt;</xsl:text>
                  <xsl:value-of select="@style"/>
                  <!-- seq number of note in verse -->
                  <xsl:value-of select="count(preceding::note[@style = 'x'][ancestor::chapterGroup/@book = $book][ancestor::chapterGroup/@number = $curchap][preceding::verse[1]/@number = $curverse]) + 1"/>
                  <xsl:text>@&gt;@/</xsl:text>
            </xsl:if>
      </xsl:template>
      <xsl:template match="note[@style = 'f']">
            <!-- foonotes notes caller handling -->
            <xsl:variable name="book" select="ancestor::chapterGroup/@book"/>
            <xsl:variable name="booknumb" select="f:book_numb($book)"/>
            <xsl:variable name="curchap" select="ancestor::chapterGroup/@number"/>
            <xsl:variable name="curverse" select="f:bridgefix(preceding::verse[1]/@number)"/>
            <xsl:text>@&lt;</xsl:text>
            <xsl:value-of select="@style"/>
            <!-- seq number of note in verse -->
            <xsl:value-of select="count(preceding::note[@style = 'f'][ancestor::chapterGroup/@book = $book][ancestor::chapterGroup/@number = $curchap][preceding::verse[1]/@number = $curverse]) + 1"/>
            <xsl:text>@&gt;@/</xsl:text>
      </xsl:template>
      <xsl:template match="note[@style = 'f']" mode="footnote">
            <xsl:variable name="book" select="ancestor::chapterGroup/@book"/>
            <xsl:variable name="booknumb" select="f:book_numb($book)"/>
            <xsl:variable name="curchap" select="ancestor::chapterGroup/@number"/>
            <xsl:variable name="curverse" select="f:bridgefix(preceding::verse[1]/@number)"/>
            <xsl:text>&#10;footnote&#9;</xsl:text>
            <xsl:value-of select="$booknumb"/>
            <!-- book number -->
            <xsl:text>&#9;</xsl:text>
            <!-- chapter number -->
            <xsl:value-of select="$curchap"/>
            <xsl:text>&#9;</xsl:text>
            <!-- Verse number -->
            <xsl:value-of select="$curverse"/>
            <xsl:text>&#9;</xsl:text>
            <!-- seq number of note in verse -->
            <xsl:value-of select="count(preceding::note[@style = 'f'][ancestor::chapterGroup/@book = $book][ancestor::chapterGroup/@number = $curchap][preceding::verse[1]/@number = $curverse]) + 1"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="note[@style = 'x']" mode="xref">
            <xsl:variable name="book" select="ancestor::chapterGroup/@book"/>
            <xsl:variable name="booknumb" select="f:book_numb($book)"/>
            <xsl:variable name="curchap" select="ancestor::chapterGroup/@number"/>
            <xsl:variable name="curverse" select="f:bridgefix(preceding::verse[1]/@number)"/>
            <xsl:text>&#10;xref&#9;</xsl:text>
            <xsl:value-of select="$booknumb"/>
            <!-- book number -->
            <xsl:text>&#9;</xsl:text>
            <!-- chapter number -->
            <xsl:value-of select="$curchap"/>
            <xsl:text>&#9;</xsl:text>
            <!-- Verse number -->
            <xsl:value-of select="$curverse"/>
            <xsl:text>&#9;</xsl:text>
            <!-- seq number of note in verse -->
            <xsl:value-of select="count(preceding::note[@style = 'x'][ancestor::chapterGroup/@book = $book][ancestor::chapterGroup/@number = $curchap][preceding::verse[1]/@number = $curverse]) + 1"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:choose>
                  <xsl:when test="span">
                        <xsl:apply-templates select="*" mode="xref"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="text()" mode="xref"/>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="node()" mode="xref"/>
      </xsl:template>
      <xsl:template match="char[@style = 'xo']" mode="xref"/>
      <xsl:template match="char[@style = 'xt']" mode="xref">
            <xsl:variable name="book" select="replace(.,concat($fullregex,'.*'),'$1')"/>
            <!-- this is used to keep ref with out book name connected by commas to the book name, but  where a new book occurs the semi colon is preserved -->
            <xsl:variable name="userfixedstring">
                  <xsl:variable name="finditem" select="1"/>
                  <xsl:variable name="returnitem" select="2"/>
                  <xsl:variable name="primaryseparator" select="'\r?\n'"/>
                  <xsl:variable name="secondaryseparator" select="'='"/>
                  <xsl:variable name="wholearray" select="tokenize($xref-replace-set,$primaryseparator)"/>
                  <xsl:call-template name="replace-slave">
                        <xsl:with-param name="seq" select="1"/>
                        <xsl:with-param name="string" select="."/>
                        <xsl:with-param name="wholearray" select="$wholearray"/>
                        <xsl:with-param name="secondaryseparator" select="$secondaryseparator"/>
                        <xsl:with-param name="finditem" select="1"/>
                        <xsl:with-param name="returnitem" select="2"/>
                  </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="ref" select="tokenize($userfixedstring,'; ?')"/>
            <!-- xref first split on semi colons to feed to ref-parser -->
            <xsl:for-each select="$ref">
                  <xsl:variable name="book" select="replace(.,concat($fullregex,'.*'),'$1')"/>
                  <xsl:variable name="chap" select="replace(.,concat($fullregex,'.*'),'$2')"/>
                  <xsl:if test="position() gt 1">
                        <xsl:text>; </xsl:text>
                  </xsl:if>
                  <xsl:text>@&lt;ta:</xsl:text>
                  <xsl:call-template name="ref-parser">
                        <xsl:with-param name="book" select="$book"/>
                        <xsl:with-param name="chap" select="$chap"/>
                        <xsl:with-param name="ref" select="."/>
                  </xsl:call-template>
                  <xsl:text>@&gt;</xsl:text>
                  <xsl:value-of select="."/>
                  <xsl:text>@/</xsl:text>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="ref-parser">
            <xsl:param name="ref"/>
            <xsl:param name="book"/>
            <xsl:param name="chap"/>
            <xsl:variable name="chapverseregex" select="' ?(\d+):(\d+) ?'"/>
            <xsl:variable name="chapverseandhyphentailregex" select="' ?(\d+):(\d+)[\-&#2013;](.*)'"/>
            <xsl:variable name="precomma" select="substring-before($ref,',')"/>
            <xsl:variable name="postcomma" select="substring-after($ref,',')"/>
            <xsl:variable name="fullregexwholefield" select="concat($fullregex,' ?$')"/>
            <xsl:variable name="fullrefregexandtail" select="concat($fullregex,'.*')"/>
            <xsl:variable name="fullrefregexandhyphentail" select="concat($fullregex,'\-','(.*)')"/>
            <xsl:variable name="fullregexbeforedash" select="concat($fullregex,$anyhyphen)"/>
            <xsl:variable name="colonsplit" select="tokenize($precomma,':')"/>
            <xsl:variable name="versefirst" select="$colonsplit[2]"/>
            <xsl:variable name="chapterfirst" select="replace($colonsplit[1],'.*(\d+)$','$1')"/>
            <xsl:choose>
                  <xsl:when test="matches($ref,'[\d]+,.+')">
                        <!-- xref second split on comma to feed to ref-parser -->
                        <!-- has comma -->
                        <xsl:call-template name="ref-parser">
                              <!-- pass first part back into this template -->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="$precomma"/>
                        </xsl:call-template>
                        <xsl:text>,</xsl:text>
                        <xsl:call-template name="ref-parser">
                              <!-- pass this part back into template to check for more commas-->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="normalize-space($postcomma)"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,concat('\d ?',$anyhyphen))">
                        <!-- has en dash or hyphen preceeded and followed by numbers-->
                        <!-- when hyphenated verse range occurs with hyphenated book names this is causing errors IKM 2014-06-04 -->
                        <!--<xsl:variable name="refmod" select="replace($ref,'(\d+)\-(\d+)','$1&#2013;$2')"/>
                        <xsl:variable name="part" select="tokenize($ref,'&#2013;')"/> -->
                        <xsl:variable name="part" select="tokenize($ref,$anyhyphen)"/>
                        <xsl:variable name="before">
                              <!--<xsl:choose>
                                    <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                                          <xsl:value-of select="concat($part[1],'-',$part[2])"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$part[1]"/>
                                    </xsl:otherwise>
                              </xsl:choose> -->
                              <xsl:value-of select="$part[1]"/>
                        </xsl:variable>
                        <xsl:variable name="after">
                              <!--<xsl:choose>
                                    <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                                          <xsl:value-of select="$part[3]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$part[2]"/>
                                    </xsl:otherwise>
                              </xsl:choose> -->
                              <xsl:value-of select="$part[2]"/>
                        </xsl:variable>
                        <xsl:variable name="testsecondchap" select="replace($after,'.*(\d+):.*','$1')"/>
                        <xsl:variable name="newchap">
                              <xsl:choose>
                                    <xsl:when test="string-length($testsecondchap) gt 0">
                                          <xsl:value-of select="$testsecondchap"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$chap"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="ref-parser">
                              <!-- pass first part back into this template -->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="$before"/>
                        </xsl:call-template>
                        <xsl:text>-</xsl:text>
                        <xsl:call-template name="ref-parser">
                              <!-- pass this part back into template to check for more commas-->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="ref" select="$after"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,$fullregexwholefield)">
                        <!-- basic full reference in form: Mat 5:1-7-->
                        <xsl:variable name="newbook" select="replace($ref,$fullregexwholefield,'$1')"/>
                        <!-- replace($ref,' \d+:.*','') -->
                        <xsl:variable name="newchap" select="replace($ref,$fullregexwholefield,'$2')"/>
                        <xsl:variable name="newverse" select="replace($ref,$fullregexwholefield,'$3')"/>
                        <xsl:call-template name="ref-writer">
                              <xsl:with-param name="book" select="$newbook"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,$chapverseregex)">
                        <!-- Chapter verse form: 26:34 -->
                        <xsl:variable name="newchap" select="replace($ref,$chapverseregex,'$1')"/>
                        <xsl:variable name="newverse" select="replace($ref,$chapverseregex,'$2')"/>
                        <xsl:call-template name="ref-writer">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,'^\d+ ?$')">
                        <!-- verse part only -->
                        <xsl:variable name="newverse" select="replace($ref,'([\d\-]+).?','$1')"/>
                        <xsl:call-template name="ref-writer">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- residue  -->
                        <xsl:call-template name="ref-writer">
                              <xsl:with-param name="book" select="'XXXX'"/>
                              <xsl:with-param name="chap" select="'XXX'"/>
                              <xsl:with-param name="verse" select="$ref"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="ref-writer">
            <xsl:param name="verse"/>
            <xsl:param name="book"/>
            <xsl:param name="chap"/>
            <xsl:variable name="preverse" select="replace($verse,'^(\d+)-(\d+)','$1')"/>
            <xsl:variable name="postverse" select="replace($verse,'^(\d+)-(\d+)','$2')"/>
            <xsl:choose>
                  <xsl:when test="matches($verse,'-')">
                        <!-- no comma, no chap, with hyphen -->
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$preverse"/>
                        </xsl:call-template>
                        <xsl:text>-</xsl:text>
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$postverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- no comma, no chap, no hyphen -->
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$verse"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="verse-calc">
            <xsl:param name="book"/>
            <xsl:param name="chap"/>
            <xsl:param name="verse"/>
            <xsl:variable name="versenumb" select="number(translate($verse,'[abcde]',''))"/>
            <xsl:variable name="bookcalc">
                  <xsl:choose>
                        <xsl:when test="number(f:xrefnumb($book)) =  number(f:xrefnumb($book)) ">
                              <!-- <xsl:value-of select="number(0)"/> -->
                              <xsl:value-of select="number(f:xrefnumb($book)) * 65536"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('NaN=',$book)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="chapcalc">
                  <xsl:choose>
                        <xsl:when test="number($chap) =  number($chap) ">
                              <!-- <xsl:value-of select="number(0)"/> -->
                              <xsl:value-of select="number($chap) * 256"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('NaN=',$chap)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                  <xsl:when test="$debug-xref = $truearray">
                        <!-- debug on so show the parts of the calculation -->
                        <xsl:value-of select="concat($bookcalc,'c',$chapcalc,'v',$versenumb)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- calculate number -->
                        <xsl:value-of select="$bookcalc + $chapcalc + $versenumb"/>
                  </xsl:otherwise>
            </xsl:choose>
            <!-- -->
      </xsl:template>
      <xsl:template name="blankverse">
            <!-- generages blank verses for bridged verses -->
            <xsl:param name="firstnumb"/>
            <xsl:param name="lastnumb"/>
            <xsl:param name="booknumb"/>
            <xsl:param name="chapter"/>
            <xsl:choose>
                  <!-- looks to see if the number to be inserted is the last number -->
                  <xsl:when test="number($firstnumb) + 1 = number($lastnumb) ">
                        <!-- finds the number to be inserted is the last number of verse bridge -->
                        <xsl:value-of select="$lastnumb"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:text>&#10;verse&#9;</xsl:text>
                        <xsl:value-of select="$booknumb"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="$chapter"/>
                        <xsl:text>&#9;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- the number to be inserted is not the last number so template is called recursively -->
                        <xsl:value-of select="number($firstnumb) + 1"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:text>&#10;verse&#9;</xsl:text>
                        <xsl:value-of select="$booknumb"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="$chapter"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:call-template name="blankverse">
                              <xsl:with-param name="firstnumb" select="number($firstnumb) + 1"/>
                              <xsl:with-param name="lastnumb" select="$lastnumb"/>
                              <xsl:with-param name="booknumb" select="$booknumb"/>
                              <xsl:with-param name="chapter" select="$chapter"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:function name="f:scr_para">
            <!-- function to match para @style to Alkitab para option where para occus immediately before verse-->
            <xsl:param name="string"/>
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$scr-para-set"/>
                  <xsl:with-param name="errortext" select="'scr_para'"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:scr_para_in_verse">
            <!-- function to match para @style to Alkitab para option where para occus within a verse-->
            <xsl:param name="string"/>
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="replace($scr-para-set,'p=@\^','p=@0')"/>
                  <xsl:with-param name="errortext" select="'scr_para_in_verse'"/>
                  <xsl:with-param name="unmatchedoutput" select="''"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:book_numb">
            <!-- function to match USX book code to Alkitab numbering schema -->
            <xsl:param name="string"/>
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$book-number-set"/>
                  <xsl:with-param name="finditem" select="2"/>
                  <xsl:with-param name="returnitem" select="3"/>
                  <xsl:with-param name="errortext" select="'book_numb'"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:xrefnumb">
            <!-- function to match USX book code to Alkitab numbering schema -->
            <xsl:param name="string"/>
            <xsl:variable name="toc">
                  <xsl:choose>
                        <xsl:when test="$xrefnamesmatch = 'toc3'">
                              <xsl:value-of select="number(4)"/>
                        </xsl:when>
                        <xsl:when test="$xrefnamesmatch = 'toc1'">
                              <xsl:value-of select="number(6)"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="number(3)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$verbookname2xrefnumb-set"/>
                  <xsl:with-param name="finditem" select="$toc"/>
                  <xsl:with-param name="returnitem" select="5"/>
                  <xsl:with-param name="primaryseparator" select="'\r\n'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
                  <xsl:with-param name="errortext" select="'xrefnumb'"/>
                  <xsl:with-param name="unmatchedoutput" select="''"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:bookname">
            <xsl:param name="string"/>
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$verbookname2xrefnumb-set"/>
                  <xsl:with-param name="finditem" select="2"/>
                  <xsl:with-param name="returnitem" select="3"/>
                  <xsl:with-param name="primaryseparator" select="'\r\n'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
                  <xsl:with-param name="errortext" select="'bkname'"/>
                  <xsl:with-param name="unmatchedoutput" select="''"/>
            </xsl:call-template>
      </xsl:function>
      <xsl:function name="f:bridgefix">
            <xsl:param name="string"/>
            <xsl:variable name="versenumb" select="tokenize($string,'\-')"/>
            <xsl:value-of select="$versenumb[1]"/>
      </xsl:function>
      <xsl:template name="findmatch">
            <!-- This is a lookup template from an array that is used by a function -->
            <xsl:param name="string"/>
            <xsl:param name="wholeset"/>
            <xsl:param name="errortext"/>
            <xsl:param name="finditem" select="1"/>
            <xsl:param name="returnitem" select="2"/>
            <xsl:param name="primaryseparator" select="'\s+'"/>
            <xsl:param name="secondaryseparator" select="'='"/>
            <xsl:param name="unmatchedoutput"/>
            <xsl:variable name="wholearray" select="tokenize($wholeset,$primaryseparator)"/>
            <!-- modify set so can find whole string item not just partial-->
            <xsl:variable name="modified-wholeset" select="concat($secondaryseparator,replace($wholeset,$primaryseparator,$secondaryseparator),$secondaryseparator)"/>
            <xsl:variable name="handledstring" select="concat($secondaryseparator,$string,$secondaryseparator)"/>
            <xsl:choose>
                  <!-- make sure the item is in the set of data being searched, if not then return error message in output -->
                  <xsl:when test="matches($modified-wholeset,$handledstring)">
                        <xsl:for-each select="$wholearray">
                              <!-- loop through the known data to find a match -->
                              <xsl:variable name="subarray" select="tokenize(.,$secondaryseparator)"/>
                              <xsl:if test="$subarray[$finditem] = $string">
                                    <xsl:value-of select="$subarray[$returnitem]"/>
                              </xsl:if>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="string-length($unmatchedoutput) gt 0">
                                    <xsl:value-of select="$unmatchedoutput"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="concat('XXXX-no-',$string,'-in-',$errortext,'-XX')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="replace-slave">
            <xsl:param name="seq"/>
            <xsl:param name="string"/>
            <xsl:param name="finditem"/>
            <xsl:param name="returnitem"/>
            <xsl:param name="wholearray"/>
            <xsl:param name="secondaryseparator"/>
            <xsl:variable name="subarray" select="tokenize($wholearray[$seq],$secondaryseparator)"/>
            <xsl:choose>
                  <xsl:when test="$wholearray[$seq] = $wholearray[last()]">
                        <xsl:if test="string-length($string) gt 0">
                              <xsl:value-of select="replace($string,$subarray[$finditem],$subarray[$returnitem])"/>
                        </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:call-template name="replace-slave">
                              <xsl:with-param name="seq" select="$seq + 1"/>
                              <xsl:with-param name="string" select="replace($string,$subarray[$finditem],$subarray[$returnitem])"/>
                              <xsl:with-param name="wholearray" select="$wholearray"/>
                              <xsl:with-param name="secondaryseparator" select="$secondaryseparator"/>
                              <xsl:with-param name="finditem" select="$finditem"/>
                              <xsl:with-param name="returnitem" select="$returnitem"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="r-ref-parser">
            <xsl:param name="ref"/>
            <xsl:param name="book"/>
            <xsl:param name="chap"/>
            <xsl:variable name="chapverseregex" select="' ?(\d+):(\d+) ?'"/>
            <xsl:variable name="chapverseandhyphentailregex" select="' ?(\d+):(\d+)[\-&#2013;](.*)'"/>
            <xsl:variable name="precomma" select="substring-before($ref,',')"/>
            <xsl:variable name="postcomma" select="substring-after($ref,',')"/>
            <xsl:variable name="fullregexwholefield" select="concat($fullregex,' ?$')"/>
            <xsl:variable name="fullrefregexandtail" select="concat($fullregex,'.*')"/>
            <xsl:variable name="fullrefregexandhyphentail" select="concat($fullregex,'\-','(.*)')"/>
            <xsl:variable name="fullregexbeforedash" select="concat($fullregex,$anyhyphen)"/>
            <xsl:variable name="colonsplit" select="tokenize($precomma,':')"/>
            <xsl:variable name="versefirst" select="$colonsplit[2]"/>
            <xsl:variable name="chapterfirst" select="replace($colonsplit[1],'.*(\d+)$','$1')"/>
            <xsl:choose>
                  <xsl:when test="matches($ref,'[\d]+,.+')">
                        <!-- xref second split on comma to feed to ref-parser -->
                        <!-- has comma -->
                        <xsl:call-template name="r-ref-parser">
                              <!-- pass first part back into this template -->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="$precomma"/>
                        </xsl:call-template>
                        <xsl:text>,</xsl:text>
                        <xsl:call-template name="r-ref-parser">
                              <!-- pass this part back into template to check for more commas-->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="normalize-space($postcomma)"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,concat('\d ?',$anyhyphen))">
                        <!-- has en dash or hyphen preceeded and followed by numbers-->
                        <!-- when hyphenated verse range occurs with hyphenated book names this is causing errors IKM 2014-06-04 -->
                        <!--<xsl:variable name="refmod" select="replace($ref,'(\d+)\-(\d+)','$1&#2013;$2')"/>
                        <xsl:variable name="part" select="tokenize($ref,'&#2013;')"/> -->
                        <xsl:variable name="part" select="tokenize($ref,$anyhyphen)"/>
                        <xsl:variable name="before">
                              <!--<xsl:choose>
                                    <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                                          <xsl:value-of select="concat($part[1],'-',$part[2])"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$part[1]"/>
                                    </xsl:otherwise>
                              </xsl:choose> -->
                              <xsl:value-of select="$part[1]"/>
                        </xsl:variable>
                        <xsl:variable name="after">
                              <!--<xsl:choose>
                                    <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                                          <xsl:value-of select="$part[3]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$part[2]"/>
                                    </xsl:otherwise>
                              </xsl:choose> -->
                              <xsl:value-of select="$part[2]"/>
                        </xsl:variable>
                        <xsl:variable name="testsecondchap" select="replace($after,'.*(\d+):.*','$1')"/>
                        <xsl:variable name="newchap">
                              <xsl:choose>
                                    <xsl:when test="string-length($testsecondchap) gt 0">
                                          <xsl:value-of select="$testsecondchap"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$chap"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="r-ref-parser">
                              <!-- pass first part back into this template -->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="ref" select="$before"/>
                        </xsl:call-template>
                        <xsl:text>-</xsl:text>
                        <xsl:call-template name="r-ref-parser">
                              <!-- pass this part back into template to check for more commas-->
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="ref" select="$after"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,$fullregexwholefield)">
                        <!-- basic full reference in form: Mat 5:1-7-->
                        <xsl:variable name="newbook" select="replace($ref,$fullregexwholefield,'$1')"/>
                        <!-- replace($ref,' \d+:.*','') -->
                        <xsl:variable name="newchap" select="replace($ref,$fullregexwholefield,'$2')"/>
                        <xsl:variable name="newverse" select="replace($ref,$fullregexwholefield,'$3')"/>
                        <xsl:call-template name="r-ref-writer">
                              <xsl:with-param name="book" select="$newbook"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,$chapverseregex)">
                        <!-- Chapter verse form: 26:34 -->
                        <xsl:variable name="newchap" select="replace($ref,$chapverseregex,'$1')"/>
                        <xsl:variable name="newverse" select="replace($ref,$chapverseregex,'$2')"/>
                        <xsl:call-template name="r-ref-writer">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$newchap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($ref,'^\d+ ?$')">
                        <!-- verse part only -->
                        <xsl:variable name="newverse" select="replace($ref,'([\d\-]+).?','$1')"/>
                        <xsl:call-template name="r-ref-writer">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$newverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- residue  -->
                        <xsl:call-template name="r-ref-writer">
                              <xsl:with-param name="book" select="'XXXX'"/>
                              <xsl:with-param name="chap" select="'XXX'"/>
                              <xsl:with-param name="verse" select="$ref"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="r-ref-writer">
            <xsl:param name="verse"/>
            <xsl:param name="book"/>
            <xsl:param name="chap"/>
            <xsl:variable name="preverse" select="replace($verse,'^(\d+)-(\d+)','$1')"/>
            <xsl:variable name="postverse" select="replace($verse,'^(\d+)-(\d+)','$2')"/>
            <xsl:choose>
                  <xsl:when test="matches($verse,'-')">
                        <!-- no comma, no chap, with hyphen -->
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$preverse"/>
                        </xsl:call-template>
                        <xsl:text>-</xsl:text>
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$postverse"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- no comma, no chap, no hyphen -->
                        <xsl:call-template name="verse-calc">
                              <xsl:with-param name="book" select="$book"/>
                              <xsl:with-param name="chap" select="$chap"/>
                              <xsl:with-param name="verse" select="$verse"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="verse2">
            <!-- Lots of processing done here to generate each verse and insert paragraph information -->
            <xsl:param name="booknumb"/>
            <xsl:param name="chapter"/>
            <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
            <xsl:variable name="postverse" select="following::verse[1]/@number"/>
            <xsl:variable name="lastverseofchap" select="following::verse[1]/@number"/>
            <xsl:variable name="verserange" select="tokenize($preverse,'[\-,]')"/>
            <xsl:choose>
                  <xsl:when test="matches(@number,'^\d+[bcde]$')">
                        <!-- don't add  a new verse line when a verse is split into a and b or more parts as not allowed -->
                        <!-- the match matches the whole string so verse ranges are excluded here -->
                        <xsl:text></xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="number($verserange[2]) gt 0">
                                    <!-- if there is a verse range -->
                                    <xsl:text></xsl:text>
                              </xsl:when>
                              <xsl:when test="number(@number) ne $preverse + 1">
                                    <!-- if there is a missing verse -->
                                    <xsl:text></xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>&#10;verse&#9;</xsl:text>
                                    <xsl:value-of select="$booknumb"/>
                                    <xsl:text>&#9;</xsl:text>
                                    <xsl:choose>
                                          <!-- Handle where bridge occues at last verse by adjusting chapter number to previous chapter -->
                                          <xsl:when test="matches($preverse,'\-') and f:bridgefix(@number) = '1'">
                                                <!-- bridge occurs at end of chapter so adjust chapter back one  -->
                                                <xsl:value-of select="number($chapter) -1"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="$chapter"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:text>&#9;</xsl:text>
                                    <!-- verse handling for bridges -->
                                    <xsl:choose>
                                          <!-- this looks for bridges in previous verse -->
                                          <xsl:when test="matches($preverse,'[\-,]')">
                                                <!-- When found this insert blank verses before the current verse up untill the last verse of the bridge -->
                                                <xsl:variable name="versenumb" select="tokenize($preverse,'[\-,]')"/>
                                                <xsl:call-template name="blankverse">
                                                      <xsl:with-param name="firstnumb" select="$versenumb[1]"/>
                                                      <xsl:with-param name="lastnumb" select="$versenumb[2]"/>
                                                      <xsl:with-param name="booknumb" select="$booknumb"/>
                                                      <xsl:with-param name="chapter" select="$chapter"/>
                                                </xsl:call-template>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <!-- if no bridge found do nothing -->
                                                <xsl:text></xsl:text>
                                          </xsl:otherwise>
                                    </xsl:choose>
                                    <!-- f:bridgefix ouputs first verse of bridge or only verse-->
                                    <xsl:value-of select="replace(f:bridgefix(@number),'a','')"/>
                                    <xsl:text>&#9;</xsl:text>
                                    <xsl:if test="string-length(replace(following-sibling::text()[1],'\s','')) gt 0">
                                          <xsl:text>@@</xsl:text>
                                    </xsl:if>
                                    <xsl:choose>
                                          <!-- looks to see if verse is start of paragraph -->
                                          <xsl:when test="string-length(replace(following-sibling::text()[1],'\s','')) = 0"/>
                                          <xsl:when test="position() ne 1">
                                                <xsl:value-of select="f:scr_para_in_verse(parent::para/@style)"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="f:scr_para(parent::para/@style)"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="verse3">
            <!-- Version 3 major re work of verse handling -->
            <!-- Lots of processing done here to generate each verse and insert paragraph information -->
            <xsl:param name="booknumb"/>
            <xsl:param name="chapter"/>
            <xsl:variable name="preverse" select="preceding::verse[1]/@number"/>
            <xsl:variable name="postverse" select="following::verse[1]/@number"/>
            <xsl:variable name="lastverseofchap" select="following::verse[1]/@number"/>
            <xsl:variable name="verserange" select="tokenize($preverse,'[\-,]')"/>
            <xsl:choose>
                  <xsl:when test="not(number(@number))">
                        <!-- the verse @number is not a simple number, so requires special handling -->
                        <xsl:choose>
                              <xsl:when test="matches($preverse,'[\-,]')">
<!-- verse bridge -->

</xsl:when>
                              <xsl:when test="matches(@number,'^\d+[bcde]$')">
<!-- single verse with letter -->

</xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>XXXX-verse-not-number-unhandled</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text></xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- the value of the @ number attrib is a number -->
                        <xsl:text>&#10;verse&#9;</xsl:text>
                        <xsl:value-of select="$booknumb"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="$chapter"/>
                        <xsl:text>&#9;</xsl:text>
                        <!-- f:bridgefix ouputs first verse of bridge or only verse-->
                        <xsl:value-of select="replace(f:bridgefix(@number),'a','')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:if test="string-length(replace(following-sibling::text()[1],'\s','')) gt 0">
                              <!-- check text string length to see if text is more than space -->
                              <xsl:text>@@</xsl:text>
                        </xsl:if>
                        <xsl:choose>
                              <!-- looks to see if verse is start of paragraph -->
                              <xsl:when test="string-length(replace(following-sibling::text()[1],'\s','')) = 0"/>
                              <xsl:when test="position() ne 1">
                                    <xsl:value-of select="f:scr_para_in_verse(parent::para/@style)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:scr_para(parent::para/@style)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="dump">

</xsl:template>
</xsl:stylesheet>
