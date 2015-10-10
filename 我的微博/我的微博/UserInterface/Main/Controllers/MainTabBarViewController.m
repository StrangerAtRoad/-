//
//  MainTabBarViewController.m
//  我的微博
//
//  Created by imac on 15/10/9.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "UICommns.h"
@interface MainTabBarViewController ()
{
    UIImageView *_bgTabBarView;
    UIImageView *_selectedView;
}
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建子视图控制器
    [self _creatSubViewControllers];
}
-(void)viewWillLayoutSubviews{
  
    //创建标签子视图
    [self _creatTabBarSubviews];
}
#pragma mark - 创建子视图控制器
-(void)_creatSubViewControllers{
    
    //存放故事板文件名的数组
    NSArray *stroybordNames=@[@"Home",
                          @"Message",
                          @"Square",
                          @"Profile",
                          @"More"];
    //存放子视图控制器的数组
    NSMutableArray *viewControllers=[NSMutableArray arrayWithCapacity:stroybordNames.count];
    
    for (int i = 0; i<stroybordNames.count; i++) {
        //创建故事板对象
        UIStoryboard *stroybord=[UIStoryboard storyboardWithName:[stroybordNames objectAtIndex:i] bundle:nil];
        //实例化入口故事板控制器
        BaseNavigationViewController *viewController=[stroybord instantiateInitialViewController];
        
        [viewControllers addObject:viewController];
        
    }
    
    self.viewControllers=viewControllers;
}
#pragma mark - 创建标签子视图
-(void)_creatTabBarSubviews{
    /*
    //遍历标签上的视图,并移除
    for (UIView *view in self.tabBar.subviews) {
        
        //定义UITabBarButton类
        Class tabBarButton=NSClassFromString(@"UITabBarButton");
        
        //判断视图是否属于UITabBarButton类
        if ([view isKindOfClass:tabBarButton]) {
            
            //只移除该类的对象
            [view removeFromSuperview];
        }
    }
    */
    //移除标签栏中所有子视图
    [self.tabBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //标签栏背景图
    _bgTabBarView=[[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _bgTabBarView.image=[UIImage imageNamed:@"mask_navbar@2x"];
    _bgTabBarView.userInteractionEnabled=YES;
    
    [self.tabBar addSubview:_bgTabBarView];
    //标签栏按钮背景图数组
    NSArray *buttonBgs=@[
                         @"home_tab_icon_1.png",
                         @"home_tab_icon_2.png",
                         @"home_tab_icon_3.png",
                         @"home_tab_icon_4.png",
                         @"home_tab_icon_5.png"
                         ];

    
    //创建标签拦按钮
    for (int j = 0; j<buttonBgs.count; j++) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake((kScreenWidth / buttonBgs.count)*j, 0, kScreenWidth / buttonBgs.count, kTabBarHeight);
        
        [button setBackgroundImage:[UIImage imageNamed:[buttonBgs objectAtIndex:j]] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(selectTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=100+j;
        
        [_bgTabBarView addSubview:button];
    }
    
    _selectedView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_bottom_tab_arrow"]];
    UIView *view=[_bgTabBarView viewWithTag:100];
    
    _selectedView.frame=view.bounds;
    
    [_bgTabBarView addSubview:_selectedView];
}

- (void)selectTabBarButton:(UIButton *)sender {
    
    self.selectedIndex = sender.tag - 100;
    
    [UIView animateWithDuration:.3 animations:^{
        _selectedView.center=sender.center;
    }];
}
@end
