//
//  NSString+YYTextLength.m
//  sharemobliephone
//
//  Created by youyu  on 2017/4/22.
//  Copyright © 2017年 youyu. All rights reserved.
//

#import "NSString+YYTextLength.h"

@implementation NSString (YYTextLength)
+ (CGFloat)stringWithtext:(NSString *)text width:(CGFloat)width font:(UIFont*)font
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.height;
}
@end
