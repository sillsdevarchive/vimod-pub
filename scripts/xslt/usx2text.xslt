<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="text" encoding="utf-8"/>
      <xsl:param name="removefieldlist" select="'id h s r mt mt1 mt2 mt3 ip is restore fig note'"/>
      <xsl:variable name="removefields" select="tokenize($removefieldlist,'\s+')"/>
      <xsl:template match="*">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="*[@style = $removefields]"/>
</xsl:stylesheet>
