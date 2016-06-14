//
//  UIImage+ImageContentViewColor.m
//  Chat2
//
//  Created by lanou3g on 16/6/13.
//  Copyright © 2016年 Terry. All rights reserved.
//

#import "UIImage+ImageContentViewColor.h"

@implementation UIImage (ImageContentViewColor)

+ (UIImage *)imageWithColor:(UIColor *)color; {
    //给定绘图的大小
    CGRect rect = CGRectMake(0, 0, 1, 1);
    //绘图开始
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1);
    //设置填充颜色
    [color setFill];
    //设置填充范围
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //绘图结束
    UIGraphicsEndImageContext();
    
    return image;
}

@end
