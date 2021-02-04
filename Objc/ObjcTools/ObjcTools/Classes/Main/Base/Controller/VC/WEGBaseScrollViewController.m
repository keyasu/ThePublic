//
//  WEGBaseScrollViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseScrollViewController.h"

@interface WEGBaseScrollViewController ()

@end

@implementation WEGBaseScrollViewController

- (void)viewDidLoad {
    self.page = 1;

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// MARK: - 刷新tableview
- (void)reloadTBView {}
/// 停止加载动画
- (void)stopAnimation {}

// MARK: - 请求数据，供具体子类覆盖
/// 请求数据，供具体子类覆盖
- (void)requestList {}
// MARK: - 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
/// 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
- (void)prepareTableView {}

// MARK: - 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
/// 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
- (void)optimizeMethod {}

@end
