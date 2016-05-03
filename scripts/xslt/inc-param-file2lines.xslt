<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:     generic-file2lines.xslt
    # Purpose:	provide input of a text file and divide into lines.
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2016- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="inputfile"/>
      <xsl:variable name="line" select="f:file2lines($inputfile)"/>
</xsl:stylesheet>
