//
//  DetailInfoIconCell.h
//  SubscriptionBox
//
//  Created by canoe on 2018/2/22.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XBaseTableViewCell.h"

@interface DetailInfoIconCell : XBaseTableViewCell

@property(nonatomic, strong) UIView *backView;
@property(nonatomic, strong) UIImageView *icon;
@property(nonatomic, strong) UILabel *desc;

@end
