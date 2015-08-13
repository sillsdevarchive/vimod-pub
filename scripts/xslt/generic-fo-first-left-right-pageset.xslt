<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="letter-first-left-right-pageset">
            <fo:simple-page-master master-name="first" column-count="{$column-count}" page-height="{$page-height}" page-width="{$page-width}" margin-right="{$margin-right}" margin-left="{$margin-left}" margin-bottom="{$margin-bottom}" margin-top="{$margin-top}">
                  <fo:region-body margin-bottom="50pt"/>
                  <fo:region-after region-name="ra-right" extent="25pt"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="left" column-count="{$columncount}" page-height="{$page-height}" page-width="{$page-width}" margin-right="{$margin-right}" margin-left="{$margin-left}" margin-bottom="{$margin-bottom}" margin-top="{$margin-top}">
                  <fo:region-body margin-top="50pt" margin-bottom="50pt"/>
                  <fo:region-before region-name="rb-left" extent="25pt"/>
                  <fo:region-after region-name="ra-left" extent="25pt"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="right" column-count="{$columncount}" page-height="{$page-height}" page-width="{$page-width}" margin-right="{$margin-right}" margin-left="{$margin-left}" margin-bottom="{$margin-bottom}" margin-top="{$margin-top}">
                  <fo:region-body margin-top="50pt" margin-bottom="50pt"/>
                  <fo:region-before region-name="rb-right" extent="25pt"/>
                  <fo:region-after region-name="ra-right" extent="25pt"/>
            </fo:simple-page-master>
      </xsl:template>
</xsl:stylesheet>
