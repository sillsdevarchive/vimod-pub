<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/" xmlns:cite="http://fake.org.au/ns/" version="2.0">
      <!-- Part of the SILP Dictionary Creator
Used to sort a xml dictionary indexes.
See Inculde below for essential other files.
Written by Ian McQuay
Created: 5/08/2012
Modified: 21/08/2012

 -->
      <!-- made redundant by index-group-n-sort.xslt not hyphen not underscore. 2012-08-20 -->
      <xsl:output method="xml" indent="yes"/>
      <xsl:param name="collationname"/>
      <xsl:param name="groupingfield" select="'ie'"/>
      <xsl:param name="secondarysort" select="'lx'"/>
      <xsl:variable name="default-collation" select="'http://saxon.sf.net/collation?lang=en-US;strength=primary'"/>
      <xsl:include href='dict-custom-collation.xslt'/>
      <xsl:include href="inc-lower-remove-accents.xslt"/>
      <xsl:template match="/*">
            <data>
                  <xsl:choose>
                        <xsl:when test="$customcollation != ''">
                              <xsl:text disable-output-escaping="yes">&lt;!-- Custom sort &#10;          </xsl:text>
                              <xsl:value-of select="$ac"/>
                              <xsl:text>&#10;          </xsl:text>
                              <xsl:value-of select="cite:lower-remove-accents($ac)"/>
                              <xsl:text disable-output-escaping="yes">&#10;           --&gt;&#10;          </xsl:text>
                              <xsl:for-each-group select="record" group-by="substring(cite:lower-remove-accents(*[name() = $groupingfield]),1,1)">
                                    <xsl:sort select="cite:lower-remove-accents-word(ie)" collation="http://saxon.sf.net/collation?rules={encode-for-uri($customcollation)}"/>
                                    <xsl:element name="alpha">
                                          <xsl:attribute name="key">
                                                <xsl:choose>
                                                      <xsl:when test="substring(cite:lower-remove-accents-word(*[name() = $groupingfield]),1,2) = 'ng;'">
                                                            <xsl:text>ng</xsl:text>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <xsl:value-of select="substring(cite:lower-remove-accents(*[name() = $groupingfield]),1,1)"/>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                                <!-- <xsl:sequence select="substring(cite:lower-remove-accents(ie),1,1)" /> -->
                                          </xsl:attribute>
                                          <xsl:apply-templates select="current-group()">
                                                <xsl:sort collation="http://saxon.sf.net/collation?rules={encode-for-uri($customcollation)}" select="cite:lower-remove-accents-word(cite:word-no-number(*[name() = $groupingfield]))"/>
                                                <xsl:sort collation="{$default-collation}" select="cite:hom-number(*[name() = $groupingfield])"/>
                                                <xsl:sort collation="http://saxon.sf.net/collation?rules={encode-for-uri($customcollation)}" select="cite:lower-remove-accents-word(*[name() = $secondarysort])"/>
                                          </xsl:apply-templates>
                                    </xsl:element>
                              </xsl:for-each-group>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&#10;          &lt;!-- default sort &#10;          </xsl:text>
                              <xsl:value-of select="$ac"/>
                              <xsl:text>&#10;          Changed to&#10;          </xsl:text>
                              <xsl:value-of select="cite:lower-remove-accents($ac)"/>
                              <xsl:text>&#10;          </xsl:text>
                              <xsl:value-of select="$default-collation"/>
                              <xsl:text disable-output-escaping="yes">&#10;          --&gt;&#10;          </xsl:text>
                              <xsl:for-each-group select="record" group-by="substring(cite:lower-remove-accents(*[name() = $groupingfield]),1,1)">
                                    <xsl:sort select="substring(cite:lower-remove-accents(*[name() = $groupingfield]),1,1)"/>
                                    <xsl:element name="alpha">
                                          <xsl:attribute name="key">
                                                <xsl:sequence select="substring(cite:lower-remove-accents(ie),1,1)"/>
                                          </xsl:attribute>
                                          <xsl:apply-templates select="current-group()">
                                                <xsl:sort collation="{$default-collation}" select="cite:lower-remove-accents(*[name() = $groupingfield])"/>
                                                <xsl:sort collation="{$default-collation}" select="cite:lower-remove-accents(*[name() = $secondarysort])"/>
                                          </xsl:apply-templates>
                                    </xsl:element>
                              </xsl:for-each-group>
                        </xsl:otherwise>
                  </xsl:choose>
            </data>
      </xsl:template>
      <xsl:template match="*">
            <!--  <lower><xsl:value-of select="cite:lower-remove-accents(.)" /></lower> -->
            <xsl:element name="{name()}">
                  <xsl:apply-templates/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
