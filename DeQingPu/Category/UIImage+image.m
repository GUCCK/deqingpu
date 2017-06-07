//
//  UIImage+image.m
//  BuDeJie
//
//  Created by DJR on 16/8/25.
//  Copyright © 2016年 DJR. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+ (UIImage *)imageOriginalWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (instancetype)jr_circleImage
{
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    // 比例因素:当前点与像素比例 0表示自动适应比例
    // 2.描述裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 3.设置裁剪区域
    [path addClip];
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭图形上下文
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)jr_circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] jr_circleImage];
}

@end
