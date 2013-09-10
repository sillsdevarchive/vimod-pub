
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
    # Licence:     <LPGL>
    #
    ################################################################
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="chaptbefore">
            <xsl:param name="curchap"/>
            <xsl:param name="string"/>
            <!-- chapbefore -->
            <xsl:choose>
                  <xsl:when test="$curchap = 1 and $string = 'FRT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'FRT']/chapterGroup/@number = '0'">
                                    <xsl:text>FRT.0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'FRT']/chapterGroup/@number = '0'">
                                    <xsl:text>FRT.0</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'GEN']/chapterGroup/@number = '50'">
                                    <xsl:text>GEN.50</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EXO']/chapterGroup/@number = '40'">
                                    <xsl:text>EXO.40</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LEV']/chapterGroup/@number = '27'">
                                    <xsl:text>LEV.27</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NUM']/chapterGroup/@number = '36'">
                                    <xsl:text>NUM.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'DEU']/chapterGroup/@number = '34'">
                                    <xsl:text>DEU.34</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOS']/chapterGroup/@number = '24'">
                                    <xsl:text>JOS.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JDG']/chapterGroup/@number = '21'">
                                    <xsl:text>JDG.21</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'RUT']/chapterGroup/@number = '4'">
                                    <xsl:text>RUT.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1SA']/chapterGroup/@number = '31'">
                                    <xsl:text>1SA.31</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2SA']/chapterGroup/@number = '36'">
                                    <xsl:text>2SA.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1KI']/chapterGroup/@number = '22'">
                                    <xsl:text>1KI.22</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2KI']/chapterGroup/@number = '24'">
                                    <xsl:text>2KI.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1CH']/chapterGroup/@number = '29'">
                                    <xsl:text>1CH.29</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2CH']/chapterGroup/@number = '36'">
                                    <xsl:text>2CH.36</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EZR']/chapterGroup/@number = '10'">
                                    <xsl:text>EZR.10</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NEH']/chapterGroup/@number = '13'">
                                    <xsl:text>NEH.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EST']/chapterGroup/@number = '10'">
                                    <xsl:text>EST.10</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOB']/chapterGroup/@number = '42'">
                                    <xsl:text>JOB.42</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PSA']/chapterGroup/@number = '150'">
                                    <xsl:text>PSA.150</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PRO']/chapterGroup/@number = '31'">
                                    <xsl:text>PRO.31</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ECC']/chapterGroup/@number = '12'">
                                    <xsl:text>ECC.12</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SNG']/chapterGroup/@number = '8'">
                                    <xsl:text>SNG.8</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ISA']/chapterGroup/@number = '66'">
                                    <xsl:text>ISA.66</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JER']/chapterGroup/@number = '52'">
                                    <xsl:text>JER.52</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LAM']/chapterGroup/@number = '5'">
                                    <xsl:text>LAM.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EZK']/chapterGroup/@number = '48'">
                                    <xsl:text>EZK.48</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'DAN']/chapterGroup/@number = '12'">
                                    <xsl:text>DAN.12</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HOS']/chapterGroup/@number = '14'">
                                    <xsl:text>HOS.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOL']/chapterGroup/@number = '3'">
                                    <xsl:text>JOL.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'AMO']/chapterGroup/@number = '9'">
                                    <xsl:text>AMO.9</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'OBA']/chapterGroup/@number = '1'">
                                    <xsl:text>OBA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JON']/chapterGroup/@number = '4'">
                                    <xsl:text>JON.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MIC']/chapterGroup/@number = '7'">
                                    <xsl:text>MIC.7</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NAM']/chapterGroup/@number = '3'">
                                    <xsl:text>NAM.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HAB']/chapterGroup/@number = '3'">
                                    <xsl:text>HAB.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ZEP']/chapterGroup/@number = '3'">
                                    <xsl:text>ZEP.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HAG']/chapterGroup/@number = '2'">
                                    <xsl:text>HAG.2</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ZEC']/chapterGroup/@number = '14'">
                                    <xsl:text>ZEC.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAL']/chapterGroup/@number = '4'">
                                    <xsl:text>MAL.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAT']/chapterGroup/@number = '28'">
                                    <xsl:text>MAT.28</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MRK']/chapterGroup/@number = '16'">
                                    <xsl:text>MRK.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LUK']/chapterGroup/@number = '24'">
                                    <xsl:text>LUK.24</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JHN']/chapterGroup/@number = '21'">
                                    <xsl:text>JHN.21</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ACT']/chapterGroup/@number = '28'">
                                    <xsl:text>ACT.28</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ROM']/chapterGroup/@number = '16'">
                                    <xsl:text>ROM.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1CO']/chapterGroup/@number = '16'">
                                    <xsl:text>1CO.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2CO']/chapterGroup/@number = '13'">
                                    <xsl:text>2CO.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'GAL']/chapterGroup/@number = '6'">
                                    <xsl:text>GAL.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EPH']/chapterGroup/@number = '6'">
                                    <xsl:text>EPH.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PHP']/chapterGroup/@number = '4'">
                                    <xsl:text>PHP.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'COL']/chapterGroup/@number = '4'">
                                    <xsl:text>COL.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1TH']/chapterGroup/@number = '5'">
                                    <xsl:text>1TH.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2TH']/chapterGroup/@number = '3'">
                                    <xsl:text>2TH.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1TI']/chapterGroup/@number = '6'">
                                    <xsl:text>1TI.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2TI']/chapterGroup/@number = '4'">
                                    <xsl:text>2TI.4</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'TIT']/chapterGroup/@number = '3'">
                                    <xsl:text>TIT.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PHM']/chapterGroup/@number = '1'">
                                    <xsl:text>PHM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HEB']/chapterGroup/@number = '13'">
                                    <xsl:text>HEB.13</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JAS']/chapterGroup/@number = '5'">
                                    <xsl:text>JAS.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1PE']/chapterGroup/@number = '5'">
                                    <xsl:text>1PE.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2PE']/chapterGroup/@number = '3'">
                                    <xsl:text>2PE.3</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1JN']/chapterGroup/@number = '5'">
                                    <xsl:text>1JN.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2JN']/chapterGroup/@number = '1'">
                                    <xsl:text>2JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '3JN']/chapterGroup/@number = '1'">
                                    <xsl:text>3JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JUD']/chapterGroup/@number = '1'">
                                    <xsl:text>JUD.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'REV']/chapterGroup/@number = '22'">
                                    <xsl:text>REV.22</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'TOB']/chapterGroup/@number = '14'">
                                    <xsl:text>TOB.14</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JDT']/chapterGroup/@number = '16'">
                                    <xsl:text>JDT.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ESG']/chapterGroup/@number = '16'">
                                    <xsl:text>ESG.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'WIS']/chapterGroup/@number = '19'">
                                    <xsl:text>WIS.19</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SIR']/chapterGroup/@number = '51'">
                                    <xsl:text>SIR.51</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'BAR']/chapterGroup/@number = '5'">
                                    <xsl:text>BAR.5</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LJE']/chapterGroup/@number = '6'">
                                    <xsl:text>LJE.6</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'S3Y']/chapterGroup/@number = '1'">
                                    <xsl:text>S3Y.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SUS']/chapterGroup/@number = '1'">
                                    <xsl:text>SUS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'BEL']/chapterGroup/@number = '1'">
                                    <xsl:text>BEL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1MA']/chapterGroup/@number = '16'">
                                    <xsl:text>1MA.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2MA']/chapterGroup/@number = '15'">
                                    <xsl:text>2MA.15</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '3MA']/chapterGroup/@number = '7'">
                                    <xsl:text>3MA.7</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '4MA']/chapterGroup/@number = '18'">
                                    <xsl:text>4MA.18</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1ES']/chapterGroup/@number = '9'">
                                    <xsl:text>1ES.9</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2ES']/chapterGroup/@number = '16'">
                                    <xsl:text>2ES.16</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAN']/chapterGroup/@number = '1'">
                                    <xsl:text>MAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PS2']/chapterGroup/@number = '151'">
                                    <xsl:text>PS2.151</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ODA']/chapterGroup/@number = '1'">
                                    <xsl:text>ODA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PSS']/chapterGroup/@number = '2'">
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
                              <xsl:when test="//usx[@book = 'GEN']/chapterGroup/@number = '1'">
                                    <xsl:text>GEN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 50 and $string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EXO']/chapterGroup/@number = '1'">
                                    <xsl:text>EXO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 40 and $string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LEV']/chapterGroup/@number = '1'">
                                    <xsl:text>LEV.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 27 and $string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NUM']/chapterGroup/@number = '1'">
                                    <xsl:text>NUM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'DEU']/chapterGroup/@number = '1'">
                                    <xsl:text>DEU.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 34 and $string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOS']/chapterGroup/@number = '1'">
                                    <xsl:text>JOS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JDG']/chapterGroup/@number = '1'">
                                    <xsl:text>JDG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'RUT']/chapterGroup/@number = '1'">
                                    <xsl:text>RUT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1SA']/chapterGroup/@number = '1'">
                                    <xsl:text>1SA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2SA']/chapterGroup/@number = '1'">
                                    <xsl:text>2SA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1KI']/chapterGroup/@number = '1'">
                                    <xsl:text>1KI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2KI']/chapterGroup/@number = '1'">
                                    <xsl:text>2KI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1CH']/chapterGroup/@number = '1'">
                                    <xsl:text>1CH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 29 and $string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2CH']/chapterGroup/@number = '1'">
                                    <xsl:text>2CH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EZR']/chapterGroup/@number = '1'">
                                    <xsl:text>EZR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NEH']/chapterGroup/@number = '1'">
                                    <xsl:text>NEH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EST']/chapterGroup/@number = '1'">
                                    <xsl:text>EST.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOB']/chapterGroup/@number = '1'">
                                    <xsl:text>JOB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 42 and $string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PSA']/chapterGroup/@number = '1'">
                                    <xsl:text>PSA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 150 and $string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PRO']/chapterGroup/@number = '1'">
                                    <xsl:text>PRO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ECC']/chapterGroup/@number = '1'">
                                    <xsl:text>ECC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SNG']/chapterGroup/@number = '1'">
                                    <xsl:text>SNG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 8 and $string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ISA']/chapterGroup/@number = '1'">
                                    <xsl:text>ISA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 66 and $string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JER']/chapterGroup/@number = '1'">
                                    <xsl:text>JER.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 52 and $string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LAM']/chapterGroup/@number = '1'">
                                    <xsl:text>LAM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EZK']/chapterGroup/@number = '1'">
                                    <xsl:text>EZK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 48 and $string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'DAN']/chapterGroup/@number = '1'">
                                    <xsl:text>DAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HOS']/chapterGroup/@number = '1'">
                                    <xsl:text>HOS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JOL']/chapterGroup/@number = '1'">
                                    <xsl:text>JOL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'AMO']/chapterGroup/@number = '1'">
                                    <xsl:text>AMO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'OBA']/chapterGroup/@number = '1'">
                                    <xsl:text>OBA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JON']/chapterGroup/@number = '1'">
                                    <xsl:text>JON.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MIC']/chapterGroup/@number = '1'">
                                    <xsl:text>MIC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'NAM']/chapterGroup/@number = '1'">
                                    <xsl:text>NAM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HAB']/chapterGroup/@number = '1'">
                                    <xsl:text>HAB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ZEP']/chapterGroup/@number = '1'">
                                    <xsl:text>ZEP.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HAG']/chapterGroup/@number = '1'">
                                    <xsl:text>HAG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 2 and $string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ZEC']/chapterGroup/@number = '1'">
                                    <xsl:text>ZEC.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAL']/chapterGroup/@number = '1'">
                                    <xsl:text>MAL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAT']/chapterGroup/@number = '1'">
                                    <xsl:text>MAT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MRK']/chapterGroup/@number = '1'">
                                    <xsl:text>MRK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LUK']/chapterGroup/@number = '1'">
                                    <xsl:text>LUK.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JHN']/chapterGroup/@number = '1'">
                                    <xsl:text>JHN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ACT']/chapterGroup/@number = '1'">
                                    <xsl:text>ACT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ROM']/chapterGroup/@number = '1'">
                                    <xsl:text>ROM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1CO']/chapterGroup/@number = '1'">
                                    <xsl:text>1CO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2CO']/chapterGroup/@number = '1'">
                                    <xsl:text>2CO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'GAL']/chapterGroup/@number = '1'">
                                    <xsl:text>GAL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'EPH']/chapterGroup/@number = '1'">
                                    <xsl:text>EPH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PHP']/chapterGroup/@number = '1'">
                                    <xsl:text>PHP.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'COL']/chapterGroup/@number = '1'">
                                    <xsl:text>COL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1TH']/chapterGroup/@number = '1'">
                                    <xsl:text>1TH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2TH']/chapterGroup/@number = '1'">
                                    <xsl:text>2TH.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1TI']/chapterGroup/@number = '1'">
                                    <xsl:text>1TI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2TI']/chapterGroup/@number = '1'">
                                    <xsl:text>2TI.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'TIT']/chapterGroup/@number = '1'">
                                    <xsl:text>TIT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PHM']/chapterGroup/@number = '1'">
                                    <xsl:text>PHM.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'HEB']/chapterGroup/@number = '1'">
                                    <xsl:text>HEB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JAS']/chapterGroup/@number = '1'">
                                    <xsl:text>JAS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1PE']/chapterGroup/@number = '1'">
                                    <xsl:text>1PE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2PE']/chapterGroup/@number = '1'">
                                    <xsl:text>2PE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1JN']/chapterGroup/@number = '1'">
                                    <xsl:text>1JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2JN']/chapterGroup/@number = '1'">
                                    <xsl:text>2JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '3JN']/chapterGroup/@number = '1'">
                                    <xsl:text>3JN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JUD']/chapterGroup/@number = '1'">
                                    <xsl:text>JUD.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'REV']/chapterGroup/@number = '1'">
                                    <xsl:text>REV.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'TOB']/chapterGroup/@number = '1'">
                                    <xsl:text>TOB.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'JDT']/chapterGroup/@number = '1'">
                                    <xsl:text>JDT.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ESG']/chapterGroup/@number = '1'">
                                    <xsl:text>ESG.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'WIS']/chapterGroup/@number = '1'">
                                    <xsl:text>WIS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 19 and $string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SIR']/chapterGroup/@number = '1'">
                                    <xsl:text>SIR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 51 and $string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'BAR']/chapterGroup/@number = '1'">
                                    <xsl:text>BAR.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'LJE']/chapterGroup/@number = '1'">
                                    <xsl:text>LJE.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'S3Y']/chapterGroup/@number = '1'">
                                    <xsl:text>S3Y.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'SUS']/chapterGroup/@number = '1'">
                                    <xsl:text>SUS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'BEL']/chapterGroup/@number = '1'">
                                    <xsl:text>BEL.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1MA']/chapterGroup/@number = '1'">
                                    <xsl:text>1MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2MA']/chapterGroup/@number = '1'">
                                    <xsl:text>2MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 15 and $string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '3MA']/chapterGroup/@number = '1'">
                                    <xsl:text>3MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '4MA']/chapterGroup/@number = '1'">
                                    <xsl:text>4MA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 18 and $string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '1ES']/chapterGroup/@number = '1'">
                                    <xsl:text>1ES.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '2ES']/chapterGroup/@number = '1'">
                                    <xsl:text>2ES.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'MAN']/chapterGroup/@number = '1'">
                                    <xsl:text>MAN.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PS2']/chapterGroup/@number = '1'">
                                    <xsl:text>PS2.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 151 and $string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'ODA']/chapterGroup/@number = '1'">
                                    <xsl:text>ODA.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'PSS']/chapterGroup/@number = '1'">
                                    <xsl:text>PSS.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 2 and $string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = 'GLO']/chapterGroup/@number = '1'">
                                    <xsl:text>GLO.1</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>../index/index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$curchap = 0 and $string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="//usx[@book = '']/chapterGroup/@number = '1'">
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
                              <xsl:when test="//usx/@book = 'FRT'">
                                    <xsl:text>FRT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'FRT'">
                                    <xsl:text>FRT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'GEN'">
                                    <xsl:text>GEN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EXO'">
                                    <xsl:text>EXO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LEV'">
                                    <xsl:text>LEV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NUM'">
                                    <xsl:text>NUM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'DEU'">
                                    <xsl:text>DEU_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOS'">
                                    <xsl:text>JOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JDG'">
                                    <xsl:text>JDG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'RUT'">
                                    <xsl:text>RUT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1SA'">
                                    <xsl:text>1SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2SA'">
                                    <xsl:text>2SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1KI'">
                                    <xsl:text>1KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2KI'">
                                    <xsl:text>2KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1CH'">
                                    <xsl:text>1CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2CH'">
                                    <xsl:text>2CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EZR'">
                                    <xsl:text>EZR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NEH'">
                                    <xsl:text>NEH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EST'">
                                    <xsl:text>EST_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOB'">
                                    <xsl:text>JOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PSA'">
                                    <xsl:text>PSA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PRO'">
                                    <xsl:text>PRO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ECC'">
                                    <xsl:text>ECC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SNG'">
                                    <xsl:text>SNG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ISA'">
                                    <xsl:text>ISA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JER'">
                                    <xsl:text>JER_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LAM'">
                                    <xsl:text>LAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EZK'">
                                    <xsl:text>EZK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'DAN'">
                                    <xsl:text>DAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HOS'">
                                    <xsl:text>HOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOL'">
                                    <xsl:text>JOL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'AMO'">
                                    <xsl:text>AMO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'OBA'">
                                    <xsl:text>OBA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JON'">
                                    <xsl:text>JON_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MIC'">
                                    <xsl:text>MIC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NAM'">
                                    <xsl:text>NAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HAB'">
                                    <xsl:text>HAB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ZEP'">
                                    <xsl:text>ZEP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HAG'">
                                    <xsl:text>HAG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ZEC'">
                                    <xsl:text>ZEC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAL'">
                                    <xsl:text>MAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAT'">
                                    <xsl:text>MAT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MRK'">
                                    <xsl:text>MRK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LUK'">
                                    <xsl:text>LUK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JHN'">
                                    <xsl:text>JHN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ACT'">
                                    <xsl:text>ACT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ROM'">
                                    <xsl:text>ROM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1CO'">
                                    <xsl:text>1CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2CO'">
                                    <xsl:text>2CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'GAL'">
                                    <xsl:text>GAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EPH'">
                                    <xsl:text>EPH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PHP'">
                                    <xsl:text>PHP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'COL'">
                                    <xsl:text>COL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1TH'">
                                    <xsl:text>1TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2TH'">
                                    <xsl:text>2TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1TI'">
                                    <xsl:text>1TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2TI'">
                                    <xsl:text>2TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'TIT'">
                                    <xsl:text>TIT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PHM'">
                                    <xsl:text>PHM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HEB'">
                                    <xsl:text>HEB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JAS'">
                                    <xsl:text>JAS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1PE'">
                                    <xsl:text>1PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2PE'">
                                    <xsl:text>2PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1JN'">
                                    <xsl:text>1JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2JN'">
                                    <xsl:text>2JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '3JN'">
                                    <xsl:text>3JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JUD'">
                                    <xsl:text>JUD_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'REV'">
                                    <xsl:text>REV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'TOB'">
                                    <xsl:text>TOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JDT'">
                                    <xsl:text>JDT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ESG'">
                                    <xsl:text>ESG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'WIS'">
                                    <xsl:text>WIS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SIR'">
                                    <xsl:text>SIR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'BAR'">
                                    <xsl:text>BAR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LJE'">
                                    <xsl:text>LJE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'S3Y'">
                                    <xsl:text>S3Y_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SUS'">
                                    <xsl:text>SUS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'BEL'">
                                    <xsl:text>BEL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1MA'">
                                    <xsl:text>1MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2MA'">
                                    <xsl:text>2MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '3MA'">
                                    <xsl:text>3MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '4MA'">
                                    <xsl:text>4MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1ES'">
                                    <xsl:text>1ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2ES'">
                                    <xsl:text>2ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAN'">
                                    <xsl:text>MAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PS2'">
                                    <xsl:text>PS2_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ODA'">
                                    <xsl:text>ODA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PSS'">
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
                              <xsl:when test="//usx/@book = 'GEN'">
                                    <xsl:text>GEN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EXO'">
                                    <xsl:text>EXO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LEV'">
                                    <xsl:text>LEV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NUM'">
                                    <xsl:text>NUM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'DEU'">
                                    <xsl:text>DEU_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOS'">
                                    <xsl:text>JOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JDG'">
                                    <xsl:text>JDG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'RUT'">
                                    <xsl:text>RUT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1SA'">
                                    <xsl:text>1SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2SA'">
                                    <xsl:text>2SA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1KI'">
                                    <xsl:text>1KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2KI'">
                                    <xsl:text>2KI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1CH'">
                                    <xsl:text>1CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2CH'">
                                    <xsl:text>2CH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EZR'">
                                    <xsl:text>EZR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NEH'">
                                    <xsl:text>NEH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EST'">
                                    <xsl:text>EST_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOB'">
                                    <xsl:text>JOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PSA'">
                                    <xsl:text>PSA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PRO'">
                                    <xsl:text>PRO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ECC'">
                                    <xsl:text>ECC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SNG'">
                                    <xsl:text>SNG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ISA'">
                                    <xsl:text>ISA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JER'">
                                    <xsl:text>JER_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LAM'">
                                    <xsl:text>LAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EZK'">
                                    <xsl:text>EZK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'DAN'">
                                    <xsl:text>DAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HOS'">
                                    <xsl:text>HOS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JOL'">
                                    <xsl:text>JOL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'AMO'">
                                    <xsl:text>AMO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'OBA'">
                                    <xsl:text>OBA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JON'">
                                    <xsl:text>JON_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MIC'">
                                    <xsl:text>MIC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'NAM'">
                                    <xsl:text>NAM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HAB'">
                                    <xsl:text>HAB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ZEP'">
                                    <xsl:text>ZEP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HAG'">
                                    <xsl:text>HAG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ZEC'">
                                    <xsl:text>ZEC_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAL'">
                                    <xsl:text>MAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAT'">
                                    <xsl:text>MAT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MRK'">
                                    <xsl:text>MRK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LUK'">
                                    <xsl:text>LUK_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JHN'">
                                    <xsl:text>JHN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ACT'">
                                    <xsl:text>ACT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ROM'">
                                    <xsl:text>ROM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1CO'">
                                    <xsl:text>1CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2CO'">
                                    <xsl:text>2CO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'GAL'">
                                    <xsl:text>GAL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'EPH'">
                                    <xsl:text>EPH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PHP'">
                                    <xsl:text>PHP_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'COL'">
                                    <xsl:text>COL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1TH'">
                                    <xsl:text>1TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2TH'">
                                    <xsl:text>2TH_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1TI'">
                                    <xsl:text>1TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2TI'">
                                    <xsl:text>2TI_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'TIT'">
                                    <xsl:text>TIT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PHM'">
                                    <xsl:text>PHM_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'HEB'">
                                    <xsl:text>HEB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JAS'">
                                    <xsl:text>JAS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1PE'">
                                    <xsl:text>1PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2PE'">
                                    <xsl:text>2PE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1JN'">
                                    <xsl:text>1JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2JN'">
                                    <xsl:text>2JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '3JN'">
                                    <xsl:text>3JN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JUD'">
                                    <xsl:text>JUD_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'REV'">
                                    <xsl:text>REV_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'TOB'">
                                    <xsl:text>TOB_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'JDT'">
                                    <xsl:text>JDT_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ESG'">
                                    <xsl:text>ESG_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'WIS'">
                                    <xsl:text>WIS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SIR'">
                                    <xsl:text>SIR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'BAR'">
                                    <xsl:text>BAR_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'LJE'">
                                    <xsl:text>LJE_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'S3Y'">
                                    <xsl:text>S3Y_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'SUS'">
                                    <xsl:text>SUS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'BEL'">
                                    <xsl:text>BEL_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1MA'">
                                    <xsl:text>1MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2MA'">
                                    <xsl:text>2MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '3MA'">
                                    <xsl:text>3MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '4MA'">
                                    <xsl:text>4MA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '1ES'">
                                    <xsl:text>1ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = '2ES'">
                                    <xsl:text>2ES_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'MAN'">
                                    <xsl:text>MAN_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PS2'">
                                    <xsl:text>PS2_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'ODA'">
                                    <xsl:text>ODA_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'PSS'">
                                    <xsl:text>PSS_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = 'GLO'">
                                    <xsl:text>GLO_index</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>index</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$string = 'GLO'">
                        <xsl:choose>
                              <xsl:when test="//usx/@book = ''">
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
