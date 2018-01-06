//
//  MainListCell.h
//  SubscriptionBox
//
//  Created by canoe on 2018/1/6.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XBaseTableViewCell.h"

@interface MainListCell : XBaseTableViewCell

@property(nonatomic, strong) UIView *backView;
@property(nonatomic, strong) UIImageView *icon;
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UILabel *desc;
@property(nonatomic, strong) UILabel *price;

@end
