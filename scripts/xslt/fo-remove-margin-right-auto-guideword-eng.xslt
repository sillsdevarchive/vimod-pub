<?xml version="1.0" encoding="utf-8"?>
<!-- 
    #############################################################
    # Name:         	fo-remove-margin-right-auto-guideword-eng.xslt
    # Purpose:		Need this fix as have not gotten css right to get csstoxslfo marker at all. Same used for Nat and Reg.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay@sil.org>
    # Created:      	2015- -
    # Copyright:    	(c) 2015 SIL International
    # Licence:      	<LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:include href="inc-copy-anything.xslt"/>
      <!-- do not include project.xslt here as only one param needed. -->
      <xsl:param name="trim-guideword-char" select="17"/>
      <xsl:template match="*[@margin-right = 'auto']">
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:attribute name="margin-right">0pt</xsl:attribute>
                  <xsl:apply-templates select="node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="/fo:root/fo:page-sequence/fo:flow/fo:block/fo:block/fo:block/fo:inline[1]/fo:inline[1]">
            <xsl:copy>
                  <fo:marker marker-class-name="guideword">
                        <xsl:value-of select="f:trimlongentry($trim-guideword-char,.)"/>
                  </fo:marker>
                  <xsl:value-of select="."/>
            </xsl:copy>
      </xsl:template>
      <!-- /fo:root/fo:page-sequence/fo:flow/fo:block/fo:block[2]/fo:block/fo:inline/fo:inline -->
      <xsl:function name="f:trimlongentry">
            <xsl:param name="maxlength"/>
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($string,'\(.+\)')">
                        <xsl:value-of select="f:trimlongentry($maxlength,substring-before($string,'('))"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="string-length($string) gt number($maxlength)">
                                    <xsl:variable name="word" select="tokenize($string,' ')"/>
                                    <xsl:choose>
                                          <xsl:when test="string-length(concat($word[1],' ',$word[2])) lt number($maxlength)+1">
                                                <xsl:value-of select="concat($word[1],' ',$word[2])"/>
                                          </xsl:when>
                                          <xsl:when test="string-length($word[1]) lt 18">
                                                <xsl:value-of select="$word[1]"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:text>—</xsl:text>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="$string"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
