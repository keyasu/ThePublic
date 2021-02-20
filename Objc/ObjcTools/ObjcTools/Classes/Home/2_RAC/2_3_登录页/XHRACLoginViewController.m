//
//  XHRACLoginViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACLoginViewController.h"
#import "XHRACLoginView.h"

@interface XHRACLoginViewController ()

/// 登录的UI
@property (nonatomic, strong) XHRACLoginView *loginView;

@end

@implementation XHRACLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    [self.view addSubview:self.loginView];
    
}

- (XHRACLoginView *)loginView {
    if (!_loginView) {
        CGRect rect = CGRectMake(0, kNavigationBarHeight, kScreenW, kNewHeight(700));
        XHRACLoginView * v = [[XHRACLoginView alloc] initWithFrame:rect];
        
        _loginView = v;
    }
    return _loginView;
}

@end
