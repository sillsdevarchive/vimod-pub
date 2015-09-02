<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="xsl f">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="textfile"/>
      <xsl:variable name="sourcetexturi" select="f:file2uri($textfile)"/>
      <xsl:variable name="text" select="unparsed-text($sourcetexturi)"/>
      <xsl:variable name="line" select="tokenize($text,'\r\n')"/>
      <xsl:template match="/">
            <batch>
                  <xsl:for-each select="$line">
                        <xsl:choose>
                              <xsl:when test="matches(.,'^:[a-z]')">
                                    <function>
                                          <xsl:value-of select="."/>
                                    </function>
                              </xsl:when>
                              <xsl:when test="matches(.,'^::')">
                                    <xsl:call-template name="parsecomment">
                                          <xsl:with-param name="text" select="substring-after(.,':: ')"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise/>
                        </xsl:choose>
                  </xsl:for-each>
            </batch>
      </xsl:template>
      <xsl:template name="parsecomment">
            <xsl:param name="text"/>
            <xsl:variable name="label" select="substring-before($text,':')"/>
            <xsl:variable name="labeldata" select="normalize-space(substring-after($text,':'))"/>
            <xsl:choose>
                  <xsl:when test="matches($text,'Title:')">
                        <title name="{$label}">
                              <xsl:value-of select="$labeldata"/>
                        </title>
                  </xsl:when>
                  <xsl:when test="matches($text,':')">
                        <label name="{$label}">
                              <xsl:value-of select="$labeldata"/>
                        </label>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- <listdata> -->
                        <xsl:call-template name="parselistdata">
                              <xsl:with-param name="text" select="$text"/>
                        </xsl:call-template>
                        <!-- </listdata> -->
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="parselistdata">
            <xsl:param name="text"/>
            <xsl:variable name="param" select="substring-before($text,':')"/>
            <xsl:variable name="paramdata" select="normalize-space(substring-after($text,':'))"/>
            <!-- <param> -->
                  <xsl:choose>
                        <xsl:when test="matches($text,' - ')">
                              <value>
                                    <xsl:value-of select="$param"/>
                              </value>
                              <description>
                                    <xsl:value-of select="$paramdata"/>
                              </description>
                        </xsl:when>
                        <xsl:otherwise>
                              <value>
                                    <xsl:value-of select="$text"/>
                              </value>
                        </xsl:otherwise>
                  </xsl:choose>
            <!-- </param> -->
      </xsl:template>
</xsl:stylesheet>
