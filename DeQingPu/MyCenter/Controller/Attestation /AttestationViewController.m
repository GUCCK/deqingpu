//
//  AttestationViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/31.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AttestationViewController.h"

@interface AttestationViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *scrollIMG;//滚动小条
@property (weak, nonatomic) IBOutlet UIImageView *IDIMG;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;//姓名
@property (weak, nonatomic) IBOutlet UITextField *IDTF;//id
@property (weak, nonatomic) IBOutlet UIButton *updataBTN;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property(nonatomic,copy)NSString *img64;
@property (weak, nonatomic) IBOutlet UILabel *IDlabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *explainlabel;
@property (nonatomic,strong) UIView *BGView;
@property(nonatomic,copy) NSString *whichOne;


@end

@implementation AttestationViewController
{
     UIImagePickerController *pickerController;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomerTitle:@"认证中心"];
    ;
    [self tapBackground];
    [self addImagePicker];
    
}


- (void)addImagePicker {
    pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
}
//相册
-(void)makePhoto{
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:pickerController animated:YES completion:nil];
}

-(void)choosePhotosAlbum
{
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:pickerController animated:YES completion:nil];
}
//回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *userImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [_updataBTN setBackgroundImage:userImage forState:UIControlStateNormal];
  _img64 = [MyTool imageChangeBase64:userImage];
   
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)showView{
    _bgView.hidden = NO;
    _bgView.frame =  CGRectMake(0, _tipsLabel.frame.origin.y-10, UIScreenWidth,300);
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.alpha = 1;
    [self.view addSubview:_bgView];
    
}

//大咖认证
- (IBAction)bigkaClick:(id)sender {
    _bgView.hidden = YES;
    _scrollIMG.frame = CGRectMake(UIScreenWidth-UIScreenWidth/4+10, 40, UIScreenWidth/4-20, 1);
    _whichOne = @"2";
    
    [self exchangeInfo:2];
    [self showView];
}
//商铺认证
- (IBAction)storerealClick:(id)sender {
    _bgView.hidden = YES;
     _scrollIMG.frame = CGRectMake(UIScreenWidth/2-UIScreenWidth/4, 40, UIScreenWidth/4-5, 1);
    
}
//实名认证
- (IBAction)realnameClick:(id)sender {
    _bgView.hidden = YES;
    _scrollIMG.frame = CGRectMake(0, 40,UIScreenWidth/4-5 , 1);
    [self exchangeInfo:1];
    
}
//公司认证
- (IBAction)companyClick:(id)sender {
    _bgView.hidden = YES;
    _scrollIMG.frame = CGRectMake(UIScreenWidth/2, 40, UIScreenWidth/4, 1);
    _whichOne = @"0";
    [self exchangeInfo:0];
    
}

-(void)exchangeInfo:(int)num
{
    if (num == 0) {
        _nameLabel.text = @"公司名";
        _IDlabel.text = @"公司地址";
        _tipsLabel.text = @"公司营业执照";
        _explainlabel.text = @"请上传公司营业执照/三证合一照片，要求面部清晰无遮挡，同时证件照片及号码清晰可辨认。";
    }else if (num == 1){
        _nameLabel.text = @"姓名";
        _IDlabel.text = @"证件号";
        _tipsLabel.text = @"手持身份证";
        _explainlabel.text = @"请上传本人手持证件照片，要求面部清晰无遮挡，同时证件照片及号码清晰可辨认。";
    }else if (num == 2){
         _nameLabel.text = @"真实姓名";
        _IDlabel.text = @"推荐人客官号";
        
    }
    
}
//提交
- (IBAction)submitBTN:(id)sender {
    
       switch ([_whichOne intValue]) {
        case 0:
               if (_nameTF.text&&_IDTF.text&&_img64) {
                   
                   NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_COMPANY];
                   NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"usertoken"];
                   NSDictionary *dict = @{@"pic":_img64,@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"id_num":_IDTF.text,@"name":_nameTF.text};
                   [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
                       NSDictionary *dict3 = responseData;
                       if ([dict3[@"code"] intValue] == 200) {
                           [SVProgressHUD showSuccessWithStatus:dict3[@"data"]];
                       }
                   } andfailure:^(NSError *error) {
                       
                   }];
               }else{
                   [SVProgressHUD showErrorWithStatus:@"填写有效信息"];
               }
            break;
               
            case 1:
               if (_nameTF.text&&_IDTF.text&&_img64) {
                   
                   NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENER_REALNAME];
                   NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"usertoken"];
                   
                   NSDictionary *dict = @{@"pic":_img64,@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"id_num":_IDTF.text,@"name":_nameTF.text};
                   [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
                       NSDictionary *dict3 = responseData;
                       if ([dict3[@"code"] intValue] == 200) {
                           [SVProgressHUD showSuccessWithStatus:dict3[@"data"]];
                           
                       }
                   } andfailure:^(NSError *error) {
                       
                   }];
               }else{
                   [SVProgressHUD showErrorWithStatus:@"填写有效信息"];
               }
               
            break;
            case 2:
               if (_nameTF.text&&_IDTF.text) {
                   NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,MY_CENTER_DAKA];
                    NSString *token = [[NSUserDefaults standardUserDefaults]objectForKey:@"usertoken"];
                    NSDictionary *dict = @{@"safecode":@"BaYue.deqingpu",@"apiversion":@"v.1.0",@"token":token,@"id_num":_IDTF.text,@"name":_nameTF.text};
                   [MyTool sendnetWorkWithUrl:url andParameters:dict whenSuccessed:^(id responseData) {
                       NSDictionary *dict3 = responseData;
                       if ([dict3[@"code"] intValue] == 200) {
                           [SVProgressHUD showSuccessWithStatus:dict3[@"data"]];
                           [self backAction];
                       }
                   } andfailure:^(NSError *error) {
                       
                   }];

               }
               
               
               
            break;
            case 3:
               
            break;
        default:
            break;
    }
}
//手势
-(void)tapBackground
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
     UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];
    [_bgView addGestureRecognizer:tap2];
}
//显示实例
- (IBAction)searchIMG:(id)sender {
    _IDIMG.hidden = NO;
    _bgView.hidden = NO;
    
}

-(void)tapOnce{
    [_nameTF resignFirstResponder];
    [_IDTF resignFirstResponder];
    _IDIMG.hidden = YES;
    _bgView.hidden = YES;
}
//点击上传图片
- (IBAction)upDataClick:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [self makePhoto];
        }
        else
        {
            UIAlertController *alertTips = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设置-->隐私-->照片，中开启本应用的相机访问权限！" preferredStyle:UIAlertControllerStyleAlert];
            [alertTips addAction:[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertTips animated:YES completion:nil];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            [self choosePhotosAlbum];
        }
        else
        {
            UIAlertController *alertTips = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设置-->隐私-->照片，中开启本应用的相册访问权限！" preferredStyle:UIAlertControllerStyleAlert];
            [alertTips addAction:[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertTips animated:YES completion:nil];
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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
