<!--
    #############################################################
    # Name:		generic-grouping-start-with-attrib.xslt
    # Purpose:	Used to group via a list of sibling elements. 
    # Part of:  	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author: 	Ian McQuay <ian_mcquay.org>
    # Created:	2015-01-13
    # Copyright:	(c) 2015 SIL International
    # Licence:	<LGPL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:include href='project.xslt'/>
      <xsl:variable name="groupnodes" select="tokenize($label-literal,$label-literal-tokenizer)"/>
      <xsl:template match="*[local-name() = $label-literal-parentnode]">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:for-each-group select="node()" group-starting-with="*[. = $groupnodes]">
                        <!-- Changed the select from select="*" to 'node()" so text nodes were included -->
                        <xsl:choose>
                              <xsl:when test="preceding-sibling::*[. != $groupnodes] ">
                                    <xsl:element name="{translate(.,' .(','')}Group">
                                          <xsl:apply-templates select="current-group()" mode="label"/>
                                    </xsl:element>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:apply-templates select="current-group()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each-group>
            </xsl:copy >
      </xsl:template>
      <xsl:template match="*[@* = $normal]" mode="label"/>
      <xsl:template match="*[@* = $italic or @* = $number]" mode="label">
            <xsl:copy>
                  <xsl:apply-templates select="node()|@*"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
