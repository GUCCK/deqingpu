//
//  TransactionRecordsTableViewCell.m
//  DeQingPu
//
//  Created by apple on 2017/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TransactionRecordsTableViewCell.h"
@interface TransactionRecordsTableViewCell ()


@property (weak, nonatomic) IBOutlet UILabel *TXLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation TransactionRecordsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(TransactionModel *)model
{
    _model = model;
    _TXLabel.text = model.TXString;
    _TimeLabel.text = model.time;
    _moneyLabel.text = model.money;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
