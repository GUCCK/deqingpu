//
//  MyCenterViewController.m
//  DeQingPu
//
//  Created by apple on 2017/5/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MyCenterViewController.h"
#import "MyTableViewCell.h"
#import "MyHomePageViewController.h"
#import "ShippingAddressViewController.h"
#import "AttestationViewController.h"
#import "MyMoneyViewController.h"
static NSString *identifier = @"MyTableViewCell";
static NSString *identifier2 = @"cell";

@interface MyCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor grayColor];
    [self setCustomerTitle:@"个人中心"];
    [self createUI];
}

-(void)createUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 67, self.view.bounds.size.width, self.view.bounds.size.height-24) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 67, 0);
    //[_tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCell"];
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

#pragma  mark   UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *nameArray = @[@"",@"圈子",@"我的荷包",@"我的地址",@"我的订单",@"我的购物车",@"我的认证",@"我的店铺",@"产品入驻",@"资源集市",@"设置"];
    NSArray *imgArray = @[@"",@"myquanzi",@"myqianbao",@"mydizhi",@"mydingdan",@"myshoping",@"myrenzheng",@"mydianpu",@"mycanping",@"myziyuanjishi",@"myshezhi"];

    if (indexPath.row == 0) {
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        return cell;
    }else{
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
        }
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgArray[indexPath.row]]];
        img.frame = CGRectMake(13, 13, 20, 20);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 18, 60, 11)];
        UIImageView *imgR = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"myyou"]];
        imgR.frame = CGRectMake(self.view.bounds.size.width-30, 16, 7, 13);
        
        [label setFont:[UIFont systemFontOfSize:10]];
        label.text = nameArray[indexPath.row];
        [cell.contentView addSubview:imgR];
        [cell.contentView addSubview:img];
        [cell.contentView addSubview:label];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MyHomePageViewController *homeVc = [[MyHomePageViewController alloc]init];
        [self.navigationController pushViewController:homeVc animated:NO];
    }else if (indexPath.row == 1){
        
    }else if (indexPath.row == 2){
        //我的荷包
        MyMoneyViewController *money = [[MyMoneyViewController alloc]init];
        [self.navigationController pushViewController:money animated:NO];
        
    }else if (indexPath.row == 3){
        ShippingAddressViewController *shipVC = [[ShippingAddressViewController alloc]init];  //收货地址
        [self.navigationController pushViewController:shipVC animated:NO];
        
    }else if (indexPath.row == 4){
        
    }else if (indexPath.row == 5){
        
    }else if (indexPath.row == 6){
        //实名认证
        AttestationViewController *attVc = [[AttestationViewController alloc]init];
        [self.navigationController pushViewController:attVc animated:NO];
        
    }else if (indexPath.row == 7){
        
    }else if (indexPath.row == 8){
        
    }else if (indexPath.row == 9){
        
    }else if (indexPath.row == 10){
        
    }else if (indexPath){
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 70;
    }
    return 55;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
