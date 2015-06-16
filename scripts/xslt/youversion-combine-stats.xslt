<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:variable name="month_list" select="'2014-01 2014-02 2014-03 2014-04 2014-05 2014-06 2014-07 2014-08 2014-09 2014-10 2014-11 2014-12 2015-01 2015-02 2015-03 2015-04 2015-05 2015-06 2015-07 2015-08 2015-09 2015-10 2015-11 2015-12'"/>
      <xsl:variable name="filename_list" select="'chapter-requests-by-country.csv chapter-requests-by-version.csv offline-by-country.csv offline-by-version.csv offline-downloads-by-user-by-version.csv shared-verses-by-version.csv switches-by-version.csv unique-chapter-requests.csv unique-switches-by-version.csv'"/>
      <xsl:variable name="basepath" select="'file:///D:/All-SIL-ASA/Statistics/YouVersion'"/>
      <xsl:variable name="month" select="tokenize($month_list, ' ')"/>
      <xsl:variable name="filename" select="tokenize($filename_list, ' ')"/>
      <xsl:template match="/*">
            <xsl:for-each select="$filename">
                  <xsl:variable name="name" select="."/>
                  <xsl:variable name="hrefout" select="concat($basepath,'/',.,'.xml')"/>
                  <xsl:text>&#10;</xsl:text>
                  <xsl:comment select="."/>
                  <xsl:result-document href="{$hrefout}" format="xml">
                        <xsl:element name="data">
                              <xsl:for-each select="$month">
                                    <xsl:variable name="curmonth" select="."/>
                                    <xsl:variable name="href" select="concat($basepath,'/',$curmonth,'/',$name)"/>
                                    <xsl:choose>
                                          <xsl:when test="unparsed-text-available($href)">
                                                <xsl:variable name="text" select="unparsed-text($href)"/>
                                                <xsl:variable name="line" select="tokenize($text,'\r?\n')"/>
                                                <xsl:variable name="label" select="tokenize($line[1],',')"/>
                                                <xsl:for-each select="$line[position() gt 1]">
                                                      <xsl:choose>
                                                            <xsl:when test="string-length(.) gt 1">
                                                                  <xsl:variable name="cell" select="tokenize(.,',')"/>
                                                                  <xsl:element name="row">
                                                                        <xsl:attribute name="month">
                                                                              <xsl:value-of select="$curmonth"/>
                                                                        </xsl:attribute>
                                                                        <xsl:for-each select="$label">
                                                                              <xsl:variable name="pos" select="position()"/>
                                                                              <xsl:attribute name="{.}">
                                                                                    <xsl:value-of select="$cell[$pos]"/>
                                                                              </xsl:attribute>
                                                                        </xsl:for-each>
                                                                  </xsl:element>
                                                            </xsl:when>
                                                            <xsl:otherwise/>
                                                      </xsl:choose>
                                                </xsl:for-each>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:text>&#10;</xsl:text>
                                                <xsl:comment select="concat('no ',$curmonth)"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:for-each>
                        </xsl:element>
                  </xsl:result-document>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
