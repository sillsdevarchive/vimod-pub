<?xml version="1.0" encoding="utf-8"?> <!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
<xsl:include href="inc-file2uri.xslt"/>
<xsl:include href="inc-lookup.xslt"/>
<xsl:output method="text" encoding="utf-8" name="text" />
<xsl:param name="outputpath"/>
<xsl:variable name="book_file" select="'D:\All-SIL-Publishing\vimod-pub\resources\prod-books-only.txt'"/>
<xsl:variable name="book" select="f:file2lines($book_file)"/>
 <xsl:template match="/*">
<xsl:apply-templates select="BIBLEBOOK"/>
 </xsl:template>
<xsl:template match="BIBLEBOOK">
<xsl:variable name="curbooknumb" select="number(@bnumber) +1"/>
<xsl:variable name="curbookcode" select="f:lookupnumber($book,$curbooknumb,' ',1,2,'')"/>
<xsl:variable name="url-win" select="concat($outputpath,'\',$curbooknumb,'-',$curbookcode,'.sfm')"/>
<xsl:comment select="$url-win"/><xsl:text>&#13;&#10;</xsl:text>
<xsl:variable name="url" select="f:file2uri($url-win)"/>
<xsl:result-document href="{$url}" format="text">
<xsl:text>\id </xsl:text>
<xsl:value-of select="$curbookcode"/>
<xsl:text> </xsl:text>
<xsl:value-of select="@bname"/>
<xsl:text>&#13;&#10;</xsl:text>
<xsl:apply-templates select="*"/>
</xsl:result-document>
</xsl:template>
<xsl:template match="CHAPTER">
<xsl:text>\c </xsl:text>
<xsl:value-of select="@cnumber"/>
<xsl:text>&#13;&#10;\p &#13;&#10;</xsl:text>
<xsl:apply-templates select="*"/>
</xsl:template>
<xsl:template match="VERS">
<xsl:text>\v </xsl:text>
<xsl:value-of select="@vnumber"/>
<xsl:text> </xsl:text>
<xsl:apply-templates />
<xsl:text>&#13;&#10;</xsl:text>
</xsl:template>
</xsl:stylesheet>