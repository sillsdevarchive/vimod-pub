<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vpxml-remove-kerning-markup.xslt
    # Purpose:		  remove kerning tags in ventura text files
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
    <xsl:include href="inc-copy-anything.xslt"/>
    <xsl:include href="project-param.xslt"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="tag">
        <xsl:choose>
            <xsl:when test="@value = $kerning">
                <xsl:apply-templates select="node()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
