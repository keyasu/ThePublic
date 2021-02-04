//
//  BaseTabBarController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBar.h"

#import "XHHomeViewController.h"
#import "XHFindViewController.h"
#import "XHMessageViewController.h"
#import "XHMeViewController.h"


@interface BaseTabBarController ()
<
    UITabBarControllerDelegate,
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate,
    UIActionSheetDelegate
>

/// 自定义 tabbar
@property (nonatomic, strong) BaseTabBar *customeTabBar;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.delegate = self;
    
    // 控制底部按钮
    [self setupCustomTabBar];
    [self initTabBarItems];
    self.selectedIndex = 0;
    
}

- (void)initTabBarItems
{
    NSArray *titles = [NSArray arrayWithObjects:@"首页", @"动态", @"消息", @"我的", nil];
    NSArray *normalImgs = [NSArray arrayWithObjects:@"TabBar1", @"TabBar2", @"TabBar4", @"TabBar5", nil];
    NSArray *selecedImgs = [NSArray arrayWithObjects:@"TabBarSel1", @"TabBarSel2", @"TabBarSel4", @"TabBarSel5", nil];
    
    NSArray<UIViewController *> *controllers =
    [NSArray arrayWithObjects:
     [[XHHomeViewController alloc] init],
     [[XHFindViewController alloc] init],
     [[XHMessageViewController alloc] init],
     [[XHMeViewController alloc] init],
     nil];
        
    for (int i = 0; i < [controllers count]; i++) {
        WEGBaseViewController * vc = [controllers SafeObjectAt:i];
        
        NSString *t = titles[i];
        UIImage *normalImg = [UIImage imageWithName:normalImgs[i]];
        UIImage *selecedImg = [UIImage imageWithName:selecedImgs[i]];
        
        [self addChildViewController:vc withImage:normalImg selectedImage:selecedImg withTittle:t withIndex:i];
        
    }
    
}

- (void)addChildViewController:(UIViewController *)controller
                     withImage:(UIImage *)image
                 selectedImage:(UIImage *)selectImage
                    withTittle:(NSString *)tittle
                     withIndex:(NSInteger)index
{
    //BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:controller];
    UINavigationController * nav = [UINavigationController rootVC:controller transitionScale:NO];
    nav.view.backgroundColor = UIColor.whiteColor;
    
    [nav.tabBarItem setImage:image];
    
    
    UIImage *selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setSelectedImage:selectedImage];
    nav.tabBarItem.title = tittle;
    
    [self addChildViewController:nav];
}

- (void)setupCustomTabBar
{
    //需要自定义的直接打开就行了
    [self setValue:self.customeTabBar forKey:@"tabBar"];
    
    //设置tabbar背景颜色
    [self.customeTabBar.liveViewBtn addTarget:self action:@selector(readyStartLive) forControlEvents:(UIControlEventTouchUpInside)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0xBBBBBB],
                                                        NSFontAttributeName : [UIFont NFontSize:22.0]}
                                             forState:UIControlStateNormal];//TabBarItem未选中时的字体大小
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x00184C],
                                                        NSFontAttributeName : [UIFont NSBFontSize:28]}
                                             forState:UIControlStateSelected];//TabBarItem选中时的字体颜色和大小
    
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSInteger index = tabBarController.selectedIndex;
    //调用方法使tabbar实现抖动效果
    self.customeTabBar.curLocation = index;
        
}

- (BaseTabBar *)customeTabBar {
    if (!_customeTabBar) {
        BaseTabBar * tb = [[BaseTabBar alloc] init];
        [tb setTranslucent:NO];
        tb.tintColor = [UIColor colorWithHex:0x00184C];
        tb.unselectedItemTintColor = [UIColor colorWithHex:0xBBBBBB];
        
        _customeTabBar = tb;
    }
    return _customeTabBar;
}

#pragma mark  直接开播
- (void)readyStartLive
{
    //
}
@end
