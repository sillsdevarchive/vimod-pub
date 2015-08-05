<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         SAB-saxml2trs.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:param name="audiofilename"/>
      <xsl:variable name="endtime" select="number(//SegmentData[last()]/@Offset) + number(//SegmentData[last()]/@Duration)"/>
      <xsl:template match="/*">
            <xsl:text>&lt;!DOCTYPE Trans SYSTEM "trans-14.dtd"&gt;</xsl:text>
            <xsl:element name="Trans">
                  <xsl:attribute name="scribe">
                        <xsl:text>worker1</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="audio_filename">
                        <xsl:value-of select="$audiofilename"/>
                  </xsl:attribute>
                  <xsl:attribute name="version">
                        <xsl:text>2</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="version_date">
                        <xsl:value-of select="format-date(current-date(), '[Y01][M01][D01]')"/>
                  </xsl:attribute>
                  <xsl:element name="Episode">
                        <xsl:element name="Section">
                              <xsl:attribute name="type">
                                    <xsl:text>report</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="startTime">
                                    <xsl:text>0</xsl:text>
                              </xsl:attribute>
                              <xsl:attribute name="endTime">
                                    <xsl:value-of select="format-number($endtime,'#.000')"/>
                              </xsl:attribute>
                              <xsl:element name="Turn">
                                    <xsl:attribute name="startTime">
                                          <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="endTime">
                                          <xsl:value-of select="format-number($endtime,'#.000')"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="Segments"/>
                              </xsl:element>
                        </xsl:element>
                  </xsl:element>
            </xsl:element>
      </xsl:template>
      <xsl:template match="Segments">
            <xsl:apply-templates select="SegmentData"/>
      </xsl:template>
      <xsl:template match="SegmentData">
            <xsl:element name="Sync">
                  <xsl:attribute name="time"><!--
<xsl:number value="@Offset" format="1.001"/> -->
                        <xsl:value-of select="format-number(@Offset,'#.000')"/>
                  </xsl:attribute>
            </xsl:element>
<xsl:text>&#10;</xsl:text>
            <xsl:value-of select="Reference"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="Gloss"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
</xsl:stylesheet>
