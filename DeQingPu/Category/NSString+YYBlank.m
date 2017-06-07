//
//  NSString+YYBlank.m
//  sharemobliephone
//
//  Created by youyu  on 2017/4/10.
//  Copyright © 2017年 youyu. All rights reserved.
//

#import "NSString+YYBlank.h"

@implementation NSString (YYBlank)
+ (BOOL) isBlankString:(NSString *)string
{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
@end
