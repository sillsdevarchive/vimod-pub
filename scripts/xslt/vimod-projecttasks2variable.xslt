<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="projectpath"/>
      <xsl:variable name="projecttasksuri" select="concat(f:file2uri($projectpath),'/setup/project.tasks')"/>
      <xsl:variable name="projecttask" select="tokenize(unparsed-text($projecttasksuri),'\r?\n')"/>
      <xsl:template match="/">
            <xsl:element name="xsl:stylesheet">
                  <xsl:element name="xsl:param">
                        <!-- Declare projectpath -->
                        <xsl:attribute name="name">
                              <xsl:text>projectpath</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="select">
                              <xsl:text>'</xsl:text>
                              <xsl:value-of select="$projectpath"/>
                              <xsl:text>'</xsl:text>
                        </xsl:attribute>
                  </xsl:element>
                  <xsl:element name="xsl:param">
                        <xsl:attribute name="name">
                              <xsl:text>defaultkeystorepath</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="select">
                              <xsl:text>'</xsl:text>
                              <xsl:value-of select="concat(substring-before($projectpath,'\data\'),'\Android-keystore')"/>
                              <xsl:text>'</xsl:text>
                        </xsl:attribute>
                  </xsl:element>
                  <xsl:for-each select="$projecttask">
                        <!-- copy the root folder files pub.cmd and local_var.cmd -->
                        <xsl:call-template name="parseline">
                              <xsl:with-param name="line" select="."/>
                        </xsl:call-template>
                  </xsl:for-each>
            </xsl:element>
      </xsl:template>
      <xsl:template name="parseline">
            <xsl:param name="line"/>
            <xsl:variable name="comment" select="substring-before($line,';')"/>
            <xsl:variable name="commandstring" select="substring-after($line,';')"/>
            <xsl:variable name="part" select="tokenize($commandstring,'\s+')"/>
            <xsl:variable name="command" select="lower-case($part[1])"/>
            <xsl:variable name="name" select="$part[2]"/>
            <!-- <xsl:variable name="value" select="substring-after($commandstring,concat($name,'\s+'))"/> -->
            <xsl:variable name="value" select="replace($commandstring,concat('var ',$name,' '),'')"/>
            <xsl:variable name="onevar">
                  <xsl:if test="matches($value,'^%[\w\d\-_]+%$')">
                        <xsl:text>onevar</xsl:text>
                  </xsl:if>
            </xsl:variable>
            <xsl:choose>
                  <xsl:when test="matches($line,'^#')"/>
                  <xsl:when test="matches($command,'var')">
                        <!-- variable line -->
                        <xsl:element name="xsl:param">
                              <xsl:attribute name="name">
                                    <xsl:value-of select="$name"/>
                              </xsl:attribute>
                              <xsl:attribute name="select">
                                    <xsl:choose>
                                          <xsl:when test="matches($value,'^%.*:.*=.*%')">
                                                <xsl:variable name="vpart" select="tokenize($value,':')"/>
                                                <xsl:variable name="fpart" select="tokenize($vpart[2],'=')"/>
                                                <xsl:variable name="varname" select="replace($vpart[1],'%','')"/>
                                                <xsl:variable name="find" select="$fpart[1]"/>
                                                <xsl:variable name="replace" select="replace($fpart[2],'%','')"/>
                                                <xsl:text>replace($</xsl:text>
                                                <xsl:value-of select="$varname"/>
                                                <xsl:text>,'</xsl:text>
                                                <xsl:value-of select="$find"/>
                                                <xsl:text>','</xsl:text>
                                                <xsl:value-of select="$replace"/>
                                                <xsl:text>')</xsl:text>
                                          </xsl:when>
                                          <xsl:when test="matches($value,'%[\w\d\-_]+%')">
                                                <xsl:text>concat(</xsl:text>
                                                <xsl:analyze-string select="replace($value,'&#34;','')" regex="%[\w\d\-_]+%">
                                                      <xsl:matching-substring>
                                                            <xsl:if test="position() gt 1">
                                                                  <xsl:text>,</xsl:text>
                                                            </xsl:if>
                                                            <xsl:text>$</xsl:text>
                                                            <xsl:value-of select="replace(.,'%','')"/>
                                                      </xsl:matching-substring>
                                                      <xsl:non-matching-substring>
                                                            <xsl:choose>
                                                                  <xsl:when test="position() = 1">
                                                                        <xsl:text>'</xsl:text>
                                                                  </xsl:when>
                                                                  <xsl:otherwise>
                                                                        <xsl:text>,'</xsl:text>
                                                                  </xsl:otherwise>
                                                            </xsl:choose>
                                                            <xsl:value-of select="."/>
                                                            <xsl:text>'</xsl:text>
                                                      </xsl:non-matching-substring>
                                                </xsl:analyze-string>
                                                <xsl:if test="$onevar = 'onevar'">
                                                      <!-- This is incase there is only one variable passed to another variable, rare but possible -->
                                                      <xsl:text>,''</xsl:text>
                                                </xsl:if>
                                                <xsl:text>)</xsl:text>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:text>'</xsl:text>
                                                <xsl:value-of select="replace($value,'&#34;','')"/>
                                                <xsl:text>'</xsl:text>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:attribute>
                        </xsl:element>
                  </xsl:when>
                  <xsl:otherwise/>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
