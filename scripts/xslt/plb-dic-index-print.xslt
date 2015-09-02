<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.1" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:variable name="lxdata"/>
      <xsl:template match="/">
            <html>
                  <head>
                        <meta name="generator" content="ToolBox PLB dictionary transformation"/>
                        <title>Karao Dictionary</title>
                        <style type="text/css">
                              <xsl:text disable-output-escaping="yes"><![CDATA[<!--  ]]></xsl:text>
                              <xsl:call-template name="css"/>
                              <xsl:text disable-output-escaping="yes"><![CDATA[// --> ]]></xsl:text>
                        </style>
                  </head>
                  <body>
                        <table>
                              <xsl:for-each select="//ie">
                                    <xsl:sort select="lower-case(.)"/>
                                    <xsl:call-template name="ie"/>
                              </xsl:for-each>
                        </table>
                  </body>
            </html>
      </xsl:template>
      <xsl:template name="ie">
            <tr>
                  <td class="ie">
                        <xsl:value-of select="."/>
                  </td>
                  <td class="lx">
                        <xsl:value-of select="ancestor::lxGroup/lx"/>
                  </td>
            </tr>
      </xsl:template>
      <xsl:template name="css">
table {width: 2.33in}
tr {border-top-style: solid border-top-width:2px; border-top-color:silver ;}
.ie {width:55%; vertical-align:top; padding-right:1em}
.lx {width:45%; vertical-align:top; border-right:silver}
      </xsl:template>
</xsl:stylesheet>
