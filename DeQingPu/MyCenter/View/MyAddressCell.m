//
//  MyAddressCell.m
//  DeQingPu
//
//  Created by apple on 17/6/5.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MyAddressCell.h"

@interface MyAddressCell ()
@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UILabel *phoneLabel;
@property(nonatomic,weak) UILabel *addressLabel;
@property(nonatomic,weak) UIView *sepLine;
@property(nonatomic,weak) UIButton *defaultBtn;
@property(nonatomic,weak) UIButton *editeBtn;
@property(nonatomic,weak) UIButton *deleteBtn;
@end


@implementation MyAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
static NSString *ID = @"addressCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    MyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
       
        cell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}

- (void)setupUI
{
    //名字
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:nameLabel];
    nameLabel.font = [UIFont systemFontOfSize:17];
    self.nameLabel = nameLabel;
    nameLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    nameLabel.text = @"收货人：呵呵哒";
    [nameLabel sizeToFit];
    //电话
    UILabel *phoneLabel = [[UILabel alloc] init];
    [self.contentView addSubview:phoneLabel];
    phoneLabel.font = [UIFont systemFontOfSize:17];
    phoneLabel.textAlignment = NSTextAlignmentRight;
    phoneLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.phoneLabel = phoneLabel;
    phoneLabel.text = @"12345678900";
    [phoneLabel sizeToFit];
    //地址
    UILabel *addressLabel = [[UILabel alloc] init];
    [self.contentView addSubview:addressLabel];
    addressLabel.font = [UIFont systemFontOfSize:15];
    addressLabel.text = @"收货地址：上海市嘉定区马陆镇理论上讲放辣椒啦";
    addressLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    self.addressLabel = addressLabel;
    addressLabel.numberOfLines = 2;
    //分隔线
    UIView *sepLine = [[UIView alloc] init];
    [self.contentView addSubview:sepLine];
    sepLine.backgroundColor = [UIColor colorWithHexString:@"#F5F5F5"];
    self.sepLine = sepLine;
    //默认按钮
    UIButton *defaultBtn = [[UIButton alloc] init];
    [defaultBtn setTitle:@"默认地址" forState:UIControlStateNormal];
    [defaultBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [defaultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [defaultBtn addTarget:self action:@selector(defaultClick) forControlEvents:UIControlEventTouchUpInside];
    defaultBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [defaultBtn setImage:[UIImage imageNamed:@"selectAddress"] forState:UIControlStateNormal];
    [defaultBtn setImage:[UIImage imageNamed:@"selectAddress_sel"] forState:UIControlStateSelected];
//    [defaultBtn.imageView setContentMode:UIViewContentModeScaleAspectFill];
    

    [self.contentView addSubview:defaultBtn];
    self.defaultBtn = defaultBtn;
    defaultBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    //编辑按钮
    UIButton *editeBtn = [[UIButton alloc] init];
    [editeBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editeBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    editeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [editeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [editeBtn addTarget:self action:@selector(editeClick) forControlEvents:UIControlEventTouchUpInside];
   // [editeBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
   // editeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.contentView addSubview:editeBtn];
    self.editeBtn = editeBtn;
    //删除按钮
    UIButton *deleteBtn = [[UIButton alloc] init];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
//    [deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
//    deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [self.contentView addSubview:deleteBtn];
    self.deleteBtn = deleteBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.nameLabel sizeToFit];
    self.nameLabel.x = 10;
    self.nameLabel.y = 15;
    //    self.nameLabel.width = 120;
    //    self.nameLabel.height = 20;
    
//    self.phoneLabel.x = CGRectGetMaxX(self.nameLabel.frame) + 10;
//    self.phoneLabel.y = self.nameLabel.y;
//    self.phoneLabel.width = 150;
//    self.phoneLabel.height = 20;
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.top.bottom.equalTo(self.nameLabel);
        make.width.equalTo(@150);
    }];
    
    self.addressLabel.x = self.nameLabel.x;
    self.addressLabel.y = CGRectGetMaxY(self.nameLabel.frame) + 15;
    self.addressLabel.width = UIScreenWidth - 20;
    self.addressLabel.height = 40;
    
    self.sepLine.x = 10;
    self.sepLine.height = 1;
    self.sepLine.width = UIScreenWidth - 20;
    self.sepLine.y = CGRectGetMaxY(self.addressLabel.frame) + 10;
    
    self.defaultBtn.x = self.nameLabel.x;
    self.defaultBtn.y = self.sepLine.y + 21;
    self.defaultBtn.width = 100;
    self.defaultBtn.height = 20;
    
    self.deleteBtn.width = 70;
    self.deleteBtn.height = 20;
    self.deleteBtn.x = UIScreenWidth - 60;
    self.deleteBtn.y = self.sepLine.y + 21;
    
    [self.editeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-50);
        make.width.offset(80);
        make.top.equalTo(self.sepLine).offset(21);
        make.height.offset(20);
    }];
}
- (void)defaultClick
{
    self.defaultBtn.selected = !self.defaultBtn.selected;
    if (self.defaultBlock) {
        self.defaultBlock(self);
    }
}

- (void)editeClick
{
    if (self.editeBlock) {
        self.editeBlock(self);
    }
}

- (void)deleteClick
{
    if (self.deleteBlock) {
         self.deleteBlock(self);
    }
    
   
}
- (void)setFrame:(CGRect)frame
{
    CGRect newFrame = frame;
    newFrame.size.height -= 20;
    [super setFrame:newFrame];
}
//- (CGFloat)stringWithtext:(NSString *)text height:(CGFloat)height font:(UIFont*)font
//{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSFontAttributeName] = font;
//    NSString *newText = [NSString stringWithFormat:@"商家回复:%@",text];
//    CGSize size = [newText boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    return size.width;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
