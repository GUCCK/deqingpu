//
//  RegisterViewController.h
//  DeQingPu
//
//  Created by apple on 2017/5/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (nonatomic,copy) NSString *nameStr;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (nonatomic,copy)NSString *type;
@end
