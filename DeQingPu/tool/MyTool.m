//
//  MyTool.m
//  SchoolChat
//
//  Created by 王然 on 16/5/13.
//  Copyright © 2016年 王然. All rights reserved.
//

#import "MyTool.h"
#import "AFNetworking.h"
//#import "HomeViewController.h"

@implementation MyTool

+ (void)sendnetWorkWithUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock)failure
{
    AFHTTPSessionManager *Session = [AFHTTPSessionManager manager];

    Session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",nil];
//    Session.requestSerializer = [AFJSONRequestSerializer serializer];
//    Session.responseSerializer = [AFJSONResponseSerializer serializer];
//     设置超时时间
//    [Session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    Session.requestSerializer.timeoutInterval = 10.f;
//    [Session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [Session POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"%@",error.localizedDescription);
    }];
}

+ (void)sendnetWorkWithGETUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock)failure
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
//    session.requestSerializer = [AFJSONRequestSerializer serializer];
//    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer.timeoutInterval = 10.f;
    [session GET:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)BJsendnetWorkWithUrl:(NSString *)url andParameters:(NSDictionary *)dict whenSuccessed:(SuccessBlock)success andfailure:(FailureBlock2)failure
{
    AFHTTPSessionManager *Session = [AFHTTPSessionManager manager];
    Session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    Session.requestSerializer.timeoutInterval = 3.0f;
    [Session POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error,task);
    }];
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.font = font;
    label.textColor = color;
    return label;
}

+ (void)quit
{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"uid"];
    
    //清空沙盒保存的头像
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",@"headImage"]];

    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


+ (NSString *)getTimestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    return str;
}
+ (UIImage *)getImage
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = [paths objectAtIndex:0];
    
    NSData *imageData = [NSData dataWithContentsOfFile:[document stringByAppendingString:@"/imageName.png"]];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
#pragma mark -- image转化成Base64位
+ (NSString *)imageChangeBase64: (UIImage *)image{
    
    NSData   *imageData = nil;
    //NSString *mimeType  = nil;
    if ([self imageHasAlpha:image]) {
        
        imageData = UIImagePNGRepresentation(image);
        //mimeType = @"image/png";
    }else{
        
        imageData = UIImageJPEGRepresentation(image, 0.3f);
        //mimeType = @"image/jpeg";
    }
    return [NSString stringWithFormat:@"data:image/gif;base64,%@",[imageData base64EncodedStringWithOptions: 0]];
}

+ (BOOL)imageHasAlpha:(UIImage *)image{
    
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
@end
