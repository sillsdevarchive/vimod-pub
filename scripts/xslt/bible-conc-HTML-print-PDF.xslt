<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         bible-conc-HTML-print-PDF.xslt
    # Purpose:		Make HTML for Print of Concorded words
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="html" version="5.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="/*">
            <html lang='eng'>
                  <head>
                        <title>
                              <xsl:value-of select="$title"/>
                        </title>
                        <meta charset='utf-8'/>
                        <meta name='description' content=''/>
                        <meta name='keywords' content='concordance; Ayangan Ifugao; Bible; find words'/>
                        <meta name='builder' content='Vimod-Pub USX Concordance Builder'/>
                        <style type="text/css">
@page {
    counter-increment: page;
    margin: 2cm 2cm 2cm 2cm;
    @top-left {
        content: string(guideword, first);
        direction: ltr;
        font-family: "Charis SIL", sans-serif;   /* default Serif font */
        font-weight: bold;
        font-size: 12pt;
        margin-top: 1em;
    }
    @top-center {
        content: counter(page);
        margin-top: 1em
    }
    @top-right {
        content: string(guideword, last);
        direction: ltr;
        font-family: "Charis SIL", sans-serif;   /* default Serif font */
        font-weight: bold;
        font-size: 12pt;
        margin-top: 1em;
    }
}
@page :first {
    @top-left { content: ''; }
    @top-center { content: 'Ayangan Ifugao Bible Concordance'; }
    @top-right { content: ''; }
}
body { 
	font-size:11pt;
}
.content {
	column-count: 3;   
	-moz-column-count: 3;
	column-gap: 1.5em; 
	-moz-column-gap: 1.5em;
	column-fill: balance;
}
p {
       margin: 0 0 0 1em;
       text-indent: -1em;
	line-height:12pt;
     }
.word {string-set: guideword content();font-weight:bold;}    
.chap {font-weight:600}
.book { font-style:italic;}
    </style>
                  </head>
                  <body>
                        <div class="content">
                              <xsl:apply-templates/>
                        </div>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="w">
            <xsl:element name="p">
                  <span class="word">
                        <xsl:value-of select="@word"/>
                  </span>
                  <xsl:text>&#x2002;</xsl:text>
                  <xsl:apply-templates select="bk"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="bk">
            <span class="book">
                  <xsl:value-of select="@book"/>
            </span>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="chapter"/>
            <xsl:text> </xsl:text>
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
</xsl:stylesheet>
