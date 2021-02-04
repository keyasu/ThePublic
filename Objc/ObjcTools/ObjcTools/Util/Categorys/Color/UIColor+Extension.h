//
//  UIColor+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIColor (Extension)
/**
 *  @brief  渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor *)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

/// 获取渐变色, 获取之前的父视图  的 frame需要能获取到
+ (UIColor *)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

+ (UIColor *)colorSolidWith:(NSInteger)integer;
+ (UIColor *)colorSolidWith:(NSInteger)integer alpha:(CGFloat)alpha;

/// 获取颜色的值 可以是如下:  0xFFFFFF
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;

/// 获取颜色的值 可以是如下: #RGB  #ARGB  #RRGGBB  #AARRGGBB
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

- (NSString *)HEXString;

/// 设置渐变颜色（hex颜色）
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(UInt32)fromHexColorStr toColor:(UInt32)toHexColorStr startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/// 设置渐变颜色（UIColor颜色）
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromUIColor:(UIColor *)fromColor toUIColor:(UIColor *)toColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/// 获得一个渐变颜色
+ (UIColor *)getGradualColorWith:(UIView *)view fromUIColor:(UIColor *)fromColor toUIColor:(UIColor *)toColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/**
 随机颜色

 @return 颜色
 */
+ (UIColor *)randomColor ;


@end

