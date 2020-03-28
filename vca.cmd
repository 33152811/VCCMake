@echo off

set CurrentCD=%1
set BuildLang=%2
set Platform1=%3
set Platform2=%4
set Configure=%5
set SetupPath=%6

set "Buildtype=%CurrentCD% %BuildLang% %Platform1% %Platform2% %Configure% %SetupPath%"

call "%CurrentCD%Script\dlzip" zlib-1.2.11                  https://www.zlib.net/zlib-1.2.11.tar.gz                             %Buildtype% zlib.sln
call "%CurrentCD%Script\dlzip" SDL2-2.0.12                  http://www.libsdl.org/release/SDL2-2.0.12.tar.gz                    %Buildtype% sdl2.sln
call "%CurrentCD%Script\dlgit" gflags                       https://github.com/gflags/gflags.git                                %Buildtype% gflags.sln
call "%CurrentCD%Script\dlgit" glog                         https://github.com/google/glog.git                                  %Buildtype% glog.sln
call "%CurrentCD%Script\dlgit" gtest                        https://github.com/google/googletest.git                            %Buildtype% googletest-distribution.sln
call "%CurrentCD%Script\dlgit" bzip2                        https://github.com/osrf/bzip2_cmake.git                             %Buildtype% bzip2.sln
call "%CurrentCD%Script\dlgit" z3                           https://github.com/Z3Prover/z3.git                                  %Buildtype% z3.sln
call "%CurrentCD%Script\dlgit" libjpeg-turbo                https://github.com/libjpeg-turbo/libjpeg-turbo.git                  %Buildtype% libjpeg-turbo.sln
call "%CurrentCD%Script\dlzip" sqlite-snapshot-202003121754 https://www.sqlite.org/snapshot/sqlite-snapshot-202003121754.tar.gz %Buildtype% sqlite.sln
call "%CurrentCD%Script\dlgit" openssl                      https://github.com/janbar/openssl-cmake.git                         %Buildtype% openssl.sln
call "%CurrentCD%Script\dlgit" libssh2                      https://github.com/libssh2/libssh2.git                              %Buildtype% libssh2.sln
call "%CurrentCD%Script\dlgit" curl                         https://github.com/curl/curl.git                                    %Buildtype% curl.sln
call "%CurrentCD%Script\dlgit" libpng                       https://github.com/glennrp/libpng.git                               %Buildtype% libpng.sln
call "%CurrentCD%Script\dlgit" giflib                       https://github.com/xbmc/giflib.git                                  %Buildtype% giflib.sln
call "%CurrentCD%Script\dlgit" harfbuzz                     https://github.com/harfbuzz/harfbuzz.git                            %Buildtype% harfbuzz.sln
call "%CurrentCD%Script\dlgit" freetype                     https://github.com/winlibs/freetype.git                             %Buildtype% freetype.sln
