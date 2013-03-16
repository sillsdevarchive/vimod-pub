<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xs:xs="" exclude-result-prefixes="xs" version="2.0">
      <xsl:output method="xhtml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" xmlns="http://www.w3.org/1999/xhtml" name="xhtml" use-character-maps="silp"/>
      <xsl:param name="index"/>
      <xsl:param name="path"/>
      <xsl:param name="splitelement"/>
      <xsl:param name="appbuild"/>
      <xsl:param name="target"/>
      <xsl:param name="framehost"/>
      <xsl:param name="posturl" select="'.html'"/>
      <xsl:include href='inc-dict-sense-hom.xslt'/>
      <xsl:include href='inc-char-map-silp.xslt'/>
      <xsl:template match="/*">
            <xsl:for-each select="*[name() = $splitelement]">
                  <xsl:variable name="filename" select="concat($path,'/',$index,format-number(position(),'00'),$posturl)"/>
                  <xsl:variable name="lxno" select="position()"/>
                  <xsl:value-of select="$filename"/>
                  <xsl:text>
</xsl:text>
                  <xsl:result-document href="{$filename}" format="xhtml">
                        <xsl:call-template name="html_index"/>
                  </xsl:result-document>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="html_index">
            <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
                  <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                        <meta name="generator" content="SILP-dict-generator"/>
                        <title>Index</title>
                        <link rel="stylesheet" href="../common/silpdict.css" type="text/css"/>
                  </head>
                  <body>
                        <div id="{concat($index,'-index')}" class="alphalinks">
                              <xsl:if test="$appbuild = 'on'">
                                    <xsl:for-each select="/*/alpha">
                                          <xsl:call-template name="writealpha"/>
                                    </xsl:for-each>
                              </xsl:if>
                        </div>
                        <div class="index">
                              <xsl:apply-templates select="record"/>
                        </div>
                        <div id="{concat($index,'-index2')}" class="alphalinks">
                              <xsl:if test="$appbuild = 'on'">
                                    <xsl:for-each select="/*/alpha">
                                          <xsl:call-template name="writealpha"/>
                                    </xsl:for-each>
                              </xsl:if>
                        </div>
                        <xsl:if test="$appbuild = 'on'">
                              <script src="scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
                              <script src="scripts/jquery.mobile-1.2.0.min.js" type="text/javascript"></script>
                              <script language="JavaScript1.1" src="common/lx.js" charset="UTF-8"></script>
                              <script language="JavaScript1.1" src="../common/index.js" charset="UTF-8"></script>
                        </xsl:if>
                  </body>
            </html>
      </xsl:template>
      <xsl:template match="record">
            <xsl:choose>
                  <xsl:when test="string-to-codepoints(@key) lt 58 and string-to-codepoints(@key) gt 47">
			<!-- dumps non alphabetical characters -->
		</xsl:when>
                  <xsl:when test="ie = lx">
                        <xsl:call-template name="hyperlinktarget">
                              <xsl:with-param name="visible" select="lx"/>
                              <xsl:with-param name="linkurl">
                                    <xsl:text>../lexicon/lx</xsl:text>
                                    <xsl:number value="counter" format="00001"/>
                                    <xsl:text>.html</xsl:text>
                              </xsl:with-param>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="div">
                              <xsl:call-template name="hom">
                                    <xsl:with-param name="string" select="ie"/>
                              </xsl:call-template>
                              <span class="label">
                                    <xsl:text> see </xsl:text>
                              </span>
                              <xsl:call-template name="hyperlinktarget">
                                    <xsl:with-param name="visible" select="lx"/>
                                    <xsl:with-param name="linkurl">
                                          <xsl:text>../lexicon/lx</xsl:text>
                                          <xsl:number value="counter" format="00001"/>
                                          <xsl:text>.html</xsl:text>
                                    </xsl:with-param>
                              </xsl:call-template>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="hyperlinktarget">
            <xsl:param name="visible"/>
            <xsl:param name="linkurl"/>
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:if test="$appbuild = 'on'">
                              <xsl:text>javascript:browse('</xsl:text>
                        </xsl:if>
                        <xsl:value-of select="$linkurl"/>
                        <xsl:if test="$appbuild = 'on'">
                              <!--  <xsl:text>','</xsl:text>
                              <xsl:value-of select="$target"/>
                              <xsl:text>','</xsl:text>
                              <xsl:value-of select="$framehost"/> -->
                              <xsl:text>')</xsl:text>
                        </xsl:if>
                  </xsl:attribute>
                  <xsl:if test="$appbuild ne 'on'">
                        <xsl:attribute name="target">
                              <xsl:value-of select="$target"/>
                        </xsl:attribute>
                  </xsl:if>
                  <xsl:call-template name="hom">
                        <xsl:with-param name="string" select="$visible"/>
                  </xsl:call-template>
            </xsl:element>
      </xsl:template>
      <xsl:template name="writealpha">
            <xsl:element name="a">
                  <xsl:attribute name="href">
                        <xsl:text>../index/</xsl:text>
                        <xsl:value-of select="$index"/>
                        <xsl:number value="position()" format="01"/>
                        <xsl:text>.html</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="@*"/>
            </xsl:element>
            <xsl:text> </xsl:text>
      </xsl:template>
</xsl:stylesheet>
