<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     	vimod-rewrite-android-scr-project-tasks.xslt
    # Purpose:	
    # Part of:    	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:     	Ian McQuay <ian_mcquay.org>
    # Created:    	2014-08-27
    # Copyright:  	(c) 2014 SIL International
    # Licence:   	<LGPL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="projecttasksmodel"/>
      <xsl:variable name="projectmodeluri" select="f:file2uri($projecttasksmodel)"/>
      <xsl:variable name="varparser" select="'^([^;]+);([^ ]+) +([^ ]+) +(.+)'"/>
      <xsl:template match="/">
            <xsl:for-each select="$projectmodeluri">
                  <!-- copy the root folder files pub.cmd and local_var.cmd -->
                  <xsl:call-template name="parseline">
                        <xsl:with-param name="line" select="."/>
                  </xsl:call-template>
            </xsl:for-each>
      </xsl:template>
      <xsl:template name="parseline">
            <xsl:param name="line"/>
            <xsl:variable name="comment" select="replace($line,$varparser,'$1')"/>
            <xsl:variable name="command" select="replace($line,$varparser,'$2')"/>
            <xsl:variable name="name" select="replace($line,$varparser,'$3')"/>
            <xsl:variable name="value" select="replace($line,$varparser,'$4')"/>
            <xsl:variable name="commandstring" select="substring-after($line,';')"/>
            <xsl:variable name="commonuri" select="f:file2uri(concat($cd,'\tasks\',$name))"/>
            <xsl:variable name="onevar">
                  <xsl:if test="matches($value,'^%[\w\d\-_]+%$') or matches($value,'^&#34;%[\w\d\-_]+%&#34;$')">
                        <xsl:text>onevar</xsl:text>
                  </xsl:if>
            </xsl:variable>
            <xsl:choose>
                 

                  <xsl:when test="matches($command,';var')">
                        <!-- variable line -->
<xsl:value-of select="$comment"/>
<xsl:text>;var </xsl:text>
<xsl:value-of select="$name"/>
<xsl:value-of select=""/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$line"/>
                        <xsl:text>&#10;</xsl:text>
  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="writeparam">
            <xsl:param name="name"/>
            <xsl:param name="value"/>
            <xsl:param name="iscommand"/>
            <xsl:element name="xsl:param">
                  <xsl:attribute name="name">
                        <xsl:value-of select="$name"/>
                  </xsl:attribute>
                  <xsl:attribute name="select">
                        <xsl:if test="string-length($iscommand) = 0">
                              <xsl:text>'</xsl:text>
                        </xsl:if>
                        <xsl:value-of select="$value"/>
                        <xsl:if test="string-length($iscommand) = 0">
                              <xsl:text>'</xsl:text>
                        </xsl:if>
                  </xsl:attribute>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
