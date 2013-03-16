<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/" xmlns:cite="http://fake.org.au/ns/" version="2.0" exclude-result-prefixes="cite">
      <!-- Part of the SILP Dictionary Creator
Used to sort a xml dictionary source form SIL Philippines SFM code. But could work with MDF sfm also.
See Inculde below for essential other files.
Written by Ian McQuay
Created: 5/08/2012
Modified: 21/08/2012

 -->
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
      <xsl:param name="collationname"/>
<xsl:param name="secondarysort"/>
      <xsl:include href='dict-custom-collation.xslt'/>
      <xsl:variable name="default-collation" select="'http://saxon.sf.net/collation?lang=en-US;strength=primary'"/>
      <xsl:include href="inc-lower-remove-accents.xslt"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:character-map name="xul">
            <xsl:output-character character="&#38;" string='&#38;'/>
      </xsl:character-map>
      <xsl:template match="/*">
            <data>
                  <xsl:choose>
                        <xsl:when test="$collationname != ''">
                              <xsl:text disable-output-escaping="yes">&lt;!-- Custom sort 
  </xsl:text>
                              <xsl:value-of select="$punct"/>
                              <xsl:text>
  </xsl:text>
                              <xsl:value-of select="$ac"/>
                              <xsl:text>
  </xsl:text>
                              <xsl:value-of select="cite:lower-remove-accents($ac)"/>
                              <xsl:text>
  </xsl:text>
                              <xsl:value-of select="$customcollation"/>
                              <xsl:text disable-output-escaping="yes">    --&gt;
</xsl:text>
                              <xsl:for-each select="lxGroup">
                                    <xsl:sort collation="http://saxon.sf.net/collation?rules={encode-for-uri($customcollation)}" select="cite:lower-remove-accents-word(cite:word-no-number(lx))"/>
                                    <xsl:sort collation="{$default-collation}" select="cite:hom-number(lx)"/>
                                    <xsl:sort collation="{$default-collation}" select="*[name() = $secondarysort]"/>
                                    <xsl:copy>
                                          <xsl:apply-templates/>
                                    </xsl:copy>
                              </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&lt;!-- otherwise </xsl:text>
                              <xsl:value-of select="$default-collation"/>
                              <xsl:text disable-output-escaping="yes">  --&gt;
</xsl:text>
                              <xsl:for-each select="lxGroup">
                                    <xsl:sort collation="{$default-collation}" select="cite:lower-remove-accents-word(lx)"/>
                                    <xsl:sort collation="{$default-collation}" select="*[name() = $secondarysort]"/>
                                    <xsl:copy>
                                          <xsl:apply-templates/>
                                    </xsl:copy>
                              </xsl:for-each>
                        </xsl:otherwise>
                  </xsl:choose>
            </data>
      </xsl:template>
</xsl:stylesheet>
