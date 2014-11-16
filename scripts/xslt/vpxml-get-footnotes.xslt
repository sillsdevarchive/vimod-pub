<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	vpxml-get-footnotes.xslt
    # Purpose:		Bring footnote from end or book to caller location
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2014- -
    # Copyright:    	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      
      <xsl:include href="project.xslt"/>
      <xsl:variable name="true" select="tokenize('on yes tue',' ')"/>
      <xsl:template match="caller">
            <xsl:variable name="callerno" select="@cseq"/>
            <xsl:variable name="callerletter" select="@callertext"/>
            <xsl:variable name="calleeletter" select="//fnote[@seq = $callerno]/callee/@value"/>
            <xsl:if test="//fnote[@seq = $callerno] and $calleeletter ne $callerletter">
                  <xsl:text>&lt;!-- match error --&gt;</xsl:text>
            </xsl:if>
            <xsl:copy-of select="//fnote[@nseq = $callerno]"/>
      </xsl:template>
      <xsl:template match="note"/>
</xsl:stylesheet>
