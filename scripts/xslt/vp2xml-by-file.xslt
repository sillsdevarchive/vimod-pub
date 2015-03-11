<?xml version="1.0"?>
<!--
    #############################################################
    # Name:         vp2xml-by-file.xslt
    # Purpose:	 Import Ventura text that has been converted to UTF-8 by a list.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>

      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
      <xsl:param name="filepre"/>
      <xsl:param name="filepost"/>
      <xsl:param name="sourcelistfile"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcelistfile)"/>
      <xsl:variable name="list" select="translate(unparsed-text($sourcetexturi),'&#xD;','')"/>
      <xsl:variable name="line" select="tokenize($list,'\n')"/>
      <xsl:template match="/">
            <xsl:element name="data">
                  <xsl:for-each select="$line">
                        <xsl:variable name="bkdata" select="tokenize(.,' ')"/>
                        <xsl:variable name="book" select="$bkdata[2]"/>
                        <xsl:variable name="href" select="concat('file:///',$filepre,$book,$filepost)"/>
                        <xsl:variable name="href-fn" select="concat('file:///',$filepre,$book,'fn',$filepost)"/>
                        <xsl:value-of select="."/>
                        <xsl:if test="unparsed-text-available($href)">
                              <xsl:element name="book">
                                    <xsl:attribute name="book">
                                          <xsl:value-of select="$book"/>
                                    </xsl:attribute>
                                    <xsl:call-template name="book">
                                          <xsl:with-param name="book" select="$book"/>
                                          <xsl:with-param name="href" select="$href"/>
                                          <xsl:with-param name="type" select="'scr'"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="book">
                                          <xsl:with-param name="book" select="$book"/>
                                          <xsl:with-param name="href" select="$href-fn"/>
                                          <xsl:with-param name="type" select="'note'"/>
                                    </xsl:call-template>
                              </xsl:element>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:template name="book">
            <xsl:param name="book"/>
            <xsl:param name="href"/>
            <xsl:param name="type"/>
            <xsl:variable name="text" select="unparsed-text($href)"/>
            <xsl:variable name="para" select="tokenize($text,'\n@')"/>
            <xsl:element name="{$type}">
                  <xsl:for-each select="$para">
                        <xsl:variable name="part" select="tokenize(.,' = ')"/>
                        <xsl:variable name="chaptype" select="substring-before(.,' = ')"/>
                        <xsl:variable name="initialstring" select="substring-after(.,' = ')"/>
                        <xsl:variable name="prestring" select="substring-before($initialstring,'&lt;')"/>
                        <xsl:variable name="poststring" select="substring-after($initialstring,'&lt;')"/>
                        <xsl:element name="para">
                              <xsl:attribute name="class">
                                    <xsl:value-of select="translate($part[1],' ','_')"/>
                              </xsl:attribute>
                              <xsl:call-template name="parsepara">
                                    <xsl:with-param name="paracontent" select="$part[2]"/>
                              </xsl:call-template>
                        </xsl:element>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:template name="parsepara">
            <!-- analyze-string template -->
            <xsl:param name="paracontent"/>
            <xsl:choose>
                  <xsl:when test="matches($paracontent,'\}')">
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
                                    <xsl:value-of select="$tag[1]"/>
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
