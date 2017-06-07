//
//  MyMoneyViewController.m
//  DeQingPu
//
//  Created by apple on 2017/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MyMoneyViewController.h"
#import "TIXIANViewController.h"
@interface MyMoneyViewController ()
@property (weak, nonatomic) IBOutlet UIView *zhezaoView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UITextField *accountTXF;
@property (weak, nonatomic) IBOutlet UILabel *titileLabel;

@end

@implementation MyMoneyViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    _bgView.layer.borderWidth = 1;
    _bgView.layer.borderColor = [UIColor colorWithRed:229 green:229 blue:229 alpha:1].CGColor;
    [self setCustomerTitle:@"我的荷包"];
    _moneyLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"usermoney"];
    [_moneyLabel sizeToFit];
    _detailView.layer.cornerRadius = 5;
    _detailView.hidden = YES;
    _zhezaoView.hidden = YES;
    [self tapBackground];
}


-(void)tapBackground
{
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.zhezaoView addGestureRecognizer:tap];//添加手势到View中
    
}
-(void)tapOnce//手势方法
{
    [_accountTXF resignFirstResponder];
    
}

//点击事件
- (IBAction)tixianBtn:(id)sender {
    TIXIANViewController *tixianView = [[TIXIANViewController alloc]init];
    [self.navigationController pushViewController:tixianView animated:NO];
    
}
//支付宝
- (IBAction)alipay:(id)sender {
    
    _zhezaoView.hidden = NO;
    _detailView.hidden = NO;
    _titileLabel.text = @"绑定支付宝";
}
//微信
- (IBAction)wechat:(id)sender {
    _zhezaoView.hidden = NO;
    _detailView.hidden = NO;
    _titileLabel.text = @"绑定微信";
}
//交易记录
- (IBAction)transactionData:(id)sender {
    
}
//点击确定
- (IBAction)YesBtn:(id)sender {
    if ([_titileLabel.text isEqualToString:@"绑定支付宝"]) {
        if (_accountTXF.text.length>0) {
            
        NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_ACCOUNT];
        NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usertoken"];
        
        NSDictionary *dict = @{@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"type":@"alipay",@"account":_accountTXF.text};
        [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
            NSDictionary *dict2 = responseData;
            [SVProgressHUD showSuccessWithStatus:dict2[@"data"]];
        } andfailure:^(NSError *error) {
            NSLog(@"%@",error.localizedDescription);
        }];
        }else{
            [SVProgressHUD showWithStatus:@"请输入账号"];
        }
    }else{
        if (_accountTXF.text.length>0) {
            
            NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_ACCOUNT];
            NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usertoken"];
            
            NSDictionary *dict = @{@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"type":@"wechat",@"account":_accountTXF.text};
            [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
                NSDictionary *dict2 = responseData;
                [SVProgressHUD showSuccessWithStatus:dict2[@"data"]];
            } andfailure:^(NSError *error) {
                NSLog(@"%@",error.localizedDescription);
            }];
        }else{
            [SVProgressHUD showErrorWithStatus:@"请输入账号"];
        }

    }
}
//点击取消
- (IBAction)cancelBtnClick:(id)sender {
    _detailView.hidden = YES;
    _zhezaoView.hidden = YES;
    [_accountTXF resignFirstResponder];
    
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
