<?xml version="1.0" encoding="UTF-8"?>
<!--
    #############################################################
    # Name:        	bible-book-func.xslt
    # Purpose:     	Used by other xslt as a data source. 
    # Part of:        	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # subpart:		simplehtmlscr 
    # Author:       	Ian McQuay <ian_mcquay.org>
    # Created:     	2013/07/01
    # Copyright:   	(c) 2013 SIL International
    # Licence:     	<LPGL>
    # Modified:	2014-06-06 IKM Modified for usx-chap-grp2simplehtmlscr4.xslt  will no longer work with earlier versions
    ################################################################
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions" version="2.0">
      <xsl:variable name="group1" select="'GEN
EXO
LEV
NUM
DEU
JOS
JDG
RUT
1SA
2SA
1KI
2KI
1CH
2CH
EZR
NEH
EST
JOB
PSA
PRO
ECC
SNG
ISA
JER
LAM
EZK
DAN
HOS
JOL
AMO
OBA
JON
MIC
NAM
HAB
ZEP
HAG
ZEC
MAL
'"/>
      <xsl:variable name="group2" select="'
MAT
MRK
LUK
JHN
ACT
ROM
1CO
2CO
GAL
EPH
PHP
COL
1TH
2TH
1TI
2TI
TIT
PHM
HEB
JAS
1PE
2PE
1JN
2JN
3JN
JUD
REV'"/>
      <xsl:variable name="group3" select="'TOB
