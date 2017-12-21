//
//  KRSettingNicknameView.m
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRSettingNicknameView.h"

@interface KRSettingNicknameView ()

@property (nonatomic, strong) UITextField *nameTextField;

@property (nonatomic, strong) UILabel *promptLabel;
@end


@implementation KRSettingNicknameView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    [self addSubview:self.nameTextField];
    [self addSubview:self.promptLabel];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(40);
    }];
    
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextField.mas_bottom).offset(10);
        make.leading.equalTo(self).offset(12);
    }];
}

- (void)textFieldTextChange:(UITextField *)textField {
    if (textField.text.length > 20) {
        textField.text = [textField.text substringToIndex:20];
    }
    self.nicknameChangeBlock(textField.text);
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [UITextField textFieldWithPlaceholder:@"请输入昵称" fontSize:14 textColor:FONT_COLOR_33 keyboardType:UIKeyboardTypeDefault];
        _nameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 40)];
        _nameTextField.leftViewMode = UITextFieldViewModeAlways;
        _nameTextField.backgroundColor = [UIColor whiteColor];
        [_nameTextField addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _nameTextField;
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [UILabel labelWithText:@"4-20个字符，可由中英文、数字、“-”、“_”组成" textColor:FONT_COLOR_99 fontSize:12];
    }
    return _promptLabel;
}
@end
