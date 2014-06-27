<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:include href="inc-file2uri.xslt"/>
      <xsl:param name="projectpath"/>
      <xsl:param name="outpath"/>
      <xsl:param name="grouporproj"/>
      <xsl:variable name="projfilelist" select="concat($projectpath,'\logs\files.txt')"/>
      <xsl:variable name="projectfile" select="tokenize(unparsed-text(f:file2uri($projfilelist)),'\r\n')"/>
      <xsl:variable name="rootfiles" select="'pub.cmd readme.txt GettingStarted.txt blank.xml'"/>
      <xsl:variable name="setupfiles" select="collection()"/>
      <xsl:variable name="rootfile" select="tokenize($rootfiles,' ')"/>
      <xsl:variable name="projectpart" select="tokenize($projectpath,'\\')"/>
      <xsl:variable name="projectmenu" select="concat($projectpath,'\setup\project.menu')"/>
      <xsl:variable name="project" select="$projectpart[last()]"/>
      <xsl:variable name="group" select="$projectpart[last()-1]"/>
      <xsl:variable name="tasklisttypes-list" select="'tasklist looptasks commonmenu'"/>
      <xsl:variable name="tasklisttype" select="tokenize($tasklisttypes-list,'\s+')"/>
      <xsl:variable name="outputrootpath">
            <xsl:choose>
                  <xsl:when test="$grouporproj = 'group'">
                        <xsl:value-of select="concat($outpath,'\',$group)"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:value-of select="concat($outpath,'\vimod-',$group)"/>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>
      <xsl:variable name="outputprojectpath" select="concat($outputrootpath,'\data\',$group,'\',$project)"/>
      <xsl:variable name="projectfiles" select="collection(concat(f:file2uri($projectpath),'/?select=*.*'))"/>
      <xsl:variable name="basepath" select="replace($projectpath,concat('\\data\\',$group,'\\',$project),'')"/>
      <xsl:variable name="inputrootpath" select="replace($projectpath,concat('\\data\\',$group,'\\',$project),'')"/>
      <xsl:variable name="eol" select="'&#13;&#10;'"/>
      <!-- <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" name="xml" omit-xml-declaration="yes"/> -->
      <xsl:output method="text" name="text"/>
      <xsl:output method="text"/>
      <xsl:template match="/">
            <xsl:value-of select="'&#13;&#10;'" disable-output-escaping="yes"/>
            <xsl:for-each select="$rootfile">
                  <!-- copy the root folder files pub.cmd and local_var.cmd  -->
                  <xsl:call-template name="writetextfile">
                        <xsl:with-param name="pathfile" select="concat($basepath,'\',.)"/>
                        <xsl:with-param name="outputpath" select="$outputrootpath"/>
                  </xsl:call-template>
            </xsl:for-each>
            <xsl:call-template name="menutextparser">
                  <!--   parse project.menu file -->
                  <xsl:with-param name="menufile" select="$projectmenu"/>
            </xsl:call-template>
            <xsl:variable name="shortcutbat">
                  <xsl:choose>
                        <xsl:when test="$grouporproj = 'group'">
                              <xsl:value-of select="concat($outputrootpath,'\',$group,'-shortcut.cmd')"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat($outputrootpath,'\',$project,'-shortcut.cmd')"/>
                        </xsl:otherwise>
                  </xsl:choose>
            </xsl:variable>
            <!-- Create a batch file shortcut to the generated project -->
            <xsl:text disable-output-escaping="yes">Generated a shortcut batch file in the root directory&#13;&#10;</xsl:text>
            <xsl:result-document href="{f:file2uri($shortcutbat)}" format="text">
                  <xsl:text disable-output-escaping="yes">@echo off</xsl:text>
                  <xsl:choose>
                        <xsl:when test="$grouporproj = 'group'">
                              <xsl:value-of select="concat('set relprojectpath=data\',$group,'&#13;&#10;')" disable-output-escaping="yes"/>
                        </xsl:when>
                        <xsl:otherwise>
                              <xsl:value-of select="concat('set relprojectpath=data\',$group,'\',$project,'&#13;&#10;')" disable-output-escaping="yes"/>
                        </xsl:otherwise>
                  </xsl:choose>
                  <xsl:text disable-output-escaping="yes">set projectpath=%cd%\%relativepath%&#13;&#10;</xsl:text>
                  <xsl:text disable-output-escaping="yes">echo.%&#13;&#10;echo Starting Vimod-Pub project %relativepath%%&#13;&#10;pub.cmd %projectpath%&#13;&#10;</xsl:text>
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
                        <xsl:variable name="param1" select="replace($part[2],'&#34;','')"/>
                        <xsl:variable name="param2" select="replace($part[3],'&#34;','')"/>
                        <xsl:variable name="param3" select="replace($part[4],'&#34;','')"/>
                        <xsl:variable name="param4" select="replace($part[5],'&#34;','')"/>
                        <xsl:variable name="param5" select="replace($part[6],'&#34;','')"/>
                        <xsl:variable name="param6" select="replace($part[7],'&#34;','')"/>
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
                                    <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
                                    <!-- Un matched command line -->
                                    <xsl:text>:: Un matched command ???: </xsl:text>
                                    <xsl:value-of select="$command"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$param1"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="$param2"/>
                                    <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
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
            <xsl:value-of select="concat('    command=',$command,' ',$param1,' ',$param2,$eol)" disable-output-escaping="yes"/>
            <xsl:choose>
                  <xsl:when test="$command = 'xslt'">
                        <!-- xslt line -->
                        <xsl:variable name="xslt" select="concat($basepath,'\scripts\xslt\',$param1,'.xslt')"/>
                        <xsl:call-template name="writetextfile">
                              <!--    copy the xslt  file  -->
                              <xsl:with-param name="pathfile" select="$xslt"/>
                              <xsl:with-param name="outputpath" select="concat($outputrootpath,'\scripts\xslt')"/>
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
                                    <xsl:with-param name="outputpath" select="concat($outputrootpath,'\scripts\cct')"/>
                              </xsl:call-template>
                        </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="$command = 'copyresources'">
                        <!-- copyresources handeling -->
                        <xsl:variable name="infile" select="$param1"/>
                        <xsl:variable name="resourcename" select="tokenize($param1,'\\')[last() -1]"/>
                        <xsl:variable name="batchfile" select="f:file2uri(concat($projectpath,'\logs\copyresources',$position,'.cmd'))"/>
                        <xsl:variable name="batchfile0" select="f:file2uri(concat($projectpath,'\logs\copyresources0.txt'))"/>
                        <!--   make bat file to  copy resources -->
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available($batchfile)">
                                    <xsl:text disable-output-escaping="yes">batch file already created &#13;&#10;</xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text>batch written to: logs\copyresources.cmd</xsl:text>
                                    <xsl:result-document href="{$batchfile}" format="text">
                                          <xsl:text>xcopy /e/y </xsl:text>
                                          <xsl:value-of select="$infile"/>
                                          <xsl:text> </xsl:text>
                                          <xsl:value-of select="concat($outputrootpath,'\resources\',$resourcename,'\')"/>
                                          <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
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
                  <xsl:when test="$command = $tasklisttype">
                        <!-- tasklist handling -->
                        <!-- Copy the tasklist from project or common folders -->
                        <xsl:variable name="projecttasklist" select="concat($projectpath,'\setup\',$param1)"/>
                        <xsl:variable name="commontasklist" select="concat($inputrootpath,'\tasks\',$param1)"/>
                        <xsl:variable name="commonmenu" select="concat($inputrootpath,'\menus\',$param1)"/>
                        <xsl:choose>
                              <xsl:when test="unparsed-text-available(f:file2uri($projecttasklist))">
                                    <!-- process tasks if in the project setup folder -->
                                    <xsl:text>Project task list found and copied - </xsl:text>
                                    <xsl:value-of select="concat($param1,$eol)" disable-output-escaping="yes"/>
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
                                    <xsl:value-of select="concat($param1,'&#13;&#10;')" disable-output-escaping="yes"/>
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist if in common project folder -->
                                          <xsl:with-param name="pathfile" select="$commontasklist"/>
                                          <xsl:with-param name="outputpath" select="concat($outputrootpath,'\tasks')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the tasks file if in the common \setup folder -->
                                          <xsl:with-param name="menufile" select="$commontasklist"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:when test="unparsed-text-available(f:file2uri($commonmenu))">
                                    <!-- if the task or menu is in the common menu folder try to copy from the common setup folder -->
                                    <xsl:text>Common menu found and copied - </xsl:text>
                                    <xsl:value-of select="concat($param1,'&#13;&#10;')" disable-output-escaping="yes"/>
                                    <xsl:call-template name="writetextfile">
                                          <!-- copy tasklist if in common menu folder -->
                                          <xsl:with-param name="pathfile" select="$commonmenu"/>
                                          <xsl:with-param name="outputpath" select="concat($outputrootpath,'\menus')"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="menutextparser">
                                          <!--  parse the menu file if in the common menu folder -->
                                          <xsl:with-param name="menufile" select="$commonmenu"/>
                                    </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:text disable-output-escaping="yes">tasklist not handled&#13;&#10;</xsl:text>
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
                              <!-- copy the start folder to the project folder -->
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
                  <xsl:when test="$command = 'var'">
                        <xsl:value-of select="concat('var ',$param1,'=',$param2,'&#13;&#10;')" disable-output-escaping="yes"/>
                  </xsl:when>
                  <xsl:when test="$command = 'spinoffproject'">
                        <xsl:text disable-output-escaping="yes">Nothing to copy&#13;&#10;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                        <!-- Un matched command line -->
                        <xsl:text>Un matched command ???: </xsl:text>
                        <xsl:value-of select="$command"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$param1"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$param2"/>
                        <xsl:text disable-output-escaping="yes">&#13;&#10;</xsl:text>
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
                                    <xsl:value-of select= "concat('already copied=',$outfile,'&#13;&#10;')" disable-output-escaping="yes"/>
                              </xsl:when>
                              <xsl:otherwise>
                                    <xsl:value-of select= "concat('copy=',$infile,' &gt; ',$outfile,'&#13;&#10;')" disable-output-escaping="yes"/>
                                    <xsl:result-document href="{$outfile}" format="text">
                                          <xsl:value-of select= "unparsed-text($infile)" disable-output-escaping="yes"/>
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
                  <xsl:with-param name="outputpath" select="concat($outputrootpath,'\scripts\xslt')"/>
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
</xsl:stylesheet>
