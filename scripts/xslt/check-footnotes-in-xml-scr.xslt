<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:	Compare caller number to following footnote
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2013/08/22
    # Copyright:    (c) 2013 SIL International
    # Licence:      <LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf-8" />
      <xsl:template match="/">
            <xsl:apply-templates/>
            <xsl:value-of select="'End of all books '"/>
            <xsl:value-of select="concat(' caller=',count(//caller)+1,'   ')"/>
            <xsl:value-of select="concat('   f=',count(//f)+1)"/>
            <xsl:if test="count(//caller) = count(//f)">
                  <xsl:text>  OK</xsl:text>
            </xsl:if>
      </xsl:template>
      <!-- <xsl:template match="caller">
            <xsl:value-of select="concat(name(),'=',count(preceding::caller)+1,'&#10;')"/>
      </xsl:template>
      <xsl:template match="f">
            <xsl:value-of select="concat('   ',name(),'=',count(preceding::f)+1,' - ',substring-before(.,' '),'&#10;')"/>
      </xsl:template> -->
      <xsl:template match="c">
            <xsl:choose>
                  <xsl:when test="count(preceding::f) ne count(preceding::caller)">
                        <xsl:value-of select="concat(name(),'=====',.)"/>
                        <xsl:value-of select="concat('  caller=',count(preceding::caller)+1,'   ')"/>
                        <xsl:value-of select="concat('   f=',count(preceding::f)+1,' - ',substring-before(.,' '),'&#10;')"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <!--<xsl:text>  ok&#10;</xsl:text> -->
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="id">
            
            <xsl:choose>
<xsl:when test="count(preceding::id) = 0">

</xsl:when>
                  <xsl:when test="count(preceding::f) ne count(preceding::caller)"><xsl:value-of select="'End of book '"/>
                        <xsl:value-of select="concat('  caller=',count(preceding::caller)+1,'   ')"/>
                        <xsl:value-of select="concat('   f=',count(preceding::f)+1,' - ',substring-before(.,' '),'&#10;')"/>
                  </xsl:when>
                  <xsl:otherwise><xsl:value-of select="'End of book '"/>
                        <xsl:text>  ok&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="concat(name(),'=========',substring-before(.,' '),'&#10;')"/>
      </xsl:template>
      <xsl:template match="node()">
            <xsl:apply-templates/>
      </xsl:template>
</xsl:stylesheet>
