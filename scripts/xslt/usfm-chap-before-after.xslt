<!--
    #############################################################
    # Name:        usfm-chap-before-after.xslt
    # Purpose:     Provides contextual data for USX books
    # Part of:     Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    #
    # Author:      Ian McQuay <ian_mcquay.org>
    #
    # Created:     2013/08/22
    # Copyright:   (c) 2013 SIL International
    # Licence:     <LGPL>
    #
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="usxpath"/>
      <xsl:template name="chaptbefore">

            <xsl:param name="curchap"/>
            <xsl:param name="string"/>
            <!-- chapbefore -->
            <xsl:choose>
                  <xsl:when test="$curchap = 1 and $string = 'FRT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000FRT.usx'))">
                                    <xsl:text>FRT.0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000FRT.usx'))">
                                    <xsl:text>FRT.0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/001GEN.usx'))">
                                    <xsl:text>GEN.50</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/002EXO.usx'))">
                                    <xsl:text>EXO.40</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/003LEV.usx'))">
                                    <xsl:text>LEV.27</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/004NUM.usx'))">
                                    <xsl:text>NUM.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/005DEU.usx'))">
                                    <xsl:text>DEU.34</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/006JOS.usx'))">
                                    <xsl:text>JOS.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/007JDG.usx'))">
                                    <xsl:text>JDG.21</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/008RUT.usx'))">
                                    <xsl:text>RUT.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0091SA.usx'))">
                                    <xsl:text>1SA.31</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0102SA.usx'))">
                                    <xsl:text>2SA.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0111KI.usx'))">
                                    <xsl:text>1KI.22</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0122KI.usx'))">
                                    <xsl:text>2KI.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0131CH.usx'))">
                                    <xsl:text>1CH.29</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0142CH.usx'))">
                                    <xsl:text>2CH.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/015EZR.usx'))">
                                    <xsl:text>EZR.10</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/016NEH.usx'))">
                                    <xsl:text>NEH.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/017EST.usx'))">
                                    <xsl:text>EST.10</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/018JOB.usx'))">
                                    <xsl:text>JOB.42</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/019PSA.usx'))">
                                    <xsl:text>PSA.150</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/020PRO.usx'))">
                                    <xsl:text>PRO.31</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/021ECC.usx'))">
                                    <xsl:text>ECC.12</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/022SNG.usx'))">
                                    <xsl:text>SNG.8</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/023ISA.usx'))">
                                    <xsl:text>ISA.66</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/024JER.usx'))">
                                    <xsl:text>JER.52</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/025LAM.usx'))">
                                    <xsl:text>LAM.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/026EZK.usx'))">
                                    <xsl:text>EZK.48</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/027DAN.usx'))">
                                    <xsl:text>DAN.12</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/028HOS.usx'))">
                                    <xsl:text>HOS.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/029JOL.usx'))">
                                    <xsl:text>JOL.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/030AMO.usx'))">
                                    <xsl:text>AMO.9</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/031OBA.usx'))">
                                    <xsl:text>OBA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/032JON.usx'))">
                                    <xsl:text>JON.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/033MIC.usx'))">
                                    <xsl:text>MIC.7</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/034NAM.usx'))">
                                    <xsl:text>NAM.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/035HAB.usx'))">
                                    <xsl:text>HAB.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/036ZEP.usx'))">
                                    <xsl:text>ZEP.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/037HAG.usx'))">
                                    <xsl:text>HAG.2</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/038ZEC.usx'))">
                                    <xsl:text>ZEC.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/039MAL.usx'))">
                                    <xsl:text>MAL.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/041MAT.usx'))">
                                    <xsl:text>MAT.28</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/042MRK.usx'))">
                                    <xsl:text>MRK.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/043LUK.usx'))">
                                    <xsl:text>LUK.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/044JHN.usx'))">
                                    <xsl:text>JHN.21</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/045ACT.usx'))">
                                    <xsl:text>ACT.28</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/046ROM.usx'))">
                                    <xsl:text>ROM.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0471CO.usx'))">
                                    <xsl:text>1CO.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0482CO.usx'))">
                                    <xsl:text>2CO.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/049GAL.usx'))">
                                    <xsl:text>GAL.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/050EPH.usx'))">
                                    <xsl:text>EPH.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/051PHP.usx'))">
                                    <xsl:text>PHP.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/052COL.usx'))">
                                    <xsl:text>COL.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0531TH.usx'))">
                                    <xsl:text>1TH.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0542TH.usx'))">
                                    <xsl:text>2TH.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0551TI.usx'))">
                                    <xsl:text>1TI.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0562TI.usx'))">
                                    <xsl:text>2TI.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/057TIT.usx'))">
                                    <xsl:text>TIT.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/058PHM.usx'))">
                                    <xsl:text>PHM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/059HEB.usx'))">
                                    <xsl:text>HEB.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/060JAS.usx'))">
                                    <xsl:text>JAS.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0611PE.usx'))">
                                    <xsl:text>1PE.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0622PE.usx'))">
                                    <xsl:text>2PE.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0631JN.usx'))">
                                    <xsl:text>1JN.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0642JN.usx'))">
                                    <xsl:text>2JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0653JN.usx'))">
                                    <xsl:text>3JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/066JUD.usx'))">
                                    <xsl:text>JUD.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/067REV.usx'))">
                                    <xsl:text>REV.22</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/068TOB.usx'))">
                                    <xsl:text>TOB.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/069JDT.usx'))">
                                    <xsl:text>JDT.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/070ESG.usx'))">
                                    <xsl:text>ESG.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/071WIS.usx'))">
                                    <xsl:text>WIS.19</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/072SIR.usx'))">
                                    <xsl:text>SIR.51</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/073BAR.usx'))">
                                    <xsl:text>BAR.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/074LJE.usx'))">
                                    <xsl:text>LJE.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/075S3Y.usx'))">
                                    <xsl:text>S3Y.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/076SUS.usx'))">
                                    <xsl:text>SUS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/077BEL.usx'))">
                                    <xsl:text>BEL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0781MA.usx'))">
                                    <xsl:text>1MA.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0792MA.usx'))">
                                    <xsl:text>2MA.15</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0803MA.usx'))">
                                    <xsl:text>3MA.7</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0814MA.usx'))">
                                    <xsl:text>4MA.18</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0821ES.usx'))">
                                    <xsl:text>1ES.9</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0832ES.usx'))">
                                    <xsl:text>2ES.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/084MAN.usx'))">
                                    <xsl:text>MAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/085PS2.usx'))">
                                    <xsl:text>PS2.151</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/086ODA.usx'))">
                                    <xsl:text>ODA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/087PSS.usx'))">
                                    <xsl:text>PSS.2</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="string(number($curchap) - 1)"/>
                  </xsl:otherwise>
            </xsl:choose>
            <!-- chapbefore -->
      </xsl:template>
      <!-- ============================Chapter after -->
      <xsl:template name="chaptafter">
            <xsl:param name="curchap"/>
            <xsl:param name="string"/>
            <!-- chapafter -->
            <xsl:choose>
                  <xsl:when test="$curchap = 0 and $string = 'FRT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/001GEN.usx'))">
                                    <xsl:text>GEN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 50 and $string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/002EXO.usx'))">
                                    <xsl:text>EXO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 40 and $string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/003LEV.usx'))">
                                    <xsl:text>LEV.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 27 and $string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/004NUM.usx'))">
                                    <xsl:text>NUM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/005DEU.usx'))">
                                    <xsl:text>DEU.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 34 and $string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/006JOS.usx'))">
                                    <xsl:text>JOS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/007JDG.usx'))">
                                    <xsl:text>JDG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/008RUT.usx'))">
                                    <xsl:text>RUT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0091SA.usx'))">
                                    <xsl:text>1SA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0102SA.usx'))">
                                    <xsl:text>2SA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0111KI.usx'))">
                                    <xsl:text>1KI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0122KI.usx'))">
                                    <xsl:text>2KI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0131CH.usx'))">
                                    <xsl:text>1CH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 29 and $string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0142CH.usx'))">
                                    <xsl:text>2CH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/015EZR.usx'))">
                                    <xsl:text>EZR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/016NEH.usx'))">
                                    <xsl:text>NEH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/017EST.usx'))">
                                    <xsl:text>EST.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/018JOB.usx'))">
                                    <xsl:text>JOB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 42 and $string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/019PSA.usx'))">
                                    <xsl:text>PSA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 150 and $string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/020PRO.usx'))">
                                    <xsl:text>PRO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/021ECC.usx'))">
                                    <xsl:text>ECC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/022SNG.usx'))">
                                    <xsl:text>SNG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 8 and $string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/023ISA.usx'))">
                                    <xsl:text>ISA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 66 and $string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/024JER.usx'))">
                                    <xsl:text>JER.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 52 and $string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/025LAM.usx'))">
                                    <xsl:text>LAM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/026EZK.usx'))">
                                    <xsl:text>EZK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 48 and $string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/027DAN.usx'))">
                                    <xsl:text>DAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/028HOS.usx'))">
                                    <xsl:text>HOS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/029JOL.usx'))">
                                    <xsl:text>JOL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/030AMO.usx'))">
                                    <xsl:text>AMO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/031OBA.usx'))">
                                    <xsl:text>OBA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/032JON.usx'))">
                                    <xsl:text>JON.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/033MIC.usx'))">
                                    <xsl:text>MIC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/034NAM.usx'))">
                                    <xsl:text>NAM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/035HAB.usx'))">
                                    <xsl:text>HAB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/036ZEP.usx'))">
                                    <xsl:text>ZEP.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/037HAG.usx'))">
                                    <xsl:text>HAG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 2 and $string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/038ZEC.usx'))">
                                    <xsl:text>ZEC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/039MAL.usx'))">
                                    <xsl:text>MAL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/041MAT.usx'))">
                                    <xsl:text>MAT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/042MRK.usx'))">
                                    <xsl:text>MRK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/043LUK.usx'))">
                                    <xsl:text>LUK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/044JHN.usx'))">
                                    <xsl:text>JHN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/045ACT.usx'))">
                                    <xsl:text>ACT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/046ROM.usx'))">
                                    <xsl:text>ROM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0471CO.usx'))">
                                    <xsl:text>1CO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0482CO.usx'))">
                                    <xsl:text>2CO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/049GAL.usx'))">
                                    <xsl:text>GAL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/050EPH.usx'))">
                                    <xsl:text>EPH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/051PHP.usx'))">
                                    <xsl:text>PHP.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/052COL.usx'))">
                                    <xsl:text>COL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0531TH.usx'))">
                                    <xsl:text>1TH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0542TH.usx'))">
                                    <xsl:text>2TH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0551TI.usx'))">
                                    <xsl:text>1TI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0562TI.usx'))">
                                    <xsl:text>2TI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/057TIT.usx'))">
                                    <xsl:text>TIT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/058PHM.usx'))">
                                    <xsl:text>PHM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/059HEB.usx'))">
                                    <xsl:text>HEB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/060JAS.usx'))">
                                    <xsl:text>JAS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0611PE.usx'))">
                                    <xsl:text>1PE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0622PE.usx'))">
                                    <xsl:text>2PE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0631JN.usx'))">
                                    <xsl:text>1JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0642JN.usx'))">
                                    <xsl:text>2JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0653JN.usx'))">
                                    <xsl:text>3JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/066JUD.usx'))">
                                    <xsl:text>JUD.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/067REV.usx'))">
                                    <xsl:text>REV.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/068TOB.usx'))">
                                    <xsl:text>TOB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/069JDT.usx'))">
                                    <xsl:text>JDT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/070ESG.usx'))">
                                    <xsl:text>ESG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/071WIS.usx'))">
                                    <xsl:text>WIS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 19 and $string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/072SIR.usx'))">
                                    <xsl:text>SIR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 51 and $string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/073BAR.usx'))">
                                    <xsl:text>BAR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/074LJE.usx'))">
                                    <xsl:text>LJE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/075S3Y.usx'))">
                                    <xsl:text>S3Y.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/076SUS.usx'))">
                                    <xsl:text>SUS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/077BEL.usx'))">
                                    <xsl:text>BEL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0781MA.usx'))">
                                    <xsl:text>1MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0792MA.usx'))">
                                    <xsl:text>2MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 15 and $string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0803MA.usx'))">
                                    <xsl:text>3MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0814MA.usx'))">
                                    <xsl:text>4MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 18 and $string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0821ES.usx'))">
                                    <xsl:text>1ES.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0832ES.usx'))">
                                    <xsl:text>2ES.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/084MAN.usx'))">
                                    <xsl:text>MAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/085PS2.usx'))">
                                    <xsl:text>PS2.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 151 and $string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/086ODA.usx'))">
                                    <xsl:text>ODA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/087PSS.usx'))">
                                    <xsl:text>PSS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 2 and $string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/109GLO.usx'))">
                                    <xsl:text>GLO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 0 and $string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000.usx'))">
                                    <xsl:text>.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="string(number($curchap) + 1)"/>
                  </xsl:otherwise>
            </xsl:choose>
            <!-- chapafter -->
      </xsl:template>
      <!-- ============================ book before -->
      <xsl:template name="bookbefore">
            <xsl:param name="string"/>
            <!-- bookbefore -->
            <xsl:choose>
                  <xsl:when test="$string = 'FRT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000FRT.usx'))">
                                    <xsl:text>FRT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000FRT.usx'))">
                                    <xsl:text>FRT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/001GEN.usx'))">
                                    <xsl:text>GEN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/002EXO.usx'))">
                                    <xsl:text>EXO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/003LEV.usx'))">
                                    <xsl:text>LEV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/004NUM.usx'))">
                                    <xsl:text>NUM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/005DEU.usx'))">
                                    <xsl:text>DEU_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/006JOS.usx'))">
                                    <xsl:text>JOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/007JDG.usx'))">
                                    <xsl:text>JDG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/008RUT.usx'))">
                                    <xsl:text>RUT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0091SA.usx'))">
                                    <xsl:text>1SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0102SA.usx'))">
                                    <xsl:text>2SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0111KI.usx'))">
                                    <xsl:text>1KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0122KI.usx'))">
                                    <xsl:text>2KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0131CH.usx'))">
                                    <xsl:text>1CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0142CH.usx'))">
                                    <xsl:text>2CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/015EZR.usx'))">
                                    <xsl:text>EZR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/016NEH.usx'))">
                                    <xsl:text>NEH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/017EST.usx'))">
                                    <xsl:text>EST_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/018JOB.usx'))">
                                    <xsl:text>JOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/019PSA.usx'))">
                                    <xsl:text>PSA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/020PRO.usx'))">
                                    <xsl:text>PRO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/021ECC.usx'))">
                                    <xsl:text>ECC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/022SNG.usx'))">
                                    <xsl:text>SNG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/023ISA.usx'))">
                                    <xsl:text>ISA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/024JER.usx'))">
                                    <xsl:text>JER_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/025LAM.usx'))">
                                    <xsl:text>LAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/026EZK.usx'))">
                                    <xsl:text>EZK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/027DAN.usx'))">
                                    <xsl:text>DAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/028HOS.usx'))">
                                    <xsl:text>HOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/029JOL.usx'))">
                                    <xsl:text>JOL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/030AMO.usx'))">
                                    <xsl:text>AMO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/031OBA.usx'))">
                                    <xsl:text>OBA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/032JON.usx'))">
                                    <xsl:text>JON_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/033MIC.usx'))">
                                    <xsl:text>MIC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/034NAM.usx'))">
                                    <xsl:text>NAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/035HAB.usx'))">
                                    <xsl:text>HAB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/036ZEP.usx'))">
                                    <xsl:text>ZEP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/037HAG.usx'))">
                                    <xsl:text>HAG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/038ZEC.usx'))">
                                    <xsl:text>ZEC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/039MAL.usx'))">
                                    <xsl:text>MAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/041MAT.usx'))">
                                    <xsl:text>MAT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/042MRK.usx'))">
                                    <xsl:text>MRK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/043LUK.usx'))">
                                    <xsl:text>LUK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/044JHN.usx'))">
                                    <xsl:text>JHN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/045ACT.usx'))">
                                    <xsl:text>ACT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/046ROM.usx'))">
                                    <xsl:text>ROM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0471CO.usx'))">
                                    <xsl:text>1CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0482CO.usx'))">
                                    <xsl:text>2CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/049GAL.usx'))">
                                    <xsl:text>GAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/050EPH.usx'))">
                                    <xsl:text>EPH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/051PHP.usx'))">
                                    <xsl:text>PHP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/052COL.usx'))">
                                    <xsl:text>COL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0531TH.usx'))">
                                    <xsl:text>1TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0542TH.usx'))">
                                    <xsl:text>2TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0551TI.usx'))">
                                    <xsl:text>1TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0562TI.usx'))">
                                    <xsl:text>2TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/057TIT.usx'))">
                                    <xsl:text>TIT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/058PHM.usx'))">
                                    <xsl:text>PHM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/059HEB.usx'))">
                                    <xsl:text>HEB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/060JAS.usx'))">
                                    <xsl:text>JAS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0611PE.usx'))">
                                    <xsl:text>1PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0622PE.usx'))">
                                    <xsl:text>2PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0631JN.usx'))">
                                    <xsl:text>1JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0642JN.usx'))">
                                    <xsl:text>2JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0653JN.usx'))">
                                    <xsl:text>3JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/066JUD.usx'))">
                                    <xsl:text>JUD_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/067REV.usx'))">
                                    <xsl:text>REV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/068TOB.usx'))">
                                    <xsl:text>TOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/069JDT.usx'))">
                                    <xsl:text>JDT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/070ESG.usx'))">
                                    <xsl:text>ESG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/071WIS.usx'))">
                                    <xsl:text>WIS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/072SIR.usx'))">
                                    <xsl:text>SIR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/073BAR.usx'))">
                                    <xsl:text>BAR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/074LJE.usx'))">
                                    <xsl:text>LJE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/075S3Y.usx'))">
                                    <xsl:text>S3Y_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/076SUS.usx'))">
                                    <xsl:text>SUS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/077BEL.usx'))">
                                    <xsl:text>BEL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0781MA.usx'))">
                                    <xsl:text>1MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0792MA.usx'))">
                                    <xsl:text>2MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0803MA.usx'))">
                                    <xsl:text>3MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0814MA.usx'))">
                                    <xsl:text>4MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0821ES.usx'))">
                                    <xsl:text>1ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0832ES.usx'))">
                                    <xsl:text>2ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/084MAN.usx'))">
                                    <xsl:text>MAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/085PS2.usx'))">
                                    <xsl:text>PS2_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/086ODA.usx'))">
                                    <xsl:text>ODA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/087PSS.usx'))">
                                    <xsl:text>PSS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>index</xsl:otherwise>
            </xsl:choose>
            <!-- bookbefore -->
      </xsl:template>
      <!-- ============================ book after -->
      <xsl:template name="bookafter">
            <xsl:param name="string"/>
            <!-- bookafter -->
            <xsl:choose>
                  <xsl:when test="$string = 'FRT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/001GEN.usx'))">
                                    <xsl:text>GEN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/002EXO.usx'))">
                                    <xsl:text>EXO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/003LEV.usx'))">
                                    <xsl:text>LEV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/004NUM.usx'))">
                                    <xsl:text>NUM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/005DEU.usx'))">
                                    <xsl:text>DEU_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/006JOS.usx'))">
                                    <xsl:text>JOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/007JDG.usx'))">
                                    <xsl:text>JDG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/008RUT.usx'))">
                                    <xsl:text>RUT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0091SA.usx'))">
                                    <xsl:text>1SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0102SA.usx'))">
                                    <xsl:text>2SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0111KI.usx'))">
                                    <xsl:text>1KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0122KI.usx'))">
                                    <xsl:text>2KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0131CH.usx'))">
                                    <xsl:text>1CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0142CH.usx'))">
                                    <xsl:text>2CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/015EZR.usx'))">
                                    <xsl:text>EZR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/016NEH.usx'))">
                                    <xsl:text>NEH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/017EST.usx'))">
                                    <xsl:text>EST_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/018JOB.usx'))">
                                    <xsl:text>JOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/019PSA.usx'))">
                                    <xsl:text>PSA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/020PRO.usx'))">
                                    <xsl:text>PRO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/021ECC.usx'))">
                                    <xsl:text>ECC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/022SNG.usx'))">
                                    <xsl:text>SNG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/023ISA.usx'))">
                                    <xsl:text>ISA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/024JER.usx'))">
                                    <xsl:text>JER_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/025LAM.usx'))">
                                    <xsl:text>LAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/026EZK.usx'))">
                                    <xsl:text>EZK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/027DAN.usx'))">
                                    <xsl:text>DAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/028HOS.usx'))">
                                    <xsl:text>HOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/029JOL.usx'))">
                                    <xsl:text>JOL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/030AMO.usx'))">
                                    <xsl:text>AMO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/031OBA.usx'))">
                                    <xsl:text>OBA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/032JON.usx'))">
                                    <xsl:text>JON_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/033MIC.usx'))">
                                    <xsl:text>MIC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/034NAM.usx'))">
                                    <xsl:text>NAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/035HAB.usx'))">
                                    <xsl:text>HAB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/036ZEP.usx'))">
                                    <xsl:text>ZEP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/037HAG.usx'))">
                                    <xsl:text>HAG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/038ZEC.usx'))">
                                    <xsl:text>ZEC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/039MAL.usx'))">
                                    <xsl:text>MAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/041MAT.usx'))">
                                    <xsl:text>MAT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/042MRK.usx'))">
                                    <xsl:text>MRK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/043LUK.usx'))">
                                    <xsl:text>LUK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/044JHN.usx'))">
                                    <xsl:text>JHN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/045ACT.usx'))">
                                    <xsl:text>ACT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/046ROM.usx'))">
                                    <xsl:text>ROM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0471CO.usx'))">
                                    <xsl:text>1CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0482CO.usx'))">
                                    <xsl:text>2CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/049GAL.usx'))">
                                    <xsl:text>GAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/050EPH.usx'))">
                                    <xsl:text>EPH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/051PHP.usx'))">
                                    <xsl:text>PHP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/052COL.usx'))">
                                    <xsl:text>COL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0531TH.usx'))">
                                    <xsl:text>1TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0542TH.usx'))">
                                    <xsl:text>2TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0551TI.usx'))">
                                    <xsl:text>1TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0562TI.usx'))">
                                    <xsl:text>2TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/057TIT.usx'))">
                                    <xsl:text>TIT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/058PHM.usx'))">
                                    <xsl:text>PHM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/059HEB.usx'))">
                                    <xsl:text>HEB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/060JAS.usx'))">
                                    <xsl:text>JAS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0611PE.usx'))">
                                    <xsl:text>1PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0622PE.usx'))">
                                    <xsl:text>2PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0631JN.usx'))">
                                    <xsl:text>1JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0642JN.usx'))">
                                    <xsl:text>2JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0653JN.usx'))">
                                    <xsl:text>3JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/066JUD.usx'))">
                                    <xsl:text>JUD_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/067REV.usx'))">
                                    <xsl:text>REV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/068TOB.usx'))">
                                    <xsl:text>TOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/069JDT.usx'))">
                                    <xsl:text>JDT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/070ESG.usx'))">
                                    <xsl:text>ESG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/071WIS.usx'))">
                                    <xsl:text>WIS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/072SIR.usx'))">
                                    <xsl:text>SIR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/073BAR.usx'))">
                                    <xsl:text>BAR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/074LJE.usx'))">
                                    <xsl:text>LJE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/075S3Y.usx'))">
                                    <xsl:text>S3Y_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/076SUS.usx'))">
                                    <xsl:text>SUS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/077BEL.usx'))">
                                    <xsl:text>BEL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0781MA.usx'))">
                                    <xsl:text>1MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0792MA.usx'))">
                                    <xsl:text>2MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0803MA.usx'))">
                                    <xsl:text>3MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0814MA.usx'))">
                                    <xsl:text>4MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0821ES.usx'))">
                                    <xsl:text>1ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/0832ES.usx'))">
                                    <xsl:text>2ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/084MAN.usx'))">
                                    <xsl:text>MAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/085PS2.usx'))">
                                    <xsl:text>PS2_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/086ODA.usx'))">
                                    <xsl:text>ODA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/087PSS.usx'))">
                                    <xsl:text>PSS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/109GLO.usx'))">
                                    <xsl:text>GLO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="doc-available(concat($usxpath,'/000.usx'))">
                                    <xsl:text>_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>index</xsl:otherwise>
            </xsl:choose>
            <!-- bookafter -->
      </xsl:template>
</xsl:stylesheet>
