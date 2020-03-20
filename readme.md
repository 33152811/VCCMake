# VCCMake : VC2017 / 2019 CMake Compilation Source Code

- [简体中文](readmeCN.md)

## Document Description:
    Script \ dlzip.cmd: Download a compressed source code file from the web
    Script \ dlgit.cmd: Download source code in GIT mode
    Script \ dlsvn.cmd: Download source code in SVN mode
    Script \ vcp.txt  : CMake compilation parameters
    Script \ vcm.cmd  : VC compilation
    Script \ px86.txt : system search path when compiling x86
    Script \ px64.txt : system search path when compiling x64
    vcx86.cmd         : Compile master switch. Start compiling for x86 platform
    vcx64.cmd         : Compile master switch. Start compiling for x64 platform

## Note:
    At the beginning of compilation, the source code directory is checked for existence; 
    If it exists, it will not be downloaded again;
    In other words, if the source code directory exists, that download address can be filled in arbitrarily;
    In other words, you can manually copy the source code directory to the Source directory for compilation;
    WIN7X64、WIN10X64 test pass；Support X86、X64;
    Email：dbyoung@sina.com
    QQ   ：101611228
