//
//  KRSettingNameView.h
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRSettingNameView : UIView

@property (nonatomic, copy) void (^settingNameBlock)(NSString *name);

@end
