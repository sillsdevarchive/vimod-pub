<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
      <!-- Part of the SILP Dictionary Creator
To to split node text into separate nodes based on a spliting string (default=, )
Created by Ian McQuay 
Created 2012-06-14

the following is sample input xml data:
<database>
<lxGroup><ie>meaning1; meaning2; meaning3; meaning4</ie></lxGroup>
</database>
-->
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="separatorstring" select="';'"/>
      <xsl:param name="elementstosplit"/>
      <xsl:variable name="control">
            <xsl:call-template name="list2xml">
                  <xsl:with-param name="text" select="$elementstosplit"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:include href='inc-list2xml.xslt'/>
      <!-- Template used to copy a generic node -->
      <xsl:include href='inc-copy-anything.xslt'/>
      <!-- Template used to select data to split-->
      <xsl:template match="*[local-name() = $control/element]">
            <xsl:call-template name="subsplit">
                  <xsl:with-param name="name" select="name()"/>
                  <xsl:with-param name="field">
                        <xsl:value-of select="."/>
                  </xsl:with-param>
            </xsl:call-template>
      </xsl:template>
      <xsl:template name="subsplit">
            <!-- Named Template used to split node data on $separatorstring-->
            <xsl:param name="field"/>
            <xsl:param name="name"/>
            <xsl:variable name="pre" select="substring-before($field, $separatorstring)"/>
            <xsl:variable name="post" select="substring-after($field, $separatorstring )"/>
            <xsl:choose>
                  <xsl:when test="contains($field, $separatorstring )">
                        <xsl:element name="{name()}">
                              <xsl:value-of select="normalize-space($pre)"/>
                        </xsl:element>
                        <xsl:choose>
                              <xsl:when test="contains($post, $separatorstring )">
                                    <xsl:call-template name="subsplit">
                                          <xsl:with-param name="field">
                                                <xsl:value-of select="$post"/>
                                          </xsl:with-param>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:element name="{name()}">
                                          <xsl:value-of select="normalize-space($post)"/>
                                    </xsl:element>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:element name="{name()}">
                              <xsl:value-of select="normalize-space($field)"/>
                        </xsl:element>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
