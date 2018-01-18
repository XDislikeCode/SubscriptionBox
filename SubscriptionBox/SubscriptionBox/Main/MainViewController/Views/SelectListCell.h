//
//  SelectListCell.h
//  SubscriptionBox
//
//  Created by canoe on 2018/1/17.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XBaseTableViewCell.h"

@interface SelectListCell : XBaseTableViewCell

@property(nonatomic, strong) UIImageView *icon;
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UIImageView *stateImgView;

@end
