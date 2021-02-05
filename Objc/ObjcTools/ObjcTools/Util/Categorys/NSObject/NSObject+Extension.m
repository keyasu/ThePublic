//
//  NSObject+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

+ (void)showMsg:(NSString *)message
{
    [[XHHUDTools tools] showShortTips:message];
}

@end
