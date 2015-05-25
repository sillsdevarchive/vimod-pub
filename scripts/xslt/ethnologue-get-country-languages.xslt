<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:		ethnologue-get-country-languages.xslt
    # Purpose:	After making an Ethnologue pseudo XHTML into XML (should not need to but) you can extract the iso codes and language names.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015-05-25
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:template match="*">
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="*[matches(@class,'views-row')]">
            <xsl:if test="string-length(*[@class = 'content']/*[@href][1]) gt 3">
                  <xsl:value-of select="translate(*[@class = 'content']/*[@href][1],'[]','')"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:value-of select="normalize-space(*[@class = 'title'][1])"/>
                  <xsl:text>&#13;&#10;</xsl:text>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
