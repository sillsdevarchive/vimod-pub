<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template name="A4-pageset">
                                      <fo:simple-page-master master-name="first" page-height="29.7cm" page-width="21cm" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="72pt">
                                          <fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
                                          <fo:region-after region-name="ra-right" extent="1cm"/>
                                    </fo:simple-page-master>
                                    <fo:simple-page-master master-name="left" page-height="29.7cm" page-width="21cm" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
                                          <fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
                                          <fo:region-before region-name="rb-left" extent="3cm"/>
                                          <fo:region-after region-name="ra-left" extent="1cm"/>
                                    </fo:simple-page-master>
                                    <fo:simple-page-master master-name="right" page-height="29.7cm" page-width="21cm" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
                                          <fo:region-body margin-top="1.5cm" margin-bottom="1.5cm"/>
                                          <fo:region-before region-name="rb-right" extent="3cm"/>
                                          <fo:region-after region-name="ra-right" extent="1cm"/>
                                    </fo:simple-page-master>
 </xsl:template>
</xsl:stylesheet>