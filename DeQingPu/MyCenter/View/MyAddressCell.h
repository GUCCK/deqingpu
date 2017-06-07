//
//  MyAddressCell.h
//  DeQingPu
//
//  Created by apple on 17/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAddressModel.h"

@interface MyAddressCell : UITableViewCell
@property(nonatomic,copy)void(^editeBlock)(MyAddressCell*cell);
@property(nonatomic,copy)void(^defaultBlock)(MyAddressCell*cell);
@property(nonatomic,copy)void(^deleteBlock)(MyAddressCell*cell);
@property(nonatomic,strong) MyAddressModel *addressModel;
+ (instancetype)cellWithTableView:(UITableView*)tableView;
@end
