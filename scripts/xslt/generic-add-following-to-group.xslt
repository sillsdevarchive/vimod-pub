<!-- group adjacent $secondnode nodes of the same name under $parentnode name.
	only groups immediately adjacent siblings
modified to handle attribute copying
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="lxGroup"/>
      <xsl:param name="includenode"/>
      <xsl:param name="groupnode"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <!-- from: http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
This works on merging adjacent cells
 -->
      <xsl:template match="*[local-name() = $groupnode]">
            <xsl:param name="followingsibling" select="following-sibling::*[1]"/>
            <!-- Recursive template used to match the next sibling if it has the same name -->
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
                  <xsl:if test="following-sibling::*[1][local-name() = $includenode]">
                        <xsl:apply-templates select="following-sibling::*[1]" mode="next"/>
                  </xsl:if>
            </xsl:copy>
      </xsl:template>
      <!-- Match node the is equal to $parentnode param -->
      <xsl:template match="*[local-name() = $includenode]" mode="next">
            <!-- modified match to accept parameters -->
            <!-- this follows the group node -->
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="*[local-name() = $includenode]">
            <!-- this node tests if the preceding node is a group node. if not then it copies the node -->
            <xsl:if test="preceding-sibling::*[1][local-name() != $groupnode]">
                  <xsl:copy>
                        <xsl:apply-templates select="@*|node()"/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
</xsl:stylesheet>
