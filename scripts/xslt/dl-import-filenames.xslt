<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
      <xsl:param name="sourcepath"/>
      <xsl:param name="webpath"/>
      <xsl:param name="dlgroup"/>
      <xsl:include href='inc-import-textlist.xslt'/>
      <xsl:template name="firstparse">
            <xsl:param name="line"/>
            <xsl:variable name="iso" select="substring-before($line,'_')"/>
            <xsl:variable name="newname" select="replace(replace(replace($line,' ','_'),',',''),'\(.+\)','')"/>
            <xsl:variable name="title" select="replace(replace(replace(.,$iso + '_',''),', \d\d\d\d\.pdf',''),'_\(B&amp;W\)','')"/>
            <xsl:variable name="dlid" select="concat(current-date(),position())"/>
            <xsl:call-template name="dlitem">
                  <xsl:with-param name="iso" select="$iso"/>
                  <xsl:with-param name="newname" select="$newname"/>
                  <xsl:with-param name="dlid" select="$dlid"/>
                  <xsl:with-param name="engtitle" select="substring-before(substring-after($line,'('),')')"/>
            </xsl:call-template>
            <xsl:call-template name="dlsize">
                  <xsl:with-param name="iso" select="$iso"/>
                  <xsl:with-param name="newname" select="$newname"/>
                  <xsl:with-param name="dlid" select="$dlid"/>
                  <xsl:with-param name="engtitle" select="substring-before(substring-after($line,'('),')')"/>
            </xsl:call-template>
            <xsl:call-template name="dlgroup">
                  <xsl:with-param name="iso" select="$iso"/>
                  <xsl:with-param name="newname" select="$newname"/>
                  <xsl:with-param name="dlid" select="$dlid"/>
                  <xsl:with-param name="engtitle" select="substring-before(substring-after($line,'('),')')"/>
                  <xsl:with-param name="pubyear" select="replace($line,'^.+(\d\d\d\d).+','$1')"/>
            </xsl:call-template>
      </xsl:template>
      <xsl:template name="dlitem">
            <xsl:param name="iso"/>
            <xsl:param name="newname"/>
            <xsl:param name="dlid"/>
            <xsl:param name="engtitle"/>
            <xsl:param name="pubyear"/>
            <DL_Items>
                  <VerTitle>
                        <xsl:value-of select="$newname"/>
                  </VerTitle>
                  <DLid>
                        <xsl:value-of select="$dlid"/>
                  </DLid>
                  <EngTitle>
                        <xsl:value-of select="$engtitle"/>
                  </EngTitle>
                  <PubYear>
                        <xsl:value-of select="$pubyear"/>
                  </PubYear>
                  <path>
                        <xsl:value-of select="$webpath"/>
                  </path>
                  <File>
                        <xsl:value-of select="$newname"/>
                  </File>
                  <Include>-1</Include>
                  <PutOnWeb>
                        <xsl:value-of select="current-date()"/>
                  </PutOnWeb>
            </DL_Items>
      </xsl:template>
      <xsl:template name="dlsize">
            <xsl:param name="iso"/>
            <xsl:param name="newname"/>
            <xsl:param name="dlid"/>
            <xsl:param name="engtitle"/>
            <xsl:param name="pubyear"/>
            <FileSize>
                  <Size></Size>
                  <File>
                        <xsl:value-of select="$newname"/>
                  </File>
            </FileSize>
      </xsl:template>
      <xsl:template name="dlgroup">
            <xsl:param name="iso"/>
            <xsl:param name="newname"/>
            <xsl:param name="dlid"/>
            <xsl:param name="engtitle"/>
            <xsl:param name="pubyear"/>
            <dl_groups>
                  <DLid>
                        <xsl:value-of select="$dlid"/>
                  </DLid>
                  <iso>
                        <xsl:value-of select="$iso"/>
                  </iso>
                  <DLgroup>
                        <xsl:value-of select="$dlgroup"/>
                  </DLgroup>
            </dl_groups>
      </xsl:template>
</xsl:stylesheet>
