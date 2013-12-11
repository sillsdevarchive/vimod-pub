<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:param name="textfile"/>
      <xsl:param name="css" select="'reimb.css'"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:variable name="textfileuri" select="f:file2uri($textfile)"/>
      <xsl:variable name="alldata" select="unparsed-text($textfileuri)"/>
      <xsl:variable name="data" select="tokenize($alldata,'-\n')[2]"/>
      <xsl:variable name="dataline" select="tokenize($data,'\n')"/>
      <xsl:variable name="line" select="tokenize($alldata,'\n')"/>
      <xsl:variable name="fieldlength" select="tokenize($line[2],' ')"/>
      <xsl:template match="/">
            <html>
                  <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                        <link rel="stylesheet" href="{$css}" type="text/css"/>
                  </head>
                  <body>
                        <p>Mila</p>
                        <p>Here is my expenses for the ... for reimbursement to the Ian &amp; Sue McQuay MetroBank account</p>
                        <table>
                              <tr>
                                    <xsl:call-template name="trimstring">
                                          <xsl:with-param name="curline" select="$line[1]"/>
                                          <xsl:with-param name="tag" select="'th'"/>
                                          <xsl:with-param name="length" select="string-length($fieldlength[1])+1"/>
                                          <xsl:with-param name="curpos" select="1"/>
                                    </xsl:call-template>
                              </tr>
                              <xsl:for-each select="$dataline">
                                    <xsl:variable name="curline" select="."/>
                                    <xsl:if test="string-length($curline) gt 0">
                                          <tr>
                                                <xsl:call-template name="trimstring">
                                                      <xsl:with-param name="curline" select="$curline"/>
                                                      <xsl:with-param name="tag" select="'td'"/>
                                                      <xsl:with-param name="length" select="string-length($fieldlength[1])+1"/>
                                                      <xsl:with-param name="curpos" select="1"/>
                                                </xsl:call-template>
                                          </tr>
                                    </xsl:if>
                              </xsl:for-each>
                        </table>
                        <h3>Total amount: PHP</h3>
                  </body>
            </html>
      </xsl:template>
      <xsl:template name="trimstring">
            <xsl:param name="curline"/>
            <xsl:param name="tag"/>
            <xsl:param name="length"/>
            <xsl:param name="curpos"/>
            <xsl:call-template name="field">
                  <xsl:with-param name="field" select="substring($curline,1,$length)"/>
                  <xsl:with-param name="tag" select="$tag"/>
            </xsl:call-template>
            <xsl:if test="string-length(substring($curline,$length+1)) gt 0">
                  <xsl:call-template name="trimstring">
                        <xsl:with-param name="tag" select="$tag"/>
                        <xsl:with-param name="curline" select="substring($curline,$length+1)"/>
                        <xsl:with-param name="length" select="string-length($fieldlength[$curpos+1])+1"/>
                        <xsl:with-param name="curpos" select="$curpos+1"/>
                  </xsl:call-template>
            </xsl:if>
      </xsl:template>
      <xsl:template name="field">
            <xsl:param name="field"/>
            <xsl:param name="tag"/>
            <xsl:element name="{$tag}">
                  <xsl:value-of select="normalize-space($field)"/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
