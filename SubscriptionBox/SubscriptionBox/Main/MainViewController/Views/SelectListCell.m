//
//  SelectListCell.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/17.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "SelectListCell.h"

@implementation SelectListCell

-(void)createUI
{
    self.icon = [self.contentView addImageViewWithImage:@"evernote"];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    
    self.title = [self.contentView addLabelWithTitle:@"" font:XFONT(16) textColor:[UIColor blackColor]];
    self.title.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    self.stateImgView = [self.contentView addImageViewWithImage:@"add-1"];
    self.stateImgView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.icon makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    
    [self.title makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.icon.right).offset(16);
    }];
    
    [self.stateImgView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(15, 15));
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
