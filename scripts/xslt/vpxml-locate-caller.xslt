<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project-param.xslt"/>
      <xsl:template match="tag[matches(@value,$caller-features[1]) and matches(@value,$caller-features[2])]">
            <!--<xsl:template match="tag[matches(@value,$f_match)]"> -->
            <xsl:choose>
                  <xsl:when test="string-length(.) = 0"/>
                  <xsl:otherwise>
                        <xsl:element name="caller">
                              <xsl:attribute name="cseq">
                                    <xsl:value-of select="count(preceding::tag[matches(@value,$caller-features[1]) and matches(@value,$caller-features[2])]) + 1"/>
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
      <xsl:template match="calleeGroup">
            <xsl:element name="fnote">
                  <xsl:attribute name="nseq">
                        <xsl:value-of select="count(preceding::calleeGroup) + 1"/>
                  </xsl:attribute>
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
