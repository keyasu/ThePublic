//
//  UIView+Addition.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        if ([child isKindOfClass:[UIImageView class]]) {
            ((UIImageView*)child).image = nil;
        }
        [child removeFromSuperview];
        child = nil;
    }
}

- (void)hideShadow {
    self.layer.shadowColor = [UIColor clearColor].CGColor;
}

- (void)shadowColor:(UIColor*)color shadowOffset:(CGSize)offset shadowRadius:(CGFloat)radius shadowOpacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.layer.bounds].CGPath;
}

- (void)cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color {
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:radius];
    [layer setBorderWidth:width];        // 添加边框宽度
    [layer setBorderColor:color.CGColor];
}

- (void)shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)offset shadowRadius:(CGFloat)sradius shadowOpacity:(CGFloat)opacity
cornerRadius:(CGFloat)cradius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor {
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = sradius;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.layer.bounds].CGPath;
    self.layer.cornerRadius = cradius;
    self.layer.borderWidth = width;
    self.layer.borderColor = borderColor.CGColor;
}


+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(TZOscillatoryAnimationType)type{
    NSNumber *animationScale1 = type == TZOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == TZOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}

/**  圆角 & 阴影 & 描边 --------！！！！！必须先设置好子视图frame！！！！！！------- ！*/
- (void)addShadowAndCornerToViewWithSuperView:(UIView *)superView
                                 cornerRadius:(CGFloat)cornerRadius
                                 shadowRadius:(CGFloat)shadowRadius
                                  shadowColor:(UIColor *)shadowColor
                                 shadowOffset:(CGSize )offset
                                shadowOpacity:(CGFloat)opacity
                                  borderWidth:(CGFloat)borderWidth
                                  borderColor:(UIColor *)borderColor{
    
    
    NSArray<CALayer *> *subLayers = superView.layer.sublayers;
    
    NSArray<CALayer *> *removedLayers = [subLayers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject isKindOfClass:[CAShapeLayer class]];
    }]];
    [removedLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
    //1.给原视图设置圆角
    self.layer.cornerRadius = cornerRadius;
    self.contentMode=UIViewContentModeScaleAspectFill;
    self.clipsToBounds=YES;
    self.layer.borderWidth=borderWidth;
    self.layer.borderColor=borderColor.CGColor;
    
    //2.在父视图上给视图添加阴影
    CAShapeLayer *layer=[[CAShapeLayer alloc]init];
    layer.position=self.layer.position;
    layer.bounds=self.bounds;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius=cornerRadius+1;//+1 纠正非代码切图的偏差,防止layer背景色跑色
    layer.shadowColor=shadowColor.CGColor;
    layer.shadowRadius=shadowRadius;
    layer.shadowOffset=offset;
    layer.shadowOpacity=opacity;
    
    [superView.layer addSublayer:layer];
    [superView bringSubviewToFront:self];
    
    
}

- (void)addShadowAndCornerToViewWithSuperView:(UIView *)superView
                                 cornerRadius:(CGFloat)cornerRadius
                                 shadowRadius:(CGFloat)shadowRadius
                                  shadowColor:(UIColor *)shadowColor
                                 shadowOffset:(CGSize )offset
                                shadowOpacity:(CGFloat)opacity
                                  borderWidth:(CGFloat)borderWidth
                                  borderColor:(UIColor *)borderColor
                                   andCorners:(UIRectCorner)corners {
    
    
    NSArray<CALayer *> *subLayers = superView.layer.sublayers;
    
    NSArray<CALayer *> *removedLayers = [subLayers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject isKindOfClass:[CAShapeLayer class]];
    }]];
    [removedLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
    //    //1.给原视图设置圆角
    //    self.layer.cornerRadius = cornerRadius;
    //    self.contentMode=UIViewContentModeScaleAspectFill;
    //    self.clipsToBounds=YES;
    //    self.layer.borderWidth=borderWidth;
    //    if (borderColor) {
    //        self.layer.borderColor=borderColor.CGColor;
    //    }
    //2.在父视图上给视图添加阴影
    
    CAShapeLayer *layer=[[CAShapeLayer alloc]init];
    layer.position=self.layer.position;
    layer.bounds=self.bounds;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:layer.bounds byRoundingCorners:corners  cornerRadii:CGSizeMake(5, 5)];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    //    layer.cornerRadius=cornerRadius+1;//+1 纠正非代码切图的偏差,防止layer背景色跑色
    layer.path = maskPath.CGPath;
    layer.shadowColor=shadowColor.CGColor;
    layer.shadowRadius=shadowRadius;
    layer.shadowOffset=offset;
    layer.shadowOpacity=opacity;
    
    self.layer.mask = layer;
    [superView bringSubviewToFront:self];
    
}

/** 添加默认圆角和阴影 cornerRadius:5 shadowRadius:5 shaodowColor:grayTextColor opacity:0.2 */
-(void)addDefaultShadowAndCorner {
    [self addShadowAndCornerToViewWithSuperView:self.superview cornerRadius:5 shadowRadius:5 shadowColor:[UIColor grayColor] shadowOffset:(CGSizeZero) shadowOpacity:.2 borderWidth:0 borderColor:nil];
}
-(void)addDefaultShadowAndCorners:(UIRectCorner)corners {
    [self addShadowAndCornerToViewWithSuperView:self.superview cornerRadius:5 shadowRadius:5 shadowColor:[UIColor grayColor] shadowOffset:(CGSizeZero) shadowOpacity:.2 borderWidth:0 borderColor:0 andCorners:corners];
}


@end
