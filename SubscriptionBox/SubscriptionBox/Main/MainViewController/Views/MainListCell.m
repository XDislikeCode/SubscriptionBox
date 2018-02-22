//
//  MainListCell.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/6.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "MainListCell.h"

@implementation MainListCell

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
    
    self.icon = [self.backView addImageViewWithImage:@"evernote"];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    
    self.title = [self.backView addLabelWithTitle:@"印象笔记" font:XFONT(18) textColor:[UIColor whiteColor]];
    self.title.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    self.desc = [self.backView addLabelWithTitle:@"最爱的笔记软件" font:XFONT(13) textColor:[UIColor whiteColor]];
    self.desc.dk_textColorPicker = DKColorPickerWithKey(LTXT);
    
    self.price = [self.backView addLabelWithTitle:@"¥6.0/月" font:XFONT(15) textColor:[UIColor whiteColor]];
    self.price.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    [shadowView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(kRatioWidth(20));
        make.right.equalTo(self.contentView).offset(-kRatioWidth(20));
        make.height.equalTo(80);
    }];
    
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(shadowView);
    }];
    
    [self.icon makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(kRatioWidth(15));
        make.centerY.equalTo(self.backView);
        make.size.equalTo(CGSizeMake(35, 35));
    }];
    
    [self.title makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(kRatioWidth(15));
        make.top.equalTo(self.icon).offset(-5);
    }];
    
    [self.desc makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(kRatioWidth(15));
        make.bottom.equalTo(self.icon).offset(5);
    }];
    
    [self.price makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView).offset(-kRatioWidth(12));
        make.centerY.equalTo(self.backView);
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
