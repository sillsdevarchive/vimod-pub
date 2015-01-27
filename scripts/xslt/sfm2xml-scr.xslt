<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
<!--
    #############################################################
    # Name:         sfm2xml-scr.xslt
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
      <xsl:param name="find1"/>
      <xsl:param name="replace1"/>
      <xsl:param name="find2"/>
      <xsl:param name="replace2"/>
      <xsl:param name="caller"/>

      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextfile)"/><!-- convert win path to uri -->
      <xsl:variable name="sourcetext" select="unparsed-text($sourcetexturi)"/><!-- get the text -->
      <xsl:variable name="sourcetext2" select="replace($sourcetext,$find1,$replace1)"/><!-- do first param defined replacement -->
      <xsl:variable name="sourcetext3" select="replace($sourcetext2,$find2,$replace2)"/><!-- do second param defined replacement -->
      <xsl:variable name="sourcetext4" select="replace($sourcetext3,'(\r)',' $1')"/><!-- make a space at the end of each line  so every empty sfm can be found-->
      <xsl:template match="/">
            <xsl:element name="sfm">
                  <xsl:analyze-string select="$sourcetext4" regex="\n\\">
                        <!-- split on new line followed by a backslash -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:variable name="tag" select="translate(substring-before(.,' '),'*_-\','')"/>
                              <xsl:variable name="data" select="substring-after(.,' ')"/>
                              <xsl:if test="string-length($tag) gt 0">
                                    <xsl:element name="{$tag}">
                                          <!-- create element with sfm marker as element name -->
                                          <xsl:value-of select="normalize-space(replace($data,$caller,'&lt;caller/&gt;'))" disable-output-escaping="yes"/>
                                          <!-- Output data folowing space after sfm marker -->
                                    </xsl:element>
                              </xsl:if>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
