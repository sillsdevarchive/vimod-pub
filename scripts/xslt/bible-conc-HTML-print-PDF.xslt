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
<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
      <xsl:include href="project.xslt"/>
      <xsl:template match="/*">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang='ifb'>
                  <head>
                        <title>
                              <xsl:value-of select="$title"/>
                        </title>
                        <meta charset='utf-8'/>
                        <meta name='description' content=''/>
                        <meta name='keywords' content='concordance; Ayangan Ifugao; Bible; find words'/>
                        <meta name='builder' content='Vimod-Pub USX Concordance Builder'/>
    <style type="text/css">
    body {-moz-column-count: 2;}
     p {
       margin: 0 0 0 1em;
       text-indent: -1em;
     }
    
    </style>
                  </head>
                  <body>
                        <xsl:apply-templates/>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="w">
            <xsl:element name="p">
                  <xsl:value-of select="@word"/>
                  <xsl:text>&#x2002;</xsl:text>
                  <xsl:apply-templates select="ref"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="ref">
            <xsl:if test="position() gt 1">
                  <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
      </xsl:template>
</xsl:stylesheet>
