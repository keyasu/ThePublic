//
//  XHOtherActionButtonViewViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHOtherActionButtonViewViewController.h"

@interface XHOtherActionButtonViewViewController ()

@end

@implementation XHOtherActionButtonViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    UIButton * btn1 = [[UIButton buttonWithTitle:@"button-增宽2倍" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        NSLog(@"点击了第一个");
    }];
    UIButton * btn2 = [[UIButton buttonWithTitle:@"button-增高2倍" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        NSLog(@"点击了第2个");
    }];
    
    UIButton * btn3 = [[UIButton buttonWithTitle:@"button-放大2倍" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        NSLog(@"点击了第3个");
    }];
    btn1.backgroundColor = UIColor.randomColor;
    btn2.backgroundColor = UIColor.randomColor;
    btn3.backgroundColor = UIColor.randomColor;
    
    [self.view weg_addSubviews:
     btn1,
     btn2,
     btn3
     , nil];
    
    btn1.frame = CGRectMake(20, kNavigationBarHeight+20, kNewWidth(260), kNewHeight(100));
    btn2.frame = CGRectMake(20, btn1.bottom+120, kNewWidth(260), kNewHeight(100));
    btn3.frame = CGRectMake(20, btn2.bottom+120, kNewWidth(260), kNewHeight(100));
    
    btn1.hitWidthScale  = 2;
    btn2.hitHeightScale = 2;
    btn3.hitScale       = 2;
    
}



@end
