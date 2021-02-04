//
//  UIView+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


+ (instancetype)viewBgColor:(UIColor *)color
{
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = color;
    v.layer.cornerRadius = 0 ;
    v.layer.masksToBounds = YES;
    
    return v;
}

+ (instancetype)viewBgColor:(UIColor *)color
               CornerRadius:(CGFloat)cornerRadius
{
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = color;
    v.layer.cornerRadius = kNewWidth(cornerRadius);
    v.layer.masksToBounds = YES;
    
    return v;
}


- (UIView *)addCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = kNewWidth(cornerRadius);
    self.layer.masksToBounds = YES;
    return self;
}

- (void)setCornerRadiusWithRadius:(CGFloat)cornerRadius withRoundingCorner:(UIRectCorner)rectCorner {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    maskLayer.masksToBounds = NO;
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}

- (void)addBorderWith:(UIColor *)borderColor
          BorderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth =  kNewWidth(borderWidth);
}

+ (void)animateDuration:(NSTimeInterval)duration
                  delay:(NSTimeInterval)delay
             animations:(void (^)(void))animations
             completion:(void (^ __nullable)(BOOL finished))completion {
    
    [self animateWithDuration:duration
                        delay:delay
                      options:(UIViewAnimationOptionCurveEaseOut)
                   animations:animations completion:completion];
    
}

+ (void)animateDuration:(NSTimeInterval)duration
             animations:(void (^)(void))animations{
    
    [self animateWithDuration:duration animations:animations];
    
}

+ (void)animateDuration:(NSTimeInterval)duration
              animations:(void (^)(void))animations
              completion:(void (^ __nullable)(BOOL finished))completion {
    
    [self animateWithDuration:duration animations:animations completion:completion];
    
}

- (UIEdgeInsets)safeArea {
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = [UIApplication sharedApplication].delegate.window.safeAreaInsets;
        if (insets.top == 0) {
            return UIEdgeInsetsMake(0, 0, 0, 0);
        }
        return insets;
    }
    // Fallback on earlier versions
    //非x类型的机器，为了计算方便已statusbar为safearea
    return UIEdgeInsetsMake(kStatusBarHeight, 0, 0, 0);
}


- (void)tintingColor:(NSArray *)colors
          StartPoint:(CGPoint)startPoint
            EndPoint:(CGPoint)endPoint
           Locations:(NSArray<NSNumber *> *)locations
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    

    gradientLayer.colors = colors;
    // @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = locations;
    // @[@0.0, @0.1, @1.0];
    gradientLayer.startPoint = startPoint;
    //CGPointMake(0, 0);
    gradientLayer.endPoint = endPoint;
    //CGPointMake(1.0, 0);
    
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}


/// t添加过度的颜色
- (void)tintingColor:(NSArray *)colors {
    
    [self tintingColor:colors
            StartPoint:(CGPointMake(0, 0))
              EndPoint:(CGPointMake(1.0, 0))
             Locations:@[@0.0, @1.0]];
    
}



- (void)weg_addSubviewsWith:(NSArray *)subviews
{
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [self addSubview:view];
        }
    }];
}

- (void)weg_addSubviews:(UIView *)subView, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list params;  //定义一个指向个数可变的参数列表指针；
    id argument;
    if (subView) {
        [self addSubview:subView];
        //使参数列表指针arg_ptr指向函数参数列表中的第一个可选参数，说明：argN是位于第一个可选参数之前的固定参数，（或者说，最后一个 固定参数；…之前的一个参数），函数参数列表中参数在内存中的顺序与函数声明时的顺序是一致的。如果有一va函数的声明是void va_test(char a, char b, char c, …)，则它的固定参数依次是a,b,c，最后一个固定参数argN为c，因此就是va_start(arg_ptr, c)。
        va_start(params, subView);
        while ((argument = va_arg(params, id))) {//返回参数列表中指针arg_ptr所指的参数，返回类型为type，并使指针arg_ptr指向参数列表中下一个参数
            //[arr addObject:argument];
            [self addSubview:argument];
        }
        va_end(params);//释放列表指针
    }
    
}

- (void)animationScaleFrom:(CGFloat)fromScale ToScale:(CGFloat)toScale
{
    [self animationScaleFrom:fromScale ToScale:toScale RepeatCount:MAXFLOAT];
}
- (void)animationScaleFrom:(CGFloat)fromScale ToScale:(CGFloat)toScale RepeatCount:(float)repeatCount
{
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction   = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration         = 0.6;
    pulse.repeatCount      = repeatCount;
    pulse.autoreverses     = YES;
    pulse.fromValue        = [NSNumber numberWithFloat:fromScale];
    pulse.toValue          = [NSNumber numberWithFloat:toScale];
    
    
    [self.layer addAnimation:pulse forKey:nil];
}



@end
