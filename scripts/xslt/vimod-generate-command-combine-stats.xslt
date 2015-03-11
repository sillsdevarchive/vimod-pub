<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         vimod-generate-command-combine-stats.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    # lookup param: label array string field-separator find-column return-column
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:param name="commandlistfile" select="'D:\All-SIL-Publishing\vimod-pub\data\eng\vimod-stats\commands-list.txt'"/>
      <xsl:param name="menuusagefile" select="'D:\All-SIL-Publishing\vimod-pub\data\eng\vimod-stats\menu-counted.txt'"/>
      <xsl:param name="taskusagefile" select="'D:\All-SIL-Publishing\vimod-pub\data\eng\vimod-stats\tasks-counted.txt'"/>
      <xsl:param name="callusagefile" select="'D:\All-SIL-Publishing\vimod-pub\data\eng\vimod-stats\call-counted.txt'"/>
      <xsl:variable name="command" select="f:file2lines($commandlistfile)"/>
      <xsl:variable name="menu" select="f:file2lines($menuusagefile)"/>
      <xsl:variable name="tasklist" select="f:file2lines($taskusagefile)"/>
      <xsl:variable name="call" select="f:file2lines($callusagefile)"/>
      <xsl:template match="/">
            <xsl:text>menu &#9;task &#9;call &#9;command&#13;&#10;</xsl:text>
            <xsl:for-each select="$command">
                  <xsl:if test=". != ''">
                        <xsl:value-of select="f:lookupdefault($menu,.,'&#9;',2,1,'')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="f:lookupdefault($tasklist,.,'&#9;',2,1,'')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="f:lookupdefault($call,.,'&#9;',2,1,'')"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:if>
            </xsl:for-each>
            <xsl:text>&#13;&#10;======================&#13;&#10;</xsl:text>
            <xsl:text>Unmatched tasks items&#13;&#10;</xsl:text>
            <xsl:text>Tasklist          Match &#13;&#10;</xsl:text>
            <xsl:text>-------------------------&#13;&#10;</xsl:text>
            <xsl:for-each select="$tasklist">
                  <xsl:variable name="cell" select="tokenize(.,'\t')"/>
                  <xsl:if test="$cell[2] != ''">
                        <xsl:value-of select="$cell[2]"/>
                        <xsl:value-of select="substring('                    ',1,18-string-length($cell[2]))"/>
                        <xsl:value-of select="f:lookupdefault($command,$cell[2],'&#9;',1,2,'Unmatched')"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:if>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
