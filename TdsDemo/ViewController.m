//
//  ViewController.m
//  TdsDemo
//
//  Created by 曹箭波 on 2020/12/21.
//

#import "ViewController.h"
#import <TapSDK/TapSDK.h>
#import <TapSDK/TapDB.h>
#import <TapSDK/TapLoginHelper.h>
#import <TapSDK/TDSMoment.h>

@interface ViewController ()<TapLoginResultDelegate, TDSMomentDelegate>
- (void) initTapSDK;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(taptapLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    logoutButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [logoutButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(taptapLogout:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
    
    
    
    UIButton *momentButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    momentButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [momentButton setTitle:@"Moment" forState:UIControlStateNormal];
    [momentButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [momentButton addTarget:self action:@selector(taptapMoment:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:momentButton];
    
    
    UIButton *momentRedPoint = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 300, 50)];
    momentRedPoint.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [momentRedPoint setTitle:@"动态小红点请求" forState:UIControlStateNormal];
    [momentRedPoint setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [momentRedPoint addTarget:self action:@selector(taptapMomentRedPoint:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:momentRedPoint];
    
    
    
    [self initTapSDK];
}

- (void) initTapSDK {
    
    TDSConfig *config = TDSConfig.new;
    config.clientId = @"FwFdCIr6u71WQDQwQN";
    
    [TDSInitializer initWithConfig:config];
    
    // 开启 TapDB
    [TDSInitializer enableTapDBWithChannel:@"default" gameVersion:@"1.0.0"];
    NSLog(@"current profile %@", [TTSDKProfile currentProfile].toJsonString);
    if ([TTSDKProfile currentProfile ] != nil) {
        NSLog(@"current has user %@", [TTSDKProfile currentProfile].openid);
        [TapDB setUser:[TTSDKProfile currentProfile].openid loginType:TapDBLoginTypeTapTap];
    }
        
    // 开启 动态
    [TDSInitializer enableMoment];
    [TDSMomentSdk setDelegate:self];
    
}



#pragma mark - 登录相关

/**
 登录
 */
- (void) taptapLogin:(UIButton *) button {
    [TapLoginHelper registerLoginResultDelegate:self];
    [TapLoginHelper startTapLogin:@[@"public_profile"]];
}


/**
 登出
 */
- (void) taptapLogout:(UIButton *) button {
    [TapLoginHelper logout];
}


- (void)onLoginSuccess:(TTSDKAccessToken *)token {
    NSLog(@"Login success %@", [token toJsonString]);
    
    // set user
    [TapDB setUser:[TTSDKProfile currentProfile].openid loginType:TapDBLoginTypeTapTap];
}

- (void)onLoginCancel {
    NSLog(@"Login cancel");
    
}

- (void)onLoginError:(AccountGlobalError *)error{
    NSLog(@"Login error %@", [error toJsonString]);
}

#pragma mark -
#pragma mark - 动态相关
/**
 打开动态
 */
- (void) taptapMoment:(UIButton *) button {
    TDSMomentConfig *momentConfig = [[TDSMomentConfig alloc] init];
    momentConfig.orientation = TDSMomentOrientationDefault;
    [TDSMomentSdk openTapMomentWithConfig:momentConfig];
}


- (void) taptapMomentRedPoint:(UIButton*) button {
    NSLog(@"小红点请求");
    [TDSMomentSdk fetchNewMessage];
}


- (void)didChangeResultCode:(NSInteger)code msg:(NSString *)msg {
    NSLog(@"didChangeResultCode %@ ,%d", msg, code);
}

#pragma mark -

@end
