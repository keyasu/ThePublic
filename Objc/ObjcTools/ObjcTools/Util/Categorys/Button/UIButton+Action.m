//
//  UIButton+Action.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIButton+Action.h"

@implementation UIButton (Action)


- (void)touchUpInside:(void (^)(void))actionBlock
{
    [[self rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        !actionBlock ?: actionBlock();
    }];
    
}

- (instancetype)touchUpInsideAction:(void (^)(void))actionBlock
{
    [[self rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        !actionBlock ?: actionBlock();
    }];
    return self;
}


@end
