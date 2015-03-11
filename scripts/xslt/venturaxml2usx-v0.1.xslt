<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         venturaxml2usx.xslt
    # Purpose:		Attempt to transfer Venturaxml (my intermediate version) to usx
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" name="usx"/>
      <xsl:strip-space elements="tag"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:param name="paramapfile"/>
      <xsl:param name="tagmapfile"/>
      <xsl:param name="outputpath" select="'D:\All-SIL-Publishing\vimod-pub\data\ventura2usfm\kne\usx'"/>
      <xsl:variable name="paramap" select="f:file2lines($paramapfile)"/>
      <xsl:variable name="tagmap" select="f:file2lines($tagmapfile)"/>
      <xsl:variable name="outputpathuri" select="f:file2uri($outputpath)"/>
      <xsl:template match="/*">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="book">
            <xsl:variable name="hrefout" select="concat($outputpathuri,'/0',@seq,@book,'.usx')"/>
            <!--<xsl:result-document href="$hrefout" format="usx"> -->
            <xsl:element name="usx">
                  <xsl:attribute name="version">
                        <xsl:text>2.0</xsl:text>
                  </xsl:attribute>
                  <xsl:apply-templates>
                        <xsl:with-param name="code" select="@book"/>
                  </xsl:apply-templates>
            </xsl:element>
            <!-- </xsl:result-document> -->
      </xsl:template>
      <xsl:template match="scr">
            <xsl:param name="code"/>
            <xsl:apply-templates>
                  <xsl:with-param name="code" select="$code"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="para">
            <xsl:param name="code"/>
            <xsl:variable name="match" select="f:lookupdefault($paramap,@class,'&#9;',1,2,'NoMatch')"/>
            <xsl:choose>
                  <xsl:when test="$match = 'unwanted'"/>
                  <xsl:when test="$match = 'id'">
                        <xsl:element name="book">
                              <xsl:attribute name="code">
                                    <xsl:value-of select="$code"/>
                              </xsl:attribute>
                              <xsl:attribute name="syle">
                                    <xsl:value-of select="$match"/>
                              </xsl:attribute>
                              <xsl:apply-templates/>
                        </xsl:element>
                  </xsl:when>
                  <xsl:when test="$match = 'c'">
                        <xsl:element name="chapter">
                              <xsl:attribute name="number">
                                    <xsl:value-of select="normalize-space(.)"/>
                              </xsl:attribute>
                              <xsl:attribute name="style">
                                    <xsl:value-of select="$match"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:when>
                  <xsl:when test="$match = 'p_noverse1'">
                        <xsl:copy>
                              <xsl:attribute name="style">
                                    <xsl:value-of select="'p'"/>
                              </xsl:attribute>
                              <xsl:text>&#10;</xsl:text>
                              <xsl:element name="verse">
                                    <xsl:attribute name="number">
                                          <xsl:value-of select="1"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="style">
                                          <xsl:value-of select="v"/>
                                    </xsl:attribute>
                              </xsl:element>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:attribute name="style">
                                    <xsl:value-of select="$match"/>
                              </xsl:attribute>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="tag">
            <xsl:variable name="match" select="f:lookupdefault($tagmap,@value,'&#9;',2,1,'NoMatch')"/>
            <xsl:choose>
                  <xsl:when test="$match = 'unwanted'"/>
                  <xsl:when test="$match = ''">
                        <xsl:apply-templates />
                  </xsl:when>
                  <xsl:when test="$match = 'v'">
                        <xsl:element name="verse">
                              <xsl:attribute name="number">
                                    <xsl:value-of select="normalize-space(.)"/>
                              </xsl:attribute>
                              <xsl:attribute name="style">
                                    <xsl:value-of select="$match"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:attribute name="style">
                                    <xsl:value-of select="$match"/>
                              </xsl:attribute>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
