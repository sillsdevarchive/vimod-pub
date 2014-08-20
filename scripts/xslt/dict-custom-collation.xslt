<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
      <!-- Part of the SILP Dictionary Creator
Used to hold custom collations used in some languages
This is an include file that is used by: dict-sort-with-custom-collation-option.xslt and Index-group-n-sort.xslt

Written by Ian McQuay
Created: 5/08/2012
Modified: 21/08/2012
Modified: 2014-08-20 added Agutaynen based on maranao
 -->

      <xsl:variable name="customcollation">
            <!--    The input custom collation looks like this:
'&lt; ā,Ā &lt; a,A &lt; b,B &lt; c,C &lt; d,D &lt; ē,Ē &lt;e,E &lt; f,F &lt; g,G &lt; h,H &lt; ī,Ī &lt; i,I &lt; j,J &lt; k,K &lt; ˈ &lt; l,L &lt; m,M &lt; n,N &lt; ŋ,Ŋ &lt; ō,Ō &lt; o,O &lt; p,P &lt; q,Q &lt; r,R &lt; s,S &lt; t,T &lt; ū,Ū &lt; u,U &lt; v,V &lt; w,W &lt; x,X &lt; y,Y &lt; z,Z'
which is inturn changed to:
%20%3C%20%C4%81%2C%C4%80%20%3C%20a%2CA%20%3C%20b%2CB%20%3C%20c%2CC%20%3C%20d%2CD%20%3C%20%C4%93%2C%C4%92%20%3Ce%2CE%20%3C%20f%2CF%20%3C%20g%2CG%20%3C%20h%2CH%20%3C%20%C4%AB%2C%C4%AA%20%3C%20i%2CI%20%3C%20j%2CJ%20%3C%20k%2CK%20%3C%20%CB%88%20%3C%20l%2CL%20%3C%20m%2CM%20%3C%20n%2CN%20%3C%20%C5%8B%2C%C5%8A%20%3C%20%C5%8D%2C%C5%8C%20%3C%20o%2CO%20%3C%20p%2CP%20%3C%20q%2CQ%20%3C%20r%2CR%20%3C%20s%2CS%20%3C%20t%2CT%20%3C%20%C5%AB%2C%C5%AA%20%3C%20u%2CU%20%3C%20v%2CV%20%3C%20w%2CW%20%3C%20x%2CX%20%3C%20y%2CY%20%3C%20z%2CZ%20
by the encode-for-uri() for the url  -->
            <xsl:choose>
                  <xsl:when test="lower-case($collationname) = 'yakan'">
                        <xsl:text> &lt; 0 &lt; 1 &lt; 2 &lt; 3 &lt; 4 &lt; 5 &lt; 6 &lt; 7 &lt; 8 &lt; 9 &lt; ā,Ā &lt; a,A &lt; b,B &lt; c,C &lt; d,D &lt; ē,Ē &lt;e,E &lt; f,F &lt; g,G &lt; h,H &lt; ī,Ī &lt; i,I &lt; j,J &lt; k,K &lt; ˈ &lt; l,L &lt; m,M &lt; n,N &lt; ng,Ng=ŋ,Ŋ &lt; ō,Ō &lt; o,O &lt; p,P &lt; q,Q &lt; r,R &lt; s,S &lt; t,T &lt; ū,Ū &lt; u,U &lt; v,V &lt; w,W &lt; x,X &lt; y,Y &lt; z,Z </xsl:text><!-- &lt; &#39; &#39; -->
                  </xsl:when>
                  <xsl:when test="lower-case($collationname) = 'maranao'">
                        <xsl:text> &lt;  0 &lt; 1 &lt; 2 &lt; 3 &lt; 4 &lt; 5 &lt; 6 &lt; 7 &lt; 8 &lt; 9 &lt; a,A &lt; b,B &lt; c,C &lt; d,D &lt; ae,AE=æ,Æ &lt; e,E &lt; f,F &lt; g,G &lt; h,H &lt; i,I &lt; j,J &lt; k,K &lt; ˈ &lt; l,L &lt; m,M &lt; n,N &lt; ng,Ng=ŋ,Ŋ &lt; o,O &lt; p,P &lt; q,Q &lt; r,R &lt; s,S &lt; t,T &lt; u,U &lt; v,V &lt; w,W &lt; x,X &lt; y,Y &lt; z,Z &lt; &#39; &#39;</xsl:text>
                  </xsl:when>
                  <xsl:when test="lower-case($collationname) = 'protosama'">
                        <xsl:text> &lt;  0 &lt; 1 &lt; 2 &lt; 3 &lt; 4 &lt; 5 &lt; 6 &lt; 7 &lt; 8 &lt; 9  &lt; a &lt; ʌ &lt; b &lt; d &lt; ʤ &lt; e &lt; ɘ &lt; g &lt; h &lt; i &lt; ɪ &lt; k &lt; ʔ &lt; l &lt; m &lt; n &lt; ŋ &lt; ñ &lt; o &lt; p &lt; r &lt; s &lt; t &lt; ʧ &lt; u &lt; ɤ &lt; w &lt; y &lt; &#39; &#39;</xsl:text>
                  </xsl:when>
                  <xsl:when test="lower-case($collationname) = 'agutaynen'">
                       <xsl:text> &lt;  0 &lt; 1 &lt; 2 &lt; 3 &lt; 4 &lt; 5 &lt; 6 &lt; 7 &lt; 8 &lt; 9 &lt; a,A &lt; b,B &lt; c,C &lt; d,D &lt; e,E &lt; f,F &lt; g,G &lt; h,H &lt; i,I &lt; j,J &lt; k,K &lt; ˈ &lt; l,L &lt; m,M &lt; n,N &lt; ng,Ng=ŋ,Ŋ &lt; o,O &lt; p,P &lt; q,Q &lt; r,R &lt; s,S &lt; t,T &lt; u,U &lt; v,V &lt; w,W &lt; x,X &lt; y,Y &lt; z,Z &lt; &#39; &#39;</xsl:text>
                  </xsl:when>
                  <!-- Add other custom collations here  inside a when -->
                  <xsl:otherwise>
                        <xsl:text></xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
</xsl:stylesheet>
