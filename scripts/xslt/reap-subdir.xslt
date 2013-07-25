<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href='inc-copy-anything.xslt' />
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <xsl:apply-templates select="node()" />
    </xsl:template>
    <xsl:template match="handleGroup">
        <xsl:element name="{local-name()}">
        <xsl:apply-templates select="@*" />
            <xsl:attribute name="subdir">
                <xsl:number value="count(current()/preceding::handleGroup) +1 - count(preceding::isoGroup/handleGroup)" format="000" />
            </xsl:attribute>
            <xsl:apply-templates select="node()" />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>