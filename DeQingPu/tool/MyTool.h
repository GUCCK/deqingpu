//
//  MyTool.h
//  SchoolChat
//
//  Created by 王然 on 16/5/13.
//  Copyright © 2016年 王然. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SuccessBlock)(id responseData);
typedef void (^FailureBlock)(NSError *error);
typedef void (^FailureBlock2)(NSError *error,NSURLSessionDataTask *task);

typedef void (^ButtonOneBlock)(UIAlertAction *  action);
typedef void (^ButtonTwoBlock)(UIAlertAction *  action);

@interface MyTool : NSObject
//创建网络请求
+ (void)sendnetWorkWithUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock)failure;
+ (void)sendnetWorkWithGETUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock)failure;

+ (void)BJsendnetWorkWithUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock2)failure ;


+ (void)quit;

//创建标签视图
+ (UILabel *)createLabelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color;


+ (NSString *)getTimestamp;
+ (UIImage *)getImage;
+ (NSString *)imageChangeBase64: (UIImage *)image;

@end
