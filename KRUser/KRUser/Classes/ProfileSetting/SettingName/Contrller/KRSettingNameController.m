//
//  KRSettingNameController.m
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRSettingNameController.h"
#import "KRSettingNameView.h"

@interface KRSettingNameController ()

@property (nonatomic, copy) NSString *name;
@end

@implementation KRSettingNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置姓名";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" withTitleColor:RGB(200, 200, 200) withTarget:self withAction:@selector(saveUserName)];
    
    KRSettingNameView *nameView = [[KRSettingNameView alloc] initWithFrame:self.view.bounds];
    WEAK_SELF
    nameView.settingNameBlock = ^(NSString *name) {
        [weakSelf settingName:name];
    };
    [self.view addSubview:nameView];
}

- (void)settingName:(NSString *)name {
    _name = name;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" withTitleColor:name.length ? GLOBAL_COLOR : RGB(200, 200, 200) withTarget:self withAction:@selector(saveUserName)];
}

- (void)saveUserName {
    MLog(@"saveUserName");
}

@end
