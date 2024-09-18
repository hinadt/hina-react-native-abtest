
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<React/RCTRootView.h>)
#import <React/RCTRootView.h>
#else
#import "RCTRootView.h"
#endif

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif




@interface RNHinaReactNativeAbtest : NSObject <RCTBridgeModule>

@end
  
