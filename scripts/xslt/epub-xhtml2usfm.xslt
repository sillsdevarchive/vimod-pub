<?xml version="1.0"?>
<!--
    #############################################################
    # Name:         epub-xhtml2usfm.xslt
    # Purpose:      Generate USFM from InDesign created ePub
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright:	(c) 2013 SIL International
    # Licence:      	<LPGL>
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:xhtml="http://www.w3.org/1999/xhtml" xpath-default-namespace= "http://www.w3.org/1999/xhtml" xmlns:f="myfunctions">
      <xsl:output method="text"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="epub-xhtml-func.xslt"/>
      <xsl:param name="noverse1"/>
      <xsl:variable name="removelist" select="
'cnum 
cnumEndSpace 
crossReferenceCaller 
crossReferenceCalleeSpace 
footnoteCalleeSpace
hiddenChapter 
noteCaller 
noteCallerSpace 
noteEndSpace 
v1sp 
vsp '"/>
      <xsl:variable name="copylist" select="'crossReferenceCallee footnoteCallee'"/>
      <xsl:variable name="inlinelist" select="'bk fig qt'"/>
      <xsl:variable name="reflist" select="'ft xt'"/>
      <xsl:variable name="verselist" select="'v v1'"/>
      <xsl:variable name="pararemovelist" select="
'enableColTopExtraSpace 
intro-rule
 caption
 default
 Basic-Paragraph
 head-LeftPg
 head-RightPg
 note-frame-rule
