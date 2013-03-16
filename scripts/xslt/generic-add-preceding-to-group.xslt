<!-- group adjacent $secondnode nodes of the same name under $parentnode name.
	only groups immediately adjacent siblings
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="lxGroup"/>
      <xsl:param name="includenode"/>
      <xsl:param name="groupnode"/>
      <!-- from: http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
This works on merging adjacent cells
 -->
      <!-- Match node the is equal to $parentnode param -->
      <xsl:template match="*[local-name() = $includenode]">
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:choose>
                  <xsl:when test="following-sibling::*[local-name()=$groupnode]"/>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[local-name() = $groupnode]">
            <!-- Recursive template used to match the next sibling if it has the same name -->
            <xsl:copy>
                  <xsl:element name="{$includenode}">
                        <xsl:value-of select="preceding-sibling::*[1][local-name() = $includenode]"/>
                  </xsl:element>
                  <xsl:apply-templates/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="@* | node()">
            <!-- Template used to copy a generic node -->
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
