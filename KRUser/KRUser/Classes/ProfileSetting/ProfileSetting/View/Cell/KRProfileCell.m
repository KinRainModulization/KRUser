//
//  KRProfileCell.m
//  KRUser
//
//  Created by LX on 2017/12/19.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "KRProfileCell.h"
#import <KRArrowIconRowView.h>

@interface KRProfileCell()
@property (nonatomic, weak) KRArrowIconRowView *rowView;
@end

@implementation KRProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        KRArrowIconRowView *rowView = [KRArrowIconRowView rowViewWithSize:CGSizeZero title:@" " subtitle:@" " iconName:nil hiddenArrow:NO];
        _rowView = rowView;
        [self addSubview:rowView];
        [rowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = GRAY_LINE_COLOR;
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.leading.equalTo(self).offset(12);
            make.trailing.equalTo(self).offset(-12);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

- (void)cellWithTitle:(NSString *)title subtitle:(NSString *)subtitle placeholder:(NSString *)placeholder imageURL:(NSString *)imgURL {
    _rowView.title = title;
    if (imgURL) {
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        iconView.layer.cornerRadius = 25;
        iconView.clipsToBounds = YES;
        iconView.backgroundColor = [UIColor grayColor];
        _rowView.subIconView = iconView;
    }
    else if (subtitle) {
        UILabel *label = [UILabel labelWithText:subtitle textColor:FONT_COLOR_33 fontSize:12];
        _rowView.subIconView = label;
    }
    else {
        _rowView.subTitle = placeholder;
    }
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:NO animated:animated];
//}

@end
