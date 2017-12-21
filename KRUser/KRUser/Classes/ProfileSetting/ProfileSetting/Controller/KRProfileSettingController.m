//
//  KRProfileSettingController.m
//  KRUser
//
//  Created by LX on 2017/12/19.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRProfileSettingController.h"
#import "KRProfileSettingView.h"
#import "KRSettingNicknameController.h"
#import "KRSettingNameController.h"
#import <LXDatePickerView.h>
#import <LXCustomPickerView.h>

@interface KRProfileSettingController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) KRProfileSettingView *profileSettingView;
@end

@implementation KRProfileSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self.view addSubview:self.profileSettingView];
    WEAK_SELF
    _profileSettingView.selectRowBlock = ^(NSIndexPath *indexPath) {
        [weakSelf selectRow:indexPath];
    };
}

- (void)selectRow:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self handleSelectPhoto];
        }
        else if (indexPath.row == 1) {
            [self handleSelectNickname];
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [self handleSelectName];
        }
        else if (indexPath.row == 1) {
            [self handleSelectGender];
        }
        else if (indexPath.row == 2) {
            [self handleSelectBirth];
        }
    }
    else {
        
    }
}

- (void)handleSelectPhoto {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc]init];
        pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerImage.allowsEditing = YES;
        pickerImage.delegate = self;
        [self presentViewController:pickerImage animated:YES completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc]init];
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImage.allowsEditing = YES;
        pickerImage.delegate = self;
        [self presentViewController:pickerImage animated:YES completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)handleSelectNickname {
    [self.navigationController pushViewController:[[KRSettingNicknameController alloc] init] animated:YES];
}

- (void)handleSelectName {
    [self.navigationController pushViewController:[[KRSettingNameController alloc] init] animated:YES];
}

- (void)handleSelectGender {
    LXCustomPickerView *pickerView = [LXCustomPickerView pickerViewWithDataSource:@[@"男",@"女"] defaultStr:nil valueDidSelect:^(NSString *value) {
        MLog(@"%@",value);
    }];
    [pickerView show];
}

- (void)handleSelectBirth {
    LXDatePickerView *datePickerView = [[LXDatePickerView alloc] initWithInitialDate:nil];
    
    datePickerView.confirmBlock = ^(NSString *city) {
        MLog(@"%@",city);
    };
    [[UIApplication sharedApplication].keyWindow addSubview:datePickerView];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Setter/Getter
- (KRProfileSettingView *)profileSettingView {
    if (!_profileSettingView) {
        _profileSettingView = [[KRProfileSettingView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _profileSettingView;
}
@end
