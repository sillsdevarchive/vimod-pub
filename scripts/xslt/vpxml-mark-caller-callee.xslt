<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="tag[@value = $caller-feature][. = $caller]">
            <!--<xsl:template match="tag[matches(@value,$f_match)]"> -->
            <xsl:choose>
                  <xsl:when test="string-length(.) = 0"/>
                  <xsl:otherwise>
                        <xsl:element name="caller">
                              <xsl:attribute name="cseq">
                                    <xsl:value-of select="count(preceding::tag[@value = $caller-feature][. = $caller][ancestor::scr]) + 1"/>
                              </xsl:attribute>
                              <xsl:attribute name="value">
                                    <xsl:value-of select="@value"/>
                              </xsl:attribute>
                              <xsl:attribute name="callertext">
                                    <xsl:value-of select="normalize-space(.)"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[@value = $callee-feature][ancestor::note]">
            <!-- matches callee features -->
            <callee value="{.}"/>
      </xsl:template>
      <xsl:template match="*[matches(@value,$footnoteref)][ancestor::note][1]">
            <!-- matches back ref in footnote -->
            <fr>
                  <xsl:value-of select="."/>
            </fr>
      </xsl:template>
      <xsl:template match="para[@class = $fnote][parent::note]">
            <!-- this is when footnotes are in individual paragraphs -->
            <xsl:element name="fnote">
                  <xsl:attribute name="nseq">
                        <xsl:value-of select="count(preceding::para[@class = $fnote]) + 1"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="calleeGroup">
            <!-- this is when multiple footnotes are in one paragraphs -->
            <xsl:element name="fnote">
                  <xsl:attribute name="nseq">
                        <xsl:value-of select="count(preceding::calleeGroup)   + 1"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
