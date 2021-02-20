//
//  UITextField+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extension)

/// 占位符
@property (nonatomic, strong) UILabel *placeholderColor;

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder ;

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder LeftMargin:(CGFloat)leftMargin;
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                            CornerRadius:(CGFloat)cornerRadius;

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                            CornerRadius:(CGFloat)cornerRadius
                        PlaceholderColor:(UIColor *)placeholderColor;

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                              LeftMargin:(CGFloat)leftMargin
                                 BgColor:(UIColor *)bgColor
                                FontSize:(CGFloat)fontSize
                            CornerRadius:(CGFloat)cornerRadius
                        PlaceholderColor:(UIColor *)placeholderColor;


/// 左边占位符的位置大小
@property (nonatomic, assign) CGFloat leftMargin;


@end

NS_ASSUME_NONNULL_END
