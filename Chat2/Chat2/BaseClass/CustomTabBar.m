//
//  CustomTabBar.m
//  Chat2
//
//  Created by lanou3g on 16/6/13.
//  Copyright © 2016年 Terry. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//重新给子视图布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //获取tabBar的宽度和高度
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    //确定items的frame
    CGFloat buttonY = 1;
    CGFloat buttonWidth = barWidth / 3;
    CGFloat buttonHeight = barHeight;
    
    //按钮的索引
    NSInteger index = 0;
    
    //确定位置
    for (UIView *view in self.subviews) {
        NSString *className = NSStringFromClass([view class]);
        if ([className isEqualToString:@"UITabBarButton"]) {
//            CGFloat buttonX = index * buttonWidth;
            view.frame = CGRectMake(index * buttonWidth, buttonY, buttonWidth, buttonHeight);
            //下一个item的frame
            index ++;
        }
    }
}

@end
