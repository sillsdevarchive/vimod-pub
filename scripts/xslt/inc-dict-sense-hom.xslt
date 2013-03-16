<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:silp="silp.org.ph/ns" exclude-result-prefixes="xs silp">
      <xsl:param name="spacebeforehom"/>
      <xsl:template name="homsense">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($string,'\d\s\d$')">
                        <!-- determine if string ends in a number space number sequence
                        <xsl:text>T1m1</xsl:text> -->
                        <xsl:call-template name="homandsenseparse">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($string,'[^\d]\s\d$')">
                        <!-- determine if string ends in a non-number space number sequence
                        <xsl:text>T1m2</xsl:text> -->
                        <xsl:call-template name="test2homorsenseafterspace">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="matches($string,'[^\d]\d$')">
                        <!-- determine if string ends in a non-number space number sequence
                        <xsl:text>T1m3</xsl:text> -->
                        <xsl:call-template name="hom">
                              <!-- string does end in a number, test more -->
                              <xsl:with-param name="string" select="$string"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- string does not end in a number, return string
                        <xsl:text>T1m0</xsl:text> -->
                        <xsl:value-of select="$string"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="homandsenseparse">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="wordhom" select="substring($string,1,$len - 2)"/>
            <xsl:variable name="sensenumb" select="substring($string,$len,1)"/>
            <xsl:call-template name="hom">
                  <xsl:with-param name="string" select="$wordhom"/>
            </xsl:call-template>
            <xsl:call-template name="sense">
                  <xsl:with-param name="sense" select="$sensenumb"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template name="test2homorsenseafterspace">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="word" select="substring($string,1,$len - 2)"/>
            <xsl:variable name="lastnumb" select="substring($string,$len,1)"/>
            <xsl:choose>
                  <xsl:when test="$spacebeforehom = 'true'">
                        <!-- check if space before hom number param is set
                     <xsl:text>T2m1</xsl:text> -->
                        <xsl:call-template name="hom">
                              <!-- when space before hom number param is set, remove space -->
                              <xsl:with-param name="string" select="concat($word,$lastnumb)"/>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- when no space before hom number param is set, process as word and sense  <xsl:text>T2</xsl:text>-->
                        <xsl:value-of select="$word"/>
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="sense">
                              <xsl:with-param name="sense" select="$lastnumb"/>
                        </xsl:call-template>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="sense">
            <xsl:param name="sense"/>
            <xsl:element name="span">
                  <xsl:attribute name="class">
                        <xsl:text>sense</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="$sense"/>
            </xsl:element>
      </xsl:template>
      <xsl:template name="hom">
            <xsl:param name="string"/>
            <xsl:variable name="len" select="string-length($string)"/>
            <xsl:variable name="word" select="substring($string,1,$len - 1)"/>
            <xsl:variable name="homnumb" select="substring($string,$len,1)"/>
            <xsl:choose>
                  <xsl:when test="matches($string,'\d$')">
                        <xsl:value-of select="$word"/>
                        <span class="sub">
                              <xsl:value-of select="$homnumb"/>
                        </span>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
