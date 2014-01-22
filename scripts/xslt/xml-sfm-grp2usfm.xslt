<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:		xml-sfm-grp2usfm.xslt
    # Purpose:	extract USFM text files from a grouped xmlized SFM file.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2013/08/22
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:strip-space elements="*"/>
      <xsl:output method="text" name="text"/>
      <xsl:output method="text" />
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="outputpath"/>
      <xsl:param name="extension"/>
      <xsl:variable name="outputpathuri" select="f:file2uri($outputpath)"/>
      <xsl:template match="sfm">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="idGroup">
            <xsl:variable name="book" select="substring-before(id,' ')"/>
            <xsl:variable name="file" select="concat($outputpathuri,'/',$book,'.',$extension)"/>
            <xsl:value-of select="concat('&#10;',$book,'.',$extension)"/>
            <xsl:result-document href="{$file}" format="text">
                  <xsl:apply-templates/>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="*">
            <xsl:value-of select="concat('&#13;&#10;\',name(),' ')"/>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="id">
            <xsl:value-of select="concat('\',name(),' ')"/>
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="caller">
            <xsl:variable name="ref" select="substring-before(.,' ')"/>
            <xsl:variable name="text" select="substring-after(.,' ')"/>
            <xsl:value-of select="concat('\f + \fr ',$ref,' \ft ',$text,'\f*')"/>
      </xsl:template>
</xsl:stylesheet>
