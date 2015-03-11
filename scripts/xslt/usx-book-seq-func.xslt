<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:        	usx-book-seq-func.xslt
    # Purpose:    	functions to return the next or previous chapter or book
    # Part of:     	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:      	Ian McQuay <ian_mcquay.org>
    # Created:     	2013/08/22
    # Copyright:   	(c) 2013 SIL International
    # Licence:     	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="bookorderfile" select="'D:\All-SIL-Publishing\vimod-pub\resources\ParatextIntergration\book-chaps.txt'"/>
      <xsl:variable name="uri" select="f:file2uri($bookorderfile)"/>
      <xsl:variable name="bookorderlist" select="unparsed-text($uri)"/>
      <xsl:include href="usxbooks.xslt"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-list2xml-xattrib.xslt"/>
      <xsl:variable name="line" select="tokenize($bookorderlist,'&#13;&#10;')"/>
      <xsl:variable name="firstbook" select="tokenize($line[1],' ')[2]"/>
      <xsl:variable name="lastbook" select="tokenize($line[last()],' ')[2]"/>
      <xsl:variable name="usxseq">
            <xsl:call-template name="list2xmlxattrib">
                  <xsl:with-param name="text" select="$bookorderlist"/>
                  <xsl:with-param name="attribnamelist" select="'seq book chapters'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:function name="f:chapbefore">
            <xsl:param name="curchap"/>
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$usxseq/element[@chapters = '0']/@book = $string">
                        <!-- this selects books containing front and back matter -->
                        <xsl:choose>
                              <xsl:when test="$string = $firstbook">
                                    <xsl:value-of select="concat('../index/index.html#',$string)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="concat('../chap/',f:prevbook($string,'name'),'.',f:prevbook($string,'chap'),'.html')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- this selects books with chapters canonical and Apoc -->
                        <xsl:choose>
                              <xsl:when test="$curchap = 1 and $string = $usxseq/element/@book">
                                    <!-- selects the first chapter of any book -->
                                    <xsl:value-of select="concat('../chap/',f:prevbook($string,'name'),'.',f:prevbook($string,'chap'),'.html')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="concat($string,'.',string(number($curchap) - 1),'.html')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:chapafter">
            <xsl:param name="curchap"/>
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$usxseq/element[@chapters = '0']/@book = $string">
                        <!-- this selects books containing front and back matter -->
                        <xsl:choose>
                              <xsl:when test="$string = $lastbook">
                                    <xsl:value-of select="concat('../index/index.html#',$string)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="concat('../chap/',f:nextbook($string,'name'),'.1.html')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- this selects books with chapters canonical and Apoc -->
                        <xsl:choose>
                              <xsl:when test="number($curchap) = number($usxseq/element[@book = $string]/@chapters) and $string = $usxseq/element/@book">
                                    <!-- selects the first chapter of any book -->
                                    <xsl:value-of select="concat('../chap/',f:nextbook($string,'name'),'.1.html')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="concat($string,'.',string(number($curchap) + 1),'.html')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:prevbook">
            <xsl:param name="string"/>
            <xsl:param name="name"/>
            <xsl:variable name="curseq" select="$usxseq/element[@book= $string]/@seq"/>
            <xsl:variable name="prevbk" select="$usxseq/element[number(@seq) = number($curseq - 1)]/@book"/>
            <xsl:variable name="prevch" select="$usxseq/element[number(@seq) = number($curseq - 1)]/@chapters"/>
            <xsl:choose>
                  <xsl:when test="$firstbook = $string">
                        <xsl:value-of select="'false'"/>
                  </xsl:when>
                  <xsl:when test="$allusx//usx/@book = $string">
                        <xsl:choose>
                              <xsl:when test="$name = 'chap'">
                                    <xsl:value-of select="$prevch"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="$prevbk"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="f:prevbook($prevbk,$name)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:nextbook">
            <xsl:param name="string"/>
            <xsl:param name="name"/>
            <xsl:variable name="curseq" select="$usxseq/element[@book= $string]/@seq"/>
            <xsl:variable name="nextbk" select="$usxseq/element[number(@seq) = number($curseq + 1)]/@book"/>
            <xsl:variable name="nextch" select="$usxseq/element[number(@seq) = number($curseq + 1)]/@chapters"/>
            <xsl:choose>
                  <xsl:when test="$lastbook = $string">
                        <xsl:value-of select="'false'"/>
                  </xsl:when>
                  <xsl:when test="$allusx//usx/@book = $string">
                        <xsl:choose>
                              <xsl:when test="$name = 'chap'">
                                    <xsl:value-of select="$nextch"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="$nextbk"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="f:nextbook($nextbk,$name)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:prevchap">
            <xsl:param name="string"/>
            <xsl:param name="chap"/>
            <xsl:variable name="curseq" select="$usxseq/element[@book= $string]/@seq"/>
            <xsl:variable name="prevch" select="number($chap) - 1"/>
            <xsl:variable name="prevmatch" select="$allusx//usx[@book = $string]/chapterGroup/@number[number($prevch)]"/>
            <xsl:choose>
                  <xsl:when test="$firstbook = $string">
                        <xsl:value-of select="'null'"/>
                  </xsl:when>
                  <xsl:when test="$usxseq/element[@chapters = '0']/@book = $string ">
                        <xsl:choose>
                              <xsl:when test="$allusx//usx/chapterGroup/@book = f:prevbook($string,'name')">
                                    <xsl:text>0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:prevchap(f:prevbook($string,'name'),0)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="$prevmatch">
                                    <xsl:value-of select="$prevch"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:prevchap(f:prevbook($string,'name'),$allusx//element[@book = $string]/@chapters)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:nextchap">
            <xsl:param name="string"/>
            <xsl:param name="chap"/>
            <xsl:variable name="curseq" select="$usxseq/element[@book= $string]/@seq"/>
            <xsl:variable name="nextbk" select="$usxseq/element[number(@seq) = number($curseq + 1)]/@book"/>
            <xsl:variable name="nextch" select="number($chap) + 1"/>
            <xsl:variable name="nextmatch" select="$allusx//usx[@book = $string]/chapterGroup/@number[number($nextch)]"/>
            <xsl:choose>
                  <xsl:when test="$lastbook = $string">
                        <xsl:value-of select="'null'"/>
                  </xsl:when>
                  <xsl:when test="$usxseq/element[@chapters = '0']/@book = $string ">
                        <xsl:choose>
                              <xsl:when test="$allusx//usx[@book = $string]/chapterGroup/@book = f:nextbook($string,'name')">
                                    <xsl:text>0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:nextchap(f:nextbook($string,'name'),0)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="$nextmatch">
                                    <xsl:value-of select="number($chap) +1"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="f:nextchap(f:nextbook($string,'name'),0)"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:bookbefore">
            <xsl:param name="string"/>
            <xsl:variable name="curseq" select="f:sequence($string)"/>
            <xsl:variable name="prevbk" select="$usxseq//element[number(@seq) = number($curseq - 1)]/@book"/>
            <xsl:variable name="prevline" select="$line[number($curseq) - 1]"/>
            <!--<xsl:variable name="prevbk" select="tokenize($prevline)[2]"/> -->
            <xsl:choose>
                  <xsl:when test="$string = $firstbook">
                        <xsl:value-of select="concat('../index/index.html#',$string)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat('../index/',$prevbk,'_index.html')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:bookafter">
            <xsl:param name="string"/>
            <xsl:variable name="curseq" select="$usxseq//element[@book= $string]/@seq"/>
            <xsl:variable name="nextbk" select="$usxseq//element[number(@seq) = number($curseq + 1)]/@book"/>
            <xsl:choose>
                  <xsl:when test="$string = $lastbook">
                        <xsl:value-of select="concat('../index/index.html#',$string)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat('../index/',$nextbk,'_index.html')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
