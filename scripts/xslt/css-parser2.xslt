<?xml version="1.0"?>
<!--
 To ingest a css file and output a tab separated text file in the form.

.class      margin-left       6pt
.class      margin-right      15pt
h1    font-size   140%
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="sourcetextpath"/>
      <xsl:variable name="css-string" select="unparsed-text(f:file2uri($sourcetextpath))"/>
      <xsl:variable name="css-nocomments" select="replace($css-string,'/\*[^/]+\*/','')"/>
      <xsl:template match="/">
            <xsl:variable name="entry" select="tokenize($css-nocomments,'\}')"/>
            <xsl:for-each select="$entry">
                  <xsl:variable name="namesplit" select="tokenize(.,'\{')"/>
                  <xsl:variable name="name" select="normalize-space($namesplit[1])"/>
                  <xsl:variable name="datasplit" select="tokenize($namesplit[2],';')"/>
                  <xsl:for-each select="$datasplit">
                        <xsl:if test="matches(.,':')">
                              <xsl:variable name="valuesplit" select="tokenize(.,':')"/>
                              <xsl:value-of select="$name"/>
                              <xsl:text>&#9;</xsl:text>
                              <xsl:value-of select="normalize-space($valuesplit[1])"/>
                              <xsl:text>&#9;</xsl:text>
                              <xsl:value-of select="normalize-space($valuesplit[2])"/>
                              <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                  </xsl:for-each>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
