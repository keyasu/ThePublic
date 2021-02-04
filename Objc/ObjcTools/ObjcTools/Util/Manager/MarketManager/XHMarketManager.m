//
//  XHMarketManager.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHMarketManager.h"
#import "sys/utsname.h"

//各个机型默认宽度大小
#define Defule4PhoneWidth     320.0
#define Defule5PhoneWidth     320.0
#define Defule6PhoneWidth     375.0
#define Defule6PlusPhoneWidth 414.0
/*
 iPhone 3GS 3.5 320x480 @1x 320x480 163
 iPhone 4/4s 3.5 320x480 @2x 640×960 330
 iPhone 5/5s/5c 4.0 320x568 @2x 640×1136 326
 iPhone SE 4.0 320×568 @2x 640×1136 326
 iPhone 6 4.7 375x667 @2x 750×1334 326
 iPhone 6s 4.7 375x667 @2x 750×1334 326
 iPhone 7 4.7 375x667 @2x 750×1334 326
 iPhone 8 4.7 375×667 @2x 750×1334 326
 iPhone 6Plus 5.5 414x736 @3x 1242x2208 401 1080x1920
 iPhone 6sPlus 5.5 414x736 @3x 1242x2208 401 1080x1920
 iPhone 7Plus 5.5 414x736 @3x 1242x2208 401 1080x1920
 iPhone 8 Plus 5.5 414×736 @3x 1242x2208 401 1080x1920
 iPhone XR 6.1 414x896 @2x 828x1792 326
 iPhone X 5.8 375x812 @3x 1125x2436 458
 iPhone Xs 5.8 375x812 @3x 1125x2436 458
 iPhone XMax 6.5 736x1344 @3x 1242x2688 458
 iPhone 11 414x896
 iPhone 11Pro 375x812
 iPhone 11ProMax 414x896

 
 */

@interface XHMarketManager ()

@end

@implementation XHMarketManager


static id _showMarketManagerInstance;
+ (instancetype)showMarketManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _showMarketManagerInstance = [[[self class] alloc] init];
    });
    return _showMarketManagerInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}



//暂不考虑x3的情况 认为只有一个设计 否则需要几套设计

/// 由于实际设计 宽度是和高度配合的  所以这里的宽度只适合做view外部的计算.如果距离屏幕边框多多少
/// @param width 需要的宽度是多少
- (CGFloat)translatWidth:(CGFloat)width
{
    return (kScreenW/DefuleWidth)*(width/2);
}

//根据宽度比例计算出高度 不能以实际屏幕屏幕比较 因为屏幕宽度一直 高度不一定一致或则说 view会变形
- (CGFloat)translatHeight:(CGFloat)height
{
    return (kScreenW/DefuleWidth)*(height/2);
}

/**
 *  高度Jason 由于实际设计 宽度是和高度配合的  所以这里的高度只适合做view外部的计算.如果距离屏幕边框多多少
 *
 *  @param height
 *
 *  @return <#return value description#>
 */
- (CGFloat)translatRealHeight:(CGFloat)height
{
    return (kScreenH/DefuleHeight)*(height/2);
}

@end
