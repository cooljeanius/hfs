/*
 *  hfs_util.h
 *  hfs
 *
 *  Created by Eric Gallager on 8/18/13.
 */

#ifndef _HFS_UTIL_H
#define _HFS_UTIL_H

// includes
#include <stdio.h>

// missing prototypes
int hide_file(const char * file);
off_t get_start_block(const char *file, uint32_t fs_block_size);
off_t get_embedded_offset(char *devname);
int DoMakeJournaled(char *volname, int jsize);
int DoUnJournal(char *volname);
int get_journal_info(char *devname, struct JournalInfoBlock *jib);
int DoGetJournalInfo(char *volname);
int RawDisableJournaling(char *devname);
int SetJournalInFSState(const char *devname, int journal_in_fs);
// seriously clang? You are going to complain about a missing prototype
// for "main"? gcc does not bother with it...
int main (int argc, const char *argv[]);

#endif /* _HFS_UTIL_H */

/* EOF \n */
