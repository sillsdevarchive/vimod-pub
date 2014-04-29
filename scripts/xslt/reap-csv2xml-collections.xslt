<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes" use-character-maps="silp"/>
      <xsl:character-map name="silp">
            <xsl:output-character character="&#161;" string='&#13;&#10;'/>
      </xsl:character-map>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetextfile"/>
      <xsl:param name="group" select="'metadata-local'"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($sourcetextfile)"/>
      <xsl:variable name="csv1" select="unparsed-text($sourcetexturi)"/>
      <xsl:template match="/">
            <database>
                  <xsl:call-template name="parsecsv">
                        <xsl:with-param name="csv" select="$csv1"/>
                  </xsl:call-template>
            </database>
      </xsl:template>
      <xsl:template name="parsecsv">
            <xsl:param name="csv"/>
            <xsl:variable name="data0" select="substring-after($csv,'&#10;')"/>
            <!-- remove cr Lf combo and keep only cr to be different to line ends -->
            <!-- <xsl:variable name="data00" select="replace($data0,'&#13;&#10;','&#182;')"/> -->
            <!--  insert quote marks and null as place holder -->
            <xsl:variable name="data1" select="replace($data0,',,',',&#34;null&#34;,')"/>
            <!-- insert quote marks and null to as place holder again to be sure -->
            <xsl:variable name="data2" select="replace($data1,',,',',&#34;null&#34;,')"/>
            <!-- hold end of line place if possible find ,LF at end of line and make it ,"null"LF -->
            <xsl:variable name="data3" select="replace($data2,',&#10;',',&#34;null&#34;&#10;')"/>
            <!-- remove quote at beginning of the whole string -->
            <xsl:variable name="data4" select="replace($data3,'^&#34;','')"/>
            <!-- add eng into empty []  -->
            <xsl:variable name="data5" select="replace($data4,'\[\]','[eng]')"/>
            <!-- now remove last double quote and LF character -->
            <xsl:variable name="data" select="replace($data4,'&#34;&#10;$','')"/>
            <!-- remove token placed by cct with another token d161 that can be converted back to CR LF by character-map translation -->
            <xsl:variable name="data-no" select="replace($data4,'\\n ','&#161;')"/>
            <!-- get the first line containing labels-->
            <xsl:variable name="labels" select="substring-before($csv,'&#10;')"/>
            <!-- breakup labels by commas -->
            <xsl:variable name="label" select="tokenize($labels,',')"/>
            <!-- get the data after the first line -->
            <xsl:analyze-string select="$data" regex="&#34;&#10;&#34;">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:variable name="reapid" select="substring-before(.,'&#34;,&#34;')"/>
                        <xsl:analyze-string select="." regex="&#34;,&#34;">
                              <xsl:matching-substring/>
                              <xsl:non-matching-substring>
                                    <xsl:variable name="pos" select="(position()+1) div 2"/>
                                    <xsl:variable name="labelpart" select="tokenize($label[$pos],'\[')"/>
                                    <xsl:variable name="shortlabel" select="$labelpart[1]"/>
                                    <xsl:variable name="prelang" select="substring($labelpart[2],1,3)"/>
                                    <xsl:variable name="lang">
                                          <xsl:choose>
                                                <xsl:when test="string-length($prelang) = 3">
                                                      <xsl:value-of select="$prelang"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                      <xsl:text>eng</xsl:text>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:variable>
                                    <xsl:choose>
                                          <xsl:when test=". = 'null'"/>
                                          <xsl:when test="matches(.,'||')">
                                                <xsl:analyze-string select="." regex="\|\|">
                                                      <xsl:non-matching-substring>
                                                            <xsl:call-template name="fields">
                                                                  <xsl:with-param name="reapid" select="$reapid"/>
                                                                  <xsl:with-param name="label" select="$shortlabel"/>
                                                                  <xsl:with-param name="lang" select="$lang"/>
                                                                  <xsl:with-param name="data" select="."/>
                                                            </xsl:call-template>
                                                      </xsl:non-matching-substring>
                                                </xsl:analyze-string>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:call-template name="fields">
                                                      <xsl:with-param name="reapid" select="$reapid"/>
                                                      <xsl:with-param name="label" select="$shortlabel"/>
                                                      <xsl:with-param name="lang" select="$lang"/>
                                                      <xsl:with-param name="data" select="."/>
                                                </xsl:call-template>
                                                <xsl:element name="{$group}">
                                                      <reapid>
                                                            <xsl:value-of select="$reapid"/>
                                                      </reapid>
                                                      <label>
                                                            <xsl:value-of select="$label[$pos]"/>
                                                      </label>
                                                      <xsl:element name="data">
                                                            <xsl:value-of select="."/>
                                                      </xsl:element>
                                                </xsl:element>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:non-matching-substring>
                        </xsl:analyze-string>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="fields">
            <xsl:param name="reapid"/>
            <xsl:param name="lang"/>
            <xsl:param name="label"/>
            <xsl:param name="data"/>
            <xsl:element name="{$group}">
                  <reapid>
                        <xsl:value-of select="$reapid"/>
                  </reapid>
                  <label>
                        <xsl:value-of select="$label"/>
                  </label>
                  <xsl:if test="string-length($lang) > 0">
                        <iso>
                              <xsl:value-of select="$lang"/>
                        </iso>
                  </xsl:if>
                  <xsl:element name="data">
                        <xsl:value-of select="$data"/>
                  </xsl:element>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
