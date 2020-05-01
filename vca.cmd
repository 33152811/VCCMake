@echo off

set CurrentCD=%1
set BuildLang=%2
set Platform1=%3
set Platform2=%4
set Configure=%5
set SetupPath=%6

set "Buildtype=%CurrentCD% %BuildLang% %Platform1% %Platform2% %Configure% %SetupPath%"

rem call "%CurrentCD%Script\dlzip" zlib-1.2.11                  https://www.zlib.net/zlib-1.2.11.tar.gz                             %Buildtype% zlib.sln
rem call "%CurrentCD%Script\dlgit" xz                           https://git.tukaani.org/xz.git                                      %Buildtype% xz.sln
rem call "%CurrentCD%Script\dlgit" bzip2                        https://github.com/osrf/bzip2_cmake.git                             %Buildtype% bzip2.sln
rem call "%CurrentCD%Script\dlgit" z3                           https://github.com/Z3Prover/z3.git                                  %Buildtype% z3.sln
rem call "%CurrentCD%Script\dlgit" lz4                          https://github.com/lz4/lz4.git                                      %Buildtype% lz4.sln
rem call "%CurrentCD%Script\dlgit" giflib                       https://github.com/xbmc/giflib.git                                  %Buildtype% giflib.sln
rem call "%CurrentCD%Script\dlgit" libjpeg-turbo                https://github.com/libjpeg-turbo/libjpeg-turbo.git                  %Buildtype% libjpeg-turbo.sln
rem call "%CurrentCD%Script\dlgit" ImageMagick-windows          https://github.com/ImageMagick/ImageMagick-windows.git              %Buildtype% nghttp2.sln
rem call "%CurrentCD%Script\dlgit" openjpeg                     https://github.com/uclouvain/openjpeg.git                           %Buildtype% openjpeg.sln
rem call "%CurrentCD%Script\dlgit" libpng                       https://github.com/glennrp/libpng.git                               %Buildtype% libpng.sln
rem call "%CurrentCD%Script\dlgit" libtiff                      https://gitlab.com/libtiff/libtiff.git                              %Buildtype% tiff.sln
rem call "%CurrentCD%Script\dlgit" libwebp                      https://chromium.googlesource.com/webm/libwebp                      %Buildtype% webp.sln
rem call "%CurrentCD%Script\dlgit" leptonica                    https://github.com/DanBloomberg/leptonica.git                       %Buildtype% leptonica.sln
rem call "%CurrentCD%Script\dlgit" tesseract                    https://github.com/tesseract-ocr/tesseract.git                      %Buildtype% tesseract.sln
rem call "%CurrentCD%Script\dlzip" SDL2-2.0.12                  http://www.libsdl.org/release/SDL2-2.0.12.tar.gz                    %Buildtype% sdl2.sln
rem call "%CurrentCD%Script\dlgit" gflags                       https://github.com/gflags/gflags.git                                %Buildtype% gflags.sln
rem call "%CurrentCD%Script\dlgit" glog                         https://github.com/google/glog.git                                  %Buildtype% glog.sln
rem call "%CurrentCD%Script\dlgit" gtest                        https://github.com/google/googletest.git                            %Buildtype% googletest-distribution.sln
rem call "%CurrentCD%Script\dlzip" sqlite-snapshot-202003121754 https://www.sqlite.org/snapshot/sqlite-snapshot-202003121754.tar.gz %Buildtype% sqlite.sln
rem call "%CurrentCD%Script\dlgit" libssh2                      https://github.com/libssh2/libssh2.git                              %Buildtype% libssh2.sln
rem call "%CurrentCD%Script\dlgit" curl                         https://github.com/curl/curl.git                                    %Buildtype% curl.sln
rem call "%CurrentCD%Script\dlgit" harfbuzz                     https://github.com/harfbuzz/harfbuzz.git                            %Buildtype% harfbuzz.sln
rem call "%CurrentCD%Script\dlgit" freetype                     https://github.com/winlibs/freetype.git                             %Buildtype% freetype.sln
rem call "%CurrentCD%Script\dlgit" hdf5                         https://github.com/live-clones/hdf5.git                             %Buildtype% hdf5.sln
rem call "%CurrentCD%Script\dlgit" snappy                       https://github.com/willyd/snappy.git                                %Buildtype% snappy.sln
rem call "%CurrentCD%Script\dlgit" libiconv                     https://github.com/LuaDist/libiconv.git                             %Buildtype% libiconv.sln

