<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" exclude-result-prefixes="f">
<xsl:strip-space elements="*"/>
<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes" />
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="path2files"/>
      <xsl:param name="filespecs"/>
      <xsl:variable name="collection" select="collection(concat(f:file2uri($path2files),'?select=',$filespecs))"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="/">
            <data>
                  <xsl:apply-templates select="$collection/*/*"/>
            </data>
      </xsl:template>
</xsl:stylesheet>
