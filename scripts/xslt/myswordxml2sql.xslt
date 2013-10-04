<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:strip-space elements="*"/>
      <xsl:output method="text"/>
      <xsl:param name="title"/>
      <xsl:param name="abbrev"/>
      <xsl:param name="commenttextfile"/>
      <xsl:param name="versionnumb"/>
      <xsl:param name="versiondate" select="current-dateTime()"/>
      <xsl:param name="publicationdate"/>
      <xsl:param name="rtl" select="0"/>
      <xsl:param name="ot" select="0"/>
      <xsl:param name="nt" select="1"/>
      <xsl:param name="strongno" select="0"/>
      <xsl:variable name="commenttextfileuri" select="f:file2uri($commenttextfile)"/>
      <xsl:variable name="commenttext" select="unparsed-text($commenttextfileuri)"/>
      <xsl:variable name="comma" select="','"/>
      <xsl:variable name="sqlsep">
            <xsl:text>','</xsl:text>
      </xsl:variable>
      <xsl:variable name="apos">
            <xsl:text>'</xsl:text>
      </xsl:variable>
      <xsl:template match="/*">
            <xsl:text>PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Bible(Book INT, Chapter INT, Verse INT, Scripture TEXT, Primary Key(Book,Chapter,Verse));
</xsl:text>
            <xsl:apply-templates />
            <xsl:text>CREATE TABLE "Details" (Description NVARCHAR(255), Abbreviation NVARCHAR(50), Comments TEXT, Version TEXT, VersionDate DATETIME, PublishDate DATETIME, RightToLeft BOOL, OT BOOL, NT BOOL, Strong BOOL);
INSERT INTO Details VALUES('</xsl:text>
            <xsl:value-of select="concat($title,$sqlsep,$abbrev,$sqlsep,$commenttext,$sqlsep,$versionnumb,$sqlsep,$versiondate,$sqlsep,$publicationdate,$apos,$comma,$rtl,$comma,$ot,$comma,$nt,$comma,$strongno,');&#10;COMMIT;&#10;')" disable-output-escaping="yes"/>
      </xsl:template>
      <xsl:template match="usx">
            <xsl:variable name="booknumb">
                  <xsl:choose>
                        <xsl:when test="number(@seq)  gt 39">
                              <xsl:value-of select="number(@seq) -1"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="number(@seq)"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:apply-templates select="chapterGroup">
                  <xsl:with-param name="booknumb" select="$booknumb"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="chapterGroup">
            <xsl:param name="booknumb"/>
            <xsl:apply-templates select="verseGroup">
                  <xsl:with-param name="booknumb" select="$booknumb"/>
                  <xsl:with-param name="chapnumb" select="chapter/@number"/>
            </xsl:apply-templates>
      </xsl:template>
      <xsl:template match="verseGroup">
            <xsl:param name="booknumb"/>
            <xsl:param name="chapnumb"/>
            <xsl:variable name="versenumb" select="verse/@number"/>
            <xsl:text>INSERT INTO Bible VALUES(</xsl:text>
            <xsl:value-of select="concat($booknumb,$comma,$chapnumb,$comma,$versenumb)"/>
            <xsl:text>,'</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text>');&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="note">
            <xsl:text disable-output-escaping="yes">&lt;RF&gt;</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text disable-output-escaping="yes">&lt;Rf&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="char[@style = 'wj']">
            <xsl:text disable-output-escaping="yes">&lt;FR&gt;</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text disable-output-escaping="yes">&lt;Fr&gt;</xsl:text>
      </xsl:template>
      <xsl:template match="para">
            <xsl:variable name="pos" select="position()"/>
            <xsl:choose>
                  <xsl:when test="@style = 'p'">
                        <xsl:text disable-output-escaping="yes">&#10;&lt;CM&gt;</xsl:text>
                  </xsl:when>
                  <xsl:when test="@style = 'q1'">
                        <xsl:text disable-output-escaping="yes">&#10;&lt;CI&gt; &lt;PI1&gt;</xsl:text>
                  </xsl:when>
                  <xsl:when test="@style = 'q2'">
                        <xsl:text disable-output-escaping="yes">&#10;&lt;CI&gt; &lt;PI2&gt;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>

</xsl:otherwise>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
