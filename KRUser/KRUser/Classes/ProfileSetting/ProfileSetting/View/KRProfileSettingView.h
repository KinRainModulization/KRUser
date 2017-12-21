//
//  KRProfileSettingView.h
//  KRUser
//
//  Created by LX on 2017/12/19.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRProfileSettingView : UITableView

@property (nonatomic, copy) void (^selectRowBlock)(NSIndexPath *indexPath);

@end
