//
//  XHDeviceDataLocalInstance.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHDeviceDataLocalInstance : NSObject

//MARK: -  获取设备信息
/// 获取设备所有者的名称
+ (NSString *)device_name;
/// 获取设备的类别
+ (NSString *)device_model;
/// 本地化版本
+ (NSString *)device_localizedModel;
/// 获取当前版本
+ (NSString *)device_systemVersion;
/// 获取当前系统
+ (NSString *)device_systemName;
/// 获取唯一表示符ID
+ (NSString *)device_UUIDString;
/// 检测真机模拟还是模拟器：输出-1为模拟器，输出0-1为真机
+ (double)device_batteryLevel;
/// 获取当前语言
+ (NSString *)device_language;
/// 获取当前的国别
+ (NSString *)device_country;
///获取总内存大小
+ (NSString *)device_memory;
///获取总内存大小 scale
+ (NSString *)device_scale;
///获取总内存大小 scale
+ (NSString *)device_screen;



//MARK: - 获取app的各种信息
/// App应用名称
+ (NSString *)app_displayName;
/// App应用版本 1.2.3
+ (NSString *)app_version;
/// App应用Build版本 122
+ (NSString *)app_Buildversion;
/// App应用唯一标示符
+ (NSString *)app_bundleID;



@end

NS_ASSUME_NONNULL_END
