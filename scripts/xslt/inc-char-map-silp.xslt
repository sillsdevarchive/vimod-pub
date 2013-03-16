<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:character-map name="silp">
            <xsl:output-character character="æ" string='ae'/>
            <xsl:output-character character="ŋ" string='ng'/>
            <xsl:output-character character="ˈ" string="&#39;"/>
            <xsl:output-character character="'" string="&#39;"/>
<xsl:output-character character="#" string="&amp;nbsp;"/>
      </xsl:character-map>
</xsl:stylesheet>
