<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <!--
    #############################################################
    # Name:        	inc-list2xml-xattrib.xslt
    # Purpose:	make elements for each line of input text and parse
    # Part of:     	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:      	Ian McQuay <ian_mcquay.org>
    # Created:     	2013/08/23
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LGPL>
    ################################################################
    -->
      <xsl:template name="list2xmlxattrib">
            <xsl:param name="langhandlelist"/>
            <xsl:param name="langhandlenamelistattriblist"/>
            <xsl:variable name="attrib" select="tokenize($langhandlenamelistattriblist,'\s+')"/>
            <xsl:variable name="line" select="tokenize($langhandlelist,'\r\n')"/>
            <xsl:for-each select="$line">
                  <xsl:element name="item">
                        <xsl:variable name="cell" select="tokenize(.,':')"/>
                        <xsl:for-each select="$cell">
                              <xsl:variable name="pos" select="position()"/>
                              <xsl:attribute name="{.}">
                                    <xsl:value-of select="$cell[$pos]"/>
                              </xsl:attribute>
                        </xsl:for-each>
                  </xsl:element>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>
