<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         inc-replace-array.xslt
    # Purpose:		An iterative replace that takes an array of pairs to find and replace.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015-03-04
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:function name="f:replace-array">
            <!-- This function takes a string that needs to have changes made, an array of change pairs, a sequence position 
		of where in the array the replace is to be taken from and a separator that should be used to separate the pair of 
		find and replace items.
		An array could be 'Na=na', 'si=SI', 'David=david' with a separate of '='.
		So the 'Na=na' string is converted into: find = 'Na' and rep = 'na'.
		The array needs to be created first. -->
            <xsl:param name="string"/>
            <xsl:param name="array"/>
            <xsl:param name="seq"/>
            <xsl:param name="separate"/>
            <xsl:variable name="find" select="substring-before($array[$seq],$separate)"/>
            <xsl:variable name="rep" select="substring-after($array[$seq],$separate)"/>
            <xsl:choose>
                  <xsl:when test="matches($array[$seq],'^#')">
                        <xsl:value-of select="f:replace-array($string,$array,$seq +1,$separate)"/>
                  </xsl:when>
                  <xsl:when test="$find = '' ">
                        <!-- tests for blank array, and returns the string -->
                        <xsl:value-of select="$string"/>
                  </xsl:when>
                  <xsl:when test="$seq =count($array)">
                        <!-- if this is the last array item then does the replace and does no more iterations -->
                        <xsl:value-of select="replace($string,$find,$rep)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- if there are more replacements to be made then this will trigger the next replacement -->
                        <xsl:value-of select="f:replace-array(replace($string,$find,$rep),$array,$seq +1,$separate)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
