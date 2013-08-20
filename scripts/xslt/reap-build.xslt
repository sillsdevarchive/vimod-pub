<?xml version="1.0"?>
<!-- part of a set of 4 style sheets to create a folder structure and files for upload to REAP.
Populating existing records with files missing from the collection
Individual items are grouped by iso code and then by reap handle.
The two  parameters allow filtering of files for uploading by selecting extension type and ignoring certain strings.
The output path can be varied from the default path.
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <!-- specify the output path -->
      <xsl:param name="outpath" select="'D:\reap\reap-build-'"/>
      <!-- specify the extensions to be processed in a space separated list -->
      <xsl:param name="filetypeextensions" select="'.pdf'"/>
      <!-- specify a string that is in a file name or path that should be ignored -->
      <xsl:param name="omitifcontains"/>
      <xsl:variable name="buildpath" select="concat($outpath,substring(string(current-date()),1,10))"/>
      <xsl:variable name="filetypes">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="lower-case($filetypeextensions)"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <xsl:include href='inc-copy-anything.xslt'/>
      <xsl:output method="xml" encoding="utf-8" indent="yes" name="xml"/>
      <xsl:output method="text" encoding="utf-8" name="text" omit-xml-declaration="yes"/>
      <xsl:function name="f:file2uri">
            <!-- Function to convert a windows path into a uri -->
            <xsl:param name="pathfile"/>
            <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
      </xsl:function>
      <xsl:function name="f:filelengthcheck">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="string-length($string) &gt; 100">
                        <xsl:value-of select="concat(substring($string,1,70),'__',substring($string,string-length($string)-28))"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:template match="/*">
            <xsl:apply-templates select="isoGroup"/>
      </xsl:template>
      <xsl:template match="isoGroup">
            <xsl:variable name="batchfile" select="f:file2uri(concat($buildpath,'\',@iso,'\copyfiles.cmd'))"/>
            <xsl:variable name="autoitfile" select="f:file2uri(concat($buildpath,'\',@iso,'\copyfiles.au3'))"/>
            <xsl:result-document href="{$batchfile}" format="text">
                  <!--    ================ write batch file to copy files into new structure -->
                  <xsl:text>     chcp 65001&#13;&#10;     :: Code page changed to UTF-8&#13;&#10;     :: If errors, make sure Font is set to Lucinda Consol&#13;&#10;</xsl:text>
                  <!--   Change codepage of console to UTF-8 -->
                  <xsl:for-each select="handleGroup/files4reap">
                        <xsl:variable name="iso">
                              <xsl:value-of select="lower-case(descendant::iso)"/>
                        </xsl:variable>
                        <xsl:text>     copy "</xsl:text>
                        <xsl:value-of select="pathfileext"/>
                        <xsl:text>" "</xsl:text>
                        <xsl:value-of select="replace(concat($buildpath,'\',$iso,'\',parent::*/@subdir,'\',f:filelengthcheck(fileext)),' ','_')"/>
                        <xsl:text>"&#13;&#10;</xsl:text>
                  </xsl:for-each>
            </xsl:result-document>
            <xsl:result-document href="{$autoitfile}" format="text">
                  <!--    ================ autoit file to copy files into new structure -->
                  <xsl:for-each select="handleGroup/files4reap">
                        <xsl:variable name="iso">
                              <xsl:value-of select="lower-case(descendant::iso)"/>
                        </xsl:variable>
                        <xsl:text>FileCopy ("</xsl:text>
                        <xsl:value-of select="pathfileext"/>
                        <xsl:text>", "</xsl:text>
                        <xsl:value-of select="replace(concat($buildpath,'\',$iso,'\',parent::*/@subdir,'\',f:filelengthcheck(fileext)),' ','_')"/>
                        <xsl:text>")&#13;&#10;</xsl:text>
                  </xsl:for-each>
            </xsl:result-document>
            <xsl:apply-templates select="handleGroup">
                  <xsl:with-param name="iso" select="@iso"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="handleGroup">
            <xsl:param name="iso" select="lower-case(descendant::iso[1])"/>
            <xsl:variable name="dublincore" select="f:file2uri(concat($buildpath,'\',$iso,'\',@subdir,'\dublin_core.xml'))"/>
            <xsl:variable name="contents" select="f:file2uri(concat($buildpath,'\',$iso,'\',@subdir,'\contents'))"/>
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
            <xsl:apply-templates select="fileext"/>
      </xsl:template>
      <xsl:template match="fileext">
            <xsl:value-of select="f:filelengthcheck(replace(.,' ','_'))"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
</xsl:stylesheet>
