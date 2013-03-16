<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" />
<xsl:strip-space elements="*"/>
      <xsl:template match="/*">
            <xsl:apply-templates select="body"/>
      </xsl:template>
      <xsl:template match="body">
            <xsl:apply-templates select="div"/>
      </xsl:template>

      <xsl:template match="div[@class = 'entry']">
            <xsl:apply-templates select="span[@class = 'headword']"/>
            <xsl:text>{{</xsl:text>
            <xsl:apply-templates select="span[@class = 'senses']"/>
            <xsl:text>}}&#9;</xsl:text>
            <xsl:apply-templates select="span[@class = 'senses']/span[@class = 'sense']/span[@class = 'definition']"/>
            <xsl:text>
</xsl:text>
      </xsl:template>
      <xsl:template match="span[@class = 'headword']">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="span[@class = 'senses']">
            <xsl:apply-templates select="span[@class = 'sense']"/>
      </xsl:template>
      <xsl:template match="span[@class = 'sense']">
            <xsl:apply-templates select="span[@class = 'grammatical-info']"/>
      </xsl:template>
      <xsl:template match="span[@class = 'grammatical-info']">
            <xsl:apply-templates select="span[@class = 'partofspeech']"/>
      </xsl:template>
      <xsl:template match="span[@class = 'partofspeech']">
            <xsl:text>[01 </xsl:text>
            <xsl:apply-templates select="span[@class = 'en']"/>
            <xsl:text>]</xsl:text>
      </xsl:template>
      <xsl:template match="span[@class = 'en']">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="span[@class = 'definition']">
            <xsl:apply-templates/>
            <xsl:text>; </xsl:text>
      </xsl:template>
      <xsl:template match="*">
       
      </xsl:template>
</xsl:stylesheet>
