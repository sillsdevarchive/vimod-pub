<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vp2xml-test-classes.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2014- -
    # Copyright:    (c) 2014 SIL International
    # Licence:      <LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="/*">
            <xsl:text disable-output-escaping="yes">Report on Paragraph Matching for </xsl:text>
            <xsl:value-of select="concat($iso,' ','&#13;&#10;')"/>
            <xsl:value-of select="format-dateTime(current-dateTime(),'[Y0001]-[M01]-[D01] [H01]:[m01]')"/>
            <xsl:text disable-output-escaping="yes">&#13;&#10;============================&#13;&#10;</xsl:text>
            <xsl:for-each-group select="//para" group-by="@class">
                  <xsl:sort select="@class"/>
                  <xsl:choose>
                        <xsl:when test="string-length(@class) gt 0">
                              <xsl:value-of select="@class"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&lt;NULL&gt;</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:if test="string-length(@class) lt 8">
                        <xsl:text>&#9;</xsl:text>
                  </xsl:if>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>&#9;</xsl:text>
                  <xsl:call-template name="testmatch">
                        <xsl:with-param name="class" select="@class"/>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
            </xsl:for-each-group>
      </xsl:template>
      <xsl:template name="testmatch">
            <xsl:param name="class"/>
            <xsl:choose>
                  <xsl:when test="string-length($class) gt 0">
                        <xsl:if test="$class = $unwanted">
                              <xsl:text>sfm = unwanted</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $id">
                              <xsl:text>sfm = id</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $h">
                              <xsl:text>sfm = h</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $mt1">
                              <xsl:text>sfm = mt1</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $mt2">
                              <xsl:text>sfm = mt2</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $p">
                              <xsl:text>sfm = p</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $m">
                              <xsl:text>sfm = m</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $ms1">
                              <xsl:text>sfm = s</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $s">
                              <xsl:text>sfm = s</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $r">
                              <xsl:text>sfm = r</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $x">
                              <xsl:text>sfm = x</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $q1">
                              <xsl:text>sfm = q1</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $q2">
                              <xsl:text>sfm = q2</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $q3">
                              <xsl:text>sfm = q3</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $iot">
                              <xsl:text>sfm = iot</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $imt">
                              <xsl:text>sfm = imt</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $ip">
                              <xsl:text>sfm = ip</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $io1">
                              <xsl:text>sfm = io1</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $io2">
                              <xsl:text>sfm = i02</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $io3">
                              <xsl:text>sfm = io3</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $sig">
                              <xsl:text>sfm = sig</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $iq1">
                              <xsl:text>sfm = iq1</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $is">
                              <xsl:text>sfm = is</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $ie">
                              <xsl:text>sfm = ie</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $p_noverse1">
                              <xsl:text>sfm = p_noverse1</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $ph">
                              <xsl:text>sfm = ph</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $pi">
                              <xsl:text>sfm = pi</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $c">
                              <xsl:text>sfm = c</xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $b_q1">
                              <xsl:text>sfm = b_q1 </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $b">
                              <xsl:text>sfm = b </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $inline_para">
                              <xsl:text>sfm = inline_para </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <!--<xsl:if test="$class = $s_prechap">
                              <xsl:text>sfm = s_prechap </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if> -->
                        <xsl:if test="$class = $fnote">
                              <xsl:text>sfm = fnote </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $li1">
                              <xsl:text>sfm = li1 </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                        <xsl:if test="$class = $li2">
                              <xsl:text>sfm = li2 </xsl:text>
                              <xsl:text>&#9;</xsl:text>
                        </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">class = &lt;NULL&gt;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
