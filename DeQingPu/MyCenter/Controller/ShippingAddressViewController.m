//
//  ShippingAddressViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ShippingAddressViewController.h"
#import "ShipAddressTableViewCell.h"
#import "NewAddressViewController.h"
#import "MyAddressCell.h"
@interface ShippingAddressViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ShippingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomerTitle:@"我的地址"];
    [self setupTableView];
    [self setUI];
   
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, UIScreenWidth, UIScreenHeight) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
    _tableView.rowHeight = 180;
    [self.view addSubview:_tableView];
}
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark UItableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyAddressCell *cell = [MyAddressCell cellWithTableView:tableView];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark 初始化UI
-(void)setUI{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(16, self.view.bounds.size.height - 66, self.view.bounds.size.width-40, 51);
    [button setTitle:@"新增收货地址" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(addshipAddress) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 5;
    [self.view addSubview:button];
    
}

#pragma mark 点击事件
-(void)addshipAddress{
    NewAddressViewController *newVc = [[NewAddressViewController alloc]init];
    [self.navigationController pushViewController:newVc animated:NO];
    
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
