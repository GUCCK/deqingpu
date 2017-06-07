//
//  LTTextView.h
//  LTTextvViewDemo
//
//  Created by WJX on 16/7/8.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTTextView : UIView

/**  */
@property (nonatomic, strong, nullable) UITextView *textView;

/** 占位*/
@property (nonatomic, strong, nullable) UITextView *placeholderTextView;

@property(nonatomic,assign) NSInteger textLength;

+ (instancetype)placeholderTextView;

@property(nonatomic,copy,null_unspecified) void (^statusBlock)(NSInteger);
@end
