//
//  NewAddressViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NewAddressViewController.h"

@interface NewAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *AddressView;//收货地址视图
@property (weak, nonatomic) IBOutlet UITextField *cargoReceive;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTXT;
@property (weak, nonatomic) IBOutlet UITextField *areaTXT;
@property (weak, nonatomic) IBOutlet UITextField *detailAddTXT;
@property (weak, nonatomic) IBOutlet UIButton *selectArea;
@property (nonatomic,strong) UITableView  *tableView;
@end

@implementation NewAddressViewController
{
    BOOL open;//判断开合
    NSMutableArray *_shengArray;
    NSMutableArray *_cityArray;
    NSMutableArray *_quArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomerTitle:@"新增收货地址"];
    self.AddressView.backgroundColor = [UIColor redColor];
    open = NO;
    _AddressView.hidden = YES;
    [self setAddresVIewAddtableView];
    [self tapBackground];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSString *url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,My_CENTER_GETADDRESS];
    [MyTool sendnetWorkWithUrl:url andParameters:SERVER_SAFE whenSuccessed:^(id responseData) {
        NSDictionary *dict = responseData;
        
    } andfailure:^(NSError *error) {
        
    }];
}

-(void)setAddresVIewAddtableView{
    
    _shengArray = [[NSMutableArray alloc]init];
    _cityArray = [[NSMutableArray alloc]init];
    _quArray = [[NSMutableArray alloc]init];;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, _AddressView.bounds.size.width,  _AddressView.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_AddressView addSubview:_tableView];
    
}


- (IBAction)seletAreaBtn:(id)sender {
    if (open) {
        self.AddressView.hidden = YES;
        open = NO;
    }self.AddressView.hidden = NO;
        open = YES;
}


-(void)tapBackground
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [self.view addGestureRecognizer:tap];//添加手势到View中
}

#pragma mark delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
    
}
-(void)tapOnce{
    [_cargoReceive resignFirstResponder];
    [_phoneNumTXT resignFirstResponder];
    [_areaTXT resignFirstResponder];
    [_detailAddTXT resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
