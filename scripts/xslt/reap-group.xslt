<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href='inc-copy-anything.xslt' />
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:for-each-group select="files4reap" group-by="iso">
                <isoGroup iso="{lower-case(iso)}">
                    <xsl:for-each-group select="current-group()" group-by="handle">
                        <handleGroup handle="{handle}" >

                            <xsl:apply-templates select="current-group()"></xsl:apply-templates>
                        </handleGroup>
                    </xsl:for-each-group>
                </isoGroup>
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
