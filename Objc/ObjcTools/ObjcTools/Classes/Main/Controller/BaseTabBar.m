//
//  BaseTabBar.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()

/// 动画小蓝点
@property (nonatomic, strong) UIImageView *iconAniView;

/// iphonex 的 view
@property (nonatomic, strong) UIView *iphoneXBgView;

@end

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self setShadowImage:[UIImage new]];
    [self setBackgroundImage:[UIImage new]];
    
    //设置tabbar背景颜色
    self.backgroundColor = UIColor.clearColor;
    //添加整个的背景 - 不规则的
    UIImageView * bgImg = [UIImageView viewWithImageName:@"Tabbar_bg"];
    bgImg.backgroundColor = UIColor.clearColor;
    [self addSubview:bgImg];
    
    bgImg.frame = CGRectMake(0, -kNewHeight(20), kNewWidth(750), kNewHeight(118));
        
    //提示小蓝点
    [self addSubview:self.iconAniView];
    
    
    [self addSubViewWithIphoneX];
        
}
- (void)setCurLocation:(NSInteger)curLocation {
    _curLocation = curLocation;
    
    
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat tabBarButtonW = self.frame.size.width / 5;
    CGFloat tabBarButtonH = 49 ;
    NSInteger idx = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if ([NSStringFromClass(tabBarButton.class) isEqualToString:@"_UIBarBackground"]) {
            tabBarButton.backgroundColor = UIColor.clearColor;
            for (UIImageView * imgView in tabBarButton.subviews) {
                if ([imgView isKindOfClass:[UIImageView class]]) {
                    imgView.backgroundColor = UIColor.clearColor;
                    
                }
            }
            continue;
        }
        if (![NSStringFromClass(tabBarButton.class) isEqualToString:@"UITabBarButton"]) continue;
        
        for (UIView * label in tabBarButton.subviews) {
            //选中字体为粗体, 没选中的为细体
            if ([NSStringFromClass(label.class) isEqualToString:@"UITabBarButtonLabel"]) {
                UILabel * getL = (UILabel *)label;
                getL.font = (idx == self.curLocation) ? [UIFont NSBFontSize:22] : [UIFont NFontSize:22];
            }
        }
        
        if (idx == 2) {
            self.liveViewBtn.frame = CGRectMake(tabBarButtonW * idx,
                                                49-kNewHeight(90+18+(isIphoneX ? 15:4)),
                                                kNewWidth(100),
                                                kNewHeight(100));
            self.liveViewBtn.centerX = self.centerX;
            idx += 1;
        }
        tabBarButton.frame = CGRectMake(tabBarButtonW * idx, 0, tabBarButtonW, tabBarButtonH);
        
        [self bringSubviewToFront:self.liveViewBtn];
        if ((idx == 0 || idx == 1) && (idx == self.curLocation)) {
            for (UIView * itmeImg in tabBarButton.subviews) {
                if (![NSStringFromClass(itmeImg.class) isEqualToString:@"UITabBarSwappableImageView"]) continue;

                self.iconAniView.frame = CGRectMake(tabBarButton.left+itmeImg.right+kNewHeight(0)-kNewWidth(isIphoneX ? 6 : 3),
                                                    itmeImg.bottom+kNewHeight(0)-kNewWidth(isIphoneX ? 6 : 3),
                                                    kNewHeight(0), kNewHeight(0));
                [UIView animateWithDuration:0.23 animations:^{
                    self.iconAniView.frame = CGRectMake(tabBarButton.left+itmeImg.right-kNewHeight(28+3-(idx==0?3:0)),
                                                        itmeImg.bottom-kNewHeight(28-(idx==0?1:0)),
                                                        kNewHeight(28-2), kNewHeight(28-2));
                }];

            }
        }
        
        if ((idx == 3 || idx == 4) && (idx == self.curLocation+1)) {
            for (UIView * itmeImg in tabBarButton.subviews) {
                if (![NSStringFromClass(itmeImg.class) isEqualToString:@"UITabBarSwappableImageView"]) continue;
                self.iconAniView.frame = CGRectMake(tabBarButton.left+itmeImg.right-kNewWidth(isIphoneX ? 6 : 3),
                                                    itmeImg.bottom-kNewWidth(isIphoneX ? 6 : 3),
                                                    kNewHeight(0), kNewHeight(0));

                [UIView animateWithDuration:0.23 animations:^{
                    self.iconAniView.frame = CGRectMake(tabBarButton.left+itmeImg.right-kNewHeight(28+3),
                                                        itmeImg.bottom-kNewHeight(28-0),
                                                        kNewHeight(28-2), kNewHeight(28-2));
                }];
            }
        }
        
//        NSLog(@"点击了第几个%ld", (long)self.curLocation);
//        NSLog(@"点击了第几个%ld", (long)idx);
        idx += 1;
    }
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        UIImageView * imgView = self.subviews[0].subviews[0];
        [imgView setHidden:YES];
        
        self.subviews[0].subviews[0].hidden = YES;
//        NSArray * a = self.subviews;
//        NSArray * b = self.subviews[0].subviews;
//        DLog(@"a-->%@, b-->%@", a, b);
        
    }
    
}

- (void)addSubViewWithIphoneX {
    if (isIphoneX) {
        if (!_iphoneXBgView) {
            UIView * v = [UIView viewBgColor:UIColor.hex_FFFFFF];
            
            self.iphoneXBgView = v;
            
            [self addSubview:v];
            
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(self);

                make.height.mas_equalTo(kTabBarHeight-45);
            }];
            
        }else {
            
        }
        
        
    }
    
}

- (UIButton *)liveViewBtn {
    if (!_liveViewBtn) {
        UIButton * btn = [UIButton button];
        [btn setBackgroundImage:[UIImage imageWithName:@"TabBarSel3"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageWithName:@"TabBarSel3"] forState:(UIControlStateSelected)];
        
        [self addSubview:btn];
        
        _liveViewBtn = btn;
    }
    return _liveViewBtn;
}
- (UIImageView *)iconAniView {
    if (!_iconAniView) {
        _iconAniView = [UIImageView viewWithImageName:@"TabBar_animal_tip"];
        
    }
    return _iconAniView;
}


- (void)liveImgAction {}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden) {
        return [super hitTest:point withEvent:event];
    }else {
        CGPoint p = [self convertPoint:point toView:self.liveViewBtn];
        if ([self.liveViewBtn pointInside:p withEvent:event]) {
            return self.liveViewBtn;
        }else {
            return [super hitTest:point withEvent:event];
        }
    }
}




@end
