//
//  UIViewController+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "BaseWebViewController.h"

@implementation UIViewController (Extension)

- (void)pushToController:(UIViewController *)viewController {
    
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)pushToController:(UIViewController *)viewController withTitle:(NSString *)title {
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationItem.title = title;
    [self.navigationController pushViewController:viewController animated:YES];
}
/*
 *  present 到下一个控制器
 */
- (void)presentTo:(UIViewController *)viewController {
    [self presentTo:viewController withAlpha:0.4f];
}
- (void)presentTo:(UIViewController *)viewController withAlpha:(CGFloat)alpha {
    [viewController setDefinesPresentationContext:YES];
    viewController.view.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:alpha];
    [viewController setModalPresentationStyle:(UIModalPresentationOverCurrentContext)];
    [viewController setModalTransitionStyle:(UIModalTransitionStyleCrossDissolve)];
    [self presentViewController:viewController animated:YES completion:^{
        
    }];
}
- (void)presentTo:(UIViewController *)viewController withColor:(UIColor *)color {
    [viewController setDefinesPresentationContext:YES];
    viewController.view.backgroundColor = color;
    [viewController setModalPresentationStyle:(UIModalPresentationOverCurrentContext)];
    [viewController setModalTransitionStyle:(UIModalTransitionStyleCrossDissolve)];
    [self presentViewController:viewController animated:YES completion:^{
        
    }];
}


/*
 *  从当前控制器 pop
 */
- (void)popViewController
{
    [self popViewController:YES];
}
- (void)popViewController:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}
- (void)popToRootController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
 *  当前控制器 dismiss
 */
- (void)dismiss {
        
    [UIView animateWithDuration:0.1 animations:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)toWebViewControllerWith:(NSString *)title
                         URLStr:(NSString *)urlStr
{
    BaseWebViewController * vc = [[BaseWebViewController alloc] init];
    vc.url = urlStr;
    vc.titleStr = title;
    
    [self pushToController:vc];
}
- (void)toWebVCWith:(WebViewLoadType)loadType {
    BaseWebViewController * vc = [[BaseWebViewController alloc] init];
    vc.loadType = loadType;
    
    [self pushToController:vc];
}

- (void)statusStatusBarDefault:(BOOL)isDefault {
//    self.gk_statusBarStyle = isDefault ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
    
}


@end
