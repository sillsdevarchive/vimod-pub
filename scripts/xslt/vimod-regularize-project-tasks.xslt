<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         .xslt
    # Purpose:    Take an existing project.tasks file and reorder it based on a template
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ 
	Input file is XSLT of standard project.xslt

-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="text" encoding="utf-8" use-character-maps="vimod"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:include href="inc-lookup.xslt"/>
      <xsl:character-map name="vimod">
            <xsl:output-character character="'" string=''/>
      </xsl:character-map>
      <xsl:param name="file2reorder"/>
      <xsl:variable name="sq">
            <xsl:text>'</xsl:text>
      </xsl:variable>
      <xsl:variable name="s60" select="'                                                            '"/>
      <xsl:variable name="commlength" select="57"/>
      <xsl:variable name="line" select="f:file2lines($file2reorder)"/>
      <!--<xsl:variable name="master" select="f:file2lines($fileordermaster)"/> -->
      <xsl:variable name="commentstring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="translate(replace(.,';.+',''),'&#9;',' ')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="commandstring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;',''),' .+','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="varnamestring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;[^ ]+ +',''),' .+','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="valuestring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;[^ ]+ +[^ ]+ +',''),'^.+;projectxslt','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <!-- <xsl:variable name="mastercommentstring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="translate(replace(.,';.+',''),'&#9;',' ')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="mastercommandstring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;',''),' .+','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="mastervarnamestring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;[^ ]+ +',''),' .+','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="mastervaluestring">
            <xsl:for-each select="$line">
                  <xsl:value-of select="replace(replace(replace(.,'^#.+',' '),'^.+;[^ ]+ +[^ ]+ +',''),'^.+;projectxslt','')"/>
                  <xsl:text>&#9;</xsl:text>
            </xsl:for-each>
      </xsl:variable> -->
      <xsl:variable name="comment" select="tokenize($commentstring,'&#9;')"/>
      <xsl:variable name="command" select="tokenize($commandstring,'&#9;')"/>
      <xsl:variable name="varname" select="tokenize($varnamestring,'&#9;')"/>
      <xsl:variable name="value" select="tokenize($valuestring,'&#9;')"/>
      <!--<xsl:variable name="mastercomment" select="tokenize($mastercommentstring,'&#9;')"/>
      <xsl:variable name="mastercommand" select="tokenize($mastercommandstring,'&#9;')"/>
      <xsl:variable name="mastervarname" select="tokenize($mastervarnamestring,'&#9;')"/>
      <xsl:variable name="mastervalue" select="tokenize($mastervaluestring,'&#9;')"/> -->
      <xsl:template match="/">
            <!--<xsl:for-each select="$mastervarname">
                  <xsl:variable name="seq" select="position()"/>
                  <xsl:variable name="vname" select="."/>
                  <xsl:choose>
                        <xsl:when test=". = ''">
                              <xsl:value-of select="$mastercomment[$seq]"/>
                              <xsl:text>&#10;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:choose>
                                    <xsl:when test="$comment[f:position($varname,$vname)] ne ''">
                                          <xsl:value-of select="substring(concat(translate($comment[number(f:position($varname,$vname))],'&#9;',' '),'                                                           '),0,55)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="substring(concat(translate($mastercomment[number(f:position($varname,$vname))],'&#9;',' '),'                                                           '),0,55)"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text>;var </xsl:text>
                              <xsl:value-of select="$vname"/>
                              <xsl:text> </xsl:text>
                              <xsl:choose>
                                    <xsl:when test="$value[number(f:position($varname,$vname))] = ''">
                                          <xsl:value-of select="$mastervalue[number(f:position($varname,$vname))]"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:value-of select="$value[number(f:position($varname,$vname))]"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text>&#10;</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:for-each> -->
            <xsl:apply-templates select="*"/>
      </xsl:template>
      <xsl:template match="xsl:variable[matches(@name,'comment') and matches(@select,'#')]">
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="@select"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="xsl:variable[matches(@select,';projectxslt')]">
            <xsl:variable name="comm" select="substring-before(normalize-space(@select),';')"/>
            <xsl:value-of select="substring(concat($comm,$s60),1,$commlength)"/>
            <xsl:text>;</xsl:text>
            <xsl:value-of select="substring-after(@select,';')"/>
            <xsl:text>&#10;</xsl:text>
      </xsl:template>
      <xsl:template match="*:param">
            <xsl:variable name="vname" select="@name"/>
            <xsl:variable name="vvalue" select="$value[number(f:position($varname,$vname))]"/>
            <xsl:variable name="returnvalue">
                  <xsl:choose>
                        <xsl:when test="string-length($vvalue) gt 0">
                              <xsl:value-of select="$vvalue"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text>""</xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:variable name="vcomment" select="$comment[number(f:position($varname,$vname))]"/>
            <xsl:variable name="returncomment">
                  <xsl:choose>
                        <xsl:when test="matches($vcomment,'^\s\s+$') or string-length($vcomment) = 0">
                              <xsl:value-of select="preceding-sibling::*[1]/@select"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="$vcomment"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:value-of select="substring(concat($returncomment,$s60),1,$commlength)"/>
            <xsl:text>    ;var </xsl:text>
            <xsl:value-of select="$vname"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$returnvalue"/>
            <xsl:text>&#10;</xsl:text>
            <!-- <xsl:value-of select="concat(';var ',@name,' {',$varname[f:position($varname,@name)],' ',$value[f:position($varname,@name)])"/> -->
      </xsl:template>
</xsl:stylesheet>
