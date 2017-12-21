//
//  Target_KRMy.m
//  KRUser
//
//  Created by LX on 2017/12/21.
//  Copyright © 2017年 Ace. All rights reserved.
//

#import "Target_KRMy.h"
#import "KRMyController.h"

@implementation Target_KRMy

- (UIViewController *)Action_MyViewController:(NSDictionary *)params {
    KRMyController *myVC = [[KRMyController alloc] init];
    return myVC;
}

@end
