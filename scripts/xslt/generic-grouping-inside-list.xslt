<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <!-- Part of the SILP Dictionary Creator
Used to group by $groupnode found within $parentnodes (from list)  but excluding the listed nodes in $control list
Written by Ian McQuay 
Created 2012-06-14

-->
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="groupnode"/>
      <xsl:param name="parentnodes"/>
      <xsl:variable name="parents">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$parentnodes"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:param name="excludelist"/>
      <xsl:variable name="excludes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$excludelist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:template match="*[local-name() = $parents/element/text()]">
            <xsl:copy>
                  <xsl:for-each-group select="*" group-starting-with="*[local-name() = $groupnode]">
                        <xsl:choose>
                              <xsl:when test="preceding-sibling::*[local-name() = $groupnode] or self::*[local-name() = $groupnode] ">
                                    <xsl:element name="{$groupnode}Group">
                                          <xsl:apply-templates select="current-group()[local-name() != $excludes//element/text() or local-name() != $parents//element/text()]" mode="include"/>
                                    </xsl:element>
                                    <xsl:apply-templates select="current-group()[local-name() = $excludes//element/text() or local-name() = $parents//element/text()]" mode="exclude"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:apply-templates select="current-group()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each-group>
            </xsl:copy >
      </xsl:template>
      <xsl:template match="*" mode="include">
            <xsl:choose>
                  <xsl:when test="local-name() = $excludes//element/text() or local-name() = $parents//element/text()">
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*" mode="exclude">
            <xsl:choose>
                  <xsl:when test="local-name() = $excludes//element/text() or local-name() = $parents//element/text()">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
