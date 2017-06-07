//
//  LogInViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LogInViewController.h"
#import "TBTabBar.h"
#import "ManagerLiveViewController.h"
#import "AppDelegate.h"
#import "RegisterViewController.h"
@interface LogInViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *telphoneImg;
@property (weak, nonatomic) IBOutlet UIImageView *passWordTF2;
@property (weak, nonatomic) IBOutlet UIImageView *passWordIMG;
@property (weak, nonatomic) IBOutlet UIImageView *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UIButton *resgisterBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_phoneTextField setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [_passWordTF setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _passWordTF.secureTextEntry = YES;
    _resgisterBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _resgisterBtn.layer.borderWidth = 1;
    _resgisterBtn.layer.cornerRadius = 25;
    _loginBtn.layer.borderWidth = 1;
    _loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _loginBtn.layer.cornerRadius = 25;
    
    [self createUI];
    //添加点击事件
    [self tapBackground];
   
}
-(void)tapBackground
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}

-(void)createUI{
    
}



-(void)tapOnce//手势方法
{
    [_phoneTextField resignFirstResponder];
    [_passWordTF resignFirstResponder];
}

//登陆
- (IBAction)logInBtn:(id)sender {
    if (_passWordTF.text.length>0&&_phoneTextField.text.length>0) {
        NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_LOGIN];
        NSString *bayue = @"BaYue.deqingpu";
        NSString *safe = @"v.1.0";
        
        if (_phoneTextField.text.length>0&&_passWordTF.text.length>0) {
            NSDictionary *dict = @{@"safecode":bayue,@"apiversion":safe,@"phone":_phoneTextField.text,@"password":_passWordTF.text};
            [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
                NSDictionary *dict = responseData;
                if ([dict[@"code"] intValue] == 200) {
                    [[NSUserDefaults standardUserDefaults]setObject:dict[@"token"] forKey:@"usertoken"];
                    //获取用户信息
                    [[NSUserDefaults standardUserDefaults]setObject:dict[@"userinfo"] forKey:@"userinfo"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"login" forKey:@"login"];
                    
                    [SVProgressHUD dismiss];
                    if (self.clickBlock) {
                        self.clickBlock();
                    }
                }else{
                    [SVProgressHUD showErrorWithStatus:@"账号或密码错误"];
                }
            } andfailure:^(NSError *error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }];
        }

    }else{
        [SVProgressHUD showErrorWithStatus:@"请输入账号或者密码"];
    }
}
//注册
- (IBAction)registerBtn:(id)sender {
    
    RegisterViewController *rsVc = [[RegisterViewController alloc]init];
    rsVc.type = @"0";
    [self presentViewController:rsVc animated:YES completion:^{
        rsVc.titleLable.text = @"欢迎注册";
    }];
}
//找回密码
- (IBAction)losePassWord:(id)sender {
    RegisterViewController *rsVc = [[RegisterViewController alloc]init];
    rsVc.type = @"1";
    [self presentViewController:rsVc animated:YES completion:^{
        
       rsVc.titleLable.text = @"找回密码";
    }];
    
}
#pragma mark  textField协议
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
