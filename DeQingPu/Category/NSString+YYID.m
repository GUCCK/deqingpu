//
//  NSString+YYID.m
//  sharemobliephone
//
//  Created by youyu  on 2017/3/29.
//  Copyright © 2017年 youyu. All rights reserved.
//

#import "NSString+YYID.h"

@implementation NSString (YYID)

+ (BOOL) IsIdentityCard:(NSString *)IDCardNumber
{
    if (IDCardNumber.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}
@end
