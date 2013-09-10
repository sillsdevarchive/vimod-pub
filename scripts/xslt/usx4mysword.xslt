<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:param name="usxpath"/>
      <xsl:param name="files" select="'*.usx'"/>
      <xsl:param name="groupnodelist" select="'book chapter'"/>
      <xsl:param name="bookorderfile" select="'D:\All-SIL-Publishing\vimod-pub\resources\ParatextIntergration\book-chaps.txt'"/>
      <xsl:variable name="uri" select="f:file2uri($bookorderfile)"/>
      <xsl:variable name="bookorderlist" select="unparsed-text($uri)"/>
      <xsl:variable name="usxpathuri" select="f:file2uri($usxpath)"/>
      <xsl:variable name="collection" select="collection(concat($usxpathuri,'?select=',$files))"/>
      <xsl:variable name="groupnodes" select="tokenize($groupnodelist,'\s+')"/>
      <xsl:variable name="usxseq">
            <xsl:call-template name="list2xmlxattrib">
                  <xsl:with-param name="text" select="$bookorderlist"/>
                  <xsl:with-param name="attribnamelist" select="'seq book chapters'"/>
            </xsl:call-template>
      </xsl:variable>
      <xsl:output method="xml" encoding="utf-8" indent="yes"/>
      <xsl:template match="/">
            <data>
                  <xsl:for-each select="$collection/usx">
                        <xsl:sort select="number(f:sequence(book/@code))"/>
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:variable name="book" select="book/@code"/>
                        <xsl:copy>
                              <xsl:attribute name="book">
                                    <xsl:value-of select="$book"/>
                              </xsl:attribute>
                              <xsl:attribute name="seq">
                                    <xsl:value-of select="f:sequence($book)"/>
                              </xsl:attribute>
                              <xsl:attribute name="pos">
                                    <xsl:value-of select="$pos"/>
                              </xsl:attribute>
                              <xsl:attribute name="bookname">
                                    <xsl:value-of select="$pos"/>
                              </xsl:attribute>
                              <xsl:apply-templates select="@*"/>
                              <xsl:for-each-group select="*" group-starting-with="*[local-name() = $groupnodes]">
                                    <xsl:choose>
                                          <xsl:when test="self::*[local-name() = $groupnodes]">
                                                <xsl:element name="{local-name()}Group">
                                                      <xsl:attribute name="book">
                                                            <xsl:value-of select="$book"/>
                                                      </xsl:attribute>
                                                      <xsl:attribute name="chap">
                                                            <xsl:value-of select="@number"/>
                                                      </xsl:attribute>
                                                      <xsl:apply-templates select="current-group()"/>
                                                </xsl:element>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:apply-templates select="current-group()"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:for-each-group>
                        </xsl:copy >
                  </xsl:for-each>
            </data>
      </xsl:template>
      <xsl:template match="@*|node()">
            <xsl:copy>
                  <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="para">
            <para style="{@style}"/>
            <xsl:apply-templates select="node()"/>
      </xsl:template>
      <xsl:template name="list2xmlxattrib">
            <xsl:param name="text"/>
            <xsl:param name="attribnamelist"/>
            <xsl:variable name="attrib" select="tokenize($attribnamelist,'\s+')"/>
            <xsl:analyze-string select="$text" regex="\r\n">
                  <xsl:matching-substring/>
                  <xsl:non-matching-substring>
                        <xsl:variable name="cell" select="tokenize(.,' ')"/>
                        <xsl:element name="element">
                              <xsl:for-each select="$attrib">
                                    <xsl:variable name="pos" select="position()"/>
                                    <xsl:attribute name="{.}">
                                          <xsl:value-of select="$cell[$pos]"/>
                                    </xsl:attribute>
                              </xsl:for-each>
                        </xsl:element>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
      </xsl:function>
      <xsl:function name="f:sequence">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = $usxseq/element/@book">
                        <xsl:variable name="seq" select="$usxseq/element[@book = $string]/@seq"/>
                        <xsl:value-of select="$seq"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>1000</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
