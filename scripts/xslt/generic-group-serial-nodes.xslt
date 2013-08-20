<!-- Part of SILP Dictionary Creator
Group adjacent nodes of the same name, name selected by $spacedlist parameter. 
	default separator "; "

Modified by Ian McQuay 
Created 2012-06-14
Modified 2012-08-21

-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:param name="serialnodelist"/>
      <xsl:variable name="control">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$serialnodelist"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <!-- from: http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
This works on grouping adjacent cells.
 -->
      <!-- Match node that is equal to $serialnode param -->
      <xsl:template match="*[name() = $control/element]">
            <xsl:variable name="serialnode" select="local-name()"/>
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:if test="local-name(preceding-sibling::*[position()=1]) != $serialnode">
                  <xsl:element name="{$serialnode}Group">
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                        <xsl:apply-templates select="following-sibling::*[1][local-name() = $serialnode] " mode="next"/>
                  </xsl:element>
            </xsl:if>
      </xsl:template>
      <!-- Recursive template used to match the next sibling if it has the same name -->
      <xsl:template match="*" mode="next">
            <xsl:variable name="name" select="local-name()"/>
            <xsl:copy>
                  <xsl:apply-templates/>
            </xsl:copy>
            <xsl:apply-templates select="following-sibling::*[1][local-name() = $name]" mode="next"/>
      </xsl:template>
</xsl:stylesheet>
