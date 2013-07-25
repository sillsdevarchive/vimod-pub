<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
       <!-- ============================================
    This template creates the table of contents.  
    It indents each entry according to the heading
    level (<h1> isn't indented, <h2> is indented 
    1 cm, etc.).  We insert the title of each
    section as a link, put a leader of dots, then 
    the page number.  Notice that we generate an
    id for the heading if it doesn't have one
    already; this is done with the XSLT generate-id()
    function. 
    =============================================== -->
      <xsl:template name="toc">
            <fo:block>
                  <fo:leader leader-pattern="rule" space-after="18pt" leader-length.maximum="100%" leader-length.optimum="100%"/>
            </fo:block>
            <fo:block space-after="12pt" id="TableOfContents" line-height="21pt" font-size="18pt" text-align="start">
      Table of Contents
    </fo:block>
            <fo:block line-height="11pt" font-size="8pt" space-after="6pt">
      If you're viewing this document online, you can 
      click any of the topics below to link directly to 
      that section.
    </fo:block>
            <xsl:for-each select="/html/body//h1 |
                          /html/body//h2 | 
                          /html/body//h3 |
                          /html/body//h4">
                  <fo:block text-align-last="justify" line-height="17pt" font-size="14pt" space-after="3pt" text-align="start" text-indent="-1cm">
                        <xsl:attribute name="start-indent">
                              <xsl:choose>
                                    <xsl:when test="name() = 'h1'">
                                          <xsl:text>1cm</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="name() = 'h2'">
                                          <xsl:text>1.5cm</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="name() = 'h3'">
                                          <xsl:text>2cm</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="name() = 'h4'">
                                          <xsl:text>2.5cm</xsl:text>
                                    </xsl:when>
                              </xsl:choose>
                        </xsl:attribute>
                        <fo:basic-link color="blue">
                              <xsl:attribute name="internal-destination">
                                    <xsl:choose>
                                          <xsl:when test="@id">
                                                <xsl:value-of select="@id"/>
                                          </xsl:when>
                                          <xsl:when test="name(preceding-sibling::*[1]) = 'a' and
                              preceding-sibling::*[1][@name]">
                                                <xsl:value-of select="preceding-sibling::*[1]/@name"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="generate-id()"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                              <xsl:apply-templates select="*|text()"/>
                        </fo:basic-link>
                        <fo:leader leader-pattern="dots" leader-pattern-width="5pt" leader-length.maximum="100%" leader-length.optimum="100%"/>
                        <fo:page-number-citation>
                              <xsl:attribute name="ref-id">
                                    <xsl:choose>
                                          <xsl:when test="@id">
                                                <xsl:value-of select="@id"/>
                                          </xsl:when>
                                          <xsl:when test="name(preceding-sibling::*[1]) = 'a' and
                              preceding-sibling::*[1][@name]">
                                                <xsl:value-of select="preceding-sibling::*[1]/@name"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="generate-id()"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                        </fo:page-number-citation>
                  </fo:block>
            </xsl:for-each>
      </xsl:template>
</xsl:stylesheet>