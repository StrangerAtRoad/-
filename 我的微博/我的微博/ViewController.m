//
//  ViewController.m
//  我的微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "WeiboSDK.h"
@interface ViewController ()
- (IBAction)ssoAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor orangeColor];
}


- (IBAction)ssoAction:(id)sender {
    
    WBAuthorizeRequest *request=[WBAuthorizeRequest request];
    
    request.redirectURI=kRedirectURI;
    request.scope=@"all";
    request.userInfo=@{@"SSO_From":@"ViewController"};
    
    [WeiboSDK sendRequest:request];
}
@end
