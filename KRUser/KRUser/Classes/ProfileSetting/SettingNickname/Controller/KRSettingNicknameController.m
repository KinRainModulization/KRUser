//
//  KRSettingNicknameController.m
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRSettingNicknameController.h"
#import "KRSettingNicknameView.h"

@interface KRSettingNicknameController ()
@property (nonatomic, copy) NSString *nickname;
@end

@implementation KRSettingNicknameController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置昵称";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" withTitleColor:RGB(200, 200, 200) withTarget:self withAction:@selector(saveNickname)];
    
    KRSettingNicknameView *nicknameView = [[KRSettingNicknameView alloc] initWithFrame:self.view.bounds];
    WEAK_SELF
    nicknameView.nicknameChangeBlock = ^(NSString *nickname) {
        [weakSelf nicknameChange:nickname];
    };
    [self.view addSubview:nicknameView];
}

- (void)nicknameChange:(NSString *)nickname {
    _nickname = nickname;
    MLog(@"%ld",nickname.length);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" withTitleColor:nickname.length ? GLOBAL_COLOR : RGB(200, 200, 200) withTarget:self withAction:@selector(saveNickname)];
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"错误" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)saveNickname {
    if (!_nickname.length) return;
    
    if (_nickname.length < 4) {
        [self showAlertWithMessage:@"昵称不能少于4个英文或2个汉字"];
        return;
    }
}
@end
