//
//  BaseNavigationViewController.m
//  我的微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "UICommns.h"
#import "ThemeManager.h"
@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    UIImage *bgImage=   [[ThemeManager sharedManager]getThemeImageWithString:@"bg_home.jpg"];
    //自定义图片的大小
    CGImageRef bgImg=CGImageCreateWithImageInRect(bgImage.CGImage, CGRectMake(0, 0, kScreenWidth, kScreenHeight));
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithCGImage:bgImg]];
    
    UIImage *navibarImage= [[ThemeManager sharedManager]getThemeImageWithString:@"mask_navbar"];
    //自定义图片的大小
    CGImageRef naviBarImg=CGImageCreateWithImageInRect(navibarImage.CGImage, CGRectMake(0, 0, kScreenWidth, 64));
    //设置导航栏的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithPatternImage:[UIImage imageWithCGImage:naviBarImg]]];
    //设置导航栏中字体的大小和颜色
    [self.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    CGImageRelease(bgImg);
   
    CGImageRelease(naviBarImg);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
