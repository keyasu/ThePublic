//
//  XHMarketManager.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//传入一个px尺寸  输出一个按照屏幕适配的尺寸
#define KNewSize(pxSize) [[MarketManager showMarketManager] translationSize:pxSize]

//默认的设计尺寸 - 不考虑放大的情况
#define DefuleWidth  375.0
#define DefuleHeight 667.0

#define kNewWidth(pxSize) [[XHMarketManager showMarketManager] translatWidth:pxSize]
#define kNewHeight(pxSize) [[XHMarketManager showMarketManager] translatHeight:pxSize]
#define kNewRealHeight(pxSize) [[XHMarketManager showMarketManager] translatRealHeight:pxSize]
//
//放大模式下的 放大比例
#define EnlargingScale 1.0


NS_ASSUME_NONNULL_BEGIN

@interface XHMarketManager : NSObject


+ (instancetype)showMarketManager;


/// 宽度是和高度配合的
/// @param width 相对的宽度, 一般是像素
- (CGFloat)translatWidth:(CGFloat)width;


/// 宽度是和高度配合的
/// @param height 相对的高度, 一般是像素
- (CGFloat)translatHeight:(CGFloat)height;

/// 获取真实的高度
/// @param height 高度
- (CGFloat)translatRealHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
