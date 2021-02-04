//
//  WEGExcessiveViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGExcessiveViewController.h"

@interface WEGExcessiveViewController ()

@end

@implementation WEGExcessiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
 
    [self toDefaultVC];
    
    
}

//MARK: 跳转到默认控制器
- (void)toDefaultVC
{
    [[XHProtocolResolver shareInstace] toDefaultTaBbarController];
}


@end
