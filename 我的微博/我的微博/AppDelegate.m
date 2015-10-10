//
//  AppDelegate.m
//  我的微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "AppDelegate.h"
#import "WeiboSDK.h"
@interface AppDelegate ()<WeiboSDKDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [WeiboSDK handleOpenURL:url delegate:self];
}
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    return [WeiboSDK handleOpenURL:url delegate:self];
}
#pragma mark - WeiboSDK Delegate
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    
    NSLog(@"Request : %@",request);
    
}
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    
    
    
}
@end
