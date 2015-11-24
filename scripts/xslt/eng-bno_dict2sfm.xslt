<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         eng-bno_dict2sfm.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:variable name="re" select="'^([^\.\r]+) +(adj|adv|n|v|prt|[pP]rep|aux. v|adp|comm|conn|interj|intj|cnj|pro|ptcp|pron|n./adj|conj|adv./adj|adj./adv|adj./n|def. art|n./adj|n/adj|adv./pron)\.? +(.+)'"/>
      <!-- <xsl:variable name="re-sense" select="'^([^\.\r]+) +(adj|adv|n|v|prt|Prep|aux. v|adp|comm|conn|interj|cnj|ptcp)\.? +(.+)'"/> -->
      <xsl:variable name="match" select="'  ?(adj|adv|n|v|prt|[pP]rep|aux. v|adp|comm|conn|interj|intj|cnj|pro|ptcp|pron|n./adj|conj|adv./adj|adj./adv|adj./n|def. art|n/adj|n./adj|adv./pron)\.?  ?'"/>
      <xsl:variable name="filepath" select="'D:\All-SIL-Publishing\vimod-pub\data\Dict\Dict-Flex\eng-bno\eng-bno.txt'"/>
      <xsl:variable name="ewordpath" select="'D:\All-SIL-Publishing\vimod-pub\data\Dict\Dict-Flex\eng-bno\u4.txt'"/>
      <xsl:variable name="line" select="f:file2lines($filepath)"/>
      <xsl:variable name="eword" select="f:file2lines($ewordpath)"/>
      <xsl:template match="/">
            <xsl:for-each select="$line">
                  <xsl:variable name="curline" select="."/>
                 <!-- <xsl:variable name="lx">
                        <xsl:analyze-string select="." regex="{$re}">
                              <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(1)"/>
                              </xsl:matching-substring>
                        </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:variable name="pos1">
                        <xsl:analyze-string select="." regex="{$re}">
                              <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(2)"/>
                              </xsl:matching-substring>
                        </xsl:analyze-string>
                  </xsl:variable>
                  <xsl:variable name="sense1">
                        <xsl:analyze-string select="." regex="{$re}">
                              <xsl:matching-substring>
                                    <xsl:value-of select="regex-group(3)"/>
                              </xsl:matching-substring>
                        </xsl:analyze-string>
                  </xsl:variable> -->
                   <!-- <xsl:variable name="sense" select="tokenize($curline,'$match')"/>  -->
                   <xsl:variable name="lx" select="normalize-space(replace(.,$re,'$1'))"/> 
                   <xsl:variable name="pos1" select="replace(.,$re,'$2')"/> 
                   <xsl:variable name="sense1" select="replace(.,$re,'$3')"/> 
                  <xsl:text>&#13;&#10;&#13;&#10;\lx </xsl:text>
                  <xsl:value-of select="$lx"/>
                  <!--<xsl:text>&#13;&#10;\sn </xsl:text>
                  <xsl:text>&#13;&#10;\ps </xsl:text>
                  <xsl:value-of select="$pos1"/> -->
                  <xsl:call-template name="parse-pos">
                        <xsl:with-param name="pos" select="$pos1"/>
                        <xsl:with-param name="string" select="$sense1"/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="parse-pos">
            <xsl:param name="pos"/>
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($string,$match)">
                        <xsl:analyze-string select="$string" regex="{$re}">
                              <xsl:matching-substring>
                                    <xsl:call-template name="parse-same-pos">
                                          <xsl:with-param name="pos" select="$pos"/>
                                          <xsl:with-param name="string" select="regex-group(1)"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="parse-pos">
                                          <xsl:with-param name="pos" select="regex-group(2)"/>
                                          <xsl:with-param name="string" select="regex-group(3)"/>
                                    </xsl:call-template>
                              </xsl:matching-substring>
                              <!-- <xsl:non-matching-substring>
                                    <xsl:call-template name="parse-same-pos">
                                          <xsl:with-param name="pos" select="$pos"/>
                                          <xsl:with-param name="string" select="$string"/>
                                    </xsl:call-template>
                              </xsl:non-matching-substring> -->
                        </xsl:analyze-string>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- <xsl:text>&#13;&#10;\sn &#13;&#10;\ps </xsl:text>
                        <xsl:value-of select="$pos"/>
                        <xsl:text>&#13;&#10;</xsl:text> -->
                        <xsl:call-template name="parse-same-pos">
                              <xsl:with-param name="pos" select="$pos"/>
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="parse-same-pos">
            <xsl:param name="pos"/>
            <xsl:param name="string"/>
            <xsl:variable name="same-pos" select="tokenize($string,'; ?')"/>
            <xsl:for-each select="$same-pos">
                  <xsl:text>&#13;&#10;\sn &#13;&#10;\ps </xsl:text>
                  <xsl:value-of select="$pos"/>
                  <!--<xsl:text>&#13;&#10;</xsl:text>
                  <xsl:text>\dv </xsl:text>
                  <xsl:value-of select="."/> -->
                  <xsl:call-template name="def">
                        <xsl:with-param name="string" select="."/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="def">
            <!-- check if comma separated part is english or not -->
            <xsl:param name="string"/>
            <xsl:variable name="comma-phrase" select="tokenize($string,', ?')"/>
            <xsl:for-each select="$comma-phrase">
                  <xsl:choose>
                        <xsl:when test="f:test(.) = 'true'">
                              <xsl:text>&#13;&#10;</xsl:text>
                              <xsl:text>\de </xsl:text>
                              <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text>&#13;&#10;</xsl:text>
                              <xsl:text>\dv </xsl:text>
                              <xsl:value-of select="."/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:for-each>
      </xsl:template>
      <xsl:function name="f:test">
            <xsl:param name="string"/>
            <xsl:variable name="word" select="tokenize($string,' ')"/>
            <xsl:if test="string-length($string) gt 2">
                  <xsl:choose>
                        <xsl:when test="string-length($word[1]) gt 2 and $word[1] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length($word[2]) gt 2  and $word[2] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length($word[3]) gt 2  and $word[3] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length($word[4]) gt 2  and $word[4] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length($word[5]) gt 2  and $word[5] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length($word[6]) gt 2  and $word[6] = $eword">
                              <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text></xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:if>
      </xsl:function>
      <!--<xsl:for-each select="$word">
                        <xsl:choose>
                              <xsl:when test=". = $eword">
                                    <xsl:variable name="val" select="f:true($val,"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:variable name="val[position()]" select="0"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:for-each> -->
</xsl:stylesheet>