JDT
ESG
WIS
SIR
BAR
LJE
S3Y
SUS
BEL
1MA
2MA
3MA
4MA
1ES
2ES
MAN
PS2
ODA
PSS
EZA
5EZ
6EZ
DAG
PS3
2BA
LBA
JUB
ENO
1MQ
2MQ
3MQ
 REP
 4BA
 LAO'"/>
      <xsl:function name="f:sequence">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="$string = 'FRT'">
                        <xsl:text>00</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'GEN'">
                        <xsl:text>01</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EXO'">
                        <xsl:text>02</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LEV'">
                        <xsl:text>03</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NUM'">
                        <xsl:text>04</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DEU'">
                        <xsl:text>05</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOS'">
                        <xsl:text>06</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDG'">
                        <xsl:text>07</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'RUT'">
                        <xsl:text>08</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1SA'">
                        <xsl:text>09</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2SA'">
                        <xsl:text>10</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1KI'">
                        <xsl:text>11</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2KI'">
                        <xsl:text>12</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CH'">
                        <xsl:text>13</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CH'">
                        <xsl:text>14</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZR'">
                        <xsl:text>15</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NEH'">
                        <xsl:text>16</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EST'">
                        <xsl:text>17</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOB'">
                        <xsl:text>18</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSA'">
                        <xsl:text>19</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PRO'">
                        <xsl:text>20</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ECC'">
                        <xsl:text>21</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SNG'">
                        <xsl:text>22</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ISA'">
                        <xsl:text>23</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JER'">
                        <xsl:text>24</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAM'">
                        <xsl:text>25</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZK'">
                        <xsl:text>26</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAN'">
                        <xsl:text>27</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HOS'">
                        <xsl:text>28</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JOL'">
                        <xsl:text>29</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'AMO'">
                        <xsl:text>30</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'OBA'">
                        <xsl:text>31</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JON'">
                        <xsl:text>32</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MIC'">
                        <xsl:text>33</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'NAM'">
                        <xsl:text>34</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAB'">
                        <xsl:text>35</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEP'">
                        <xsl:text>36</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HAG'">
                        <xsl:text>37</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ZEC'">
                        <xsl:text>38</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAL'">
                        <xsl:text>39</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAT'">
                        <xsl:text>41</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MRK'">
                        <xsl:text>42</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LUK'">
                        <xsl:text>43</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JHN'">
                        <xsl:text>44</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ACT'">
                        <xsl:text>45</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ROM'">
                        <xsl:text>46</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1CO'">
                        <xsl:text>47</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2CO'">
                        <xsl:text>48</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'GAL'">
                        <xsl:text>49</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EPH'">
                        <xsl:text>50</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHP'">
                        <xsl:text>51</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'COL'">
                        <xsl:text>52</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TH'">
                        <xsl:text>53</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TH'">
                        <xsl:text>54</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1TI'">
                        <xsl:text>55</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2TI'">
                        <xsl:text>56</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TIT'">
                        <xsl:text>57</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PHM'">
                        <xsl:text>58</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'HEB'">
                        <xsl:text>59</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JAS'">
                        <xsl:text>60</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1PE'">
                        <xsl:text>61</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2PE'">
                        <xsl:text>62</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1JN'">
                        <xsl:text>63</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2JN'">
                        <xsl:text>64</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3JN'">
                        <xsl:text>65</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUD'">
                        <xsl:text>66</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REV'">
                        <xsl:text>67</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'TOB'">
                        <xsl:text>68</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JDT'">
                        <xsl:text>69</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ESG'">
                        <xsl:text>70</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'WIS'">
                        <xsl:text>71</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SIR'">
                        <xsl:text>72</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BAR'">
                        <xsl:text>73</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LJE'">
                        <xsl:text>74</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'S3Y'">
                        <xsl:text>75</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'SUS'">
                        <xsl:text>76</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'BEL'">
                        <xsl:text>77</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MA'">
                        <xsl:text>78</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MA'">
                        <xsl:text>79</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MA'">
                        <xsl:text>80</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4MA'">
                        <xsl:text>81</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1ES'">
                        <xsl:text>82</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2ES'">
                        <xsl:text>83</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'MAN'">
                        <xsl:text>84</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS2'">
                        <xsl:text>85</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ODA'">
                        <xsl:text>86</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PSS'">
                        <xsl:text>87</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'EZA'">
                        <xsl:text>88</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '5EZ'">
                        <xsl:text>89</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '6EZ'">
                        <xsl:text>90</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'DAG'">
                        <xsl:text>91</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'PS3'">
                        <xsl:text>92</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2BA'">
                        <xsl:text>93</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LBA'">
                        <xsl:text>94</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'JUB'">
                        <xsl:text>95</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'ENO'">
                        <xsl:text>96</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '1MQ'">
                        <xsl:text>97</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '2MQ'">
                        <xsl:text>98</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '3MQ'">
                        <xsl:text>99</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'REP'">
                        <xsl:text>100</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = '4BA'">
                        <xsl:text>101</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'LAO'">
                        <xsl:text>102</xsl:text>
                  </xsl:when>
                  <xsl:when test="$string = 'GLO'">
                        <xsl:text>109</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>110</xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:group">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($group1,$string)">
                        <xsl:value-of select="$oldtestament"/>
                  </xsl:when>
                  <xsl:when test="matches($group2,$string)">
                        <xsl:value-of select="$newtestament"/>
                  </xsl:when>
                  <xsl:when test="matches($group3,$string)">
                        <xsl:value-of select="$apocrypha"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="$backmatter"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:groupname">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($group1,$string)">
                        <xsl:value-of select="'oldtestament'"/>
                  </xsl:when>
                  <xsl:when test="matches($group2,$string)">
                        <xsl:value-of select="'newtestament'"/>
                  </xsl:when>
                  <xsl:when test="matches($group3,$string)">
                        <xsl:value-of select="'apocrypha'"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="'backmatter'"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
      <xsl:function name="f:grouporder">
            <xsl:param name="string"/>
            <xsl:choose>
                  <xsl:when test="matches($group1,$string)">
                        <xsl:value-of select="'1'"/>
                  </xsl:when>
                  <xsl:when test="matches($group2,$string)">
                        <xsl:value-of select="'2'"/>
                  </xsl:when>
                  <xsl:when test="matches($group3,$string)">
                        <xsl:value-of select="'3'"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="'4'"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:function>
</xsl:stylesheet>
