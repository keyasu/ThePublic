//
//  UIButton+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)

@property (nonatomic, assign) NSTimeInterval wh_eventInterval;

// 直接初始化 btn
+ (instancetype)button ;
// 初始化 btn 带上图片
+ (instancetype)buttonWithImage:(UIImage *)image ;
// 初始化 btn 带上图片 名称
+ (instancetype)buttonWithImg:(NSString *)imgStr ;
+ (instancetype)buttonWithImg:(NSString *)imgStr TitleStr:(NSString *)titleStr;
+ (instancetype)buttonWithImg:(NSString *)imgStr TitleStr:(NSString *)titleStr WithTitleEdges:(UIEdgeInsets)edges;
+ (instancetype)buttonWithImg:(NSString *)imgStr TitleStr:(NSString *)titleStr WithTitleEdges:(UIEdgeInsets)edges FontSize:(CGFloat)fontSize;

//选中图片和正常图片
+ (instancetype)buttonWithNormalImg:(NSString *)imgStr
                        selectedImg:(NSString *)selImg;
// 初始化 btn 带上标题
+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor;

// 初始化 btn 带上标题文字大小
+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                     TitleColor:(UIColor *)titleColor;

+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                     TitleColor:(UIColor *)titleColor
                   NormalImgage:(NSString *)normalImgStr;

+ (instancetype)buttonTitle:(NSString *)title
                 TitleColor:(UIColor *)titleColor
                   FontSize:(CGFloat)fontSize
               CornerRadius:(CGFloat)cornerRadius
            BackgroundColor:(UIColor *)backgroundColor;

// 初始化 btn 带上背景图
+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                    bgImageName:(NSString *)bgImage ;

+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                       FontSize:(CGFloat)fontSize
                    bgImageName:(NSString *)bgImage;
// 初始化 btn 带上标题文字大小
+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                       FontSize:(CGFloat)fontSize
                     tImageName:(NSString *)tImage;

@end

NS_ASSUME_NONNULL_END
