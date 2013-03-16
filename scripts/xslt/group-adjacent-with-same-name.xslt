<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- Added groupname param incase a new name is wanted for the group 2012-11-01-->
      <xsl:output indent="yes"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:param name="groupnode"/>
      <xsl:param name="parentnode"/>
      <xsl:param name="groupname" select="concat($groupnode,'Group')"/>
      <xsl:template match="*[name() =  $parentnode]">
            <xsl:copy>
                  <xsl:for-each-group select="*" group-adjacent="boolean(self::*[name() = $groupnode])">
                        <xsl:choose>
                              <xsl:when test="current-grouping-key()">
                                    <xsl:element name="{$groupname}">
                                          <xsl:apply-templates select="current-group()"/>
                                    </xsl:element >
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:apply-templates select="current-group()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each-group>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
