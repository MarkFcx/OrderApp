#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DocumentFileSavePlugin.h"

FOUNDATION_EXPORT double document_file_save_plusVersionNumber;
FOUNDATION_EXPORT const unsigned char document_file_save_plusVersionString[];

