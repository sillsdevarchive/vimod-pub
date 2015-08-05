<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs f">
      <xsl:function name="f:csvTokenize" as="xs:string+">
            <!-- 
            From: http://andrewjwelch.com/code/xslt/csv/csv-to-xml_v2.html
            Modifications by: Ian McQuay 2014-12-22
            1: changed the function name space to conform to my function namespace
		2: changed the function name from getTokens to csvTokenize
		s-->
            <xsl:param name="str" as="xs:string"/>
            <xsl:analyze-string select="concat($str, ',')" regex='(("[^"]*")+|[^,]*),'>
                  <xsl:matching-substring>
                        <xsl:sequence select='replace(regex-group(1), "^""|""$|("")""", "$1")'/>
                  </xsl:matching-substring>
            </xsl:analyze-string>
      </xsl:function>
</xsl:stylesheet>
