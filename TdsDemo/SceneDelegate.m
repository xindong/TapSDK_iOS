//
//  SceneDelegate.m
//  TdsDemo
//
//  Created by 曹箭波 on 2020/12/21.
//

#import "SceneDelegate.h"
#import <TapSDK/TapSDK.h>

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
}


- (void)sceneDidDisconnect:(UIScene *)scene {
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
}


- (void)sceneWillResignActive:(UIScene *)scene {
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    [TapLoginHelper handleTapTapOpenURL:URLContexts.allObjects.firstObject.URL];
}


@end
