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

#import "POPPopupBridge.h"
#import "POPWeakScriptMessageDelegate.h"

FOUNDATION_EXPORT double PopupBridgeVersionNumber;
FOUNDATION_EXPORT const unsigned char PopupBridgeVersionString[];

