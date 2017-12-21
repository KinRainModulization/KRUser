//
//  KRSettingNicknameView.h
//  KRUser
//
//  Created by LX on 2017/12/20.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRSettingNicknameView : UIView

@property (nonatomic, copy) void (^nicknameChangeBlock)(NSString *nickname);

@end
