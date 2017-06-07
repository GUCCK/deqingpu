//
//  UIImage+image.h
//  BuDeJie
//
//  Created by DJR on 16/8/25.
//  Copyright © 2016年 DJR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
/**
 *  设置图片不需要渲染
 */
+ (UIImage *)imageOriginalWithName:(NSString *)imageName;
/**
 *  设置圆形图片
 */
- (instancetype)jr_circleImage;
+ (instancetype)jr_circleImageNamed:(NSString *)name;
@end
