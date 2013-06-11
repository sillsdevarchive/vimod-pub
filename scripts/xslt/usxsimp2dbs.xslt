<?xml version="1.0" encoding="UTF-8"?>
<!-- #############################################################
    # Name:        usx2dbs_index.xsl
    # Purpose:     Generate chapter from usx
    #
    # Author:      Greg Trihus <greg_trihus@sil.org>
    #
    # Created:     2013/04/30
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LPGL>
    ################################################################-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <xsl:output encoding="UTF-8" method="xml" name="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:output method="text"/>
      <xsl:include href='inc-scr-html5-write-page.xslt'/>
      <xsl:include href='usfm-chap-before-after.xslt'/>
      <xsl:variable name="posturl" select="'.html'"/>
      <xsl:param name="vol" select="'nt'"/>
      <xsl:param name="parampath"/>
      <xsl:variable name="bookhandle" select="/usx/book/@code"/>
      <xsl:variable name="book" select="/usx/book/@code"/>
      <xsl:variable name="bookname" select="/usx/hGroup/h"/>
      <xsl:variable name="header" select="document($parampath)//header"/>
      <xsl:variable name="iso" select="document($parampath)//iso/text()"/>
      <xsl:variable name="lang" select="document($parampath)//lang/text()"/>
      <xsl:variable name="dir" select="document($parampath)//dir/text()"/>
      <xsl:variable name="outpath" select="document($parampath)//outpath/text()"/>
      <xsl:template match="/usx">
            <xsl:for-each select="cGroup">
                  <xsl:variable name="chapter" select="c/@number"/>
                  <xsl:call-template name="writehtmlpage">
                        <xsl:with-param name="filename" select="concat($outpath,$bookhandle,'.',$chapter,$posturl)"/>
                        <xsl:with-param name="chapter" select="$chapter"/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
