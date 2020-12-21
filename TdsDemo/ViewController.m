//
//  ViewController.m
//  TdsDemo
//
//  Created by 曹箭波 on 2020/12/21.
//

#import "ViewController.h"
#import <TapSDK/TapSDK.h>
#import <TapSDK/TapLoginHelper.h>

@interface ViewController ()<TapLoginResultDelegate>
- (void) initTapSDK;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(taptapLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    [self initTapSDK];
}

- (void) initTapSDK {
    
    TDSConfig *config = TDSConfig.new;
    config.clientId = @"FwFdCIr6u71WQDQwQN";
    
    [TDSInitializer initWithConfig:config];
    
    // 开启 TapDB
    [TDSInitializer enableTapDBWithChannel:@"default" gameVersion:@"1.0.0"];
        
    // 开启 动态
    [TDSInitializer enableMoment];
    
}

- (void) taptapLogin:(UIButton *) button {
    [TapLoginHelper registerLoginResultDelegate:self];
    [TapLoginHelper startTapLogin:@[@"public_profile"]]
}


- (void)onLoginSuccess:(TTSDKAccessToken *)token {
    
}

- (void)onLoginCancel {
    
}

- (void)onLoginError:(AccountGlobalError *)error{
    
}




@end
