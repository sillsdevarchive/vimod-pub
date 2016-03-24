<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     .xslt
    # Purpose:	Using RegEx parse JSON text file to output XML
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="jsonfile"/>
      <xsl:param name="dividelinesre" select="'\r\n'"/>
      <xsl:variable name="path2json" select="f:file2uri($jsonfile)"/>
      <xsl:variable name="text" select="unparsed-text($path2json)"/>
<!-- parse the key value pairs -->
      <xsl:variable name="step1" select="replace($text,',?\s*&quot;([^&quot;]+)&quot;\s*:\s*&quot;([^&quot;]*)&quot;\s*','&lt;$1&gt;$2&lt;/$1&gt;')"/>
<!-- parse the key values that have specific values -->
      <xsl:variable name="step2" select="replace($step1,',?\s*&quot;([^&quot;]+)&quot;\s*:\s*(null|true|false|\d+)\s*','&lt;$1&gt;$2&lt;/$1&gt;')"/>
<!-- replace the opening curly brace -->
      <xsl:variable name="step3" select="replace($step2,'^\{\s*','&lt;data&gt;')"/>
<!-- replace the closing curly brace -->
      <xsl:variable name="step4" select="replace($step3,'\s*\}$','&lt;/data&gt;')"/>
<!-- find the named set start -->
      <xsl:variable name="step5" select=" replace($step4,',?\s*&quot;([^&quot;]+)&quot;\s*:\s*\{','&lt;set name=&quot;$1&quot;&gt;')"/>
<!-- find the named array start -->
      <xsl:variable name="step6" select=" replace($step5,',?\s*&quot;([^&quot;]+)&quot;\s*:\s*\[','&lt;array name=&quot;$1&quot;&gt;')"/>
<!-- find the unnamed set ,{start -->
      <xsl:variable name="step7" select=" replace($step6,',?\s*\{','&lt;set&gt;')"/>
<!-- find the unnamed array ,[ start but does not exist -->
      <xsl:variable name="step8" select=" replace($step7,',?\s*\[','&lt;array&gt;')"/>
<!-- replace close set } with closing -->
      <xsl:variable name="step9" select=" replace($step8,'\}','&lt;/set&gt;')"/>
<!-- replace close array ] with closing -->
      <xsl:variable name="step10" select=" replace($step9,'\]','&lt;/array&gt;')"/>
      <xsl:template match="/*">
            <xsl:value-of select="$step10"/>
      </xsl:template>
</xsl:stylesheet>
<!--
     <xsl:template name="repcurly">
            <xsl:param name="string"/>
            <xsl:variable name="newstring" select="replace($string,',\{\s*([^\{\}]+)\s*\}','&lt;$1&gt;$2&lt;/$1&gt;')"/>
            <xsl:choose>
                  <xsl:when test="matches($newstring,'\{')">
                        <xsl:call-template name="repcurly">
                              <xsl:with-param name="string" select="$newstring"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$newstring"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="repsquare">
            <xsl:param name="string"/>
            <xsl:variable name="newstring" select="replace($string,'\[\s*([^\[\]]*)\s*\]','&lt;a&gt;$1&lt;/a&gt;')"/>
            <xsl:choose>
                  <xsl:when test="matches($newstring,'\[')">
                        <xsl:call-template name="repsquare">
                              <xsl:with-param name="string" select="$newstring"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$newstring"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:function name="f:getTokens" as="xs:string+">
            <xsl:param name="str" as="xs:string"/>
            <xsl:analyze-string select="concat($str, ',')" regex='(("[^"]*")+|[^,]*),'>
                  <xsl:matching-substring>
                        <xsl:sequence select='replace(regex-group(1), "^""|""$|("")""", "$1")'/>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:function>

              <xsl:variable name="_step5">
            <xsl:call-template name="repcurly">
                  <xsl:with-param name="string" select="$step4"/>
            </xsl:call-template>
      </xsl:variable>
<xsl:variable name="_step6">
                  <xsl:call-template name="repsquare">
                        <xsl:with-param name="string" select="$step5"/>
                  </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="semiraw3">
                  <xsl:call-template name="parsecomma">
                        <xsl:with-param name="string" select="$semiraw2"/>
                  </xsl:call-template>
            </xsl:variable> 
      <xsl:template name="parsecomma">
            <xsl:param name="string"/>
            <xsl:variable name="part" select="f:gettokens($string)"/>
      </xsl:template> -->
