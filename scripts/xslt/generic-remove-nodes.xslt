<?xml version="1.0" encoding="UTF-8"?>
<!-- Part of the VimodPub scripts http://projects.palaso.org/projects/vimod-pub
	Delete nodes
	Itended to remove multiple elements supplied in the $removenodelist parameter in the format
	Written by Ian McQuay 
	Created 2012-06-14
	Modified: 2012-08-21
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:import href='inc-copy-anything.xslt'/>
      <!-- inc-copy-anything.xslt - Match any node or element -->

      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:param name="removenodelist"/>
      <xsl:variable name="remove" select="tokenize($removenodelist,'\s+')"/>
      <xsl:template match="*[local-name() = $remove]"/>
      <!-- anything in the removenodeslist is not copied -->
</xsl:stylesheet>
