//
//  BaseNavigationViewController.m
//  我的微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航栏的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_home.jpg"]]];
    //设置导航栏中字体的大小和颜色
    [self.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
