<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- 
Simple text to XML importer
This imports a text and converts to a flat xml file.

usage:
java  -jar "saxon9.jar"   -o "output.xml" "sfm2xml-simple.xslt" "sfm2xml-simple.xslt" sourcetexturi="file:///path/source.sfm"

Written by Ian McQuay
Part of the Vimod-Pub scripts
Created 2013-03-26

-->
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:param name="sourcetexturi"/>
      <xsl:param name="elementname" select="'p'"/>
      <xsl:param name="preservespace" select="'yes'"/>
      <xsl:template match="/">
            <xsl:element name="database">
                  <xsl:analyze-string select="replace(unparsed-text($sourcetexturi),'&#xD;','')" regex="\n\n">
                        <!-- split on two line Feed character. Windows Carriage returns are removed first -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:choose>
                                    <xsl:when test="$preservespace = 'yes'">
                                          <!-- this is to handle text that should have space preserved  -->
                                          <xsl:element name="{$elementname}">
                                                <!-- create element specified by elementname param, Default is p -->
                                                <xsl:value-of select="."/>
                                          </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:element name="{$elementname}">
                                                <!-- this is to handle text that does not need to preserve space   -->
                                                <xsl:value-of select="normalize-space(.)"/>
                                          </xsl:element>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
