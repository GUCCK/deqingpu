//
//  DayLogCell.m
//  DeQingPu
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DayLogCell.h"

@interface DayLogCell ()
@property (weak, nonatomic) IBOutlet UILabel *riLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearMonthLabel;
@property (weak, nonatomic) IBOutlet UIView *blackDianLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *zhuanzaiButton;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;

@end


@implementation DayLogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _detailLabel.text = @"skdflajlafalfjalfjlafj";
    _blackDianLabel.layer.cornerRadius = _blackDianLabel.width * 0.5;
    _blackDianLabel.layer.masksToBounds = YES;
    
    
    [_zhuanzaiButton setImage:[UIImage imageNamed:@"icon_123-50"] forState:UIControlStateNormal];
    [_zhuanzaiButton setTitle:@"一键转载" forState:UIControlStateNormal];
    _zhuanzaiButton.titleLabel.font = [UIFont systemFontOfSize:11];
    _zhuanzaiButton.imageView.frame = CGRectMake(0, 0, 14, 14);
    _zhuanzaiButton.imageEdgeInsets = UIEdgeInsetsMake(0, _zhuanzaiButton.titleLabel.width + 2.5, 0, - _zhuanzaiButton.titleLabel.width - 2.5);
    _zhuanzaiButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _zhuanzaiButton.currentImage.size.width, 0, _zhuanzaiButton.currentImage.size.width);
    
    [_zanButton setImage:[UIImage imageNamed:@"icon_ 11-50"] forState:UIControlStateNormal];
    [_zanButton setImage:[UIImage imageNamed:@"icon_124-50"] forState:UIControlStateSelected];
    [_zanButton setTitle:@"226" forState:UIControlStateNormal];
    _zanButton.titleLabel.font = [UIFont systemFontOfSize:11];
    _zanButton.imageView.frame = CGRectMake(0, 0, 10, 9);
    _zanButton.imageEdgeInsets = UIEdgeInsetsMake(0, _zanButton.titleLabel.width + 2.5, 0, - _zanButton.titleLabel.width - 2.5);
    _zanButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _zanButton.currentImage.size.width, 0, _zanButton.currentImage.size.width);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
