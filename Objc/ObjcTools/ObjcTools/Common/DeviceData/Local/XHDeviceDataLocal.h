//
//  XHDeviceDataLocal.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHDeviceDataLocal : NSObject

+ (instancetype)shared;

/// 设备信息
@property (nonatomic, strong) UIDevice *device;
/// app的信息
@property (nonatomic, strong) NSDictionary *dicInfo;

- (double)getCurrentBatteryLevel;


@end

NS_ASSUME_NONNULL_END
