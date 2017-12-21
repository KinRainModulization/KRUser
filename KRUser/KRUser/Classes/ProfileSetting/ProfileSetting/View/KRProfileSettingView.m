//
//  KRProfileSettingView.m
//  KRUser
//
//  Created by LX on 2017/12/19.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRProfileSettingView.h"
#import "KRProfileCell.h"

@interface KRProfileSettingView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSources;

@end

@implementation KRProfileSettingView

static NSString * kProfileCellIdentifier = @"kProfileCellIdentifier";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[KRProfileCell class] forCellReuseIdentifier:kProfileCellIdentifier];
        self.backgroundColor = GLOBAL_BACKGROUND_COLOR;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectRowBlock) {
        self.selectRowBlock(indexPath);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionData = self.dataSources[section];
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KRProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:kProfileCellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *sectionData = self.dataSources[indexPath.section];
    NSDictionary *itemData = sectionData[indexPath.row];
    NSString *subtitle = nil;
    NSString *imageURL = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            imageURL = @"url";
        }
        else {
            subtitle = @"Ace";
        }
    }
    [cell cellWithTitle:itemData[@"title"] subtitle:subtitle placeholder:itemData[@"emptyStr"] imageURL:imageURL];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    return 50;
}

- (NSArray *)dataSources {
    if (!_dataSources) {
        _dataSources = @[
                           @[
                             @{@"title":@"头像"},
                             @{@"title":@"昵称"},
                            ],
                           @[
                             @{@"title":@"姓名",@"emptyStr":@"填写真实姓名便于与美容师沟通"},
                             @{@"title":@"性别",@"emptyStr":@"设置性别利于服务"},
                             @{@"title":@"出生日期",@"emptyStr":@"设置出生日期利于服务"},
                            ],
                           @[
                             @{@"title":@"修改密码",@"emptyStr":@"暂未设置密码"},
                             @{@"title":@"修改手机号"},
                            ],
                         ];
    }
    return _dataSources;
}
@end
