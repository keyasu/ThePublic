//
//  XHDeviceDataLocal.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataLocal.h"

@interface XHDeviceDataLocal ()


@end

@implementation XHDeviceDataLocal

+ (instancetype)shared {
    static XHDeviceDataLocal * insatnce = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        insatnce = [[XHDeviceDataLocal alloc] init];
        insatnce.device = [[UIDevice alloc]init];
        insatnce.dicInfo = [[NSBundle mainBundle] infoDictionary];
        NSLog(@"应用所有信息 %@", insatnce.dicInfo);
    });
    return insatnce;
}


@end
