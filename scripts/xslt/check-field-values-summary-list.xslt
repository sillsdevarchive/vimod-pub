<!--
    #############################################################
    # Name: 	check-field-vlues.xslt
    # Purpose:	Generate a sample from dictionary of each field type to check formatting.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:      	2013/08/22
    # Copyright: 	(c) 2013 SIL International
    # Licence:      	<LGPL>
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns:f="myfunctions">
      <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:param name="fieldlistfile"/>
      <xsl:variable name="fieldlistfileuri" select="f:file2uri($fieldlistfile)"/>
      <xsl:variable name="fieldlist" select="unparsed-text($fieldlistfileuri)"/>
      <xsl:variable name="field" select="tokenize($fieldlist,'\s+')"/>
      <xsl:include href='inc-file2uri.xslt'/>
      <xsl:template match="/*">
            <data>
                  <xsl:for-each-group select="//*[local-name() = $field]" group-by="normalize-space(.)">
                        <xsl:sort select="."/>
                        <xsl:element name="field">
                              <xsl:attribute name="name">
                                    <xsl:value-of select="name()"/>
                              </xsl:attribute>
                              <xsl:attribute name="value">
                                    <xsl:value-of select="current-group()[1]"/>
                              </xsl:attribute>
                              <xsl:attribute name="count">
                                    <xsl:value-of select="count(current-group())"/>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:for-each-group>
            </data>
      </xsl:template>
</xsl:stylesheet>
