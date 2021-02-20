//
//  WEGExcessiveViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGExcessiveViewController.h"

/**
 * 这列作为app的启动页面
 * 在这里可以实现一些其他操作, 比如: 引导页, 广告页, 是否升级, 还有app在审核之前需要隐藏的东西
 *
 */
@interface WEGExcessiveViewController ()

@end

@implementation WEGExcessiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self toDefaultVC];
    
    
}

//MARK: 跳转到默认控制器
- (void)toDefaultVC
{
    [[XHProtocolResolver shareInstace] toDefaultTaBbarController];
}


@end
