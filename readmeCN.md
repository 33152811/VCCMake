# VC-CMake : VC2017/VC2019 CMake 编译源代码

- [English](readme.md)

## 文件说明：
    Script\dlzip.cmd ：从网络上下载源代码压缩文件;
    Script\dlgit.cmd ：GIT 方式下载源代码;
    Script\dlsvn.cmd ：SVN 方式下载源代码;
    Script\vcp.txt   ：CMake 编译参数;
    Script\vcm.cmd   ：VC    编译;
    Script\px86.txt  ：x86   编译时，系统搜索路径;按照自己机器目录修改;
    Script\px64.txt  ：x64   编译时，系统搜索路径;按照自己机器目录修改;
    vcx86.cmd        ：编译总开关。启动编译 x86 平台;
    vcx64.cmd        ：编译总开关。启动编译 x64 平台;
    CMake            ：目录; 放置着编译需要的工具。如CMake、pkgconfig、7z,等等;

## 编译说明：
    编译开始会检查源代码目录是否存在，如果存在，就不在重新下载了;
    也就是说，如果源代码目录存在，那个下载地址可以任意填写了;
    也可以说，你可以手动复制源代码目录到 Source 目录下，进行编译;
    默认编译的是 MT 类型的静态库。其它类型，可以自行修改;
    WIN7X64、WIN10X64下测试通过；支持X86、X64;
    
## 沟通联系：
    邮箱：dbyoung@sina.com
    QQ群：101611228
