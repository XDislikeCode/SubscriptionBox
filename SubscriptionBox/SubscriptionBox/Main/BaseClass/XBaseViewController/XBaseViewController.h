//
//  XBaseViewController.h
//  SubscriptionBox
//
//  Created by canoe on 2018/1/5.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBaseViewController : UIViewController

/**
 导航栏View
 */
@property (nonatomic ,strong) UIView *navigationView;

/**
 导航栏是否隐藏
 */
@property (nonatomic ,assign) BOOL navigationViewHidden;

/**
 左边返回按钮
 */
@property (nonatomic ,strong) UIButton *leftBackButton;

/**
 右边按钮数组     按照从左到右的顺序显示
 */
@property (nonatomic ,strong) NSArray <UIButton *>*rightButtonArray;


/**
 标题Label   可以直接设置 self.title = @"XXXXXXX";
 */
@property (nonatomic ,strong) UILabel *titleLabel;

-(void)pressBackBtn;

-(void)updateTitleLabelConstraints;

@end
