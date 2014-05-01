<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
    <xsl:include href="inc-copy-anything.xslt"/>
    <xsl:param name="groupattriblist" select="'P7 J241'"/>
    <xsl:variable name="groupattrib" select="tokenize($groupattriblist,'\s+')"/>
    <xsl:template match="*[matches(@value,$groupattrib[1]) and parent::note]">
        <callee value="{.}"/>
    </xsl:template>
    <xsl:template match="*[string-length(@value)=1 and parent::note and string-length(.)=1]">
        <callee value="{.}"/>
    </xsl:template>
</xsl:stylesheet>
