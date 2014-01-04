<!--
    #############################################################
    # Name:   	sfm2xml-dict3.xslt
    # Purpose:	parses a sfm dictionary file with tables and outputs a flat xml.
    # Note:		It is designed to handle \tb as a line and space delimited table. The \tb marker is a param so it could be applied to another field.
    # Part of:      	sfmdic2web - http://projects.palaso.org/projects/sfmdic2web
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2012-08-14
    # Modified:      2013-12-31
    # Copyright: 	(c) 2013 SIL International
    # Licence:       <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetext"/>
      <xsl:param name="tablemarker" select="'tb'"/>
      <xsl:param name="rootnode" select="'data'"/>
      <xsl:param name="illegal" select="'_-+=!@#$%^&amp;'"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetext)"/>
      <xsl:template match="/">
            <xsl:element name="{$rootnode}">
                  <xsl:analyze-string select="replace(unparsed-text($sourcetexturi),'(\r)',' $1')" regex="\n\\">
                        <!-- split on backslash, add a space to the end of every line so every empty sfm can be found -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:choose>
                                    <xsl:when test="string-length(substring-before(.,' ')) = 0"/>
                                    <!-- remove zero length lines -->
                                    <xsl:when test="substring-before(.,' ') = '\_sh'"/>
                                    <!-- remove shoebox header -->
                                    <xsl:when test="substring-before(.,' ') = 'id'"/>
                                    <!-- remove id field -->
                                    <xsl:when test="substring-before(.,' ') = '_DateStampHasFourDigitYear'"/>
                                    <!-- remove date year info -->
                                    <xsl:when test="substring-before(.,' ') = '_no'"/>
                                    <!-- remove _no field -->
                                    <xsl:when test="substring-before(.,' ') = $tablemarker">
                                          <!-- There is a table in the sfm input file, so pass that for parsing into its parts -->
                                          <xsl:element name="{substring-before(.,' ')}">
                                                <xsl:call-template name="table">
                                                      <xsl:with-param name="string" select="substring-after(.,' ')"/>
                                                </xsl:call-template>
                                          </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:element name="{substring-before(.,' ')}">
                                                <!-- create element with sfm as element name -->
                                                <xsl:value-of select="normalize-space(substring-after(.,' '))"/>
                                          </xsl:element>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </xsl:element>
      </xsl:template>
      <xsl:template name="table">
            <!-- There is a table in the sfm input file -->
            <xsl:param name="string"/>
            <xsl:variable name="tableline" select="tokenize($string,'\r\n')"/>
            <!-- split the whole table into lines -->
            <xsl:for-each select="$tableline">
                  <!-- now process each line -->
                  <xsl:choose>
                        <xsl:when test="position() = 1"/>
                        <!-- position 1 only has line numbers but no usable data so discard -->
                        <xsl:when test="position() = 2">
                              <!-- position 2 contains the  title of the table if present -->
                              <xsl:if test="string-length(normalize-space(.)) > 0">
                                    <!-- test to see there is content -->
                                    <xsl:element name="tabletitle">
                                          <xsl:value-of select="normalize-space(replace(.,'\|[bi](.+)\|r','$1'))"/>
                                          <!-- just keep the title part of the line not the bar codes or surrounding space-->
                                    </xsl:element>
                              </xsl:if>
                        </xsl:when>
                        <xsl:when test="position() = 3">
                              <!-- position 3 contains the  subtitle of the table if present -->
                              <xsl:if test="string-length(normalize-space(.)) > 0">
                                    <!-- keep the subtitle if it is present-->
                                    <xsl:element name="tablesubtitle">
                                          <xsl:value-of select="."/>
                                    </xsl:element>
                              </xsl:if>
                        </xsl:when>
                        <xsl:when test="position() = 4">
                              <!-- position 4 if present are thecolumn headers that need splitting into cells -->
                              <xsl:if test="string-length(normalize-space(.)) > 0">
                                    <!-- keep the column labels if present -->
                                    <xsl:element name="headrow">
                                          <xsl:call-template name="parseline">
                                                <xsl:with-param name="line" select="."/>
                                          </xsl:call-template>
                                    </xsl:element>
                              </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                              <!-- positions 5 and above are the actual table data that need splitting into cells -->
                              <xsl:if test="string-length(normalize-space(.)) > 0">
                                    <!-- parse and write out each cell in the table line by line -->
                                    <xsl:element name="trow">
                                          <xsl:call-template name="parseline">
                                                <xsl:with-param name="line" select="."/>
                                          </xsl:call-template>
                                    </xsl:element>
                              </xsl:if>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="parseline">
            <xsl:param name="line"/>
            <xsl:variable name="cell" select="tokenize(replace($line,'^\s+',''),'\s\s+')"/>
            <!-- parse into cells split by at least 2 white space elements (n this case not CR or LF as these are already removed)  -->
            <xsl:for-each select="$cell">
                  <xsl:variable name="celpos" select="position()"/>
                  <xsl:if test="string-length(.) > 0"><!-- test if there is content for the cell -->
                        <xsl:element name="{concat('c',$celpos)}">
                              <!-- create element with sfm as element name -->
                              <xsl:value-of select="."/>
                        </xsl:element>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
