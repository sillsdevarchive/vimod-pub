<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <!-- page size -->
      <xsl:param name="title">Vagla-English Dictionary Draft</xsl:param>
      <xsl:param name="page-width">21cm</xsl:param>
      <xsl:param name="page-height">29.7cm</xsl:param>
      <xsl:param name="page-margin-top">1in</xsl:param>
      <xsl:param name="page-margin-bottom">1in</xsl:param>
      <xsl:param name="page-margin-left">1in</xsl:param>
      <xsl:param name="page-margin-right">1in</xsl:param>
      <!-- page header and footer -->
      <xsl:param name="page-header-margin">0.5in</xsl:param>
      <xsl:param name="page-footer-margin">0.5in</xsl:param>
      <xsl:param name="title-print-in-header">true</xsl:param>
      <xsl:param name="page-number-print-in-footer">true</xsl:param>
      <!-- multi column -->
      <xsl:param name="column-count">2</xsl:param>
      <xsl:param name="column-gap">12pt</xsl:param>
      <xsl:param name="default-font-size">12pt</xsl:param>
      <xsl:param name="default-font-family">Charis SIL</xsl:param>
      <!-- writing-mode: lr-tb | rl-tb | tb-rl -->
      <xsl:param name="writing-mode">lr-tb</xsl:param>
      <!-- text-align: justify | start -->
      <xsl:param name="text-align">start</xsl:param>
      <!-- hyphenate: true | false -->
      <xsl:param name="hyphenate">false</xsl:param>
      <xsl:attribute-set name="normal">
            <xsl:attribute name="font-size"><xsl:value-of select="$default-font-size"/></xsl:attribute>
            <xsl:attribute name="font-family"><xsl:value-of select="$default-font-family"/></xsl:attribute>
      </xsl:attribute-set>
      <xsl:attribute-set use-attribute-sets="normal" name="root">
            <xsl:attribute name="writing-mode">
                  <xsl:value-of select="$writing-mode"/>
            </xsl:attribute>
            <xsl:attribute name="hyphenate">
                  <xsl:value-of select="$hyphenate"/>
            </xsl:attribute>
            <xsl:attribute name="text-align">
                  <xsl:value-of select="$text-align"/>
            </xsl:attribute>
            <!-- specified on fo:root to change the properties' initial values -->
      </xsl:attribute-set>
      <xsl:attribute-set use-attribute-sets="normal" name="page">
            <xsl:attribute name="page-width">
                  <xsl:value-of select="$page-width"/>
            </xsl:attribute>
            <xsl:attribute name="page-height">
                  <xsl:value-of select="$page-height"/>
            </xsl:attribute>
            <!-- specified on fo:simple-page-master -->
      </xsl:attribute-set>
      <xsl:attribute-set use-attribute-sets="normal" name="body">
        <!-- specified on fo:flow's only child fo:block -->
    </xsl:attribute-set>
      <xsl:attribute-set use-attribute-sets="normal" name="page-header">
            <!-- specified on (page-header)fo:static-content's only child fo:block -->
            <xsl:attribute name="font-size">11pt</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
      </xsl:attribute-set>
      <xsl:attribute-set use-attribute-sets="normal" name="page-footer">
            <!-- specified on (page-footer)fo:static-content's only child fo:block -->
            <xsl:attribute name="font-size">small</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
      </xsl:attribute-set>
      <xsl:template match="/">
            <fo:root xsl:use-attribute-sets="root">
                  <xsl:call-template name="make-layout-master-set"/>
                  <fo:page-sequence master-reference="all-pages">
                        <fo:title>
                              <xsl:value-of select="$title"/>
                        </fo:title>
                        <fo:static-content flow-name="page-header">
                              <fo:block space-before.conditionality="retain" space-before="{$page-header-margin}" xsl:use-attribute-sets="page-header">
                                    <fo:table table-layout="fixed" inline-progression-dimension="100%">
                                          <fo:table-column column-width="50%"/>
                                          <fo:table-column column-width="50%"/>
                                          <fo:table-body>
                                                <fo:table-row>
                                                      <fo:table-cell>
                                                            <fo:block text-align="start">
                                                                  <fo:retrieve-marker retrieve-class-name="lexeme" retrieve-position="first-starting-within-page" retrieve-boundary="page"/>
                                                            </fo:block>
                                                      </fo:table-cell>
                                                      <fo:table-cell>
                                                            <fo:block text-align="end">
                                                                  <fo:retrieve-marker retrieve-class-name="lexeme" retrieve-position="last-starting-within-page" retrieve-boundary="page"/>
                                                            </fo:block>
                                                      </fo:table-cell>
                                                </fo:table-row>
                                          </fo:table-body>
                                    </fo:table>
                              </fo:block>
                        </fo:static-content>
                        <!--     <fo:static-content flow-name="page-header">
                        <fo:block space-before.conditionality="retain" space-before="{$page-header-margin}" xsl:use-attribute-sets="page-header">
                              <fo:retrieve-marker retrieve-class-name="lexeme" retrieve-position="first-starting-within-page" retrieve-boundary="page"/>
                        </fo:block>
                  </fo:static-content> -->
                        <fo:static-content flow-name="page-footer">
                              <fo:block space-after.conditionality="retain" space-after="{$page-footer-margin}" xsl:use-attribute-sets="page-footer">
                                    <xsl:text>- </xsl:text>
                                    <fo:page-number/>
                                    <xsl:text> -</xsl:text>
                              </fo:block>
                        </fo:static-content>
                        <fo:flow flow-name="xsl-region-body">
                              <fo:block xsl:use-attribute-sets="body">
                                    <!--  <xsl:call-template name="process-common-attributes"/> -->
                                    <xsl:apply-templates/>
                              </fo:block>
                        </fo:flow>
                  </fo:page-sequence>
            </fo:root>
      </xsl:template>
      <xsl:template name="make-layout-master-set">
            <fo:layout-master-set>
                  <fo:simple-page-master master-name="all-pages" xsl:use-attribute-sets="page">
                        <fo:region-body margin-top="{$page-margin-top}" margin-right="{$page-margin-right}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" column-count="{$column-count}" column-gap="{$column-gap}"/>
                        <!-- $writing-mode = 'lr-tb' -->
                        <fo:region-before region-name="page-header" extent="{$page-margin-top}" display-align="before"/>
                        <fo:region-after region-name="page-footer" extent="{$page-margin-bottom}" display-align="after"/>
                        <fo:region-start extent="{$page-margin-left}"/>
                        <fo:region-end extent="{$page-margin-bottom}"/>
                  </fo:simple-page-master>
            </fo:layout-master-set>
      </xsl:template>
</xsl:stylesheet>
