<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:param name="min-word-length" select="3"/>
      <xsl:template match="/">
            <wordlist>
                  <xsl:for-each select="//verse">
                        <xsl:variable name="bk" select="parent::chapterGroup/@book"/>
                        <xsl:variable name="bkno" select="ancestor::usx/@pos"/>
                        <xsl:variable name="c" select="parent::chapterGroup/@number"/>
                        <xsl:variable name="v" select="@number"/>
                        <xsl:variable name="word" select="tokenize(translate(following::node()[1],'.,?!“”‘’()[]',''),' ')"/>
                        <xsl:for-each select="$word">
                              <xsl:if test="string-length(.) ge $min-word-length">
                                    <xsl:element name="w">
                                          <xsl:attribute name="word">
                                                <xsl:value-of select="."/>
                                          </xsl:attribute>
                                          <xsl:attribute name="bk">
                                                <xsl:value-of select="$bk"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="bkno">
                                                <xsl:value-of select="$bkno"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="c">
                                                <xsl:value-of select="$c"/>
                                          </xsl:attribute>
                                          <xsl:attribute name="v">
                                                <xsl:value-of select="$v"/>
                                          </xsl:attribute>
                                    </xsl:element>
                              </xsl:if>
                        </xsl:for-each>
                  </xsl:for-each>
            </wordlist>
      </xsl:template>
</xsl:stylesheet>
