<?xml version="1.0"?>
<!--
    #############################################################
    # Name:   		vp2xml-onefile-input.xslt
    # Purpose:		Import a single Ventura text of whole nt text that has been converted to UTF-8
    # Part of: 		Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author: 		Ian McQuay <ian_mcquay.org>
    # Created: 		2014-02-
    # Copyright:		(c) 2013 SIL International
    # Licence:  		<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:functx="http://www.functx.com" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="scr note"/>
      <!-- includes for needed params, functions, templates -->
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-replace-array.xslt"/>
      <xsl:include href="vpxml-cmap.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:variable name="vptext" select="f:file2text($allvptextutf8file)"/>
      <xsl:variable name="vptext2" select="translate(f:replace-array($vptext,$replacearray,1,'&#9;'),'&lt;&gt;&#13;','{}')"/>
      <xsl:variable name="bookraw" select="tokenize($vptext2,'@@@ scr ')"/>
      <xsl:variable name="replacearray" select="f:file2lines($replacearrayfile)"/>
      <xsl:template match="/">
<xsl:comment select="substring($vptext,0,100)"/>
            <!-- starting template -->
            <xsl:element name="data">
                  <xsl:for-each select="$bookraw">
                        <xsl:variable name="bkseq" select="position()-1"/>
                        <xsl:choose>
                              <xsl:when test=". = ''"/>
                              <xsl:otherwise>
                                    <!-- for each book of the Bible -->
                                    <xsl:variable name="bookdata" select="tokenize(.,'@@@ fn ')"/>
                                    <xsl:variable name="data" select="$bookdata[1]"/>
                                    <xsl:variable name="footnote" select="$bookdata[2]"/>
                                    <xsl:variable name="bookname" select="substring($data,1,4)"/>
                                    <!-- old below -->
                                    <xsl:element name="book">
                                          <xsl:attribute name="book">
                                                <xsl:value-of select="$bookname"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="bkseq">
                                                <xsl:value-of select="$bkseq"/>
                                          </xsl:attribute>
                                          <xsl:call-template name="book">
                                                <xsl:with-param name="book" select="$bookname"/>
                                                <xsl:with-param name="text" select="$data"/>
                                                <!-- change < char to { and > to } and remove carriage return characters -->
                                                <xsl:with-param name="type" select="'scr'"/>
                                          </xsl:call-template>
                                          <xsl:if test="$bookdata[2]">
                                                <xsl:call-template name="book">
                                                      <xsl:with-param name="book" select="$bookname"/>
                                                      <xsl:with-param name="text" select="$footnote"/>
                                                      <!-- change < char to { and > to } and remove carriage return characters -->
                                                      <xsl:with-param name="type" select="'note'"/>
                                                </xsl:call-template>
                                          </xsl:if>
                                    </xsl:element>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:template name="book">
            <xsl:param name="book"/>
            <xsl:param name="type"/>
            <xsl:param name="text"/>
            <xsl:variable name="para" select="tokenize($text,'\n@')"/>
            <!--<xsl:value-of select="$text"/>
            <xsl:value-of select="'&#10;'"/> -->
            <xsl:element name="{$type}">
                  <xsl:for-each select="$para">
                        <xsl:variable name="line" select="replace(.,'\n',' ')"/>
                        <!-- The following line had a space changed to a \s to handle a CR LF there instead of a space that is commonly found, working better 2014-12-02s  -->
                        <xsl:variable name="para-seperator" select="' =\s{0,2}'"/>
                        <xsl:variable name="part" select="tokenize($line,$para-seperator)"/>
                        <xsl:variable name="chaptype" select="substring-before($line,$para-seperator)"/>
                        <xsl:variable name="initialstring" select="substring-after($line,$para-seperator)"/>
                        <xsl:variable name="prestring" select="substring-before($initialstring,'&lt;')"/>
                        <xsl:variable name="poststring" select="substring-after($initialstring,'&lt;')"/>
                        <xsl:choose>
                              <xsl:when test="'' = $part[2]"/>
                              <xsl:otherwise>
                                    <xsl:element name="para">
                                          <xsl:attribute name="class">
                                                <xsl:value-of select="upper-case(translate($part[1],' ','_'))"/>
                                          </xsl:attribute>
                                          <xsl:call-template name="parsepara">
                                                <xsl:with-param name="paracontent" select="f:replaceencodedchars($part[2])"/>
                                          </xsl:call-template>
                                    </xsl:element>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:template name="parsepara">
            <!-- analyze-string template -->
            <xsl:param name="paracontent"/>
            <xsl:choose>
                  <xsl:when test="matches($paracontent,'\}')">
                        <!-- Handles regular markup  elements -->
                        <xsl:variable name="part" select="tokenize($paracontent,'\{')"/>
                        <xsl:for-each select="$part">
                              <xsl:call-template name="parsetags">
                                    <xsl:with-param name="tagnstring" select="."/>
                              </xsl:call-template>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="replace($paracontent,'&#xA;','')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="parsetags">
            <!-- analyze-string template -->
            <xsl:param name="tagnstring"/>
            <xsl:variable name="tag" select="tokenize($tagnstring,'\}')"/>
            <xsl:choose>
                  <xsl:when test="matches(.,'\}')">
                        <xsl:element name="tag">
                              <xsl:attribute name="value">
                                    <xsl:value-of select="replace($tag[1],'&#34;','')"/>
                              </xsl:attribute>
                              <xsl:value-of select="replace($tag[2],'&#xA;','')"/>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="replace(.,'&#xA;','')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
