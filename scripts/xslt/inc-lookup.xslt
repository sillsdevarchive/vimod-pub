<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	inc-lookup.xslt
    # Purpose:		Used by functions to find a match from a set of data that is passed to it.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Sub-part:	Include template group
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014-05-24
    # Copyright:    	(c) 2014 SIL International
    # Licence:      	<LPGL>
    ################################################################
    # Paired set default format: a=1=XB  b=2=YV		c=3=NN
    # primary separator: space delimited ie \s+
    # secondary separator: = delimited
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="lookup">
            <xsl:param name="string"/>
            <xsl:param name="wholeset"/>
            <xsl:param name="errortext"/>
            <xsl:param name="unmatchedoutput"/>
            <xsl:param name="returnlookuperror" select="'yes'"/>
            <xsl:param name="finditem" select="1"/>
            <xsl:param name="returnitem" select="2"/>
            <xsl:param name="primaryseparator" select="'\s+'"/>
            <xsl:param name="secondaryseparator" select="'='"/>
            <xsl:variable name="wholearray" select="tokenize($wholeset,$primaryseparator)"/>
            <!-- modify set so can find whole string item not just partial-->
            <xsl:variable name="modified-wholeset" select="concat($secondaryseparator,replace($wholeset,$primaryseparator,$secondaryseparator),$secondaryseparator)"/>
            <xsl:variable name="handledstring" select="concat($secondaryseparator,$string,$secondaryseparator)"/>
            <xsl:choose>
                  <!-- make sure the item is in the set of data being searched, if not then return error message in output with string of un matched item -->
                  <xsl:when test="matches($modified-wholeset,$handledstring)">
                        <xsl:for-each select="$wholearray">
                              <!-- loop through the known data to find a match -->
                              <xsl:variable name="subarray" select="tokenize(.,$secondaryseparator)"/>
                              <xsl:if test="$subarray[$finditem] = $string">
                                    <xsl:value-of select="$subarray[$returnitem]"/>
                              </xsl:if>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="$returnlookuperror = $true">
                                    <xsl:value-of select="concat('XXXX-no-',$string,'-not-found-by-',$errortext,'-match-XX')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select="$unmatchedoutput"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
