<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	vmxml-include-sec-in-chap.xslt
    # Purpose:	This will move section and ref preceding chapters to after chapters.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # subproject:	vpxml -roundtripping Ventura Publisher tagged text to USFM
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="project.xslt"/>
    <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="vp2xml-tags.xslt"/>
    <xsl:template match="para[@class =  $c]">
        <xsl:choose>
            <xsl:when test="preceding-sibling::para[1]/@class = $r"/>
            <xsl:when test="preceding-sibling::para[1]/@class = $s"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:attribute name="class">
                        <xsl:value-of select="@class"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="para[@class = $s]">
        <xsl:choose>
            <xsl:when test="following-sibling::para[1][@class = $c]">
                <xsl:copy-of select="following-sibling::para[1]"/>
                <xsl:copy>
                    <xsl:attribute name="class">
                        <xsl:value-of select="@class"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:when test="following-sibling::para[2][@class = $c]">
                <xsl:copy-of select="following-sibling::para[2]"/>
                <xsl:copy>
                    <xsl:attribute name="class">
                        <xsl:value-of select="@class"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:attribute name="class">
                        <xsl:value-of select="@class"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
