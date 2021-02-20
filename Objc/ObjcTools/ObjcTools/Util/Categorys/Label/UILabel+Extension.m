//
//  UILabel+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (instancetype)label {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)titleStr {
    return [self labelWithTitle:titleStr
                       FontSize:32.f
                          Color:UIColor.hex_333333
                BackgroundColor:UIColor.hex_FFFFFF
                  TextAlignment:(NSTextAlignmentLeft)];
    
}
+ (instancetype)labelWithTitle:(NSString *)titleStr
                   FontSize:(CGFloat)fontsize {
    return [self labelWithTitle:titleStr
                       FontSize:fontsize
                          Color:UIColor.hex_333333
                BackgroundColor:UIColor.hex_FFFFFF
                  TextAlignment:(NSTextAlignmentLeft)];
    
}

+ (instancetype)labelWithTitle:(NSString *)titleStr
                          Font:(UIFont *)font
                         Color:(UIColor *)color {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = titleStr;
    label.textColor = color;
    label.backgroundColor = [UIColor whiteColor];
    label.font = font;
     
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)titleStr
                          Font:(UIFont *)font
                         Color:(UIColor *)color
                       bgColor:(UIColor *)bgColor
{
    UILabel *label = [[UILabel alloc] init];
    label.text = titleStr;
    label.textColor = color;
    label.backgroundColor = bgColor;
    label.font = font;
     
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color
{
    return [self labelWithTitle:titleStr
                       FontSize:fontsize
                          Color:color
                BackgroundColor:UIColor.hex_FFFFFF
                  TextAlignment:(NSTextAlignmentLeft)];
    
}
+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color
               BackgroundColor:(UIColor *)bgColor
{
    UILabel *label = [[UILabel alloc] init];
    label.text = titleStr;
    label.textColor = color;
    label.backgroundColor = bgColor;
    label.font = [UIFont NFontSize:fontsize];
     
    return label;
}


+ (instancetype)labelWithTitle:(NSString *)titleStr
                      FontSize:(CGFloat)fontsize
                         Color:(UIColor *)color
               BackgroundColor:(UIColor *)bgColor
                 TextAlignment:(NSTextAlignment)textAlignment;
{
    UILabel *label = [[UILabel alloc] init];
    label.text = titleStr;
    label.textColor = color;
    label.backgroundColor = bgColor;
    label.font = [UIFont NFontSize:fontsize];
    
    label.textAlignment = textAlignment;
    
    
    return label;
}


/**
 
 计算单行文字的size
 
 @parms  文本
 
 @parms  字体
 
 @return  字体的CGSize
 
 */

- (CGSize)sizeWithText:(NSString *)text withFont:(UIFont *)font
{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

/*
 计算多行文字的CGRect
 @parms  文本
 @parms  字体
 @return  字体的CGRect
 */

- (CGRect)boundingRectWithString:(NSString *)str withSize:(CGSize)size withFont:(UIFont *)font
{
    CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    
    return rect;
}


- (CGFloat)getSpaceLabelHeight:(NSString *)str withWidh:(CGFloat)width
{
    
    NSMutableParagraphStyle *paragphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragphStyle.lineSpacing = 0;//设置行距为0
    paragphStyle.firstLineHeadIndent = 0.0;
    paragphStyle.hyphenationFactor = 0.0;
    paragphStyle.paragraphSpacingBefore = 0.0;
    
    NSDictionary *dic=@{
                        NSFontAttributeName:[UIFont NFontSize:22], NSParagraphStyleAttributeName:paragphStyle, NSKernAttributeName:@1.0f
                        };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
    
}

@end

