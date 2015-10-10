//
//  ThemeManager.m
//  我的微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *instance=nil;
@implementation ThemeManager

+(instancetype)sharedManager{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        instance=[[ThemeManager alloc]init];
        
    });
    
    return instance;
}

-(instancetype)init{
    
    if (self=[super init]) {
        
        //设置默认主题
        _themeName=@"猫爷";
        
        //配置文件
        NSString *filePath=[[NSBundle mainBundle]pathForResource:@"theme" ofType:@"plist"];
        _themeConfig=[NSDictionary dictionaryWithContentsOfFile:filePath];
        
    }
    return self;
}

-(UIImage *)getThemeImageWithString:(NSString *)imageName{
    
    NSString *bundlePath=[[NSBundle mainBundle]resourcePath];
    //获取主题路径
    NSString *themePath=[_themeConfig objectForKey:_themeName];
    
    //拼接完整图片路径
    NSString *imagePath=[themePath stringByAppendingFormat:@"/%@",imageName];
    
    NSString *fullPath=[bundlePath stringByAppendingPathComponent:imagePath];
    //获取对应图片
//    return [UIImage imageNamed:imagePath];
    return [UIImage imageWithContentsOfFile:fullPath];
}
@end
