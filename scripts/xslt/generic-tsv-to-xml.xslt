<?xml version="1.0" encoding="utf-8"?>
<!-- Generic xslt for creating html tables from tab separated data.
	The none names are parametised 
	as are the regEx finds
	as are the class names for each node type.
	If the content of the input xml file is nothing it loooks for the raw text file in the $sourcetexturi if there is content in the 
	source xml file it processes the text content of the root element as raw text. 
	This is for simplier processing if desired. -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>
      <xsl:param name="seq"/>
      <xsl:param name="sourcetexturi" select="'file:///D:/All-SIL-PLB/WebMaster/Publishing/pub-svn/data/ifk/ifk-g01-04.txt'"/>
      <xsl:param name="sepvar2" select="'\t'"/>
      <xsl:param name="sepvar1" select="'\r\n'"/>
      <xsl:param name="sepvar0" select="'\r\n\r\n'"/>
      <xsl:param name="root" select="'table'"/>
      <xsl:param name="rootclass"/>
      <xsl:param name="group" select="'tr'"/>
      <xsl:param name="groupclass"/>
      <xsl:param name="data" select="'td'"/>
      <xsl:param name="dataclass" select="'td'"/>
      <xsl:template name="textlist2xml">
            <xsl:param name="text"/>
            <xsl:analyze-string select="$text" regex="{$sepvar0}">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:element name="{$root}">
                              <xsl:if test="$rootclass != ''">
                                    <xsl:attribute name="class">
                                          <xsl:value-of select="$rootclass"/>
                                    </xsl:attribute>
                              </xsl:if>
                              <xsl:analyze-string select="." regex="{$sepvar1}">
                                    <xsl:matching-substring/>
                                    <xsl:non-matching-substring>
                                          <xsl:element name="{$group}">
                                                <xsl:if test="$groupclass != ''">
                                                      <xsl:attribute name="class">
                                                            <xsl:value-of select="$groupclass"/>
                                                      </xsl:attribute>
                                                </xsl:if>
                                                <xsl:analyze-string select="." regex="{$sepvar2}">
                                                      <xsl:non-matching-substring>
                                                            <xsl:element name="{$data}">
                                                                  <xsl:if test="$dataclass != ''">
                                                                        <xsl:attribute name="class">
                                                                              <xsl:value-of select="$dataclass"/>
                                                                              <xsl:value-of select="(position() + 1) div 2"/>
                                                                        </xsl:attribute>
                                                                  </xsl:if>
                                                                  <xsl:value-of select="normalize-space(.)"/>
                                                            </xsl:element>
                                                      </xsl:non-matching-substring>
                                                      <xsl:matching-substring/>
                                                </xsl:analyze-string>
                                          </xsl:element>
                                    </xsl:non-matching-substring>
                              </xsl:analyze-string>
                        </xsl:element>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template match="/*">
            <xsl:choose>
                  <xsl:when test=". = ''">
                        <xsl:call-template name="textlist2xml">
                              <xsl:with-param name="text" select="unparsed-text($sourcetexturi)"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:call-template name="textlist2xml">
                              <xsl:with-param name="text" select="."/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
