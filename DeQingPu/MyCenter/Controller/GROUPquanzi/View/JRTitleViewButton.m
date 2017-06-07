//
//  JRTitleViewButton.m
//  彩票
//
//  Created by DJR on 16/10/13.
//  Copyright © 2016年 DJR. All rights reserved.
//

#import "JRTitleViewButton.h"

@implementation JRTitleViewButton

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}
// 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整子控件的位置
    
    // 如果不是第一次调整控件的位置，直接返回
    if (!(self.imageView.x < self.titleLabel.x)) return;
    
        // 调整label
        self.titleLabel.x = self.imageView.x;
        
        // 调整imageView
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
}

@end
