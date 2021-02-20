//
//  UITextField+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)
@dynamic leftMargin, placeholderColor;

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
{
    UITextField *tf = [[UITextField alloc] init];
    tf.placeholder = placeholder;
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.font = [UIFont NFontSize:28];
    
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
{
    UITextField * tf = [self textFieldWithPlaceholder:placeholder];
    tf.leftMargin = leftMargin;
    
    return tf;
}
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                            CornerRadius:(CGFloat)cornerRadius
{
    UITextField * tf = [self textFieldWithPlaceholder:placeholder];
    tf.leftMargin = leftMargin;
    tf.backgroundColor = bgColor;
    tf.layer.cornerRadius = kNewHeight(cornerRadius);
    tf.layer.masksToBounds = YES;
    
    tf.tintColor = UIColor.hex_00D9FF;  //设置光标颜色
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    
    
    return tf;
}
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                            CornerRadius:(CGFloat)cornerRadius
                        PlaceholderColor:(UIColor *)placeholderColor
{
    UITextField * tf = [self textFieldWithPlaceholder:placeholder];
    tf.leftMargin = leftMargin;
    tf.backgroundColor = bgColor;
    tf.layer.cornerRadius = kNewHeight(cornerRadius);
    tf.layer.masksToBounds = YES;
    
    tf.tintColor = UIColor.hex_00D9FF;  //设置光标颜色
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = placeholderColor;
    attributes[NSFontAttributeName] = [UIFont NFontSize:24.f];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                                FontSize:(CGFloat)fontSize
                            CornerRadius:(CGFloat)cornerRadius
                        PlaceholderColor:(UIColor *)placeholderColor
{
    UITextField * tf = [self textFieldWithPlaceholder:placeholder];
    tf.leftMargin = leftMargin;
    tf.backgroundColor = bgColor;
    tf.layer.cornerRadius = kNewHeight(cornerRadius);
    tf.layer.masksToBounds = YES;
    
    tf.tintColor = UIColor.hex_00D9FF;  //设置光标颜色
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = placeholderColor;
    attributes[NSFontAttributeName] = [UIFont NFontSize:24.f];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    
    return tf;
}

- (void)setLeftMargin:(CGFloat)leftMargin {
    
    //文字偏移量
    self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kNewHeight(leftMargin), 0)];
    //设置显示模式为永远显示(默认不显示)
    self.leftViewMode = UITextFieldViewModeAlways;
}






@end
