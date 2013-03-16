<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!-- Part of the SILP Dictionary Creator
This imports a sfm dictionary and converts to a flat xml file.
It is designed to handle \tb as a line and space delimited table. The \tb marker is a param so it could be applied to another field.
Written by Ian McQuay
Created 2012-08-14

Changed table cells to have different names. So instead of td they are c1 c2 c3 etc

-->
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
      <xsl:param name="sourcetexturi"/>
      <xsl:param name="tablemarker" select="'tb'"/>
      <xsl:template match="/">
            <xsl:element name="database">
                  <xsl:analyze-string select="replace(unparsed-text($sourcetexturi),'(\r)',' $1')" regex="\\">
                        <!-- split on backslash, add a space to the end of every line so every empty sfm can be found -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:choose>
                                    <xsl:when test="string-length(substring-before(.,' ')) = 0"/>
                                    <!-- remove zero length lines -->
                                    <xsl:when test="substring-before(.,' ') = '_sh'"/>
                                    <!-- remove shoebox header -->
                                    <xsl:when test="substring-before(.,' ') = 'id'"/>
                                    <!-- remove id field -->
                                    <xsl:when test="substring-before(.,' ') = '_DateStampHasFourDigitYear'"/>
                                    <!-- remove date year info -->
                                    <xsl:when test="substring-before(.,' ') = '_no'"/>
                                    <!-- remove _no field -->
                                    <xsl:otherwise>
                                          <xsl:element name="{substring-before(.,' ')}">
                                                <!-- create element with sfm as element name -->
                                                <xsl:choose>
                                                      <xsl:when test="substring-before(.,' ') = $tablemarker">
                                                            <!-- There is a table in the sfm input file -->
                                                            <xsl:analyze-string select="substring-after(.,' ')" regex="\r\n">
                                                                  <!-- split table by lines -->
                                                                  <xsl:matching-substring/>
                                                                  <xsl:non-matching-substring>
                                                                        <xsl:choose>
                                                                              <xsl:when test=". = ' '"/>
                                                                              <xsl:when test="matches(.,'\|b(.+)\|r')">
                                                                                    <!-- find the bolded title of the table -->
                                                                                    <xsl:element name="tabletitle">
                                                                                          <xsl:value-of select="normalize-space(replace(.,'\|b(.+)\|r','$1'))"/>
                                                                                          <!-- just keep the title part of the line not the bar codes or surrounding space-->
                                                                                    </xsl:element>
                                                                              </xsl:when>
                                                                              <xsl:when test="matches(.,'^\s\s\s\s+.+')">
                                                                                    <!-- find the bolded title of the table -->
                                                                                    <xsl:element name="tablesubtitle">
                                                                                          <xsl:value-of select="normalize-space(.)"/>
                                                                                          <!-- just keep the title part of the line not the bar codes or surrounding space-->
                                                                                    </xsl:element>
                                                                              </xsl:when>
                                                                              <xsl:when test="string-length(.) &lt; 4"/>
                                                                              <!-- get rid of short lnes -->
                                                                              <xsl:otherwise>
                                                                                    <xsl:element name="trow">
                                                                                          <!-- create a table row -->
                                                                                          <xsl:analyze-string select="." regex="\s{{2,}}">
                                                                                                <!-- split the lines separated by 2 or more space elements -->
                                                                                                <xsl:matching-substring/>
                                                                                                <xsl:non-matching-substring>
                                                                                                      <xsl:element name="c{(position() + 1) div 2}">
                                                                                                            <!-- Output all data elements -->
                                                                                                            <xsl:value-of select="normalize-space(.)"/>
                                                                                                      </xsl:element>
                                                                                                </xsl:non-matching-substring>
                                                                                          </xsl:analyze-string>
                                                                                    </xsl:element>
                                                                              </xsl:otherwise>
                                                                        </xsl:choose>
                                                                  </xsl:non-matching-substring>
                                                            </xsl:analyze-string>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <!-- Output data folowing space after sfm marker -->
                                                            <xsl:value-of select="normalize-space(substring-after(.,' '))"/>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                          </xsl:element>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
