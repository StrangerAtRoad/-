//
//  ThemeManager.h
//  我的微博
//
//  Created by imac on 15/10/10.
//  Copyright © 2015年 xiaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ThemeManager : NSObject

@property(nonatomic,copy)NSString *themeName;//当前主题名字
@property(nonatomic,strong)NSDictionary *themeConfig;//

+(instancetype)sharedManager;

-(UIImage *)getThemeImageWithString:(NSString *)imageName;
@end
