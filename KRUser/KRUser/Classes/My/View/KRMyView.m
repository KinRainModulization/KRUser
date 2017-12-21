//
//  KRMyView.m
//  KRUser
//
//  Created by LX on 2017/12/18.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRMyView.h"
#import <KRArrowIconRowView.h>

@interface KRMyView()
@property (nonatomic, strong) NSArray *orderArray;
@property (nonatomic, strong) NSArray *optionArray;
@property (nonatomic, strong) UIButton *personalDataBtn;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation KRMyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    UIView *contentView = [[UIView alloc] init];
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView *arrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right_blue"]];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headView.height-0.5, headView.width, 0.5)];
    lineView.backgroundColor = GRAY_LINE_COLOR;
    
    UIView *orderView = [[UIView alloc] init];
    orderView.backgroundColor = [UIColor whiteColor];
    
    UIView *menuView = [[UIView alloc] init];
    
    [self addSubview:scrollView];
    [scrollView addSubview:contentView];
    [contentView addSubview:headView];
    [headView addSubview:self.personalDataBtn];
    [_personalDataBtn addSubview:self.iconImgView];
    [_personalDataBtn addSubview:self.nameLabel];
    [_personalDataBtn addSubview:arrowImgView];
    [headView addSubview:lineView];
    [contentView addSubview:orderView];
    [contentView addSubview:menuView];

    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.width.equalTo(scrollView);
    }];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(135+STATUS_BAR_HEIGHT);
    }];
    [_personalDataBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView).offset(STATUS_BAR_HEIGHT+40);
        make.leading.trailing.equalTo(headView);
        make.height.equalTo(@70);
    }];
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_personalDataBtn).offset(12);
        make.top.bottom.equalTo(_personalDataBtn);
        make.width.equalTo(@70);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_personalDataBtn);
        make.leading.equalTo(_iconImgView.mas_trailing).offset(25);
    }];
    [arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_personalDataBtn);
        make.trailing.equalTo(_personalDataBtn).offset(-12);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(headView).offset(12);
        make.trailing.equalTo(headView).offset(-12);
        make.bottom.equalTo(headView);
        make.height.mas_equalTo(0.5);
    }];
    [orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_bottom);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(80);
    }];
    
    CGFloat btnW = SCREEN_WIDTH * 0.25;
    CGFloat btnH = 80;
    CGFloat btnSpace = 5;
    for (int i = 0; i < self.orderArray.count; i++) {
        NSDictionary *item = _orderArray[i];
        UIButton *button = [UIButton buttonWithTitle:item[@"title"] fontSize:12 titleColor:FONT_COLOR_33 target:self action:@selector(orderItemClick:)];
        [button setImage:[UIImage imageNamed:item[@"icon"]] forState:UIControlStateNormal];
        button.frame = CGRectMake(i*btnW, 0, btnW, btnH);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [button setTitleEdgeInsets:UIEdgeInsetsMake(button.imageView.height+btnSpace,-button.imageView.width, 0,0)];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-(button.titleLabel.height+btnSpace), 0,0, -button.titleLabel.width)];
        button.tag = i+1;
        [orderView addSubview:button];
    }
    
    CGFloat optionBtnY = 0;
    CGFloat optionBtnH = 50;

    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderView.mas_bottom).offset(10);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(self.optionArray.count*optionBtnH);
    }];
    
    for (int i = 0; i < self.optionArray.count; i++) {
        NSDictionary *item = _optionArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor =[UIColor redColor];
        button.frame = CGRectMake(0, optionBtnY, SCREEN_WIDTH, optionBtnH);
        button.tag = i+1;
        [button addTarget:self action:@selector(optionItemButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        KRArrowIconRowView *arrowRow = [KRArrowIconRowView rowViewWithSize:button.size title:item[@"title"] subtitle:nil iconName:item[@"iconSource"] hiddenArrow:NO];
        [button addSubview:arrowRow];
        [menuView addSubview:button];
        optionBtnY += optionBtnH;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(menuView.mas_bottom);
    }];
}

//- (UIButton *)createVerticalButton:(NSDictionary *)dict {
//    UIButton *button = [UIButton buttonWithTitle:dict[@"title"] fontSize:12 titleColor:FONT_COLOR_33 target:self action:@selector(orderItemClick:)];
//    [button setImage:[UIImage imageNamed:dict[@"icon"]] forState:UIControlStateNormal];
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    [button setTitleEdgeInsets:UIEdgeInsetsMake(button.imageView.height+kButtonSpace,-button.imageView.width, 0,0)];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(-(button.titleLabel.height+kButtonSpace), 0,0, -button.titleLabel.width)];
//    return button;
//}

#pragma mark - Action

- (void)optionItemButtonClick:(UIButton *)button {
    MLog(@"optionItemButtonClick=%ld",button.tag);
}

- (void)orderItemClick:(UIButton *)button {
    MLog(@"tag=%ld",button.tag);
}

- (void)personalDataButtonClick {
    self.personalDataBlock();
}

#pragma mark - Setter/Getter
- (NSArray *)orderArray {
    if (!_orderArray) {
        _orderArray = @[
                        @{@"title":@"全部订单",@"icon":@"ic_all_ord"},
                        @{@"title":@"待付款",@"icon":@"ic_unpaid_ord"},
                        @{@"title":@"已付款",@"icon":@"ic_paid_ord"},
                        @{@"title":@"退款",@"icon":@"ic_refund_ord"},
                        ];
    }
    return _orderArray;
}

- (NSArray *)optionArray {
    if (!_optionArray) {
        _optionArray = @[
                         @{@"title":@"设置",@"iconSource":@"ic_settings"},
                         ];
    }
    return _optionArray;
}

- (UIButton *)personalDataBtn {
    if (!_personalDataBtn) {
        _personalDataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_personalDataBtn addTarget:self action:@selector(personalDataButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personalDataBtn;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"def_avatar"]];
        _iconImgView.layer.cornerRadius = 35;
        _iconImgView.clipsToBounds = YES;
    }
    return _iconImgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithText:@"去登录" textColor:FONT_COLOR_33 fontSize:16];
        _nameLabel.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:16];
    }
    return _nameLabel;
}
@end
