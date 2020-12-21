//
//  AccountGlobalError.h
//  TapTapLoginSource
//
//  Created by Bottle K on 2020/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountGlobalError : NSObject
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) NSString *errorDescription;

- (instancetype)initWithNSError:(NSError *)error;
- (NSString *)toJsonString;
@end

NS_ASSUME_NONNULL_END
