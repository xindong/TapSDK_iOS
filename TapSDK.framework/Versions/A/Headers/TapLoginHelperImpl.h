//
//  TapLoginHelperImpl.h
//  Pods-TDSLoginSource_Example
//
//  Created by Bottle K on 2020/12/15.
//

#import <Foundation/Foundation.h>
#import "TTSDKConfig.h"
#import "TTSDKAccessToken.h"
#import "TTSDKProfile.h"
#import "TTSDKLoginResult.h"
#import "TapLoginResultDelegate.h"
#import "AccountGlobalError.h"
NS_ASSUME_NONNULL_BEGIN

@interface TapLoginHelperImpl : NSObject

+ (void)initWithClientID:(NSString *)clientID;

+ (void)initWithClientID:(NSString *)clientID config:(TTSDKConfig *_Nullable)config;

+ (void)changeTapLoginConfig:(TTSDKConfig *_Nullable)config;

+ (void)registerLoginResultDelegate:(id <TapLoginResultDelegate>)delegate;

+ (void)unregisterLoginResultDelegate;

+ (id <TapLoginResultDelegate>)getLoginResultDelegate;

+ (void)startTapLogin:(NSArray *)permissions;

+ (TTSDKAccessToken *)currentAccessToken;

+ (TTSDKProfile *)currentProfile;

+ (void)fetchProfileForCurrentAccessToken:(void (^)(TTSDKProfile *profile, NSError *error))callback;

+ (void)logout;

+ (BOOL)isTapTapClientSupport;

+ (BOOL)isTapTapGlobalClientSupport;

+ (BOOL)handleTapTapOpenURL:(NSURL *)url;

+ (void)addLoginResultDelegateByTag:(NSString *)tag delegate:(id <TapLoginResultDelegate>)delegate;

+ (id <TapLoginResultDelegate>)getLoginResultDelegateByTag:(NSString *)tag;

+ (void)removeLoginResultDelegateByTag:(NSString *)tag;
@end

NS_ASSUME_NONNULL_END
