<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:	join notes
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="inc-copy-anything.xslt"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="noteparatoremovelist"/>
    <xsl:param name="noteparatokeeplist"/>
    <xsl:variable name="noteparatoremove" select="tokenize($noteparatoremovelist,'\s+')"/>
    <xsl:variable name="noteparatokeep" select="tokenize($noteparatokeeplist,'\s+')"/>
    <xsl:template match="para[parent::note][not(@class = $noteparatokeep)]">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="para[@class = $noteparatokeep][parent::note]">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="para[@class = $noteparatoremove][parent::note]">

</xsl:template>
</xsl:stylesheet>
