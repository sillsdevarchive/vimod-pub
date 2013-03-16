<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" indent="yes"/>
      <xsl:strip-space elements="psGroup"/>
      <xsl:param name="node1"/>
      <xsl:param name="node2"/>
      <xsl:param name="node3"/>
      <xsl:param name="node4"/>
      <xsl:param name="node5"/>
      <xsl:param name="node6"/>
      <xsl:param name="node7"/>
      <xsl:param name="node8"/>
      <xsl:param name="node9"/>
      <xsl:template match="@* | node()">
            <xsl:copy>
                  <xsl:apply-templates select="@* | node()"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="*[name() = $node1]">
            <xsl:element name="{$node1}Group">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
                  <xsl:apply-templates select="following-sibling::*[name() = $node2]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node3]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node4]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node5]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node6]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node7]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node8]" mode="group"/>
                  <xsl:apply-templates select="following-sibling::*[name() = $node9]" mode="group"/>
            </xsl:element>
      </xsl:template>
      <xsl:template match="*[local-name() = $node2]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1]">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node3]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node4]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node5]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] and 
preceding-sibling::*[1][local-name() != $node4] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node6]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] and 
preceding-sibling::*[1][local-name() != $node4] and 
preceding-sibling::*[1][local-name() != $node5] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node7]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] and 
preceding-sibling::*[1][local-name() != $node4] and 
preceding-sibling::*[1][local-name() != $node5] and 
preceding-sibling::*[1][local-name() != $node6] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node8]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] and 
preceding-sibling::*[1][local-name() != $node4] and 
preceding-sibling::*[1][local-name() != $node5] and 
preceding-sibling::*[1][local-name() != $node6] and 
preceding-sibling::*[1][local-name() != $node7] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*[local-name() = $node9]">
            <xsl:if test="preceding-sibling::*[1][local-name() != $node1] and 
preceding-sibling::*[1][local-name() != $node2] and 
preceding-sibling::*[1][local-name() != $node3] and 
preceding-sibling::*[1][local-name() != $node4] and 
preceding-sibling::*[1][local-name() != $node5] and 
preceding-sibling::*[1][local-name() != $node6] and 
preceding-sibling::*[1][local-name() != $node7] and 
preceding-sibling::*[1][local-name() != $node8] ">
                  <xsl:copy>
                        <xsl:apply-templates/>
                  </xsl:copy>
            </xsl:if>
      </xsl:template>
      <xsl:template match="*" mode="group">
            <xsl:copy>
                  <xsl:apply-templates/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
