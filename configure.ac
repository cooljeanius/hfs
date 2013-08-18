dnl#                                               -*- Autoconf -*-
dnl# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([hfs],[195.1.1],[/dev/null])
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([foreign dist-bzip2 dist-zip tar-pax -Wall])
AM_MAINTAINER_MODE
AC_GET_MACOSX_VERSION

# Checks for programs.
AC_PROG_CC
AC_PROG_CC_C99
AC_PROG_OBJC
AC_PROG_OBJCPP
AC_PROG_OBJCXX
AC_PROG_OBJCXXCPP
AC_PROG_MKDIR_P
EBG_DEVELOPER_DIR
EBG_PROG_XCODEBUILD

# Checks for libraries.
AC_CHECK_LIB([sigsegv],[sigsegv_dispatch])
AC_CHECK_LIB([z],[gzwrite])
gt_INTL_MACOSX
MP_CHECK_FRAMEWORK_COREFOUNDATION
MP_CHECK_FRAMEWORK_IOKIT

# Checks for header files.
AC_CHECK_HEADERS([architecture/byte_order.h CommonCrypto/CommonDigest.h \
CoreFoundation/CoreFoundation.h CoreFoundation/CFBundle.h \
CoreFoundation/CFString.h CoreFoundation/CFURL.h ctype.h \
err.h errno.h fcntl.h getopt.h hfs/hfs_format.h hfs/hfs_mount.h \
libgen.h libkern/OSByteOrder.h mach/thread_status.h machine/endian.h \
pwd.h removefile.h signal.h sigsegv.h stdio.h System/hfs/hfs_fsctl.h \
System/sys/fsctl.h System/uuid/uuid.h System/uuid/namespace.h \
sys/attr.h sys/cdefs.h sys/disk.h sys/fcntl.h sys/ioctl.h \
sys/loadable_fs.h sys/mount.h sys/param.h sys/resource.h \
sys/sysctl.h sys/time.h sys/ucred.h sys/vmmeter.h sys/wait.h \
syslog.h zlib.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_C_BIGENDIAN
AC_C_CONST
AC_C_INLINE
AC_C_PROTOTYPES
AC_C_RESTRICT
AC_TYPE_INT8_T
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_INTMAX_T
AC_TYPE_OFF_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_CHECK_MEMBERS([struct stat.st_blksize])
AC_TYPE_UINT8_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T
AC_TYPE_UINTMAX_T
AC_CHECK_TYPES([caddr_t])
AC_CHECK_TYPES([sigsegv_handler_t])
AC_CHECK_TYPES([unsigned long])
AC_CHECK_DECLS([devname])
AC_CHECK_DECLS([index])
AC_CHECK_DECLS([st])
AC_SYS_XSI_STACK_OVERFLOW_HEURISTIC

# Checks for library functions.
AC_FUNC_FORK
AC_FUNC_LSTAT_FOLLOWS_SLASHED_SYMLINK
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([fprintf fstat ftruncate getenv getmntinfo getopt ioctl \
memmove memset mkdir printf sigsegv_init snprintf stat strcmp strdup \
strerror strlen strstr strtol strtoul strtoull syslog])

AC_CONFIG_FILES([Makefile
                 hfs_japanese/Makefile
                 hfs_japanese/hfs_japanese.kmodproj/Makefile])
AC_OUTPUT
