<!--
    #############################################################
    # Name:         .xslt
    # Purpose:	adds preceding adjacent node to group if that node exists.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Concept from:  http://stackoverflow.com/questions/1806123/merging-adjacent-nodes-of-same-type-xslt-1-0
    # Modified:      2012/08/01
    #  			2013/09/17 added condition for creating added pre field
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:strip-space elements="lxGroup"/>
      <xsl:param name="includenode"/>
      <xsl:param name="groupnode"/>
      <xsl:template match="*[local-name() = $includenode]">
            <!-- modified match to accept parameters -->
            <!-- Is this the first element in a sequence? -->
            <xsl:choose>
                  <xsl:when test="following-sibling::*[1][local-name()=$groupnode]"/>
                  <!-- This is the first element in a sequence of includenode followed by groupnode so is not copied here -->
                  <xsl:otherwise>
                        <!-- This is includenode is not followed by a groupnode so it is copied -->
                        <xsl:copy>
                              <xsl:apply-templates/>
                        </xsl:copy>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="*[local-name() = $groupnode]">
            <!-- Recursive template used to match the next sibling if it has the same name -->
            <xsl:copy>
                  <xsl:if test="preceding-sibling::*[1][local-name() = $includenode]">
                        <!-- Test if a includenode preceeds this parentnode, if it does it is included, if not nothing is added inside the parentnode -->
                        <xsl:element name="{$includenode}">
                              <xsl:value-of select="preceding-sibling::*[1][local-name() = $includenode]"/>
                        </xsl:element>
                  </xsl:if>
                  <xsl:apply-templates/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
