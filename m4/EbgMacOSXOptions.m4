dnl# Checks for special options needed on MacOS X.
dnl# Based on part of Vim's configure.in file.
dnl# (By "based on" I mean "shamelessly stolen from")
dnl#
dnl# License: Whatever Vim's license is
dnl#
dnl# Usage: EBG_MACOSX_OPTIONS to include everything
dnl# Usage: EBG_PROG_* to check for program *
dnl#
dnl# Other macros useful for OS X that I did NOT include in this file are:
dnl# - AC_PROG_OBJC had previously been left out, but I have found out how
dnl# use `AC_REQUIRE([])` since then.
dnl# - gt_INTL_MACOSX (This comes from intlmacosx.m4 from recent Mac
dnl# versions of gettext, which some people might not have, so I left it
dnl# out just in case - see EbgMacOSXOptions_Extra.m4 for macros with
dnl# dependencies on macros from outside this package)
dnl#

dnl#
AC_DEFUN([EBG_PROG_APPLESINGLE],
[
AC_PATH_PROG([APPLESINGLE],[applesingle])
  if test "x${APPLESINGLE}" != "x"; then
      AC_MSG_CHECKING([for applesingle version])
      APPLESINGLE_VERSION=`applesingle --version | head -n 1`
      AC_MSG_RESULT([${APPLESINGLE_VERSION}])
  fi
])

