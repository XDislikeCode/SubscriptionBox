//
//  XMainListController.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/5.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XMainListController.h"
#import "MainListCell.h"
#import "XChooseController.h"

@interface XMainListController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UIView *navView;
@property(nonatomic, strong) UILabel *theTitleLabel;
@property(nonatomic, strong) UIButton *addButton;
@property(nonatomic, strong) UIButton *setButton;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation XMainListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

-(void)createUI
{
    __weak __typeof(self)weakSelf = self;
    
    self.navigationView.hidden = YES;
    
    self.navView = [[UIView alloc] init];
    self.navView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    [self.view addSubview:self.navView];
    
    self.theTitleLabel = [self.navView addLabelWithTitle:@"订阅盒" font:XFONT(24) textColor:[UIColor whiteColor]];
    self.theTitleLabel.dk_textColorPicker = DKColorPickerWithKey(TXT);
    
    self.addButton = [self.navView addButtonImageTypeWithImageName:@"add" title:nil];
    [self.addButton addActionHandler:^(NSInteger tag) {
        XChooseController *vc = [[XChooseController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    self.setButton = [self.navView addButtonImageTypeWithImageName:@"set" title:nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.navView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(70);
    }];
    
    [self.theTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navView).offset(12);
        make.top.equalTo(self.navView).offset(30);
    }];
    
    [self.addButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView);
        make.centerY.equalTo(self.titleLabel);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    
    [self.setButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.addButton.mas_left);
        make.centerY.equalTo(self.titleLabel);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.navView.mas_bottom);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    MainListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MainListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
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
