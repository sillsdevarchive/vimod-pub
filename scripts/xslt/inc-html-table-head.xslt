<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:silp="http://silp.org.ph/ns">
      <xsl:param name="columns"/>
      <xsl:param name="collabel1"/>
      <xsl:param name="collabel2"/>
      <xsl:param name="collabel3"/>
      <xsl:param name="collabel4"/>
      <xsl:param name="collabel5"/>
      <xsl:param name="collabel6"/>
      <xsl:template match="tb">
            <xsl:element name="{silp:match(name())}">
                  <xsl:attribute name="class">
                        <xsl:value-of select="name()"/>
                  </xsl:attribute>
                  <th class="col1">
                        <xsl:value-of select="$collabel1"/>
                  </th>
                  <th class="col2">
                        <xsl:value-of select="$collabel2"/>
                  </th>
                  <xsl:if test="$columns &gt; 2">
                        <th class="col3">
                              <xsl:value-of select="$collabel3"/>
                        </th>
                  </xsl:if>
                  <xsl:if test="$columns &gt; 3">
                        <th class="col4">
                              <xsl:value-of select="$collabel4"/>
                        </th>
                  </xsl:if>
                  <xsl:if test="$columns &gt; 4">
                        <th class="col5">
                              <xsl:value-of select="$collabel5"/>
                        </th>
                  </xsl:if>
                  <xsl:if test="$columns &gt; 5">
                        <th class="col6">
                              <xsl:value-of select="$collabel6"/>
                        </th>
                  </xsl:if>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>
