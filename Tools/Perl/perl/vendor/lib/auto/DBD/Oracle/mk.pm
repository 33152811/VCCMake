$dbd_oracle_mm_opts = {
                        'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"12.1.0.2.0\\" -DORA_OCI_102 -DORA_OCI_112',
                        'LIBS' => [
                                    '-LC:/STRAWB~2/env/USERPR~1/.cpanm/work/1457337852.948/DBD-Oracle-1.74 -loci'
                                  ],
                        'DIR' => [],
                        'PREREQ_PM' => {
                                         'DBI' => '1.51'
                                       },
                        'VERSION_FROM' => 'lib/DBD/Oracle.pm',
                        'INC' => '-IC:/ora12instant32/sdk/include -IC:/ora12instant32/rdbms/demo -IC:\\strawberry\\perl\\vendor\\lib\\auto\\DBI',
                        'clean' => {
                                     'FILES' => 'xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def mk.pm DBD_ORA_OBJ.*'
                                   },
                        'META_MERGE' => {
                                          'resources' => {
                                                           'homepage' => 'http://search.cpan.org/dist/DBD-Oracle',
                                                           'repository' => {
                                                                             'url' => 'git://github.com/yanick/DBD-Oracle.git',
                                                                             'web' => 'http://github.com/yanick/DBD-Oracle/tree',
                                                                             'type' => 'git'
                                                                           },
                                                           'bugtracker' => {
                                                                             'mailto' => 'bug-dbd-oracle at rt.cpan.org',
                                                                             'web' => 'http://rt.cpan.org/Public/Dist/Display.html?Name=DBD-Oracle'
                                                                           }
                                                         },
                                          'build_requires' => {
                                                                'DBI' => '1.51',
                                                                'Test::Simple' => '0.90',
                                                                'ExtUtils::MakeMaker' => 0
                                                              },
                                          'configure_requires' => {
                                                                    'DBI' => '1.51'
                                                                  }
                                        },
                        'NAME' => 'DBD::Oracle',
                        'AUTHOR' => 'Tim Bunce (dbi-users@perl.org)',
                        'LICENSE' => 'perl',
                        'OBJECT' => '$(O_FILES)',
                        'dist' => {
                                    'PREOP' => '$(MAKE) -f Makefile.old distdir',
                                    'DIST_DEFAULT' => 'clean distcheck disttest tardist',
                                    'SUFFIX' => 'gz',
                                    'COMPRESS' => 'gzip -v9'
                                  },
                        'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm'
                      };
