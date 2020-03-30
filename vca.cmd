@echo off

set CurrentCD=%1
set BuildLang=%2
set Platform1=%3
set Platform2=%4
set Configure=%5
set SetupPath=%6

set "Buildtype=%CurrentCD% %BuildLang% %Platform1% %Platform2% %Configure% %SetupPath%"

call "%CurrentCD%Script\dlzip" zlib-1.2.11                  https://www.zlib.net/zlib-1.2.11.tar.gz                             %Buildtype% zlib.sln
call "%CurrentCD%Script\dlgit" xz                           https://git.tukaani.org/xz.git                                      %Buildtype% xz.sln
call "%CurrentCD%Script\dlgit" bzip2                        https://github.com/osrf/bzip2_cmake.git                             %Buildtype% bzip2.sln
call "%CurrentCD%Script\dlgit" z3                           https://github.com/Z3Prover/z3.git                                  %Buildtype% z3.sln
call "%CurrentCD%Script\dlgit" lz4                          https://github.com/lz4/lz4.git                                      %Buildtype% lz4.sln
call "%CurrentCD%Script\dlgit" libpng                       https://github.com/glennrp/libpng.git                               %Buildtype% libpng.sln
call "%CurrentCD%Script\dlgit" giflib                       https://github.com/xbmc/giflib.git                                  %Buildtype% giflib.sln
call "%CurrentCD%Script\dlgit" libjpeg-turbo                https://github.com/libjpeg-turbo/libjpeg-turbo.git                  %Buildtype% libjpeg-turbo.sln
call "%CurrentCD%Script\dlgit" ImageMagick-windows          https://github.com/ImageMagick/ImageMagick-windows.git              %Buildtype% nghttp2.sln
call "%CurrentCD%Script\dlgit" openjpeg                     https://github.com/uclouvain/openjpeg.git                           %Buildtype% openjpeg.sln
call "%CurrentCD%Script\dlzip" SDL2-2.0.12                  http://www.libsdl.org/release/SDL2-2.0.12.tar.gz                    %Buildtype% sdl2.sln
call "%CurrentCD%Script\dlgit" gflags                       https://github.com/gflags/gflags.git                                %Buildtype% gflags.sln
call "%CurrentCD%Script\dlgit" glog                         https://github.com/google/glog.git                                  %Buildtype% glog.sln
call "%CurrentCD%Script\dlgit" gtest                        https://github.com/google/googletest.git                            %Buildtype% googletest-distribution.sln
call "%CurrentCD%Script\dlzip" sqlite-snapshot-202003121754 https://www.sqlite.org/snapshot/sqlite-snapshot-202003121754.tar.gz %Buildtype% sqlite.sln
call "%CurrentCD%Script\dlgit" libssh2                      https://github.com/libssh2/libssh2.git                              %Buildtype% libssh2.sln
call "%CurrentCD%Script\dlgit" curl                         https://github.com/curl/curl.git                                    %Buildtype% curl.sln
call "%CurrentCD%Script\dlgit" harfbuzz                     https://github.com/harfbuzz/harfbuzz.git                            %Buildtype% harfbuzz.sln
call "%CurrentCD%Script\dlgit" freetype                     https://github.com/winlibs/freetype.git                             %Buildtype% freetype.sln
call "%CurrentCD%Script\dlgit" hdf5                         https://github.com/live-clones/hdf5.git                             %Buildtype% hdf5.sln
call "%CurrentCD%Script\dlgit" snappy                       https://github.com/willyd/snappy.git                                %Buildtype% snappy.sln
call "%CurrentCD%Script\dlgit" boost                        https://github.com/boostorg/boost.git                               %Buildtype% boost.sln
call "%CurrentCD%Script\dlgit" leveldb                      https://github.com/willyd/leveldb.git                               %Buildtype% leveldb.sln
call "%CurrentCD%Script\dlgit" openssl                      https://github.com/janbar/openssl-cmake.git                         %Buildtype% openssl.sln
call "%CurrentCD%Script\dlgit" cares                        https://github.com/c-ares/c-ares.git                                %Buildtype% cares.sln
call "%CurrentCD%Script\dlgit" nghttp2                      https://github.com/nghttp2/nghttp2.git                              %Buildtype% nghttp2.sln
call "%CurrentCD%Script\dlzip" llvm\llvm                    https://github.com/llvm/llvm-project.git                            %Buildtype% llvm.sln
call "%CurrentCD%Script\dlzip" llvm\clang                   https://github.com/llvm/llvm-project.git                            %Buildtype% llvm.sln
call "%CurrentCD%Script\dlgit" QT5                          --branch 5.15 https://github.com/qt/qt5.git                         %Buildtype% QT5.sln
call "%CurrentCD%Script\dlzip" VTK                          https://www.vtk.org/files/release/9.0/VTK-9.0.0.rc1.tar.gz          %Buildtype% VTK.sln
call "%CurrentCD%Script\dlgit" ceres                        https://github.com/ceres-solver/ceres-solver.git                    %Buildtype% ceres.sln
