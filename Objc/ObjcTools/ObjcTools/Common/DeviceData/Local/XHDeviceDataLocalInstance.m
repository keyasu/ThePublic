//
//  XHDeviceDataLocalInstance.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataLocalInstance.h"
#import "XHDeviceDataLocal.h"


@interface XHDeviceDataLocalInstance ()


@end

@implementation XHDeviceDataLocalInstance


//MARK: -  获取设备信息
/// 获取设备所有者的名称
+ (NSString *)device_name {
    NSLog(@"设备所有者名称：%@", [XHDeviceDataLocal shared].device.name);
    
    return [XHDeviceDataLocal shared].device.name;
}
/// 获取设备的类别
+ (NSString *)device_model {
    NSLog(@"设备类别：%@", [XHDeviceDataLocal shared].device.model);
    return [XHDeviceDataLocal shared].device.model;
}
/// 本地化版本
+ (NSString *)device_localizedModel {
    NSLog(@"本地化版本：%@", [XHDeviceDataLocal shared].device.localizedModel);
    return [XHDeviceDataLocal shared].device.localizedModel;
}
/// 获取当前版本
+ (NSString *)device_systemVersion {
    NSLog(@"本地化版本：%@", [XHDeviceDataLocal shared].device.systemVersion);
    return [XHDeviceDataLocal shared].device.systemVersion;
}
/// 获取当前系统
+ (NSString *)device_systemName {
    NSLog(@"本地化版本：%@", [XHDeviceDataLocal shared].device.systemName);
    return [XHDeviceDataLocal shared].device.systemName;
}
/// 获取唯一表示符ID
+ (NSString *)device_UUIDString {
    NSString * uuidStr = [[[UIDevice currentDevice ] identifierForVendor] UUIDString];
    NSLog(@"系统唯一标示符  %@", uuidStr);
    return uuidStr;
}
/// 检测真机模拟还是模拟器：输出-1为模拟器，输出0-1为真机
+ (double)device_batteryLevel {
    //    检测真机模拟还是模拟器：输出-1为模拟器，输出0-1为真机    
    return [[XHDeviceDataLocal shared] getCurrentBatteryLevel];
}

/// 获取当前语言
+ (NSString *)device_language {
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    NSLog(@"语言：%@", language);
    return language;
}
/// 获取当前的国别
+ (NSString *)device_country {
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    NSLog(@"国家：%@", country); //国别
    return country;
}
///获取总内存大小
+ (NSString *)device_memory
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];

    NSNumber *freeber = [fattributes objectForKey:NSFileSystemFreeSize];
    NSNumber *maxber = [fattributes objectForKey:NSFileSystemSize];

    long long freespace = [freeber longLongValue];
    long long maxspace = [maxber longLongValue];

    NSString * sizeStr = [NSString stringWithFormat:@"剩余空间%0.1fG / 共%0.1fG",(double)freespace/1024/1024/1024,(double)maxspace/1024/1024/1024];
    return sizeStr;

}
///获取总内存大小 scale
+ (NSString *)device_scale {
    //2、获得scale：
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    return [NSString stringWithFormat:@"%.0f", scale_screen];
    
}
///获取总内存大小 scale
+ (NSString *)device_screen {
    //1、得到当前屏幕的尺寸：
    CGRect rect_screen = [[UIScreen mainScreen] bounds];
    CGSize size_screen = rect_screen.size;
    
    //2、获得scale：
    CGFloat scale_screen = [UIScreen mainScreen].scale;

    //3 、获取分辨率
    CGFloat width = size_screen.width*scale_screen;
    CGFloat height = size_screen.height*scale_screen;
    
    return [NSString stringWithFormat:@"%.0fx%.0f", width, height];
}



//MARK: - 获取app的各种信息
/// App应用名称
+ (NSString *)app_displayName {
    NSString *strAppName = [[XHDeviceDataLocal shared].dicInfo stringForKey:@"CFBundleDisplayName"];
    NSLog(@"App应用名称：%@", strAppName);
    return strAppName;
}
/// App应用版本 1.2.3
+ (NSString *)app_version {
    NSString *strAppVersion = [[XHDeviceDataLocal shared].dicInfo stringForKey:@"CFBundleShortVersionString"];
    NSLog(@"App应用版本：%@", strAppVersion);
    return strAppVersion;
}
/// App应用Build版本 122
+ (NSString *)app_Buildversion {
    NSString *strAppBuild = [[XHDeviceDataLocal shared].dicInfo objectForKey:@"CFBundleVersion"];
    NSLog(@"App应用Build版本：%@", strAppBuild);
    return strAppBuild;
}
/// App应用唯一标示符
+ (NSString *)app_bundleID {
    NSString *strAppBundleIdentifier = [[XHDeviceDataLocal shared].dicInfo objectForKey:@"CFBundleIdentifier"];
    NSLog(@"App应用唯一标示符：%@", strAppBundleIdentifier);
    return strAppBundleIdentifier;
}







@end
