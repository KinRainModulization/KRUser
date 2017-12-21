//
//  KRMyController.m
//  KRUser
//
//  Created by LX on 2017/12/18.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRMyController.h"
#import "KRMyView.h"
#import "KRProfileSettingController.h"

@interface KRMyController ()
@property (nonatomic, weak) KRMyView *myView;
@end

@implementation KRMyController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    KRMyView *myView = [[KRMyView alloc] initWithFrame:self.view.bounds];
    WEAK_SELF
    myView.personalDataBlock = ^{
        [weakSelf personalDataBtnClick];
    };
    _myView = myView;
    [self.view addSubview:myView];
}

- (void)personalDataBtnClick {
    [self.navigationController pushViewController:[[KRProfileSettingController alloc] init] animated:YES];
}

@end
