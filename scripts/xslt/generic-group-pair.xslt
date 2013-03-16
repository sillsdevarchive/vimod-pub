<!-- group adjacent $secondnode nodes of the same name under $parentnode name.
	only groups immediately adjacent siblings
	required $firstnode
	required $secondnode
	optional $groupname default value is $firstnode+Group
	Used to group two fields that always occur together. i.e. \ex and \tr 
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes" />
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:param name="firstnode"/>
      <xsl:param name="secondnode"/>
      <xsl:param name="groupname" select="concat($firstnode,'Group')"/>
      <!-- from: http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
This works on merging adjacent cells
 -->
      <!-- Match node the is equal to $parentnode param -->
      <xsl:template match="*[local-name() = $firstnode]">
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:if test="following-sibling::*[local-name()=$secondnode]">
                  <xsl:element name="{$groupname}">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                        <xsl:apply-templates select="following-sibling::*[1][local-name()=$secondnode]" mode="next"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <!-- Recursive template used to match the next sibling if it has the same name -->
      <xsl:template match="*[local-name() = $secondnode]" mode="next">
            <xsl:copy>
                  <xsl:apply-templates/>
            </xsl:copy>
      </xsl:template>
      <!-- Template used to remove the fields as they reoccur -->
      <xsl:template match="*[local-name() = $secondnode]">
            <xsl:choose>
                  <xsl:when test="preceding-sibling::*[1][local-name()=$firstnode] or preceding-sibling::*[1][local-name()=$groupname]"/>
                  <xsl:otherwise>
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
