<?xml version="1.0"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="iso" select="html/body/div/div[4]/div/form[2]/fieldset/ol/li/div/fieldset/label/text()"/>
 <xsl:output method="text" />
 

 <xsl:template match="/html/body/div/div[4]/div/div[2]/ul/li">
      <xsl:value-of select="$iso" />
    <xsl:text>&#9;</xsl:text>
     <xsl:value-of select="div/div[2]/span[2]/span[@class = 'date']" /><!-- year of pub -->
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="div/div/a" /><!-- title -->
    <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="div/div/a/@href" /><!-- url -->
        <xsl:text>&#9;</xsl:text>
    <xsl:value-of select="div/div/span/@title" /><!-- meta -->
    
 </xsl:template>
<xsl:template match="@*|node()">
<xsl:apply-templates select="@*|node()"/>

</xsl:template>
</xsl:stylesheet>

