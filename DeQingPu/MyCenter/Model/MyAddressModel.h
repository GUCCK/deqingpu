//
//  MyAddressModel.h
//  DeQingPu
//
//  Created by apple on 17/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAddressModel : NSObject
/** 详细地址 */
@property (nonatomic, copy) NSString *address;
/** 地址编号 */
@property (nonatomic, copy) NSString *address_id;
/** 城市编号 */
@property (nonatomic, copy) NSString *city;
/** 收货人姓名 */
@property (nonatomic, copy) NSString *consignee;
/** 县区编号 */
@property (nonatomic, copy) NSString *district;
/** 联系方式 */
@property (nonatomic, copy) NSString *mobile;
/** 省份编号 */
@property (nonatomic, copy) NSString *province;

@end
