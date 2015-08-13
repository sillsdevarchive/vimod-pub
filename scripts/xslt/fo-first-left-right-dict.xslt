<?xml version="1.0" encoding="UTF-8"?>
<!--
    #############################################################
    # Name:         fo-first-left-right.xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="no"/>
      <!--<xsl:include href="project.xslt"/> -->
      <xsl:param name="pub-section-L" select="'Kamus'"/>
      <xsl:param name="pub-section-R" select="'Kamus'"/>
      <xsl:param name="page-height" select="'297mm'"/>
      <xsl:param name="page-width" select="'210mm'"/>
      <xsl:param name="page-margin-right" select="'20mm'"/>
      <xsl:param name="page-margin-left" select="'20mm'"/>
      <xsl:param name="page-margin-top" select="'20mm'"/>
      <xsl:param name="page-margin-bottom" select="'20mm'"/>
      <xsl:param name="binding-margin" select="'5mm'"/>
      <xsl:param name="column-count-body" select="2"/>
      <xsl:param name="initial-page-number" select="1"/>
      <xsl:param name="regb-oe-mt" select="'10mm'"/>
      <xsl:param name="regb-oef-mt" select="'10mm'"/>
      <xsl:param name="regb-oe-mb" select="'0mm'"/>
      <xsl:param name="regb-oef-mb" select="'0mm'"/>
      <xsl:param name="regb-oneside-mt" select="'0mm'"/>
      <xsl:param name="regb-oneside-mb" select="'0mm'"/>
      <xsl:param name="regb-onesidef-mt" select="'0mm'"/>
      <xsl:param name="regb-onesidef-mb" select="'0mm'"/>
      <xsl:param name="sc-rb-sb" select="'2mm'"/>
      <xsl:param name="header-extent" select="'9mm'"/>
      <xsl:param name="footer-extent" select="'9mm'"/>
      <xsl:param name="page-types" select="'odd-even'"/>
      <!-- first odd-even blank title-->
      <xsl:param name="static-types" select="'header'"/>
      <!-- header footer -->
      <xsl:param name="static-types-first" select="'first'"/>
      <xsl:variable name="page-type" select="tokenize($page-types,' ')"/>
      <xsl:variable name="static-type" select="tokenize($static-types,' ')"/>
      <xsl:variable name="static-type-first" select="tokenize($static-types,' ')"/>
      <xsl:template match="/">
            <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:css="http://www.w3.org/1998/CSS" font-selection-strategy="character-by-character" line-height-shift-adjustment="disregard-shifts" country="8" font-family="serif" font-size="11pt" language="utf">
                  <fo:layout-master-set>
                        <fo:simple-page-master master-name="blank" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-right="{$page-margin-right}" margin-left="{$page-margin-left}" margin-bottom="{$page-margin-bottom}" margin-top="{$page-margin-top}">
                              <fo:region-body margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm"/>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="even" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right} + {$binding-margin}">
                              <fo:region-body column-count="{$column-count-body}" margin-bottom="{$regb-oe-mb}" margin-left="0mm" margin-right="0mm" margin-top="{$regb-oe-mt}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before-even" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after-even" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="odd" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$column-count-body}" margin-bottom="{$regb-oe-mb}" margin-left="0mm" margin-right="0mm" margin-top="{$regb-oe-mt}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before-odd" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after-odd" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="odd-first" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$column-count-body}" margin-bottom="{$regb-oef-mb}" margin-left="0mm" margin-right="0mm" margin-top="{$regb-oef-mt}"/>
                              <xsl:if test="$static-type-first = 'header' ">
                                    <fo:region-before region-name="region-before-odd" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type-first = 'footer' ">
                                    <fo:region-after region-name="region-after-odd" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="onesided" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$column-count-body}" margin-bottom="{$regb-oneside-mb}" margin-left="0mm" margin-right="0mm" margin-top="{$regb-oneside-mt}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="onesided-first" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$column-count-body}" margin-bottom="{$regb-onesidef-mb}" margin-left="0mm" margin-right="0mm" margin-top="{$regb-onesidef-mt}"/>
                              <xsl:if test="$static-type-first = 'header' ">
                                    <fo:region-before region-name="region-before" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type-first = 'footer' ">
                                    <fo:region-after region-name="region-after" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="title" writing-mode="lr-tb" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body margin-top="0mm" margin-bottom="0mm" margin-left="0mm" margin-right="0mm"/>
                        </fo:simple-page-master>
                        <fo:page-sequence-master master-name="document">
                              <fo:repeatable-page-master-alternatives>
                                    <xsl:if test="$page-type = 'first' and $page-type = 'odd-even'">
                                          <fo:conditional-page-master-reference page-position="first" master-reference="odd-first"/>
                                    </xsl:if>
                                    <!-- -->
                                    <xsl:if test="$page-type = 'odd-even'">
                                          <xsl:variable name="page-pos">
                                                <xsl:choose>
                                                      <xsl:when test="$page-type = 'first'">
                                                            <xsl:text>rest</xsl:text>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                            <xsl:text>any</xsl:text>
                                                      </xsl:otherwise>
                                                </xsl:choose>
                                          </xsl:variable>
                                          <fo:conditional-page-master-reference odd-or-even="odd" page-position="{$page-pos}" master-reference="odd"/>
                                          <fo:conditional-page-master-reference odd-or-even="even" page-position="{$page-pos}" master-reference="even"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type = 'first' and $page-type ne 'odd-even'">
                                          <fo:conditional-page-master-reference page-position="first" master-reference="onesided-first"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type ne 'odd-even'">
                                          <fo:conditional-page-master-reference page-position="any" master-reference="onesided"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type = 'blank'">
                                          <fo:conditional-page-master-reference blank-or-not-blank="blank" page-position="any" master-reference="blank"/>
                                    </xsl:if>
                              </fo:repeatable-page-master-alternatives>
                        </fo:page-sequence-master>
                  </fo:layout-master-set>
                  <fo:page-sequence format="1" initial-page-number="{$initial-page-number}" master-reference="document">
                        <xsl:if test="$page-type = 'odd-even'">
                              <fo:static-content flow-name="region-before-even">
                                    <fo:block text-align="center" space-before.conditionality="retain" space-before="{$sc-rb-sb}">
                                          <fo:table table-layout="fixed" inline-progression-dimension="100%" border-bottom="solid 0.1mm black">
                                                <fo:table-column column-width="44%"/>
                                                <fo:table-column column-width="12%"/>
                                                <fo:table-column column-width="44%"/>
                                                <fo:table-body>
                                                      <fo:table-row>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="start">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <fo:retrieve-marker retrieve-class-name="guideword" retrieve-position="first-starting-within-page" retrieve-boundary="page"/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="center">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <fo:page-number/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="end">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <xsl:value-of select="$pub-section-L"/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                      </fo:table-row>
                                                </fo:table-body>
                                          </fo:table>
                                    </fo:block>
                              </fo:static-content>
                              <fo:static-content flow-name="region-before-odd">
                                    <fo:block text-align="center" space-before.conditionality="retain" space-before="{$sc-rb-sb}">
                                          <fo:table table-layout="fixed" inline-progression-dimension="100%" border-bottom="solid 0.1mm black">
                                                <fo:table-column column-width="44%"/>
                                                <fo:table-column column-width="12%"/>
                                                <fo:table-column column-width="44%"/>
                                                <fo:table-body>
                                                      <fo:table-row>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="start">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <xsl:value-of select="$pub-section-R"/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="center">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <fo:page-number/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                            <fo:table-cell>
                                                                  <fo:block text-align="end">
                                                                        <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                              <fo:retrieve-marker retrieve-class-name="guideword" retrieve-position="last-starting-within-page" retrieve-boundary="page"/>
                                                                        </fo:inline>
                                                                  </fo:block>
                                                            </fo:table-cell>
                                                      </fo:table-row>
                                                </fo:table-body>
                                          </fo:table>
                                    </fo:block>     
                              </fo:static-content>
                        </xsl:if>
                        <!-- <fo:static-content flow-name="xsl-region-after-odd-first">
                              <fo:block text-align="center"><fo:page-number/></fo:block>
                        </fo:static-content> -->
                        <!-- goes here -->
                        <xsl:copy-of select="/fo:root/fo:page-sequence/fo:flow[@flow-name = 'xsl-region-body']"/>
                  </fo:page-sequence>
            </fo:root>
      </xsl:template>
</xsl:stylesheet>
