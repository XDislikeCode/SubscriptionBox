//
//  XChooseController.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/9.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XChooseController.h"
#import "SelectListCell.h"
#import "DetailInfoController.h"

@interface XChooseController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic, strong) UIButton *searchButton;
@property(nonatomic, strong) UIButton *editButton;

@property(nonatomic, strong) UIView *shadowView;
@property(nonatomic, strong) UIView *selectView;
@property(nonatomic, strong) UIButton *recommendButton;
@property(nonatomic, strong) UIButton *allButton;

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UITableView *recommendTableView;
@property(nonatomic, strong) UITableView *allTableView;

@end

@implementation XChooseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

-(void)createUI
{
    self.title = @"新增订阅";
    __weak __typeof(self)weakSelf = self;
    
    self.searchButton = [self.view addButtonImageTypeWithImageName:@"search" title:nil];
    
    self.editButton = [self.view addButtonImageTypeWithImageName:@"edit" title:nil];
    [self.editButton addActionHandler:^(NSInteger tag) {
        DetailInfoController *vc = [[DetailInfoController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    self.rightButtonArray = @[self.searchButton,self.editButton];
    
    UIView *topView = [[UIView alloc] init];
    topView.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    [self.view addSubview:topView];
    [self.view sendSubviewToBack:topView];
    [topView shadowWithColor:RGBA(100, 100, 100, 0.8) offset:CGSizeMake(0, 3) opacity:0.1 radius:3];
    
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectZero];
    [topView addSubview:shadowView];
    [shadowView shadowWithColor:RGBA(100, 100, 100, 1) offset:CGSizeMake(0, 2) opacity:0.5 radius:5];
    self.shadowView = shadowView;
    
    self.selectView = [[UIView alloc] init];
    self.selectView.dk_backgroundColorPicker = DKColorPickerWithKey(TINT);
    [shadowView addSubview:self.selectView];
    [self.selectView cornerRadius:15 borderWidth:0 color:[UIColor clearColor]];
    
    self.recommendButton = [topView addButtonTextTypeWithTitle:@"推荐" titleColor:[UIColor whiteColor] font:XFONT(14) backColor:[UIColor clearColor]];
    [self.recommendButton dk_setTitleColorPicker:[DKColor colorPickerWithUIColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.recommendButton addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.allButton = [topView addButtonTextTypeWithTitle:@"全部" titleColor:[UIColor blackColor] font:XFONT(14) backColor:[UIColor clearColor]];
    [self.allButton dk_setTitleColorPicker:DKColorPickerWithKey(TINT) forState:UIControlStateNormal];
    [self.allButton addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(KScreenWidth*2, 0);
    self.scrollView.allowPanGestureEventPass = YES;
    
    [self.view sendSubviewToBack:self.scrollView];
    
    self.recommendTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.recommendTableView.delegate = self;
    self.recommendTableView.dataSource = self;
    self.recommendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.recommendTableView];

    self.allTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.allTableView.delegate = self;
    self.allTableView.dataSource = self;
    self.allTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.allTableView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.navigationView.bottom).offset(-10);
        make.height.equalTo(70);
    }];
    
    [self.recommendButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(kRatioWidth(60));
        make.bottom.equalTo(topView).offset(-15);
        make.size.equalTo(CGSizeMake(kRatioWidth(100), 30));
    }];
    
    [self.allButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(kRatioWidth(-60));
        make.bottom.equalTo(topView).offset(-15);
        make.size.equalTo(CGSizeMake(kRatioWidth(100), 30));
    }];
    
    [shadowView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.height.equalTo(self.recommendButton);
        make.width.equalTo(self.recommendButton);
    }];
    
    [self.selectView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(shadowView);
    }];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self.recommendTableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.equalTo(self.scrollView);
        make.width.equalTo(KScreenWidth);
    }];

    [self.allTableView makeConstraints:^(MASConstraintMaker *make) {
        make.height.top.equalTo(self.scrollView);
        make.left.equalTo(self.recommendTableView.right).offset(0);
        make.width.equalTo(KScreenWidth);
    }];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    SelectListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SelectListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.title.text = @"印象笔记";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.recommendButton.x_left == 0) {
        return;
    }
    
    float ratioX = scrollView.contentOffset.x/KScreenWidth;
    float viewX = (self.allButton.x_left - self.recommendButton.x_left) * ratioX;
    [self.shadowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.recommendButton).offset(viewX);
    }];
    
    if (fabsf(viewX) >= kRatioWidth(50)) {
        [self.recommendButton dk_setTitleColorPicker:DKColorPickerWithKey(TINT) forState:UIControlStateNormal];
    }else
    {
        [self.recommendButton dk_setTitleColorPicker:[DKColor colorPickerWithUIColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    }
    
    if (fabs(viewX - (self.allButton.x_left - self.recommendButton.x_left)) >= kRatioWidth(50)) {
        [self.allButton dk_setTitleColorPicker:DKColorPickerWithKey(TINT) forState:UIControlStateNormal];
    }else
    {
        [self.allButton dk_setTitleColorPicker:[DKColor colorPickerWithUIColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    }
    [self.view layoutIfNeeded];
}

-(void)topButtonClick:(UIButton *)button
{
    if ([button isEqual:self.recommendButton]) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else
    {
        [self.scrollView setContentOffset:CGPointMake(KScreenWidth, 0) animated:YES];
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
