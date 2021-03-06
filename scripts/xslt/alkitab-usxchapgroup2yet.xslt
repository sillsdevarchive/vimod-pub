<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:        	alkitab-usxchaptergroup2yet.xslt
    # Purpose:		Take a single chapter grouped USX file and generate a YET file for Alkitab (Quick Bible) app
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Sub-project:	Alkitab YES file generator from Paratext USX files
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-05-24
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <!--
      <xsl:include href="project-param.xslt"/> -->
      <xsl:include href="inc-file2uri.xslt"/>
      <!-- <xsl:include href="inc-replace.xslt"/> -->
      <xsl:strip-space elements="*"/>
      <!-- Input variables that match the Alkitab YET documentation found at https://docs.google.com/document/d/1SGk70g7R3UfN1MTF5jFE9u5bNCY7J9Jeftiq5RjZA0A/edit -->
      <xsl:param name="shortName"/>
      <xsl:param name="longName"/>
      <xsl:param name="description"/>
      <xsl:param name="locale"/>
      <!-- non-scr-para-list is a set of paragraph styles used in USX that are not scripture and are not handled in the scripture text part of Alkitab app. This is a white space separated list -->
      <xsl:param name="section-para-list" select="'s  sr  s1  ms1 '"/>
      <xsl:param name="non-scr-para-list-additions" select="'r sr b  '"/>
      <xsl:variable name="non-scr-para-list" select="concat($non-scr-para-list-additions,$section-para-list)"/>
      <!-- scr-para-set contains a set of pairs that map USX styles for wanted scripture paragraphs to the available Alkitab styles. This is separated firstly on whitespace, then by = sign. -->
      <xsl:param name="scr-para-set" select="'p=@^	q=@1	q1=@1	q2=@2	q3=@3	m=@0	pc=@3	qr=@3  nb=@0  pi=@1  sp=@0  d=@0  mi=@1  li1=@^'"/>
      <!-- book-number-set contains the data to map short book name from USX to their equivalent Alkitab numbering schema. This is separated firstly on whitespace, then by = sign.  -->
      <xsl:param name="book-number-set" select="'01=GEN=1=0  02=EXO=2=1  03=LEV=3=2  04=NUM=4=3  05=DEU=5=4  06=JOS=6=5  07=JDG=7=6  08=RUT=8=7  09=1SA=9=8  
	10=2SA=10=9  11=1KI=11=10  12=2KI=12=11  13=1CH=13=12  14=2CH=14=13  15=EZR=15=14  16=NEH=16=15  17=EST=17=16  18=JOB=18=17  19=PSA=19=18  
	20=PRO=20=19  21=ECC=21=20  22=SNG=22=21  23=ISA=23=22  24=JER=24=23  25=LAM=25=24  26=EZK=26=25  27=DAN=27=26  28=HOS=28=27  29=JOL=29=28  
	30=AMO=30=29  31=OBA=31=30  32=JON=32=31  33=MIC=33=32  34=NAM=34=33  35=HAB=35=34  36=ZEP=36=35  37=HAG=37=36  38=ZEC=38=37  39=MAL=39=38  
	41=MAT=40=39  42=MRK=41=40  43=LUK=42=41  44=JHN=43=42  45=ACT=44=43  46=ROM=45=44  47=1CO=46=45  48=2CO=47=46  49=GAL=48=47  50=EPH=49=48  
	51=PHP=50=49  52=COL=51=50  53=1TH=52=51  54=2TH=53=52  55=1TI=54=53  56=2TI=55=54  57=TIT=56=55  58=PHM=57=56  59=HEB=58=57  60=JAS=59=58  
	61=1PE=60=59  62=2PE=61=60  63=1JN=62=61  64=2JN=63=62  65=3JN=64=63  66=JUD=65=64  67=REV=66=65
	68=TOB=67=66  69=JDT=68=67  70=ESG=69=68  71=WIS=70=69  72=SIR=71=70  73=BAR=72=71  74=LJE=73=72  75=S3Y=74=73  76=SUS=75=74  77=BEL=76=75  
	78=1MA=77=76  79=2MA=78=77  80=3MA=79=78  81=4MA=80=79  82=1ES=81=80  83=2ES=82=81  84=MAN=83=82  85=PS2=84=83  86=ODA=85=84  87=PSS=86=85'"/>
      <xsl:param name="refseparator" select="'; '"/>
      <xsl:param name="verbookname2xrefnumb-file"/>
      <xsl:param name="debug-xref" select="'on'"/>
      <xsl:param name="xrefreplacesetfile"/>
      <xsl:param name="includexref" select="on"/>
      <xsl:variable name="verbookname2xrefnumb-set" select="unparsed-text(f:file2uri($verbookname2xrefnumb-file))"/>
      <xsl:variable name="xref-replace-set" select="unparsed-text(f:file2uri($xrefreplacesetfile))"/>
      <xsl:variable name="non-scr-para" select="tokenize($non-scr-para-list,'\s+')"/>
      <xsl:variable name="section-para-array" select="tokenize($section-para-list,'\s+')"/>
      <xsl:variable name="scr-para" select="tokenize($scr-para-set,'\s+')"/>
      <xsl:variable name="scr-para-in-verse" select="tokenize(replace($scr-para-set,'p=@\^','p=@0'),'\s+')"/>
      <xsl:variable name="fullregex" select="'^(\d?[A-Za-z\.\- ]+) (\d+):(\d+)'"/>
      <xsl:variable name="anyhyphen" select="'[\-&#x2013;]'"/>
      <xsl:template match="/">
            <!-- info data from parameters -->
            <xsl:text>info	shortName	</xsl:text>
            <xsl:value-of select="$shortName"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>info	title	</xsl:text>
            <xsl:value-of select="$longName"/>
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
            <xsl:apply-templates select="//para[@style = $section-para-array]" mode="section"/>
            <xsl:if test="$includexref = 'on'">
                <!-- Implimented but with problems- Add x ref handling  -->
                <xsl:apply-templates select="//chapterGroup//note[@style = 'x']" mode="xref"/>
            </xsl:if>

            <!-- Not implimented - Add footnote handling  -->
            <xsl:apply-templates select="//chapterGroup//note[@style = 'f']" mode="footnote"/>
      </xsl:template>
      <xsl:template match="usx" mode="bookname">
            <!-- generates each book name for YET file -->
            <xsl:variable name="bookname" select="bookGroup/para[@style = 'h']"/>
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
                  <xsl:when test="@style = 'r'">
                        <xsl:variable name="r-string" select="."/>
                        <xsl:variable name="part" select="tokenize(translate($r-string,'\(\)',''),$refseparator)"/>
                        <xsl:for-each select="$part">
                              <xsl:text>&#10;parallel&#9;</xsl:text>
                              <xsl:value-of select="."/>
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
            <xsl:variable name="verserange" select="tokenize($preverse,'[\-,]')"/>
            <xsl:choose>
                  <xsl:when test="matches(@number,'^\d+[bcde]$')">
                        <!-- don't add  a new verse line as not allowed -->
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
                                    <!-- When found this insert blank verses before the current verse up untill the last vers of the bridge -->
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
                        <xsl:text>@@</xsl:text>
                        <xsl:choose>
                              <!-- looks to see if verse is start of paragraph -->
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
            <xsl:if test="$includexref = 'on'">
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
      <xsl:template match="char[@style = 'xt']|text()" mode="xref">
            <xsl:variable name="book" select="replace(.,concat($fullregex,'.*'),'$1')"/>
            <!-- this is used to keep ref with out book name connected by commas to the book name, but  where a new book occurs the semi colon is preserved -->
            <xsl:variable name="fixedstring">
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
                  <!--<xsl:call-template name="replaceset">
                        <xsl:with-param name="string" select="."/>
                        <xsl:with-param name="wholeset" select="$xref-replace-set"/>
                        <xsl:with-param name="finditem" select="1"/>
                        <xsl:with-param name="returnitem" select="2"/>s
                        <xsl:with-param name="primaryseparator" select="'\r?\n'"/>
                        <xsl:with-param name="secondaryseparator" select="'='"/>
                  </xsl:call-template> -->
            </xsl:variable>
            <xsl:variable name="ref" select="tokenize($fixedstring,'; ?')"/>
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
<xsl:when test="matches($ref,'\d ?[&#x2013;\-]')">
      <!-- has en dash or hyphen preceeded and followed by numbers-->
      <!-- when hyphenated verse range occurs with hyphenated book names this is causing errors IKM 2014-06-04 -->
      <!--<xsl:variable name="refmod" select="replace($ref,'(\d+)\-(\d+)','$1&#2013;$2')"/>
                        <xsl:variable name="part" select="tokenize($ref,'&#2013;')"/> -->
      <xsl:variable name="part" select="tokenize($ref,$anyhyphen)"/>
      <xsl:variable name="before">
            <xsl:choose>
                  <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                        <xsl:value-of select="concat($part[1],'-',$part[2])"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$part[1]"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <xsl:variable name="after">
            <xsl:choose>
                  <xsl:when test="matches(substring($part[1],1,1),'[^\d]')">
                        <xsl:value-of select="$part[3]"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$part[2]"/>
                  </xsl:otherwise>
            </xsl:choose>
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
                  <xsl:when test="string-length($debug-xref) gt 0">
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
            <xsl:call-template name="findmatch">
                  <!-- use find match template  with the following params-->
                  <xsl:with-param name="string" select="$string"/>
                  <xsl:with-param name="wholeset" select="$verbookname2xrefnumb-set"/>
                  <xsl:with-param name="finditem" select="3"/>
                  <xsl:with-param name="returnitem" select="5"/>
                  <xsl:with-param name="primaryseparator" select="'\r\n'"/>
                  <xsl:with-param name="secondaryseparator" select="'='"/>
                  <xsl:with-param name="errortext" select="'xrefnumb'"/>
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
</xsl:stylesheet>
