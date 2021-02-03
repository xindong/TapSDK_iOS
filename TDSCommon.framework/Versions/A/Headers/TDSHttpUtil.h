//
//  TTAchievementUtil.h
//  TapAchievement
//
//  Created by TapTap-David on 2020/9/15.
//  Copyright © 2020 taptap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Tools.h"

NS_ASSUME_NONNULL_BEGIN

@interface TDSHttpUtil : NSObject
+ (NSString *)URLEncodeString:(NSString *)str;

+ (NSString *)URLDecodeString:(NSString *)str;

+ (NSString *)urlEncode:(NSString *)str;

+ (NSString *)SHA256:(NSString *)key;

+ (NSString *)md5String:(NSString *)str;

+ (NSString *)getCurrentTime;

+ (NSString *)randomString:(int)length;

+ (NSString *)getMacToken:(NSString *)url
     method:(NSString *)method
    oauthID:(NSString *)oauthID
oauthMacKey:(NSString *)oauthMacKey;

+ (NSString *)getDeviceId;

@end

NS_ASSUME_NONNULL_END
