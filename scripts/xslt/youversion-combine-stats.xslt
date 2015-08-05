<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:   	youversion-combine-stats.xslt
    # Purpose:	Combine CSV a set of files in month folders into a set of XML files. XML files can be opened in Excel to be filtered. The date and country is added to each XML entry.
    # Part of:  	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author: 	Ian McQuay <ian_mcquay@sil.org>
    # Created: 	2015- -
    # Copyright:	 (c) 2015 SIL International
    # Licence: 	<LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" name="xml"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-csv-tokenize.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:param name="months"/>
      <xsl:variable name="month_list">
            <xsl:choose>
                  <xsl:when test="$months = 'current'">
                        <xsl:value-of select="format-date(current-date(),'[Y0001]-[M01]')"/>
                  </xsl:when>
                  <xsl:when test="$months = 'previous'">
                        <xsl:value-of select="format-date(current-date() - xs:dayTimeDuration(concat('P', day-from-date(current-date()), 'D')),'[Y0001]-[M01]')"/>
                  </xsl:when>
                  <xsl:when test="string-length($months) gt 0">
                        <xsl:value-of select="$months"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>2014-01 2014-02 2014-03 2014-04 2014-05 2014-06 2014-07 2014-08 2014-09 2014-10 2014-11 2014-12 2015-01 2015-02 2015-03 2015-04 2015-05 2015-06 2015-07 2015-08 2015-09 2015-10 2015-11 2015-12</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <!--<xsl:param name="basepath" select="'file:///D:/All-SIL-ASA/Statistics/YouVersion'"/> -->
      <xsl:variable name="filename_list" select="'chapter-requests-by-country.csv chapter-requests-by-version.csv offline-by-country.csv offline-by-version.csv offline-downloads-by-user-by-version.csv shared-verses-by-version.csv switches-by-version.csv unique-chapter-requests.csv unique-switches-by-version.csv'"/>
      <xsl:variable name="asialang" select="concat($basepath,'/Languages.txt')"/>
      <xsl:variable name="asiaversion" select="concat($basepath,'/versions.txt')"/>
      <xsl:variable name="langtext" select="unparsed-text($asialang)"/>
      <xsl:variable name="versiontext" select="unparsed-text($asiaversion)"/>
      <xsl:variable name="lang" select="tokenize($langtext, '\r?\n')"/>
      <xsl:variable name="version" select="tokenize($versiontext, '\r?\n')"/>
      <xsl:variable name="month" select="tokenize($month_list, ' ')"/>
      <xsl:variable name="period">
            <xsl:choose>
                  <xsl:when test="$month[1]=$month[last()]">
                        <xsl:value-of select="$month[1]"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat($month[1],'-',$month[last()])"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <xsl:variable name="filename" select="tokenize($filename_list, ' ')"/>
      <!-- The following f:subsetarray subsets a two dimentional array, into a one dimentional array. Returning the field selected in a new array.
		  This is important if the parent is large and used in a lookup. i.e. a 2500 line by 3 field array, 
		   in a regular lookup takes 3.5 min but reduces to less than 30 seconds if subseted first. -->
      <xsl:variable name="findlanguage" select="f:subsetarray($lang,'&#9;',3)"/>
      <xsl:variable name="findiso" select="f:subsetarray($lang,'&#9;',2)"/>
      <xsl:variable name="returncountry" select="f:subsetarray($lang,'&#9;',1)"/>
      <xsl:variable name="findversion" select="f:subsetarray($version,'&#9;',3)"/>
      <xsl:variable name="returnlang" select="f:subsetarray($version,'&#9;',2)"/>
      <xsl:variable name="returncountry2" select="f:subsetarray($version,'&#9;',1)"/>
      <xsl:template match="/*">
            <xsl:for-each select="$filename">
                  <xsl:variable name="name" select="."/>
                  <xsl:variable name="hrefout" select="concat($basepath,'/',$period,'_',.,'.xml')"/>
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
                                                <xsl:variable name="label" select="f:csvTokenize($line[1])"/>
                                                <xsl:for-each select="$line[position() gt 1]">
                                                      <xsl:choose>
                                                            <xsl:when test="string-length(.) gt 1">
                                                                  <xsl:variable name="cell" select="f:csvTokenize(.)"/>
                                                                  <xsl:element name="row">
                                                                        <xsl:attribute name="month">
                                                                              <xsl:value-of select="concat($curmonth,'-01')"/>
                                                                        </xsl:attribute>
                                                                        <xsl:for-each select="$label">
                                                                              <xsl:variable name="pos" select="position()"/>
                                                                              <xsl:if test=". = 'version'">
                                                                                    <xsl:variable name="isocode" select="replace($cell[$pos],'^.+\((...).*\)$','$1')"/>
                                                                                    <xsl:variable name="findpos" select="f:position($findiso,lower-case($isocode))[1]"/>
                                                                                    <xsl:attribute name="iso">
                                                                                          <xsl:value-of select="lower-case($isocode)"/>
                                                                                    </xsl:attribute>
                                                                                    <xsl:attribute name="country">
                                                                                          <xsl:value-of select="$returncountry[number($findpos)]"/>
                                                                                    </xsl:attribute>
                                                                              </xsl:if>
                                                                              <xsl:attribute name="{.}">
                                                                                    <xsl:choose>
                                                                                          <xsl:when test="string-length($cell[$pos]) gt 0">
                                                                                                <xsl:value-of select="$cell[$pos]"/>
                                                                                          </xsl:when>
                                                                                          <xsl:otherwise>
                                                                                                <xsl:text>0</xsl:text>
                                                                                          </xsl:otherwise>
                                                                                    </xsl:choose>
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
            <!--  -->
            <xsl:for-each select="$findlanguage">
                  <xsl:variable name="posf" select="position()"/>
                  <xsl:comment select="$posf"/>
                  <xsl:text> </xsl:text>
                  <xsl:comment select="."/>
                  <xsl:text> </xsl:text>
                  <xsl:comment select="$returncountry[$posf]"/>
                  <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            <!-- -->
      </xsl:template>
</xsl:stylesheet>
