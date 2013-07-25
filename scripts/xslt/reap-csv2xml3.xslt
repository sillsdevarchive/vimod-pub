<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" omit-xml-declaration="yes" use-character-maps="silp"/>
      <xsl:character-map name="silp">
            <xsl:output-character character="&#161;" string='&#13;&#10;'/>
      </xsl:character-map>
      <xsl:param name="sourcetexturi1"/>
      <xsl:param name="sourcetexturi2"/>
      <xsl:param name="sourcetexturi3"/>
      <xsl:param name="group" select="'metadata'"/>
      <xsl:variable name="csv1" select="unparsed-text($sourcetexturi1)"/>
      <xsl:variable name="csv2" select="unparsed-text($sourcetexturi2)"/>
      <xsl:variable name="csv3" select="unparsed-text($sourcetexturi3)"/>
      <xsl:template match="/">
            <database>
                  <!-- <xsl:call-template name="param-check"/>  -->
                  <xsl:call-template name="parsecss">
                        <xsl:with-param name="csv" select="$csv1"/>
                  </xsl:call-template>
                  <xsl:call-template name="parsecss">
                        <xsl:with-param name="csv" select="$csv2"/>
                  </xsl:call-template>
                  <xsl:call-template name="parsecss">
                        <xsl:with-param name="csv" select="$csv3"/>
                  </xsl:call-template>
            </database>
      </xsl:template>
      <xsl:template name="parsecss">
            <xsl:param name="csv"/>
            <xsl:variable name="data0" select="substring-after($csv,'&#13;&#10;')"/>
            <!-- remove cr Lf combo and keep only cr to be different to line ends -->
            <xsl:variable name="data00" select="replace($data0,'&#13;&#10;','&#182;')"/>
            <!-- insert quote marks and space to as place holder -->
            <xsl:variable name="data1" select="replace($data0,',,',',&#34;null&#34;,')"/>
            <!-- insert quote marks and space to as place holder again to be sure -->
            <xsl:variable name="data2" select="replace($data1,',,',',&#34;null&#34;,')"/>
            <!-- hold end of line place if possible -->
            <xsl:variable name="data3" select="replace($data2,',&#13;&#10;',',&#34;null&#13;&#10;')"/>
            <!-- remove quote at beginning of the whole string -->
            <xsl:variable name="data4" select="replace($data3,'^&#34;','')"/>
<!-- now remove quote at beginning of each line ie LF character -->
            <xsl:variable name="data5" select="replace($data4,'&#13;&#10;&#34;','&#13;&#10;')"/>
<!-- remove token placed by cct with another token d161 that can be converted back to CR LF by character-map translation --> 
<xsl:variable name="data" select="replace($data5,'\\n ','&#161;')"/>
            <!-- get the first line containing labels-->
            <xsl:variable name="labels" select="substring-before($csv,'&#13;&#10;')"/>
            <!-- breakup labels by commas -->
            <xsl:variable name="label" select="tokenize($labels, ',')"/>
            <!-- get the data after the first line -->
            <xsl:analyze-string select="$data" regex="&#13;&#10;">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:variable name="reapid" select="substring-before(.,'&#34;,&#34;')"/>
                        <xsl:analyze-string select="." regex="&#34;,&#34;">
                              <xsl:matching-substring/>
                              <xsl:non-matching-substring>
                                    <xsl:variable name="pos" select="(position()+1) div 2"/>
                                    <xsl:if test=". != 'null'">
                                          <xsl:element name="{$group}">
                                                <reapid>
                                                      <xsl:value-of select="$reapid"/>
                                                </reapid>
                                                <label>
                                                      <xsl:value-of select="$label[$pos]"/>
                                                </label>
                                                <xsl:element name="data">
                                                      <xsl:value-of select="."/>
                                                </xsl:element>
                                          </xsl:element>
                                    </xsl:if>
                              </xsl:non-matching-substring>
                        </xsl:analyze-string>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="param-check">
            <xsl:value-of select="substring($csv1,1,500)"/>
            <xsl:text>&#13;&#10;</xsl:text>
            <xsl:value-of select="substring($csv2,1,500)"/>
            <xsl:text>&#13;&#10;</xsl:text>
            <xsl:value-of select="substring($csv3,1,500)"/>
      </xsl:template>
</xsl:stylesheet>
