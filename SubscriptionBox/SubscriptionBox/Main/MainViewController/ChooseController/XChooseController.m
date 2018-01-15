//
//  XChooseController.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/9.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XChooseController.h"

@interface XChooseController ()

@property(nonatomic, strong) UIButton *searchButton;
@property(nonatomic, strong) UIButton *editButton;

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
    
    self.searchButton = [self.view addButtonImageTypeWithImageName:@"search" title:nil];
    
    self.editButton = [self.view addButtonImageTypeWithImageName:@"edit" title:nil];
    
    self.rightButtonArray = @[self.searchButton,self.editButton];
    
    
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
