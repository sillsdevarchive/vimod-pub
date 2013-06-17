<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
    <xsl:param name="sourcetexturi" />
    <xsl:template match="/*">
        <xsl:element name="database">
            <xsl:analyze-string select="unparsed-text($sourcetexturi)" regex="\r\n">
                <!-- split on backslash, add a space to the end of every line so every empty sfm can be found -->
                <xsl:matching-substring />
                <xsl:non-matching-substring>
                    <xsl:call-template name="firstparse">
                        <xsl:with-param name="line" select="." />
                    </xsl:call-template>
                </xsl:non-matching-substring>
            </xsl:analyze-string>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>