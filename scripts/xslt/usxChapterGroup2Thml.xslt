<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         usxChapterGroup2Thml.xslt
    # Purpose:    First try at making Thml from USX chapter grouped data.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="f" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8" name="text"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:variable name="allowedpara" select="tokenize('p q q1 q2 q3 pi m',' ')"/>
      <xsl:variable name="booknames" select="/data/usx/bookGroup/para[@style = 'h']"/>
      <xsl:variable name="href" select="concat(f:file2uri($projectpath),'/output/Collections.txt')"/>
      <xsl:template match="/*">
            <xsl:result-document href="{$href}" format="text">
                  <!-- Collections.txt generator -->
                  <xsl:text>Info: </xsl:text>
                  <xsl:value-of select="$title"/>
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="$languagename"/>
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="$country"/>
                  <xsl:text>, Copyright © </xsl:text>
                  <xsl:value-of select="rightsholder"/>
                  <xsl:text>, Download from </xsl:text>
                  <xsl:value-of select="$website"/>
                  <xsl:text>&#13;&#10;</xsl:text>
                  <xsl:text>Source-Text: </xsl:text>
                  <xsl:value-of select="$iso"/>
                  <xsl:text>.thml&#13;&#10;</xsl:text>
                  <xsl:text>Language-Code: </xsl:text>
                  <xsl:value-of select="$iso"/>
                  <xsl:text>&#13;&#10;</xsl:text>
                  <xsl:text>Collection: </xsl:text>
                  <xsl:value-of select="$title"/>
                  <xsl:text>&#13;&#10;</xsl:text>
                  <xsl:text>Book: </xsl:text>
                  <xsl:value-of select="string-join(($booknames),'&#13;&#10;Book: ')"/>
            </xsl:result-document>
            <!-- start ThML creation -->
            <xsl:element name="ThML">
                  <xsl:element name="ThML.body">
                        <xsl:element name="div1">
                              <xsl:apply-templates select="usx"/>
                        </xsl:element>
                  </xsl:element>
            </xsl:element>
      </xsl:template>
      <xsl:template match="usx">
            <xsl:element name="div2">
                  <xsl:attribute name="title">
                        <xsl:value-of select="bookGroup/para[@style = 'h']"/>
                  </xsl:attribute>
                  <xsl:attribute name="id">
                        <xsl:value-of select="@book"/>
                  </xsl:attribute>
                  <xsl:apply-templates select="chapterGroup"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="chapterGroup">
            <xsl:element name="div3">
                  <xsl:attribute name="title">
                        <xsl:value-of select="concat('Chapter ',@number)"/>
                  </xsl:attribute>
                  <xsl:apply-templates select="para[@style = $allowedpara]"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="para">
            <xsl:element name="p">
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="verse">
            <xsl:variable name="numb" select="translate(@number,'abcd','')"/>
            <xsl:choose>
                  <xsl:when test="matches($numb,'^\d+$')">
                        <!-- the verse is just a number and not a bridge -->
                        <xsl:element name="scripture">
                              <xsl:attribute name="number">
                                    <xsl:value-of select="@number"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:variable name="fnl" select="tokenize($numb,'[,\-]')"/>
                        <xsl:variable name="first" select="$fnl[1]"/>
                        <xsl:variable name="last" select="$fnl[last()]"/>
                        <xsl:call-template name="bridge">
                              <xsl:with-param name="vseq" select="$first"/>
                              <xsl:with-param name="last" select="number($last)"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="note"/>
      <xsl:template name="bridge">
            <xsl:param name="vseq"/>
            <xsl:param name="last"/>
            <xsl:variable name="next" select="number($vseq) + 1"/>
            <xsl:choose>
                  <xsl:when test="number($vseq) lt  number($last) ">
                        <xsl:element name="scripture">
                              <xsl:attribute name="number">
                                    <xsl:value-of select="$vseq"/>
                              </xsl:attribute>
                        </xsl:element>
                        <xsl:text> - &#10;</xsl:text>
                        <xsl:call-template name="bridge">
                              <xsl:with-param name="vseq" select="$next"/>
                              <xsl:with-param name="last" select="$last"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="scripture">
                              <xsl:attribute name="number">
                                    <xsl:value-of select="$vseq"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
