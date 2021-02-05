//
//  UIViewController+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

/* 跳转_ push */
- (void)pushToController:(UIViewController *)viewController ;
/* 跳转_ push  带上 title */
- (void)pushToController:(UIViewController *)viewController withTitle:(NSString *)title ;

- (void)presentTo:(UIViewController *)viewController ;
- (void)presentTo:(UIViewController *)viewController withAlpha:(CGFloat)alpha ;
- (void)presentTo:(UIViewController *)viewController withColor:(UIColor *)color;
/* 返回_ pop */
- (void)popViewController ;
- (void)popToRootController;
/* dismiss vc */
- (void)dismiss ;



- (void)toWebViewControllerWith:(NSString *)title
                         URLStr:(NSString *)urlStr ;

- (void)toWebVCWith:(WebViewLoadType)loadType ;

///设置状态栏的颜色  YES黑色字体 NO白色字体
- (void)statusStatusBarDefault:(BOOL)isDefault;

@end

NS_ASSUME_NONNULL_END