dnl# I had a version of this macro that I vendored into my fork of the
dnl# c99-to-c89 package that compared its version against a
dnl# requested one. The only problem was that it relied on the
dnl# AX_COMPARE_VERSION macro, and I do not necessarily want to add a
dnl# dependency on the autoconf-archive here... (that is what the other
dnl# file, EbgMacOSXOptions_Extra.m4 is for)
AC_DEFUN([EBG_PROG_CLANG],
[
AC_PATH_PROG([CLANG],[clang])
  if test "x${CLANG}" != "x"; then
      AC_MSG_CHECKING([for clang version])
      #TODO: make sure the location of the actual version number in the
      # version string is consistent between releases, so that the pipe
      # through 'cut' will work properly:
      export CLANG_VERSION=`clang --version | head -n 1 | cut -d\  -f4`
      AC_MSG_RESULT([${CLANG_VERSION}])
      AC_SUBST([CLANG_VERSION])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_DNSSD],
[
AC_PATH_PROG([DNSSD],[dns-sd])
  if test "x${DNSSD}" != "x"; then
      AC_MSG_CHECKING([for dns-sd version])
      DNSSD_VERSION=`dns-sd -V`
      AC_MSG_RESULT([${DNSSD_VERSION}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_HDIUTIL],
[
AC_PATH_PROG([HDIUTIL],[hdiutil])
  if test "x${HDIUTIL}" != "x"; then
      AC_MSG_CHECKING([hdiutil info])
      HDIUTIL_INFO=`hdiutil info 2>/dev/null`
      printf "\n"
      AC_MSG_RESULT([${HDIUTIL_INFO}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_IBTOOL],
[
AC_PATH_PROG([IBTOOL],[ibtool])
  if test "x${IBTOOL}" != "x"; then
      AC_PATH_PROG([XML2],[xml2])
      AC_MSG_CHECKING([for ibtool version])
      if test "x${XML2}" != "x"; then
          IBTOOL_VERSION=`ibtool --version | xml2 | tail -n 4 | head -n 2 | tail -n 1 | cut -d\= -f2`
          AC_MSG_RESULT([${IBTOOL_VERSION}])
      else
          IBTOOL_VERSION=`ibtool --version`
          AC_MSG_RESULT([xml2 is not installed; not printing ibtool version because it is too ugly without xml2 to help format it.])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_MACBINARY],
[
AC_PATH_PROG([MACBINARY],[macbinary])
  if test "x${MACBINARY}" != "x"; then
      AC_MSG_CHECKING([for macbinary version])
      #TODO: different macbinary executables vary in whether they
      # accept the `--version` flag or not, figure out why
      MACBINARY_VERSION=`${MACBINARY} --version 2>/dev/null | head -n 1`
      if test "x${MACBINARY_VERSION}" != "x"; then
        AC_MSG_RESULT([${MACBINARY_VERSION}])
      else
        test -z "${MACBINARY_VERSION}"
        AC_MSG_RESULT([looks like your copy of macbinary failed to report its version properly.])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_MACHINE],
[
AC_PATH_PROG([MACHINE],[machine])
  if test "x${MACHINE}" != "x"; then
      AC_MSG_CHECKING([machine type])
      MACHINE_TYPE=`machine`
      AC_MSG_RESULT([${MACHINE_TYPE}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_NIBTOOL],
[
AC_PATH_PROG([NIBTOOL],[nibtool])
  if test "x${NIBTOOL}" != "x"; then
      AC_MSG_CHECKING([for nibtool version])
      #TODO: better formatting of output
      NIBTOOL_VERSION=`nibtool --version 2>/dev/null`
      if test "x${NIBTOOL_VERSION}" != "x"; then
        AC_MSG_RESULT([${NIBTOOL_VERSION}])
      else
        test -z "${NIBTOOL_VERSION}"
        AC_MSG_RESULT([looks like nibtool failed to report its version properly.])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_NMBLOOKUP],
[
AC_PATH_PROG([NMBLOOKUP],[nmblookup])
  if test "x${NMBLOOKUP}" != "x"; then
      AC_MSG_CHECKING([for nmblookup version])
      NMBLOOKUP_VERSION=`nmblookup --version`
      AC_MSG_RESULT([${NMBLOOKUP_VERSION}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_OSALANG],
[
AC_PATH_PROG([OSALANG],[osalang])
  if test "x${OSALANG}" != "x"; then
      AC_MSG_CHECKING([for available OSA languages])
      OSA_LANGUAGES=`osalang`
      printf "\n"
      AC_MSG_RESULT([${OSA_LANGUAGES}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_SHARK],
[
AC_PATH_PROG([SHARK],[shark])
  if test "x${SHARK}" != "x"; then
      AC_MSG_CHECKING([for shark version])
      SHARK_VERSION=`shark -v 2>/dev/null`
      if test "x${SHARK_VERSION}" != "x"; then
        AC_MSG_RESULT([${SHARK_VERSION}])
      else
        test -z "${SHARK_VERSION}"
        AC_MSG_RESULT([looks like shark failed to report its version properly.])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_XCMAN],
[
AC_PATH_PROG([XCMAN],[xcman])
  if test "x${XCMAN}" != "x"; then
      AC_MSG_CHECKING([for xcman version])
      #TODO: better formatting of output
      XCMAN_VERSION=`xcman --version 2>/dev/null`
      if test "x${XCMAN_VERSION}" != "x"; then
        AC_MSG_RESULT([${XCMAN_VERSION}])
      else
        test -z "${XCMAN_VERSION}"
        AC_MSG_RESULT([looks like xcman failed to report its version properly.])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_XCODEBUILD],
[
AC_PATH_PROG([XCODEBUILD],[xcodebuild])
  if test "x${XCODEBUILD}" != "x"; then
      AC_MSG_CHECKING([for Xcode version])
      XCODEBUILD_VERSION=`xcodebuild -version | head -n1`
      AC_MSG_RESULT([${XCODEBUILD_VERSION}])
  fi
])

dnl#
AC_DEFUN([EBG_PROG_XCODEBUILD_WITHSDKS],
[
AC_REQUIRE([EBG_PROG_XCODEBUILD])
  if test "x${XCODEBUILD}" != "x"; then
      AC_MSG_CHECKING([for available Xcode sdks])
      dnl# FIXME: Format output properly for long sdk names so they do not
      dnl# start including the next field over. See for example what
      dnl# happens when you have a Darwinbuild-created sdk present
      XCODE_SDKS=`xcodebuild -showsdks | grep sdk | cut -d\  -f1,2,3,4`
      if test "x${XCODE_SDKS}" != "x"; then
        printf "\n The available Xcode sdks are: \n"
        AC_MSG_RESULT([${XCODE_SDKS}])
      else
        test -z "${XCODE_SDKS}"
        AC_MSG_WARN([no sdks found])
      fi
  fi
])

dnl#
AC_DEFUN([EBG_PROG_XED],
[
AC_PATH_PROG([XED],[xed])
  if test "x${XED}" != "x"; then
      AC_MSG_CHECKING([for xed version])
      XED_VERSION=`xed --version`
      AC_MSG_RESULT([${XED_VERSION}])
  fi
])

dnl#
AC_DEFUN([EBG_DEVELOPER_DIR],
[
AC_MSG_CHECKING([--with-developer-dir argument])
AC_ARG_WITH([developer-dir],[AS_HELP_STRING([--with-developer-dir=PATH],
  [use PATH as location for Xcode developer tools])],
  [DEVELOPER_DIR="${withval}"; AC_MSG_RESULT([${DEVELOPER_DIR}])],
      [DEVELOPER_DIR=""; AC_MSG_RESULT([not present])])

AC_MSG_CHECKING([if DEVELOPER_DIR environment variable is already set])
if test "x${DEVELOPER_DIR}" = "x"; then
  AC_MSG_RESULT([no])
  AC_PATH_PROG([XCODE_SELECT],[xcode-select])
  if test "x${XCODE_SELECT}" != "x"; then
    AC_MSG_CHECKING([for xcode-select version])
    XCODE_SELECT_VERSION=`xcode-select --version`
    AC_MSG_RESULT([${XCODE_SELECT_VERSION}])
    AC_MSG_CHECKING([for developer dir using xcode-select])
    DEVELOPER_DIR=`${XCODE_SELECT} -print-path`
    AC_MSG_RESULT([${DEVELOPER_DIR}])
  else
    DEVELOPER_DIR=/Developer
    AC_MSG_RESULT([${DEVELOPER_DIR}])
  fi
else
  AC_MSG_RESULT([${DEVELOPER_DIR}])
fi
])


# The following macros beginning with MP_* are all taken from MacPorts's
# m4 macros

#------------------------------------------------------------------------
# MP_CHECK_FRAMEWORK_COREFOUNDATION --
#
#    Check if CoreFoundation framework is available, define
#    HAVE_FRAMEWORK_COREFOUNDATION if so.
#
# Arguments:
#    None.
#
# Requires:
#    None.
#
# Depends:
#    AC_LANG_PROGRAM
#
# Results:
#    Result is cached.
#
#    If CoreFoundation framework is available, defines the following
#    variables:
#        HAVE_FRAMEWORK_COREFOUNDATION
#
#------------------------------------------------------------------------
AC_DEFUN([MP_CHECK_FRAMEWORK_COREFOUNDATION],[
    AC_CHECK_HEADERS_ONCE([CoreFoundation/CoreFoundation.h])
    FRAMEWORK_LIBS="-framework CoreFoundation"

    AC_MSG_CHECKING([for CoreFoundation framework])

    AC_CACHE_VAL([mp_cv_have_framework_corefoundation],[
        ac_save_LIBS="${LIBS}"
        LIBS="${FRAMEWORK_LIBS} ${LIBS}"

        AC_LINK_IFELSE([
            AC_LANG_PROGRAM([[
#include <CoreFoundation/CoreFoundation.h>
            ]],[[
CFURLRef url = CFURLCreateWithFileSystemPath(NULL, CFSTR("/testing"), kCFURLPOSIXPathStyle, 1);
CFArrayRef bundles = CFBundleCreateBundlesFromDirectory(NULL, url, CFSTR("pkg"));
            ]])
        ],[
            mp_cv_have_framework_corefoundation="yes"
        ],[
            mp_cv_have_framework_corefoundation="no"
        ])
        LIBS="${ac_save_LIBS}"
    ])

    AC_MSG_RESULT([${mp_cv_have_framework_corefoundation}])

    if test "x${mp_cv_have_framework_corefoundation}" = "xyes"; then
        AC_DEFINE([HAVE_FRAMEWORK_COREFOUNDATION],[1],[Define to 1 if CoreFoundation framework is available])
    fi

    AC_SUBST([HAVE_FRAMEWORK_COREFOUNDATION])
])


#------------------------------------------------------------------------
# MP_CHECK_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER --
#
#    Check if if the routine CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER
#    is available in CoreFoundation.
#
# Arguments:
#    None.
#
# Requires:
#    None.
#
# Depends:
#    AC_LANG_PROGRAM
#
# Results:
#    Result is cached.
#
#    If function CFNotificationCenterGetDarwinNotifyCenter is in the
#    CoreFoundation framework, defines the following variables:
#        HAVE_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER
#
#------------------------------------------------------------------------
AC_DEFUN([MP_CHECK_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER],[
    AC_CHECK_HEADERS_ONCE([CoreFoundation/CoreFoundation.h])
    FRAMEWORK_LIBS="-framework CoreFoundation"

    AC_MSG_CHECKING([for CFNotificationCenterGetDarwinNotifyCenter])

    AC_CACHE_VAL([mp_cv_have_function_cfnotificationcentergetdarwinnotifycenter],[
        ac_save_LIBS="${LIBS}"
        LIBS="${FRAMEWORK_LIBS} ${LIBS}"

        AC_LINK_IFELSE([
            AC_LANG_PROGRAM([[
#include <CoreFoundation/CoreFoundation.h>
	    ]],[[
CFNotificationCenterRef ref = CFNotificationCenterGetDarwinNotifyCenter();
            ]])
        ],[
        mp_cv_have_function_cfnotificationcentergetdarwinnotifycenter="yes"
        ],[
        mp_cv_have_function_cfnotificationcentergetdarwinnotifycenter="no"
	])
        LIBS="${ac_save_LIBS}"
    ])

    AC_MSG_RESULT([${mp_cv_have_function_cfnotificationcentergetdarwinnotifycenter}])

    if test "x${mp_cv_have_function_cfnotificationcentergetdarwinnotifycenter}" = "xyes"; then
        AC_DEFINE([HAVE_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER],[1],[Define to 1 if function CFNotificationCenterGetDarwinNotifyCenter in CoreFoundation framework])
    fi

    AC_SUBST([HAVE_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER])
])


#------------------------------------------------------------------------
# MP_CHECK_FRAMEWORK_SYSTEMCONFIGURATION --
#
#	Check if SystemConfiguration framework is available, define
#	HAVE_FRAMEWORK_SYSTEMCONFIGURATION if so.
#
# Arguments:
#       None.
#
# Requires:
#       None.
#
# Depends:
#		AC_LANG_PROGRAM
#
# Results:
#       Result is cached.
#
#	If SystemConfiguration framework is available, defines the
#	following variables:
#		HAVE_FRAMEWORK_SYSTEMCONFIGURATION
#
#------------------------------------------------------------------------
AC_DEFUN([MP_CHECK_FRAMEWORK_SYSTEMCONFIGURATION],[
    AC_CHECK_HEADERS_ONCE([SystemConfiguration/SystemConfiguration.h])
    AC_CHECK_DECLS_ONCE([NULL])
    FRAMEWORK_LIBS="-framework SystemConfiguration"

    AC_MSG_CHECKING([for SystemConfiguration framework])

    AC_CACHE_VAL([mp_cv_have_framework_systemconfiguration],[
        ac_save_LIBS="${LIBS}"
        LIBS="${FRAMEWORK_LIBS} ${LIBS}"

        AC_LINK_IFELSE([
            AC_LANG_PROGRAM([[
#include <SystemConfiguration/SystemConfiguration.h>
            ]],[[
int err = SCError();
SCDynamicStoreRef dsRef = SCDynamicStoreCreate(NULL, NULL, NULL, NULL);
            ]])
        ],[
            mp_cv_have_framework_systemconfiguration="yes"
        ],[
            mp_cv_have_framework_systemconfiguration="no"
        ])
        LIBS="${ac_save_LIBS}"
    ])

    AC_MSG_RESULT([${mp_cv_have_framework_systemconfiguration}])

    if test "x${mp_cv_have_framework_systemconfiguration}" = "xyes"; then
        AC_DEFINE([HAVE_FRAMEWORK_SYSTEMCONFIGURATION],[1],[Define to 1 if SystemConfiguration framework is available])
    fi

    AC_SUBST([HAVE_FRAMEWORK_SYSTEMCONFIGURATION])
])


#------------------------------------------------------------------------
# MP_CHECK_FRAMEWORK_IOKIT --
#
#    Check if IOKit framework is available, define HAVE_FRAMEWORK_IOKIT
#    if so.
#
# Arguments:
#    None.
#
# Requires:
#    None.
#
# Depends:
#    AC_LANG_PROGRAM
#
# Results:
#    Result is cached.
#
#    If IOKit framework is available, defines the following variables:
#        HAVE_FRAMEWORK_IOKIT
#
#------------------------------------------------------------------------
AC_DEFUN([MP_CHECK_FRAMEWORK_IOKIT],[
    AC_CHECK_HEADERS_ONCE([IOKit/IOKitLib.h])
    AC_CHECK_DECLS_ONCE([NULL])
    FRAMEWORK_LIBS="-framework IOKit"

    AC_MSG_CHECKING([for IOKit framework])

    AC_CACHE_VAL([mp_cv_have_framework_iokit],[
        ac_save_LIBS="${LIBS}"
        LIBS="${FRAMEWORK_LIBS} ${LIBS}"

        AC_LINK_IFELSE([
            AC_LANG_PROGRAM([[
#include <IOKit/IOKitLib.h>
            ]],[[
IOCreateReceivePort(0, NULL);
IORegisterForSystemPower(0, NULL, NULL, NULL);
            ]])
        ],[
            mp_cv_have_framework_iokit="yes"
        ],[
            mp_cv_have_framework_iokit="no"
        ])
        LIBS="${ac_save_LIBS}"
    ])

    AC_MSG_RESULT([${mp_cv_have_framework_iokit}])

    if test "x${mp_cv_have_framework_iokit}" = "xyes"; then
        AC_DEFINE([HAVE_FRAMEWORK_IOKIT],[1],[Define to 1 if IOKit framework is available])
    fi

    AC_SUBST([HAVE_FRAMEWORK_IOKIT])
])

#
# Return MacOSX version using system_profile tool.
# Taken from Scilab's macros
#
AC_DEFUN([AC_GET_MACOSX_VERSION],[
    if test "x${DEFAULTS}" = "x"; then
        AC_PATH_PROG([DEFAULTS],[defaults])
    fi
    AC_PATH_PROG([SW_VERS],[sw_vers])
    AC_PATH_PROG([UNAME],[uname])
    AC_MSG_CHECKING([how to determine Mac OS X Version])
    if test -e ${HOME}/Library/Preferences/com.apple.loginwindow.plist -a "x${DEFAULTS}" != "x"; then
        AC_MSG_RESULT([using "defaults"])
    	[macosx_version="`defaults read loginwindow SystemVersionStampAsString`"]
    elif test "x${SW_VERS}" != "x"; then
        AC_MSG_RESULT([using "sw_vers"])
        [macosx_version="`sw_vers -productVersion`"]
    elif test "x${UNAME}" != "x"; then
        AC_MSG_RESULT([using "uname"])
        [darwin_version="`uname -r | cut -d. -f1`"]
        [macosx_version=10.$((${darwin_version} - 4))]
    else
        AC_MSG_ERROR([none of the standard ways of determining the Mac OS X Version are available])
    fi
    AC_MSG_CHECKING([Mac OS X Version])
    case ${macosx_version} in
         11*)
              AC_MSG_RESULT([macOS 11 - Big Sur.])
         ;;
         ## (TODO: fill in the rest of the version numbers in between)
         10.9*)
              AC_MSG_RESULT([Mac OS X 10.9 - Mavericks.])
         ;;
         10.8*)
              AC_MSG_RESULT([Mac OS X 10.8 - Mountain Lion.])
         ;;
         10.7*)
              AC_MSG_RESULT([Mac OS X 10.7 - Lion.])
         ;;
         10.6*)
              AC_MSG_RESULT([Mac OS X 10.6 - Snow Leopard.])
         ;;
         *10.5*)
              AC_MSG_RESULT([Mac OS X 10.5 - Leopard.])
         ;;
         *10.4*)
              AC_MSG_RESULT([Mac OS X 10.4 - Tiger.])
         ;;
         *)
              AC_MSG_WARN([While it might be better to build this on an older version of OS X, such as your ${macosx_version}, as fewer things are deprecated there, it is still harder to find computers running older versions of OS X these days, so it might be harder to support...])
         ;;
	 esac
])

dnl#
dnl# Now that we have all the sub-macros out of the way, it is time for
dnl# the main one
dnl#
AC_DEFUN([EBG_MACOSX_OPTIONS],
[
AC_MSG_CHECKING([for Darwin (Mac OS X)])
if test "`(uname) 2>/dev/null`" = Darwin; then
  AC_MSG_RESULT([yes])

  AC_MSG_CHECKING([--disable-darwin argument])
  AC_ARG_ENABLE([darwin],
	  [AS_HELP_STRING([--disable-darwin],
          [Disable Darwin (Mac OS X) support.])],
	  [],[enable_darwin="yes"])
  if test "$enable_darwin" = "yes"; then
    AC_MSG_RESULT([no])
  else
    AC_MSG_RESULT([yes, Darwin support excluded])
  fi

  AC_MSG_CHECKING([--with-mac-arch argument])
  AC_ARG_WITH([mac-arch],[AS_HELP_STRING([--with-mac-arch=ARCH],
        [current, intel, ppc or both])],
	[MACARCH="${withval}"; AC_MSG_RESULT([${MACARCH}])],
	[MACARCH="current"; AC_MSG_RESULT([defaulting to ${MACARCH}])])

  AC_REQUIRE([EBG_DEVELOPER_DIR])

  AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])

  AC_REQUIRE([AC_PROG_CPP])
  AC_REQUIRE([AC_PROG_CXX])
  AC_REQUIRE([AC_PROG_OBJC])
  AC_REQUIRE([AC_PROG_OBJCPP])
  AC_REQUIRE([AC_PROG_OBJCXX])
  AC_REQUIRE([AC_PROG_OBJCXXCPP])
  
  AC_PATH_PROG([AGVTOOL],[agvtool])
  AC_PATH_PROG([APPLEPING],[appleping])
  AC_REQUIRE([EBG_PROG_APPLESINGLE])
  AC_PATH_PROG([AUTOMATOR],[automator])
  AC_PATH_PROG([AUVAL],[auval])
  AC_PATH_PROG([AUVALTOOL],[auvaltool])
  AC_PATH_PROG([BUILD_STRINGS],[BuildStrings])
  AC_PATH_PROG([CF_INFO_PLIST_CONVERTER],[CFInfoPlistConverter])
  AC_REQUIRE([EBG_PROG_CLANG])
  AC_PATH_PROG([CMPDYLIB],[cmpdylib])
  AC_PATH_PROG([CODESIGN],[codesign])
  AC_PATH_PROG([CODESIGN_ALLOCATE],[codesign_allocate])
  AC_PATH_PROG([CODESIGN_WRAPPER],[codesign_wrapper])
  AC_PATH_PROG([CPMAC],[CpMac])
  if test "x${DEFAULTS}" = "x"; then
      AC_PATH_PROG([DEFAULTS],[defaults])
  fi
  AC_PATH_PROG([DEREZ],[DeRez])
  AC_PATH_PROG([DEV_TOOLS_SECURITY],[DevToolsSecurity])
  AC_PATH_PROG([DISTCC],[distcc])
  AC_PATH_PROG([DISTCCD],[distccd])
  AC_PATH_PROG([DISTCCMON_TEXT],[distccmon-text])
  AC_REQUIRE([EBG_PROG_DNSSD])
  AC_PATH_PROG([DOCSETUTIL],[docsetutil])
  AC_PATH_PROG([DSCACHEUTIL],[dscacheutil])
  AC_PATH_PROG([DSCL],[dscl])
  AC_PATH_PROG([DSERR],[dserr])
  AC_PATH_PROG([DSEXPORT],[dsexport])
  AC_PATH_PROG([DSIMPORT],[dsimport])
  AC_PATH_PROG([DSMEMBERUTIL],[dsmemberutil])
  AC_PATH_PROG([DSPERFMONITOR],[dsperfmonitor])
  AC_PATH_PROG([DTRUSS],[dtruss])
  AC_PATH_PROG([GATHERHEADERDOC],[gatherheaderdoc])
  AC_PATH_PROG([GEN_BRIDGE_METADATA],[gen_bridge_metadata])
  AC_PATH_PROG([GET_FILE_INFO],[GetFileInfo])
  AC_PATH_PROG([HDXML2MANXML],[hdxml2manxml])
  AC_REQUIRE([EBG_PROG_HDIUTIL])
  AC_PATH_PROG([HIUTIL],[hiutil])
  AC_PATH_PROG([HEADERDOC2HTML],[headerdoc2html])
  AC_PATH_PROG([HWPREFS],[hwprefs])
  AC_REQUIRE([EBG_PROG_IBTOOL])
  AC_PATH_PROG([IMAGE_UNIT_ANALYZER],[ImageUnitAnalyzer])
  AC_PATH_PROG([INSTRUMENTS],[instruments])
  AC_PATH_PROG([IPHONEOS_OPTIMIZE],[iphoneos-optimize])
  AC_PATH_PROG([LD_CLASSIC],[ld_classic])
  AC_PATH_PROG([LD64],[ld64])
  AC_PATH_PROG([LEAKS],[leaks])
  AC_PATH_PROG([LSDISTCC],[lsdistcc])
  AC_PATH_PROG([LSMAC],[lsmac])
  AC_REQUIRE([EBG_PROG_MACBINARY])
  AC_PATH_PROG([MDCHECKSCHEMA],[mdcheckschema])
  AC_PATH_PROG([MERGE_PEF],[MergePef])
  AC_PATH_PROG([MIG],[mig])
  AC_PATH_PROG([MKSDK],[mksdk])
  AC_PATH_PROG([MOMC],[momc])
  AC_PATH_PROG([MVMAC],[MvMac])
  AC_REQUIRE([EBG_PROG_NIBTOOL])
  AC_PATH_PROG([NIUTIL],[niutil])
  AC_REQUIRE([EBG_PROG_NMBLOOKUP])
  AC_PATH_PROG([OPEN],[open])
  AC_PATH_PROG([OSACOMPILE],[osacompile])
  AC_PATH_PROG([OSADECOMPILE],[osadecompile])
  AC_REQUIRE([EBG_PROG_OSALANG])
  AC_PATH_PROG([OSASCRIPT],[osascript])
  AC_PATH_PROG([PACKAGE_APPLICATION],[PackageApplication])
  AC_PATH_PROG([PACKAGEMAKER],[packagemaker])
  AC_PATH_PROG([PBCOPY],[pbcopy])
  AC_PATH_PROG([PBPASTE],[pbpaste])
  AC_PATH_PROG([PBHELPINDEXER],[pbhelpindexer])
  AC_PATH_PROG([PBPROJECTDUMP],[pbprojectdump])
  AC_PATH_PROG([PBUTIL],[pbutil])
  AC_PATH_PROG([PBXCP],[pbxcp])
  AC_PATH_PROG([PBXHMAPDUMP],[pbxhmapdump])
  AC_PATH_PROG([PKGBUILD],[pkgbuild])
  AC_PATH_PROG([PLUTIL],[plutil])
  AC_PATH_PROG([PPCEXPLAIN],[PPCExplain])
  AC_PATH_PROG([PROJECT_INFO],[projectInfo])
  AC_PATH_PROG([PUMP],[pump])
  AC_PATH_PROG([PURGE],[purge])
  AC_PATH_PROG([PWPOLICY],[pwpolicy])
  AC_PATH_PROG([QLMANAGE],[qlmanage])
  AC_PATH_PROG([QUARTZ_WM],[quartz-wm])
  AC_PATH_PROG([REDO_PREBINDING],[redo_prebinding])
  AC_PATH_PROG([RESMERGER],[ResMerger])
  AC_PATH_PROG([REZ],[Rez])
  AC_PATH_PROG([REZDET],[RezDet])
  AC_PATH_PROG([REZWACK],[RezWack])
  AC_PATH_PROG([RSA_SECURID_GETPASSWD],[RSA_SecurID_getpasswd])
  AC_PATH_PROG([RUN_PLATFORM_UNIT_TESTS],[RunPlatformUnitTests])
  AC_PATH_PROG([RUN_TARGET_UNIT_TESTS],[RunTargetUnitTests])
  AC_PATH_PROG([RUN_UNIT_TESTS],[RunUnitTests])
  AC_PATH_PROG([SAMPLE],[sample])
  AC_PATH_PROG([SANDBOX_EXEC],[sandbox-exec])
  AC_PATH_PROG([SANDBOX_SIMPLIFY],[sandbox-simplify])
  AC_PATH_PROG([SAY],[say])
  AC_PATH_PROG([SDEF],[sdef])
  AC_PATH_PROG([SDP],[sdp])
  AC_PATH_PROG([SECURITY],[Security])
  AC_PATH_PROG([SET_FILE],[SetFile])
  AC_REQUIRE([EBG_PROG_SHARK])
  AC_PATH_PROG([SPLIT_FORKS],[SplitForks])
  AC_PATH_PROG([TEXTURETOOL],[texturetool])
  AC_PATH_PROG([UNREZWACK],[UnRezWack])
  AC_PATH_PROG([UPDATE_DYLD_SHARED_CACHE],[update_dyld_shared_cache])
  AC_PATH_PROG([USERS],[users])
  AC_PATH_PROG([VERS_STRING],[vers_string])
  AC_PATH_PROG([WSMAKE_STUBS],[WSMakeStubs])
  AC_PATH_PROG([XATTR],[xattr])
  AC_REQUIRE([EBG_PROG_XCMAN])
  AC_PATH_PROG([XCODE_DISTCC_RULE_INSTALLER],[Xcode_distcc_rule_installer])
  AC_REQUIRE([EBG_PROG_XCODEBUILD])
  AC_PATH_PROG([XCODEINDEX],[xcodeindex])
  AC_PATH_PROG([XCRUN],[xcrun])
  AC_REQUIRE([EBG_PROG_XED])
  AC_PATH_PROG([XGRID],[xgrid])

  AC_REQUIRE([AC_C_BIGENDIAN])
  AC_REQUIRE([AC_SYS_LARGEFILE])

  if test "x${MACARCH}" = "xboth"; then
    AC_MSG_CHECKING([specifically for 10.4 universal SDK])
    dnl# There is a terrible inconsistency (but we appear to get away
    dnl# with it): ${CFLAGS} uses the 10.4u SDK library for the headers,
    dnl# while ${CPPFLAGS} does not, because "gcc -E" does not grok it.
    dnl# That means that the configure tests using the preprocessor
    dnl# are actually done with the wrong header files. ${LDFLAGS} is set
    dnl# at the end, because configure uses it together with ${CFLAGS} and
    dnl# we can only have one -sysroot argument.
    save_cppflags="${CPPFLAGS}"
    save_cflags="${CFLAGS}"
    save_ldflags="${LDFLAGS}"
    CFLAGS="${CFLAGS} -isysroot ${DEVELOPER_DIR}/SDKs/MacOSX10.4u.sdk -arch i386 -arch ppc"
    AC_LINK_IFELSE([AC_LANG_SOURCE[[]],[[]])],
	[AC_MSG_RESULT([found, will make universal binary])],

	[AC_MSG_RESULT([not found])
	CFLAGS="${save_cflags}"
	AC_MSG_CHECKING([if Intel architecture is supported])
	CPPFLAGS="${CPPFLAGS} -arch i386"
	LDFLAGS="${save_ldflags} -arch i386"
	AC_LINK_IFELSE([AC_LANG_SOURCE[[]],[[]])],
	    [AC_MSG_RESULT([yes]); MACARCH="intel"],
	    [AC_MSG_RESULT([no, using PowerPC])
		MACARCH="ppc"
		CPPFLAGS="${save_cppflags} -arch ppc"
		LDFLAGS="${save_ldflags} -arch ppc"])])
  elif test "x${MACARCH}" = "xintel"; then
    CPPFLAGS="${CPPFLAGS} -arch intel"
    LDFLAGS="${LDFLAGS} -arch intel"
  elif test "x${MACARCH}" = "xppc"; then
    CPPFLAGS="${CPPFLAGS} -arch ppc"
    LDFLAGS="${LDFLAGS} -arch ppc"
  fi

  if test "x${enable_darwin}" = "xyes"; then
    MACOSX=yes
    dnl# TODO: use -arch i386 on Intel machines
    dnl# See http://www.mistydemeo.com/?p=78 for documentation on
    dnl# '-no-cpp-precomp'...
    dnl# (the actual version check should be for versions of gcc earlier
    dnl# than 2.95, but earlier than 3 seemed close enough)
    AC_CACHE_CHECK([whether to use the -no-cpp-precomp compiler flag],
                   [ebg_cv_no_cpp_precomp],
                   [AC_EGREP_CPP([use_no_cpp_precomp],[
#ifdef __APPLE__
# if defined(__GNUC__) && (__GNUC__ < 3)
use_no_cpp_precomp
# endif /* GCC 2 */
#endif /* __APPLE__ */
                                 ],[ebg_cv_no_cpp_precomp=yes],
                                 [ebg_cv_no_cpp_precomp=no])
                   if test "x${ebg_cv_no_cpp_precomp}" = "xyes"; then
                     CPPFLAGS="${CPPFLAGS} -DMACOS_X_UNIX -no-cpp-precomp"
                   else
                     CPPFLAGS="${CPPFLAGS} -DMACOS_X_UNIX"
                   fi
                   ])
    AC_CHECK_HEADER([Carbon/Carbon.h],[CARBON=yes])
    AC_CHECK_HEADER([Cocoa/Cocoa.h],[COCOA=yes])
  fi

  AC_REQUIRE([MP_CHECK_FRAMEWORK_COREFOUNDATION])
  AC_REQUIRE([MP_CHECK_FUNCTION_CFNOTIFICATIONCENTERGETDARWINNOTIFYCENTER])
  AC_REQUIRE([MP_CHECK_FRAMEWORK_SYSTEMCONFIGURATION])
  AC_REQUIRE([MP_CHECK_FRAMEWORK_IOKIT])
  AC_REQUIRE([AC_GET_MACOSX_VERSION])

  dnl# Avoid a bug with -O2 with gcc 4.0.1. Symptom: malloc() reports
  dnl# double free. This happens in expand_filename(), because the
  dnl# optimizer swaps two blocks of code, both using "repl", that
  dnl# cannot be swapped.
  if test "${MACARCH}" = "intel" -o "${MACARCH}" = "both"; then
    CFLAGS=`echo "${CFLAGS}" | sed 's/-O[[23456789]]/-Oz/'`
  fi

else
  AC_MSG_RESULT([no])
fi
])

