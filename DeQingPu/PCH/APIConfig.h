//
//  APIConfig.h
//  01-项目实战
//
//  Created by 大欢 on 16/8/5.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface APIConfig : NSObject
#define SERVER_SAFE @{@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0"}

#define SERVER_HOST @"http://192.168.1.120/bayue/deqingpu/public/"
//安全参数
/*
 @"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0"
 */
//登陆
#define MY_CENTER_LOGIN @"api/login/signin"

//获取验证码
#define MY_CENTER_RIGISRER_Yanzheng @"api/sms/get_code"

//注册
#define My_CENTER_RIGISTER @"api/login/register"

//找回密码
#define My_CENTER_losePassword @"api/login/get_pwd"

//获取收货地址
#define My_CENTER_GETADDRESS @"api/address/getall"

//实名认证
#define MY_CENER_REALNAME  @"api/preaudit/real"

//企业认证
#define MY_CENTER_COMPANY @"api/preaudit/company"

//大咖认证
#define MY_CENTER_DAKA @"api/preaudit/identity"

//绑定账号
#define MY_CENTER_ACCOUNT @"api/user/bind"

//申请提现
#define MY_CENTER_GETMONEY @"api/user/apply"
@end
