<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text"/>
      <xsl:param name="projectpath" select="'D:\All-SIL-Publishing\vimod-pub\resourcess\pspad'"/>
      <xsl:param name="basemacros" select="'pspad-base-macros.txt'"/>
      <xsl:param name="baseclips" select="'pspad-base-clips.txt'"/>
      <xsl:param name="xsltlist" select="'xsltfiles.txt'"/>
      <xsl:param name="option" select="'b'"/>
      <xsl:param name="includedoc"/>
      <xsl:variable name="basemacrosfile" select="concat($projectpath,'\',$basemacros)"/>
      <xsl:variable name="baseclipsfile" select="concat($projectpath,'\',$baseclips)"/>
      <xsl:variable name="xsltlistfile" select="concat('scripts\xslt\',$xsltlist)"/>
      <xsl:variable name="xsltlisturi" select="f:file2uri($xsltlistfile)"/>
      <xsl:variable name="basemacrosuri" select="f:file2uri($basemacrosfile)"/>
      <xsl:variable name="baseclipsuri" select="f:file2uri($baseclipsfile)"/>
      <xsl:variable name="xsltfile" select="tokenize(unparsed-text($xsltlisturi),'\s+')"/>
      <xsl:variable name="basemacrostext" select="unparsed-text($basemacrosuri)"/>
      <xsl:variable name="baseclipstext" select="unparsed-text($baseclipsuri)"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:template match="/">
            <xsl:value-of select="$basemacrostext" disable-output-escaping="yes"/>
            <xsl:if test="$option = 'a'">
                  <xsl:for-each select="$xsltfile">
                        <xsl:variable name="name" select="replace(.,'.xslt','')"/>
                        <xsl:variable name="seqno" select="position()"/>
                        <xsl:variable name="xslt" select="doc(.)"/>
                        <xsl:apply-templates select="$xslt/*/xsl:param" mode="macro">
                              <xsl:with-param name="seqno" select="position()"/>
                        </xsl:apply-templates>
                  </xsl:for-each>
            </xsl:if>
            <xsl:value-of select="$baseclipstext" disable-output-escaping="yes"/>
            <xsl:if test="$option = 'a'">
                  <xsl:for-each select="$xsltfile">
                        <xsl:variable name="name" select="replace(.,'.xslt','')"/>
                        <xsl:variable name="xslt" select="doc(.)"/>
                        <xsl:value-of select="concat('[x',$name,' | ',$name,']&#13;&#10;')" disable-output-escaping="yes"/>
                        <xsl:if test="string-length($includedoc) gt 0">
                              <xsl:text>%doucumenttask%</xsl:text>
                        </xsl:if>
                        <xsl:text>               ;xslt  </xsl:text>
                        <xsl:value-of select="$name"/>
                        <xsl:text>  "</xsl:text>
                        <xsl:apply-templates select="$xslt/*/xsl:param" mode="def">
                              <xsl:with-param name="seqno" select="position()"/>
                        </xsl:apply-templates>
                        <xsl:text disable-output-escaping="yes">"  %input%  %output%&#13;&#10;;&#13;&#10;</xsl:text>
                  </xsl:for-each>
            </xsl:if>
            <xsl:if test="$option = 'b'">
                  <xsl:for-each select="$xsltfile">
                        <xsl:variable name="name" select="replace(.,'.xslt','')"/>
                        <xsl:variable name="xslt" select="doc(.)"/>
                        <xsl:value-of select="concat('[x',$name,' | ',$name,']&#13;&#10;')" disable-output-escaping="yes"/>
                        <xsl:if test="string-length($includedoc) gt 0">
                              <xsl:text>%doucumenttask%</xsl:text>
                        </xsl:if>
                        <xsl:text>               ;xslt  </xsl:text>
                        <xsl:value-of select="$name"/>
                        <xsl:text>  "</xsl:text>
                        <xsl:apply-templates select="$xslt/*/xsl:param" mode="clip"/>
                        <xsl:text disable-output-escaping="yes">"  %input%  %output%&#13;&#10;;&#13;&#10;</xsl:text>
                  </xsl:for-each>
            </xsl:if>
            <!-- -->
      </xsl:template>
      <xsl:template match="xsl:param" mode="macro">
            <xsl:param name="seqno"/>
            <xsl:choose>
                  <xsl:when test="@select">
                        <xsl:value-of select="concat('%x',@name,$seqno,'%=@E ',@name,' parameter,',@name)" disable-output-escaping="yes"/>
                        <xsl:text disable-output-escaping="yes">=,</xsl:text>
                        <xsl:value-of select="@select"/>
                        <xsl:text disable-output-escaping="yes">,,&#39;,&#13;&#10;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat('%x',@name,$seqno,'%=@E ',@name,' parameter,',@name)" disable-output-escaping="yes"/>
                        <xsl:text disable-output-escaping="yes">=,,,,&#39;&#13;&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="xsl:param" mode="clip">
            <xsl:choose>
                  <xsl:when test="@select">
                        <xsl:variable name="space">
                              <xsl:if test="following-sibling::xsl:param">
                                    <xsl:text> </xsl:text>
                              </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="@name"/>
                        <xsl:text>=</xsl:text>
                        <xsl:value-of select="@select"/>
                        <xsl:text></xsl:text>
                        <xsl:value-of select="$space"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:variable name="space">
                              <xsl:if test="following-sibling::xsl:param">
                                    <xsl:text> </xsl:text>
                              </xsl:if>
                        </xsl:variable>
                        <xsl:value-of select="@name"/>
                        <xsl:text>=''</xsl:text>
                        <xsl:value-of select="$space"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="xsl:param" mode="def">
            <xsl:param name="seqno"/>
            <xsl:variable name="space">
                  <xsl:if test="following-sibling::xsl:param">
                        <xsl:text>  </xsl:text>
                  </xsl:if>
            </xsl:variable>
            <xsl:value-of select="concat('%',@name,$seqno,'%',$space)"/>
      </xsl:template>
</xsl:stylesheet>
