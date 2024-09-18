#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag on this file.
#endif

#if __has_include(<HinaABTest/HinaABTest.h>)
#import <HinaABTest/HinaABTest.h>
#else
#import "HinaABTest.h"
#endif



#import "RNHinaReactNativeAbtest.h"

@implementation RNHinaReactNativeAbtest

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(RNHinaReactNativeAbtest)

//
//- (dispatch_queue_t)methodQueue
//{
//    return dispatch_get_main_queue();
//}
//RCT_EXPORT_MODULE()


//RCT_EXPORT_METHOD(trackAppInstall:(NSDictionary *)property) {
//    @try {
//        [[HinaCloudSDK sharedInstance] trackInstallation:@"H_AppInstall" withProperties:property];
//    } @catch (NSException *exception) {
//        NSLog(@"[RNHinaCloud] error:%@",exception);
//    }
//}

RCT_EXPORT_METHOD(init:(NSString *)url){
    NSLog(@"[RNHinaABTest] init==\n url=%@",url);
    @try {
        HinaABTestConfigOptions *abtestConfigOptions = [[HinaABTestConfigOptions alloc] initWithURL:url];
        [HinaABTest startWithConfigOptions:abtestConfigOptions];
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}


RCT_EXPORT_METHOD(fetchCacheABTest:(NSDictionary *)params resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    NSLog(@"[RNHinaABTest] fetchCacheABTest==\n params=%@",params);
    @try {
        NSString *paramName = params[@"paramName"];
        id defaultValue = params[@"defaultValue"];
        id result = [[HinaABTest sharedInstance] fetchCacheABTestWithParamName:paramName defaultValue:defaultValue];
        resolve(result);
    } @catch (NSException *exception) {
        NSLog(@"[RNHinaABTest] error:%@",exception);
    }
}

RCT_EXPORT_METHOD(asyncFetchABTest:(NSDictionary *)params resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    NSLog(@"[RNHinaABTest] asyncFetchABTest==\n params=%@",params);
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

RCT_EXPORT_METHOD(fastFetchABTest:(NSDictionary *)params resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    NSLog(@"[RNHinaABTest] fastFetchABTest==\n params=%@",params);
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

