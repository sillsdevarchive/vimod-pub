<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:param name="buildpath" select="'file:///d:/reap-build'"/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:output method="xml" encoding="utf-8" indent="yes" name="xml"/>
      <xsl:output method="text" encoding="utf-8" name="text" omit-xml-declaration="yes"/>
      <xsl:variable name="batchfile" select="concat($buildpath,'copyfiles.cmd')"/>
      <xsl:template match="/*">
            <xsl:apply-templates select="isoGroup"/>
            <xsl:result-document href="{$batchfile}" format="text">
                  <!-- ================ write batch file to copy files into new structure -->
                  <xsl:for-each select="//files4reap">
                        <xsl:variable name="iso">
                              <xsl:value-of select="lower-case(descendant::iso)"/>
                        </xsl:variable>
                        <xsl:text>copy "</xsl:text>
                        <xsl:value-of select="pathfileext"/>
                        <xsl:text>" "</xsl:text>
                        <xsl:value-of select="replace(concat($buildpath,'/',$iso,'/',parent::*/@subdir,'/',file),' ','_')"/>
                        <xsl:text>"&#10;</xsl:text>
                  </xsl:for-each>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="isoGroup">
            <xsl:variable name="mkdir">
                  <xsl:value-of select="$buildpath"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="lower-case(@iso)"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="lower-case(@iso)"/>
                  <xsl:text>.txt</xsl:text>
            </xsl:variable>
            <xsl:result-document href="{$mkdir}" format="text">
                  <xsl:apply-templates select="files4reap">
                        <xsl:with-param name="subdir" select="@subdir"/>
                  </xsl:apply-templates>
            </xsl:result-document>
            <xsl:apply-templates select="handleGroup">
                  <xsl:with-param name="iso" select="@iso"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="handleGroup">
            <xsl:param name="iso" select="lower-case(descendant::iso[1])"/>
            <xsl:variable name="dublincore">
                  <xsl:value-of select="$buildpath"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="$iso"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="@subdir"/>
                  <xsl:text>/dublin_core.xml</xsl:text>
            </xsl:variable>
            <xsl:variable name="contents">
                  <xsl:value-of select="$buildpath"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="$iso"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="@subdir"/>
                  <xsl:text>/contents.txt</xsl:text>
            </xsl:variable>
            <!-- ================ write handles and file processed  as documentation -->
            <xsl:value-of select="concat(handle,'&#9;',file,'&#10;')"/>
            <xsl:result-document href="{$dublincore}" format="xml">
                  <!-- ========================================     write dublin core file -->
                  <dublin_core schema="dc">
                        <dcvalue element="identifier" qualifier="uri">
                              <xsl:value-of select="replace(@handle,'https','http')"/>
                        </dcvalue>
                  </dublin_core>
            </xsl:result-document>
            <xsl:result-document href="{$contents}" format="text">
                  <!-- ========================================     write contents file -->
                  <xsl:apply-templates select="files4reap">
                        <xsl:with-param name="subdir" select="@subdir"/>
                  </xsl:apply-templates>
            </xsl:result-document>
      </xsl:template>
      <xsl:template match="files4reap">
            <xsl:apply-templates select="file"/>
      </xsl:template>
      <xsl:template match="file">
            <xsl:value-of select="replace(.,' ','_')"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
</xsl:stylesheet>
