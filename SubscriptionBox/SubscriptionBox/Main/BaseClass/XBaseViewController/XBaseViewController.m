//
//  XBaseViewController.m
//  SubscriptionBox
//
//  Created by canoe on 2018/1/5.
//  Copyright © 2018年 canoe. All rights reserved.
//

#import "XBaseViewController.h"

@interface XBaseViewController ()

@end

@implementation XBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
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