rem call "%CurrentCD%Script\dlgit" libxml2                      https://github.com/GNOME/libxml2.git                                %Buildtype% xml2.sln
call "%CurrentCD%Script\dlgit" PDCurses                     https://github.com/Bill-Gray/PDCurses.git                           %Buildtype% PDCurses.sln
rem call "%CurrentCD%Script\dlgit" fish                         https://git.sr.ht/~faho/fish                                        %Buildtype% fish.sln
rem call "%CurrentCD%Script\dlgit" boost                        https://github.com/boostorg/boost.git                               %Buildtype% boost.sln
rem call "%CurrentCD%Script\dlgit" leveldb                      https://github.com/willyd/leveldb.git                               %Buildtype% leveldb.sln
rem call "%CurrentCD%Script\dlgit" openssl                      https://github.com/janbar/openssl-cmake.git                         %Buildtype% openssl.sln
rem call "%CurrentCD%Script\dlgit" cares                        https://github.com/c-ares/c-ares.git                                %Buildtype% cares.sln
rem call "%CurrentCD%Script\dlgit" nghttp2                      https://github.com/nghttp2/nghttp2.git                              %Buildtype% nghttp2.sln
rem call "%CurrentCD%Script\dlgit" ceres                        https://github.com/ceres-solver/ceres-solver.git                    %Buildtype% ceres.sln
rem call "%CurrentCD%Script\dlgit" brotli                       https://github.com/google/brotli.git                                %Buildtype% brotli.sln
rem call "%CurrentCD%Script\dlgit" eigen                        https://github.com/eigenteam/eigen-git-mirror.git                   %Buildtype% eigen.sln
rem call "%CurrentCD%Script\dlgit" fribidi-cmake                https://github.com/tamaskenez/fribidi-cmake.git                     %Buildtype% fribidi.sln
rem call "%CurrentCD%Script\dlgit" doxygen                      https://github.com/doxygen/doxygen.git                              %Buildtype% doxygen.sln
rem call "%CurrentCD%Script\dlgit" pcre                         https://github.com/svn2github/pcre.git                              %Buildtype% pcre.sln
rem call "%CurrentCD%Script\dlgit" pcre2                        svn://vcs.exim.org/pcre2                                            %Buildtype% pcre2.sln
rem call "%CurrentCD%Script\dlgit" glib                         https://github.com/GNOME/glib.git                                   %Buildtype% glib.sln
rem call "%CurrentCD%Script\dlgit" tinyxml2                     https://github.com/leethomason/tinyxml2.git                         %Buildtype% tinyxml2.sln
rem call "%CurrentCD%Script\dlgit" llvm                      https://github.com/llvm/llvm-project.git                               %Buildtype% llvm.sln
rem call "%CurrentCD%Script\dlgit" qt5                       https://github.com/qt/qt5.git                                           %Buildtype% QT5.sln
rem call "%CurrentCD%Script\dlzip" VTK                          https://www.vtk.org/files/release/9.0/VTK-9.0.0.rc1.tar.gz          %Buildtype% VTK.sln
rem call "%CurrentCD%Script\dlgit" CastXML                      https://github.com/CastXML/CastXML.git                              %Buildtype% CastXML.sln
rem call "%CurrentCD%Script\dlgit" qTox                         https://github.com/qTox/qTox.git                                    %Buildtype% qTox.sln
rem call "%CurrentCD%Script\dlgit" pytorch                      https://github.com/pytorch/pytorch.git                              %Buildtype% Caffe2.sln
