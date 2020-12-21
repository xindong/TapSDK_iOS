//
//  IscLoginDeleagteHelper.h
//  TapTapLoginSource
//
//  Created by Bottle K on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import <TDSCommonSource/TDSRouter.h>
NS_ASSUME_NONNULL_BEGIN

@interface IscLoginDeleagteHelper : NSObject
- (instancetype)initWithTag:(NSString *)tag blk:(TDSRouterResponse)blk;
@end

NS_ASSUME_NONNULL_END
