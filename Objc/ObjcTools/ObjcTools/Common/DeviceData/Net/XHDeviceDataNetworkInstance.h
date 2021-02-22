//
//  XHDeviceDataNetworkInstance.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHDeviceDataNetworkInstance : NSObject


//获取当前网络类型
+ (NSString *)getNetworkType;
//获取当前网络类型
+ (void)getNetworkTypeByReachability:(void(^)(NSString * newwork))reachability;
//获取Wifi信息
+ (id)fetchSSIDInfo;
//获取WIFI名字
+ (NSString *)getWifiSSID;
//获取WIFi的MAC地址
+ (NSString *)getWifiBSSID;
//获取Wifi信号强度
+ (NSString *)getWifiSignalStrength;
//获取设备IP地址
+ (NSString *)getIPAddress;
/// 获取运营商类型
+ (NSString*)carrierName ;


@end

NS_ASSUME_NONNULL_END
