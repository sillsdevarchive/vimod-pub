<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:	rewrite BookName.xml by filling in data from USX files
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:param name="usxpath" select="'D:\usx'"/>
      <xsl:param name="bookdatafile" select="'D:\All-SIL-Publishing\vimod-pub\resources\usx-numbering.txt'"/>
      <xsl:variable name="bookdata" select="f:file2lines($bookdatafile)"/>
      <xsl:template match="/BookNames">
            <xsl:copy>
                  <xsl:apply-templates select="*"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="book">
            <xsl:variable name="bknumb" select="f:lookupdefault($bookdata,@code,'&#9;',2,1,'')"/>
            <xsl:variable name="usxfile" select="concat($usxpath,'\',$bknumb,@code,'.usx')"/>
            <xsl:copy>
                  <xsl:choose>
                        <xsl:when test="doc-available(f:file2uri($usxfile))">
                              <xsl:variable name="usx" select="doc(f:file2uri($usxfile))"/>
                              <xsl:apply-templates select="@code"/>
                              <xsl:apply-templates select="@abbr" mode="fill">
                                    <xsl:with-param name="usx" select="$usx"/>
                                    <xsl:with-param name="bk" select="@code"/>
                              </xsl:apply-templates>
                              <xsl:apply-templates select="@short"/>
                              <xsl:apply-templates select="@long" mode="fill">
                                    <xsl:with-param name="usx" select="$usx"/>
                                    <xsl:with-param name="bk" select="@code"/>
                              </xsl:apply-templates>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:apply-templates select="@*"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="@abbr" mode="fill">
            <xsl:param name="usx"/>
            <xsl:param name="bk"/>
            <xsl:choose>
                  <xsl:when test="string-length(.) = 0">
                        <xsl:attribute name="abbr">
                              <xsl:choose>
                                    <xsl:when test="matches($bk,'\d')">
                                          <xsl:value-of select="substring($usx//*[@style = 'h'],1,5)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="substring($usx//*[@style = 'h'],1,3)"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:copy/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="@long" mode="fill">
            <xsl:param name="usx"/>
            <xsl:param name="bk"/>
            <xsl:choose>
                  <xsl:when test="string-length(.) = 0">
                        <xsl:attribute name="long">
                              <xsl:value-of select="$usx//*[@style = 'mt1' or @style = 'mt2'  or @style = 'mt' ]"/>
                        </xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:copy/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="@*">
            <xsl:copy/>
      </xsl:template>
</xsl:stylesheet>
