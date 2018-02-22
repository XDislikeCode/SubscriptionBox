//
//  DetailInfoIconCell.m
//  SubscriptionBox
//
//  Created by canoe on 2018/2/22.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "DetailInfoIconCell.h"

@implementation DetailInfoIconCell

-(void)createUI
{
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:shadowView];
    [shadowView shadowWithColor:RGBA(100, 100, 100, 1) offset:CGSizeMake(0, 2) opacity:0.15 radius:5];
    
    self.backView = [[UIView alloc] initWithFrame:CGRectZero];
    self.backView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    //    self.backView.backgroundColor = RGBA(109, 99, 99, 1);
    [shadowView addSubview:self.backView];
    [self.backView cornerRadius:9 borderWidth:0 color:[UIColor clearColor]];
    
    UIView *iconView = [[UIView alloc] init];
    [self.backView addSubview:iconView];
    
    UIView *line = [[UIView alloc] init];
    [self.backView addSubview:line];
    line.dk_backgroundColorPicker = DKColorPickerWithKey(LINE);
    
    UIView *descView = [[UIView alloc] init];
    [self.backView addSubview:descView];
    
    UILabel *iconLabel = [iconView addLabelWithTitle:@"图标" font:XFONT(14) textColor:[UIColor blackColor]];
    iconLabel.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    self.icon = [iconView addImageViewWithImage:@"evernote"];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    
    UILabel *desclabel = [descView addLabelWithTitle:@"描述" font:XFONT(14) textColor:[UIColor blackColor]];
    desclabel.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    self.desc = [descView addLabelWithTitle:@"¥6.0/月" font:XFONT(14) textColor:[UIColor blackColor]];
    self.desc.dk_textColorPicker = DKColorPickerWithKey(LTXT);
    
    [shadowView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(self.contentView).offset(kRatioWidth(20));
        make.right.equalTo(self.contentView).offset(-kRatioWidth(20));
        make.height.equalTo(90);
    }];
    
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(shadowView);
    }];
    
    [iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.backView).offset(0);
        make.height.equalTo(45);
    }];
    
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView.bottom).offset(0);
        make.left.equalTo(self.backView).offset(kRatioWidth(15));
        make.right.equalTo(self.backView).offset(-kRatioWidth(20));
        make.height.equalTo(0.5);
    }];
    
    [descView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.backView).offset(0);
        make.height.equalTo(45);
    }];
    
    [iconLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView);
        make.left.equalTo(iconView).offset(kRatioWidth(15));
    }];
    
    [self.icon makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView);
        make.right.equalTo(iconView).offset(-kRatioWidth(15));
        make.size.equalTo(CGSizeMake(kRatioWidth(19), kRatioWidth(19)));
    }];
    
    [desclabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(descView);
        make.left.equalTo(descView).offset(kRatioWidth(15));
    }];
    
    [self.desc makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(descView);
        make.right.equalTo(descView).offset(-kRatioWidth(15));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