f
x
 hiddenChapter'"/>
      <xsl:variable name="paraclassnamelistquotlist" select="'li1v li2v q1v q2v'"/>
      <xsl:variable name="paraclassnameprechaplist" select="'c1p c2p'"/>
      <xsl:variable name="spanclassnametoremove" select="tokenize($removelist,'\s+')"/>
      <xsl:variable name="spanclassnametocopy" select="tokenize($copylist,'\s+')"/>
      <xsl:variable name="spanclassnametoinline" select="tokenize($inlinelist,'\s+')"/>
      <xsl:variable name="spanclassnameref" select="tokenize($reflist,'\s+')"/>
      <xsl:variable name="spanclassnameverse" select="tokenize($verselist,'\s+')"/>
      <xsl:variable name="paraclassnameremove" select="tokenize($pararemovelist,'\s+')"/>
      <xsl:variable name="paraclassnamelistquot" select="tokenize($paraclassnamelistquotlist,'\s+')"/>
      <xsl:variable name="paraclassnameprechap" select="tokenize($paraclassnameprechaplist,'\s+')"/>
      <xsl:template match="/html/body">
            <xsl:apply-templates/>
      </xsl:template>
      <xsl:template match="/html/head">
      </xsl:template>
      <xsl:template match="span">
            <!-- ================================ =============== spans -->
            <xsl:variable name="classname" select="tokenize(@class,' ')"/>
            <xsl:choose>
                  <!-- The following When contains Items to be removed
            cnum is handled separately. It is listed here so it is does not appear twice
            -->
                  <xsl:when test="$classname = $spanclassnametoremove"/>
                  <!-- footnote caller and xref caller and other unwanted class types -->
                  <xsl:when test="not(@class) or $classname = $spanclassnametocopy">
                        <!-- when there is no class, or a class that you just want to copy just copy text -->
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates/>
                        <xsl:text> </xsl:text>
                  </xsl:when>
                  <xsl:when test="$classname = $spanclassnametoinline">
                        <!-- Default handling where inline style is followed by formatting -->
                        <xsl:text>\</xsl:text>
                        <xsl:value-of select="substring-before(@class,' ')"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates/>
                        <xsl:text>\</xsl:text>
                        <xsl:value-of select="substring-before(@class,' ')"/>
                        <xsl:text>* </xsl:text>
                  </xsl:when>
                  <xsl:when test="$classname = 'noteId'">
                        <!-- footnote or xref caller ref id -->
                        <xsl:text>&#13;&#10;\</xsl:text>
                        <xsl:value-of select="substring(.,7,1)"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="substring-after(.,'_')"/>
                  </xsl:when>
                  <xsl:when test="$classname = $spanclassnameref">
                        <!-- footnote and xref caller - starts one of these-->
                        <xsl:text> \</xsl:text>
                        <xsl:value-of select="substring(@class,1,2)"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates/>
                        <xsl:text></xsl:text>
                  </xsl:when>
                  <xsl:when test="$classname = 'noteText'">
                        <!-- footnote and xref text - ends ref-->
                        <xsl:value-of select="f:refmatch(.)"/>
                        <xsl:text> </xsl:text>
                  </xsl:when>
                  <!-- handling verses that are marked as first verses with formatting classses -->
                  <xsl:when test="$classname = $spanclassnameverse">
                        <!-- verse one handling where no first verse number -->
                        <xsl:text>&#13;&#10;\v </xsl:text>
                        <xsl:apply-templates/>
                        <xsl:text> </xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- default handling of unspecified spans -->
                        <xsl:text> \</xsl:text>
                        <xsl:value-of select="@class"/>
                        <xsl:text> </xsl:text>
                        <xsl:apply-templates/>
                        <xsl:text>\</xsl:text>
                        <xsl:value-of select="@class"/>
                        <xsl:text>*</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="p">
            <!-- ============================================ Paragraph -->
            <xsl:variable name="classname" select="tokenize(@class,' ')"/>
            <xsl:choose>
                  <xsl:when test="@class = 'mt-space-before'">
                        <!-- handles ID line -->
                        <xsl:text>\id </xsl:text>
                        <xsl:apply-templates select="node()"/>
                  </xsl:when>
                  <xsl:when test="$classname = $paraclassnameremove"/>
                  <!-- List all unwanted paragraphs so they are not included-->
                  <xsl:when test="@class = $paraclassnamelistquotlist">
                        <!-- matches lists that have a verse 1 at the beginning of the chapter -->
                        <xsl:text>&#13;&#10;\</xsl:text>
                        <xsl:value-of select="substring-before(@class,'v')"/>
                        <xsl:apply-templates/>
                        <xsl:text>&#13;&#10;</xsl:text>
                        <xsl:if test=". = '1'">
                              <xsl:text>\v 1 </xsl:text>
                        </xsl:if>
                  </xsl:when>
                  <xsl:when test="@class = $paraclassnameprechap">
                        <!-- matches chapter preceeded paragraphs -->
                        <xsl:text>\c </xsl:text>
                        <xsl:apply-templates select="*[1][@class = 'cnum']" mode="chap"/>
                        <xsl:text>&#13;&#10;\p </xsl:text>
                        <xsl:if test="$noverse1 = 'true'">
                              <xsl:text>&#13;&#10;\v 1 </xsl:text>
                        </xsl:if>
                        <xsl:apply-templates/>
                  </xsl:when>
                  <!-- <xsl:when test="@class = 'x'
                                    or @class = 'f'
                                    ">
                        matches footnote and xref paragraphs in the end note area
                        <xsl:apply-templates select="*"/>
                  </xsl:when> -->
                  <xsl:when test="@class = 'toc1'">
                        <!-- header and toc1 -->
                        <xsl:variable name="toc">
                              <xsl:choose>
                                    <xsl:when test="contains(.,'&#9;')">
                                          <xsl:value-of select="substring-before(.,'&#9;')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:apply-templates select="node()"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>
                        <xsl:value-of select="concat('&#13;&#10;\h ',$toc)"/>
                        <xsl:value-of select="concat('&#13;&#10;\toc1 ',$toc)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- default paragraph handling -->
                        <xsl:choose>
                              <xsl:when test=". = '&#160;' or . = '' or . = ' '"/>
                              <xsl:otherwise>
                                    <xsl:text>&#13;&#10;\</xsl:text>
                                    <xsl:value-of select="@class"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="node()"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="span" mode="chap">
            <!-- This gets the chapter number -->
            <xsl:apply-templates select="*"/>
      </xsl:template>
</xsl:stylesheet>
