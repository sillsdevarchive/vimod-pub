<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	epub-4usfm-group-note-sets.xslt
    # Purpose:	Groups note nodes so they come out as individual records rather than as two serial notes.
    # Subproject:	epub2usfm to convert InDesign generated epub back into USFM
    # Part of:  	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author: 	Ian McQuay <ian_mcquay.org>
    # Created: 	2014-03-18
    # modified:	2014-03-19
    # Copyright:    (c) 2014 SIL International
    # Licence:  	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:include href="inc-copy-anything.xslt"/>
    <xsl:param name="parentnode" select="'note'"/>
       <!--<xsl:param name="groupnode"/>  -->
    <xsl:param name="groupattriblist" select="'P7 J241'"/>
    <xsl:variable name="groupattrib" select="tokenize($groupattriblist,'\s+')"/>
    <xsl:template match="*[name() = $parentnode]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each-group select="*" group-starting-with="*[matches(@class,$groupattrib[1]) and matches(@class,$groupattrib[2])]">
                <xsl:element name="{local-name()}Group">
                    <xsl:apply-templates select="current-group()"/>
                </xsl:element>
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
