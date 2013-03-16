<!--  Part of the SILP Dictionary Creator
	group adjacent three adjacent node by name $firstnode, $secondnode, &thirdnode nodes  under {$firstnode}Group.
	only groups immediately adjacent siblings
	Modified by Ian McQuay 
	Created 2012-06-14
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="firstnode"/>
      <xsl:param name="secondnode"/>
      <xsl:param name="thirdnode"/>
      <xsl:variable name="groupnode" select="concat($firstnode,'Group')"/>
      <xsl:template match="*[local-name() = $firstnode]">
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:if test="following-sibling::*[1][local-name()=$secondnode]">
                  <xsl:element name="{$groupnode}">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                        <xsl:if test="name(following-sibling::*[1])=$secondnode">
                              <xsl:copy-of select="following-sibling::*[1]"/>
                        </xsl:if>
                        <xsl:if test="name(following-sibling::*[2])=$thirdnode">
                              <xsl:copy-of select="following-sibling::*[2]"/>
                        </xsl:if>
                  </xsl:element>
            </xsl:if>
      </xsl:template>

      <!-- Template used to remove the fields as they reoccur -->
      <xsl:template match="*[local-name() = $secondnode]|*[local-name() = $thirdnode]">
            <xsl:choose>
                  <xsl:when test="preceding-sibling::*[1][local-name()=$firstnode] or preceding-sibling::*[1][local-name()=$groupnode]"/>
                  <xsl:when test="preceding-sibling::*[2][local-name()=$firstnode] or preceding-sibling::*[2][local-name()=$groupnode]"/>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <!-- Template used to copy a generic node -->
      <xsl:template match="@*|node()">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
