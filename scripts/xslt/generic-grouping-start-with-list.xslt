<!--
    #############################################################
    # Name:		generic-grouping-start-with-list.xslt
    # Purpose:	Used to group via a list of sibling elements. 
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2012-06-14
    # Modified:	2013-09-04
    # Copyright:    (c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="parentnode"/>
      <xsl:param name="groupnodelist"/>
      <xsl:variable name="groupnodes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$groupnodelist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:template match="*[local-name() = $parentnode]">
            <xsl:copy>
                  <xsl:for-each-group select="node()" group-starting-with="*[local-name() = $groupnodes//element/text()]">
                        <!-- Changed the select from select="*" to 'node()" so text nodes were included -->
                        <xsl:choose>
                              <xsl:when test="preceding-sibling::*[local-name() != $groupnodes//element/text()] or self::*[local-name() = $groupnodes//element/text()]">
                                    <xsl:element name="{local-name()}Group">
                                          <xsl:apply-templates select="current-group()"/>
                                    </xsl:element>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:apply-templates select="current-group()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each-group>
            </xsl:copy >
      </xsl:template>
</xsl:stylesheet>
