//
//  UIImage+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)


+ (nullable UIImage *)imageWithName:(NSString *)name {
    if ([name isBlankString]) {
        DLog(@"图片资源为空");
    }
    return [UIImage imageNamed:name];
}

@end
