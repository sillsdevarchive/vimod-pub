<?xml version="1.0" encoding="utf-8"?> <!--
    #############################################################
    # Name:         .xslt
    # Purpose:
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="phrasesfile"/>
<xsl:param name="total-length"/>
<xsl:param name="start-seconds"/>
<xsl:param name="end-seconds"/>
<xsl:variable name="whole" select="f:file2text($phrasesfile)"/>
<xsl:variable name="vowelcount" select="string-length(replace($whole,'[^aeiou\.,?!;:]',''))"/>
<xsl:variable name="phrase" select="f:file2lines($phrasesfile)"/>
<xsl:variable name="secperlet" select="(number($total-length)-number($start-seconds)-number($end-seconds))/number($vowelcount)"/>

 <xsl:template match="/*">
<xsl:for-each select="$phrase">
<xsl:variable name="lcount" select="string-length(replace(.,'[^aeiou\.,?!;:]',''))"/>

</xsl:for-each>
 </xsl:template>
</xsl:stylesheet>