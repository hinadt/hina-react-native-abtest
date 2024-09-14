#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag on this file.
#endif

//#if __has_include(<HinaCloudSDK/HinaCloudSDK.h>)
//#import <HinaCloudSDK/HinaCloudSDK.h>
//#else
//#import "HinaCloudSDK.h"
//#endif
//

#if __has_include(<HinaCloudSDK/HinaCloudSDK.h>)
#import <HinaABTest/HinaABTest.h>
#else
#import "HinaABTest.h"
#endif



#import "RNHinaReactNativeAbtest.h"

@implementation RNHinaReactNativeAbtest

RCT_EXPORT_MODULE(RNHinaReactNativeAbtest)

//
//- (dispatch_queue_t)methodQueue
//{
//    return dispatch_get_main_queue();
//}
//RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(init:(NSString *)url){
    @try {
        HinaABTestConfigOptions *abtestConfigOptions = [[HinaABTestConfigOptions alloc] initWithURL:url];
        [HinaABTest startWithConfigOptions:abtestConfigOptions];
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}

RCT_EXPORT_METHOD(fetchCacheABTest:(NSDictionary *)params (RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *paramName = params[@"paramName"];
        id defaultValue = params[@"defaultValue"];
        id result = [[HinaABTest sharedInstance] fetchCacheABTestWithParamName:paramName defaultValue:defaultValue];
        resolve(result);
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}

RCT_EXPORT_METHOD(asyncFetchABTest:(NSDictionary *)params (RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *paramName = params[@"paramName"];
        id defaultValue = params[@"defaultValue"];
        [[HinaABTest sharedInstance] asyncFetchABTestWithParamName:paramName defaultValue:defaultValue completionHandler:^(id  _Nullable result) {
            resolve(result);
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}

RCT_EXPORT_METHOD(fastFetchABTest:(NSDictionary *)params (RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    @try {
        NSString *paramName = params[@"paramName"];
        id defaultValue = params[@"defaultValue"];
        [[HinaABTest sharedInstance] fastFetchABTestWithParamName:paramName defaultValue:defaultValue completionHandler:^(id  _Nullable result) {
            resolve(result);
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}


@end

