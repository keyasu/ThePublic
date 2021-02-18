//
//  WEGBaseViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseViewController.h"

@implementation WEGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultData];
    [self setupUI];
    [self setupNavigationUI];
 
    if (indebug) {
        self.view.backgroundColor = UIColor.hex_FBFDFF;
    }
    
}

- (void)setDefaultData
{
    self.gk_navBarAlpha = 1.0;
    self.gk_navigationBar.backgroundColor = UIColor.hex_FFFFFF;
    self.gk_navTitleColor = UIColor.hex_00184C;
    self.gk_navTitleFont = [UIFont fontWith_DINAlternateFont_Bold_fontSize:36];
    
    if (@available(iOS 11.0, *)) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}

- (void)setupUI {}
- (void)setupNavigationUI {}
- (void)requestList {}


- (void)setNavTitle:(NSString *)navTitle
{
    self.gk_navTitle = navTitle;
}



- (BOOL)prefersStatusBarHidden {
    return self.gk_statusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.gk_statusBarStyle;
}




@end
