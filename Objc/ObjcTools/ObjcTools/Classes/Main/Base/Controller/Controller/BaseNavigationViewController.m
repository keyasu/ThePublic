//
//  BaseNavigationViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - 重载父类进行改写
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //先进入子Controller
    [super pushViewController:viewController animated:animated];
    
    //替换掉leftBarButtonItem
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1) {
        //viewController.navigationItem.leftBarButtonItem = [self customLeftBackButton];
        viewController.gk_navItemLeftSpace = kNewWidth(10);
        viewController.gk_navLeftBarButtonItem = [self customLeftBackButton];
    }
    
}
//
#pragma mark - 自定义返回按钮图片
- (UIBarButtonItem*)customLeftBackButton
{
    UIImage *image = [UIImage imageNamed:@"nav_back"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    //[backButton]
    [backButton setImage:image forState:(UIControlStateNormal)];
    
    [backButton addTarget:self
                   action:@selector(popself)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    return backItem;
}

#pragma mark - 返回按钮事件(pop)
-(void)popself
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - 用图片设置导航背景
+ (void)initialize
{
    //取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];

    //设置导航栏的背景图片
//    NSString *navBarBg = nil;
//    navBarBg = @"nav_back";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [navBar setBackgroundImage:[UIImage imageNamed:navBarBg] forBarMetrics:UIBarMetricsDefault];
//    self.gk_navBarAlpha = 1.0;
//    self.gk_navigationBar.backgroundColor = UIColor.hex_FFFFFF;
//    self.gk_navTitleFont = [UIFont fontWith_DINAlternateFont_Bold_fontSize:36];
    //标题颜色
    NSDictionary * attDic =
    @{
        NSForegroundColorAttributeName : UIColor.hex_00184C,
        NSFontAttributeName : [UIFont fontWith_DINAlternateFont_Bold_fontSize:36]
    };
    [navBar setTitleTextAttributes:attDic];
}


@end
