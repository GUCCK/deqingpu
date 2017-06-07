//
//  TransactionRecordsViewController.m
//  DeQingPu
//
//  Created by apple on 2017/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TransactionRecordsViewController.h"

@interface TransactionRecordsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation TransactionRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomerTitle:@"交易记录"];
    [self createDataSource];
    
}
-(void)createDataSource{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, UIScreenWidth, UIScreenHeight) style:UITableViewStylePlain];
    
}
-(void)createUI{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
