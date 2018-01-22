//
//  XBaseViewController.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/5.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XBaseViewController.h"
#import "UIView+X.h"
#import "NSString+X.h"

@interface XBaseViewController ()

@end

@implementation XBaseViewController
//更新标题的宽度
-(void)updateTitleLabelConstraints
{
    [self.navigationView layoutIfNeeded];
    
    NSMutableArray *leftViewArray = [NSMutableArray array];
    NSMutableArray *rightViewArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.navigationView.subviews.count; i++) {
        UIView *view = self.navigationView.subviews[i];
        if (view.hidden) {
            continue;
        }
        if (CGRectGetMaxX(view.frame)<KScreenWidth/2 && CGRectGetMinX(view.frame)<KScreenWidth/2) {
            [leftViewArray addObject:@(CGRectGetMaxX(view.frame))];
        }
        if (CGRectGetMaxX(view.frame)>KScreenWidth/2 && CGRectGetMinX(view.frame)>KScreenWidth/2) {
            [rightViewArray addObject:@(CGRectGetMinX(view.frame))];
        }
    }
    CGFloat maxX = 0;
    CGFloat minX = 0;
    if (leftViewArray.count) {
        minX = [[leftViewArray valueForKeyPath:@"@max.floatValue"] floatValue];
    }
    if (rightViewArray.count) {
        maxX = KScreenWidth - [[rightViewArray valueForKeyPath:@"@min.floatValue"] floatValue];
    }
    
    CGFloat bigX = minX >= maxX ? minX : maxX;
    
    [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navigationView).offset(bigX + 20);
        make.right.equalTo(self.navigationView).offset(-bigX - 20);
    }];
    [self.navigationView layoutIfNeeded];
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [self.navigationView addLabelWithTitle:nil font:XFONT(20.0) textColor:[UIColor whiteColor]];
        _titleLabel.dk_textColorPicker = DKColorPickerWithKey(TXT);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.navigationView).offset(25);
            make.centerX.equalTo(self.navigationView);
            make.height.equalTo(40);
            make.left.mas_equalTo(self.leftBackButton.right).offset(20);
            if (self.rightButtonArray.count) {
                make.right.mas_equalTo(self.rightButtonArray.firstObject.left).offset(-20);
            }
        }];
    }
    return _titleLabel;
}

-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.titleLabel.text = title;
}

-(void)setNavigationViewHidden:(BOOL)navigationViewHidden
{
    self.navigationView.hidden = navigationViewHidden;
}

-(void)setRightButtonArray:(NSArray<UIButton *> *)rightButtonArray
{
    //如果本身存在值则从视图中移除
    if (_rightButtonArray.count > 0) {
        for (UIView *view in _rightButtonArray) {
            [view removeFromSuperview];
        }
    }
    
    _rightButtonArray = rightButtonArray;
    for (NSInteger i = rightButtonArray.count - 1; i >= 0; i--) {
        UIButton *button = rightButtonArray[i];
        [button setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [button setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateHighlighted];
        
        CGFloat width = 40;
        if (button.currentTitle.length > 0)
        {
            width = [button.currentTitle widthWithFont:button.titleLabel.font constrainedToHeight:40] + 8;
        }
        [self.navigationView addSubview:button];
        
        UIButton *dependButton = nil;
        if (i != rightButtonArray.count - 1) {
            dependButton = rightButtonArray[i+1];
        }
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(width, 40));
            make.top.equalTo(self.leftBackButton).offset(0);
            if (dependButton)
            {
                make.right.mas_equalTo(dependButton.left).offset(0);
            }
            else
            {
                make.right.mas_equalTo(self.navigationView.right).offset(0);
            }
        }];
    }
//    [self updateTitleLabelConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    
    /** 导航栏 */
    self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 70)];
    self.navigationView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    [self.view addSubview:self.navigationView];
    
    /** 返回按钮 */
    self.leftBackButton = [self.navigationView addButtonImageTypeWithImageName:@"back" title:nil];
    self.leftBackButton.frame = CGRectMake(0, 25, 40, 40);
    
    [self.leftBackButton addTarget:self action:@selector(pressBackBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

-(void)pressBackBtn{
    if (self.navigationController.viewControllers.count <= 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
