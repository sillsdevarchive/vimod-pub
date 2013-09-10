<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:param name="projectpath"/>
      <xsl:param name="outpath"/>
      <xsl:variable name="projfilelist" select="concat($projectpath,'\logs\files.txt')"/>
      <xsl:variable name="projectpathuri" select="f:file2uri($projectpath)"/>
      <xsl:variable name="projectfile" select="tokenize(unparsed-text(f:file2uri($projfilelist)),'\r\n')"/>
      <xsl:variable name="rootfiles" select="'pub.cmd sample_local_var.cmd readme.txt GettingStarted.txt blank.xml'"/>
      <xsl:variable name="setupfiles" select="collection()"/>
      <xsl:variable name="rootfile" select="tokenize($rootfiles,' ')"/>
      <xsl:variable name="projectpart" select="tokenize($projectpath,'\\')"/>
      <xsl:variable name="projectmenu" select="concat($projectpath,'\setup\project.menu')"/>
      <xsl:variable name="project" select="$projectpart[last()]"/>
      <xsl:variable name="group" select="$projectpart[last()-1]"/>
      <xsl:variable name="outputprojectpath" select="concat($outpath,'\',$project,'\data\',$group,'\',$project)"/>
      <xsl:variable name="outputrootpath" select="concat($outpath,'\',$project)"/>
      <xsl:variable name="projectfiles" select="collection(concat(f:file2uri($projectpath),'/?select=*.*'))"/>
      <xsl:variable name="basepath" select="replace($projectpath,concat('\\data\\',$group,'\\',$project),'')"/>
      <xsl:variable name="inputrootpath" select="replace($projectpath,concat('\\data\\',$group,'\\',$project),'')"/>
      <xsl:variable name="eol" select="'$eol'"/>
      <!-- <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" name="xml" omit-xml-declaration="yes"/> -->
      <xsl:output method="text" name="text"/>
      <xsl:output method="text"/>
      <xsl:template match="/">
            <xsl:value-of select="'&#13;&#10;'"/>
            <xsl:for-each select="$rootfile">
                  <!-- copy the root folder files pub.cmd and local_var.cmd -->
                  <xsl:call-template name="writetextfile">
                        <xsl:with-param name="pathfile" select="concat($basepath,'\',.)"/>
                        <xsl:with-param name="outputpath" select="concat($outpath,'\',$project)"/>
                  </xsl:call-template>
            </xsl:for-each>
              <xsl:for-each select="$projectfile">
                  <xsl:call-template name="writetextfile">
                       <!--  copy the project.menu file -->
                        <xsl:with-param name="pathfile" select="concat($projectpath,'\',.)"/>
                        <xsl:with-param name="outputpath" select="$outputprojectpath"/>
                  </xsl:call-template>
            </xsl:for-each>
           <!-- <xsl:for-each select="collection(concat($projectpathuri,'/?select=*.*'))">
                  <xsl:variable name="infile" select="tokenize(document-uri(.), '/')[last()]"/>
                  <xsl:call-template name="writetextfile">
                      
                        <xsl:with-param name="pathfile" select="concat($projectpath,'\',$infile)"/>
                        <xsl:with-param name="outputpath" select="$outputprojectpath"/>
                  </xsl:call-template>
            </xsl:for-each>  -->
            <!-- <xsl:value-of select="concat('projectmenu=',$projectmenu,'&#10;')"/> -->
            <xsl:call-template name="writetextfile">
                  <!--   copy the project.menu file -->
                  <xsl:with-param name="pathfile" select="$projectmenu"/>
                  <xsl:with-param name="outputpath" select="concat($outputprojectpath,'\setup')"/>
            </xsl:call-template>
            <xsl:call-template name="menutextparser">
                  <!--   parse project.menu file -->
                  <xsl:with-param name="menufile" select="$projectmenu"/>
            </xsl:call-template>
            <xsl:variable name="shortcutbat" select="concat($outpath,'\',$project,'\',$project,'-shortcut.cmd')"/>
            <!-- Create a batch file shortcut to the generated project -->
            <xsl:text>Generated a shortcut batch file in the root directory&#13;&#10;</xsl:text>
            <xsl:result-document href="{f:file2uri($shortcutbat)}" format="text">
                  <xsl:value-of select="concat('set projectpath=%cd%\data\',$group,'\',$project,'&#13;&#10;')"/>
                  <xsl:value-of select="concat('pub.cmd data\',$group,'\',$project,'\setup\project.menu&#13;&#10;')"/>
            </xsl:result-document>
      </xsl:template>
      <xsl:template name="menutextparser">
            <xsl:param name="menufile"/>
            <xsl:variable name="menufileuri" select="f:file2uri($menufile)"/>
            <xsl:variable name="menutext">
                  <xsl:choose>
                        <xsl:when test="unparsed-text-available($menufileuri)">
                              <xsl:value-of select="replace(unparsed-text($menufileuri),'%projectpath%',replace($projectpath,'\\','\\\\'))"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:text></xsl:text>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <xsl:analyze-string select="$menutext" regex="&#13;&#10;">
                  <xsl:non-matching-substring>
                        <xsl:variable name="comment" select="substring-before(.,';')"/>
                        <xsl:variable name="commandstring" select="substring-after(.,';')"/>
                        <xsl:variable name="part" select="tokenize($commandstring,'\s+')"/>
                        <xsl:variable name="command" select="lower-case($part[1])"/>
                        <xsl:variable name="param1" select="$part[2]"/>
                        <xsl:variable name="param2" select="$part[3]"/>
                        <xsl:variable name="param3" select="$part[4]"/>
                        <xsl:variable name="param4" select="$part[5]"/>
                        <xsl:variable name="param5" select="$part[6]"/>
                        <xsl:variable name="param6" select="$part[7]"/>
                        <xsl:choose>
                              <xsl:when test="substring(.,1,1) = '#'"/>
                              <!-- the above finds comment lines -->
                              <xsl:when test="string-length(.) = 0"/>
                              <!-- the above finds blank line -->
                              <xsl:when test="matches(.,';')">
                                    <!-- command line -->
                                    <xsl:call-template name="parsecommand">
                                          <xsl:with-param name="command" select="$command"/>
                                          <xsl:with-param name="param1" select="$param1"/>
                                          <xsl:with-param name="param2" select="$param2"/>
                                          <xsl:with-param name="position" select="position()"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>Unparsed line=</xsl:text>
                                    <xsl:value-of select="$command"/>
                                    <xsl:text>&#13;&#10;</xsl:text>
                                    <!-- Un matched command line -->
                                    <xsl:text>:: Un matched command ???: </xsl:text>
                                    <xsl:value-of select="$command"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$param1"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$param2"/>
                                    <xsl:text>&#13;&#10;</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:non-matching-substring>
            </xsl:analyze-string>
      </xsl:template>
      <xsl:template name="parsecommand">
            <xsl:param name="command"/>
            <xsl:param name="param1"/>
            <xsl:param name="param2"/>
            <xsl:param name="position"/>
            <xsl:choose>
                  <xsl:when test="$command = 'xslt'">
                        <!-- xslt line -->
                        <xsl:variable name="xslt" select="concat($basepath,'\scripts\xslt\',$param1,'.xslt')"/>
                        <xsl:call-template name="writetextfile">
                              <!--    copy the project.menu file  -->
                              <xsl:with-param name="pathfile" select="$xslt"/>
                              <xsl:with-param name="outputpath" select="concat($outpath,'\',$project,'\scripts\xslt')"/>
                        </xsl:call-template>
                        <!-- parse xslt to look for include and import xslt Call the file as a document and pass to -->
                        <xsl:variable name="xmlfile" select="document(f:file2uri($xslt))"/>
                        <xsl:apply-templates select="$xmlfile//xsl:include|$xmlfile//xsl:import"/>
                  </xsl:when>
                  <xsl:when test="$command = 'cct'">
                        <!-- cct handeling -->
                        <xsl:variable name="cct" select="tokenize($param1,',')"/>
                        <xsl:for-each select="$cct">
                              <!--   copy each cct -->
                              <xsl:call-template name="writetextfile">
                                    <xsl:with-param name="pathfile" select="concat($basepath,'\scripts\cct\',.)"/>
                                    <xsl:with-param name="outputpath" select="concat($outpath,'\',$project,'\scripts\cct')"/>
                              </xsl:call-template>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="$command = 'copyresources'">
                        <!-- copyresources handeling -->
                        <xsl:variable name="infile" select="$param1"/>
                        <xsl:variable name="resourcename" select="tokenize($param1,'\\')[last() -1]"/>
                        <xsl:variable name="batchfile" select="f:file2uri(concat($projectpath,'\logs\copyresources',$position,'.txt'))"/>
                        <xsl:variable name="batchfile0" select="f:file2uri(concat($projectpath,'\logs\copyresources0.txt'))"/>
                        <!--   make bat file to  copy resources -->
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available($batchfile)">
                                    <xsl:text>batch file already created &#13;&#10;</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>batch written to: logs\copyresources.cmd</xsl:text>
                                    <xsl:result-document href="{$batchfile}" format="text">
                                          <xsl:text>xcopy /e/y </xsl:text>
                                          <xsl:value-of select="$infile"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="concat($outputrootpath,'\resources\',$resourcename,'\')"/>
                                          <xsl:text>&#13;&#10;</xsl:text>
                                    </xsl:result-document>
                              </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available($batchfile0)">
                                    <xsl:text>batch file already created &#13;&#10;</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>batch written to: logs\copyresources.cmd</xsl:text>
                                    <xsl:result-document href="{$batchfile0}" format="text">
                                          <xsl:value-of select="concat('copy scripts\xslt\blank.xml ',$outputrootpath,'\scripts\xslt\blank.xml&#13;&#10;')"/>
                                    </xsl:result-document>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$command = 'menu'">
                        <!-- tasklist handling -->
                        <!-- Copy the tasklist from project or common folders -->
                        <xsl:variable name="filename" select="tokenize($param1,'\\')[last()]"/>
                        <xsl:variable name="projectsetuppath" select="concat($projectpath,'\setup\')"/>
                        <xsl:variable name="projectsetupmenu" select="concat($projectpath,'\setup\',$filename)"/>
                        <xsl:variable name="commonmenu" select="$param1"/>
                        <xsl:variable name="projectmenu" select="concat($basepath,'\',$param1)"/>
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available(f:file2uri($projectsetupmenu))">
                                    <!-- process tasks if in the project setup folder -->
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist ifin project folder -->
                                          <xsl:with-param name="pathfile" select="$projectsetupmenu"/>
                                          <xsl:with-param name="outputpath" select="concat($outputprojectpath,'\setup')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the tasks file if in the project\setup folder -->
                                          <xsl:with-param name="menufile" select="$projectsetupmenu"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <!-- if the task list is not in the project setup folder try to copy from the common setup folder -->
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist if in common project folder -->
                                          <xsl:with-param name="pathfile" select="$commonmenu"/>
                                          <xsl:with-param name="outputpath" select="concat($outpath,'\setup')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the tasks file if in the common \setup folder -->
                                          <xsl:with-param name="menufile" select="$commonmenu"/>
                                    </xsl:call-template>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$command = 'tasklist'">
                        <!-- tasklist handling -->
                        <!-- Copy the tasklist from project or common folders -->
                        <xsl:variable name="projecttasklist" select="concat($projectpath,'\setup\',$param1)"/>
                        <xsl:variable name="commontasklist" select="concat($inputrootpath,'\setup\',$param1)"/>
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available(f:file2uri($projecttasklist))">
                                    <!-- process tasks if in the project setup folder -->
                                    <xsl:text>Project task list found and copied - </xsl:text>
                                    <xsl:value-of select="concat($param1,$eol)"/>
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist ifin project folder -->
                                          <xsl:with-param name="pathfile" select="$projecttasklist"/>
                                          <xsl:with-param name="outputpath" select="concat($outputprojectpath,'\setup')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the tasks file if in the project\setup folder -->
                                          <xsl:with-param name="menufile" select="$projecttasklist"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:when test="unparsed-text-available(f:file2uri($commontasklist))">
                                    <!-- if the task list is not in the project setup folder try to copy from the common setup folder -->
                                    <xsl:text>Common task list found and copied - </xsl:text>
                                    <xsl:value-of select="concat($param1,'&#13;&#10;')"/>
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist if in common project folder -->
                                          <xsl:with-param name="pathfile" select="$commontasklist"/>
                                          <xsl:with-param name="outputpath" select="concat($outputrootpath,'\setup')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the tasks file if in the common \setup folder -->
                                          <xsl:with-param name="menufile" select="$commontasklist"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>tasklist not handled&#13;&#10;</xsl:text>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$command = 'startfile' or $command = 'file2uri'">
                        <!-- startfile handling  -->
                        <xsl:variable name="startfile">
                              <xsl:choose>
                                    <xsl:when test="matches($param1,':\\')">
                                          <xsl:variable name="startfile" select="$param1"/>
                                          <xsl:value-of select="replace($param1,'&#34;','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                          <xsl:variable name="pathpart" select="tokenize($param1,'\\')"/>
                                          <xsl:value-of select="replace($param1,'%projectpath%',replace($projectpath,'\\','\\\\'))"/>
                                    </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="writetextfile">
                              <!-- copy the start file  to the project folder -->
                              <xsl:with-param name="pathfile" select="$startfile"/>
                              <xsl:with-param name="outputpath">
                                    <xsl:choose>
                                          <xsl:when test="matches($param1,'scripts\\xslt')">
                                                <xsl:value-of select="concat($basepath,'\',$param1)"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="$outputprojectpath"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                              </xsl:with-param>
                        </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$command = 'setvar'">
                        <xsl:value-of select="concat('var ',$param1,'=',$param2,'&#13;&#10;')"/>
                  </xsl:when>
                  <xsl:when test="$command = 'spinoffproject'">
                        <xsl:text>Nothing to copy&#13;&#10;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- Un matched command line -->
                        <xsl:text>Un matched command ???: </xsl:text>
                        <xsl:value-of select="$command"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$param1"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$param2"/>
                        <xsl:text>&#13;&#10;</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template name="writetextfile">
            <xsl:param name="pathfile"/>
            <xsl:param name="outputpath"/>
            <!-- <xsl:value-of select="concat('pathfile=',$pathfile,'&#13;&#10;')"/> -->
            <xsl:variable name="file" select="tokenize($pathfile,'\\')"/>
            <xsl:variable name="outpathfile" select="concat($outputpath,'\',$file[last()])"/>
            <xsl:variable name="infile" select="f:file2uri($pathfile)"/>
            <xsl:variable name="outfile" select="f:file2uri($outpathfile)"/>
            <xsl:choose>
                  <xsl:when test="unparsed-text-available($infile)">
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available($outfile)">
                                    <xsl:value-of select= "concat('already copied=',$outfile,'&#13;&#10;')"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select= "concat('copy=',$infile,' ==> ',$outfile,'&#13;&#10;')" disable-output-escaping="yes"/>
                                    <xsl:result-document href="{$outfile}" format="text">
                                          <xsl:value-of select= "unparsed-text($infile)"/>
                                    </xsl:result-document>
                              </xsl:otherwise>
                        </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select= "concat('XXX not found=',$infile,'&#13;&#10;')"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:template>
      <xsl:template match="xsl:include|xsl:import">
            <xsl:variable name="xslt" select="concat($basepath,'\scripts\xslt\',@href)"/>
            <xsl:call-template name="writetextfile">
                  <!--    copy the xslt file to the independent project  -->
                  <xsl:with-param name="pathfile" select="$xslt"/>
                  <xsl:with-param name="outputpath" select="concat($outpath,'\',$project,'\scripts\xslt')"/>
            </xsl:call-template>
            <!-- parse xslt to look for include and import xslt 
Call the file as a document and pass to 
-->
            <xsl:variable name="xmlfile" select="document(f:file2uri($xslt))"/>
            <xsl:apply-templates select="$xmlfile//xsl:include|$xmlfile//xsl:import"/>
            <!-- <xsl:text>copy scripts\xslt\</xsl:text>
            <xsl:value-of select="@href"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$outpath"/>
            <xsl:text>\scripts\xslt\</xsl:text>
            <xsl:value-of select="@href"/>
            <xsl:text>&#10;</xsl:text> -->
      </xsl:template>
      <xsl:function name="f:file2uri">
            <xsl:param name="pathfile"/>
            <xsl:value-of select="concat('file:///',replace($pathfile,'\\','/'))"/>
      </xsl:function>
</xsl:stylesheet>
