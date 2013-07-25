<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gen="dummy-namespace-for-the-generated-xslt">
      <!-- 
Simple text to XML importer
This imports a mimimally formatted text and converts to  an attribute-set.
usage:
java  -jar "saxon9.jar"   -o "output.xml" "sfm2xml-simple.xslt" "sfm2xml-simple.xslt" sourcetexturi="file:///path/source.sfm"

Written by Ian McQuay
Created 2013-03-30

-->
      <xsl:output method="xml" indent="yes" version="1.0" encoding="utf-8"/>
      <xsl:namespace-alias stylesheet-prefix="gen" result-prefix="xsl"/>
      <xsl:param name="sourcetexturi"/>
      <xsl:variable name="string" select="replace(unparsed-text($sourcetexturi),'\r','')"/>
      <xsl:template match="/">
            <gen:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                  <xsl:analyze-string select="$string" regex="\n-">
                        <!-- split on newline followed by -, add a space to the end of every line so every empty sfm can be found -->
                        <xsl:matching-substring/>
                        <xsl:non-matching-substring>
                              <xsl:call-template name="group">
                                    <xsl:with-param name="gname" select="substring-before(.,'&#10;')"/>
                                    <xsl:with-param name="altname" select="."/>
                                    <xsl:with-param name="text" select="substring-after(.,'&#10;')"/>
                              </xsl:call-template>
                        </xsl:non-matching-substring>
                  </xsl:analyze-string>
            </gen:stylesheet>
      </xsl:template>
      <xsl:template name="group">
            <xsl:param name="gname"/>
            <xsl:param name="altname"/>
            <xsl:param name="text"/>
            <xsl:variable name="attname" select="concat(translate(substring($gname,1,1),'-',''),substring($gname,2))"/>
            <xsl:choose>
                  <xsl:when test="$gname = ''">
                        <gen:attribute-set name="{$altname}" use-attribute-sets="common"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <gen:attribute-set name="{$attname}" use-attribute-sets="common">
                              <xsl:analyze-string select="$text" regex="\n">
                                    <xsl:matching-substring/>
                                    <xsl:non-matching-substring>
                                          <gen:attribute name="{substring-before(.,':')}">
                                                <xsl:value-of select="substring-after(.,':')"/>
                                          </gen:attribute>
                                    </xsl:non-matching-substring>
                              </xsl:analyze-string>
                        </gen:attribute-set>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
