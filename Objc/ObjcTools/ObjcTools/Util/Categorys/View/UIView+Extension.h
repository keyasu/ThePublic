//
//  UIView+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)



+ (instancetype)viewBgColor:(UIColor *)color;


/**
 初始化 view

 @param color 背景颜色
 @param cornerRadius 圆角
 @return  view
 */
+ (instancetype)viewBgColor:(UIColor *)color
               CornerRadius:(CGFloat)cornerRadius ;

/**
 添加 圆角

 @param cornerRadius 圆角大小
 @return 返回 view
 */
- (UIView *)addCornerRadius:(CGFloat)cornerRadius ;


/// 添加 单边圆角
/// @param cornerRadius 圆角大小
/// @param rectCorner 圆角的位置（可组合)
- (void)setCornerRadiusWithRadius:(CGFloat)cornerRadius withRoundingCorner:(UIRectCorner)rectCorner;

/**
 添加 border

 @param borderColor border 的颜色
 @param borderWidth border 的宽
 */
- (void)addBorderWith:(UIColor *)borderColor
          BorderWidth:(CGFloat)borderWidth ;

/**
 延时动画

 @param duration <#duration description#>
 @param delay <#delay description#>
 @param animations <#animations description#>
 @param completion <#completion description#>
 */
+ (void)animateDuration:(NSTimeInterval)duration
                  delay:(NSTimeInterval)delay
             animations:(void (^)(void))animations
             completion:(void (^ __nullable)(BOOL finished))completion ;

+ (void)animateDuration:(NSTimeInterval)duration
             animations:(void (^)(void))animations;

+ (void)animateDuration:(NSTimeInterval)duration
             animations:(void (^)(void))animations
             completion:(void (^ __nullable)(BOOL finished))completion ;



- (UIEdgeInsets)safeArea ;

/**
 给 view 添加 渐变颜色

 @param colors 颜色数组
 @param startPoint 其实位置
 @param endPoint 结束位置
 @param locations 过度的位置
 */
- (void)tintingColor:(NSArray *)colors
          StartPoint:(CGPoint)startPoint
            EndPoint:(CGPoint)endPoint
           Locations:(NSArray<NSNumber *> *)locations ;
/// t添加过度的颜色
- (void)tintingColor:(NSArray *)colors;


/// 添加子vied
/// @param subviews view数组
- (void)weg_addSubviewsWith:(NSArray *)subviews;

/// 添加子 view
/// @param subView 每一个 view
- (void)weg_addSubviews:(UIView *)subView, ... NS_REQUIRES_NIL_TERMINATION;

//动画的缩放
- (void)animationScaleFrom:(CGFloat)fromScale ToScale:(CGFloat)toScale;
- (void)animationScaleFrom:(CGFloat)fromScale ToScale:(CGFloat)toScale RepeatCount:(float)repeatCount;


@end

NS_ASSUME_NONNULL_END
