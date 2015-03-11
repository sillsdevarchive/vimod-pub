<?xml version="1.0"?>
<!--
    #############################################################
    # Name:  		tsv2mysql-xml.xslt
    # Purpose:		Tab separated variable, converted to MySql xml field format. This has flexibility in keeping names.
    # Part of: 		Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author: 		Ian McQuay <ian_mcquay.org>
    # Created: 		2015-01-14
    # Copyright:		(c) 2015 SIL International
    # Licence:		<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
      <!-- Incorporated this into css-class2attribset.xslt
  -->
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetextpath"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextpath)"/>
      <xsl:template match="/">
            <xsl:choose>
                  <xsl:when test="1=1">
                        <xsl:variable name="csv" select="unparsed-text($sourcetexturi)"/>
                        <xsl:variable name="line" select="tokenize($csv, '\r?\n')"/>
                        <xsl:variable name="elemNames" select="tokenize($line[1],'&#9;')"/>
                        <database name="publications">
                              <xsl:for-each select="$line[position() &gt; 1]">
                                    <!-- for each line -->
                                    <xsl:if test="string-length(.) gt 0">
                                          <table name="publicationlisting">
                                                <xsl:variable name="field" select="tokenize(.,'&#9;')"/>
                                                <xsl:for-each select="$elemNames">
                                                      <!-- for each column based on column name -->
                                                      <xsl:variable name="pos" select="position()"/>
                                                      <xsl:choose>
                                                            <xsl:when test="string-length(.) gt 0 and string-length($field[$pos]) gt 0">
                                                                  <xsl:element name="column">
                                                                        <xsl:attribute name="name">
                                                                              <xsl:value-of select="."/>
                                                                        </xsl:attribute>
                                                                        <xsl:value-of select="$field[$pos]"/>
                                                                  </xsl:element>
                                                                  <!--  end title -->
                                                            </xsl:when>
                                                            <xsl:when test="string-length(.) gt 0">
                                                                  <!-- when there is length in the column title. i.e. there is a title  -->
                                                                  <xsl:element name="column">
                                                                        <xsl:attribute name="name">
                                                                              <xsl:value-of select="."/>
                                                                        </xsl:attribute>
                                                                        <xsl:text>NULL</xsl:text>
                                                                  </xsl:element>
                                                                  <!--  end title -->
                                                            </xsl:when>
                                                            <xsl:otherwise>
										<!-- no title -->
                                                            </xsl:otherwise>
                                                      </xsl:choose>
                                                </xsl:for-each>
                                          </table>
                                    </xsl:if>
                              </xsl:for-each>
                        </database>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>Cannot locate : </xsl:text>
                        <xsl:value-of select="$sourcetexturi"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
