<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="inputbatchfile"/>
      <xsl:variable name="inputfileuri" select="f:file2uri($inputbatchfile)"/>
      <xsl:variable name="text" select="unparsed-text($inputfileuri)"/>
      <xsl:variable name="modules">


</xsl:variable>
      <xsl:template match="/">
      <xsl:analyze-string select="$text" regex="\r\n:[a-z0-9]+">
            <xsl:matching-substring>
                  <function name="substring(.,4)"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>



</xsl:non-matching-substring>
      </xsl:analyze-string

 </xsl:template>
</xsl:stylesheet>
