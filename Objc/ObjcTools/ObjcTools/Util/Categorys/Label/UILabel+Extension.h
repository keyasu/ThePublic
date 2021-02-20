//
//  UILabel+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extension)

+ (instancetype)label;

+ (instancetype)labelWithTitle:(NSString *)titleStr ;

+ (instancetype)labelWithTitle:(NSString *)titleStr
                       FontSize:(CGFloat)fontsize ;

/// 初始化自定义字体
/// @param titleStr 文本内容
/// @param fontsize 标准字体大小
/// @param color 字体颜色
+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color ;


/// 初始化自定义字体
/// @param titleStr 文本内容
/// @param font 字体
/// @param hex 字体颜色
+ (instancetype)labelWithTitle:(NSString *)titleStr
                          Font:(UIFont *)font
                         Color:(UIColor *)color;
+ (instancetype)labelWithTitle:(NSString *)titleStr
                          Font:(UIFont *)font
                         Color:(UIColor *)color
                       bgColor:(UIColor *)bgColor;


/// 初始化自定义字体
/// @param titleStr 文本内容
/// @param fontsize 标准字体大小
/// @param color 字体颜色
/// @param bgColor 背景颜色
+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color
               BackgroundColor:(UIColor *)bgColor;

/**
 初始化label

 @param titleStr 标题
 @param fontsize 字体大小
 @param hex 字体颜色
 @param hexbg 背景颜色
 @param textAlignment 字体的对齐方式
 @return 返回 label
 */
+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color
               BackgroundColor:(UIColor *)bgColor
                 TextAlignment:(NSTextAlignment)textAlignment;




/**
 计算单行文字的size
 
 @parms  文本
 @parms  字体
 @return  字体的CGSize
 */
- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font ;
/**
 计算多行文字的CGRect
 
 @parms  文本
 @parms  字体
 @return  字体的CGRect
 */

- (CGRect)boundingRectWithString:(NSString *)str withSize:(CGSize)size withFont:(UIFont *)font ;



/**
 读取宽度

 @param str 内容的多少a
 @param width 现在的宽度
 @return 返回文案的高度
 */
- (CGFloat)getSpaceLabelHeight:(NSString *)str withWidh:(CGFloat)width ;





@end

NS_ASSUME_NONNULL_END
