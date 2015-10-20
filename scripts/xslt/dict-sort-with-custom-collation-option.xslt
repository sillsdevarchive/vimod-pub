<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/" xmlns:cite="http://fake.org.au/ns/" version="2.0" exclude-result-prefixes="cite">
      <!-- Part of the SILP Dictionary Creator
Used to sort a xml dictionary source form SIL Philippines SFM code. But could work with MDF sfm also.
See Inculde below for essential other files.
Written by Ian McQuay
Created: 5/08/2012
Modified: 21/08/2012

 -->
      <xsl:output method="xml" indent="yes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"/>
      <xsl:include href='dict-custom-collation.xslt'/>
      <xsl:include href="inc-lower-remove-accents.xslt"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project.xslt"/>
      <!-- project.xslt contains all the paramaters for this xslt
collationname 
secondarysort
 -->
      <xsl:variable name="default-collation" select="'http://saxon.sf.net/collation?lang=en-US;strength=primary'"/>
      <xsl:character-map name="xul">
            <xsl:output-character character="&#38;" string='&#38;'/>
      </xsl:character-map>
      <xsl:template match="/*">
            <data>
                  <xsl:choose>
                        <xsl:when test="$collationname != ''">
                              <xsl:comment select="concat('remove accent visual feedback &#10;',$ac,'&#10; Changed to &#10;',cite:lower-remove-accents($ac),'&#10;')"/>
                              <xsl:comment select="concat('custom sort = [',$customcollation,']')"/>
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
                              <xsl:comment select="concat('default sort &#10;',$ac,' ',$default-collation)"/>
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
