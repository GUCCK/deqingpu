//
//  FriendOrAttestationCell.m
//  DeQingPu
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "FriendOrAttestationCell.h"
#import "JRTitleViewButton.h"

@interface FriendOrAttestationCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *transmitButton;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;

@end

@implementation FriendOrAttestationCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _iconImageView.image = [UIImage imageNamed:@"mycenteruserImg"];
    _iconImageView.layer.cornerRadius = _iconImageView.width * 0.5;
    _iconImageView.layer.masksToBounds = YES;
    
    [_transmitButton setImage:[UIImage imageNamed:@"icon_123-50"] forState:UIControlStateNormal];
    [_transmitButton setTitle:@"一键转载" forState:UIControlStateNormal];
    _transmitButton.titleLabel.font = [UIFont systemFontOfSize:11];
    _transmitButton.imageView.frame = CGRectMake(0, 0, 14, 14);
    _transmitButton.imageEdgeInsets = UIEdgeInsetsMake(0, _transmitButton.titleLabel.width + 2.5, 0, - _transmitButton.titleLabel.width - 2.5);
    _transmitButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _transmitButton.currentImage.size.width, 0, _transmitButton.currentImage.size.width);
    
    [_zanButton setImage:[UIImage imageNamed:@"icon_ 11-50"] forState:UIControlStateNormal];
    [_zanButton setImage:[UIImage imageNamed:@"icon_124-50"] forState:UIControlStateSelected];
    [_zanButton setTitle:@"226" forState:UIControlStateNormal];
    _zanButton.titleLabel.font = [UIFont systemFontOfSize:11];
     _zanButton.imageView.frame = CGRectMake(0, 0, 10, 9);
    _zanButton.imageEdgeInsets = UIEdgeInsetsMake(0, _zanButton.titleLabel.width + 2.5, 0, - _zanButton.titleLabel.width - 2.5);
    _zanButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _zanButton.currentImage.size.width, 0, _zanButton.currentImage.size.width);
    
}
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
