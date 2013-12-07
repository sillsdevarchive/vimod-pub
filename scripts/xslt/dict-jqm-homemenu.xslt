<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="homemenutop">
            <div data-role="collapsible" data-collapsed="false" data-mini="true" data-theme="b" data-inset="false">
                  <ul data-role="listview" data-filter="true">
                        <li>
                              <a href="../find/home.html">Home</a>
                        </li>
                        <li data-role="list-divider">Quick Manobo word and meaning</li>
                        <li>
                              <a href="../find/ver-eng.html">Find</a>
                        </li>
                        <xsl:for-each select="$lang">
                              <li>
                                    <a href="../find/{@handle}.html">
                                          <xsl:value-of select="@langname"/>
                                    </a>
                              </li>
                        </xsl:for-each>
                  </ul>
            </div>
      </xsl:template>
</xsl:stylesheet>
