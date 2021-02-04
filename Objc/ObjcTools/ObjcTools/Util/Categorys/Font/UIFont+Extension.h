//
//  UIFont+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Extension)

/// 重新设定字体的大小
+ (UIFont *)NFontSize:(CGFloat)fontSize ;
/// 重新设定字体大小 _ 系统粗体
+ (UIFont *)NBFontSize:(CGFloat)fontSize ;

/// UIFontWeightLight字体
+ (UIFont *)NLFontSize:(CGFloat)fontSize;

/// UIFontWeightSemibold字体
+ (UIFont *)NSBFontSize:(CGFloat)fontSize;
/// 设置 MediumFont
+ (UIFont *)fontWith_medium_fontSize:(CGFloat)size;
/// DIN Alternate 字体的大小
+ (UIFont *)fontWith_DINAlternateFont_fontSize:(CGFloat)fontSize;
+ (UIFont *)fontWith_DINAlternateFont_Bold_fontSize:(CGFloat)fontSize;


@end

NS_ASSUME_NONNULL_END
