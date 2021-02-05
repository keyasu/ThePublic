//
//  UIResponder+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIResponder+Extension.h"

@implementation UIResponder (Extension)

- (void)showMsg:(NSString *)message
{
    [[XHHUDTools tools] showShortTips:message];
}


@end
