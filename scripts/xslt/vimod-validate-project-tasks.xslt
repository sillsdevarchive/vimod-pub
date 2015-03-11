<?xml version="1.0" encoding="utf-8"?> <!--
    #############################################################
    # Name:         vimod-validate-project-tasks.xslt   unuseds
    # Purpose:    Compare a task file with a standard.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="inc-file2uri.xslt"/>
<xsl:param name="standardsfile"/>
<xsl:param name="file2evaluate"/>
<xsl:variable name="evaluateline" select="f:file2lines($file2evaluate)"/>
<xsl:variable name="standardline" select="f:file2lines($standardsfile)"/>
<xsl:variable name="name" select="//*:variable/@name"/>
 <xsl:template match="/*">
<xsl:for-each select="evaluateline">
<xsl:choose>
<xsl:when test="matches(.,'^#')"/>
<xsl:when test="matches(.,';var ')">
<xsl:variable name="varname" select="replace(.,'^.+;var ([^\s]+) .+','$1')"/>
<xsl:choose>
<xsl:when test="$varname = $name">
<xsl:value-of select="."/>
<xsl:text>&#10;</xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text># The following line not found in template&#10;</xsl:text>
<xsl:value-of select="."/>
<xsl:text>&#10;</xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:when>

<xsl:otherwise/>
</xsl:choose>
</xsl:for-each>
 </xsl:template>
</xsl:stylesheet>