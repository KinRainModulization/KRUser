//
//  KRSettingNameView.m
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRSettingNameView.h"

@interface KRSettingNameView ()

@property (nonatomic, strong) UITextField *nameTextField;

@end

@implementation KRSettingNameView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    [self addSubview:self.nameTextField];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.leading.trailing.equalTo(self);
        make.height.mas_equalTo(40);
    }];

}

- (void)textFieldTextChange:(UITextField *)textField {
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
    }
    self.settingNameBlock(textField.text);
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [UITextField textFieldWithPlaceholder:@"请输入姓名" fontSize:14 textColor:FONT_COLOR_33 keyboardType:UIKeyboardTypeDefault];
        _nameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 40)];
        _nameTextField.leftViewMode = UITextFieldViewModeAlways;
        _nameTextField.backgroundColor = [UIColor whiteColor];
        [_nameTextField addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _nameTextField;
}

@end
