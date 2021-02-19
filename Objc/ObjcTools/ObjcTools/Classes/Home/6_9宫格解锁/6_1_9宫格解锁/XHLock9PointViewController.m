//
//  XHLock9PointViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHLock9PointViewController.h"
#import "XHLock9PointView.h"

@interface XHLock9PointViewController ()

@end

@implementation XHLock9PointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    
    XHLock9PointView *v = [[XHLock9PointView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    v.center = self.view.center;
    [self.view addSubview:v];
    [[v rac_signalForSelector:@selector(lockPathSuccess)] subscribeNext:^(RACTuple * _Nullable x) {
        [self showMsg:@"解锁成功"];
    }];
    
}
- (void)setupNavigationUI {
    self.gk_fullScreenPopDisabled = YES;
}


@end
