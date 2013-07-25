<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <!-- Part of the SILP Dictionary Creator
Used to group via a list of peer elements. Such as ms, lc, ld or ms, oid, oic
Used after the dictionary has been grouped into lxGroup

Written by: Ian McQuay 
Created 2012-06-14

-->
      <xsl:param name="parentnode"/>
      <xsl:param name="groupnodelist"/>
      <xsl:variable name="groupnodes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$groupnodelist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:template match="*[local-name() = $parentnode]">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:for-each-group select="*" group-starting-with="*[local-name() = $groupnodes//element/text()]">
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
