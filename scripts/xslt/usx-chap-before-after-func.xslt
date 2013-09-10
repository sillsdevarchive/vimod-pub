<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions"
                version="2.0">
   <xsl:function name="f:chapbefore">
      <xsl:param name="curchap"/>
      <xsl:param name="string"/>
      <xsl:param name="alusx"/>
      <xsl:choose>
         <xsl:when test="$curchap = 1 and $string = 'GEN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'FRT']/chapterGroup/@number = '0'">
                  <xsl:text>FRT.0.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GEN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'EXO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'GEN']/chapterGroup/@number = '50'">
                  <xsl:text>GEN.50.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EXO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'LEV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EXO']/chapterGroup/@number = '40'">
                  <xsl:text>EXO.40.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LEV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'NUM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LEV']/chapterGroup/@number = '27'">
                  <xsl:text>LEV.27.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NUM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'DEU'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NUM']/chapterGroup/@number = '36'">
                  <xsl:text>NUM.36.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DEU</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'DEU']/chapterGroup/@number = '34'">
                  <xsl:text>DEU.34.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JDG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOS']/chapterGroup/@number = '24'">
                  <xsl:text>JOS.24.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'RUT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JDG']/chapterGroup/@number = '21'">
                  <xsl:text>JDG.21.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#RUT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'RUT']/chapterGroup/@number = '4'">
                  <xsl:text>RUT.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1SA']/chapterGroup/@number = '31'">
                  <xsl:text>1SA.31.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2SA']/chapterGroup/@number = '36'">
                  <xsl:text>2SA.36.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1KI']/chapterGroup/@number = '22'">
                  <xsl:text>1KI.22.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2KI']/chapterGroup/@number = '24'">
                  <xsl:text>2KI.24.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1CH']/chapterGroup/@number = '29'">
                  <xsl:text>1CH.29.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'EZR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2CH']/chapterGroup/@number = '36'">
                  <xsl:text>2CH.36.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'NEH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EZR']/chapterGroup/@number = '10'">
                  <xsl:text>EZR.10.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NEH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'EST'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NEH']/chapterGroup/@number = '13'">
                  <xsl:text>NEH.13.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EST</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EST']/chapterGroup/@number = '10'">
                  <xsl:text>EST.10.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PSA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOB']/chapterGroup/@number = '42'">
                  <xsl:text>JOB.42.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PRO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PSA']/chapterGroup/@number = '150'">
                  <xsl:text>PSA.150.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PRO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ECC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PRO']/chapterGroup/@number = '31'">
                  <xsl:text>PRO.31.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ECC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'SNG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ECC']/chapterGroup/@number = '12'">
                  <xsl:text>ECC.12.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SNG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ISA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SNG']/chapterGroup/@number = '8'">
                  <xsl:text>SNG.8.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ISA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JER'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ISA']/chapterGroup/@number = '66'">
                  <xsl:text>ISA.66.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JER</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'LAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JER']/chapterGroup/@number = '52'">
                  <xsl:text>JER.52.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'EZK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LAM']/chapterGroup/@number = '5'">
                  <xsl:text>LAM.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'DAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EZK']/chapterGroup/@number = '48'">
                  <xsl:text>EZK.48.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'HOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'DAN']/chapterGroup/@number = '12'">
                  <xsl:text>DAN.12.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JOL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HOS']/chapterGroup/@number = '14'">
                  <xsl:text>HOS.14.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'AMO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOL']/chapterGroup/@number = '3'">
                  <xsl:text>JOL.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#AMO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'OBA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'AMO']/chapterGroup/@number = '9'">
                  <xsl:text>AMO.9.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#OBA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JON'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'OBA']/chapterGroup/@number = '1'">
                  <xsl:text>OBA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JON</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MIC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JON']/chapterGroup/@number = '4'">
                  <xsl:text>JON.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MIC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'NAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MIC']/chapterGroup/@number = '7'">
                  <xsl:text>MIC.7.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'HAB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NAM']/chapterGroup/@number = '3'">
                  <xsl:text>NAM.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ZEP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HAB']/chapterGroup/@number = '3'">
                  <xsl:text>HAB.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'HAG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ZEP']/chapterGroup/@number = '3'">
                  <xsl:text>ZEP.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ZEC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HAG']/chapterGroup/@number = '2'">
                  <xsl:text>HAG.2.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ZEC']/chapterGroup/@number = '14'">
                  <xsl:text>ZEC.14.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MAT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAL']/chapterGroup/@number = '4'">
                  <xsl:text>MAL.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MRK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAT']/chapterGroup/@number = '28'">
                  <xsl:text>MAT.28.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MRK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'LUK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MRK']/chapterGroup/@number = '16'">
                  <xsl:text>MRK.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LUK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JHN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LUK']/chapterGroup/@number = '24'">
                  <xsl:text>LUK.24.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JHN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ACT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JHN']/chapterGroup/@number = '21'">
                  <xsl:text>JHN.21.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ACT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ROM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ACT']/chapterGroup/@number = '28'">
                  <xsl:text>ACT.28.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ROM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ROM']/chapterGroup/@number = '16'">
                  <xsl:text>ROM.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1CO']/chapterGroup/@number = '16'">
                  <xsl:text>1CO.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'GAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2CO']/chapterGroup/@number = '13'">
                  <xsl:text>2CO.13.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'EPH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'GAL']/chapterGroup/@number = '6'">
                  <xsl:text>GAL.6.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EPH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PHP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EPH']/chapterGroup/@number = '6'">
                  <xsl:text>EPH.6.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'COL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PHP']/chapterGroup/@number = '4'">
                  <xsl:text>PHP.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#COL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'COL']/chapterGroup/@number = '4'">
                  <xsl:text>COL.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1TH']/chapterGroup/@number = '5'">
                  <xsl:text>1TH.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2TH']/chapterGroup/@number = '3'">
                  <xsl:text>2TH.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1TI']/chapterGroup/@number = '6'">
                  <xsl:text>1TI.6.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'TIT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2TI']/chapterGroup/@number = '4'">
                  <xsl:text>2TI.4.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TIT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PHM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'TIT']/chapterGroup/@number = '3'">
                  <xsl:text>TIT.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'HEB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PHM']/chapterGroup/@number = '1'">
                  <xsl:text>PHM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HEB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JAS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HEB']/chapterGroup/@number = '13'">
                  <xsl:text>HEB.13.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JAS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JAS']/chapterGroup/@number = '5'">
                  <xsl:text>JAS.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1PE']/chapterGroup/@number = '5'">
                  <xsl:text>1PE.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2PE']/chapterGroup/@number = '3'">
                  <xsl:text>2PE.3.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1JN']/chapterGroup/@number = '5'">
                  <xsl:text>1JN.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '3JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2JN']/chapterGroup/@number = '1'">
                  <xsl:text>2JN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JUD'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '3JN']/chapterGroup/@number = '1'">
                  <xsl:text>3JN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JUD</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'REV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JUD']/chapterGroup/@number = '1'">
                  <xsl:text>JUD.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#REV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'TOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'REV']/chapterGroup/@number = '22'">
                  <xsl:text>REV.22.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JDT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'TOB']/chapterGroup/@number = '14'">
                  <xsl:text>TOB.14.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ESG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JDT']/chapterGroup/@number = '16'">
                  <xsl:text>JDT.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ESG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'WIS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ESG']/chapterGroup/@number = '16'">
                  <xsl:text>ESG.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#WIS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'SIR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'WIS']/chapterGroup/@number = '19'">
                  <xsl:text>WIS.19.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SIR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'BAR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SIR']/chapterGroup/@number = '51'">
                  <xsl:text>SIR.51.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BAR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'LJE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'BAR']/chapterGroup/@number = '5'">
                  <xsl:text>BAR.5.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LJE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'S3Y'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LJE']/chapterGroup/@number = '6'">
                  <xsl:text>LJE.6.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#S3Y</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'SUS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'S3Y']/chapterGroup/@number = '1'">
                  <xsl:text>S3Y.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SUS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'BEL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SUS']/chapterGroup/@number = '1'">
                  <xsl:text>SUS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BEL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'BEL']/chapterGroup/@number = '1'">
                  <xsl:text>BEL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1MA']/chapterGroup/@number = '16'">
                  <xsl:text>1MA.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '3MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2MA']/chapterGroup/@number = '15'">
                  <xsl:text>2MA.15.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '4MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '3MA']/chapterGroup/@number = '7'">
                  <xsl:text>3MA.7.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#4MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '1ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '4MA']/chapterGroup/@number = '18'">
                  <xsl:text>4MA.18.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1ES']/chapterGroup/@number = '9'">
                  <xsl:text>1ES.9.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2ES']/chapterGroup/@number = '16'">
                  <xsl:text>2ES.16.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PS2'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAN']/chapterGroup/@number = '1'">
                  <xsl:text>MAN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PS2</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ODA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PS2']/chapterGroup/@number = '151'">
                  <xsl:text>PS2.151.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ODA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PSS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ODA']/chapterGroup/@number = '1'">
                  <xsl:text>ODA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'GLO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PSS']/chapterGroup/@number = '1'">
                  <xsl:text>PSS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GLO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="concat($string,'.',string(number($curchap) - 1),'.html')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="f:chapafter">
      <xsl:param name="curchap"/>
      <xsl:param name="string"/>
      <xsl:param name="allusx"/>
      <xsl:choose>
         <xsl:when test="$curchap = 0 and $string = 'FRT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'GEN']/chapterGroup/@number = 1">
                  <xsl:text>GEN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#FRT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 50 and $string = 'GEN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EXO']/chapterGroup/@number = 1">
                  <xsl:text>EXO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GEN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 40 and $string = 'EXO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LEV']/chapterGroup/@number = 1">
                  <xsl:text>LEV.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EXO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 27 and $string = 'LEV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NUM']/chapterGroup/@number = 1">
                  <xsl:text>NUM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LEV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 36 and $string = 'NUM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'DEU']/chapterGroup/@number = 1">
                  <xsl:text>DEU.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NUM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 34 and $string = 'DEU'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOS']/chapterGroup/@number = 1">
                  <xsl:text>JOS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DEU</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 24 and $string = 'JOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JDG']/chapterGroup/@number = 1">
                  <xsl:text>JDG.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 21 and $string = 'JDG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'RUT']/chapterGroup/@number = 1">
                  <xsl:text>RUT.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = 'RUT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1SA']/chapterGroup/@number = 1">
                  <xsl:text>1SA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#RUT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 31 and $string = '1SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2SA']/chapterGroup/@number = 1">
                  <xsl:text>2SA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 36 and $string = '2SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1KI']/chapterGroup/@number = 1">
                  <xsl:text>1KI.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 22 and $string = '1KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2KI']/chapterGroup/@number = 1">
                  <xsl:text>2KI.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 24 and $string = '2KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1CH']/chapterGroup/@number = 1">
                  <xsl:text>1CH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 29 and $string = '1CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2CH']/chapterGroup/@number = 1">
                  <xsl:text>2CH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 36 and $string = '2CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EZR']/chapterGroup/@number = 1">
                  <xsl:text>EZR.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 10 and $string = 'EZR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NEH']/chapterGroup/@number = 1">
                  <xsl:text>NEH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 13 and $string = 'NEH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EST']/chapterGroup/@number = 1">
                  <xsl:text>EST.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NEH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 10 and $string = 'EST'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOB']/chapterGroup/@number = 1">
                  <xsl:text>JOB.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EST</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 42 and $string = 'JOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PSA']/chapterGroup/@number = 1">
                  <xsl:text>PSA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 150 and $string = 'PSA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PRO']/chapterGroup/@number = 1">
                  <xsl:text>PRO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 31 and $string = 'PRO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ECC']/chapterGroup/@number = 1">
                  <xsl:text>ECC.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PRO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 12 and $string = 'ECC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SNG']/chapterGroup/@number = 1">
                  <xsl:text>SNG.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ECC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 8 and $string = 'SNG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ISA']/chapterGroup/@number = 1">
                  <xsl:text>ISA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SNG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 66 and $string = 'ISA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JER']/chapterGroup/@number = 1">
                  <xsl:text>JER.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ISA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 52 and $string = 'JER'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LAM']/chapterGroup/@number = 1">
                  <xsl:text>LAM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JER</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = 'LAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EZK']/chapterGroup/@number = 1">
                  <xsl:text>EZK.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 48 and $string = 'EZK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'DAN']/chapterGroup/@number = 1">
                  <xsl:text>DAN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 12 and $string = 'DAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HOS']/chapterGroup/@number = 1">
                  <xsl:text>HOS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 14 and $string = 'HOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JOL']/chapterGroup/@number = 1">
                  <xsl:text>JOL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = 'JOL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'AMO']/chapterGroup/@number = 1">
                  <xsl:text>AMO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 9 and $string = 'AMO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'OBA']/chapterGroup/@number = 1">
                  <xsl:text>OBA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#AMO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'OBA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JON']/chapterGroup/@number = 1">
                  <xsl:text>JON.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#OBA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = 'JON'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MIC']/chapterGroup/@number = 1">
                  <xsl:text>MIC.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JON</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 7 and $string = 'MIC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'NAM']/chapterGroup/@number = 1">
                  <xsl:text>NAM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MIC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = 'NAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HAB']/chapterGroup/@number = 1">
                  <xsl:text>HAB.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = 'HAB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ZEP']/chapterGroup/@number = 1">
                  <xsl:text>ZEP.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = 'ZEP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HAG']/chapterGroup/@number = 1">
                  <xsl:text>HAG.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 2 and $string = 'HAG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ZEC']/chapterGroup/@number = 1">
                  <xsl:text>ZEC.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 14 and $string = 'ZEC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAL']/chapterGroup/@number = 1">
                  <xsl:text>MAL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = 'MAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAT']/chapterGroup/@number = 1">
                  <xsl:text>MAT.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 28 and $string = 'MAT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MRK']/chapterGroup/@number = 1">
                  <xsl:text>MRK.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = 'MRK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LUK']/chapterGroup/@number = 1">
                  <xsl:text>LUK.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MRK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 24 and $string = 'LUK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JHN']/chapterGroup/@number = 1">
                  <xsl:text>JHN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LUK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 21 and $string = 'JHN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ACT']/chapterGroup/@number = 1">
                  <xsl:text>ACT.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JHN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 28 and $string = 'ACT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ROM']/chapterGroup/@number = 1">
                  <xsl:text>ROM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ACT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = 'ROM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1CO']/chapterGroup/@number = 1">
                  <xsl:text>1CO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ROM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = '1CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2CO']/chapterGroup/@number = 1">
                  <xsl:text>2CO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 13 and $string = '2CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'GAL']/chapterGroup/@number = 1">
                  <xsl:text>GAL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 6 and $string = 'GAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'EPH']/chapterGroup/@number = 1">
                  <xsl:text>EPH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 6 and $string = 'EPH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PHP']/chapterGroup/@number = 1">
                  <xsl:text>PHP.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EPH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = 'PHP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'COL']/chapterGroup/@number = 1">
                  <xsl:text>COL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = 'COL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1TH']/chapterGroup/@number = 1">
                  <xsl:text>1TH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#COL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = '1TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2TH']/chapterGroup/@number = 1">
                  <xsl:text>2TH.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = '2TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1TI']/chapterGroup/@number = 1">
                  <xsl:text>1TI.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 6 and $string = '1TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2TI']/chapterGroup/@number = 1">
                  <xsl:text>2TI.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 4 and $string = '2TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'TIT']/chapterGroup/@number = 1">
                  <xsl:text>TIT.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = 'TIT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PHM']/chapterGroup/@number = 1">
                  <xsl:text>PHM.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TIT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PHM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'HEB']/chapterGroup/@number = 1">
                  <xsl:text>HEB.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 13 and $string = 'HEB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JAS']/chapterGroup/@number = 1">
                  <xsl:text>JAS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HEB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = 'JAS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1PE']/chapterGroup/@number = 1">
                  <xsl:text>1PE.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JAS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = '1PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2PE']/chapterGroup/@number = 1">
                  <xsl:text>2PE.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 3 and $string = '2PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1JN']/chapterGroup/@number = 1">
                  <xsl:text>1JN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = '1JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2JN']/chapterGroup/@number = 1">
                  <xsl:text>2JN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '2JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '3JN']/chapterGroup/@number = 1">
                  <xsl:text>3JN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = '3JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JUD']/chapterGroup/@number = 1">
                  <xsl:text>JUD.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'JUD'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'REV']/chapterGroup/@number = 1">
                  <xsl:text>REV.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JUD</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 22 and $string = 'REV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'TOB']/chapterGroup/@number = 1">
                  <xsl:text>TOB.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#REV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 14 and $string = 'TOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'JDT']/chapterGroup/@number = 1">
                  <xsl:text>JDT.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = 'JDT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ESG']/chapterGroup/@number = 1">
                  <xsl:text>ESG.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = 'ESG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'WIS']/chapterGroup/@number = 1">
                  <xsl:text>WIS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ESG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 19 and $string = 'WIS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SIR']/chapterGroup/@number = 1">
                  <xsl:text>SIR.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#WIS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 51 and $string = 'SIR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'BAR']/chapterGroup/@number = 1">
                  <xsl:text>BAR.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SIR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 5 and $string = 'BAR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'LJE']/chapterGroup/@number = 1">
                  <xsl:text>LJE.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BAR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 6 and $string = 'LJE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'S3Y']/chapterGroup/@number = 1">
                  <xsl:text>S3Y.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LJE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'S3Y'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'SUS']/chapterGroup/@number = 1">
                  <xsl:text>SUS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#S3Y</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'SUS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'BEL']/chapterGroup/@number = 1">
                  <xsl:text>BEL.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SUS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'BEL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1MA']/chapterGroup/@number = 1">
                  <xsl:text>1MA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BEL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = '1MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2MA']/chapterGroup/@number = 1">
                  <xsl:text>2MA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 15 and $string = '2MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '3MA']/chapterGroup/@number = 1">
                  <xsl:text>3MA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 7 and $string = '3MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '4MA']/chapterGroup/@number = 1">
                  <xsl:text>4MA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 18 and $string = '4MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '1ES']/chapterGroup/@number = 1">
                  <xsl:text>1ES.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#4MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 9 and $string = '1ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = '2ES']/chapterGroup/@number = 1">
                  <xsl:text>2ES.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 16 and $string = '2ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'MAN']/chapterGroup/@number = 1">
                  <xsl:text>MAN.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'MAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PS2']/chapterGroup/@number = 1">
                  <xsl:text>PS2.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 151 and $string = 'PS2'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'ODA']/chapterGroup/@number = 1">
                  <xsl:text>ODA.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PS2</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'ODA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'PSS']/chapterGroup/@number = 1">
                  <xsl:text>PSS.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ODA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 1 and $string = 'PSS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx[@book = 'GLO']/chapterGroup/@number = 1">
                  <xsl:text>GLO.1.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$curchap = 0 and $string = 'GLO'"/>
         <xsl:otherwise>
            <xsl:value-of select="concat($string,'.',string(number($curchap) + 1),'.html')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="f:bookbefore">
      <xsl:param name="string"/>
      <xsl:param name="allusx"/>
      <xsl:choose>
         <xsl:when test="$string = 'GEN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'FRT'">
                  <xsl:text>FRT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'FRT'">
                  <xsl:text>FRT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GEN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EXO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'GEN'">
                  <xsl:text>GEN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'GEN'">
                  <xsl:text>GEN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EXO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LEV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EXO'">
                  <xsl:text>EXO_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'EXO'">
                  <xsl:text>EXO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LEV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NUM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LEV'">
                  <xsl:text>LEV_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'LEV'">
                  <xsl:text>LEV_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NUM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'DEU'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NUM'">
                  <xsl:text>NUM_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'NUM'">
                  <xsl:text>NUM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DEU</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'DEU'">
                  <xsl:text>DEU_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'DEU'">
                  <xsl:text>DEU_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JDG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOS'">
                  <xsl:text>JOS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JOS'">
                  <xsl:text>JOS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'RUT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JDG'">
                  <xsl:text>JDG_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JDG'">
                  <xsl:text>JDG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#RUT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'RUT'">
                  <xsl:text>RUT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'RUT'">
                  <xsl:text>RUT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1SA'">
                  <xsl:text>1SA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1SA'">
                  <xsl:text>1SA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2SA'">
                  <xsl:text>2SA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2SA'">
                  <xsl:text>2SA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1KI'">
                  <xsl:text>1KI_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1KI'">
                  <xsl:text>1KI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2KI'">
                  <xsl:text>2KI_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2KI'">
                  <xsl:text>2KI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1CH'">
                  <xsl:text>1CH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1CH'">
                  <xsl:text>1CH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EZR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2CH'">
                  <xsl:text>2CH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2CH'">
                  <xsl:text>2CH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NEH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EZR'">
                  <xsl:text>EZR_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'EZR'">
                  <xsl:text>EZR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NEH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EST'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NEH'">
                  <xsl:text>NEH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'NEH'">
                  <xsl:text>NEH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EST</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EST'">
                  <xsl:text>EST_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'EST'">
                  <xsl:text>EST_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PSA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOB'">
                  <xsl:text>JOB_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JOB'">
                  <xsl:text>JOB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PRO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PSA'">
                  <xsl:text>PSA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PSA'">
                  <xsl:text>PSA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PRO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ECC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PRO'">
                  <xsl:text>PRO_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PRO'">
                  <xsl:text>PRO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ECC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SNG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ECC'">
                  <xsl:text>ECC_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ECC'">
                  <xsl:text>ECC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SNG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ISA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SNG'">
                  <xsl:text>SNG_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'SNG'">
                  <xsl:text>SNG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ISA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JER'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ISA'">
                  <xsl:text>ISA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ISA'">
                  <xsl:text>ISA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JER</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JER'">
                  <xsl:text>JER_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JER'">
                  <xsl:text>JER_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EZK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LAM'">
                  <xsl:text>LAM_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'LAM'">
                  <xsl:text>LAM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'DAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EZK'">
                  <xsl:text>EZK_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'EZK'">
                  <xsl:text>EZK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'DAN'">
                  <xsl:text>DAN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'DAN'">
                  <xsl:text>DAN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HOS'">
                  <xsl:text>HOS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'HOS'">
                  <xsl:text>HOS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'AMO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOL'">
                  <xsl:text>JOL_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JOL'">
                  <xsl:text>JOL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#AMO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'OBA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'AMO'">
                  <xsl:text>AMO_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'AMO'">
                  <xsl:text>AMO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#OBA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JON'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'OBA'">
                  <xsl:text>OBA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'OBA'">
                  <xsl:text>OBA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JON</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MIC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JON'">
                  <xsl:text>JON_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JON'">
                  <xsl:text>JON_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MIC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MIC'">
                  <xsl:text>MIC_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'MIC'">
                  <xsl:text>MIC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HAB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NAM'">
                  <xsl:text>NAM_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'NAM'">
                  <xsl:text>NAM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ZEP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HAB'">
                  <xsl:text>HAB_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'HAB'">
                  <xsl:text>HAB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HAG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ZEP'">
                  <xsl:text>ZEP_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ZEP'">
                  <xsl:text>ZEP_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ZEC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HAG'">
                  <xsl:text>HAG_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'HAG'">
                  <xsl:text>HAG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ZEC'">
                  <xsl:text>ZEC_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ZEC'">
                  <xsl:text>ZEC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAL'">
                  <xsl:text>MAL_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'MAL'">
                  <xsl:text>MAL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MRK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAT'">
                  <xsl:text>MAT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'MAT'">
                  <xsl:text>MAT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MRK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LUK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MRK'">
                  <xsl:text>MRK_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'MRK'">
                  <xsl:text>MRK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LUK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JHN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LUK'">
                  <xsl:text>LUK_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'LUK'">
                  <xsl:text>LUK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JHN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ACT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JHN'">
                  <xsl:text>JHN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JHN'">
                  <xsl:text>JHN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ACT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ROM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ACT'">
                  <xsl:text>ACT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ACT'">
                  <xsl:text>ACT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ROM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ROM'">
                  <xsl:text>ROM_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ROM'">
                  <xsl:text>ROM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1CO'">
                  <xsl:text>1CO_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1CO'">
                  <xsl:text>1CO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'GAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2CO'">
                  <xsl:text>2CO_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2CO'">
                  <xsl:text>2CO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EPH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'GAL'">
                  <xsl:text>GAL_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'GAL'">
                  <xsl:text>GAL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EPH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PHP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EPH'">
                  <xsl:text>EPH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'EPH'">
                  <xsl:text>EPH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'COL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PHP'">
                  <xsl:text>PHP_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PHP'">
                  <xsl:text>PHP_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#COL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'COL'">
                  <xsl:text>COL_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'COL'">
                  <xsl:text>COL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1TH'">
                  <xsl:text>1TH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1TH'">
                  <xsl:text>1TH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2TH'">
                  <xsl:text>2TH_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2TH'">
                  <xsl:text>2TH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1TI'">
                  <xsl:text>1TI_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1TI'">
                  <xsl:text>1TI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'TIT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2TI'">
                  <xsl:text>2TI_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2TI'">
                  <xsl:text>2TI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TIT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PHM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'TIT'">
                  <xsl:text>TIT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'TIT'">
                  <xsl:text>TIT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HEB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PHM'">
                  <xsl:text>PHM_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PHM'">
                  <xsl:text>PHM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HEB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JAS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HEB'">
                  <xsl:text>HEB_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'HEB'">
                  <xsl:text>HEB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JAS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JAS'">
                  <xsl:text>JAS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JAS'">
                  <xsl:text>JAS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1PE'">
                  <xsl:text>1PE_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1PE'">
                  <xsl:text>1PE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2PE'">
                  <xsl:text>2PE_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2PE'">
                  <xsl:text>2PE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1JN'">
                  <xsl:text>1JN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1JN'">
                  <xsl:text>1JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '3JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2JN'">
                  <xsl:text>2JN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2JN'">
                  <xsl:text>2JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JUD'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '3JN'">
                  <xsl:text>3JN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '3JN'">
                  <xsl:text>3JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JUD</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'REV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JUD'">
                  <xsl:text>JUD_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JUD'">
                  <xsl:text>JUD_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#REV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'TOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'REV'">
                  <xsl:text>REV_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'REV'">
                  <xsl:text>REV_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JDT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'TOB'">
                  <xsl:text>TOB_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'TOB'">
                  <xsl:text>TOB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ESG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JDT'">
                  <xsl:text>JDT_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'JDT'">
                  <xsl:text>JDT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ESG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'WIS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ESG'">
                  <xsl:text>ESG_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ESG'">
                  <xsl:text>ESG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#WIS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SIR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'WIS'">
                  <xsl:text>WIS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'WIS'">
                  <xsl:text>WIS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SIR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'BAR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SIR'">
                  <xsl:text>SIR_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'SIR'">
                  <xsl:text>SIR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BAR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LJE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'BAR'">
                  <xsl:text>BAR_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'BAR'">
                  <xsl:text>BAR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LJE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'S3Y'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LJE'">
                  <xsl:text>LJE_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'LJE'">
                  <xsl:text>LJE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#S3Y</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SUS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'S3Y'">
                  <xsl:text>S3Y_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'S3Y'">
                  <xsl:text>S3Y_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SUS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'BEL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SUS'">
                  <xsl:text>SUS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'SUS'">
                  <xsl:text>SUS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BEL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'BEL'">
                  <xsl:text>BEL_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'BEL'">
                  <xsl:text>BEL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1MA'">
                  <xsl:text>1MA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1MA'">
                  <xsl:text>1MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '3MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2MA'">
                  <xsl:text>2MA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2MA'">
                  <xsl:text>2MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '4MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '3MA'">
                  <xsl:text>3MA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '3MA'">
                  <xsl:text>3MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#4MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '4MA'">
                  <xsl:text>4MA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '4MA'">
                  <xsl:text>4MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1ES'">
                  <xsl:text>1ES_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '1ES'">
                  <xsl:text>1ES_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2ES'">
                  <xsl:text>2ES_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = '2ES'">
                  <xsl:text>2ES_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PS2'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAN'">
                  <xsl:text>MAN_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'MAN'">
                  <xsl:text>MAN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PS2</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ODA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PS2'">
                  <xsl:text>PS2_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PS2'">
                  <xsl:text>PS2_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ODA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PSS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ODA'">
                  <xsl:text>ODA_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'ODA'">
                  <xsl:text>ODA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'GLO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PSS'">
                  <xsl:text>PSS_index.html</xsl:text>
               </xsl:when>
               <xsl:when test="$allusx//usx/@book = 'PSS'">
                  <xsl:text>PSS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GLO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>../index/index.html</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
   <xsl:function name="f:bookafter">
      <xsl:param name="string"/>
      <xsl:param name="allusx"/>
      <xsl:choose>
         <xsl:when test="$string = 'FRT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'GEN'">
                  <xsl:text>GEN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#FRT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'GEN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EXO'">
                  <xsl:text>EXO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GEN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EXO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LEV'">
                  <xsl:text>LEV_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EXO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LEV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NUM'">
                  <xsl:text>NUM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LEV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NUM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'DEU'">
                  <xsl:text>DEU_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NUM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'DEU'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOS'">
                  <xsl:text>JOS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DEU</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JDG'">
                  <xsl:text>JDG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JDG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'RUT'">
                  <xsl:text>RUT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'RUT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1SA'">
                  <xsl:text>1SA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#RUT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2SA'">
                  <xsl:text>2SA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2SA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1KI'">
                  <xsl:text>1KI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2SA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2KI'">
                  <xsl:text>2KI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2KI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1CH'">
                  <xsl:text>1CH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2KI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2CH'">
                  <xsl:text>2CH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2CH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EZR'">
                  <xsl:text>EZR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EZR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NEH'">
                  <xsl:text>NEH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NEH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EST'">
                  <xsl:text>EST_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NEH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EST'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOB'">
                  <xsl:text>JOB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EST</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PSA'">
                  <xsl:text>PSA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PSA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PRO'">
                  <xsl:text>PRO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PRO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ECC'">
                  <xsl:text>ECC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PRO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ECC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SNG'">
                  <xsl:text>SNG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ECC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SNG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ISA'">
                  <xsl:text>ISA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SNG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ISA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JER'">
                  <xsl:text>JER_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ISA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JER'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LAM'">
                  <xsl:text>LAM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JER</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EZK'">
                  <xsl:text>EZK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EZK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'DAN'">
                  <xsl:text>DAN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EZK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'DAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HOS'">
                  <xsl:text>HOS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#DAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HOS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JOL'">
                  <xsl:text>JOL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HOS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JOL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'AMO'">
                  <xsl:text>AMO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JOL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'AMO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'OBA'">
                  <xsl:text>OBA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#AMO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'OBA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JON'">
                  <xsl:text>JON_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#OBA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JON'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MIC'">
                  <xsl:text>MIC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JON</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MIC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'NAM'">
                  <xsl:text>NAM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MIC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'NAM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HAB'">
                  <xsl:text>HAB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#NAM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HAB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ZEP'">
                  <xsl:text>ZEP_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ZEP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HAG'">
                  <xsl:text>HAG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HAG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ZEC'">
                  <xsl:text>ZEC_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HAG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ZEC'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAL'">
                  <xsl:text>MAL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ZEC</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAT'">
                  <xsl:text>MAT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MRK'">
                  <xsl:text>MRK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MRK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LUK'">
                  <xsl:text>LUK_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MRK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LUK'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JHN'">
                  <xsl:text>JHN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LUK</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JHN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ACT'">
                  <xsl:text>ACT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JHN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ACT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ROM'">
                  <xsl:text>ROM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ACT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ROM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1CO'">
                  <xsl:text>1CO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ROM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2CO'">
                  <xsl:text>2CO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2CO'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'GAL'">
                  <xsl:text>GAL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2CO</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'GAL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'EPH'">
                  <xsl:text>EPH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#GAL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'EPH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PHP'">
                  <xsl:text>PHP_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#EPH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PHP'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'COL'">
                  <xsl:text>COL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHP</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'COL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1TH'">
                  <xsl:text>1TH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#COL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2TH'">
                  <xsl:text>2TH_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2TH'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1TI'">
                  <xsl:text>1TI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TH</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2TI'">
                  <xsl:text>2TI_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2TI'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'TIT'">
                  <xsl:text>TIT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2TI</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'TIT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PHM'">
                  <xsl:text>PHM_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TIT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PHM'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'HEB'">
                  <xsl:text>HEB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PHM</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'HEB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JAS'">
                  <xsl:text>JAS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#HEB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JAS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1PE'">
                  <xsl:text>1PE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JAS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2PE'">
                  <xsl:text>2PE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2PE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1JN'">
                  <xsl:text>1JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2PE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2JN'">
                  <xsl:text>2JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '3JN'">
                  <xsl:text>3JN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '3JN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JUD'">
                  <xsl:text>JUD_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3JN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JUD'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'REV'">
                  <xsl:text>REV_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JUD</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'REV'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'TOB'">
                  <xsl:text>TOB_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#REV</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'TOB'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'JDT'">
                  <xsl:text>JDT_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#TOB</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'JDT'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ESG'">
                  <xsl:text>ESG_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#JDT</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ESG'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'WIS'">
                  <xsl:text>WIS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ESG</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'WIS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SIR'">
                  <xsl:text>SIR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#WIS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SIR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'BAR'">
                  <xsl:text>BAR_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SIR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'BAR'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'LJE'">
                  <xsl:text>LJE_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BAR</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'LJE'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'S3Y'">
                  <xsl:text>S3Y_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#LJE</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'S3Y'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'SUS'">
                  <xsl:text>SUS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#S3Y</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'SUS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'BEL'">
                  <xsl:text>BEL_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#SUS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'BEL'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1MA'">
                  <xsl:text>1MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#BEL</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2MA'">
                  <xsl:text>2MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '3MA'">
                  <xsl:text>3MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '3MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '4MA'">
                  <xsl:text>4MA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#3MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '4MA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '1ES'">
                  <xsl:text>1ES_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#4MA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '1ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = '2ES'">
                  <xsl:text>2ES_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#1ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = '2ES'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'MAN'">
                  <xsl:text>MAN_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#2ES</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'MAN'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PS2'">
                  <xsl:text>PS2_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#MAN</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PS2'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'ODA'">
                  <xsl:text>ODA_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PS2</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'ODA'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'PSS'">
                  <xsl:text>PSS_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#ODA</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:when test="$string = 'PSS'">
            <xsl:choose>
               <xsl:when test="$allusx//usx/@book = 'GLO'">
                  <xsl:text>GLO_index.html</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text>../index/index.html#PSS</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>../index/index.html</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:function>
</xsl:stylesheet>