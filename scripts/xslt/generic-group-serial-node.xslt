<!-- Join adjacent nodes of the same name, name selected by $serialnode parameter, separator modifiable by $separator parameter. 
	default separator "; "
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="lxGroup msGroup psGroup glGroup seGroup lsGroup"/>
      <xsl:param name="serialnode"/>
      <!-- from: http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
This works on merging adjacent cells if space is stripped from parent
 -->
      <!-- Match node that is equal to $serialnode param -->
      <xsl:template match="*[name() = $serialnode]">
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:if test="local-name(preceding-sibling::*[1]) != $serialnode">
                  <xsl:element name="{$serialnode}Group">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                        <xsl:apply-templates select="following-sibling::node()[1][local-name()=$serialnode]" mode="next"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <!-- Recursive template used to match the next sibling if it has the same name -->
      <xsl:template match="*" mode="next">
            <xsl:copy>
                  <xsl:apply-templates/>
            </xsl:copy>
            <xsl:apply-templates select="following-sibling::*[1][local-name()=$serialnode]" mode="next"/>
      </xsl:template>
      <!-- Template used to copy a generic node -->
      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
