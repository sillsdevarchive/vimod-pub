<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template name="letter-first-left-right-pageset">
                                      <fo:simple-page-master master-name="first" column-count="{$columncount}"
                                      
                                      page-height="11in" page-width="8.5in" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
                                          <fo:region-body margin-bottom="50pt"/>
                                          <fo:region-after region-name="ra-right" extent="25pt"/>
                                    </fo:simple-page-master>
                                    <fo:simple-page-master master-name="left" column-count="{$columncount}" page-height="11in" page-width="8.5in" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
                                          <fo:region-body margin-top="50pt" margin-bottom="50pt"/>
                                          <fo:region-before region-name="rb-left" extent="25pt"/>
                                          <fo:region-after region-name="ra-left" extent="25pt"/>
                                    </fo:simple-page-master>
                                    <fo:simple-page-master master-name="right" column-count="{$columncount}" page-height="11in" page-width="8.5in" margin-right="72pt" margin-left="72pt" margin-bottom="36pt" margin-top="36pt">
                                          <fo:region-body margin-top="50pt" margin-bottom="50pt"/>
                                          <fo:region-before region-name="rb-right" extent="25pt"/>
                                          <fo:region-after region-name="ra-right" extent="25pt"/>
                                    </fo:simple-page-master>
 </xsl:template>
</xsl:stylesheet>