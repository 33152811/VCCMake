@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7

:: 检查是否有 patch 补丁文件
 if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
   copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%VCMakeRootPath%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
 )

set "libxml2SRC=%VCMakeRootPath%Source\%SourceProjName%"
set "libxml2SRCDisk=%libxml2SRC:~0,2%
cd\
%libxml2SRCDisk%
cd\
cd "%libxml2SRC%"

cd "%libxml2SRC%\win32"
cscript configure.js compiler=msvc
nmake -f Makefile.msvc libxmla

copy /Y "bin.msvc\%SourceProjName%_a.lib" "%InstallSDKPath%\lib\libxml2.lib"
md "%InstallSDKPath%\include\libxml"
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\c14n.h"              "%InstallSDKPath%\include\libxml\c14n.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\catalog.h"           "%InstallSDKPath%\include\libxml\catalog.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\chvalid.h"           "%InstallSDKPath%\include\libxml\chvalid.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\debugXML.h"          "%InstallSDKPath%\include\libxml\debugXML.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\dict.h"              "%InstallSDKPath%\include\libxml\dict.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\DOCBparser.h"        "%InstallSDKPath%\include\libxml\DOCBparser.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\encoding.h"          "%InstallSDKPath%\include\libxml\encoding.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\entities.h"          "%InstallSDKPath%\include\libxml\entities.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\globals.h"           "%InstallSDKPath%\include\libxml\globals.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\hash.h"              "%InstallSDKPath%\include\libxml\hash.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\HTMLparser.h"        "%InstallSDKPath%\include\libxml\HTMLparser.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\HTMLtree.h"          "%InstallSDKPath%\include\libxml\HTMLtree.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\list.h"              "%InstallSDKPath%\include\libxml\list.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\nanoftp.h"           "%InstallSDKPath%\include\libxml\nanoftp.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\nanohttp.h"          "%InstallSDKPath%\include\libxml\nanohttp.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\parser.h"            "%InstallSDKPath%\include\libxml\parser.h"            
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\parserInternals.h"   "%InstallSDKPath%\include\libxml\parserInternals.h"   
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\pattern.h"           "%InstallSDKPath%\include\libxml\pattern.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\relaxng.h"           "%InstallSDKPath%\include\libxml\relaxng.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\SAX.h"               "%InstallSDKPath%\include\libxml\SAX.h"               
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\SAX2.h"              "%InstallSDKPath%\include\libxml\SAX2.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\schemasInternals.h"  "%InstallSDKPath%\include\libxml\schemasInternals.h"  
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\schematron.h"        "%InstallSDKPath%\include\libxml\schematron.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\threads.h"           "%InstallSDKPath%\include\libxml\threads.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\tree.h"              "%InstallSDKPath%\include\libxml\tree.h"              
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\uri.h"               "%InstallSDKPath%\include\libxml\uri.h"               
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\valid.h"             "%InstallSDKPath%\include\libxml\valid.h"             
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xinclude.h"          "%InstallSDKPath%\include\libxml\xinclude.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xlink.h"             "%InstallSDKPath%\include\libxml\xlink.h"             
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlautomata.h"       "%InstallSDKPath%\include\libxml\xmlautomata.h"       
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlerror.h"          "%InstallSDKPath%\include\libxml\xmlerror.h"          
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlexports.h"        "%InstallSDKPath%\include\libxml\xmlexports.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlIO.h"             "%InstallSDKPath%\include\libxml\xmlIO.h"             
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlmemory.h"         "%InstallSDKPath%\include\libxml\xmlmemory.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlmodule.h"         "%InstallSDKPath%\include\libxml\xmlmodule.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlreader.h"         "%InstallSDKPath%\include\libxml\xmlreader.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlregexp.h"         "%InstallSDKPath%\include\libxml\xmlregexp.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlsave.h"           "%InstallSDKPath%\include\libxml\xmlsave.h"           
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlschemas.h"        "%InstallSDKPath%\include\libxml\xmlschemas.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlschemastypes.h"   "%InstallSDKPath%\include\libxml\xmlschemastypes.h"   
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlstring.h"         "%InstallSDKPath%\include\libxml\xmlstring.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlunicode.h"        "%InstallSDKPath%\include\libxml\xmlunicode.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlversion.h"        "%InstallSDKPath%\include\libxml\xmlversion.h"        
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xmlwriter.h"         "%InstallSDKPath%\include\libxml\xmlwriter.h"         
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xpath.h"             "%InstallSDKPath%\include\libxml\xpath.h"             
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xpathInternals.h"    "%InstallSDKPath%\include\libxml\xpathInternals.h"    
copy /Y "%VCMakeRootPath%Source\%SourceProjName%\include\libxml\xpointer.h"          "%InstallSDKPath%\include\libxml\xpointer.h"          

:: 源代码还原
cd\
%libxml2SRCDisk%
cd\
cd "%libxml2SRC%"
git clean -d  -fx -f
git checkout .
