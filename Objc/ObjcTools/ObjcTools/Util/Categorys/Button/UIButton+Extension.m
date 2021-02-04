//
//  UIButton+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIButton+Extension.h"

#import <objc/runtime.h>

#define eventInterval 1.5

@interface UIButton ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end

@implementation UIButton (Extension)

static char * const wh_eventIntervalKey = "wh_eventIntervalKey";
static char * const eventUnavailableKey = "eventUnavailableKey";

+ (instancetype)button
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn.titleLabel setFont:[UIFont NFontSize:28]];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}
+ (instancetype)buttonWithImage:(UIImage *)image
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:image forState:(UIControlStateNormal)];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}
+ (instancetype)buttonWithImg:(NSString *)imgStr
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:imgStr] forState:(UIControlStateNormal)];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
}
+ (instancetype)buttonWithImg:(NSString *)imgStr TitleStr:(NSString *)titleStr
{
    UIButton * btn = [self buttonWithImg:imgStr TitleStr:titleStr TitleColor:UIColor.hex_FFFFFF FontSize:32];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
    return btn;
}
+ (instancetype)buttonWithImg:(NSString *)imgStr TitleStr:(NSString *)titleStr WithTitleEdges:(UIEdgeInsets)edges
{
    UIButton * btn = [self buttonWithImg:imgStr TitleStr:titleStr TitleColor:UIColor.hex_FFFFFF FontSize:32];
    btn.titleEdgeInsets = edges;
    return btn;
}
+ (instancetype)buttonWithImg:(NSString *)imgStr
                     TitleStr:(NSString *)titleStr
               WithTitleEdges:(UIEdgeInsets)edges
                     FontSize:(CGFloat)fontSize
{
    
    UIButton * btn = [self buttonWithImg:imgStr TitleStr:titleStr TitleColor:UIColor.hex_FFFFFF FontSize:32];
    btn.titleEdgeInsets = edges;
    btn.titleLabel.font = [UIFont NFontSize:fontSize];
    return btn;
}
+ (instancetype)buttonWithImg:(NSString *)imgStr
                     TitleStr:(NSString *)titleStr
                   TitleColor:(UIColor *)titleColor
                     FontSize:(CGFloat)fontSize {
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setBackgroundImage:[UIImage imageNamed:imgStr] forState:(UIControlStateNormal)];
    
    [btn setTitle:titleStr forState:(UIControlStateNormal)];
    [btn.titleLabel setFont:[UIFont NFontSize:fontSize]];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    
    btn.wh_eventInterval = eventInterval;
    
    return btn;
    
}


+ (instancetype)buttonWithNormalImg:(NSString *)imgStr
                        selectedImg:(NSString *)selImg
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setImage:[UIImage imageNamed:imgStr] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:selImg] forState:(UIControlStateSelected)];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    [btn.titleLabel setFont:[UIFont NFontSize:28]];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}

+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                     TitleColor:(UIColor *)titleColor
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont NFontSize:fontSize];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}

+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                     TitleColor:(UIColor *)titleColor
                   NormalImgage:(NSString *)normalImgStr
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont NFontSize:fontSize];
    [btn setImage:[UIImage imageNamed:normalImgStr] forState:(UIControlStateNormal)];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}

+ (instancetype)buttonTitle:(NSString *)title
                 TitleColor:(UIColor *)titleColor
                   FontSize:(CGFloat)fontSize
               CornerRadius:(CGFloat)cornerRadius
            BackgroundColor:(UIColor *)backgroundColor
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont NFontSize:fontSize];
    
    btn.layer.cornerRadius = kNewWidth(cornerRadius);
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = backgroundColor;
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}


+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                    bgImageName:(NSString *)bgImage
{

    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    if (bgImage.length > 0) {
        [btn setBackgroundImage:[UIImage imageWithName:bgImage] forState:(UIControlStateNormal)];
    }
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    [btn.titleLabel setFont:[UIFont NFontSize:28]];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}
+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                     FontSize:(CGFloat)fontSize
                    bgImageName:(NSString *)bgImage
{

    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    if (bgImage.length > 0) {
        [btn setBackgroundImage:[UIImage imageWithName:bgImage] forState:(UIControlStateNormal)];
    }
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    [btn.titleLabel setFont:[UIFont NFontSize:fontSize]];
    
    btn.wh_eventInterval = eventInterval;
    return btn;
    
}
// 初始化 btn 带上标题文字大小
+ (instancetype)buttonWithTitle:(NSString *)title
                     TitleColor:(UIColor *)titleColor
                       FontSize:(CGFloat)fontSize
                     tImageName:(NSString *)tImage
{
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont NFontSize:fontSize];
    btn.imageView.image = [UIImage imageWithName:tImage];
    
    btn.wh_eventInterval = eventInterval;
    
    return btn;
}



#pragma mark - 延时操作
+ (void)load
{
    SEL originalSel = @selector(sendAction:to:forEvent:);
    SEL wh_Sel = @selector(wh_sendAction:to:forEvent:);
    Method method = class_getInstanceMethod(self, originalSel);
    Method wh_menthod = class_getInstanceMethod(self, wh_Sel);
    
    BOOL didAddMethod = class_addMethod([self class], originalSel, method_getImplementation(wh_menthod), method_getTypeEncoding(wh_menthod));
    if (didAddMethod) {
        class_replaceMethod([self class], wh_Sel, method_getImplementation(method), method_getTypeEncoding(method));
    }
    else {
        method_exchangeImplementations(method, wh_menthod);
    }
}

#pragma mark - Action functions

- (void)wh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if ([self isMemberOfClass:[UIButton class]]) {
        if (self.eventUnavailable == NO) {
            self.eventUnavailable = YES;
            [self wh_sendAction:action to:target forEvent:event];
            [self performSelector:@selector(setEventUnavailable:) withObject:0 afterDelay:self.wh_eventInterval];
        }
    }else {
        [self wh_sendAction:action to:target forEvent:event];
    }
    
}

#pragma mark - Setter & Getter functions

- (NSTimeInterval)wh_eventInterval
{
    return [objc_getAssociatedObject(self, wh_eventIntervalKey) doubleValue];
}

- (void)setWh_eventInterval:(NSTimeInterval)wh_eventInterval
{
    objc_setAssociatedObject(self, wh_eventIntervalKey, @(wh_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)eventUnavailable
{
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable
{
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
