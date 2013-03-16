<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns/">
      <xsl:function name="silp:remove-sq-brackets">
            <xsl:param name="input"/>
            <xsl:sequence select="translate($input,'[]','()')"/>
      </xsl:function>
     <xsl:template match="text()">
            <!-- Get rid of [ and ] found in any text -->
            <xsl:value-of select="silp:remove-sq-brackets(.)"/>
      </xsl:template>

</xsl:stylesheet>
