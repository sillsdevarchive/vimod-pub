<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template name="chaptbefore">
            <xsl:param name="chaptbefore"/>
            <xsl:param name="curchap"/>
            <xsl:param name="book"/>
            <xsl:choose>
                  <xsl:when test="$curchap = 1 and $book = 'GEN'">
                        <xsl:text>index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'EXO'">
                        <xsl:text>GEN.50</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'LEV'">
                        <xsl:text>EXO.40</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'NUM'">
                        <xsl:text>LEV.27</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'DEU'">
                        <xsl:text>NUM.36</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JOS'">
                        <xsl:text>DEU.34</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JDG'">
                        <xsl:text>JOS.24</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'RUT'">
                        <xsl:text>JDG.21</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1SA'">
                        <xsl:text>RUT.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2SA'">
                        <xsl:text>1SA.31</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1KI'">
                        <xsl:text>2SA.36</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2KI'">
                        <xsl:text>1KI.22</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1CH'">
                        <xsl:text>2KI.24</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2CH'">
                        <xsl:text>1CH.29</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'EZR'">
                        <xsl:text>2CH.36</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'NEH'">
                        <xsl:text>EZR.10</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'EST'">
                        <xsl:text>NEH.13</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JOB'">
                        <xsl:text>EST.10</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PSA'">
                        <xsl:text>JOB.42</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PRO'">
                        <xsl:text>PSA.150</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ECC'">
                        <xsl:text>PRO.31</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'SNG'">
                        <xsl:text>ECC.12</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ISA'">
                        <xsl:text>SNG.8</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JER'">
                        <xsl:text>ISA.66</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'LAM'">
                        <xsl:text>JER.52</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'EZK'">
                        <xsl:text>LAM.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'DAN'">
                        <xsl:text>EZK.48</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'HOS'">
                        <xsl:text>DAN.12</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JOL'">
                        <xsl:text>HOS.14</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'AMO'">
                        <xsl:text>JOL.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'OBA'">
                        <xsl:text>AMO.9</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JON'">
                        <xsl:text>OBA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MIC'">
                        <xsl:text>JON.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'NAM'">
                        <xsl:text>MIC.7</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'HAB'">
                        <xsl:text>NAM.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ZEP'">
                        <xsl:text>HAB.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'HAG'">
                        <xsl:text>ZEP.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ZEC'">
                        <xsl:text>HAG.2</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MAL'">
                        <xsl:text>ZEC.14</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MAT'">
                        <xsl:text>MAL.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MRK'">
                        <xsl:text>MAT.28</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'LUK'">
                        <xsl:text>MRK.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JHN'">
                        <xsl:text>LUK.24</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ACT'">
                        <xsl:text>JHN.21</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ROM'">
                        <xsl:text>ACT.28</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1CO'">
                        <xsl:text>ROM.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2CO'">
                        <xsl:text>1CO.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'GAL'">
                        <xsl:text>2CO.13</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'EPH'">
                        <xsl:text>GAL.6</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PHP'">
                        <xsl:text>EPH.6</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'COL'">
                        <xsl:text>PHP.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1TH'">
                        <xsl:text>COL.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2TH'">
                        <xsl:text>1TH.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1TI'">
                        <xsl:text>2TH.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2TI'">
                        <xsl:text>1TI.6</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'TIT'">
                        <xsl:text>2TI.4</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PHM'">
                        <xsl:text>TIT.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'HEB'">
                        <xsl:text>PHM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JAS'">
                        <xsl:text>HEB.13</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1PE'">
                        <xsl:text>JAS.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2PE'">
                        <xsl:text>1PE.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1JN'">
                        <xsl:text>2PE.3</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2JN'">
                        <xsl:text>1JN.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '3JN'">
                        <xsl:text>2JN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JUD'">
                        <xsl:text>3JN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'REV'">
                        <xsl:text>JUD.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'TOB'">
                        <xsl:text>REV.22</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JDT'">
                        <xsl:text>TOB.14</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ESG'">
                        <xsl:text>JDT.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'WIS'">
                        <xsl:text>ESG.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'SIR'">
                        <xsl:text>WIS.19</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'BAR'">
                        <xsl:text>SIR.51</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'LJE'">
                        <xsl:text>BAR.5</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'S3Y'">
                        <xsl:text>LJE.6</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'SUS'">
                        <xsl:text>S3Y.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'BEL'">
                        <xsl:text>SUS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1MA'">
                        <xsl:text>BEL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2MA'">
                        <xsl:text>1MA.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '3MA'">
                        <xsl:text>2MA.15</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '4MA'">
                        <xsl:text>3MA.7</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '1ES'">
                        <xsl:text>4MA.18</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2ES'">
                        <xsl:text>1ES.9</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MAN'">
                        <xsl:text>2ES.16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PS2'">
                        <xsl:text>MAN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ODA'">
                        <xsl:text>PS2.151</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PSS'">
                        <xsl:text>ODA.</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$book"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="string($chaptbefore)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="chaptafter">
            <xsl:param name="chaptafter"/>
            <xsl:param name="curchap"/>
            <xsl:param name="book"/>
            <xsl:choose>
                  <xsl:when test="$curchap = 50 and $book = 'GEN'">
                        <xsl:text>EXO.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 40 and $book = 'EXO'">
                        <xsl:text>LEV.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 27 and $book = 'LEV'">
                        <xsl:text>NUM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $book = 'NUM'">
                        <xsl:text>DEU.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 34 and $book = 'DEU'">
                        <xsl:text>JOS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $book = 'JOS'">
                        <xsl:text>JDG.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $book = 'JDG'">
                        <xsl:text>RUT.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = 'RUT'">
                        <xsl:text>1SA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $book = '1SA'">
                        <xsl:text>2SA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $book = '2SA'">
                        <xsl:text>1KI.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $book = '1KI'">
                        <xsl:text>2KI.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $book = '2KI'">
                        <xsl:text>1CH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 29 and $book = '1CH'">
                        <xsl:text>2CH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 36 and $book = '2CH'">
                        <xsl:text>EZR.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $book = 'EZR'">
                        <xsl:text>NEH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $book = 'NEH'">
                        <xsl:text>EST.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 10 and $book = 'EST'">
                        <xsl:text>JOB.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 42 and $book = 'JOB'">
                        <xsl:text>PSA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 150 and $book = 'PSA'">
                        <xsl:text>PRO.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 31 and $book = 'PRO'">
                        <xsl:text>ECC.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $book = 'ECC'">
                        <xsl:text>SNG.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 8 and $book = 'SNG'">
                        <xsl:text>ISA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 66 and $book = 'ISA'">
                        <xsl:text>JER.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 52 and $book = 'JER'">
                        <xsl:text>LAM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = 'LAM'">
                        <xsl:text>EZK.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 48 and $book = 'EZK'">
                        <xsl:text>DAN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 12 and $book = 'DAN'">
                        <xsl:text>HOS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $book = 'HOS'">
                        <xsl:text>JOL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = 'JOL'">
                        <xsl:text>AMO.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $book = 'AMO'">
                        <xsl:text>OBA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'OBA'">
                        <xsl:text>JON.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = 'JON'">
                        <xsl:text>MIC.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $book = 'MIC'">
                        <xsl:text>NAM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = 'NAM'">
                        <xsl:text>HAB.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = 'HAB'">
                        <xsl:text>ZEP.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = 'ZEP'">
                        <xsl:text>HAG.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 2 and $book = 'HAG'">
                        <xsl:text>ZEC.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $book = 'ZEC'">
                        <xsl:text>MAL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = 'MAL'">
                        <xsl:text>MAT.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $book = 'MAT'">
                        <xsl:text>MRK.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = 'MRK'">
                        <xsl:text>LUK.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 24 and $book = 'LUK'">
                        <xsl:text>JHN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 21 and $book = 'JHN'">
                        <xsl:text>ACT.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 28 and $book = 'ACT'">
                        <xsl:text>ROM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = 'ROM'">
                        <xsl:text>1CO.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = '1CO'">
                        <xsl:text>2CO.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $book = '2CO'">
                        <xsl:text>GAL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $book = 'GAL'">
                        <xsl:text>EPH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $book = 'EPH'">
                        <xsl:text>PHP.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = 'PHP'">
                        <xsl:text>COL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = 'COL'">
                        <xsl:text>1TH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = '1TH'">
                        <xsl:text>2TH.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = '2TH'">
                        <xsl:text>1TI.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $book = '1TI'">
                        <xsl:text>2TI.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 4 and $book = '2TI'">
                        <xsl:text>TIT.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = 'TIT'">
                        <xsl:text>PHM.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PHM'">
                        <xsl:text>HEB.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 13 and $book = 'HEB'">
                        <xsl:text>JAS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = 'JAS'">
                        <xsl:text>1PE.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = '1PE'">
                        <xsl:text>2PE.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 3 and $book = '2PE'">
                        <xsl:text>1JN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = '1JN'">
                        <xsl:text>2JN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '2JN'">
                        <xsl:text>3JN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = '3JN'">
                        <xsl:text>JUD.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'JUD'">
                        <xsl:text>REV.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $book = 'REV'">
                        <xsl:text>index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 22 and $book = 'REV'">
                        <xsl:text>TOB.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 14 and $book = 'TOB'">
                        <xsl:text>JDT.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = 'JDT'">
                        <xsl:text>ESG.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = 'ESG'">
                        <xsl:text>WIS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 19 and $book = 'WIS'">
                        <xsl:text>SIR.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 51 and $book = 'SIR'">
                        <xsl:text>BAR.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 5 and $book = 'BAR'">
                        <xsl:text>LJE.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 6 and $book = 'LJE'">
                        <xsl:text>S3Y.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'S3Y'">
                        <xsl:text>SUS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'SUS'">
                        <xsl:text>BEL.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'BEL'">
                        <xsl:text>1MA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = '1MA'">
                        <xsl:text>2MA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 15 and $book = '2MA'">
                        <xsl:text>3MA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 7 and $book = '3MA'">
                        <xsl:text>4MA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 18 and $book = '4MA'">
                        <xsl:text>1ES.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 9 and $book = '1ES'">
                        <xsl:text>2ES.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 16 and $book = '2ES'">
                        <xsl:text>MAN.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'MAN'">
                        <xsl:text>PS2.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 151 and $book = 'PS2'">
                        <xsl:text>ODA.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'ODA'">
                        <xsl:text>PSS.1</xsl:text>
                  </xsl:when>
                  <xsl:when test="$curchap = 1 and $book = 'PSS'">
                        <xsl:text>index</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$book"/>
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="string($chaptafter)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="bookbefore">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:text>GEN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:text>GEN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:text>EXO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:text>LEV_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:text>NUM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:text>DEU_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:text>JOS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:text>JDG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:text>RUT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:text>1SA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:text>2SA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:text>1KI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:text>2KI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:text>1CH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:text>2CH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:text>EZR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:text>NEH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:text>EST_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:text>JOB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:text>PSA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:text>PRO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:text>ECC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:text>SNG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:text>ISA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:text>JER_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:text>LAM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:text>EZK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:text>DAN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:text>HOS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:text>JOL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:text>AMO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:text>OBA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:text>JON_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:text>MIC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:text>NAM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:text>HAB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:text>ZEP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:text>HAG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:text>ZEC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:text>MAL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:text>MAT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:text>MRK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:text>LUK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:text>JHN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:text>ACT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:text>ROM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:text>1CO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:text>2CO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:text>GAL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:text>EPH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:text>PHP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:text>COL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:text>1TH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:text>2TH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:text>1TI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:text>2TI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:text>TIT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:text>PHM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:text>HEB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:text>JAS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:text>1PE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:text>2PE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:text>1JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:text>2JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:text>3JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:text>JUD_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:text>REV_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:text>TOB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:text>JDT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:text>ESG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:text>WIS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:text>SIR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:text>BAR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:text>LJE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:text>S3Y_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:text>SUS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:text>BEL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:text>1MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:text>2MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:text>3MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:text>4MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:text>1ES_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:text>2ES_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:text>MAN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:text>PS2_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:text>ODA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZA'">
                        <xsl:text>PSS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '5EZ'">
                        <xsl:text>EZA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '6EZ'">
                        <xsl:text>5EZ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAG'">
                        <xsl:text>6EZ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS3'">
                        <xsl:text>DAG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2BA'">
                        <xsl:text>PS3_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LBA'">
                        <xsl:text>2BA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUB'">
                        <xsl:text>LBA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ENO'">
                        <xsl:text>JUB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MQ'">
                        <xsl:text>ENO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MQ'">
                        <xsl:text>1MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MQ'">
                        <xsl:text>2MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REP'">
                        <xsl:text>3MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4BA'">
                        <xsl:text>REP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAO'">
                        <xsl:text>4BA_index</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>

                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="bookafter">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:text>EXO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:text>LEV_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:text>NUM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:text>DEU_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:text>JOS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:text>JDG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:text>RUT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:text>1SA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:text>2SA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:text>1KI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:text>2KI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:text>1CH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:text>2CH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:text>EZR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:text>NEH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:text>EST_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:text>JOB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:text>PSA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:text>PRO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:text>ECC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:text>SNG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:text>ISA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:text>JER_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:text>LAM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:text>EZK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:text>DAN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:text>HOS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:text>JOL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:text>AMO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:text>OBA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:text>JON_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:text>MIC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:text>NAM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:text>HAB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:text>ZEP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:text>HAG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:text>ZEC_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:text>MAL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:text>MAT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:text>MRK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:text>LUK_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:text>JHN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:text>ACT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:text>ROM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:text>1CO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:text>2CO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:text>GAL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:text>EPH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:text>PHP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:text>COL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:text>1TH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:text>2TH_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:text>1TI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:text>2TI_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:text>TIT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:text>PHM_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:text>HEB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:text>JAS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:text>1PE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:text>2PE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:text>1JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:text>2JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:text>3JN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:text>JUD_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:text>REV_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:text>TOB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:text>JDT_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:text>ESG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:text>WIS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:text>SIR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:text>BAR_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:text>LJE_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:text>S3Y_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:text>SUS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:text>BEL_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:text>1MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:text>2MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:text>3MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:text>4MA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:text>1ES_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:text>2ES_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:text>MAN_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:text>PS2_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:text>ODA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:text>PSS_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:text>EZA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZA'">
                        <xsl:text>5EZ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '5EZ'">
                        <xsl:text>6EZ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '6EZ'">
                        <xsl:text>DAG_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAG'">
                        <xsl:text>PS3_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS3'">
                        <xsl:text>2BA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2BA'">
                        <xsl:text>LBA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LBA'">
                        <xsl:text>JUB_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUB'">
                        <xsl:text>ENO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ENO'">
                        <xsl:text>1MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MQ'">
                        <xsl:text>2MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MQ'">
                        <xsl:text>3MQ_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MQ'">
                        <xsl:text>REP_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REP'">
                        <xsl:text>4BA_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4BA'">
                        <xsl:text>LAO_index</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAO'">
                        <xsl:text>index</xsl:text>
                  </xsl:when>
            </xsl:choose>
      </xsl:template>
</xsl:stylesheet>