$dbd_oracle_mm_self = bless( {
                               'INST_ARCHAUTODIR' => '$(INST_ARCHLIB)\\auto\\$(FULLEXT)',
                               'DLBASE' => '$(BASEEXT)',
                               'LIBPERL_A' => 'libperl.a',
                               'PM' => {
                                         'lib/DBD/Oracle.pm' => 'blib\\lib\\DBD\\Oracle.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Cygwin.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Cygwin.pod',
                                         'lib/DBD/Oracle/Object.pm' => 'blib\\lib\\DBD\\Oracle\\Object.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Linux.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Linux.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Macos.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Macos.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Win64.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Win64.pod',
                                         'mk.pm' => '$(INST_LIB)\\DBD\\mk.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Win32.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Win32.pod',
                                         'lib/DBD/Oracle/GetInfo.pm' => 'blib\\lib\\DBD\\Oracle\\GetInfo.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Vms.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Vms.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Sun.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Sun.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Aix.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Aix.pod',
                                         'lib/DBD/Oracle/Troubleshooting.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Hpux.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Hpux.pod'
                                       },
                               'INSTALLVENDORMAN1DIR' => '$(INSTALLMAN1DIR)',
                               'USEMAKEFILE' => '-f',
                               'MAKEFILE_OLD' => 'Makefile.old',
                               'ZIP' => 'zip',
                               'DESTINSTALLSITEMAN1DIR' => '$(DESTDIR)$(INSTALLSITEMAN1DIR)',
                               'SHAR' => 'shar',
                               'DESTINSTALLMAN1DIR' => '$(DESTDIR)$(INSTALLMAN1DIR)',
                               'DESTINSTALLVENDORLIB' => '$(DESTDIR)$(INSTALLVENDORLIB)',
                               'TAR' => 'tar',
                               'DESTINSTALLVENDORARCH' => '$(DESTDIR)$(INSTALLVENDORARCH)',
                               'MAN3PODS' => {},
                               'INSTALLVENDORLIB' => 'C:\\strawberry\\perl\\vendor\\lib',
                               'ABSPERLRUN' => '$(ABSPERL)',
                               'SITEARCHEXP' => 'C:\\strawberry\\perl\\site\\lib',
                               'DESTINSTALLSITEMAN3DIR' => '$(DESTDIR)$(INSTALLSITEMAN3DIR)',
                               'DISTNAME' => 'DBD-Oracle',
                               'MOD_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Install -e "install([ from_to => {{@ARGV}}, verbose => \'$(VERBINST)\', uninstall_shadows => \'$(UNINST)\', dir_mode => \'$(PERM_DIR)\' ]);" --',
                               'MAN1EXT' => '1',
                               'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm',
                               'MACROEND' => '',
                               'XS_DEFINE_VERSION' => '-D$(XS_VERSION_MACRO)=\\"$(XS_VERSION)\\"',
                               'INSTALLSITEMAN3DIR' => '$(INSTALLMAN3DIR)',
                               'DESTINSTALLVENDORMAN1DIR' => '$(DESTDIR)$(INSTALLVENDORMAN1DIR)',
                               'PREREQ_PM' => $dbd_oracle_mm_opts->{'PREREQ_PM'},
                               'DESTINSTALLVENDORSCRIPT' => '$(DESTDIR)$(INSTALLVENDORSCRIPT)',
                               'MM_VERSION' => '7.1',
                               'PERL' => '"C:\\strawberry\\perl\\bin\\perl.exe"',
                               'clean' => $dbd_oracle_mm_opts->{'clean'},
                               'PERM_RWX' => 755,
                               'MM_REVISION' => 71000,
                               'CP' => '$(ABSPERLRUN) -MExtUtils::Command -e cp --',
                               'AR_STATIC_ARGS' => 'cr',
                               'MAN3EXT' => '3',
                               'PREFIX' => '$(VENDORPREFIX)',
                               'VERBINST' => 0,
                               'DESTINSTALLSITEBIN' => '$(DESTDIR)$(INSTALLSITEBIN)',
                               'NAME' => 'DBD::Oracle',
                               'CONFIG' => [
                                             'ar',
                                             'cc',
                                             'cccdlflags',
                                             'ccdlflags',
                                             'dlext',
                                             'dlsrc',
                                             'exe_ext',
                                             'full_ar',
                                             'ld',
                                             'lddlflags',
                                             'ldflags',
                                             'libc',
                                             'lib_ext',
                                             'obj_ext',
                                             'osname',
                                             'osvers',
                                             'ranlib',
                                             'sitelibexp',
                                             'sitearchexp',
                                             'so',
                                             'vendorarchexp',
                                             'vendorlibexp'
                                           ],
                               'DESTINSTALLSITESCRIPT' => '$(DESTDIR)$(INSTALLSITESCRIPT)',
                               'TEST_S' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e test_s --',
                               'PERL_ARCHLIBDEP' => 'C:\\strawberry\\perl\\lib',
                               'INSTALLVENDORMAN3DIR' => '$(INSTALLMAN3DIR)',
                               'MAKEFILE' => 'Makefile',
                               'DEFINE_VERSION' => '-D$(VERSION_MACRO)=\\"$(VERSION)\\"',
                               'INSTALLMAN1DIR' => 'none',
                               'LINKTYPE' => 'dynamic',
                               'FIXIN' => 'pl2bat.bat',
                               'PERL_ARCHIVE_AFTER' => '',
                               'INSTALLSITEBIN' => 'C:\\strawberry\\perl\\site\\bin',
                               'INSTALLSITEARCH' => 'C:\\strawberry\\perl\\site\\lib',
                               'EQUALIZE_TIMESTAMP' => '$(ABSPERLRUN) -MExtUtils::Command -e eqtime --',
                               'INST_LIBDIR' => '$(INST_LIB)\\DBD',
                               'LDFROM' => '$(OBJECT)',
                               'PL_FILES' => {},
                               'EXPORT_LIST' => '$(BASEEXT).def',
                               'TEST_F' => '$(ABSPERLRUN) -MExtUtils::Command -e test_f --',
                               'ABSTRACT' => 'Oracle database driver for the DBI module',
                               'VENDORLIBEXP' => 'C:\\strawberry\\perl\\vendor\\lib',
                               'TEST_REQUIRES' => {},
                               'VERSION_FROM' => 'lib/DBD/Oracle.pm',
                               'ABSPERL' => '$(PERL)',
                               'INSTALLVENDORBIN' => 'C:\\strawberry\\perl\\bin',
                               'MKPATH' => '$(ABSPERLRUN) -MExtUtils::Command -e mkpath --',
                               'SO' => 'dll',
                               'PERLRUN' => '$(PERL)',
                               'LD_RUN_PATH' => '',
                               'PERL_INCDEP' => 'C:\\strawberry\\perl\\lib\\CORE',
                               'HAS_LINK_CODE' => 1,
                               'dist' => $dbd_oracle_mm_opts->{'dist'},
                               'PERLRUNINST' => '$(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'LDDLFLAGS' => '-mdll -s -L"C:\\strawberry\\perl\\lib\\CORE" -L"C:\\strawberry\\c\\lib"',
                               'MV' => '$(ABSPERLRUN) -MExtUtils::Command -e mv --',
                               'DIST_DEFAULT' => 'tardist',
                               'PERLMAINCC' => '$(CC)',
                               'CCDLFLAGS' => ' ',
                               'PERL_LIB' => 'C:\\strawberry\\perl\\lib',
                               'PERM_RW' => 644,
                               'C' => [
                                        'Oracle.c',
                                        'dbdimp.c',
                                        'oci8.c'
                                      ],
                               'TOUCH' => '$(ABSPERLRUN) -MExtUtils::Command -e touch --',
                               'INST_STATIC' => '$(INST_ARCHAUTODIR)\\$(BASEEXT)$(LIB_EXT)',
                               'BUILD_REQUIRES' => {},
                               'RCS_LABEL' => 'rcs -Nv$(VERSION_SYM): -q',
                               'FULLPERLRUNINST' => '$(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'FULL_AR' => '',
                               'TO_UNIX' => '$(NOECHO) $(NOOP)',
                               'ZIPFLAGS' => '-r',
                               'MAKE' => 'dmake',
                               'OBJECT' => '$(O_FILES)',
                               'CI' => 'ci -u',
                               'SUFFIX' => '.gz',
                               'NAME_SYM' => 'DBD_Oracle',
                               'DESTINSTALLSCRIPT' => '$(DESTDIR)$(INSTALLSCRIPT)',
                               'INST_BOOT' => '$(INST_ARCHAUTODIR)\\$(BASEEXT).bs',
                               'PERLPREFIX' => 'C:\\strawberry\\perl',
                               'INST_MAN3DIR' => 'blib\\man3',
                               'INST_DYNAMIC' => '$(INST_ARCHAUTODIR)\\$(DLBASE).$(DLEXT)',
                               'EXTRALIBS' => '"liboci.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libmoldname.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libkernel32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libuser32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libgdi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libwinspool.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libcomdlg32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libadvapi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libshell32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libole32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\liboleaut32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libnetapi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libuuid.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libws2_32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libmpr.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libwinmm.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libversion.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libodbc32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libodbccp32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libcomctl32.a"',
                               'BSLOADLIBS' => '',
                               'MAP_TARGET' => 'perl',
                               'INST_MAN1DIR' => 'blib\\man1',
                               'DESTDIR' => '',
                               'ECHO_N' => '$(ABSPERLRUN)  -e "print qq{{@ARGV}}" --',
                               'INSTALLSCRIPT' => 'C:\\strawberry\\perl\\bin',
                               'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                               'INST_SCRIPT' => 'blib\\script',
                               'SITELIBEXP' => 'C:\\strawberry\\perl\\site\\lib',
                               'PERL_INC' => 'C:\\strawberry\\perl\\lib\\CORE',
                               'TARFLAGS' => 'cvf',
                               'PMLIBPARENTDIRS' => [
                                                      'lib'
                                                    ],
                               'VERSION' => '1.74',
                               'RESULT' => [
                                             '# This Makefile is for the DBD::Oracle extension to perl.
#
# It was generated automatically by MakeMaker version
# 7.1 (Revision: 71000) from the contents of
# Makefile.PL. Don\'t edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
',
                                             '#   MakeMaker Parameters:
',
                                             '#     ABSTRACT_FROM => q[lib/DBD/Oracle.pm]',
                                             '#     AUTHOR => [q[Tim Bunce (dbi-users@perl.org)]]',
                                             '#     BUILD_REQUIRES => {  }',
                                             '#     CONFIGURE_REQUIRES => {  }',
                                             '#     DEFINE => q[ -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"12.1.0.2.0\\" -DORA_OCI_102 -DORA_OCI_112]',
                                             '#     DIR => []',
                                             '#     INC => q[-IC:/ora12instant32/sdk/include -IC:/ora12instant32/rdbms/demo -IC:\\strawberry\\perl\\vendor\\lib\\auto\\DBI]',
                                             '#     LIBS => [q[-LC:/STRAWB~2/env/USERPR~1/.cpanm/work/1457337852.948/DBD-Oracle-1.74 -loci]]',
                                             '#     LICENSE => q[perl]',
                                             '#     META_MERGE => { build_requires=>{ DBI=>q[1.51], ExtUtils::MakeMaker=>q[0], Test::Simple=>q[0.90] }, configure_requires=>{ DBI=>q[1.51] }, resources=>{ bugtracker=>{ mailto=>q[bug-dbd-oracle at rt.cpan.org], web=>q[http://rt.cpan.org/Public/Dist/Display.html?Name=DBD-Oracle] }, homepage=>q[http://search.cpan.org/dist/DBD-Oracle], repository=>{ type=>q[git], url=>q[git://github.com/yanick/DBD-Oracle.git], web=>q[http://github.com/yanick/DBD-Oracle/tree] } } }',
                                             '#     NAME => q[DBD::Oracle]',
                                             '#     OBJECT => q[$(O_FILES)]',
                                             '#     PREREQ_PM => { DBI=>q[1.51] }',
                                             '#     TEST_REQUIRES => {  }',
                                             '#     VERSION_FROM => q[lib/DBD/Oracle.pm]',
                                             '#     clean => { FILES=>q[xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def mk.pm DBD_ORA_OBJ.*] }',
                                             '#     dist => { COMPRESS=>q[gzip -v9], DIST_DEFAULT=>q[clean distcheck disttest tardist], PREOP=>q[$(MAKE) -f Makefile.old distdir], SUFFIX=>q[gz] }',
                                             '
# --- MakeMaker post_initialize section:'
                                           ],
                               'EXE_EXT' => '.exe',
                               'INST_AUTODIR' => '$(INST_LIB)\\auto\\$(FULLEXT)',
                               'INST_ARCHLIBDIR' => '$(INST_ARCHLIB)\\DBD',
                               'XS_VERSION_MACRO' => 'XS_VERSION',
                               'BOOTDEP' => '',
                               'LDLOADLIBS' => '"liboci.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libmoldname.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libkernel32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libuser32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libgdi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libwinspool.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libcomdlg32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libadvapi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libshell32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libole32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\liboleaut32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libnetapi32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libuuid.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libws2_32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libmpr.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libwinmm.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libversion.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libodbc32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libodbccp32.a" "C:\\strawberry\\c\\i686-w64-mingw32\\lib\\libcomctl32.a"',
                               'FALSE' => '$(ABSPERLRUN)  -e "exit 1" --',
                               'UNINST' => '1',
                               'CP_NONEMPTY' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e cp_nonempty --',
                               'WARN_IF_OLD_PACKLIST' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e warn_if_old_packlist --',
                               'MAN1PODS' => {},
                               'PERM_DIR' => 755,
                               'DESTINSTALLMAN3DIR' => '$(DESTDIR)$(INSTALLMAN3DIR)',
                               'DESTINSTALLBIN' => '$(DESTDIR)$(INSTALLBIN)',
                               'INSTALLVENDORARCH' => 'C:\\strawberry\\perl\\vendor\\lib',
                               'PERL_ARCHLIB' => 'C:\\strawberry\\perl\\lib',
                               'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                               'OSVERS' => '6.3',
                               'INSTALLMAN3DIR' => 'none',
                               'PREOP' => '$(NOECHO) $(NOOP)',
                               'SKIPHASH' => {},
                               'OSNAME' => 'MSWin32',
                               'H' => [
                                        'Oracle.h',
                                        'dbdimp.h',
                                        'dbivport.h',
                                        'ocitrace.h'
                                      ],
                               'DISTVNAME' => 'DBD-Oracle-1.74',
                               'AUTHOR' => [
                                             'Tim Bunce (dbi-users@perl.org)'
                                           ],
                               'PARENT_NAME' => 'DBD',
                               'NOOP' => 'rem',
                               'DESTINSTALLVENDORBIN' => '$(DESTDIR)$(INSTALLVENDORBIN)',
                               'LDFLAGS' => '-s -L"C:\\strawberry\\perl\\lib\\CORE" -L"C:\\strawberry\\c\\lib"',
                               'RM_RF' => '$(ABSPERLRUN) -MExtUtils::Command -e rm_rf --',
                               'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"12.1.0.2.0\\" -DORA_OCI_102 -DORA_OCI_112',
                               'VENDORPREFIX' => 'C:\\strawberry\\perl\\vendor',
                               'DESTINSTALLARCHLIB' => '$(DESTDIR)$(INSTALLARCHLIB)',
                               'DESTINSTALLVENDORMAN3DIR' => '$(DESTDIR)$(INSTALLVENDORMAN3DIR)',
                               'INC' => '-IC:/ora12instant32/sdk/include -IC:/ora12instant32/rdbms/demo -IC:\\strawberry\\perl\\vendor\\lib\\auto\\DBI',
                               'AR' => 'ar',
                               'DEV_NULL' => '> NUL',
                               'FULLPERLRUN' => '$(FULLPERL)',
                               'MM_Win32_VERSION' => '7.10',
                               'MAKE_APERL_FILE' => 'Makefile.aperl',
                               'DIRFILESEP' => '\\\\',
                               'LIB_EXT' => '.a',
                               'INSTALLVENDORSCRIPT' => 'C:\\strawberry\\perl\\bin',
                               'INST_BIN' => 'blib\\bin',
                               'INSTALLARCHLIB' => 'C:\\strawberry\\perl\\lib',
                               'INST_LIB' => 'blib\\lib',
                               'RANLIB' => 'rem',
                               'SITEPREFIX' => 'C:\\strawberry\\perl\\site',
                               'PERL_ARCHIVEDEP' => '$(PERL_INCDEP)\\libperl522.a',
                               'CHMOD' => '$(ABSPERLRUN) -MExtUtils::Command -e chmod --',
                               'DLEXT' => 'xs.dll',
                               'FULLPERL' => '"C:\\strawberry\\perl\\bin\\perl.exe"',
                               'UNINSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e uninstall --',
                               'DESTINSTALLSITEARCH' => '$(DESTDIR)$(INSTALLSITEARCH)',
                               'CONFIGURE_REQUIRES' => {},
                               'DESTINSTALLSITELIB' => '$(DESTDIR)$(INSTALLSITELIB)',
                               'NOECHO' => '@',
                               'VERSION_SYM' => '1_74',
                               'OBJ_EXT' => '.o',
                               'COMPRESS' => 'gzip --best',
                               'PMLIBDIRS' => [
                                                'lib'
                                              ],
                               'O_FILES' => [
                                              'Oracle.o',
                                              'dbdimp.o',
                                              'oci8.o'
                                            ],
                               'DLSRC' => 'dl_win32.xs',
                               'ABSPERLRUNINST' => '$(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'POSTOP' => '$(NOECHO) $(NOOP)',
                               'LICENSE' => 'perl',
                               'UMASK_NULL' => 'umask 0',
                               'LIBC' => '',
                               'CC' => 'gcc',
                               'INSTALLDIRS' => 'vendor',
                               'PERL_ARCHIVE' => '$(PERL_INC)\\libperl522.a',
                               'INSTALLSITELIB' => 'C:\\strawberry\\perl\\site\\lib',
                               'MAKEMAKER' => 'C:/strawberry/perl/lib/ExtUtils/MakeMaker.pm',
                               'INSTALLSITESCRIPT' => 'C:\\strawberry\\perl\\site\\bin',
                               'MACROSTART' => '',
                               'ARGS' => {
                                           'NAME' => 'DBD::Oracle',
                                           'UNINST' => '1',
                                           'INC' => '-IC:/ora12instant32/sdk/include -IC:/ora12instant32/rdbms/demo -IC:\\strawberry\\perl\\vendor\\lib\\auto\\DBI',
                                           'VERSION_FROM' => 'lib/DBD/Oracle.pm',
                                           'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                                           'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"12.1.0.2.0\\" -DORA_OCI_102 -DORA_OCI_112',
                                           'AUTHOR' => $dbd_oracle_mm_self->{'AUTHOR'},
                                           'clean' => $dbd_oracle_mm_opts->{'clean'},
                                           'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                                           'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                                           'PREREQ_PM' => $dbd_oracle_mm_opts->{'PREREQ_PM'},
                                           'dist' => $dbd_oracle_mm_opts->{'dist'},
                                           'INSTALLDIRS' => 'vendor',
                                           'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm',
                                           'OBJECT' => '$(O_FILES)',
                                           'LICENSE' => 'perl'
                                         },
                               'RM_F' => '$(ABSPERLRUN) -MExtUtils::Command -e rm_f --',
                               'DIST_CP' => 'best',
                               'PERL_CORE' => 0,
                               'INST_ARCHLIB' => 'blib\\arch',
                               'FIRST_MAKEFILE' => 'Makefile',
                               'LD' => 'g++',
                               'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                               'FULLEXT' => 'DBD\\Oracle',
                               'DESTINSTALLPRIVLIB' => '$(DESTDIR)$(INSTALLPRIVLIB)',
                               'INSTALLBIN' => 'C:\\strawberry\\perl\\bin',
                               'ECHO' => '$(ABSPERLRUN) -l -e "binmode STDOUT, qq{{:raw}}; print qq{{@ARGV}}" --',
                               'PERL_SRC' => undef,
                               'INSTALLSITEMAN1DIR' => '$(INSTALLMAN1DIR)',
                               'XS_VERSION' => '1.74',
                               'INSTALLPRIVLIB' => 'C:\\strawberry\\perl\\lib',
                               'DOC_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e perllocal_install --',
                               'BASEEXT' => 'Oracle',
                               'VENDORARCHEXP' => 'C:\\strawberry\\perl\\vendor\\lib',
                               'TRUE' => '$(ABSPERLRUN)  -e "exit 0" --',
                               'VERSION_MACRO' => 'VERSION',
                               'XS' => {
                                         'Oracle.xs' => 'Oracle.c'
                                       },
                               'CCCDLFLAGS' => ' '
                             }, 'PACK001' );