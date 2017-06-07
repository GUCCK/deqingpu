//
//  RegisterViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RegisterViewController.h"
#import "LogInViewController.h"
@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *messageTXF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTXF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTXF2;
@property (weak, nonatomic) IBOutlet UITextField *phobeNumberTXF;
@property (weak, nonatomic) IBOutlet UIButton *sendPW;
@property (nonatomic,copy)NSString *SMS_token;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
    
    [self tapBackground];
}


-(void)setUI{
    _titleLable.text = _nameStr;
    [_messageTXF setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTXF setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTXF2 setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [_phobeNumberTXF setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    
}

//发送验证码
- (IBAction)sendPW:(id)sender {
    
    //发送验证码
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_RIGISRER_Yanzheng];
    NSDictionary *dict = @{@"phone":_phobeNumberTXF.text,@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0"};
    
    if (_phobeNumberTXF.text.length >0) {
      [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
          NSDictionary *dict = responseData;
          [SVProgressHUD showSuccessWithStatus:@"验证码已发送"];
          if ([dict[@"code"] intValue] == 200) {
              _SMS_token = dict[@"sms_token"];
          }
              
          
      } andfailure:^(NSError *error) {
         
      }];
    }else [SVProgressHUD showWithStatus:@"请输入手机号" ];
    //倒计时时间 - 60S
    __block NSInteger timeOut = 59;
    //执行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //计时器 -》 dispatch_source_set_timer自动生成
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, NSEC_PER_SEC, NSEC_PER_SEC);    dispatch_source_set_event_handler(timer, ^{
        if (timeOut <= 0) {
            dispatch_source_cancel(timer);
            //主线程设置按钮样式
            dispatch_async(dispatch_get_main_queue(), ^{
                // 倒计时结束
                [_sendPW setTitle:@"点击发送" forState:UIControlStateNormal];
                [_sendPW setEnabled:YES];
                [_sendPW setUserInteractionEnabled:YES];
            });
        } else {
            //开始计时
            //剩余秒数 seconds
            NSInteger seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.1ld", (long)seconds];
            //主线程设置按钮样式
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
               // [_sendPW setBackgroundImage:kImage(kCaptchaButtonSelected) forState:UIControlStateNormal];
                NSString *title = [NSString stringWithFormat:@"%@ s",strTime];
                [_sendPW setTitle:title forState:UIControlStateNormal];
                [UIView commitAnimations];
                //计时器件不允许点击
                [_sendPW setUserInteractionEnabled:NO];
            });
            timeOut--;
        }
    });
    dispatch_resume(timer);
}

//下一步
- (IBAction)NextBTN:(id)sender {
    if (_phobeNumberTXF.text.length>0&&_messageTXF.text.length>0&&_passwordTXF.text.length>0&&_passwordTXF2>0&&_SMS_token.length>0) {
        NSString *url0 = [NSString stringWithFormat:@"%@%@",SERVER_HOST,My_CENTER_RIGISTER];
        NSString *url1 = [NSString stringWithFormat:@"%@%@",SERVER_HOST,My_CENTER_losePassword];
        NSString *bayue = @"BaYue.deqingpu";
        NSString *safe = @"v.1.0";
        if ([_type isEqualToString:@"0"]) {
            NSDictionary *dict = @{@"phone":_phobeNumberTXF.text,@"password":_passwordTXF.text,@"reppassword":_passwordTXF2.text,@"code":_messageTXF.text,@"sms_token":_SMS_token,@"safecode":bayue,@"apiversion":safe};
            if (_phobeNumberTXF.text.length>0&&_messageTXF.text.length>0&&_passwordTXF.text.length>0&&_passwordTXF2>0&&_SMS_token.length>0) {
                [MyTool sendnetWorkWithUrl:url0 andParameters:dict whenSuccessed:^(id responseData) {
                    NSDictionary *dict = responseData;
                    [SVProgressHUD showSuccessWithStatus:dict[@"data"]];
                    [self dismissViewControllerAnimated:YES completion:^{
                        nil;
                    }];
                } andfailure:^(NSError *error) {
                    
                }];
                
            }else{
                [SVProgressHUD showErrorWithStatus:@"请填写正确信息"];
            }
        }else if ([_type isEqualToString:@"1"]){
            NSDictionary *dict = @{@"phone":_phobeNumberTXF.text,@"password":_passwordTXF.text,@"reppassword":_passwordTXF2.text,@"code":_messageTXF.text,@"sms_token":_SMS_token,@"safecode":bayue,@"apiversion":safe};
            if (_phobeNumberTXF.text.length>0&&_messageTXF.text.length>0&&_passwordTXF.text.length>0&&_passwordTXF2>0&&_SMS_token.length>0){
                [MyTool sendnetWorkWithUrl:url1 andParameters:dict whenSuccessed:^(id responseData) {
                    NSDictionary *dict = responseData;
                    [SVProgressHUD showErrorWithStatus:dict[@"message"]];
                    if ([dict[@"code"] intValue] == 200) {
                        [SVProgressHUD showSuccessWithStatus:@"密码重置成功"];
                        [self dismissViewControllerAnimated:YES completion:^{
                            nil;
                        }];
                    }
                    
                } andfailure:^(NSError *error) {
                    NSLog(@"%@",error.localizedDescription);
                }];
            }
        }
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"请填写正确信息"];
    }
}
//返回登录
- (IBAction)loginBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}

-(void)tapBackground
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}

-(void)tapOnce//手势方法
{
    [_messageTXF resignFirstResponder];
    [_phobeNumberTXF resignFirstResponder];
    [_passwordTXF2 resignFirstResponder];
    [_passwordTXF resignFirstResponder];
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
