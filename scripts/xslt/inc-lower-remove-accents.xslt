<?xml version="1.0" encoding="utf-8" standalone="no"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cite="http://fake.org.au/ns/">
      <xsl:param name="translateaccents" select="'yes'"/>
      <xsl:param name="customfind"/>
      <xsl:param name="customreplace"/>
      <xsl:param name="removechar"/>
 <!--     <xsl:param name="decchar2remove" select="'39 34'"/>
      <xsl:variable name="entities">
            <xsl:analyze-string select="$decchar2remove" regex="\s+">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:value-of select="concat('&#38;#',.,';')"/>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:variable> -->
      <xsl:variable name="ac" select="'àáâãāçèéêëēìíîïɨīùúûüūòóôõöōŏő'"/>
      <xsl:variable name="un" select="'aaaaaceeeeeiiiiiiuuuuuoooooooo'"/>
      <xsl:variable name="numbers" select="'0123456789'"/>
      <xsl:variable name="letters" select="'abcdefghijklmnopqrstuvwxyz'"/>
      <xsl:variable name="punct">&#34;<xsl:value-of select="$removechar" />-(“~[,‘;&#39;</xsl:variable>
      <xsl:function name="cite:lower-remove-accents">
            <xsl:param name="input"/>
            <xsl:choose>
                  <xsl:when test="$translateaccents = 'no'">
                        <xsl:choose>
                              <xsl:when test="$customfind != ''">
                                    <xsl:sequence select="translate(replace(lower-case(normalize-unicode($input)),$customfind,$customreplace),$punct,'')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:sequence select="translate(lower-case(normalize-unicode($input)),$punct,'')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:choose>
                              <xsl:when test="$customfind != ''">
                                    <xsl:sequence select="translate(translate(replace(lower-case(normalize-unicode($input)),$customfind,$customreplace),$punct,''),$ac,$un)"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:sequence select="translate(translate(lower-case(normalize-unicode($input)),$ac,$un),$punct,'')"/>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="cite:lower-remove-accents-word">
            <xsl:param name="input"/>
            <xsl:choose>
                  <xsl:when test="$translateaccents = 'no'">
                        <xsl:sequence select="translate(lower-case(normalize-unicode($input)),$punct,'')"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:sequence select="translate(translate(lower-case(normalize-unicode($input)),$ac,$un),$punct,'')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="cite:word-no-number">
            <xsl:param name="input"/>
            <xsl:sequence select="translate($input,$numbers,'')"/>
      </xsl:function>
      <xsl:function name="cite:hom-number">
            <xsl:param name="input"/>
            <xsl:sequence select="substring-after($input,translate($input,$numbers,''))"/>
      </xsl:function>
</xsl:stylesheet>
