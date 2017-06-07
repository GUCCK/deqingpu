//
//  TIXIANViewController.m
//  DeQingPu
//
//  Created by apple on 2017/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TIXIANViewController.h"

@interface TIXIANViewController ()
@property (weak, nonatomic) IBOutlet UIButton *subBTNav;
@property (weak, nonatomic) IBOutlet UITextField *TXTF;
@property (weak, nonatomic) IBOutlet UILabel *balanceLB;

@end

@implementation TIXIANViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomerTitle:@"申请提现"];
    [self tapBackground];
}
//提交申请
- (IBAction)subBTNCLICK:(id)sender {
    if (_TXTF.text.length>0) {
        NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_GETMONEY];
        NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usertoken"];
        
        NSDictionary *dict = @{@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"type":@"alipay",@"amount":_TXTF.text};
        [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
            NSDictionary *dict2 = responseData;
            [SVProgressHUD showSuccessWithStatus:dict2[@"data"]];
        } andfailure:^(NSError *error) {
            NSLog(@"%@",error.localizedDescription);
        }];
    }else{
        [SVProgressHUD showWithStatus:@"请输入金额"];
    }

}
-(void)tapBackground
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
    
}
-(void)tapOnce//手势方法
{
    [_TXTF resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
