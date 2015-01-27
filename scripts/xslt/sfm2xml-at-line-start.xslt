<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <!--
    #############################################################
    # Name:         sfm2xml-at-line-start.xslt
    # Purpose:	A transformation to ingest SFM. SFM that starts a line is made into an element but inline codes are left as text.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2013-01-30
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    # CLI usage:	java  -jar "saxon9.jar"   -o "output.xml" "sfm2xml-scr.xslt" "sfm2xml-scr.xslt" sourcetextfile="drive:\path\source.sfm"
    ################################################################
-->
      <!-- 
Simple SFM to XML importer
This imports a sfm text and converts to a flat xml file.
It can import inline sfm codes. like \bd bold words\bd*
It is designed to remove _ occuring as the first character after the \ 
and to include the first line.

-->
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetextfile"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextfile)"/>
      <!-- convert win path to uri -->
      <xsl:variable name="sourcetext" select="unparsed-text($sourcetexturi)"/>
      <!-- get the text -->
      <xsl:template match="/">
            <xsl:element name="sfm">
                  <xsl:analyze-string select="$sourcetext" regex="\n\\">
                        <!-- split on new line followed by a backslash -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:variable name="tag" select="translate(substring-before(concat(.,' '),' '),'*_-\','')"/>
                              <xsl:variable name="data" select="substring-after(.,' ')"/>
                              <xsl:if test="string-length($tag) gt 0">
                                    <xsl:element name="{$tag}">
                                          <!-- create element with sfm marker as element name -->
                                          <xsl:value-of select="normalize-space($data)" disable-output-escaping="yes"/>
                                          <!-- Output data folowing space after sfm marker -->
                                    </xsl:element>
                              </xsl:if>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
