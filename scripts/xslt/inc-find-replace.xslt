<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cite="http://fake.org.au/ns/">
      <xsl:param name="find"/>
      <xsl:param name="replace"/>
      <xsl:function name="cite:replace">
            <xsl:param name="input"/>
            <xsl:sequence select="replace($input,$find,$replace)"/>
      </xsl:function>
</xsl:stylesheet>
