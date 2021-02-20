//
//  XHDeviceDataLocalInstance.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataLocalInstance.h"

@interface XHDeviceDataLocalInstance ()

@end

@implementation XHDeviceDataLocalInstance

+ (instancetype)shareInstance {
    static XHDeviceDataLocalInstance * insatnce = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        insatnce = [[XHDeviceDataLocalInstance alloc] init];
    });
    return insatnce;
}



@end
