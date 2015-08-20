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
      <xsl:include href="project.xslt"/>
      <xsl:param name="pub-section-L" select="'xxxxxxx'"/>
      <xsl:param name="pub-section-R" select="'xxxxxxx'"/>
      <!-- <xsl:param name="page-height" select="'297mm'"/> -->
      <!-- <xsl:param name="page-width" select="'210mm'"/> -->
      <!-- <xsl:param name="page-margin-right" select="'20mm'"/> -->
      <!-- <xsl:param name="page-margin-left" select="'20mm'"/> -->
      <!-- <xsl:param name="page-margin-top" select="'20mm'"/> -->
      <!-- <xsl:param name="page-margin-bottom" select="'20mm'"/> -->
      <!-- <xsl:param name="binding-margin" select="'5mm'"/> -->
      <xsl:param name="body-column-count" select="2"/>
      <xsl:param name="initial-page-number" select="1"/>
      <!-- <xsl:param name="region-body-leftright-margin-top" select="'10mm'"/> -->
      <!-- <xsl:param name="region-body-firstleftright-margin-top" select="'10mm'"/> -->
      <!-- <xsl:param name="region-body-leftright-margin-bottom" select="'0mm'"/> -->
      <!-- <xsl:param name="region-body-firstleftright-margin-bottom" select="'0mm'"/> -->
      <!-- <xsl:param name="region-body-equalmargin-margin-top" select="'0mm'"/> -->
      <!-- <xsl:param name="region-body-equalmargin-margin-bottom" select="'0mm'"/> -->
      <!-- <xsl:param name="region-body-firstequalmargin-margin-top" select="'0mm'"/> -->
      <!-- <xsl:param name="region-body-firstequalmargin-margin-bottom" select="'0mm'"/> -->
      <!-- <xsl:param name="static-content-region-before-left-space-before" select="'2mm'"/> -->
      <!-- <xsl:param name="header-extent" select="'9mm'"/> -->
      <!-- <xsl:param name="footer-extent" select="'9mm'"/> -->
      <!-- <xsl:param name="page-types" select="'left-right'"/> -->
      <!-- options are: first right-left equal-margin blank title-->
      <!-- <xsl:param name="static-types" select="'header'"/> -->
      <!-- header footer first-header first-footer-->
      <xsl:param name="first-page-header"/>
      <!-- <xsl:variable name="first-page-header-fixed" select="replace($first-page-header,'- - -','&#x2013;')"/> -->
      <!-- <xsl:param name="static-types-first" select="'first'"/>      not used  -->
      <xsl:variable name="page-type" select="tokenize($page-types,' ')"/>
      <xsl:variable name="static-type" select="tokenize($static-types,' ')"/>
      <xsl:variable name="static-type-first" select="tokenize($static-types,' ')"/>
      <xsl:template match="/">
            <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:css="http://www.w3.org/1998/CSS" font-selection-strategy="character-by-character" line-height-shift-adjustment="disregard-shifts" country="8" font-family="serif" font-size="11pt" language="utf">
                  <fo:layout-master-set>
                        <fo:simple-page-master master-name="blank" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-right="{$page-margin-right}" margin-left="{$page-margin-left}" margin-bottom="{$page-margin-bottom}" margin-top="{$page-margin-top}">
                              <fo:region-body margin-top="0mm" margin-bottom="0mm" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}"/>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="left" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right} + {$binding-margin}">
                              <fo:region-body column-count="{$body-column-count}" margin-bottom="{$region-body-rightleft-margin-bottom}" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}" margin-top="{$region-body-rightleft-margin-top}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before-left" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after-left" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="right" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$body-column-count}" margin-bottom="{$region-body-rightleft-margin-bottom}" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}" margin-top="{$region-body-rightleft-margin-top}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before-right" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after-right" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="right-first" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$body-column-count}" margin-bottom="{$region-body-firstrightleft-margin-bottom}" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}" margin-top="{$region-body-firstrightleft-margin-top}"/>
                              <xsl:if test="$static-type-first = 'header' ">
                                    <fo:region-before region-name="first-header" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'first-footer' ">
                                    <fo:region-after region-name="first-footer" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="equal-margin" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$body-column-count}" margin-bottom="{$region-body-equalmargin-margin-bottom}" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}" margin-top="{$region-body-equalmargin-margin-top}"/>
                              <xsl:if test="$static-type = 'header' ">
                                    <fo:region-before region-name="region-before" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type = 'footer' ">
                                    <fo:region-after region-name="region-after" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="equal-margin-first" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left}" margin-right="{$page-margin-right}">
                              <fo:region-body column-count="{$body-column-count}" margin-bottom="{$region-body-firstequalmargin-margin-bottom}" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}" margin-top="{$region-body-firstequalmargin-margin-top}"/>
                              <xsl:if test="$static-type-first = 'header' ">
                                    <fo:region-before region-name="first-header" extent="{$header-extent}" display-align="before"/>
                              </xsl:if>
                              <xsl:if test="$static-type-first = 'footer' ">
                                    <fo:region-after region-name="first-footer" extent="{$footer-extent}" display-align="before"/>
                              </xsl:if>
                        </fo:simple-page-master>
                        <fo:simple-page-master master-name="title" writing-mode="{$writing-mode}" page-height="{$page-height}" page-width="{$page-width}" margin-top="{$page-margin-top}" margin-bottom="{$page-margin-bottom}" margin-left="{$page-margin-left} + {$binding-margin}" margin-right="{$page-margin-right}">
                              <fo:region-body margin-top="0mm" margin-bottom="0mm" margin-left="{$region-body-margin-left}" margin-right="{$region-body-margin-right}"/>
                        </fo:simple-page-master>
                        <fo:page-sequence-master master-name="document">
                              <fo:repeatable-page-master-alternatives>
                                    <xsl:if test="$page-type = 'first' and $page-type = 'right-left'">
                                          <fo:conditional-page-master-reference page-position="first" master-reference="right-first"/>
                                    </xsl:if>
                                    <!-- -->
                                    <xsl:if test="$page-type = 'right-left'">
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
                                          <fo:conditional-page-master-reference odd-or-even="odd" page-position="{$page-pos}" master-reference="right"/>
                                          <fo:conditional-page-master-reference odd-or-even="even" page-position="{$page-pos}" master-reference="left"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type = 'first' and $page-type = 'equalmargin'">
                                          <fo:conditional-page-master-reference page-position="first" master-reference="equalmargin-first"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type = 'equalmargin'">
                                          <fo:conditional-page-master-reference page-position="any" master-reference="equalmargin"/>
                                    </xsl:if>
                                    <xsl:if test="$page-type = 'blank'">
                                          <fo:conditional-page-master-reference blank-or-not-blank="blank" page-position="any" master-reference="blank"/>
                                    </xsl:if>
                              </fo:repeatable-page-master-alternatives>
                        </fo:page-sequence-master>
                  </fo:layout-master-set>
                  <fo:page-sequence format="1" initial-page-number="{$initial-page-number}" master-reference="document">
                        <xsl:call-template name="fop-static"/>
                        <!-- flow from csstoxslfo goes here -->
                        <xsl:copy-of select="/fo:root/fo:page-sequence/fo:flow[@flow-name = 'xsl-region-body']"/>
                  </fo:page-sequence>
            </fo:root>
      </xsl:template>
      <xsl:template name="fop-static">
            <xsl:if test="$page-type = 'right-left' and $static-type = 'header'">
                  <fo:static-content flow-name="region-before-left">
                        <fo:block space-before.conditionality="retain" space-before="{$static-content-region-before-space-before}">
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
                                                                  <xsl:value-of select="f:em-en($pub-section-L)"/>
                                                            </fo:inline>
                                                      </fo:block>
                                                </fo:table-cell>
                                          </fo:table-row>
                                    </fo:table-body>
                              </fo:table>
                        </fo:block>
                  </fo:static-content>
                  <fo:static-content flow-name="region-before-right">
                        <fo:block text-align="center" space-before.conditionality="retain" space-before="{$static-content-region-before-space-before}">
                              <fo:table table-layout="fixed" inline-progression-dimension="100%" border-bottom="solid 0.1mm black">
                                    <fo:table-column column-width="44%"/>
                                    <fo:table-column column-width="12%"/>
                                    <fo:table-column column-width="44%"/>
                                    <fo:table-body>
                                          <fo:table-row>
                                                <fo:table-cell>
                                                      <fo:block text-align="start">
                                                            <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                                                  <xsl:value-of select="f:em-en($pub-section-R)"/>
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
            <xsl:if test="$static-type = 'first-header'">
                  <fo:static-content flow-name="first-header">
                        <fo:block text-align="center" space-before="{$static-content-region-before-space-before}" border-bottom="solid 0.1mm black">
                              <fo:inline language="en" direction="ltr" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold" margin-left="0.0pt" padding-right="0.0pt" text-indent="0.0pt" margin-right="0pt">
                                    <xsl:value-of select="f:em-en($first-page-header)"/>
                              </fo:inline>
                        </fo:block>
                  </fo:static-content>
            </xsl:if>
            <xsl:if test="$static-type = 'first-footer'" >
                  <fo:static-content flow-name="first-footer" space-before="{$static-content-region-before-space-before}">
                        <fo:block text-align="center" font-family="'Times New Roman', serif" font-size="10.0pt" font-weight="bold">
                              <fo:page-number/>
                        </fo:block>
                  </fo:static-content>
            </xsl:if>
      </xsl:template>
<xsl:function name="f:em-en">
<xsl:param name="string"/>
<xsl:value-of select="replace(replace($string,'---','&#x2014;'),'--','&#x2013;')"/>
</xsl:function>
</xsl:stylesheet>
