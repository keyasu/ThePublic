//
//  XHOtherActionViewViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHOtherActionViewViewController.h"

/*
 
 使用 runtime 为 UIView 添加一个点击手势,使得所有的继承 UIView 的控件轻松添加点击效果
 使用方法 导入头文件,并在需要添加的 View 上调用这个方法
 [self.textFiled dg_Tapped:^{
     NSLog(@"点击了textFiled");
 }];
 
 */
@interface XHOtherActionViewViewController ()
///
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UITextField *textFiled;

@property (nonatomic, strong) UIView *redView;

@end

@implementation XHOtherActionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    
    self.imgView = [UIImageView viewWithImageName:@"lock_normal"];

    self.label = [UILabel labelWithTitle:@"我是label" FontSize:36 Color:UIColor.hex_00184C BackgroundColor:UIColor.hex_999999];

    self.textFiled = [UITextField textFieldWithPlaceholder:@"输入内容"];
    self.textFiled.backgroundColor = UIColor.hex_999999;

    self.redView = [UIView viewBgColor:UIColor.redColor];
    
    [self.view weg_addSubviews:
     self.imgView,
     self.label,
     self.textFiled,
     self.redView
     , nil];
    
    self.imgView.frame = CGRectMake(10, 100, 300, 100);
    self.label.frame = CGRectMake(10, self.imgView.bottom + 30, 300, 100);
    self.textFiled.frame = CGRectMake(10, self.label.bottom + 30, 300, 100);
    self.redView.frame = CGRectMake(10, self.textFiled.bottom + 30, 300, 100);
    
    self.imgView.userInteractionEnabled=YES;
    [self.imgView xh_Tapped:^{
        NSLog(@"点击了图片");
    }];
    
    self.label.userInteractionEnabled=YES;

    [self.label xh_Tapped:^{
        NSLog(@"点击了label");
    }];
    
    [self.textFiled xh_Tapped:^{
        NSLog(@"点击了textFiled");
    }];
    
    [self.redView xh_Tapped:^{
        NSLog(@"点击了图片");
    }];
}

@end
