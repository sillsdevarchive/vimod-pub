<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:        	epub-xhtml2f-func .xslt
    # Purpose:	create a xslt function that contains footnotes and cross references from the xhtml file. Created before running epub-xhtml2usfm.xslt
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/10/22
    # Copyright:   	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt" xmlns:f="myfunctions" exclude-result-prefixes="xsl">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="f-caller" select="'+'"/>
      <xsl:param name="x-caller" select="'+'"/>
      <xsl:template match="/">
            <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                  <gen:function name="f:refmatch">
                        <gen:param name="string"/>
                        <gen:choose>
                              <xsl:apply-templates select="descendant::*[@class = 'NoteFrame']"/>
                              <xsl:text>&#10;</xsl:text>
                              <gen:otherwise/>
                        </gen:choose>
                  </gen:function>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template match="*[@class = 'NoteFrame']">
            <xsl:apply-templates select="*[@class = 'f' or @class = 'x']"/>
      </xsl:template>
      <xsl:template match="*[@class = 'x' or @class = 'f']">
            <xsl:variable name="type" select="substring(tokenize(*[1],'_')[2],1,1)"/>
            <xsl:choose>
                  <!-- This is needed for when a xref is put in a f paragraph in error -->
                  <xsl:when test="$type = 'f'">
                        <xsl:apply-templates select="*" mode="footnote"/>
                        <xsl:text disable-output-escaping="yes">\f*&lt;/xsl:when&gt;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:apply-templates select="*" mode="xref"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*" mode="xref">
            <xsl:variable name="classname" select="tokenize(@class,' ')"/>
            <xsl:choose>
                  <xsl:when test="$classname = 'noteId'">
                        <xsl:text disable-output-escaping="yes">&#13;&#10;&lt;xsl:when test="$string = '</xsl:text>
                        <xsl:value-of select="tokenize(.,'_')[2]"/>
                        <xsl:text disable-output-escaping="yes">'"&gt;\x </xsl:text><xsl:value-of select="$x-caller"/>
                  </xsl:when>
                  <xsl:when test="$classname = 'noteEndSpace'">
                        <xsl:text> </xsl:text>
                        <xsl:choose>
                              <xsl:when test="string-length(replace(preceding::node()[1],'\s+','')) = 0">
                                    <!-- This is to solve xref occuring in a f paragraph. -->
                                    <xsl:value-of select="replace(preceding::node()[2],'^&#160;','')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="replace(preceding::node()[1],'^&#160;','')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text disable-output-escaping="yes">\x*&lt;/xsl:when&gt;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*" mode="footnote">
            <xsl:variable name="classname" select="tokenize(@class,' ')"/>
            <xsl:choose>
                  <xsl:when test="$classname = 'noteId'">
                        <xsl:text disable-output-escaping="yes">&#13;&#10;&lt;xsl:when test="$string = '</xsl:text>
                        <xsl:value-of select="tokenize(.,'_')[2]"/>
                        <xsl:text disable-output-escaping="yes">'"&gt;\f </xsl:text><xsl:value-of select="$f-caller"/>
                  </xsl:when>
                  <xsl:when test="$classname = 'fr' or $classname = 'ft'  or $classname = 'fq' or $classname = 'it'">
                        <xsl:value-of select="concat(' \',$classname,' ')"/>
                        <xsl:value-of select="."/>
                        <xsl:value-of select="concat('\',$classname,'*')"/>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
